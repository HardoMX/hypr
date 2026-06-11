require("monitors")
require("startup")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GDK_SCALE", "1")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XDG_SESSION_TYPE", "wayland")
-- hl.env("xcursor_theme", "Adwaita", "24")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,

        border_size = 1,

        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 7,

        active_opacity = 0.99,
        inactive_opacity = 0.9,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        dim_inactive = true,
        dim_strength = 0.05,

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            noise = 0.5,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    }
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "linear", style = "popin 80%" })

hl.config({
    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,

        enable_swallow = true,
        focus_on_activate = true,

        on_focus_under_fullscreen = 2,
    },
})


hl.config({
    input = {
        kb_layout = "se",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 2,
        accel_profile = "flat",

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
            scroll_factor = 0.15,
        },
    },
})

hl.device({
    name = "rgbkb-sol-3",
    kb_layout = "us",
    kb_variant = "intl",
})


hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})


hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*", },
})

hl.window_rule({
    name = "fix-wayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
})

hl.window_rule({
    name = "JuhRadial",
    match = {
        class = "^(JuhRadial MX)$",
        float = true,
        pin = true,
    },
    no_blur = true,
    border_size = 0,
    no_shadow = true,
    no_anim = true,
})

hl.window_rule({
    name = "kando",
    match = {
        class = "^(kando)$",
        float = true,
        pin = true
    },
    opaque = true,
    move = "0 0",
    rounding = 0,
    size = "100% 100%",
    border_size = 0,
    no_anim = true,
})

require("keybinds")
