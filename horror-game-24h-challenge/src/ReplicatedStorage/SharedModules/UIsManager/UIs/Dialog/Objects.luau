local Players = game:GetService("Players")

-- / PLAYER
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- / ROOTS
local MAIN = script
local ROOT = script.Parent

-- / MAIN
local Objects = {}
Objects.UIName = ROOT.Name

function Objects.Init()
    local ui = PlayerGui:WaitForChild(Objects.UIName)
    local holder = ui:FindFirstChild("Holder")
    local dialogText = holder:FindFirstChild("Dialog") 

    Objects.UI = ui
    Objects.Holder = holder
    Objects.DialogText = dialogText
end

return Objects