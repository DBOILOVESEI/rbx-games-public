local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Teams = game:GetService("Teams")

-- / ROOTS
local ZONES = workspace.Zones
local MODULES = ServerStorage.Modules

-- / MODULES
local ZonesManager = require(MODULES.ZonesManager)

-- / MAIN
local Timeline = {}
Timeline.Config = {}
Timeline.Config.ZONE_NAME = "InsideDoor"

Timeline.Zone = ZONES:FindFirstChild(Timeline.Config.ZONE_NAME)
Timeline.SFX = Timeline.Zone:FindFirstChild("KnockSFX")

function Timeline.Fire()
    ZonesManager.LoadZone("InsideDoor")

    repeat
        task.wait()
    until 

    Timeline.Zone:GetAttribute("Arrived") == true
end

return Timeline