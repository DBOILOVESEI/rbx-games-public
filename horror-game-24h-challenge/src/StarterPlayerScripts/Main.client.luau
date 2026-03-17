local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- / ROOTS
local SHARED_MODULES = ReplicatedStorage:WaitForChild("SharedModules")

-- / MODULES
local UIsManager = require(SHARED_MODULES.UIsManager)
local RemoteEventsManager = require(SHARED_MODULES.RemoteEventsManager)

-- / MAIN
function Main()
    UIsManager.Init()
    RemoteEventsManager.Init()
end

Main()