
-- / ROOTS
local MAIN = script

-- / MODULES

-- / MAIN
local UIsManager = {}
UIsManager.UIs = {}

function UIsManager.Init()
    for _, uiModule in MAIN.UIs:GetChildren() do
        local uiName = uiModule.Name
        if UIsManager.UIs[uiName] then
            continue
        end

        local load = require(uiModule)
        if load.Init then
			load.Init()
        end
        UIsManager.UIs[uiName] = load
    end
end

function UIsManager.Render(packet)
    local uiName = packet.UIName
    if not uiName then
        return
    end

    local ui = UIsManager.UIs[uiName]
    if not ui then
        return
    end

    ui.Render(packet)
end

return UIsManager