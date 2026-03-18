local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Teams = game:GetService("Teams")

-- / ROOTS
local ZONES = workspace.Zones
local MODULES = ServerStorage.Modules
local DOORS = workspace.Doors

-- / MODULES
local EndingsManager = require(MODULES.EndingsManager)

-- / MAIN
local Timeline = {}
Timeline.Config = {}
Timeline.Config.ENDING_NAME = "Grandma"

function Timeline.Fire()
    EndingsManager.Fire(Timeline.Config.ENDING_NAME)
end

return Timeline