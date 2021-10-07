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

local alt_shift = {"alt", "shift"}
local ctrl_alt_shift = {"ctrl", "alt", "shift"}

-- Alt - is begin negative argument in Emacs
-- Alt = is count words in region in Emacs
-- Alt [ and Alt ] are undefined
-- Use alt shift space for alfred
hs.window.animationDuration = 0 -- disable animations
spoon.MiroWindowsManager:bindHotkeys({
  up = {"alt", "="},
  right = {"alt", "]"},
  down = {"alt", "-"},
  left = {"alt", "["},
  fullscreen = {"alt", "space"}
})

-- The numbers 1 through 4 go to screens 1 through 4
-- Alt 1 thru 0 create windows 1-10 in tmux
-- https://stackoverflow.com/a/58398311
function moveWindowToDisplay(d)
  return function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    win:moveToScreen(displays[d], true, true)
  end
end

hs.hotkey.bind(alt_shift, "1", moveWindowToDisplay(1))
hs.hotkey.bind(alt_shift, "2", moveWindowToDisplay(2))
hs.hotkey.bind(alt_shift, "3", moveWindowToDisplay(3))
hs.hotkey.bind(alt_shift, "4", moveWindowToDisplay(4))

-- Quote goes to the previously focused window, like the last jump ('') mark in Vim
hs.hotkey.bind("alt", "'", function()
  hs.window.filter.new():getWindows()[2]:focus()
end)

-- 6 goes to the previously focused window, like the ctrl ^ in Vim
-- Alt 1 thru 0 create windows 1-10 in tmux
hs.hotkey.bind(alt_shift, "6", function()
  hs.window.filter.new():getWindows()[2]:focus()
end)

-- ctrl 6 goes to the previously focused window, like the ctrl ^ in Vim
hs.hotkey.bind({"ctrl", "alt", "shift"}, "6", function()
  hs.window.filter.new():getWindows()[2]:focus()
end)

-- Note: Alt Shift , is go to beginning of document in emacs
-- In macOS, use Shift Command P instead of Alt Shift .
-- In Vim, use gg

-- Period brings up finder, . represents the current directory in UNIX file systems
-- Note: Alt Shift . is go to end of document in emacs
-- In Vim, use G
-- In macOS, use Ctrl Command N instead of Alt Shift .
-- Alt . is insert previous argument in bash / zsh
hs.hotkey.bind(alt_shift, '.', function()
    hs.application.launchOrFocus('Finder')
end)

-- Slash shows window hints, / is search in Vim
-- Alt / is hippie completion in Emacs, analogous to omnicompletion in vim
hs.hotkey.bind("alt", '/', hs.hints.windowHints)

-- Alt semicolon goes to the next window thanks to a shortcut set in System Preferences
-- This System Preferences shortcut also enables Alt Shift semicolon to go to the previous window
-- I used Karabiner to have Alt comma send Alt Shift semicolon, so I can switch back and forth
-- between windows using ; and , (similar to the vim motions repeat f, F, t, and T motions)
-- Thanks to another Karabiner keyboard modification, I can hold Tab instead of Alt

-- Tab goes to the next window in the hammerspoon window switcher, like Cmd Tab or Alt Tab
hs.hotkey.bind(alt_shift, 'tab', hs.window.switcher.nextWindow)

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
-- Alt Enter is used in Jupyter
-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L368
hs.hotkey.bind(alt_shift, 'return', function()
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
hs.hotkey.bind(alt_shift, 'escape', function()
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
-- Alt | deletes all spaces and tabs around cursor
-- https://github.com/Hammerspoon/hammerspoon/issues/2022#issuecomment-518754783
hs.hotkey.bind("alt", '\\', function()
  hs.window.focusedWindow():centerOnScreen(nil, true)
end)

-- Backtick brings up the console, like Ctrl ` in VS Code and GitHub Desktop
-- Alt backtick is used by Alt tab
hs.hotkey.bind(alt_shift, '`', hs.toggleConsole)

-- Use Preview instead of Adobe Acrobat
-- Alt a is go to start of sentence in Emacs
hs.hotkey.bind(alt_shift, 'a', function()
    hs.application.launchOrFocus('Preview')
end)

-- Alt B is move one word backward
-- Alt Shift B is select word backward
-- Ctrl Alt Shift B nudges the focused window to the left
function nudgeLeft(d)
    return {
        x = math.max(d.x - 10, 0),
        y = d.y,
        h = d.h,
        w = d.w,
    }
end

hs.hotkey.bind(ctrl_alt_shift, 'b', function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeLeft(win:frame()))
end)

-- C is for VS Code
-- Alt c is capitalize word
hs.hotkey.bind(alt_shift, 'c', function()
    hs.application.launchOrFocus('VSCodium')
end)

-- D is for Docker
-- Alt d is delete word forward
hs.hotkey.bind(alt_shift, 'd', function()
    hs.application.launchOrFocus('Jetbrains DataSpell')
end)

-- E is for Emacs, not Excel :)
-- Alt e is go to end of sentence in Emacs
hs.hotkey.bind(alt_shift, 'e', function()
    hs.application.launchOrFocus('Emacs')
end)

-- Alt F is move one word forward
-- Alt Shift F is select word forward
-- Ctrl Alt Shift F nudges the focused window to the right
function nudgeRight(d)
    return {
        x = d.x + 10,
        y = d.y,
        h = d.h,
        w = d.w,
    }
end

hs.hotkey.bind(ctrl_alt_shift, 'f', function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeRight(win:frame()))
end)

-- G is for Google Chrome
hs.hotkey.bind("alt", 'g', function()
    hs.application.launchOrFocus('Google Chrome')
end)

-- H is left, like in Vim
-- Alt h is mark paragraph in Emacs
hs.hotkey.bind(alt_shift, 'h', function()
  hs.window.focusedWindow():focusWindowWest()
end)

-- I is for iTerm
-- Alt i inserts spaces or tabs to next defined tab-stop column in Emacs
hs.hotkey.bind("alt", 'i', function()
    hs.application.launchOrFocus('iTerm')
end)

-- J is down, like in Vim
-- Alt J breaks line at point and indents
hs.hotkey.bind(alt_shift, 'j', function()
  hs.window.focusedWindow():focusWindowSouth()
end)

-- K is down, like in Vim
-- Alt k is delete to end of sentence in Emacs
hs.hotkey.bind(alt_shift, 'k', function()
  hs.window.focusedWindow():focusWindowNorth()
end)

-- L is right, like in Vim
-- Alt l is lowercase to end of word in Emacs
hs.hotkey.bind(alt_shift, 'l', function()
  hs.window.focusedWindow():focusWindowEast()
end)

-- M is for Mozilla Firefox
hs.hotkey.bind("alt", 'm', function()
    hs.application.launchOrFocus('Firefox')
end)

-- N is for next screen, like Ctrl N
-- Alt n is undefined in Emacs
hs.hotkey.bind("alt", 'n', function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():next(), true, true)
end)

-- Ctrl Alt Shift N nudges the focused window downward
function nudgeDown(d)
    return {
        x = d.x,
        y = d.y + 10,
        h = d.h,
        w = d.w,
    }
end

hs.hotkey.bind(ctrl_alt_shift, 'n', function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeDown(win:frame()))
end)

-- O is for Outlook
hs.hotkey.bind(alt_shift, 'o', function()
  hs.application.launchOrFocus('Microsoft Outlook')
end)

-- P is for previous screen, like Ctrl P
-- Alt p is undefined in Emacs
hs.hotkey.bind("alt", 'p', function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():previous(), true, true)
end)

-- Ctrl Alt Shift P nudges the focused window upward
function nudgeUp(d)
    return {
        x = d.x,
        y = math.max(d.y - 10, 0),
        h = d.h,
        w = d.w,
    }
end

hs.hotkey.bind(ctrl_alt_shift, 'p', function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeUp(win:frame()))
end)

-- R is for RStudio
-- Alt r positions the cursor at the center of window.
-- then alternates between top, middle, bottom
hs.hotkey.bind(alt_shift, 'r', function()
    hs.application.launchOrFocus('RStudio')
end)

-- Q is for CopyQ, as in queue
-- Alt q is fill/format paragraph in Emacs, like gq or gw in vim
hs.hotkey.bind(alt_shift, 'q', function()
    hs.application.launchOrFocus('CopyQ')
end)

-- S is for Slack
hs.hotkey.bind("alt", 's', function()
    hs.application.launchOrFocus('Slack')
end)

-- T is for Teams
-- Alt t is transpose words in Emacs
hs.hotkey.bind(alt_shift, 't', function()
    hs.application.launchOrFocus('Microsoft Teams')
end)

-- U is for unminimize windows for the focused app
-- Alt u is uppercase word in Emacs
hs.hotkey.bind(alt_shift, 'u', function()
  local app = hs.application.frontmostApplication()
  for k, w in ipairs(app:allWindows()) do w:unminimize() end
end)

-- Alt Shift V is select page up
-- Inspired by Alt V being page up in Emacs

-- W is for Word
-- Alt w saves the marked region in Emacs
hs.hotkey.bind("alt", 'w', function()
    hs.application.launchOrFocus('Microsoft Word')
end)

-- X is for eXpose
-- Alt x brinds up a list of commands in Emacs
hs.hotkey.bind(alt_shift, 'x', function()
  hs.expose.new():toggleShow()
end)

-- Y imitates typing while pasting, Y is for yank, like Ctrl Y in GNU Emacs and Readline
-- https://www.hammerspoon.org/go/#defeating-paste-blocking
-- Alt y rotates the kill ring (replaces last yank with previous kill)
hs.hotkey.bind(alt_shift, 'y', function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Z is for Zoom
-- alt z is zap to char, same as dt in vim
hs.hotkey.bind("alt", 'z', function()
  hs.application.launchOrFocus('zoom.us')
  hs.window.focusedWindow():setFullScreen(false)
end)

-- Delete reloads the config, Delete is on the opposite side of the keyboard from Backtick
-- Alt Delete reduces indentation of lines to match a line above in Emacs
hs.hotkey.bind(alt_shift, 'delete', hs.reload)

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
