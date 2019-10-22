!`::Send {Alt down}+{Tab}
Alt & Space::Send #s
#if WinActive("ahk_exe Chrome.exe") or WinActive("ahk_exe Firefox.exe") or WinActive("ahk_exe Outlook.exe") or WinActive("ahk_exe Explorer.exe")
    !0::Send ^0
    !1::Send ^1
    !2::Send ^2
    !3::Send ^3
    !4::Send ^4
    !5::Send ^5
    !6::Send ^6
    !7::Send ^7
    !8::Send ^8
    !9::Send ^9
    !-::Send ^-
    !=::Send ^{=}
    <!+[::Send ^+{Tab}
    <!+]::Send ^{Tab}
    <!+n::Send ^+n
    <!+z::Send ^+z
    <!a::Send ^a
    <!c::Send ^c
    <!f::Send ^f
    <!l::Send ^l
    <!m::Send #m
    <!n::Send ^n
    <!o::Send ^o
    <!q::Send ^+w
    <!r::Send ^r
    <!s::Send ^s
    <!t::Send ^t
    <!v::Send ^v
    <!w::Send ^w
    <!x::Send ^x
    <!z::Send ^z
