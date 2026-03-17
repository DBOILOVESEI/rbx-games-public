
-- / ROOTS
local ZONES = workspace.Zones

-- / MAIN
local Zone = {}
Zone.Name = "Storm"
Zone.CollisionGroup = "Zone"

Zone.LastDamage = 0
Zone.Config = {}
Zone.Config.DAMAGE = 2
Zone.Config.DAMAGE_COOLDOWN = 1

function Zone.Init()
    Zone.Area = ZONES:FindFirstChild(Zone.Name)
    Zone.Filter = OverlapParams.new()
    Zone.Filter.CollisionGroup = Zone.CollisionGroup
    Zone.Filter.FilterDescendantsInstances = {Zone.Area}
    Zone.Filter.FilterType = Enum.RaycastFilterType.Exclude
end

function Zone.Update()
    local current = os.clock()
    if current - Zone.LastDamage < Zone.Config.DAMAGE_COOLDOWN then
        return
    end
    Zone.LastDamage = current
    print("yessir")

	local roots = workspace:GetPartsInPart(Zone.Area, Zone.Filter)
	if #roots < 1 then
		return
	end

    for _, root in roots do
        local char = root.Parent
        local hum: Humanoid = char:FindFirstChild("Humanoid")
		if not hum then
			continue
		end

        hum:TakeDamage(Zone.Config.DAMAGE)
    end
end

return Zone