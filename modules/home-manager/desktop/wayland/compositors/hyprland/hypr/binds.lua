local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(os.getenv("TERMINAL")))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(os.getenv("BROWSER")))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(os.getenv("LAUNCHER")))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(os.getenv("FILE_MANAGER")))

hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + escape", hl.dsp.exec_cmd("wlogout"))

hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output"))

hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only --freeze"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })

hl.bind(mainMod .. " + CTRL + SHIFT + ALT + Q", hl.dsp.exec_cmd("loginctl terminate-user " .. os.getenv("USER")))

for i = 1, 5 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "r+1" }))
