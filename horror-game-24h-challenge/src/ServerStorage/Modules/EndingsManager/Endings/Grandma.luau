local Ending = {}
Ending.Name = "Grandma!"
Ending.Description = "So it was grandma after all."
Ending.NameColor = Color3.fromRGB(210, 105, 255)
Ending.BadgeID = 0

function Ending.Fire(args: {[any]: any})
	print("Ending fired")
end

return Ending