--------------------------------
-- START VIM CONFIG
--------------------------------
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
vim
  :disableForApp('Code')
  :disableForApp('zoom.us')
  :disableForApp('iTerm')
  :disableForApp('iTerm2')
  :disableForApp('Terminal')

-- If you want the screen to dim (a la Flux) when you enter normal mode
-- flip this to true.
vim:shouldDimScreenInNormalMode(false)

-- If you want to show an on-screen alert when you enter normal mode, set
-- this to true
vim:shouldShowAlertInNormalMode(true)

-- You can configure your on-screen alert font
vim:setAlertFont("Courier New")

-- Enter normal mode by typing a key sequence
-- https://github.com/dbalatero/VimMode.spoon#binding-jk-to-enter-normal-mode
vim:enterWithSequence('kj', 100)

-- https://github.com/dbalatero/VimMode.spoon#block-cursor-mode
vim:enableBetaFeature('block_cursor_overlay')

--------------------------------
-- END VIM CONFIG
--------------------------------

-- https://github.com/pqrs-org/Karabiner-Elements/issues/242#issuecomment-277330358
-- Press Cmd+Q twice to quit

local quitModal = hs.hotkey.modal.new('cmd','q')

function quitModal:entered()
    hs.alert.show("Press Cmd+Q again to quit", 1)
    hs.timer.doAfter(1, function() quitModal:exit() end)
end

local function doQuit()
    local app = hs.application.frontmostApplication()
    app:kill()
end

quitModal:bind('cmd', 'q', doQuit)

quitModal:bind('', 'escape', function() quitModal:exit() end)

-- https://github.com/miromannino/miro-windows-manager

hs.loadSpoon("MiroWindowsManager")

local shift_alt = {"shift", "alt"}

hs.window.animationDuration = 0 -- disable animations
spoon.MiroWindowsManager:bindHotkeys({
  up = {shift_alt, "="},
  right = {shift_alt, "]"},
  down = {shift_alt, "-"},
  left = {shift_alt, "["},
  fullscreen = {shift_alt, "space"}
})

hs.hotkey.bind(shift_alt, 'b', function()
    hs.application.launchOrFocus('Brave Browser')
end)

hs.hotkey.bind(shift_alt, 'c', hs.toggleConsole)

hs.hotkey.bind(shift_alt, 'd', function()
    hs.application.launchOrFocus('JetBrains DS')
end)

hs.hotkey.bind(shift_alt, 'e', function()
    hs.application.launchOrFocus('Emacs')
end)

hs.hotkey.bind(shift_alt, 'g', function()
    hs.application.launchOrFocus('Google Chrome')
end)

hs.hotkey.bind(shift_alt, 'h', function()
  local win = hs.window.focusedWindow()
  win:focusWindowWest()
end)

hs.hotkey.bind(shift_alt, 'i', function()
    hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind(shift_alt, 'j', function()
  local win = hs.window.focusedWindow()
  win:focusWindowSouth()
end)

hs.hotkey.bind(shift_alt, 'k', function()
  local win = hs.window.focusedWindow()
  win:focusWindowNorth()
end)

hs.hotkey.bind(shift_alt, 'l', function()
  local win = hs.window.focusedWindow()
  win:focusWindowEast()
end)

hs.hotkey.bind(shift_alt, 'm', function()
    hs.application.launchOrFocus('Firefox')
end)

hs.hotkey.bind(shift_alt, 'n', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  win:setFullScreen(false)
  win:moveToScreen(screen:previous(), true, true)
end)

hs.hotkey.bind(shift_alt, 'p', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  win:setFullScreen(false)
  win:moveToScreen(screen:previous(), true, true)
end)

hs.hotkey.bind(shift_alt, 'q', function()
    hs.application.launchOrFocus('CopyQ')
end)

hs.hotkey.bind(shift_alt, 'r', hs.reload)

hs.hotkey.bind(shift_alt, 't', function()
    hs.application.launchOrFocus('Terminal')
end)

hs.hotkey.bind(shift_alt, 'v', function()
    hs.application.launchOrFocus('VSCodium')
end)

hs.hotkey.bind(shift_alt, 'z', function()
    hs.application.launchOrFocus('zoom.us')
end)
