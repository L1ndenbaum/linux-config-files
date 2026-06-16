hl.on("hyprland.start", function()
    hl.exec_cmd("echo 'Xft.dpi:144' | xrdb -merge")
end)

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})
