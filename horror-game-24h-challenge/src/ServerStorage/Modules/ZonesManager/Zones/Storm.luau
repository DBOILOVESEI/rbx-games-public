
-- / ROOTS
local ZONES = workspace.Zones

-- / MAIN
local Zone = {}
Zone.Name = "Storm"
Zone.CollisionGroup = "Zone"

function Zone.Init()
    Zone.Area = ZONES:FindFirstChild(Zone.Name)
    Zone.Filter = OverlapParams.new()
    Zone.Filter.CollisionGroup = Zone.CollisionGroup
    Zone.Filter.FilterDescendantsInstances = {Zone.Area}
    Zone.Filter.FilterType = Enum.RaycastFilterType.Exclude
end

function Zone.Update()
   local chars = workspace:GetPartsInPart(Zone.Area, Zone.Filter)
   if #chars < 1 then return end

   print(chars[1])
end

return Zone