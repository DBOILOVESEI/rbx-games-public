local Ending = {}
Ending.Name = "Fire!"
Ending.Description = "Hot! Hot! Hot!"
Ending.NameColor = Color3.fromRGB(255, 136, 0)
Ending.BadgeID = 0

function Ending.Fire(args: {[any]: any})
	print("Ending fired")
end

return Ending