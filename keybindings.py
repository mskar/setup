# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/keys.py
# https://ipython.readthedocs.io/en/latest/config/details.html#keyboard-shortcuts
# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/key_binding/bindings/named_commands.py

from IPython import get_ipython
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, ViInsertMode
from prompt_toolkit.key_binding.vi_state import InputMode
from prompt_toolkit.keys import Keys
from prompt_toolkit.key_binding.bindings import named_commands


ip = get_ipython()

registry = ip.pt_app.key_bindings

# Control
## A
registry.add_binding(
    Keys.ControlA,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.beginning_of_line)

## B
registry.add_binding(
    Keys.ControlB,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.backward_char)

## D already works

## E
registry.add_binding(
    Keys.ControlE,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.end_of_line)

## F
registry.add_binding(
    Keys.ControlF,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.forward_char)

## H already works

## K
registry.add_binding(
    Keys.ControlK,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.kill_line)

## R already works

## T already works (??)

## U already works

## W already works, but use backward_kill_word instead of unix_word_rubout
registry.add_binding(
    Keys.ControlW,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.backward_kill_word)

## Y
registry.add_binding(
    Keys.ControlY,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.yank)

## _
registry.add_binding(
    Keys.ControlUnderscore,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.undo)

## x e: edit_and_execute
registry.add_binding(
    Keys.ControlX, "e",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.edit_and_execute)

## x c-e: edit_and_execute
registry.add_binding(
    Keys.ControlX, Keys.ControlE,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.edit_and_execute)

## x c-u: edit_and_execute
registry.add_binding(
    Keys.ControlX, Keys.ControlU,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.undo)

## x u: edit_and_execute
registry.add_binding(
    Keys.ControlX, "u",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.undo)

# Alt

## B
registry.add_binding(
    "escape", "b",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.backward_word)

## C
registry.add_binding(
    "escape", "c",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.capitalize_word)

## D
registry.add_binding(
    "escape", "d",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.kill_word)

## F
registry.add_binding(
    "escape", "f",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.forward_word)

## H
registry.add_binding(
    "escape", "h",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.backward_kill_word)

## L
registry.add_binding(
    "escape", "l",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.downcase_word)

## U
registry.add_binding(
    "escape", "u",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.uppercase_word)

## Y
registry.add_binding(
    "escape", "y",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.yank_pop)

## .
registry.add_binding(
    "escape", ".",
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.yank_last_arg)

