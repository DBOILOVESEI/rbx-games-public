local MAIN = script

-- / MODULES
local Config = require(MAIN.Config)
local Errors = require(MAIN.Errors)

-- / MAIN
local ZoneController = {}
ZoneController.Zones = {}
ZoneController.ActiveSimulation = nil

function ZoneController.Init()
    for _, zoneModule in MAIN.Zones:GetChildren() do
        local zoneName = zoneModule.Name
        if ZoneController.Zones[zoneName] then
            continue
        end

        local load = require(zoneModule)
        load.Init()

        ZoneController.Zones[zoneName] = load
    end

    print(Errors.INIT_COMPLETE)

    ZoneController.BeginUpdate()
end

function ZoneController.LoadZone(zoneName: string)
    local zoneModule = MAIN.Zones:FindFirstChild(zoneName)
	if not zoneModule then
		return
	end

    if ZoneController.Zones[zoneName] then
        return
    end

    local load = require(zoneModule)
    table.insert(ZoneController.Zones, load)
end

function ZoneController.UnloadZone(zoneName: string)
    local load = ZoneController.Zones[zoneName]
    if not load then return end

    local activeIndex = table.find(ZoneController.Zones, load)
    if not activeIndex then return end

    table.remove(ZoneController.Zones, activeIndex)
end

function ZoneController.BeginUpdate()
    if ZoneController.ActiveSimulation and typeof(ZoneController.ActiveSimulation) == "RBXScriptConnection" then
        ZoneController.ActiveSimulation:Disconnect()
    end
    
    ZoneController.ActiveSimulation = Config.DEFAULT_SIMULATION_TYPE:Connect(function(dt: number)
        ZoneController.Update()
    end)
end

function ZoneController.Update()
    for _, zone in ZoneController.Zones do
		if zone.Active == false then
			ZoneController.UnloadZone(zone.Name)
			continue
		end

        zone.Update()
    end
end

return ZoneController