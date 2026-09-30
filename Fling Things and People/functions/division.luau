local Players = game:GetService("Players")
local can = string.rep("can ", 222)
while task.wait() do
    for i = 1, 5000 do
        Players:chat(can)
        if i% 10 == 0 then 
            task.wait() 
        end
    end
end
