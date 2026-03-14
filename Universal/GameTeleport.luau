--[[ USAGE:
local GameTeleport = loadstring(game:HttpGet("https://raw.githubusercontent.com/sladostrastnik/OpenSource/refs/heads/main/Universal/GameTeleport.luau"), true)

1. Rejoin
GameTeleport()

2. URL
GameTeleport("https://roblox.com/discover#/rg-join/1234567890/AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE")

3. IDs
GameTeleport(PlaceId: number, JobId: number)
]]--

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()

return function(...)
    local Arguments = {...}
    local PlaceId, JobId

    if #Arguments > 0 then
        local Argument1 = Arguments[1]

        if typeof(Argument1) == "string" then
            PlaceId, JobId = string.match(JoinLink, "#/rg%-join/(%d+)/([%w%-]+)")
        elseif typeof(Argument1) == "number" then
            PlaceId, JobId = Arguments[1], Arguments[2]
        end
    else
        PlaceId, JobId = game.PlaceId, game.JobId
    end

    local Success, Error = pcall(function()
        TeleportService:TeleportToPlaceInstance(PlaceId, JobId, LocalPlayer)
    end)
    if not Success and Error then
        error(Error)
    end
end
