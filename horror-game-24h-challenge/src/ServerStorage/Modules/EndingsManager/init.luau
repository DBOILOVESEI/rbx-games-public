local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- / ROOTS
local MAIN = script
local REMOTES = ReplicatedStorage.Remotes

-- / REMOTE EVENTS
local REMOTE_EVENTS = REMOTES.RemoteEvents
local EndingRE: RemoteEvent = REMOTE_EVENTS:FindFirstChild("Ending")

-- / MODULES
local Errors = require(MAIN.Errors)

-- / MAIN
local EndingsManager = {}
EndingsManager.Endings = {}
EndingsManager.EndingActive = false

function EndingsManager.Init()
    for _, endingModule in MAIN.Endings:GetChildren() do
        local endingName = endingModule.Name
        if EndingsManager.Endings[endingName] then
            continue
        end

        local load = require(endingModule)
        EndingsManager.Endings[endingName] = load
    end
end

function EndingsManager.Fire(endingName: string, args: {[any]: any})
    if EndingsManager.EndingActive == true then return end

    local ending = EndingsManager.Endings[endingName]
    if not ending then
        warn(string.format(Errors.NO_ENDING, endingName))
        return
    end

	EndingsManager.EndingActive = true

    ending.Fire(args)

    local packet = {}
    packet.EndingName = ending.Name
    packet.Description = ending.Description
    packet.NameColor = ending.NameColor

    EndingRE:FireAllClients(packet)
end

return EndingsManager