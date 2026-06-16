-- The previous Hyprlang config sourced
-- ~/.config/theme/hyprland-current-color-scheme.conf, but the active Hyprland
-- settings below already use direct color literals.

hl.config({
    general = {
        layout = "scrolling",
        gaps_in = 5,
        gaps_out = 5,
        col = {
            active_border = {
                colors = { "rgba(FF78C4ff)", "rgba(7CF7FFFF)" },
                angle = 45,
            },
            inactive_border = "rgba(243048ff)",
        },
    },

    decoration = {
        active_opacity = 0.90,
        inactive_opacity = 0.8,
        rounding = 12,
        rounding_power = 2,

        shadow = {
            enabled = true,
            range = 8,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 8,
            passes = 2,
            vibrancy = 0.4,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        direction = "right",
    },
})
