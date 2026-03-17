local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- / ROOTS
local SHARED_MODULES = ReplicatedStorage.SharedModules
local UIsManager = require(SHARED_MODULES.UIsManager)

-- / MAIN
local RemoteEvent = {}
RemoteEvent.UIName = "Ending"

function RemoteEvent.OnRemoteEvent(packet: {[any]: any})
    print("hi")
    packet.UIName = RemoteEvent.UIName
    UIsManager.Render(packet)
end

return RemoteEvent