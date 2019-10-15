#if WinActive("ahk_exe Chrome.exe") or WinActive("ahk_exe Firefox.exe") or WinActive("ahk_exe Outlook.exe") or WinActive("ahk_exe Explorer.exe")
    ^h::Send {Ctrl up}{Backspace}{Ctrl down}
    ^w::Send ^{Backspace}{Ctrl down}
    ^d::Send {Ctrl up}{Delete}{Ctrl down}
    !d::Send ^{Delete}
    ^k::Send {Ctrl up}{Shift down}{End}{Shift up}{Delete}{Ctrl down}
    ^u::Send {Ctrl up}{Shift down}{Home}{Shift up}{Delete}{Ctrl down}
    ^a::Send {Ctrl up}{Home}{Ctrl down}
    ^e::Send {Ctrl up}{End}{Ctrl down}
    ^b::Send {Ctrl up}{Left}{Ctrl down}
    ^f::Send {Ctrl up}{Right}{Ctrl down}
    !b::Send ^{Left}
    !f::Send ^{Right}
    ^n::Send {Down}{Ctrl down}
    ^p::Send {Up}{Ctrl down}
