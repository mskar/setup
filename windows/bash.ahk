#if WinActive("ahk_exe Chrome.exe") or WinActive("ahk_exe Firefox.exe") or WinActive("ahk_exe Outlook.exe") or WinActive("ahk_exe Explorer.exe")
    ^h::Send {Ctrl up}{Backspace}{Ctrl down}
    ^w::Send ^{Backspace}{Ctrl down}
    ^d::Send {Ctrl up}{Delete}{Ctrl down}
    !d::Send ^{Delete}
    ^k::Send +{End}{Delete}{Ctrl down}
    ^u::Send +{Home}{Delete}{Ctrl down}
    ^a::Send {Home}{Ctrl down}
    ^e::Send {End}{Ctrl down}
    ^b::Send {Ctrl up}{Left}{Ctrl down}
    ^f::Send {Ctrl up}{Right}{Ctrl down}
    !b::Send ^{Left}
    !f::Send ^{Right}
    ^n::Send {Down}{Ctrl down}
    ^p::Send {Up}{Ctrl down}
