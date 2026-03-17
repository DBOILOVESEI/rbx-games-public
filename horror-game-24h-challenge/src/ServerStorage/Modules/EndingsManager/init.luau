local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- / ROOTS
local MAIN = script
local REMOTES = ReplicatedStorage.Remotes

-- / REMOTE EVENTS
local REMOTE_EVENTS = REMOTES.REMOTE_EVENTS
local EndingRE = REMOTE_EVENTS:FindFirstChild("EndingRE")

-- / MAIN
local EndingsManager = {}
EndingsManager.Endings = {}

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
    local ending = EndingsManager.Endings[endingName]
    if not ending then
        return
    end

    ending.Fire(args)
end

return EndingsManager