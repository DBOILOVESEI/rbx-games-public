local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
-- / ROOTS
local REMOTES = ReplicatedStorage.Remotes
local MAIN = script
local MODULES = ServerStorage.Modules

-- / REMOTE EVENTS
local REMOTE_EVENTS = REMOTES.RemoteEvents
local DialogRE = REMOTE_EVENTS:FindFirstChild("Dialog")

-- / MODULES
local Dialogs = require(MAIN.Dialogs)
local EndingsManager = require(MODULES.EndingsManager)

-- / MAIN
local Prompt = {}
Prompt.Config = {}
Prompt.Config.EndingName = "SuspiciousStew"

function Prompt.OnTriggered()
    for i = 1, #Dialogs, 1 do
        local dialog = Dialogs[i]

        task.wait(dialog.Delay or 0)
        DialogRE:FireAllClients(dialog)
    end

	EndingsManager.Fire(Prompt.Config.EndingName)
end

return Prompt