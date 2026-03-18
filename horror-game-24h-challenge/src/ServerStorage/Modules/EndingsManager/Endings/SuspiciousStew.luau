local Ending = {}
Ending.Name = "Suspicious Stew"
Ending.Description = "Shouldn't have consumed that..."
Ending.NameColor = Color3.fromRGB(106, 0, 14)
Ending.BadgeID = 1094486540037978

function Ending.Fire(args: {[any]: any})
	print("Ending fired")
end

return Ending