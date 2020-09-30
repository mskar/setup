# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/keys.py
# https://ipython.readthedocs.io/en/latest/config/details.html#keyboard-shortcuts
# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/key_binding/bindings/named_commands.py

from IPython import get_ipython
from prompt_toolkit.filters import HasFocus, ViInsertMode
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.key_binding.bindings import named_commands as nc

ip = get_ipython()
registry = ip.pt_app.key_bindings
focused_insert = (HasFocus(DEFAULT_BUFFER) & ViInsertMode())

key_cmd_dict = {
    "c-a": nc.beginning_of_line,
    "c-b": nc.backward_char,
    ## ControlD already works
    "c-e": nc.end_of_line,
    "c-f": nc.forward_char,
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
    ("escape", "f"): nc.forward_word,
    ("escape", "h"): nc.backward_kill_word,
    ("escape", "l"): nc.downcase_word,
    ("escape", "u"): nc.uppercase_word,
    ("escape", "y"): nc.yank_pop,
    ("escape", "."): nc.yank_last_arg,
}

for keys, cmd in keys_cmd_dict.items():
    registry.add_binding(*keys, filter=focused_insert)(cmd)

def _(event):
    b = event.app.current_buffer
    if b.complete_state:
        b.complete_next()
    else:
        b.start_completion(select_first=True)
registry.add_binding("c-space", filter=focused_insert)(_)

def _(event):
    buffer = event.current_buffer
    buffer.insert_text('"')
    buffer.insert_text('"', move_cursor=False)
registry.add_binding('"', filter=focused_insert)(_)

def _(event):
    buffer = event.current_buffer
    buffer.insert_text("'")
    buffer.insert_text("'", move_cursor=False)
registry.add_binding("'", filter=focused_insert)(_)

def _(event):
    buffer = event.current_buffer
    buffer.insert_text("(")
    buffer.insert_text(")", move_cursor=False)
registry.add_binding("(", filter=focused_insert)(_)

def _(event):
    buffer = event.current_buffer
    buffer.insert_text("{")
    buffer.insert_text("}", move_cursor=False)
registry.add_binding("{", filter=focused_insert)(_)

def _(event):
    buffer = event.current_buffer
    buffer.insert_text("[")
    buffer.insert_text("]", move_cursor=False)
registry.add_binding("[", filter=focused_insert)(_)

def _(event):
    buffer = event.current_buffer
    buffer.insert_text("<")
    buffer.insert_text(">", move_cursor=False)
registry.add_binding("<", filter=focused_insert)(_)

def _(event):
    buffer = event.current_buffer
    buffer.insert_text("`")
    buffer.insert_text("`", move_cursor=False)
registry.add_binding("`", filter=focused_insert)(_)
