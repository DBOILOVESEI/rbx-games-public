local TweenService = game:GetService("TweenService")

-- / ROOTS
local MAIN = script

-- / MODULES
local Objects = require(MAIN.Objects)
local Config = require(MAIN.Config)

-- / MAIN
local UI = {}

function UI.Init()
   Objects.Init()

   Objects.UI.Enabled = true

   local holder = Objects.Holder
   local transitionInfo = TweenInfo.new(
      Config.FADE_DURATION,
      Enum.EasingStyle.Linear
   )
   UI.Transition = TweenService:Create(
      holder,
      transitionInfo,
      {
         GroupTransparency = Config.FADE_TRANSPARENCY
      }
   )

end

function UI.Render(packet)
   local endingName = packet.EndingName
   local desc = packet.Description
   if not (endingName and desc) then return end

   local endingText = Objects.EndingText
   local descText = Objects.DescriptionText

	endingText.Text = endingName
	descText.Text = desc

   if packet.NameColor then
		endingText.TextColor3 = packet.NameColor
   end

   UI.Transition:Play()
end

return UI