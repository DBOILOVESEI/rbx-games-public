local Players = game:GetService("Players")
local InitialFunctions = {}

function InitialFunctions.ToR6(char: Model)
    local plr: Player = Players:GetPlayerFromCharacter(char)
    if not plr then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    root.CollisionGroup = "Player" 
end

return InitialFunctions