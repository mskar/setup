----------------------------------------------------------------
-- Press Cmd+Q twice to quit
----------------------------------------------------------------

-- https://github.com/pqrs-org/Karabiner-Elements/issues/242#issuecomment-277330358

local quitModal = hs.hotkey.modal.new("cmd", "q")

function quitModal:entered()
    hs.alert.show("Press Cmd+Q again to quit", 1)
    hs.timer.doAfter(1, function() quitModal:exit() end)
end

local function doQuit()
    local app = hs.application.frontmostApplication()
    app:kill()
end

quitModal:bind("cmd", "q", doQuit)

quitModal:bind("", "escape", function() quitModal:exit() end)

----------------------------------------------------------------
-- GENERAL WINDOW MANAGEMENT
----------------------------------------------------------------

-- The following shortcuts interfere with some no-so-important tmux and emacs bindings (described in init.lua)
-- To use all tmux and emacs bindings, use `Alt Shift ,` to toggle all of the bindings set in this file

-- http://bezhermoso.github.io/2016/01/20/making-perfect-ramen-lua-os-x-automation-with-hammerspoon#cycle-displays
-- DISPLAY FOCUS SWITCHING --

--One hotkey should just suffice for dual-display setups as it will naturally
--cycle through both.
--A second hotkey to reverse the direction of the focus-shift would be handy
--for setups with 3 or more displays.

--Predicate that checks if a window belongs to a screen
function isInScreen(screen, win)
  return win:screen() == screen
end

function centerMouseOnScreen(screen)
  local pt = hs.geometry.rectMidPoint(screen:fullFrame())
  hs.mouse.absolutePosition(pt)
end

function centerMouseOnWindow(window)
  local pt = hs.geometry.rectMidPoint(window:frame())
  hs.mouse.absolutePosition(pt)
end

-- Brings focus to the screen by setting focus on the front-most application in it.
-- Also move the mouse cursor to the center of the screen. This is because
-- Mission Control gestures & keyboard shortcuts are anchored, oddly, on where the
-- mouse is focused.
function focusScreen(screen)
  --Get windows within screen, ordered from front to back.
  --If no windows exist, bring focus to desktop. Otherwise, set focus on
  --front-most application window.
  local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
  windowToFocus:focus()
  centerMouseOnWindow(windowToFocus)
end

-- END DISPLAY FOCUS SWITCHING --

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

-- CTRL ONLY SHORTCUTS
-- The ctrl only bindings only affects the currently focused window
-- Mnemonic: only

-- Spacebar makes the focused window fullscreen, because spacebar is the widest key on the keyboard
-- https://github.com/miromannino/miro-windows-manager
hs.loadSpoon("MiroWindowsManager")

-- Ctrl Space is switch input source in macOS, but I just want to stick to the undead layout
-- Ctrl Space is used for completion in IDEs
hs.window.animationDuration = 0 -- disable animations
spoon.MiroWindowsManager:bindHotkeys({
  fullscreen = {"ctrl", "space"},
  down = {"ctrl", "/"}, -- Mnemonic: the slash is falling down
  up = {"ctrl", "'"}, -- Mnemonic: " creates a horizontal split in tmux
  left = {"ctrl", "["},
  right = {"ctrl", "]"},
})

-- The numbers 1 through 4 move the current window to screens 1 through 4
-- This requires changing the "Switch to Desktop" shortcuts...
-- in System Preferences > Keyboard > Shortcuts > Mission Control
-- https://stackoverflow.com/a/58398311
function moveWindowToDisplay(d)
  return function()
    win = hs.window.focusedWindow()
    win:moveToScreen(hs.screen.allScreens()[d], true, true)
    centerMouseOnWindow(win)
  end
end

hs.hotkey.bind("ctrl", "1", moveWindowToDisplay(1))
hs.hotkey.bind("ctrl", "2", moveWindowToDisplay(2))
hs.hotkey.bind("ctrl", "3", moveWindowToDisplay(3))
hs.hotkey.bind("ctrl", "4", moveWindowToDisplay(4))

-- Open parentheses goes to previous session in tmux
hs.hotkey.bind("ctrl", "9", function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():previous(), true, true)
  centerMouseOnWindow(win)
end)

-- Close parentheses goes to next session in tmux
hs.hotkey.bind("ctrl", "0", function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():next(), true, true)
  centerMouseOnWindow(win)
end)

-- Slash (/) centers the window, works great with < and > to create a triple vertical split
hs.hotkey.bind("ctrl", "\\", function()
  hs.window.focusedWindow():centerOnScreen(nil, true)
end)

-- Expands window horizontally
-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L368
hs.hotkey.bind("ctrl", ".", function()
  local win = hs.window.focusedWindow()
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = math.max(cw[1]-0.04,0) -- x
  move_to_rect[3] = math.min(cw[3]+0.04,1 - move_to_rect[1]) -- w
  move_to_rect[2] = cw[2]
  move_to_rect[4] = cw[4]
  win:move(move_to_rect)
end)

-- Shrinks the window horizontally
-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L392
hs.hotkey.bind("ctrl", ",", function()
  local win = hs.window.focusedWindow()
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1] == 0 and 0 or math.min(cw[1]+0.04,1) -- x
  move_to_rect[2] = cw[2]
  move_to_rect[3] = cw[1] + cw[3] > 0.99 and 1 or math.max(cw[3]-0.04,0.1) -- w
  move_to_rect[4] = cw[4]
  win:move(move_to_rect)
end)

-- Expands the window vertically
hs.hotkey.bind("ctrl", "=", function()
  local win = hs.window.focusedWindow()
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1]
  move_to_rect[2] = math.max(cw[2]-0.04,0) -- y
  move_to_rect[3] = cw[3]
  move_to_rect[4] = math.min(cw[4]+0.04,1 - move_to_rect[2]) -- h
  win:move(move_to_rect)
end)

-- Shrinks the window horizontally
hs.hotkey.bind("ctrl", "-", function()
  local win = hs.window.focusedWindow()
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1]
  move_to_rect[2] = cw[2] == 0 and 0 or math.min(cw[2]+0.04,1)
  move_to_rect[3] = cw[3]
  move_to_rect[4] = cw[2] + cw[4] > 0.99 and 1 or math.max(cw[4]-0.04,0.1) -- some windows (MacVim) don't size to 1
  win:move(move_to_rect)
end)

-- The arrow keys move the current window
-- This requires changing the
-- - "Mission Control",
-- - "Application windows", and
-- - "Move left/right a space" shortcuts
-- in System Preferences > Keyboard > Shortcuts > Mission Control
-- I hate the macOS Spaces feature with the passion of infinite burning suns

-- Ctrl left nudges the focused window to the left
function nudgeLeft(d)
    return {
        x = d.x - 40,
        y = d.y,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind("ctrl", "left", function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeLeft(win:frame()))
end)

-- Ctrl right nudges the focused window to the right
function nudgeRight(d)
    return {
        x = d.x + 40,
        y = d.y,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind("ctrl", "right", function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeRight(win:frame()))
end)

-- Ctrl down nudges the focused window downward
function nudgeDown(d)
    return {
        x = d.x,
        y = d.y + 40,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind("ctrl", "down", function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeDown(win:frame()))
end)

-- Ctrl up nudges the focused window upward
function nudgeUp(d)
    return {
        x = d.x,
        y = d.y - 40,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind("ctrl", "up", function()
  win = hs.window.focusedWindow()
  win:setFrame(nudgeUp(win:frame()))
end)

-- ALT SHORTCUTS

-- Alt 1 thru 0 create windows 1-10 in tmux
-- Alt - is begin negative argument in Emacs
-- Alt = is count words in region in Emacs
-- Alt [ and Alt ] are undefined

-- Alt semicolon goes to the next window thanks to a shortcut set in System Preferences
-- This System Preferences shortcut also enables Alt Shift semicolon to go to the previous window
-- I used Karabiner to have Alt comma send Alt Shift semicolon, so I can switch back and forth
-- between windows using ; and , (similar to the vim motions repeat f, F, t, and T motions)
-- Thanks to another Karabiner keyboard modification, I can hold Tab instead of Alt

-- Alt / is hippie completion in Emacs, analogous to omnicompletion in vim

-- Alt | deletes all spaces and tabs around cursor
-- https://github.com/Hammerspoon/hammerspoon/issues/2022#issuecomment-518754783

-- Alt Delete reduces indentation of lines to match a line above in Emacs
-- Alt Delete also deletes previous word in macOS

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

-- H is left, like in Vim
-- Alt H is mark paragraph in Emacs

-- Alt I inserts spaces or tabs to next defined tab-stop column in Emacs

-- J is down, like in Vim
-- Alt J breaks line at point and indents

-- K is down, like in Vim
-- Alt K is delete to end of sentence in Emacs

-- L is right, like in Vim
-- Alt L is lowercase to end of word in Emacs

-- Alt M is back to indentation in Emacs

-- Alt N is undefined in Emacs

-- Alt O is set face in Emacs

-- Alt P is undefined in Emacs
-- Use Alt Shift Space for Alfred

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

-- Alt X brings up a list of commands in Emacs

-- Alt Y rotates the kill ring (replaces last yank with previous kill) in Emacs

-- Alt Z is zap to char, same as dt in vim
-- Use Alt Z to focus Dock; mnemonic: z is below a (apple) and s (status menus)

-- Alt Delete reduces indentation of lines to match a line above in Emacs

-- Alt Shift , goes to the top of the buffer in Emacs (mnemonic: go back)

----------------------------------------------------------------
-- APP-SPECIFIC WINDOW MANAGEMENT
----------------------------------------------------------------

-- CTRL SHIFT SHORTCUTS
-- The ctrl shift bindings shifts focus another window
-- Mnemonic: shift focus

local ctrl_shift = {"ctrl", "shift"}

-- Quote goes to the previously focused window, like the last jump ('') mark in Vim
hs.hotkey.bind(ctrl_shift, "'", function()
  local target = hs.window.filter.new():getWindows(hs.window.filter.sortByFocusedLast)[2]
  target:application():activate()
  target:focus()
  centerMouseOnWindow(target)
end)

-- G goes to the next window in the hammerspoon window switcher
hs.hotkey.bind(ctrl_shift, "g", hs.window.switcher.nextWindow)
-- Slash shows window hints, / is search in Vim
hs.hotkey.bind(ctrl_shift, "/", hs.hints.windowHints)

function focusDisplay(d)
  return function()
    focusScreen(hs.screen.allScreens()[d])
  end
end

hs.hotkey.bind(ctrl_shift, "1", focusDisplay(1))
hs.hotkey.bind(ctrl_shift, "2", focusDisplay(2))
hs.hotkey.bind(ctrl_shift, "3", focusDisplay(3))
hs.hotkey.bind(ctrl_shift, "4", focusDisplay(4))

-- Ctrl Shift 9 brings focus to previous display/screen
-- Open parentheses goes to previous session in tmux
hs.hotkey.bind(ctrl_shift, "9", function()
  focusScreen(hs.window.focusedWindow():screen():previous())
end)

-- Ctrl Shift 0 brings focus to next display/screen
-- Close parentheses goes to next session in tmux
hs.hotkey.bind(ctrl_shift, "0", function ()
  focusScreen(hs.window.focusedWindow():screen():next())
end)

-- Period brings up finder, . represents the current directory in UNIX file systems
-- Note: Alt Shift . is go to end of document in Emacs
-- In Vim, use G
-- In macOS, use Ctrl Command N instead of Alt Shift .
hs.hotkey.bind(ctrl_shift, ".", function()
  hs.application.launchOrFocus("Finder")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Backtick brings up the console, like Ctrl ` in VS Code and GitHub Desktop
hs.hotkey.bind(ctrl_shift, "`", function()
  hs.toggleConsole()
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- A is for Adobe Acrobat (Use Preview instead of Adobe Acrobat)
hs.hotkey.bind(ctrl_shift, "a", function()
  hs.application.launchOrFocus("Preview")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Ctrl Shift B is select character backward
-- Alt Shift B is select word backward

-- C is for VS Code
hs.hotkey.bind(ctrl_shift, "c", function()
  hs.application.launchOrFocus("Visual Studio Code")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- D is for DataSpell
hs.hotkey.bind(ctrl_shift, "d", function()
  hs.application.launchOrFocus("DataSpell")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- E is for Emacs, not Excel :)
hs.hotkey.bind(ctrl_shift, "e", function()
  hs.application.launchOrFocus("Emacs")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Alt Shift F is select word forward
-- Ctrl Shift F is select character forward

-- G is for Google Chrome
hs.hotkey.bind(ctrl_shift, "g", function()
  hs.application.launchOrFocus("Google Chrome")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

hs.hotkey.bind(ctrl_shift, "h", function()
  hs.window.focusedWindow():focusWindowWest()
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- I is for Terminal
hs.hotkey.bind(ctrl_shift, "i", function()
  hs.application.launchOrFocus("iTerm")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

hs.hotkey.bind(ctrl_shift, "j", function()
  hs.window.focusedWindow():focusWindowSouth()
  centerMouseOnWindow(hs.window.focusedWindow())
end)
hs.hotkey.bind(ctrl_shift, "k", function()
  hs.window.focusedWindow():focusWindowNorth()
  centerMouseOnWindow(hs.window.focusedWindow())
end)
hs.hotkey.bind(ctrl_shift, "l", function()
  hs.window.focusedWindow():focusWindowEast()
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- M is for Mozilla Firefox
hs.hotkey.bind(ctrl_shift, "m", function()
  hs.application.launchOrFocus("Firefox")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- O is for Outlook
hs.hotkey.bind(ctrl_shift, "o", function()
  hs.application.launchOrFocus("Microsoft Outlook")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- P is for PyCharm
hs.hotkey.bind(ctrl_shift, "p", function()
  hs.application.launchOrFocus("PyCharm Professional")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Q is for CopyQ, as in queue
hs.hotkey.bind(ctrl_shift, "q", function()
  hs.application.launchOrFocus("CopyQ")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- R is for RStudio
hs.hotkey.bind(ctrl_shift, "r", function()
  hs.application.launchOrFocus("RStudio")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- S is for Slack
hs.hotkey.bind(ctrl_shift, "s", function()
  hs.application.launchOrFocus("Slack")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- T is for Terminal
hs.hotkey.bind(ctrl_shift, "t", function()
  hs.application.launchOrFocus("Terminal")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- U is for unminimize windows for the focused app
hs.hotkey.bind(ctrl_shift, "u", function()
  local app = hs.application.frontmostApplication()
  for k, w in ipairs(app:allWindows()) do w:unminimize() end
end)

-- V is for VimR
hs.hotkey.bind(ctrl_shift, "v", function()
  hs.application.launchOrFocus("VimR")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- W is for Word
hs.hotkey.bind(ctrl_shift, "w", function()
  hs.application.launchOrFocus("WebStorm")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- X is for eXpose
hs.hotkey.bind(ctrl_shift, "x", function()
  hs.expose.new():toggleShow()
end)

-- Y is for sYstem Preferences
hs.hotkey.bind(ctrl_shift, "y", function()
  hs.application.launchOrFocus("System Preferences")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Z is for Zoom
hs.hotkey.bind(ctrl_shift, "z", function()
  hs.application.launchOrFocus("zoom.us")
  hs.window.focusedWindow():setFullScreen(false)
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- MISCELLANEOUS BINDINGS
-- Use Ctrl Alt, but it could be something else

local ctrl_alt = {"ctrl", "alt"}

----------------------------------------------------------------
-- CLIPBOARD MANAGEMENT
----------------------------------------------------------------

-- Y imitates typing while pasting, Y is for yank, like Ctrl Y in GNU Emacs and Readline
-- https://www.hammerspoon.org/go/#defeating-paste-blocking
hs.hotkey.bind(ctrl_alt, "y", function()
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

hs.hotkey.bind(ctrl_alt, "z", caffeineClicked)

----------------------------------------------------------------
-- Disable all key bindings / Reload hammerspoon config
----------------------------------------------------------------

local hk = hs.hotkey.getHotkeys()

local hkEnabled = true

hs.hotkey.bind(ctrl_alt, ",", function()
    if hkEnabled then
        for k, v in ipairs(hk) do v:disable() end
        hkEnabled = false
    else
        for k, v in ipairs(hk) do v:enable() end
        hkEnabled = true
    end
end)

-- Ctrl Alt R reloads the config
-- Delete is on the opposite side of the keyboard from Backtick
hs.hotkey.bind(ctrl_alt, "r", hs.reload)
