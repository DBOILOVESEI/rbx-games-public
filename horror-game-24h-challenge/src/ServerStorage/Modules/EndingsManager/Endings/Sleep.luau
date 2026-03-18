local Ending = {}
Ending.Name = "Sleep"
Ending.Description = "What if grandma comes back? Ah, forget it."
Ending.NameColor = Color3.fromRGB(255, 255, 255)
Ending.BadgeID = 430950154760245

function Ending.Fire(args: {[any]: any})
	print("Ending fired")
end

return Ending