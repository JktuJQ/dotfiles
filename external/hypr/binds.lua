local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(os.getenv("TERMINAL")))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(os.getenv("BROWSER")))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(os.getenv("LAUNCHER")))

hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output --filename '%Y-%m-%d_%H-%M-%S.png'"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window --filename '%Y-%m-%d_%H-%M-%S.png'"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only --freeze"))

hl.bind(mainMod .. " + CTRL + SHIFT + ALT + Q", hl.dsp.exec_cmd("loginctl terminate-user " .. os.getenv("USER")))

for i = 1, 5 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "r+1" }))
