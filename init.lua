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
-- GENERAL WINDOW MANAGEMENT
----------------------------------------------------------------

-- These shortcuts interfere with some no-so-important tmux and emacs bindings (described in init.lua)
-- To use all tmux and emacs bindings, turn off hammerspoon with Alt Shift H and Cmd Q

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
hs.hotkey.bind("alt", 'return', function()
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
hs.hotkey.bind("alt", 'escape', function()
  local win = hs.window.focusedWindow()
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[3] = math.max(cw[3]-0.04,0.1)
  move_to_rect[4] = cw[4] > 0.95 and 1 or math.max(cw[4]-0.04,0.1) -- some windows (MacVim) don't size to 1
  move_to_rect[1] = math.min(cw[1]+0.02,1 - move_to_rect[3])
  move_to_rect[2] = cw[2] == 0 and 0 or math.min(cw[2]+0.02,1 - move_to_rect[4])
  win:move(move_to_rect)
end)

-- Square brackets snap the focused window numbers to the left and right
-- Plus and Minus snap the focused window numbers to the top and bottom
-- Spacebar makes the focused window fullscreen, because spacebar is the widest key on the keyboard
-- https://github.com/miromannino/miro-windows-manager
hs.loadSpoon("MiroWindowsManager")

-- Alt - is begin negative argument in Emacs
-- Alt = is count words in region in Emacs
-- Alt [ and Alt ] are undefined
-- Use Alt Shift Space for Alfred
hs.window.animationDuration = 0 -- disable animations
spoon.MiroWindowsManager:bindHotkeys({
  fullscreen = {"alt", "space"},
  down = {"alt", "-"},
  up = {"alt", "="},
  left = {"alt", "["},
  right = {"alt", "]"},
})

-- Quote goes to the previously focused window, like the last jump ('') mark in Vim
hs.hotkey.bind("alt", "'", function()
  hs.window.filter.new():getWindows()[2]:focus()
end)

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

hs.hotkey.bind("alt", "1", moveWindowToDisplay(1))
hs.hotkey.bind("alt", "2", moveWindowToDisplay(2))
hs.hotkey.bind("alt", "3", moveWindowToDisplay(3))
hs.hotkey.bind("alt", "4", moveWindowToDisplay(4))

-- Alt semicolon goes to the next window thanks to a shortcut set in System Preferences
-- This System Preferences shortcut also enables Alt Shift semicolon to go to the previous window
-- I used Karabiner to have Alt comma send Alt Shift semicolon, so I can switch back and forth
-- between windows using ; and , (similar to the vim motions repeat f, F, t, and T motions)
-- Thanks to another Karabiner keyboard modification, I can hold Tab instead of Alt

-- Slash shows window hints, / is search in Vim
-- Alt / is hippie completion in Emacs, analogous to omnicompletion in vim
hs.hotkey.bind("alt", '/', hs.hints.windowHints)

-- Bar (|) centers the window, works great with square brackets to create a triple vertical split
-- Alt | deletes all spaces and tabs around cursor
-- https://github.com/Hammerspoon/hammerspoon/issues/2022#issuecomment-518754783
hs.hotkey.bind("alt", '\\', function()
  hs.window.focusedWindow():centerOnScreen(nil, true)
end)

-- Alt Delete reduces indentation of lines to match a line above in Emacs

-- Alt . is insert previous argument in bash / zsh

-- Alt Backtick is used by Alt tab

-- Alt A is go to start of sentence in Emacs
-- Use Alt A to focus menu bar (a is for apple)

-- Alt B is move one word backward

-- Alt C is capitalize word

-- Alt D is delete word forward

-- Alt E is go to end of sentence

-- Alt F is move one word forward

-- Alt G, G is go to line; Alt G, C is go to char in Emacs 
-- G goes to the next window in the hammerspoon window switcher
hs.hotkey.bind("alt", 'g', hs.window.switcher.nextWindow)

-- H is left, like in Vim
-- Alt H is mark paragraph in Emacs
hs.hotkey.bind("alt", 'h', function()
  hs.window.focusedWindow():focusWindowWest()
end)

-- Alt I inserts spaces or tabs to next defined tab-stop column in Emacs

-- J is down, like in Vim
-- Alt J breaks line at point and indents
hs.hotkey.bind("alt", 'j', function()
  hs.window.focusedWindow():focusWindowSouth()
end)

-- K is down, like in Vim
-- Alt K is delete to end of sentence in Emacs
hs.hotkey.bind("alt", 'k', function()
  hs.window.focusedWindow():focusWindowNorth()
end)

-- L is right, like in Vim
-- Alt L is lowercase to end of word in Emacs
hs.hotkey.bind("alt", 'l', function()
  hs.window.focusedWindow():focusWindowEast()
end)

-- M is for maximize (unminimize) windows for the focused app
-- Alt M is back to indentation in Emacs
hs.hotkey.bind("alt", 'm', function()
  local app = hs.application.frontmostApplication()
  for k, w in ipairs(app:allWindows()) do w:unminimize() end
end)

-- N is for next screen, like Ctrl N
-- Alt N is undefined in Emacs
hs.hotkey.bind("alt", 'n', function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():next(), true, true)
end)

-- Alt O is set face in Emacs

-- P is for previous screen, like Ctrl P
-- Alt P is undefined in Emacs
hs.hotkey.bind("alt", 'p', function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():previous(), true, true)
end)

-- Alt Q is fill/format paragraph in Emacs, like gq or gw in vim

-- Alt R positions the cursor at the center of window, then alternates between top, middle, bottom
-- Use Alt R to focus window toolbar (mnemonic: toolbaR, works a bit like Alt R in Emacs in that it jumps back and forth)

-- Alt S is search forward in Emacs
-- Use Alt S to focus status bar

-- Alt T is transpose words in Emacs

-- Alt U is uppercase word in Emacs

-- Alt V is page down in Emacs

-- Alt W saves the marked region in Emacs
-- Use Alt W to focus floating window

-- X is for eXpose
-- Alt X brings up a list of commands in Emacs
hs.hotkey.bind("alt", 'x', function()
  hs.expose.new():toggleShow()
end)

-- Alt Y rotates the kill ring (replaces last yank with previous kill) in Emacs

-- Alt Z is zap to char, same as dt in vim
-- Use Alt Z to focus Dock; mnemonic: z is below a (apple) and s (status menus)

local ctrl_alt = {"ctrl", "alt"}

-- Ctrl Alt B nudges the focused window to the left, Ctrl B = left
function nudgeLeft(d)
    return {
        x = d.x - 10,
        y = d.y,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind(ctrl_alt, 'b', function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeLeft(win:frame()))
end)

-- Ctrl Alt F nudges the focused window to the right, Ctrl F = right
function nudgeRight(d)
    return {
        x = d.x + 10,
        y = d.y,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind(ctrl_alt, 'f', function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeRight(win:frame()))
end)

-- Ctrl Alt N nudges the focused window downward, Ctrl N = down
function nudgeDown(d)
    return {
        x = d.x,
        y = d.y + 10,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind(ctrl_alt, 'n', function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeDown(win:frame()))
end)

-- Ctrl Alt P nudges the focused window upward, Ctrl P = up
function nudgeUp(d)
    return {
        x = d.x,
        y = d.y - 10,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind(ctrl_alt, 'p', function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeUp(win:frame()))
end)

----------------------------------------------------------------
-- APP-SPECIFIC WINDOW MANAGEMENT
----------------------------------------------------------------

local alt_shift = {"alt", "shift"}

-- Period brings up finder, . represents the current directory in UNIX file systems
-- Note: Alt Shift . is go to end of document in Emacs
-- In Vim, use G
-- In macOS, use Ctrl Command N instead of Alt Shift .
hs.hotkey.bind(alt_shift, '.', function()
    hs.application.launchOrFocus('Finder')
end)

-- Backtick brings up the console, like Ctrl ` in VS Code and GitHub Desktop
hs.hotkey.bind(alt_shift, '`', hs.toggleConsole)

-- A is for Adobe Acrobat (Use Preview instead of Adobe Acrobat)
hs.hotkey.bind(alt_shift, 'a', function()
    hs.application.launchOrFocus('Preview')
end)

-- Alt Shift B is select word backward

-- C is for VS Code
hs.hotkey.bind(alt_shift, 'c', function()
    hs.application.launchOrFocus('VSCodium')
end)

-- D is for DataSpell
hs.hotkey.bind(alt_shift, 'd', function()
    hs.application.launchOrFocus('JetBrains DataSpell')
end)

-- E is for Emacs, not Excel :)
hs.hotkey.bind(alt_shift, 'e', function()
    hs.application.launchOrFocus('Emacs')
end)

-- Alt Shift F is select word forward

-- G is for Google Chrome
hs.hotkey.bind(alt_shift, 'g', function()
    hs.application.launchOrFocus('Google Chrome')
end)

-- H is for Hammerspoon
hs.hotkey.bind(alt_shift, 'h', function()
    hs.application.launchOrFocus('Hammerspoon')
end)

-- I is for iTerm
hs.hotkey.bind(alt_shift, 'i', function()
    hs.application.launchOrFocus('iTerm')
end)

-- J is for JetBrains Toolbox
hs.hotkey.bind(alt_shift, 'j', function()
    hs.application.launchOrFocus('JetBrains Toolbox')
end)

-- K is for KeyCastr
hs.hotkey.bind(alt_shift, 'k', function()
    hs.application.launchOrFocus('KeyCastr')
end)

-- L is for Launchpad
hs.hotkey.bind(alt_shift, 'l', function()
    hs.application.launchOrFocus('Launchpad')
end)

-- M is for Mozilla Firefox
hs.hotkey.bind(alt_shift, 'm', function()
    hs.application.launchOrFocus('Firefox')
end)

-- O is for Outlook
hs.hotkey.bind(alt_shift, 'o', function()
  hs.application.launchOrFocus('Microsoft Outlook')
end)

-- P is for PyCharm
hs.hotkey.bind(alt_shift, 'p', function()
  hs.application.launchOrFocus('PyCharm Professional')
end)

-- Q is for CopyQ, as in queue
hs.hotkey.bind(alt_shift, 'q', function()
    hs.application.launchOrFocus('CopyQ')
end)

-- R is for RStudio
hs.hotkey.bind(alt_shift, 'r', function()
    hs.application.launchOrFocus('RStudio')
end)

-- S is for Slack
hs.hotkey.bind(alt_shift, 's', function()
    hs.application.launchOrFocus('Slack')
end)

-- T is for Teams
hs.hotkey.bind(alt_shift, 't', function()
    hs.application.launchOrFocus('Microsoft Teams')
end)

-- U is for Utilities, where the Activity Monitor is located
hs.hotkey.bind(alt_shift, 'u', function()
    hs.application.launchOrFocus('Activity Monitor')
end)

-- V is for VimR
hs.hotkey.bind(alt_shift, 'v', function()
    hs.application.launchOrFocus('VimR')
end)

-- W is for Word
hs.hotkey.bind(alt_shift, 'w', function()
    hs.application.launchOrFocus('Microsoft Word')
end)

-- X is for eXcel
hs.hotkey.bind(alt_shift, 'x', function()
    hs.application.launchOrFocus('Microsoft Excel')
end)

-- Y is for sYstem Preferences
hs.hotkey.bind(alt_shift, 'y', function()
    hs.application.launchOrFocus('System Preferences')
end)

-- Z is for Zoom
hs.hotkey.bind(alt_shift, 'z', function()
  hs.application.launchOrFocus('zoom.us')
  hs.window.focusedWindow():setFullScreen(false)
end)

----------------------------------------------------------------
-- CLIPBOARD MANAGEMENT
----------------------------------------------------------------

-- Y imitates typing while pasting, Y is for yank, like Ctrl Y in GNU Emacs and Readline
-- https://www.hammerspoon.org/go/#defeating-paste-blocking
hs.hotkey.bind(ctrl_alt, 'y', function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

----------------------------------------------------------------
-- Use menubar instead of terminal to disable system sleep
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

----------------------------------------------------------------
-- Disable all key bindings / Reload hammerspoon config
----------------------------------------------------------------

local hk = hs.hotkey.getHotkeys()

local hkEnabled = true

-- Alt Shift , goes to the top of the buffer in Emacs (mnemonic: go back)
hs.hotkey.bind(alt_shift, ',', function()
    if hkEnabled then
        for k, v in ipairs(hk) do v:disable() end
        hkEnabled = false
    else
        for k, v in ipairs(hk) do v:enable() end
        hkEnabled = true
    end
end)

-- Alt Shift Delete reloads the config
-- Delete is on the opposite side of the keyboard from Backtick
-- Alt Delete reduces indentation of lines to match a line above in Emacs
hs.hotkey.bind(alt_shift, 'delete', hs.reload)
