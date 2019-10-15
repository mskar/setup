#if WinActive("ahk_exe Chrome.exe") or WinActive("ahk_exe Firefox.exe") or WinActive("ahk_exe Outlook.exe")
    ^h::Send {Backspace}
    ^w::Send ^{Backspace}{Ctrl down}
    ^d::Send {Delete}
    !d::Send ^{Delete}
    ^k::Send +{End}{Delete}{Ctrl down}
    ^u::Send +{Home}{Delete}{Ctrl down}
    ^a::Send {Home}{Ctrl down}
    ^e::Send {End}{Ctrl down}
    ^b::Send {Left}
    ^f::Send {Right}
    !b::Send ^{Left}
    !f::Send ^{Right}
    ^n::Send {Down}{Ctrl down}
    ^p::Send {Up}{Ctrl down}
