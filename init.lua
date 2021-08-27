--  Copyright (c) 2017-2020 Ag Ibragimov & Contributors
--
--  Author: Ag Ibragimov <agzam.ibragimov@gmail.com>
--
--  Contributors:
--      Jay Zawrotny <jayzawrotny@gmail.com>
--
--  URL: https://github.com/agzam/spacehammer
--
--  License: MIT
--


hs.alert.show("Spacehammer config loaded")

-- Support upcoming 5.4 release and also use luarocks' local path
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.luarocks/share/lua/5.4/?.lua;" .. os.getenv("HOME") .. "/.luarocks/share/lua/5.4/?/init.lua"
package.cpath = package.cpath .. ";" .. os.getenv("HOME") .. "/.luarocks/lib/lua/5.4/?.so"
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.luarocks/share/lua/5.3/?.lua;" .. os.getenv("HOME") .. "/.luarocks/share/lua/5.3/?/init.lua"
package.cpath = package.cpath .. ";" .. os.getenv("HOME") .. "/.luarocks/lib/lua/5.3/?.so"

fennel = require("fennel")
table.insert(package.loaders or package.searchers, fennel.searcher)

require "core"
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

hs.hotkey.bind(shift_alt, 'a', function()
    hs.application.launchOrFocus('Adobe Acrobat Reader DC')
end)

-- alt shift b is select word backward

hs.hotkey.bind(shift_alt, 'c', hs.toggleConsole)

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

hs.hotkey.bind(shift_alt, 'o', function()
    hs.application.launchOrFocus('Microsoft Outlook')
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

hs.hotkey.bind(shift_alt, 's', function()
    hs.application.launchOrFocus('Safari')
end)

hs.hotkey.bind(shift_alt, 't', function()
    hs.application.launchOrFocus('Terminal')
end)

hs.hotkey.bind(shift_alt, 'u', function()
  local app = hs.application.frontmostApplication()
  for k, w in ipairs(app:allWindows()) do w:unminimize() end
end)

hs.hotkey.bind(shift_alt, 'v', function()
    hs.application.launchOrFocus('VSCodium')
end)

hs.hotkey.bind(shift_alt, 'w', function()
    hs.application.launchOrFocus('Microsoft Word')
end)

hs.hotkey.bind(shift_alt, 'x', function()
  local expose = hs.expose.new()
  expose:toggleShow()
end)

-- https://www.hammerspoon.org/go/#defeating-paste-blocking
hs.hotkey.bind(shift_alt, 'y', function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

hs.hotkey.bind(shift_alt, 'z', function()
    hs.application.launchOrFocus('zoom.us')
end)

hs.hotkey.bind(shift_alt, '/', function()
  hs.hints.windowHints()
end)

hs.hotkey.bind(shift_alt, ';', function()
  hs.window.switcher.nextWindow()
end)

hs.hotkey.bind(shift_alt, ',', function()
  hs.window.switcher.previousWindow()
end)

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
