-- / ROOTS
local MAIN = script

-- / MODULES
local Objects = require(MAIN.Objects)
local Config = require(MAIN.Config)

-- / MAIN
local UI = {}

function UI.Init()
   Objects.Init()
end

function UI.Render(packet)
   local dialog = packet.Dialog
   if not dialog then
      Objects.UI.Enabled = false
      return
   end

	Objects.UI.Enabled = true
   local dialogText = Objects.DialogText
   dialogText.Text = dialog 

   local dialogColor = packet.DialogColor
   if dialogColor then
      dialogText.TextColor3 = dialogColor
   else
      dialogText.TextColor3 = Config.DEFAULT_TEXT_COLOR
   end
end

return UI