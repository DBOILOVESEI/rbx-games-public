local ServerStorage = game:GetService("ServerStorage")

-- / ROOTS
local MODULES = ServerStorage.Modules

-- / MODULES
local PlayersManager = require(MODULES.PlayersManager)
local ZonesManager = require(MODULES.ZonesManager)

-- / MAIN
local Main = function()
    PlayersManager.Init()
    ZonesManager.Init()
end

Main()