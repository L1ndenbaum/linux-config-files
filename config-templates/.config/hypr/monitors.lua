local internal = "eDP-1"
local internal_spec = {
    output = internal,
    mode = "2560x1600@165",
    position = "auto",
    scale = 1.6,
}

local default_spec = {
    output = "",
    mode = "highres@highrr",
    position = "auto",
    scale = "auto",
}

local external_spec = {
    output = "DP-2",
    mode = "highres@highrr",
    position = "0x0",
    scale = 1.6,
    bitdepth = 10,
    cm = "srgb",
}

hl.monitor(default_spec)
hl.monitor(external_spec)

local pending_timer = nil

local function has_external_monitor()
    for _, monitor in ipairs(hl.get_monitors()) do
        if monitor.name ~= internal then
            return true
        end
    end

    return false
end

local function apply_internal_monitor_policy()
    if has_external_monitor() then
        hl.monitor({
            output = internal,
            disabled = true,
        })
    else
        hl.monitor(internal_spec)
    end
end

local function schedule_internal_monitor_policy()
    if pending_timer ~= nil then
        return
    end

    pending_timer = hl.timer(function()
        pending_timer = nil
        apply_internal_monitor_policy()
    end, {
        timeout = 250,
        type = "oneshot",
    })
end

hl.on("hyprland.start", schedule_internal_monitor_policy)
hl.on("monitor.added", schedule_internal_monitor_policy)
hl.on("monitor.removed", schedule_internal_monitor_policy)
schedule_internal_monitor_policy()
