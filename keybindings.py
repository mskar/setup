from IPython import get_ipython
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, ViInsertMode
from prompt_toolkit.key_binding.vi_state import InputMode
from prompt_toolkit.keys import Keys
from prompt_toolkit.key_binding.bindings import named_commands


ip = get_ipython()

registry = ip.pt_app.key_bindings

# Control
# A
registry.add_binding(
    Keys.ControlA,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.beginning_of_line)

# B
registry.add_binding(
    Keys.ControlB,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.backward_char)

# D already works

# E
registry.add_binding(
    Keys.ControlE,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.end_of_line)

# F
registry.add_binding(
    Keys.ControlF,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.forward_char)

# H already works

# K
registry.add_binding(
    Keys.ControlK,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.kill_line)

# T already works (??)

# U already works

# W already works

# Y
registry.add_binding(
    Keys.ControlY,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.yank)

# _
registry.add_binding(
    Keys.ControlUnderscore,
    filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
)(named_commands.undo)

