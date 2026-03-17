local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- / ROOTS
local SHARED_MODULES = ReplicatedStorage.SharedModules
local UIsManager = require(SHARED_MODULES.UIsManager)

-- / MAIN
local RemoteEvent = {}
RemoteEvent.UIName = "Dialog"

function RemoteEvent.OnRemoteEvent(packet)
    print("haha")
    packet.UIName = RemoteEvent.UIName
    UIsManager.Render(packet)
end

return RemoteEvent