local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Teams = game:GetService("Teams")

-- / ROOTS
local ZONES = workspace.Zones
local MODULES = ServerStorage.Modules
local DOORS = workspace.Doors
local ASSETS = ServerStorage.Assets

-- / MODULES
local ZonesManager = require(MODULES.ZonesManager)

-- / MAIN
local Timeline = {}
Timeline.Config = {}
Timeline.Config.ZONE_NAME = "FrontDoor"

Timeline.Zone = ZONES:FindFirstChild(Timeline.Config.ZONE_NAME)
Timeline.SFX = Timeline.Zone:FindFirstChild("DoorSFX")

Timeline.Door = DOORS.Door
Timeline.OpenCFrame = DOORS.OpenDoor.CFrame
Timeline.CloseCFrame = DOORS.CloseDoor.CFrame

Timeline.Grandma = ASSETS.Models:FindFirstChild("Grandma")

function Timeline.Fire()
    Timeline.Grandma.Parent = workspace
    if Timeline.SFX.Playing == false then
        Timeline.SFX:Play()
    end

    Timeline.Door:PivotTo(Timeline.OpenCFrame)
end

return Timeline