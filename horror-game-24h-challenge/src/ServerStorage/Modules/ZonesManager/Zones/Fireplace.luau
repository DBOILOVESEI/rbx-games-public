local ServerStorage = game:GetService("ServerStorage")

-- / ROOTS
local ZONES = workspace.Zones
local ASSETS = ServerStorage.Assets
local MODULES = ServerStorage.Modules

-- / ASSETS
local VFX = ASSETS.VFX
local SFX = ASSETS.SFX

-- / MODULES
local EndingsManager = require(MODULES.EndingsManager)

-- / MAIN
local Zone = {}
Zone.Name = "Fireplace"
Zone.CollisionGroup = "Zone"

Zone.LastDamage = 0
Zone.Config = {}
Zone.Config.ENDING_NAME = "Fire"
Zone.Config.DELAY_ENDING = 4

function Zone.Init()
    Zone.Area = ZONES:FindFirstChild(Zone.Name)
    Zone.SFX = SFX:FindFirstChild("FireSFX")
    Zone.VFX = VFX:FindFirstChild("FireVFX")
    
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

    for _, root in roots do
        local char = root.Parent
        local hum: Humanoid = char:FindFirstChild("Humanoid")
		if not hum then
			continue
		end
        local onFire = char:GetAttribute("OnFire")
        if onFire == true then return end

        char:SetAttribute("OnFire", true)

        local sfx = Zone.SFX:Clone()
        sfx.Looped = true
        sfx.Playing = true
        sfx.Parent = char

        for _, bodyPart in char:GetChildren() do
            if not bodyPart:IsA("BasePart") then
                continue
            end

            local vfx = Zone.VFX:Clone()
            vfx.Enabled = true
            vfx.Parent = bodyPart
        end
    end
    Zone.Enabled = false

    task.wait(Zone.Config.DELAY_ENDING)

    EndingsManager.Fire(Zone.Config.ENDING_NAME)
end

return Zone