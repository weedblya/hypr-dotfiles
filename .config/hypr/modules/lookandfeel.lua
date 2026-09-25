local spacing = { gaps_in = 4, gaps_out = 8, border_size = 2 }

hl.config({
    general = {
        gaps_in = spacing.gaps_in,
        gaps_out = spacing.gaps_out,
        border_size = spacing.border_size,
        col = {
            active_border = { colors = { Colors.blue, Colors.mauve }, angle = 45 },
            inactive_border = Colors.surface0,
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        active_opacity = 1.0,
        inactive_opacity = 0.95,
        shadow = { enabled = true, range = 8, render_power = 2, color = "rgba(00000055)" },
        blur = { enabled = true, size = 4, passes = 2, vibrancy = 0.15 },
    },
    animations = { enabled = true },
    dwindle = { preserve_split = true },
})
