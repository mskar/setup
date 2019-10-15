!`::Send {Alt down}+{Tab}
#if WinActive("ahk_exe Chrome.exe") or WinActive("ahk_exe Firefox.exe") or WinActive("ahk_exe Outlook.exe") or WinActive("ahk_exe Explorer.exe")
    !a::Send ^a
    !c::Send ^c
    !n::Send ^n
    !+n::Send ^+n
    !q::Send ^+w
    !s::Send ^s
    !t::Send ^t
    !v::Send ^v
    !w::Send ^w
    !x::Send ^x
    !z::Send ^z
    !+z::Send ^+z
    !+[::Send ^+{Tab}
    !+]::Send ^{Tab}
