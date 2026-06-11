------------------
---- KEYBINDS ----
------------------

local terminal = "wezterm"
local fileManager = "thunar"
local menu = "walker"
local browser = "firefox-developer-edition"

hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + M",
    hl.dsp.exec_cmd("command -v hhyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))

-- Move focused with arrow keys
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- Switch and move workspace with 0-9
for i = 1, 10 do
    local key = i % 10 -- 0-key becomes 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (Scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


-- Scroll through workspaces
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move and resize windows with left/right click
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media bindings
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = true })

-- Volume
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q a 10%-"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q a 10%+"), { locked = true, repeating = true })

-- Extra bindings
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + V", hl.dsp.exec_cmd(menu .. " -m clipboard"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker --format=hex --autocopy"))
