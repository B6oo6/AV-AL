_G.Settings = {
        AimViewer = {
            ["Keybind"] = "p", -- keybind to turn on aim-viewer // default "p"
            ["Color"] = Color3.fromRGB(255,0,0), -- color of the beam // default 255,0,0 / red
            ["Target"] = 'v', -- choose target // aim at him with ur mouse // default "v"
    },
        AntiLock = {
            ["Keybind"] = "c", -- keybind to turn on anti-lock // default "c"
            ["X"] = 33, -- position X (settings for antilock) // default "33"
            ["Y"] = 33, -- position Y (settings for antilock) // default "33"
            ["Z"] = 33, -- position Z (settings for antilock) // default "33"
        }
    }
loadstring(game:HttpGet("https://raw.githubusercontent.com/B6oo6/AV-AL/main/main.lua"))()
