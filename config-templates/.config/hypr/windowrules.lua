hl.window_rule({
    name = "fix-xwayland-drags",
    no_focus = true,
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
    name = "jetbrains-no-initial-focus",
    no_initial_focus = true,
    match = { class = "^(jetbrains-.*)$", title = "^win(.*)" },
})

hl.window_rule({
    name = "jetbrains-no-focus",
    no_focus = true,
    match = { class = "^(jetbrains-.*)$", title = "^win(.*)" },
})

hl.window_rule({
    name = "jetbrains-no-follow-mouse",
    no_follow_mouse = true,
    match = { class = "^(jetbrains-.*)$", title = "^win(.*)" },
})

local function float_rule(name, match)
    hl.window_rule({
        name = name,
        float = true,
        match = match,
    })
end

float_rule("float-waypaper", { class = "waypaper" })
float_rule("float-wlogout", { class = "wlogout" })
float_rule("float-blueman-manager", { class = "blueman-manager" })
float_rule("float-pavucontrol", { class = "org.pulseaudio.pavucontrol" })
float_rule("float-steam-friends", { class = "steam", title = "^(好友列表)$" })
float_rule("float-steam-settings", { class = "steam", title = "^(Steam\\s+设置)$" })
float_rule("float-thunar-lower", { class = "thunar" })
float_rule("float-thunar-upper", { class = "Thunar" })
float_rule("float-wechat-class", { class = "(wechat|微信)" })
float_rule("float-wechat-title", { title = "(WeChat|微信)" })
float_rule("float-wechat-official-accounts", { title = "(Official Accounts)" })
float_rule("float-google-signin", { title = "Sign in - Google Accounts" })
float_rule("float-ristretto", { class = "ristretto" })
