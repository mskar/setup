# https://github.com/prompt-toolkit/python-prompt-toolkit/issues/192#issuecomment-557800620
import sys

from prompt_toolkit.key_binding.vi_state import InputMode, ViState
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, ViInsertMode
from prompt_toolkit.key_binding.vi_state import InputMode
from prompt_toolkit.key_binding.bindings.named_commands import beginning_of_line
from prompt_toolkit.keys import Keys
from prompt_toolkit.filters import HasFocus, HasSelection, ViInsertMode, EmacsInsertMode
from IPython import get_ipython


def get_input_mode(self):
    if sys.version_info[0] == 3:
        # Decrease input flush timeout from 500ms to 10ms.
        from prompt_toolkit.application.current import get_app

        app = get_app()
        app.ttimeoutlen = 0.01

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


ip = get_ipython()


if getattr(ip, 'pt_app', None):
   registry = ip.pt_app.key_bindings
   registry.add_binding(Keys.ControlA,
                        filter=(HasFocus(DEFAULT_BUFFER)
                                 & ViInsertMode()))(beginning_of_line)

ViState._input_mode = InputMode.INSERT
ViState.input_mode = property(get_input_mode, set_input_mode)
c.TerminalInteractiveShell.editing_mode = 'vi'
