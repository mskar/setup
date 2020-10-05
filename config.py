"""
Configuration example for ``ptpython``.

Copy this file to $XDG_CONFIG_HOME/ptpython/config.py
"""
from __future__ import unicode_literals

import sys
import re

from jedi import Interpreter
from prompt_toolkit.application.current import get_app
from prompt_toolkit.key_binding.vi_state import InputMode, ViState
from prompt_toolkit.key_binding.bindings import named_commands as nc
from prompt_toolkit import filters
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.completion import CompleteEvent
from ptpython.layout import CompletionVisualisation

__all__ = ("configure",)


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
    """
    # Show function signature (bool).
    repl.show_signature = True

    # Show docstring (bool).
    repl.show_docstring = True

    # Show the "[Meta+Enter] Execute" message when pressing [Enter] only
    # inserts a newline instead of executing the code.
    repl.show_meta_enter_message = True

    # Show completions. (NONE, POP_UP, MULTI_COLUMN or TOOLBAR)
    repl.completion_visualisation = CompletionVisualisation.POP_UP

    # When CompletionVisualisation.POP_UP has been chosen, use this
    # scroll_offset in the completion menu.
    repl.completion_menu_scroll_offset = 0

    # Show line numbers (when the input contains multiple lines.)
    repl.show_line_numbers = False

    # Show status bar.
    repl.show_status_bar = False

    # When the sidebar is visible, also show the help text.
    repl.show_sidebar_help = True

    # Swap light/dark colors on or off
    repl.swap_light_and_dark = False

    # Highlight matching parethesis.
    repl.highlight_matching_parenthesis = False

    # Line wrapping. (Instead of horizontal scrolling.)
    repl.wrap_lines = True

    # Mouse support.
    repl.enable_mouse_support = True

    # Complete while typing. (Don't require tab before the
    # completion menu is shown.)
    repl.complete_while_typing = True

    # Fuzzy and dictionary completion.
    repl.enable_fuzzy_completion = False
    repl.enable_dictionary_completion = False

    # Vi mode.
    repl.vi_mode = True

    # Paste mode. (When True, don't insert whitespace after new line.)
    repl.paste_mode = False

    # Use the classic prompt. (Display '>>>' instead of 'In [1]'.)
    repl.prompt_style = "ipython"  # 'classic' or 'ipython'

    # Don't insert a blank line after the output.
    repl.insert_blank_line_after_output = False

    # History Search.
    # When True, going back in history will filter the history on the records
    # starting with the current input. (Like readline.)
    # Note: When enable, please disable the `complete_while_typing` option.
    #       otherwise, when there is a completion available, the arrows will
    #       browse through the available completions instead of the history.
    repl.enable_history_search = False

    # Enable auto suggestions. (Pressing right arrow will complete the input,
    # based on the history.)
    repl.enable_auto_suggest = True

    # Enable open-in-editor. Pressing C-x C-e in emacs mode or 'v' in
    # Vi navigation mode will open the input in the current editor.
    repl.enable_open_in_editor = True

    # Enable system prompt. Pressing meta-! will display the system prompt.
    # Also enables Control-Z suspend.
    repl.enable_system_bindings = True

    # Ask for confirmation on exit.
    repl.confirm_exit = False

    # Enable input validation. (Don't try to execute when the input contains
    # syntax errors.)
    repl.enable_input_validation = True

    # Use this colorscheme for the code.
    repl.use_code_colorscheme("pastie")

    # Set color depth (keep in mind that not all terminals support true color).

    # repl.color_depth = 'DEPTH_1_BIT'  # Monochrome.
    # repl.color_depth = 'DEPTH_4_BIT'  # ANSI colors only.
    repl.color_depth = "DEPTH_8_BIT"  # The default, 256 colors.
    # repl.color_depth = 'DEPTH_24_BIT'  # True color.

    # Syntax.
    repl.enable_syntax_highlighting = True

    # Get into Vi navigation mode at startup
    repl.vi_start_in_navigation_mode = False

    # Preserve last used Vi input mode between main loop iterations
    repl.vi_keep_last_used_mode = False

    # Install custom colorscheme named 'my-colorscheme' and use it.
    """
    repl.install_ui_colorscheme('my-colorscheme', Style.from_dict(_custom_ui_colorscheme))
    repl.use_ui_colorscheme('my-colorscheme')
    """

    focused_insert = filters.has_focus(DEFAULT_BUFFER) & filters.vi_insert_mode
    focused_insert_and_completion = focused_insert & filters.has_completions

    @repl.add_key_binding("c-a", filter=focused_insert)
    def _(event):
        nc.beginning_of_line(event)

    @repl.add_key_binding("c-b", filter=focused_insert)
    def _(event):
        nc.backward_char(event)

    ## ControlD already works

    @repl.add_key_binding("c-e", filter=focused_insert)
    def _(event):
        b = event.current_buffer
        suggestion = b.suggestion
        if suggestion:
            b.insert_text(suggestion.text)
        else:
            nc.end_of_line(event)

    @repl.add_key_binding("c-f", filter=focused_insert)
    def _(event):
        b = event.current_buffer
        suggestion = b.suggestion
        if suggestion:
            b.insert_text(suggestion.text)
        else:
            nc.forward_char(event)

    ## ControlH already works

    @repl.add_key_binding("c-k", filter=focused_insert)
    def _(event):
        nc.kill_line(event)

    ## ControlR, ControlT, and ControlU already work
    ## ControlW: use backward_kill_word instead of unix_word_rubout
    @repl.add_key_binding("c-w", filter=focused_insert)
    def _(event):
        nc.backward_kill_word(event)

    @repl.add_key_binding("c-y", filter=focused_insert)
    def _(event):
        nc.yank(event)

    @repl.add_key_binding("c-_", filter=focused_insert)
    def _(event):
        nc.undo(event)

    @repl.add_key_binding("c-x", "c-e", filter=focused_insert)
    def _(event):
        nc.edit_and_execute(event)

    @repl.add_key_binding("c-x", "e", filter=focused_insert)
    def _(event):
        nc.edit_and_execute(event)

    @repl.add_key_binding("escape", "b", filter=focused_insert)
    def _(event):
        nc.backward_word(event)

    @repl.add_key_binding("escape", "c", filter=focused_insert)
    def _(event):
        nc.capitalize_word(event)

    @repl.add_key_binding("escape", "d", filter=focused_insert)
    def _(event):
        nc.kill_word(event)

    @repl.add_key_binding("escape", "f", filter=focused_insert)
    def _(event):
        b = event.current_buffer
        suggestion = b.suggestion
        if suggestion:
            t = re.split(r"(\S+\s+)", suggestion.text)
            b.insert_text(next((x for x in t if x), ""))
        else:
            nc.forward_word(event)

    @repl.add_key_binding("escape", "h", filter=focused_insert)
    def _(event):
        nc.backward_kill_word(event)

    @repl.add_key_binding("escape", "l", filter=focused_insert)
    def _(event):
        nc.downcase_word(event)

    @repl.add_key_binding("escape", "u", filter=focused_insert)
    def _(event):
        nc.uppercase_word(event)

    @repl.add_key_binding("escape", "y", filter=focused_insert)
    def _(event):
        nc.yank_pop(event)

    @repl.add_key_binding("escape", ".", filter=focused_insert)
    def _(event):
        nc.yank_last_arg(event)

# Make completion work like in RStudio, VSCode, PyCharm, etc.
# Changed: when triggering completion with tab,
# insert text that all options have in common
# Changed: use Tab to accept only option or accept selected
# Unchanged: use Enter to accept if completion menu is showing
# Changed: do not move through options with not tab and shift-tab
# Unchanged: move through options with c-n and c-p
# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/key_binding/bindings/completion.py

    def is_callable(text=""):
        completions = Interpreter(text, [locals()]).complete()
        match = next((i for i in completions if i.name == text), None)
        return match.type in ("class", "function") if match else None

    # apply selected completion
    @repl.add_key_binding('c-j', filter=focused_insert & filters.completion_is_selected)
    @repl.add_key_binding("enter", filter=focused_insert & filters.completion_is_selected)
    def _(event):
        b = event.current_buffer
        completion = b.complete_state.current_completion
        if is_callable(completion.text):
            b.insert_text("()")
            b.cursor_left()
        b.complete_state = None

    # apply first completion option when completion menu is showing
    @repl.add_key_binding('c-j', filter=focused_insert & filters.has_completions & ~filters.completion_is_selected)
    @repl.add_key_binding("enter", filter=focused_insert & filters.has_completions & ~filters.completion_is_selected)
    def _(event):
        b = event.current_buffer
        b.complete_next()
        completion = b.complete_state.current_completion
        b.apply_completion(completion)
        if is_callable(completion.text):
            b.insert_text("()")
            b.cursor_left()

    # apply completion if there is only one option, otherwise start completion
    @repl.add_key_binding("tab", filter=focused_insert & ~filters.has_completions)
    @repl.add_key_binding("c-space", filter=focused_insert & ~filters.has_completions)
    def _(event):
        b = event.current_buffer
        complete_event = CompleteEvent(completion_requested=True)
        completions = b.completer.get_completions(b.document, complete_event)
        if len(completions) == 1:
            completion = completions[0]
            b.apply_completion(completion)
            if is_callable(completion.text):
                b.insert_text("()")
                b.cursor_left()
        else:
            b.start_completion(insert_common_part=True)

    # apply first completion option if completion menu is showing
    @repl.add_key_binding("tab", filter=focused_insert & filters.has_completions & ~filters.completion_is_selected)
    @repl.add_key_binding("c-space", filter=focused_insert & filters.has_completions & ~filters.completion_is_selected)
    def _(event):
        b = event.current_buffer
        b.complete_next()
        completion = b.complete_state.current_completion
        b.apply_completion(completion)
        if is_callable(completion.text):
            b.insert_text("()")
            b.cursor_left()

    # apply selected completion option
    @repl.add_key_binding("tab", filter=focused_insert & filters.completion_is_selected)
    @repl.add_key_binding("c-space", filter=focused_insert & filters.completion_is_selected)
    def _(event):
        b = event.current_buffer
        completion = b.complete_state.current_completion
        b.apply_completion(completion)
        if is_callable(completion.text):
            b.insert_text("()")
            b.cursor_left()

# Add filters from radian
# https://github.com/randy3k/radian/blob/455e29d443d615ee80a681a29583a7e24769687b/radian/key_bindings.py#L171

    _preceding_text_cache = {}
    _following_text_cache = {}


    def preceding_text(pattern):
        try:
            return _preceding_text_cache[pattern]
        except KeyError:
            pass
        m = re.compile(pattern)

        def _preceding_text():
            app = get_app()
            return bool(m.match(app.current_buffer.document.current_line_before_cursor))

        condition = filters.Condition(_preceding_text)
        _preceding_text_cache[pattern] = condition
        return condition


    def following_text(pattern):
        try:
            return _following_text_cache[pattern]
        except KeyError:
            pass
        m = re.compile(pattern)

        def _following_text():
            app = get_app()
            return bool(m.match(app.current_buffer.document.current_line_after_cursor))

        condition = filters.Condition(_following_text)
        _following_text_cache[pattern] = condition
        return condition


    # auto match
    @repl.add_key_binding('(', filter=focused_insert & following_text(r"[,)}\]]|$"))
    def _(event):
        event.current_buffer.insert_text("()")
        event.current_buffer.cursor_left()

    @repl.add_key_binding('[', filter=focused_insert & following_text(r"[,)}\]]|$"))
    def _(event):
        event.current_buffer.insert_text("[]")
        event.current_buffer.cursor_left()

    @repl.add_key_binding('{', filter=focused_insert & following_text(r"[,)}\]]|$"))
    def _(event):
        event.current_buffer.insert_text("{}")
        event.current_buffer.cursor_left()

    @repl.add_key_binding('"', filter=focused_insert & following_text(r"[,)}\]]|$"))
    def _(event):
        event.current_buffer.insert_text('""')
        event.current_buffer.cursor_left()

    @repl.add_key_binding("'", filter=focused_insert & following_text(r"[,)}\]]|$"))
    def _(event):
        event.current_buffer.insert_text("''")
        event.current_buffer.cursor_left()

    # raw string
    @repl.add_key_binding('(', filter=focused_insert & preceding_text(r".*(r|R)[\"'](-*)$"))
    def _(event):
        matches = re.match(r".*(r|R)[\"'](-*)", event.current_buffer.document.current_line_before_cursor)
        dashes = matches.group(2) or ""
        event.current_buffer.insert_text("()" + dashes)
        event.current_buffer.cursor_left(len(dashes) + 1)

    @repl.add_key_binding('[', filter=focused_insert & preceding_text(r".*(r|R)[\"'](-*)$"))
    def _(event):
        matches = re.match(r".*(r|R)[\"'](-*)", event.current_buffer.document.current_line_before_cursor)
        dashes = matches.group(2) or ""
        event.current_buffer.insert_text("[]" + dashes)
        event.current_buffer.cursor_left(len(dashes) + 1)

    @repl.add_key_binding('{', filter=focused_insert & preceding_text(r".*(r|R)[\"'](-*)$"))
    def _(event):
        matches = re.match(r".*(r|R)[\"'](-*)", event.current_buffer.document.current_line_before_cursor)
        dashes = matches.group(2) or ""
        event.current_buffer.insert_text("{}" + dashes)
        event.current_buffer.cursor_left(len(dashes) + 1)

    @repl.add_key_binding('"', filter=focused_insert & preceding_text(r".*(r|R)$"))
    def _(event):
        event.current_buffer.insert_text('""')
        event.current_buffer.cursor_left()

    @repl.add_key_binding("'", filter=focused_insert & preceding_text(r".*(r|R)$"))
    def _(event):
        event.current_buffer.insert_text("''")
        event.current_buffer.cursor_left()

    # just move cursor
    @repl.add_key_binding(')', filter=focused_insert & following_text(r"^\)"))
    @repl.add_key_binding(']', filter=focused_insert & following_text(r"^\]"))
    @repl.add_key_binding('}', filter=focused_insert & following_text(r"^\}"))
    @repl.add_key_binding('"', filter=focused_insert & following_text("^\""))
    @repl.add_key_binding("'", filter=focused_insert & following_text("^'"))
    def _(event):
        event.current_buffer.cursor_right()

    @repl.add_key_binding('backspace', filter=focused_insert & preceding_text(r".*\($") & following_text(r"^\)"))
    @repl.add_key_binding('backspace', filter=focused_insert & preceding_text(r".*\[$") & following_text(r"^\]"))
    @repl.add_key_binding('backspace', filter=focused_insert & preceding_text(r".*\{$") & following_text(r"^\}"))
    @repl.add_key_binding('backspace', filter=focused_insert & preceding_text('.*"$') & following_text('^"'))
    @repl.add_key_binding('backspace', filter=focused_insert & preceding_text(r".*'$") & following_text(r"^'"))
    def _(event):
        event.current_buffer.delete()
        event.current_buffer.delete_before_cursor()


    # Add a custom title to the status bar. This is useful when ptpython is
    # embedded in other applications.
    """
    repl.title = "My custom prompt."
    """


# Custom colorscheme for the UI. See `ptpython/layout.py` and
# `ptpython/style.py` for all possible tokens.
_custom_ui_colorscheme = {
    # Blue prompt.
    "prompt": "bg:#eeeeff #000000 bold",
    # Make the status toolbar red.
    "status-toolbar": "bg:#ff0000 #000000",
}


def get_input_mode(self):
    if sys.version_info[0] == 3:
        # Decrease input flush timeout from 500ms to 10ms.
        app = get_app()
        app.ttimeoutlen = 0.01
        # Decrease repl.add_key_binding call timeout from 1s to 400ms
        app.timeoutlen = 0.4

    return self._input_mode


def set_input_mode(self, mode):
    shape = {InputMode.NAVIGATION: 2, InputMode.REPLACE: 4}.get(mode, 6)
    cursor = "\x1b[{} q".format(shape)

    if hasattr(sys.stdout, "_cli"):
        write = sys.stdout._cli.output.write_raw
    else:
        write = sys.stdout.write

    write(cursor)
    sys.stdout.flush()

    self._input_mode = mode

ViState._input_mode = InputMode.INSERT
ViState.input_mode = property(get_input_mode, set_input_mode)
