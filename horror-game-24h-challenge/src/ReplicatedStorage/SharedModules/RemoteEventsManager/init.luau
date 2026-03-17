local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- / ROOTS
local MAIN = script
local REMOTES = ReplicatedStorage:WaitForChild("Remotes")

-- / REMOTE EVENTS
local REMOTE_EVENTS = REMOTES.RemoteEvents

-- / MAIN
local RemoteEventsManager = {}

function RemoteEventsManager.Init()
    for _, remoteEvent: RemoteEvent in REMOTE_EVENTS:GetChildren() do
        local reName = remoteEvent.Name
        local reModule = script.RemoteEvents:FindFirstChild(reName)
        if not reModule then continue end

        local load = require(reModule)
        load.Connection = remoteEvent.OnClientEvent:Connect(load.OnRemoteEvent)
    end
end

return RemoteEventsManager