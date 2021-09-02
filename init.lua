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

-- Square brackets snap the focused window numbers to the left and right
-- Plus and Minus snap the focused window numbers to the top and bottom
-- Spacebar makes the focused window fullscreen, because spacebar is the widest key on the keyboard
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

-- The numbers 1 through 4 go to screens 1 through 4
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

-- Quote goes to the previously focused window, like the last jump ('') mark in Vim
hs.hotkey.bind(shift_alt, "'", function()
  hs.window.filter.new():getWindows()[2]:focus()
end)

-- Commna goes to the previous window in th window switcher, like the , motion in Vim
-- Note: Alt Shift , is go to beginning of document in emacs
-- In macOS, use Shift Command P instead of Alt Shift .
-- In Vim, use gg
hs.hotkey.bind(shift_alt, ',', hs.window.switcher.previousWindow)

-- Period brings up finder, . represents the current directory in UNIX file systems
-- Note: Alt Shift . is go to end of document in emacs
-- In macOS, use Shift Command N instead of Alt Shift .
-- In Vim, use G
hs.hotkey.bind(shift_alt, '.', function()
    hs.application.launchOrFocus('Finder')
end)

-- Slash shows window hints, / is search in Vim
hs.hotkey.bind(shift_alt, '/', hs.hints.windowHints)

-- Semicolon goes to the next window in th window switcher, like the ; motion in Vim
hs.hotkey.bind(shift_alt, ';', hs.window.switcher.nextWindow)

-- Tab also goes to the next window in th window switcher, like Cmd Tab or Alt Tab
hs.hotkey.bind(shift_alt, 'tab', hs.window.switcher.nextWindow)

-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L177
function round(x, places)
   local places = places or 0
   local x = x * 10^places
   return (x + 0.5 - (x + 0.5) % 1) / 10^places
end

-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L183
function current_window_rect(win)
   local win = win or hs.window.focusedWindow()
   local ur, r = win:screen():toUnitRect(win:frame()), round
   return {r(ur.x,2), r(ur.y,2), r(ur.w,2), r(ur.h,2)} -- an hs.geometry.unitrect table
end

-- Enter makes the window larger
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

-- Escape makes the window smaller
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

-- Bar (|) centers the window, works great with square brackets to create a triple vertical split
-- https://github.com/Hammerspoon/hammerspoon/issues/2022#issuecomment-518754783
hs.hotkey.bind(shift_alt, '\\', function()
  hs.window.focusedWindow():centerOnScreen(nil, true)
end)

-- Backtick brings up the console, like Ctrl ` in VS Code and GitHub Desktop
hs.hotkey.bind(shift_alt, '`', hs.toggleConsole)

-- Use Preview instead of Adobe Acrobat
hs.hotkey.bind(shift_alt, 'a', function()
    hs.application.launchOrFocus('Preview')
end)

-- Alt Shift B is select word backward

-- C is for VS Code
hs.hotkey.bind(shift_alt, 'c', function()
    hs.application.launchOrFocus('VSCodium')
end)

-- D is for Docker
hs.hotkey.bind(shift_alt, 'd', function()
    hs.application.launchOrFocus('Docker')
end)

-- E is for Emacs, not Excel :)
hs.hotkey.bind(shift_alt, 'e', function()
    hs.application.launchOrFocus('Emacs')
end)

-- Alt Shift F is select word forward

-- G is for Google Chrome
hs.hotkey.bind(shift_alt, 'g', function()
    hs.application.launchOrFocus('Google Chrome')
end)

-- H is left, like in Vim
hs.hotkey.bind(shift_alt, 'h', function()
  hs.window.focusedWindow():focusWindowWest()
end)

-- I is for iTerm
hs.hotkey.bind(shift_alt, 'i', function()
    hs.application.launchOrFocus('iTerm')
end)

-- J is down, like in Vim
hs.hotkey.bind(shift_alt, 'j', function()
  hs.window.focusedWindow():focusWindowSouth()
end)

-- K is down, like in Vim
hs.hotkey.bind(shift_alt, 'k', function()
  hs.window.focusedWindow():focusWindowNorth()
end)

-- L is right, like in Vim
hs.hotkey.bind(shift_alt, 'l', function()
  hs.window.focusedWindow():focusWindowEast()
end)

-- M is for Mozilla Firefox
hs.hotkey.bind(shift_alt, 'm', function()
    hs.application.launchOrFocus('Firefox')
end)

-- N is for next screen, like Ctrl N
hs.hotkey.bind(shift_alt, 'n', function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():previous(), true, true)
end)

-- O is for Outlook
hs.hotkey.bind(shift_alt, 'o', function()
    hs.application.launchOrFocus('Microsoft Outlook')
end)

-- P is for previous screen, like Ctrl P
hs.hotkey.bind(shift_alt, 'p', function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():previous(), true, true)
end)

-- R is for RStudio
hs.hotkey.bind(shift_alt, 'r', function()
    hs.application.launchOrFocus('RStudio')
end)

-- Q is for CopyQ, as in queue
hs.hotkey.bind(shift_alt, 'q', function()
    hs.application.launchOrFocus('CopyQ')
end)

-- S is for Slack
hs.hotkey.bind(shift_alt, 's', function()
    hs.application.launchOrFocus('Slack')
end)

-- T is for Teams
hs.hotkey.bind(shift_alt, 't', function()
    hs.application.launchOrFocus('Microsoft Teams')
end)

-- U is for unminimize windows for the focused app
hs.hotkey.bind(shift_alt, 'u', function()
  local app = hs.application.frontmostApplication()
  for k, w in ipairs(app:allWindows()) do w:unminimize() end
end)

-- Alt Shift V is select page up

-- W is for Word
hs.hotkey.bind(shift_alt, 'w', function()
    hs.application.launchOrFocus('Microsoft Word')
end)

-- X is for eXpose
hs.hotkey.bind(shift_alt, 'x', function()
  hs.expose.new():toggleShow()
end)

-- Y imitates typing while pasting, Y is for yank, like Ctrl Y in GNU Emacs and Readline
-- https://www.hammerspoon.org/go/#defeating-paste-blocking
hs.hotkey.bind(shift_alt, 'y', function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Z is for Zoom
hs.hotkey.bind(shift_alt, 'z', function()
  hs.application.launchOrFocus('zoom.us')
  hs.window.focusedWindow():setFullScreen(false)
end)

-- Delete reloads the config, Delete is on the opposite side of the keyboard from Backtick
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
