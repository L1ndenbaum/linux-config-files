hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})

hl.permission({
    binary = "/usr/bin/hyprlock",
    type = "screencopy",
    mode = "allow",
})
