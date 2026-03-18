local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

-- / ROOTS
local REMOTES = ReplicatedStorage.Remotes
local MAIN = script
local MODULES = ServerStorage.Modules

-- / MODULES
local EndingsManager = require(MODULES.EndingsManager)

-- / REMOTE EVENTS
local REMOTE_EVENTS = REMOTES.RemoteEvents
local DialogRE = REMOTE_EVENTS:FindFirstChild("Dialog")

-- / MAIN
local Prompt = {}
Prompt.Config = {}
Prompt.Config.EndingName = "Sleep"

Prompt.Dialogs = {
	{
		Dialog = "I'm going to bed...",
	},
	{
		Dialog = nil,
		Delay = 5,
	},
}

function Prompt.OnTriggered(prompt: ProximityPrompt, plr: Player)
	local seat = prompt.Parent.Seat
	
	if seat.Occupant then return end -- make sure seat isn't already taken

	local char = plr.Character
	if not char then return end -- make sure the player has a character

	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then return end -- make sure the char has a humanoid
	
	seat:Sit(hum) -- forces the humanoid to sit on the seat
	
	for _, dialog in Prompt.Dialogs do
		task.wait(dialog.Delay or 0)
		
		DialogRE:FireAllClients(dialog)
	end
	
	EndingsManager.Fire(Prompt.Config.EndingName)
end

return Prompt