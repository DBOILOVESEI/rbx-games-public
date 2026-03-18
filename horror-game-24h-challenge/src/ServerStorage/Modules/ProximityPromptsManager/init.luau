local ProximityPromptService = game:GetService("ProximityPromptService")
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
local ProximityPromptsManager = {}
ProximityPromptsManager.Prompts = {}
ProximityPromptsManager.OnPromptTriggered = nil

function ProximityPromptsManager.Init()
    for _, promptModule in MAIN.Prompts:GetChildren() do
        local promptName = promptModule.Name
        if ProximityPromptsManager.Prompts[promptName] then
            continue
        end

        local load = require(promptModule)
        ProximityPromptsManager.Prompts[promptName] = load
    end

    ProximityPromptsManager.OnPromptTriggered = ProximityPromptService.PromptTriggered:Connect(function(prompt: ProximityPrompt, plr: Player)
        local promptName = prompt.Name
        if not ProximityPromptsManager.Prompts[promptName] then return end

        ProximityPromptsManager.Prompts[promptName].OnTriggered(prompt, plr)
    end)
end

return ProximityPromptsManager