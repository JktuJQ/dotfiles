local mainMod = "SUPER"

hl.bind(mainMod .. "+ Q", hl.dsp.window.close())
hl.bind(mainMod .. "+ F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "+ Return", hl.dsp.exec_cmd(os.getenv("TERMINAL")))

for i = 1, 5 do
    local key = i % 10
    hl.bind(mainMod .. "+ " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. "+ left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. "+ right", hl.dsp.focus({ workspace = "r+1" }))
