local spaces = require("hs.spaces") -- https://github.com/asmagill/hs._asm.spaces

-- Switch alacritty
hs.hotkey.bind({'ctrl'}, 'space', function ()
  local BUNDLE_ID = 'org.alacritty' -- more accurate to avoid mismatching on browser titles
  function moveWindow(alacritty, space, mainScreen)
    -- move to main space
    local win = nil
    while win == nil do
      win = alacritty:mainWindow()
    end
    print("win="..tostring(win))
    print("space="..tostring(space))
    print("screen="..tostring(win:screen()))
    print("mainScr="..tostring(mainScreen))
    if win:isFullScreen() then
      hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    end
    winFrame = win:frame()
    scrFrame = mainScreen:fullFrame()
    winFrame.w = 1720 -- scrFrame.w
    winFrame.y = scrFrame.y
    winFrame.x = 860 -- :scrFrame.x
    print("winFrame="..tostring(winFrame))
    win:setFrame(winFrame, 0)
    print("win:frame=" .. tostring(win:frame()))
    spaces.moveWindowToSpace(win, space)
    if win:isFullScreen() then
      hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    end
    win:focus()
  end
  local alacritty = hs.application.get(BUNDLE_ID)
  if alacritty ~= nil and alacritty:isFrontmost() then
    alacritty:hide()
  else
    local space = spaces.activeSpaceOnScreen()
    local mainScreen = hs.screen.mainScreen()
    if alacritty == nil and hs.application.launchOrFocusByBundleID(BUNDLE_ID) then
      local appWatcher = nil
      print('create app watcher')
      appWatcher = hs.application.watcher.new(function(name, event, app)
        print('name='..name)
        print('event='..event)
        if event == hs.application.watcher.launched and app:bundleID() == BUNDLE_ID then
          app:hide()
          moveWindow(app, space, mainScreen)
          print("stop watcher")
          appWatcher:stop()
        end
      end)
      print('start watcher')
      appWatcher:start()
    end
    if alacritty ~= nil then
      moveWindow(alacritty, space, mainScreen)
    end
  end
end)

-- like spotify

function likespotify()
hs.spotify.displayCurrentTrack()
end
hs.hotkey.bind({"cmd","alt","shift"}, "S", likespotify)


local playlist = "https://youtube.com/playlist?list=PLQ66M6mLucVlcfYm3IwV5zmMe262emMuZ&si=w-rJLsIi8a-FdJsP"

hs.hotkey.bind({"ctrl", "alt"}, "m", function()
  local task = hs.task.new("/opt/homebrew/bin/mpv", 
  nil,
  {
    "--no-video",
    "--force-window=no",
    "--msg-color=no",
    playlist
  })
  
  -- Fix PATH for yt-dlp (gets Hammerspoon env and adds Homebrew)
  local env = task:environment()
  env.PATH = "/opt/homebrew/bin:" .. (env.PATH or "")
  task:setEnvironment(env)
  
  task:start()
end)


local mpvBundleID = "io.mpv"

local function sendToMpv(key)
  local app = hs.application.get(mpvBundleID)
  if not app then return end
  app:activate()
  hs.eventtap.keyStroke({}, key, 0, app)
end

-- Play / pause
hs.hotkey.bind({"ctrl", "alt"}, "p", function()
  sendToMpv("space")   -- mpv default: toggle pause
end)

-- Next in playlist
hs.hotkey.bind({"ctrl", "alt"}, "right", function()
  sendToMpv(".")       -- or ">" depending on your layout
end)

-- Previous in playlist
hs.hotkey.bind({"ctrl", "alt"}, "left", function()
  sendToMpv(",")       -- or "<"
end)