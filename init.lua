--- Applications
-- Run Safari
hs.hotkey.bind({"ctrl", "alt"}, "S", function()
    hs.application.launchOrFocus("Safari")
end)

-- Run Emacs
hs.hotkey.bind({"ctrl", "alt"}, "E", function()
    hs.application.launchOrFocus("Emacs")
end)

-- Run iTerm
hs.hotkey.bind({"ctrl", "alt"}, "R", function()
    hs.application.launchOrFocus("iTerm")
end)

-- Run Mail
hs.hotkey.bind({"ctrl", "alt"}, "M", function()
    hs.application.launchOrFocus("Mail")
end)

-- Run OmniFocus
hs.hotkey.bind({"ctrl", "alt"}, "T", function()
    hs.application.launchOrFocus("OmniFocus")
end)

-- Run Chrome
hs.hotkey.bind({"ctrl", "alt"}, "C", function()
    hs.application.launchOrFocus("Google Chrome Canary")
end)

-- Run Slack
hs.hotkey.bind({"ctrl", "alt"}, "L", function()
    hs.application.launchOrFocus("Slack")
end)

-- Run Messages
hs.hotkey.bind({"ctrl", "alt"}, "Z", function()
    hs.application.launchOrFocus("Messages")
end)


--- Actions
-- Helper for pasting
function delayedPaste()
  hs.timer.doAfter(0.2, function()
                     hs.eventtap.keyStroke({"cmd"}, "V")
                     hs.eventtap.keyStroke({}, "return")
  end)
end

-- Search highlited in new Safari tab
hs.hotkey.bind({"ctrl", "alt"}, "G", function()
    hs.eventtap.keyStroke({"cmd"}, "C")
    hs.application.launchOrFocus("Safari")
    hs.eventtap.keyStroke({"cmd"}, "T")
    hs.eventtap.keyStroke({"cmd"}, "L")
    delayedPaste()
end)

-- Search highlited in new Safari tab c:in CLJ doc
hs.hotkey.bind({"ctrl", "alt", "cmd", }, "L", function()
    hs.eventtap.keyStroke({"cmd"}, "C")
    hs.application.launchOrFocus("Safari")
    hs.eventtap.keyStroke({"cmd"}, "š")
    hs.eventtap.keyStroke({"ctrl"}, "S")
    delayedPaste()
end)

-- Add highlited to OmniFocus
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "T", function()
    hs.eventtap.keyStroke({"cmd"}, "C")
    hs.eventtap.keyStroke({"alt"}, "space")
    delayedPaste()
end)

-- Lock screen
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "L", function()
    hs.caffeinate.lockScreen()
end)

-- Tea notification
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "C", function()
    hs.alert.show(" tea", 0.5)
    hs.timer.doAfter(120, function() hs.notify.new({title="Zen", informativeText="~~~ tea is ready ~~~"}):send()
    end)
end)

-- Open Mixcloud page
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "M", function()
    hs.application.launchOrFocus("Safari")
    hs.eventtap.keyStroke({"cmd"}, "+")
end)

-- Pause/Unpause Mixcloud page
hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "M", function()
    hs.application.launchOrFocus("Safari")
    hs.eventtap.keyStroke({"cmd"}, "+")
    hs.eventtap.keyStroke({""}, "space")
end)

-- Config reloading
function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- Search type
-- TODO finish for Google clojure docs
function searchChooser()
  local query 
  local choices = {
    {
      ["text"] = "First Choice",
      ["subText"] = "This is the subtext of the first choice",
      ["uuid"] = "0001"
    },
    {
      ["text"] = "First Choice",
      ["subText"] = "This is the subtext of the first choice",
      ["uuid"] = "0001"
    }
  }
  local chooser = hs.chooser.new(
    function(res)
    end
  )
end
