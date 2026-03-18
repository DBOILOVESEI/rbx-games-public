local Players = game:GetService("Players")
-- / ROOTS
local MAIN = script

-- / MODULES
local Errors = require(MAIN.Errors)
local Config = require(MAIN.Config)

-- / MAIN
local GameLoopController = {}
GameLoopController.Timeline = {}
GameLoopController.TimelineIndex = 1

function GameLoopController.Init()
    for _, timelineModule in MAIN.Timeline:GetChildren() do

        local i = tonumber(timelineModule.Name)
        if not i then
            warn(Errors.NAME_NOT_NUMBER)
            continue
        end

        local load = require(timelineModule)
        GameLoopController.Timeline[i] = load
    end
end

function GameLoopController.StartGameLoop()
    repeat
        task.wait()
    until
    #Players:GetPlayers() >= Config.PLAYER_COUNT_MAX

    GameLoopController.TimelineIndex = 1
    while GameLoopController.TimelineIndex <= #GameLoopController.Timeline do
        GameLoopController.Timeline[GameLoopController.TimelineIndex].Fire()
        GameLoopController.TimelineIndex += 1
        -- Timeout safe guard
        task.wait()
    end
end

function GameLoopController.EndGameLoop()
    GameLoopController.TimelineIndex = #GameLoopController.Timeline+1
end


return GameLoopController