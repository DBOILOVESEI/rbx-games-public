local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- / PLAYER
local LocalPlayer = Players.LocalPlayer

-- / ROOTS
local SHARED_MODULES = ReplicatedStorage.SharedModules
local UIsManager = require(SHARED_MODULES.UIsManager)

-- / MAIN
local RemoteEvent = {}
RemoteEvent.Config = {}
RemoteEvent.Config.DELAY_KICK = 2
RemoteEvent.Config.KICK_MESSAGE = "Rejoin to replay!"
RemoteEvent.Config.UI_NAME = "Ending"

function RemoteEvent.OnRemoteEvent(packet)
    packet.UIName = RemoteEvent.Config.UI_NAME
    UIsManager.Render(packet)

    task.wait(RemoteEvent.Config.DELAY_KICK)

    LocalPlayer:Kick(RemoteEvent.Config.KICK_MESSAGE)
end

return RemoteEvent