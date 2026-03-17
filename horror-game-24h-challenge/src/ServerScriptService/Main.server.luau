local ServerStorage = game:GetService("ServerStorage")

-- / ROOTS
local MODULES = ServerStorage.Modules

-- / MODULES
local PlayersManager = require(MODULES.PlayersManager)
local ZonesManager = require(MODULES.ZonesManager)
local EndingsManager = require(MODULES.EndingsManager)

-- / MAIN
local function Main()
    PlayersManager.Init()
    ZonesManager.Init()
	EndingsManager.Init()
end

Main()