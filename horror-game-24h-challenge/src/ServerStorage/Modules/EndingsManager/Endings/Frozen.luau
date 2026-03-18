local Ending = {}
Ending.Name = "Frozen"
Ending.Description = "You were out in the cold for too long."
Ending.NameColor = Color3.fromRGB(0, 208, 255)
Ending.BadgeID = 3583000335326830

function Ending.Fire(args: {[any]: any})
	print("Ending fired")
end

return Ending