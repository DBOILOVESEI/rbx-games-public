local ServerStorage = game:GetService("ServerStorage")

-- / ROOTS
local MODULES = ServerStorage.Modules

-- / MODULES
local PlayersManager = require(MODULES.PlayersManager)
local ZonesManager = require(MODULES.ZonesManager)
local EndingsManager = require(MODULES.EndingsManager)
local GameLoopController = require(MODULES.GameLoopController)

-- / MAIN
local function Main()
    PlayersManager.Init()
    ZonesManager.Init()
	EndingsManager.Init()
    GameLoopController.Init()

    GameLoopController.StartGameLoop()
end

Main()