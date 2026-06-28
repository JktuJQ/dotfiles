local mainMod = "SUPER"
local function key(keys)
    if type(keys) == "table" then
        return table.concat(keys, " + ")
    end
    return keys
end

local monitor = 0

hl.bind(key({mainMod, "TAB"}), function()
    monitor = (monitor + 1) % 2
end)

for i = 1, 5 do
    local num = i
    hl.bind(key({mainMod, tostring(num)}), function()
        hl.dispatch(hl.dsp.focus({ workspace = num + 5 * monitor }))
    end)
    hl.bind(key({mainMod, "SHIFT", tostring(num)}), function()
        hl.dispatch(hl.dsp.window.move({ workspace = num + 5 * monitor }))
    end)
    hl.bind(key({mainMod, "SHIFT", "TAB", tostring(num)}), function()
        local other = (monitor + 1) % 2
        hl.dispatch(hl.dsp.window.move({ workspace = num + 5 * other }))
    end)
end

hl.bind(key({mainMod, "Q"}), hl.dsp.window.close())
hl.bind(key({mainMod, "SHIFT", "Q"}), hl.dsp.window.kill())
hl.bind(key({mainMod, "F"}), hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(key({mainMod, "V"}), hl.dsp.window.float({ action = "toggle" }))

hl.bind(key({mainMod, "mouse:272"}), hl.dsp.window.drag(), { mouse = true })
hl.bind(key({mainMod, "mouse:273"}), hl.dsp.window.resize(), { mouse = true })

hl.bind(key({mainMod, "h"}), hl.dsp.focus({ direction = "l" }))
hl.bind(key({mainMod, "l"}), hl.dsp.focus({ direction = "r" }))
hl.bind(key({mainMod, "k"}), hl.dsp.focus({ direction = "u" }))
hl.bind(key({mainMod, "j"}), hl.dsp.focus({ direction = "d" }))

hl.bind(key({mainMod, "SHIFT", "h"}), hl.dsp.window.move({ direction = "l" }))
hl.bind(key({mainMod, "SHIFT", "l"}), hl.dsp.window.move({ direction = "r" }))
hl.bind(key({mainMod, "SHIFT", "k"}), hl.dsp.window.move({ direction = "u" }))
hl.bind(key({mainMod, "SHIFT", "j"}), hl.dsp.window.move({ direction = "d" }))

hl.bind(key({mainMod, "ALT", "h"}), hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(key({mainMod, "ALT", "l"}), hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(key({mainMod, "ALT", "k"}), hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(key({mainMod, "ALT", "j"}), hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

hl.bind(key({mainMod, "T"}), hl.dsp.exec_cmd(os.getenv("TERMINAL")))
hl.bind(key({mainMod, "B"}), hl.dsp.exec_cmd(os.getenv("BROWSER")))
hl.bind(key({mainMod, "SPACE"}), hl.dsp.exec_cmd(os.getenv("LAUNCHER")))
hl.bind(key({mainMod, "E"}), hl.dsp.exec_cmd(os.getenv("FILE_MANAGER")))

hl.bind(key({mainMod, "escape"}), hl.dsp.exec_cmd("wlogout"))
hl.bind(key({mainMod, "CTRL", "SHIFT", "ALT", "Q"}), hl.dsp.exec_cmd("loginctl terminate-user " .. os.getenv("USER")))

hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(key({mainMod, "Print"}), hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(key({mainMod, "SHIFT", "S"}), hl.dsp.exec_cmd("hyprshot -m region --clipboard-only --freeze"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })

for i = 1, 5 do
    hl.workspace_rule({ workspace = i, monitor = "eDP-1" })
    hl.workspace_rule({ workspace = i + 5, monitor = "HDMI-A-1" })
end

hl.bind(key({mainMod, "left"}), hl.dsp.focus({ workspace = "r-1" }))
hl.bind(key({mainMod, "right"}), hl.dsp.focus({ workspace = "r+1" }))
