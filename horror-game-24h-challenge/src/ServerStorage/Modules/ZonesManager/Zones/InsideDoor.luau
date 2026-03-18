local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")

-- / ROOTS
local ZONES = workspace.Zones

-- / MAIN
local Zone = {}
Zone.Name = "InsideDoor"
Zone.CollisionGroup = "Zone"

Zone.LastDamage = 0
Zone.Config = {}

function Zone.Init()
    Zone.Area = ZONES:FindFirstChild(Zone.Name)

    Zone.Active = false

    Zone.Filter = OverlapParams.new()
    Zone.Filter.CollisionGroup = Zone.CollisionGroup
    Zone.Filter.FilterDescendantsInstances = {Zone.Area}
    Zone.Filter.FilterType = Enum.RaycastFilterType.Exclude
end

function Zone.Update()
	if Zone.Active == false then
        return
	end

	local roots = workspace:GetPartsInPart(Zone.Area, Zone.Filter)
	if #roots < 1 then
		return
	end

	Zone.Area:SetAttribute("Arrived", true)
    Zone.Active = false
end

return Zone