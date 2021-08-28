----------------------------------------------------------------
-- VIM CONFIG
----------------------------------------------------------------
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

----------------------------------------------------------------
-- Press Cmd+Q twice to quit
----------------------------------------------------------------

-- https://github.com/pqrs-org/Karabiner-Elements/issues/242#issuecomment-277330358

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

----------------------------------------------------------------
-- WINDOW MANAGEMENT
----------------------------------------------------------------
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

-- https://stackoverflow.com/a/58398311
function moveWindowToDisplay(d)
  return function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    win:moveToScreen(displays[d], true, true)
  end
end

hs.hotkey.bind(shift_alt, "1", moveWindowToDisplay(1))
hs.hotkey.bind(shift_alt, "2", moveWindowToDisplay(2))
hs.hotkey.bind(shift_alt, "3", moveWindowToDisplay(3))
hs.hotkey.bind(shift_alt, "4", moveWindowToDisplay(4))

hs.hotkey.bind(shift_alt, "'", function()
  hs.window.filter.new():getWindows()[2]:focus()
end)

hs.hotkey.bind(shift_alt, ',', hs.window.switcher.previousWindow)

hs.hotkey.bind(shift_alt, '.', function()
    hs.application.launchOrFocus('Finder')
end)

hs.hotkey.bind(shift_alt, '/', hs.hints.windowHints)

hs.hotkey.bind(shift_alt, ';', hs.window.switcher.nextWindow)
hs.hotkey.bind(shift_alt, 'tab', hs.window.switcher.nextWindow)

-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L183
function current_window_rect(win)
   local win = win or hs.window.focusedWindow()
   local ur, r = win:screen():toUnitRect(win:frame()), round
   return {r(ur.x,2), r(ur.y,2), r(ur.w,2), r(ur.h,2)} -- an hs.geometry.unitrect table
end

-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L368
hs.hotkey.bind(shift_alt, 'return', function()
  local win = hs.window.focusedWindow()
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = math.max(cw[1]-0.02,0)
  move_to_rect[2] = math.max(cw[2]-0.02,0)
  move_to_rect[3] = math.min(cw[3]+0.04,1 - move_to_rect[1])
  move_to_rect[4] = math.min(cw[4]+0.04,1 - move_to_rect[2])
  win:move(move_to_rect)
end)

-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L392
hs.hotkey.bind(shift_alt, 'escape', function()
  local win = hs.window.focusedWindow()
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[3] = math.max(cw[3]-0.04,0.1)
  move_to_rect[4] = cw[4] > 0.95 and 1 or math.max(cw[4]-0.04,0.1) -- some windows (MacVim) don't size to 1
  move_to_rect[1] = math.min(cw[1]+0.02,1 - move_to_rect[3])
  move_to_rect[2] = cw[2] == 0 and 0 or math.min(cw[2]+0.02,1 - move_to_rect[4])
  win:move(move_to_rect)
end)

-- https://github.com/Hammerspoon/hammerspoon/issues/2022#issuecomment-518754783
hs.hotkey.bind(shift_alt, '\\', function()
  hs.window.focusedWindow():centerOnScreen(nil, true)
end)

hs.hotkey.bind(shift_alt, '`', hs.toggleConsole)

hs.hotkey.bind(shift_alt, 'a', function()
    hs.application.launchOrFocus('Adobe Acrobat Reader DC')
end)

-- alt shift b is select word backward

hs.hotkey.bind(shift_alt, 'c', function()
    hs.application.launchOrFocus('VSCodium')
end)

hs.hotkey.bind(shift_alt, 'd', function()
    hs.application.launchOrFocus('Docker')
end)

hs.hotkey.bind(shift_alt, 'e', function()
    hs.application.launchOrFocus('Emacs')
end)

-- alt shift f is select word forward

hs.hotkey.bind(shift_alt, 'g', function()
    hs.application.launchOrFocus('Google Chrome')
end)

hs.hotkey.bind(shift_alt, 'h', function()
  hs.window.focusedWindow():focusWindowWest()
end)

hs.hotkey.bind(shift_alt, 'i', function()
    hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind(shift_alt, 'j', function()
  hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(shift_alt, 'k', function()
  hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(shift_alt, 'l', function()
  hs.window.focusedWindow():focusWindowEast()
end)

hs.hotkey.bind(shift_alt, 'm', function()
    hs.application.launchOrFocus('Firefox')
end)

hs.hotkey.bind(shift_alt, 'n', function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():previous(), true, true)
end)

hs.hotkey.bind(shift_alt, 'o', function()
    hs.application.launchOrFocus('Microsoft Outlook')
end)

hs.hotkey.bind(shift_alt, 'p', function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():previous(), true, true)
end)

hs.hotkey.bind(shift_alt, 'r', function()
    hs.application.launchOrFocus('RStudio')
end)

hs.hotkey.bind(shift_alt, 'q', function()
    hs.application.launchOrFocus('CopyQ')
end)

hs.hotkey.bind(shift_alt, 's', function()
    hs.application.launchOrFocus('Slack')
end)

hs.hotkey.bind(shift_alt, 't', function()
    hs.application.launchOrFocus('Terminal')
end)

hs.hotkey.bind(shift_alt, 'u', function()
  local app = hs.application.frontmostApplication()
  for k, w in ipairs(app:allWindows()) do w:unminimize() end
end)

hs.hotkey.bind(shift_alt, 'w', function()
    hs.application.launchOrFocus('Microsoft Word')
end)

hs.hotkey.bind(shift_alt, 'x', function()
  hs.expose.new():toggleShow()
end)

-- https://www.hammerspoon.org/go/#defeating-paste-blocking
hs.hotkey.bind(shift_alt, 'y', function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

hs.hotkey.bind(shift_alt, 'z', function()
  hs.application.launchOrFocus('zoom.us')
  hs.window.focusedWindow():setFullScreen(false)
end)

hs.hotkey.bind(shift_alt, 'delete', hs.reload)

----------------------------------------------------------------
-- Use menubar instead of terminal to toggle caffeinate
----------------------------------------------------------------

-- https://www.hammerspoon.org/go/#creating-a-simple-menubar-item
caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("DECAF")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end
