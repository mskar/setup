"""
Configuration example for ``ptpython``.

Copy this file to $XDG_CONFIG_HOME/ptpython/config.py
"""
from __future__ import unicode_literals

import sys

from prompt_toolkit.application.current import get_app
from prompt_toolkit.key_binding.vi_state import InputMode, ViState
from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.key_processor import KeyPress
from prompt_toolkit.styles import Style
from prompt_toolkit.key_binding.bindings import named_commands as nc


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
    repl.show_docstring = False

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
    repl.highlight_matching_parenthesis = True

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
    repl.enable_auto_suggest = False

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

    @repl.add_key_binding("c-a")
    def _(event):
        nc.beginning_of_line(event)

    @repl.add_key_binding("c-b")
    def _(event):
        nc.backward_char(event)

    ## ControlD already works

    @repl.add_key_binding("c-e")
    def _(event):
        nc.end_of_line(event)

    @repl.add_key_binding("c-f")
    def _(event):
        nc.forward_char(event)

    ## ControlH already works

    @repl.add_key_binding("c-k")
    def _(event):
        nc.kill_line(event)

    ## ControlR, ControlT, and ControlU already work
    ## ControlW: use backward_kill_word instead of unix_word_rubout
    @repl.add_key_binding("c-w")
    def _(event):
        nc.backward_kill_word(event)

    @repl.add_key_binding("c-y")
    def _(event):
        nc.yank(event)

    @repl.add_key_binding("c-_")
    def _(event):
        nc.undo(event)

    @repl.add_key_binding("c-x", "c-e")
    def _(event):
        nc.edit_and_execute(event)

    @repl.add_key_binding("c-x", "e")
    def _(event):
        nc.edit_and_execute(event)

    @repl.add_key_binding("escape", "b")
    def _(event):
        nc.backward_word(event)

    @repl.add_key_binding("escape", "c")
    def _(event):
        nc.capitalize_word(event)

    @repl.add_key_binding("escape", "d")
    def _(event):
        nc.kill_word(event)

    @repl.add_key_binding("escape", "f")
    def _(event):
        nc.forward_word(event)

    @repl.add_key_binding("escape", "h")
    def _(event):
        nc.backward_kill_word(event)

    @repl.add_key_binding("escape", "l")
    def _(event):
        nc.downcase_word(event)

    @repl.add_key_binding("escape", "u")
    def _(event):
        nc.uppercase_word(event)

    @repl.add_key_binding("escape", "y")
    def _(event):
        nc.yank_pop(event)

    @repl.add_key_binding("escape", ".")
    def _(event):
        nc.yank_last_arg(event)

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
        app.timeoutlen = 0.2

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
