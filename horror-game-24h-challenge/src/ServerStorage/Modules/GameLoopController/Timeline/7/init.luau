local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- / ROOTS
local REMOTES = ReplicatedStorage.Remotes
local MAIN = script

-- / REMOTE EVENTS
local REMOTE_EVENTS = REMOTES.RemoteEvents
local DialogRE = REMOTE_EVENTS:FindFirstChild("Dialog")

-- / MODULES
local Dialogs = require(MAIN.Dialogs)

-- / MAIN
local Timeline = {}

function Timeline.Fire()
    for i = 1, #Dialogs, 1 do
        local dialog = Dialogs[i]

        task.wait(dialog.Delay or 0)
        DialogRE:FireAllClients(dialog)
    end
end

return Timeline