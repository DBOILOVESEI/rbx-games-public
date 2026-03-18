local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- / ROOTS
local ZONES = workspace.Zones

-- / GLOBALS
local FrontDoorZone = ZONES:FindFirstChild("FrontDoor")

-- / MAIN
local Timeline = {}

function Timeline.Fire()
    repeat
        task.wait(1)
    until FrontDoorZone:GetAttribute("Arrived") == true
end

return Timeline