#if WinActive("ahk_exe Chrome.exe") or WinActive("ahk_exe Firefox.exe") or WinActive("ahk_exe Outlook.exe") or WinActive("ahk_exe Explorer.exe")
    #b::Send ^{Left}
    #d::Send ^{Delete}
    #f::Send ^{Right}
    #h::Send ^{Backspace}
    ^a::Send {Ctrl up}{Home}{Ctrl down}
    ^b::Send {Ctrl up}{Left}{Ctrl down}
    ^d::Send {Ctrl up}{Delete}{Ctrl down}
    ^e::Send {Ctrl up}{End}{Ctrl down}
    ^f::Send {Ctrl up}{Right}{Ctrl down}
    ^h::Send {Ctrl up}{Backspace}{Ctrl down}
    ^k::Send {Ctrl up}{Shift down}{End}{Shift up}{Delete}{Ctrl down}
    ^n::Send {Down}{Ctrl down}
    ^p::Send {Up}{Ctrl down}
    ^u::Send {Ctrl up}{Shift down}{Home}{Shift up}{Delete}{Ctrl down}
    ^w::Send ^{Backspace}{Ctrl down}
