local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")

-- / ROOTS
local ZONES = workspace.Zones

-- / MAIN
local Zone = {}
Zone.Name = "FrontDoor"
Zone.CollisionGroup = "Zone"

Zone.LastDamage = 0
Zone.Config = {}

function Zone.Init()
    Zone.Area = ZONES:FindFirstChild(Zone.Name)
    Zone.Destination = Zone.Area:FindFirstChild("Destination")
    Zone.SFX = Zone.Area:FindFirstChild("DoorSFX")
    Zone.Atmosphere = Lighting:FindFirstChild("Atmosphere")

    Zone.Filter = OverlapParams.new()
    Zone.Filter.CollisionGroup = Zone.CollisionGroup
    Zone.Filter.FilterDescendantsInstances = {Zone.Area}
    Zone.Filter.FilterType = Enum.RaycastFilterType.Exclude
end

function Zone.Update()
	local roots = workspace:GetPartsInPart(Zone.Area, Zone.Filter)
	if #roots < 1 then
		return
	end

    Zone.SFX:Play()
    Zone.Atmosphere.Density = 0.6
    Zone.Atmosphere.Haze = 0.05

    for _, plr in Players:GetPlayers() do
        local char = plr.Character or plr.CharacterAdded:Wait()
        if not char then
            plr:Kick("No character found.")
        end

		char:PivotTo(Zone.Destination.WorldCFrame)
    end
	Zone.Area:SetAttribute("Arrived", true)
    Zone.Active = false
end

return Zone