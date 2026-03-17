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

function ZoneController.BeginUpdate()
    if ZoneController.ActiveSimulation and typeof(ZoneController.ActiveSimulation) == "RBXScriptConnection" then
        ZoneController.ActiveSimulation:Disconnect()
    end
    
    ZoneController.ActiveSimulation = Config.DEFAULT_SIMULATION_TYPE:Connect(function(dt: number)
        ZoneController.Update()
    end)
end

function ZoneController.Update()
    for zoneName, zone in ZoneController.Zones do
        zone.Update()
    end
end

return ZoneController