# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/keys.py
# https://ipython.readthedocs.io/en/latest/config/details.html#keyboard-shortcuts
# https://github.com/prompt-toolkit/python-prompt-toolkit/blob/master/prompt_toolkit/key_binding/bindings/named_commands.py

from IPython import get_ipython
from prompt_toolkit.filters import HasFocus, ViInsertMode
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.keys import Keys
from prompt_toolkit.key_binding.bindings import named_commands as nc

ip = get_ipython()
registry = ip.pt_app.key_bindings
focused_insert = (HasFocus(DEFAULT_BUFFER) & ViInsertMode())

key_cmd_dict = {
    # Control
    (Keys.ControlA): nc.beginning_of_line,
    (Keys.ControlB): nc.backward_char,
    ## ControlD already works
    (Keys.ControlE): nc.end_of_line,
    (Keys.ControlF): nc.forward_char,
    ## ControlH already works
    (Keys.ControlK): nc.kill_line,
    ## ControlR, ControlT, and ControlU already work
    ## ControlW: use backward_kill_word instead of unix_word_rubout
    (Keys.ControlW): nc.backward_kill_word,
    (Keys.ControlY): nc.yank,
    (Keys.ControlX, Keys.ControlE): nc.edit_and_execute,
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

for key, cmd in key_cmd_dict.items():
    registry.add_binding(*key, filter=focused_insert)(cmd)

