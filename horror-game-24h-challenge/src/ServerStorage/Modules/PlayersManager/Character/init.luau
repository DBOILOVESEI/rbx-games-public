local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
-- / ROOTS
local MAIN = script
local MODULES = ServerStorage.Modules

-- / MODULES
local Config = require(MAIN.Config)
local EndingsManager = require(MODULES.EndingsManager)

-- / MAIN
local Character = {}
Character.__index = Character

function Character.New(char: Model)
    local hum: Humanoid = char:FindFirstChild("Humanoid")

    local self = {}
    
    local root = char:FindFirstChild("HumanoidRootPart")
    root.CollisionGroup = "Player"

    self.Connections = {}
    self.Connections.OnHumanoidDied = hum.Died:Connect(function()
		EndingsManager.Fire(Config.ENDING_NAME)
    end)

    setmetatable(self, Character)
    return self
end

function Character:Destroy()
    setmetatable(self, nil)

    for i, connection: RBXScriptConnection in self.Connections do
        self.Connections[i] = nil
        connection:Disconnect()
    end

    table.clear(self)
end

return Character