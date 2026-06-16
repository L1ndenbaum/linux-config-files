-- Hyprland 0.55+ native Lua config entrypoint.
--
-- Keep modules in the same order as the previous hyprland.conf sources so the
-- effective behavior stays predictable.

require("monitors")
require("xwayland")
require("programs")
require("autostarts")
require("envvariables")
require("permissions")
require("appearance")
require("animation")
require("misc")
require("input")
require("keybindings")
require("windowrules")
require("layerrules")
