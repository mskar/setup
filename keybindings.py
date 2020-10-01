# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/keys.py
# https://ipython.readthedocs.io/en/latest/config/details.html#keyboard-shortcuts
# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/key_binding/bindings/named_commands.py

import re

from IPython import get_ipython
from prompt_toolkit import filters
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.completion import CompleteEvent
from prompt_toolkit.application.current import get_app
from prompt_toolkit.key_binding.bindings import named_commands as nc

ip = get_ipython()
registry = ip.pt_app.key_bindings
handle = registry.add
focused_insert = filters.has_focus(DEFAULT_BUFFER) & filters.vi_insert_mode
focused_insert_and_completion = focused_insert & filters.has_completions

key_cmd_dict = {
    "c-a": nc.beginning_of_line,
    "c-b": nc.backward_char,
    ## ControlD already works
    ## ControlE and F are below
    ## ControlH already works
    "c-k": nc.kill_line,
    ## ControlR, ControlT, and ControlU already work
    ## ControlW: use backward_kill_word instead of unix_word_rubout
    "c-w": nc.backward_kill_word,
    "c-y": nc.yank,
    "c-_": nc.undo,
}

for key, cmd in key_cmd_dict.items():
    registry.add_binding(key, filter=focused_insert)(cmd)


keys_cmd_dict = {
    # Control
    ("c-x", "c-e"): nc.edit_and_execute,
    ("c-x", "e"): nc.edit_and_execute,
    # Alt
    ("escape", "b"): nc.backward_word,
    ("escape", "c"): nc.capitalize_word,
    ("escape", "d"): nc.kill_word,
    ## AltF is below
    ("escape", "h"): nc.backward_kill_word,
    ("escape", "l"): nc.downcase_word,
    ("escape", "u"): nc.uppercase_word,
    ("escape", "y"): nc.yank_pop,
    ("escape", "."): nc.yank_last_arg,
}

for keys, cmd in keys_cmd_dict.items():
    registry.add_binding(*keys, filter=focused_insert)(cmd)


@handle("c-e", filter=focused_insert)
def _(event):
    b = event.current_buffer
    suggestion = b.suggestion
    if suggestion:
        b.insert_text(suggestion.text)
    else:
        nc.end_of_line(event)

@handle("c-f", filter=focused_insert)
def _(event):
    b = event.current_buffer
    suggestion = b.suggestion
    if suggestion:
        b.insert_text(suggestion.text)
    else:
        nc.forward_char(event)

@handle("escape", "f", filter=focused_insert)
def _(event):
    b = event.current_buffer
    suggestion = b.suggestion
    if suggestion:
        t = re.split(r"(\S+\s+)", suggestion.text)
        b.insert_text(next((x for x in t if x), ""))
    else:
        nc.forward_word(event)


# Make completion work like in RStudio, VSCode, PyCharm, etc.
# Changed: when triggering completion with tab,
# insert text that all options have in common
# Changed: use Tab to accept only option or accept selected
# Unchanged: use Enter to accept if completion menu is showing
# Changed: do not move through options with not tab and shift-tab
# Unchanged: move through options with c-n and c-p
# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/key_binding/bindings/completion.py

@handle("tab", filter=focused_insert)
def _(event):
    b = event.current_buffer
    if b.completer is None:
        return
    complete_event = CompleteEvent(completion_requested=True)
    completions = list(b.completer.get_completions(b.document, complete_event))
    if len(completions) == 1: # only one possible completion
        if completions[0].start_position is not None:
            b.delete_before_cursor(-completions[0].start_position)
        b.insert_text(completions[0].text)
    elif not b.complete_state: # no completion menu
        b.start_completion(insert_common_part=True)
    elif b.complete_state.current_completion: # completion menu and selection
        b.apply_completion(b.complete_state.current_completion)
    else: # completion menu, but no selection
        b.complete_next()
        b.apply_completion(b.complete_state.current_completion)

@handle("c-space", filter=focused_insert)
def _(event):
    b = event.current_buffer
    if b.completer is None:
        return
    complete_event = CompleteEvent(completion_requested=True)
    completions = list(b.completer.get_completions(b.document, complete_event))
    if len(completions) == 1: # only one possible completion
        if completions[0].start_position is not None:
            b.delete_before_cursor(-completions[0].start_position)
        b.insert_text(completions[0].text)
    elif not b.complete_state: # no completion menu
        b.start_completion(insert_common_part=True)
    elif b.complete_state.current_completion: # completion menu and selection
        b.apply_completion(b.complete_state.current_completion)
    else: # completion menu, but no selection
        b.complete_next()
        b.apply_completion(b.complete_state.current_completion)

@handle("enter", filter=focused_insert)
def _(event):
    b = event.current_buffer
    if b.complete_state: # make sure completion menu is showing
        if b.complete_state.current_completion:
            b.apply_completion(b.complete_state.current_completion)
        else: # completion menu, but no selection
            b.complete_next()
            b.apply_completion(b.complete_state.current_completion)

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
@handle('(', filter=focused_insert & following_text(r"[,)}\]]|$"))
def _(event):
    event.current_buffer.insert_text("()")
    event.current_buffer.cursor_left()

@handle('[', filter=focused_insert & following_text(r"[,)}\]]|$"))
def _(event):
    event.current_buffer.insert_text("[]")
    event.current_buffer.cursor_left()

@handle('{', filter=focused_insert & following_text(r"[,)}\]]|$"))
def _(event):
    event.current_buffer.insert_text("{}")
    event.current_buffer.cursor_left()

@handle('"', filter=focused_insert & following_text(r"[,)}\]]|$"))
def _(event):
    event.current_buffer.insert_text('""')
    event.current_buffer.cursor_left()

@handle("'", filter=focused_insert & following_text(r"[,)}\]]|$"))
def _(event):
    event.current_buffer.insert_text("''")
    event.current_buffer.cursor_left()

# raw string
@handle('(', filter=focused_insert & preceding_text(r".*(r|R)[\"'](-*)$"))
def _(event):
    matches = re.match(r".*(r|R)[\"'](-*)", event.current_buffer.document.current_line_before_cursor)
    dashes = matches.group(2) or ""
    event.current_buffer.insert_text("()" + dashes)
    event.current_buffer.cursor_left(len(dashes) + 1)

@handle('[', filter=focused_insert & preceding_text(r".*(r|R)[\"'](-*)$"))
def _(event):
    matches = re.match(r".*(r|R)[\"'](-*)", event.current_buffer.document.current_line_before_cursor)
    dashes = matches.group(2) or ""
    event.current_buffer.insert_text("[]" + dashes)
    event.current_buffer.cursor_left(len(dashes) + 1)

@handle('{', filter=focused_insert & preceding_text(r".*(r|R)[\"'](-*)$"))
def _(event):
    matches = re.match(r".*(r|R)[\"'](-*)", event.current_buffer.document.current_line_before_cursor)
    dashes = matches.group(2) or ""
    event.current_buffer.insert_text("{}" + dashes)
    event.current_buffer.cursor_left(len(dashes) + 1)

@handle('"', filter=focused_insert & preceding_text(r".*(r|R)$"))
def _(event):
    event.current_buffer.insert_text('""')
    event.current_buffer.cursor_left()

@handle("'", filter=focused_insert & preceding_text(r".*(r|R)$"))
def _(event):
    event.current_buffer.insert_text("''")
    event.current_buffer.cursor_left()

# just move cursor
@handle(')', filter=focused_insert & following_text(r"^\)"))
@handle(']', filter=focused_insert & following_text(r"^\]"))
@handle('}', filter=focused_insert & following_text(r"^\}"))
@handle('"', filter=focused_insert & following_text("^\""))
@handle("'", filter=focused_insert & following_text("^'"))
def _(event):
    event.current_buffer.cursor_right()

@handle('backspace', filter=focused_insert & preceding_text(r".*\($") & following_text(r"^\)"))
@handle('backspace', filter=focused_insert & preceding_text(r".*\[$") & following_text(r"^\]"))
@handle('backspace', filter=focused_insert & preceding_text(r".*\{$") & following_text(r"^\}"))
@handle('backspace', filter=focused_insert & preceding_text('.*"$') & following_text('^"'))
@handle('backspace', filter=focused_insert & preceding_text(r".*'$") & following_text(r"^'"))
def _(event):
    event.current_buffer.delete()
    event.current_buffer.delete_before_cursor()

