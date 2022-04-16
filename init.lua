----------------------------------------------------------------
-- REQUIRE CMD Q TO BE PRESSED TO QUIT
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
-- GENERAL WINDOW MANAGEMENT SETUP
----------------------------------------------------------------

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

-- https://stackoverflow.com/a/58398311
function moveWindowToDisplay(d)
  return function()
    win = hs.window.focusedWindow()
    win:moveToScreen(hs.screen.allScreens()[d], true, true)
    centerMouseOnWindow(win)
  end
end

----------------------------------------------------------------
-- CTRL ONLY SHORTCUTS
----------------------------------------------------------------
-- The ctrl only bindings only affect the currently focused window
-- Mnemonic: only

-- https://github.com/miromannino/miro-windows-manager
hs.loadSpoon("MiroWindowsManager")

-- Ctrl Space ( ) alternates between maximized, 3/4 and 1/2 in the center
-- Ctrl Quote (') alternates between 1/2, 1/3, and 2/3 split at the top
-- Ctrl Forward slash (/) alternates between 1/2, 1/3, and 2/3 split at the bottom
-- Ctrl Open square bracket ([) alternates between 1/2, 1/3, and 2/3 split on the left
-- Ctrl Close square bracket (]) alternates between 1/2, 1/3, and 2/3 split on the right
-- Ctrl Space is switch input source in macOS, but I just want to stick to the undead layout
-- Ctrl Space is used for completion in IDEs, but this shows up automatically
-- ASCII characters 32, 39, 47, 91, 93
hs.window.animationDuration = 0 -- disable animations
spoon.MiroWindowsManager:bindHotkeys({
  fullscreen = {"ctrl", "space"}, -- Mnemonic: space is the widest key on the keyboard
  up = {"ctrl", "'"}, -- Mnemonic: " creates a horizontal split in tmux
  down = {"ctrl", "/"}, -- Mnemonic: the slash is falling down
  left = {"ctrl", "["},
  right = {"ctrl", "]"},
})

-- Ctrl Comma (,) shrinks the window horizontally
-- ASCII character 44
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

-- Ctrl Hyphen (-) shrinks the window horizontally
-- ASCII character 45
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

-- Ctrl Period (.) expands window horizontally
-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L368
-- ASCII character 46
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

-- Ctrl Zero (0) moves the current window to the next screen
-- Close Parentheses goes to next session in tmux
-- ASCII character 48
hs.hotkey.bind("ctrl", "0", function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():next(), true, true)
  centerMouseOnWindow(win)
end)

-- Ctrl and the numbers 1-4 move the current window to screen 1-4
-- This requires changing the "Switch to Desktop" shortcuts...
-- in System Preferences > Keyboard > Shortcuts > Mission Control
-- ASCII characters 49-52
hs.hotkey.bind("ctrl", "1", moveWindowToDisplay(1))
hs.hotkey.bind("ctrl", "2", moveWindowToDisplay(2))
hs.hotkey.bind("ctrl", "3", moveWindowToDisplay(3))
hs.hotkey.bind("ctrl", "4", moveWindowToDisplay(4))

-- Ctrl Nine (9) moves the current window to the previous screen
-- Open parentheses goes to previous session in tmux
-- ASCII character 57
hs.hotkey.bind("ctrl", "9", function()
  local win = hs.window.focusedWindow()
  win:setFullScreen(false)
  win:moveToScreen(win:screen():previous(), true, true)
  centerMouseOnWindow(win)
end)

-- Ctrl Equals (=) expands the window vertically
-- ASCII character 61
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

-- Ctrl Backslash (\) centers the window,
-- works great with [ and ] to create a triple vertical split
-- works great with / and ' to create a triple horizontal split
-- ASCII character 92
hs.hotkey.bind("ctrl", "\\", function()
  hs.window.focusedWindow():centerOnScreen(nil, true)
end)

-- The arrow keys move the current window
-- This requires changing the
-- - "Mission Control",
-- - "Application windows", and
-- - "Move left/right a space" shortcuts
-- in System Preferences > Keyboard > Shortcuts > Mission Control
-- I hate the macOS Spaces feature with the passion of infinite burning suns
-- Arrow keys have no ASCII code

-- Ctrl Left nudges the focused window to the left
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

-- Ctrl Right nudges the focused window to the right
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

-- Ctrl Down nudges the focused window downward
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

-- Ctrl Up nudges the focused window upward
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

----------------------------------------------------------------
-- ALT ONLY SHORTCUTS
----------------------------------------------------------------
-- The alt only bindings focus something other than the current window

-- Alt Quote goes to the previously focused window
-- like the last jump ('') mark in Vim
-- ASCII character 39
hs.hotkey.bind("alt", "'", function()
  local target = hs.window.filter.new():getWindows(hs.window.filter.sortByFocusedLast)[2]
  target:application():activate()
  target:focus()
  centerMouseOnWindow(target)
end)

function focusDisplay(d)
  return function()
    focusScreen(hs.screen.allScreens()[d])
  end
end

-- Alt Shift Comma (,) goes to the top of the buffer in Emacs
-- Alt Hyphen (- ) is begin negative argument in Emacs
-- Alt Period (.) is insert previous argument in bash / zsh
-- Note: Alt Shift Period (.) is go to end of document in Emacs
-- In Vim, use G
-- In macOS, use Ctrl Command N instead of Alt Shift .

-- Alt Forwardslash (/) is hippie completion in Emacs, analogous to omnicompletion in vim

-- Alt 0 brings focus to next display/screen
-- Close parentheses goes to next session in tmux
-- ASCII character 48
hs.hotkey.bind("alt", "0", function ()
  focusScreen(hs.window.focusedWindow():screen():next())
end)

-- Alt and the numbers 1-4 brings focus to screens 104
-- Alt 1 thru 0 (create and) switch to windows 1-10 in tmux
-- ASCII characters 49-52
hs.hotkey.bind("alt", "1", focusDisplay(1))
hs.hotkey.bind("alt", "2", focusDisplay(2))
hs.hotkey.bind("alt", "3", focusDisplay(3))
hs.hotkey.bind("alt", "4", focusDisplay(4))

-- Alt 9 brings focus to previous display/screen
-- Open parentheses goes to previous session in tmux
-- ASCII character 57
hs.hotkey.bind("alt", "9", function()
  focusScreen(hs.window.focusedWindow():screen():previous())
end)

-- Alt Semicolon (;) goes to the next window thanks to a shortcut set in System Preferences
-- ASCII character 46
-- This System Preferences shortcut also enables Alt Shift semicolon to go to the previous window
-- I used Karabiner to have Alt comma send Alt Shift semicolon, so I can switch back and forth
-- between windows using ; and , (similar to the vim motions repeat f, F, t, and T motions)
-- Thanks to other Karabiner keyboard modification, I can hold Tab or Backslash instead of Alt

-- Alt = (ASCII character 61) is count words in region in Emacs
-- Alt [ and Alt ] (ASCII character 91 and 93) are undefined

-- Alt Backtick (`) brings up the Hammerspoon console,
-- like Ctrl ` in VS Code and GitHub Desktop
-- Alt Backtick is used by Alt tab and needs to be unmapped
-- Alt `(ASCII character 96) runs the command tmm-menubar in Emacs
hs.hotkey.bind("alt", "`", function()
  hs.toggleConsole()
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Alt A is move to start of previous sentence in Emacs
-- Use Alt A to focus menu bar, Mnemonic: A is Apple
-- System Preferences > Keyboard > Shortcuts > Keyboard > Move focus to menu bar

-- Alt B is move one word backward in Emacs

-- Alt C is capitalize next word in Emacs

-- Alt D is delete next word in Emacs

-- Alt E is go to end of sentence in Emacs

-- Alt F is move one word forward in Emacs

-- Alt G launches or focuses Google Chrome
-- Alt G, G is go to line; Alt G, C is go to char in Emacs
hs.hotkey.bind("alt", "g", function()
  hs.application.launchOrFocus("Google Chrome")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Alt H shows Hammerspoon window hints
-- Alt H is mark paragraph in Emacs
hs.hotkey.bind("alt", "h", hs.hints.windowHints)

-- Alt I launches or focuses iTerm
-- Alt I inserts spaces or tabs to next defined tab-stop column in Emacs
hs.hotkey.bind("alt", "i", function()
  hs.application.launchOrFocus("iTerm")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Alt J breaks line at point and indents in Emacs

-- Use Alt K to toggle macOS keyboard access
-- System Preferences > Keyboard > Shortcuts > Keyboard > Turn keyboard access on or off
-- Alt K is delete to end of sentence in Emacs

-- Alt L is lowercase to end of word in Emacs

-- Alt M is for maximize (unminimize) windows for the focused app
-- Alt M is back to indentation in Emacs
hs.hotkey.bind("alt", "m", function()
  local app = hs.application.frontmostApplication()
  for k, w in ipairs(app:allWindows()) do w:unminimize() end
end)

-- Alt N goes to the next window in the Hammerspoon window switcher
-- Alt N is undefined in Emacs
hs.hotkey.bind("alt", "n", hs.window.switcher.nextWindow)

-- Alt O is for Outlook
-- Alt O is set face in Emacs
hs.hotkey.bind("alt", "o", function()
  hs.application.launchOrFocus("Microsoft Outlook")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Alt P goes to the next window in the Hammerspoon window switcher
-- Alt P is undefined in Emacs
hs.hotkey.bind("alt", "p", hs.window.switcher.previousWindow)

-- Alt Q is for CopyQ, as in queue
-- Alt Q is fill/format paragraph in Emacs, like gq or gw in vim
hs.hotkey.bind("alt", "q", function()
  hs.application.launchOrFocus("CopyQ")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Use Alt R to focus window toolbar (mnemonic: toolbaR, works a bit like Alt R in Emacs in that it jumps back and forth)
-- In Emacs, Alt R positions the cursor at the center of window, then alternates between top, middle, bottom

-- Use Alt S to focus status menus
-- Alt S is search forward in Emacs
-- System Preferences > Keyboard > Shortcuts > Keyboard > Move focus to status menus
-- Mnemonic: S is to the right of A on the keyboard

-- Alt T is transpose words in Emacs

-- Alt U is uppercase word in Emacs

-- Alt V launches or focuses VSCode
-- Alt V is page down in Emacs
hs.hotkey.bind("alt", "v", function()
  hs.application.launchOrFocus("Visual Studio Code")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Use Alt W to focus floating window
-- Alt W saves the marked region in Emacs

-- X is for eXpose
-- Alt X brings up a list of commands in Emacs
hs.hotkey.bind("alt", "x", function()
  hs.expose.new():toggleShow()
end)

-- Alt V launches or focuses System Preferences
-- Mnemonic: sYstem Preferences
-- Alt Y rotates the kill ring (replaces last yank with previous kill) in Emacs
hs.hotkey.bind("alt", "y", function()
  hs.application.launchOrFocus("System Preferences")
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Alt Z is zap to char, same as dt in vim
-- Use Alt Z to focus Dock; mnemonic: z is below a (apple) and s (status menus)

-- Alt Bar (|) deletes all spaces and tabs around cursor
-- ASCII character 124
-- https://github.com/Hammerspoon/hammerspoon/issues/2022#issuecomment-518754783

-- Alt Delete reduces indentation of lines to match a line above in Emacs
-- Alt Delete also deletes previous word in macOS
-- ASCII character 127

local ctrl_alt = {"ctrl", "alt"}

-- Alt Left and Ctrl Alt B should be synonymous
hs.hotkey.bind("alt", "left", function()
  hs.window.focusedWindow():focusWindowWest()
  centerMouseOnWindow(hs.window.focusedWindow())
end)
hs.hotkey.bind(ctrl_alt, "b", function()
  hs.window.focusedWindow():focusWindowWest()
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Alt Down and Ctrl Alt N should be synonymous
hs.hotkey.bind("alt", "down", function()
  hs.window.focusedWindow():focusWindowSouth()
  centerMouseOnWindow(hs.window.focusedWindow())
end)
hs.hotkey.bind(ctrl_alt, "n", function()
  hs.window.focusedWindow():focusWindowSouth()
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Alt Up and Ctrl Alt P should be synonymous
hs.hotkey.bind("alt", "up", function()
  hs.window.focusedWindow():focusWindowNorth()
  centerMouseOnWindow(hs.window.focusedWindow())
end)
hs.hotkey.bind(ctrl_alt, "up", function()
  hs.window.focusedWindow():focusWindowNorth()
  centerMouseOnWindow(hs.window.focusedWindow())
end)

-- Alt Up and Ctrl Alt F should be synonymous
hs.hotkey.bind("alt", "right", function()
  hs.window.focusedWindow():focusWindowEast()
  centerMouseOnWindow(hs.window.focusedWindow())
end)
hs.hotkey.bind(ctrl_alt, "f", function()
  hs.window.focusedWindow():focusWindowEast()
  centerMouseOnWindow(hs.window.focusedWindow())
end)

----------------------------------------------------------------
-- MISCELLANEOUS BINDINGS
----------------------------------------------------------------
-- Miscellaneous Bindings all use Ctrl Alt
-- CopyQ shortcuts, which also use Ctrl Alt, are described below

-- CLIPBOARD MANAGEMENT

-- Ctrl Alt C summons the CopyQ window
-- Ctrl Alt D pastes the today's ISO date
-- Ctrl Alt J pastes and copies next
-- Ctrl Alt K pastes and copies previous
-- Ctrl Alt S shows the CopyQ tray (mnemonic: show tray)
-- Ctrl Alt V edits the clipboard (mnemonic: vim)
-- Ctrl Alt X pastes as plain text (mnemonic: remove (x) formatting)

-- Y imitates typing while pasting, Y is for yank, like Ctrl Y in GNU Emacs and Readline
-- https://www.hammerspoon.org/go/#defeating-paste-blocking
hs.hotkey.bind(ctrl_alt, "y", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- RELOAD HAMMERSPOON CONFIG

-- Ctrl Alt R reloads the config
hs.hotkey.bind(ctrl_alt, "r", hs.reload)

-- TOGGLE SYSTEM SYSTEM

-- Use menubar instead of terminal to disable system sleep
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

-- DISABLE ALL KEY BINDINGS

local hk = hs.hotkey.getHotkeys()

local hkEnabled = true

-- Delete is on the opposite side of the keyboard from Backtick
hs.hotkey.bind(ctrl_alt, "delete", function()
    if hkEnabled then
        for k, v in ipairs(hk) do v:disable() end
        hkEnabled = false
    else
        for k, v in ipairs(hk) do v:enable() end
        hkEnabled = true
    end
end)
