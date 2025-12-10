
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
local CharacterEvents = ReplicatedStorage:WaitForChild("CharacterEvents")
local SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
local Struggle = CharacterEvents:WaitForChild("Struggle")
local CreateLine = GrabEvents:WaitForChild("CreateGrabLine")
local DestroyLine = GrabEvents:WaitForChild("DestroyGrabLine")
local localPlayer = Players.LocalPlayer
local playerCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
localPlayer.CharacterAdded:Connect(function(character)
    playerCharacter = character
end)
local poisonAuraCoroutine
local deathAuraCoroutine
local poisonCoroutines = {}
local strengthConnection
local coroutineRunning = false
local autoStruggleCoroutine
local autoDefendCoroutine
local auraCoroutine
local gravityCoroutine
local kickCoroutine
local kickGrabCoroutine
local hellSendGrabCoroutine
local anchoredParts = {}
local anchoredConnections = {}
local compiledGroups = {}
local compileConnections = {}
local compileCoroutine
local fireAllCoroutine
local connections = {}
local renderSteppedConnections = {}
local ragdollAllCoroutine
local crouchJumpCoroutine
local crouchSpeedCoroutine
local anchorGrabCoroutine
local poisonGrabCoroutine
local ufoGrabCoroutine
local burnPart
local fireGrabCoroutine
local noclipGrabCoroutine
local antiKickCoroutine
local kickGrabConnections = {}
local decoyOffset = 15
local stopDistance = 5
local circleRadius = 10
local circleSpeed = 2
local auraToggle = 1
local crouchWalkSpeed = 50
local crouchJumpPower = 50
local kickMode = 1
local auraRadius = 20
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local followMode = true
local toysFolder = workspace:FindFirstChild(localPlayer.Name.."SpawnedInToys")
local playerList = {}
local selection 
local platforms = {}
local ownedToys = {}
local function isDescendantOf(target, other)
    local currentParent = target.Parent
    while currentParent do
        if currentParent == other then
            return true
        end
        currentParent = currentParent.Parent
    end
    return false
end

local function getDescendantParts(descendantName)
    local parts = {}
    for _, descendant in ipairs(workspace.Map:GetDescendants()) do
        if descendant:IsA("Part") and descendant.Name == descendantName then
            table.insert(parts, descendant)
        end
    end
    return parts
end

local poisonHurtParts = getDescendantParts("PoisonHurtPart")
local paintPlayerParts = getDescendantParts("PaintPlayerPart")

local function updatePlayerList()
    playerList = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(playerList, player.Name)
    end
end

local function onPlayerAdded(player)
    table.insert(playerList, player.Name)
end

local function onPlayerRemoving(player)
    for i, name in ipairs(playerList) do
        if name == player.Name then
            table.remove(playerList, i)
            break
        end
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)
for i, v in pairs(localPlayer:WaitForChild("PlayerGui"):WaitForChild("MenuGui"):WaitForChild("Menu"):WaitForChild("TabContents"):WaitForChild("Toys"):WaitForChild("Contents"):GetChildren()) do
    if v.Name ~= "UIGridLayout" then
        ownedToys[v.Name] = true
    end
end

local function getNearestPlayer()
    local nearestPlayer
    local nearestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (playerCharacter.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < nearestDistance then
                nearestDistance = distance
                nearestPlayer = player
            end
        end
    end

    return nearestPlayer
end

local function cleanupConnections(connectionTable)
    for _, connection in ipairs(connectionTable) do
        connection:Disconnect()
    end
    connectionTable = {}
end

local function spawnItem(itemName, position, orientation)
    local cframe = CFrame.new(position)
    local rotation = Vector3.new(0, 90, 0)
    ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(itemName, cframe, rotation)
end

local function arson(part)
    if not toysFolder:FindFirstChild("Campfire") then
        spawnItem("Campfire", Vector3.new(-72.9304581, -5.96906614, -265.543732))
    end
    local campfire = toysFolder:FindFirstChild("Campfire")
    burnPart = campfire:FindFirstChild("FirePlayerPart") or campfire.FirePlayerPart
    burnPart.Size = Vector3.new(7, 7, 7)
    burnPart.Position = part.Position
    task.wait(0.3)
    burnPart.Position = Vector3.new(0, -50, 0)
end

local function handleCharacterAdded(player)
    local characterAddedConnection = player.CharacterAdded:Connect(function(character)
        local hrp = character:WaitForChild("HumanoidRootPart")
        local fpp = hrp:WaitForChild("FirePlayerPart")
        fpp.Size = Vector3.new(4.5, 5, 4.5)
        fpp.CollisionGroup = "1"
        fpp.CanQuery = true
    end)
    table.insert(kickGrabConnections, characterAddedConnection)
end

local function kickGrab()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            if hrp:FindFirstChild("FirePlayerPart") then
                local fpp = hrp.FirePlayerPart
                fpp.Size = Vector3.new(4.5, 5.5, 4.5)
                fpp.CollisionGroup = "1"
                fpp.CanQuery = true
            end
        end
        handleCharacterAdded(player)
    end

    local playerAddedConnection = Players.PlayerAdded:Connect(handleCharacterAdded)
    table.insert(kickGrabConnections, playerAddedConnection)
end

local function grabHandler(grabType)
    while true do
        local success, err = pcall(function()
            local child = workspace:FindFirstChild("GrabParts")
            if child and child.Name == "GrabParts" then
                local grabPart = child:FindFirstChild("GrabPart")
                local grabbedPart = grabPart:FindFirstChild("WeldConstraint").Part1
                local head = grabbedPart.Parent:FindFirstChild("Head")
                if head then
                    while workspace:FindFirstChild("GrabParts") do
                        local partsTable = grabType == "poison" and poisonHurtParts or paintPlayerParts
                        for _, part in pairs(partsTable) do
                            part.Size = Vector3.new(2, 2, 2)
                            part.Transparency = 1
                            part.Position = head.Position
                        end
                        wait()
                        for _, part in pairs(partsTable) do
                            part.Position = Vector3.new(0, -200, 0)
                        end
                    end
                    for _, part in pairs(partsTable) do
                        part.Position = Vector3.new(0, -200, 0)
                    end
                end
            end
        end)
        wait()
    end
end

local function fireGrab()
    while true do
        local success, err = pcall(function()
            local child = workspace:FindFirstChild("GrabParts")
            if child and child.Name == "GrabParts" then
                local grabPart = child:FindFirstChild("GrabPart")
                local grabbedPart = grabPart:FindFirstChild("WeldConstraint").Part1
                local head = grabbedPart.Parent:FindFirstChild("Head")
                if head then
                    arson(head)
                end
            end
        end)
        wait()
    end
end

local function noclipGrab()
    while true do
        local success, err = pcall(function()
            local child = workspace:FindFirstChild("GrabParts")
            if child and child.Name == "GrabParts" then
                local grabPart = child:FindFirstChild("GrabPart")
                local grabbedPart = grabPart:FindFirstChild("WeldConstraint").Part1
                local character = grabbedPart.Parent
                if character.HumanoidRootPart then
                    while workspace:FindFirstChild("GrabParts") do
                        for _, part in pairs(character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                        wait()
                    end
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end
        end)
        wait()
    end
end
local function spawnItemCf(itemName, cframe)
    local rotation = Vector3.new(0, 0, 0)
    ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(itemName, cframe, rotation)
end
local function fireAll()
    while true do
        local success, err = pcall(function()
            spawnItemCf("Campfire", playerCharacter.Head.CFrame)
            local campfire = toysFolder:WaitForChild("Campfire")
            local firePlayerPart
            for _, part in pairs(campfire:GetChildren()) do
                if part.Name == "FirePlayerPart" then
                    part.Size = Vector3.new(10, 10, 10)
                    firePlayerPart = part
                    break
                end
            end
            local originalPosition = playerCharacter.Torso.Position
            SetNetworkOwner:FireServer(firePlayerPart, firePlayerPart.CFrame)
            playerCharacter:MoveTo(firePlayerPart.Position)
            wait(0.3)
            playerCharacter:MoveTo(originalPosition)
            local bodyPosition = Instance.new("BodyPosition")
            bodyPosition.P = 20000
            bodyPosition.Position = playerCharacter.Head.Position + Vector3.new(0, 600, 0)
            bodyPosition.Parent = campfire.Main
            while true do
                for _, player in pairs(Players:GetChildren()) do
                    pcall(function()
                        bodyPosition.Position = playerCharacter.Head.Position + Vector3.new(0, 600, 0)
                        if player.Character and player.Character.HumanoidRootPart and player.Character ~= playerCharacter then
                            firePlayerPart.Position = player.Character.HumanoidRootPart.Position or player.Character.Head.Position
                            wait()
                        end
                    end)
                end  
                wait()
            end
        end)
        if not success then
            warn("Error in fireAll: " .. tostring(err))
        end
        wait()
    end
end

local function createHighlight(parent)
    local highlight = Instance.new("Highlight")
    highlight.DepthMode = Enum.HighlightDepthMode.Occluded
    highlight.FillTransparency = 1
    highlight.Name = "Highlight"
    highlight.OutlineColor = Color3.new(0, 0, 1)
    highlight.OutlineTransparency = 0.5
    highlight.Parent = parent
    return highlight
end

local function onPartOwnerAdded(descendant, primaryPart)
    if descendant.Name == "PartOwner" then
        local highlight = primaryPart.Parent:FindFirstChild("Highlight")
        if highlight then
            if descendant.Value ~= localPlayer.Name then
                highlight.OutlineColor = Color3.new(1, 0, 0) 
            else
                highlight.OutlineColor = Color3.new(0, 0, 1) 
            end
        end
    end
end

local function createBodyMovers(part, position, rotation)
    local bodyPosition = Instance.new("BodyPosition")
    local bodyGyro = Instance.new("BodyGyro")

    bodyPosition.P = 15000
    bodyPosition.D = 200
    bodyPosition.MaxForce = Vector3.new(5000000, 5000000, 5000000)
    bodyPosition.Position = position
    bodyPosition.Parent = part

    bodyGyro.P = 15000
    bodyGyro.D = 200
    bodyGyro.MaxTorque = Vector3.new(5000000, 5000000, 5000000)
    bodyGyro.CFrame = rotation
    bodyGyro.Parent = part
end

local function anchorGrab()
    while true do
        pcall(function()
            local grabParts = workspace:FindFirstChild("GrabParts")
            if not grabParts then return end

            local grabPart = grabParts:FindFirstChild("GrabPart")
            if not grabPart then return end

            local weldConstraint = grabPart:FindFirstChild("WeldConstraint")
            if not weldConstraint or not weldConstraint.Part1 then return end

            local primaryPart = weldConstraint.Part1.Parent and weldConstraint.Part1.Parent.PrimaryPart
            if not primaryPart then return end

            if isDescendantOf(primaryPart, workspace.Map) then return end
            for _, player in pairs(Players:GetChildren()) do
                if isDescendantOf(primaryPart, player.Character) then return end
            end
            if not table.find(anchoredParts, primaryPart) then
                local highlight = createHighlight(primaryPart.Parent)
                table.insert(anchoredParts, primaryPart)
                
                local connection = primaryPart.Parent.DescendantAdded:Connect(function(descendant)
                    onPartOwnerAdded(descendant, primaryPart)
                end)
                table.insert(anchoredConnections, connection)
            end

            for _, child in ipairs(primaryPart:GetChildren()) do
                if child:IsA("BodyPosition") or child:IsA("BodyGyro") then
                    child:Destroy()
                end
            end

            while workspace:FindFirstChild("GrabParts") do
                wait()
            end
            createBodyMovers(primaryPart, primaryPart.Position, primaryPart.CFrame)
        end)
        wait()
    end
end

local function cleanupAnchoredParts()
    for _, part in ipairs(anchoredParts) do
        if part then
            if part:FindFirstChild("BodyPosition") then
                part.BodyPosition:Destroy()
            end
            if part:FindFirstChild("BodyGyro") then
                part.BodyGyro:Destroy()
            end
            if part.Parent and part.Parent:FindFirstChild("Highlight") then
                part.Parent.Highlight:Destroy()
            end
        end
    end

    cleanupConnections(anchoredConnections)
    anchoredParts = {}
end

local function updateBodyMovers(primaryPart)
    for _, group in ipairs(compiledGroups) do
        if group.primaryPart and group.primaryPart == primaryPart then
            for _, data in ipairs(group.group) do
                local bodyPosition = data.part:FindFirstChild("BodyPosition")
                local bodyGyro = data.part:FindFirstChild("BodyGyro")
                if bodyPosition then
                    bodyPosition.Position = (primaryPart.CFrame * data.offset).Position
                end
                if bodyGyro then
                    bodyGyro.CFrame = primaryPart.CFrame * data.offset
                end
            end
        end
    end
end

local function compileGroup()
    if #anchoredParts == 0 then 
        Rayfield:Notify({Title = "Error", Content = "No anchored parts found", Duration = 5})
    end

    local primaryPart = anchoredParts[1]
    if not primaryPart then return end

    local highlight = primaryPart.Parent:FindFirstChild("Highlight")
    if not highlight then
        highlight = createHighlight(primaryPart.Parent)
    end
    highlight.OutlineColor = Color3.new(0, 1, 0) 

    local group = {}
    for _, part in ipairs(anchoredParts) do
        if part ~= primaryPart then
            local offset = primaryPart.CFrame:toObjectSpace(part.CFrame)
            table.insert(group, {part = part, offset = offset})
        end
    end
    table.insert(compiledGroups, {primaryPart = primaryPart, group = group})
    
    local connection = primaryPart:GetPropertyChangedSignal("CFrame"):Connect(function()
        updateBodyMovers(primaryPart)
    end)
    table.insert(compileConnections, connection)

    local renderSteppedConnection = RunService.RenderStepped:Connect(function()
        updateBodyMovers(primaryPart)
    end)
    table.insert(renderSteppedConnections, renderSteppedConnection)
end

local function cleanupCompiledGroups()
    for _, groupData in ipairs(compiledGroups) do
        for _, data in ipairs(groupData.group) do
            if data.part then
                if data.part:FindFirstChild("BodyPosition") then
                    data.part.BodyPosition:Destroy()
                end
                if data.part:FindFirstChild("BodyGyro") then
                    data.part.BodyGyro:Destroy()
                end
            end
        end
        if groupData.primaryPart and groupData.primaryPart.Parent then
            local highlight = groupData.primaryPart.Parent:FindFirstChild("Highlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
    
    cleanupConnections(compileConnections)
    cleanupConnections(renderSteppedConnections)
    compiledGroups = {}
end

local function compileCoroutineFunc()
    while true do
        pcall(function()
            for _, groupData in ipairs(compiledGroups) do
                updateBodyMovers(groupData.primaryPart)
            end
        end)
        wait()
    end
end

local function unanchorPrimaryPart()
    local primaryPart = anchoredParts[1]
    if not primaryPart then return end
    if primaryPart:FindFirstChild("BodyPosition") then
        primaryPart.BodyPosition:Destroy()
    end
    if primaryPart:FindFirstChild("BodyGyro") then
        primaryPart.BodyGyro:Destroy()
    end
    local highlight = primaryPart.Parent:FindFirstChild("Highlight")
    if highlight then
        highlight:Destroy()
    end
end

local function ragdollAll()
    while true do
        local success, err = pcall(function()
            if not toysFolder:FindFirstChild("FoodBanana") then
                spawnItem("FoodBanana", Vector3.new(-72.9304581, -5.96906614, -265.543732))
            end
            local banana = toysFolder:WaitForChild("FoodBanana")
            local bananaPeel
            for _, part in pairs(banana:GetChildren()) do
                if part.Name == "BananaPeel" and part:FindFirstChild("TouchInterest") then
                    part.Size = Vector3.new(10, 10, 10)
                    part.Transparency = 1
                    bananaPeel = part
                    break
                end
            end
            local bodyPosition = Instance.new("BodyPosition")
            bodyPosition.P = 20000
            bodyPosition.Parent = banana.Main
            while true do
                for _, player in pairs(Players:GetChildren()) do
                    pcall(function()
                        if player.Character and player.Character ~= playerCharacter then
                            bananaPeel.Position = player.Character.HumanoidRootPart.Position or player.Character.Head.Position
                            bodyPosition.Position = playerCharacter.Head.Position + Vector3.new(0, 600, 0)
                            wait()
                        end
                    end)
                end   
                wait()
            end
        end)
        if not success then
            warn("Error in ragdollAll: " .. tostring(err))
        end
        wait()
    end
end

local Window = Rayfield:CreateWindow({
    Name = "RageByte",
})
    

local GrabTab = Window:CreateTab("Grab", 4483362458)
local ObjectGrabTab = Window:CreateTab("Object Grab", 4483362458)
local DefenseTab = Window:CreateTab("Defense", 4483362458)
local FunTab = Window:CreateTab("Fun", 4483362458)
local AuraTab = Window:CreateTab("Auras", 4483362458)
local CharacterTab = Window:CreateTab("Character", 4483362458)
local KeybindsTab = Window:CreateTab("Keybinds", 4483362458)
local DevTab = Window:CreateTab("Dev Testing", 4483362458)

_G.strength = 400
GrabTab:CreateSlider({
    Name = "Strength",
    Range = {300, 4000},
    Increment = 1,
    CurrentValue = _G.strength,
    Flag = "StrengthSlider",
    Callback = function(value)
        _G.strength = value
    end
})

GrabTab:CreateToggle({
    Name = "Strength",
    CurrentValue = false,
    Flag = "StrengthToggle",
    Callback = function(enabled)
        if enabled then
            strengthConnection = workspace.ChildAdded:Connect(function(model)
                if model.Name == "GrabParts" then
                    local partToImpulse = model.GrabPart.WeldConstraint.Part1
                    if partToImpulse then
                        local velocityObj = Instance.new("BodyVelocity", partToImpulse)
                        model:GetPropertyChangedSignal("Parent"):Connect(function()
                            if not model.Parent then
                                if UserInputService:GetLastInputType() == Enum.UserInputType.MouseButton2 then
                                    print("Launched!")
                                    velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                    velocityObj.Velocity = workspace.CurrentCamera.CFrame.LookVector * _G.strength
                                    Debris:AddItem(velocityObj, 1)
                                else
                                    velocityObj:Destroy()
                                end
                            end
                        end)
                    end
                end
            end)
        elseif strengthConnection then
            strengthConnection:Disconnect()
        end
    end
})

GrabTab:CreateParagraph({Title = "Grab stuff", Content = "These effects apply when you grab someone"})

GrabTab:CreateToggle({
    Name = "Poison Grab",
    CurrentValue = false,
    Flag = "PoisonGrab",
    Callback = function(enabled)
        if enabled then
            poisonGrabCoroutine = coroutine.create(function() grabHandler("poison") end)
            coroutine.resume(poisonGrabCoroutine)
        else
            if poisonGrabCoroutine then
                coroutine.close(poisonGrabCoroutine)
                poisonGrabCoroutine = nil
                for _, part in pairs(poisonHurtParts) do
                    part.Position = Vector3.new(0, -200, 0)
                end
            end
        end
    end
})

GrabTab:CreateToggle({
    Name = "Radioactive Grab",
    CurrentValue = false,
    Flag = "RadioactiveGrab",
    Callback = function(enabled)
        if enabled then
            ufoGrabCoroutine = coroutine.create(function() grabHandler("radioactive") end)
            coroutine.resume(ufoGrabCoroutine)
        else
            if ufoGrabCoroutine then
                coroutine.close(ufoGrabCoroutine)
                ufoGrabCoroutine = nil
                for _, part in pairs(paintPlayerParts) do
                    part.Position = Vector3.new(0, -200, 0)
                end
            end
        end
    end
})

GrabTab:CreateToggle({
    Name = "Fire Grab",
    CurrentValue = false,
    Flag = "FireGrab",
    Callback = function(enabled)
        if enabled then
            fireGrabCoroutine = coroutine.create(fireGrab)
            coroutine.resume(fireGrabCoroutine)
        else
            if fireGrabCoroutine then
                coroutine.close(fireGrabCoroutine)
                fireGrabCoroutine = nil
            end
        end
    end
})

GrabTab:CreateToggle({
    Name = "No-clip Grab",
    CurrentValue = false,
    Flag = "NoclipGrab",
    Callback = function(enabled)
        if enabled then
            noclipGrabCoroutine = coroutine.create(noclipGrab)
            coroutine.resume(noclipGrabCoroutine)
        else
            if noclipGrabCoroutine then
                coroutine.close(noclipGrabCoroutine)
                noclipGrabCoroutine = nil
            end
        end
    end
})

GrabTab:CreateToggle({
    Name = "Kick Grab",
    CurrentValue = false,
    Flag = "KickGrab",
    Callback = function(enabled)
        if enabled then
            kickGrab()
        else
            for _, connection in pairs(kickGrabConnections) do
                connection:Disconnect()
            end
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = player.Character.HumanoidRootPart
                    if hrp:FindFirstChild("FirePlayerPart") then
                        local fpp = hrp.FirePlayerPart
                        fpp.Size = Vector3.new(2.5, 5.5, 2.5)
                        fpp.CollisionGroup = "Default"
                        fpp.CanQuery = false
                    end
                end
            end
            kickGrabConnections = {}
        end
    end
})

GrabTab:CreateParagraph({Title = "All-Features", Content = "Make sure there are no campfires spawned by you BEFORE using this"})

GrabTab:CreateToggle({
    Name = "Fire All",
    CurrentValue = false,
    Callback = function(enabled)
        if enabled then
            fireAllCoroutine = coroutine.create(fireAll)
            coroutine.resume(fireAllCoroutine)
        else
            if fireAllCoroutine then
                coroutine.close(fireAllCoroutine)
                fireAllCoroutine = nil
            end
        end
    end
})

ObjectGrabTab:CreateParagraph({Title = "Object-Only", Content = "These effects only apply on objects."})

ObjectGrabTab:CreateToggle({
    Name = "Anchor Grab",
    CurrentValue = false,
    Flag = "AnchorGrab",
    Callback = function(enabled)
        if enabled then
            if not anchorGrabCoroutine or coroutine.status(anchorGrabCoroutine) == "dead" then
                anchorGrabCoroutine = coroutine.create(anchorGrab)
                coroutine.resume(anchorGrabCoroutine)
            end
        else
            if anchorGrabCoroutine and coroutine.status(anchorGrabCoroutine) ~= "dead" then
                coroutine.close(anchorGrabCoroutine)
                anchorGrabCoroutine = nil
            end
        end
    end
})

ObjectGrabTab:CreateParagraph({Title = "Anchor grab information", Content = "If someone grabs your anchored parts, they will fall and you will need to position them again!"})

ObjectGrabTab:CreateButton({
    Name = "Unanchor parts",
    Callback = cleanupAnchoredParts
})

ObjectGrabTab:CreateParagraph({Title = "Compile?", Content = "(New) This option allows you to compile all the anchored parts into one. To control this 'Build', you need to move the header part. The first part you grabbed will be the header and will be highlighted green"})

ObjectGrabTab:CreateButton({
    Name = "Compile Parts",
    Callback = function()
        compileGroup()
        if not compileCoroutine or coroutine.status(compileCoroutine) == "dead" then
            compileCoroutine = coroutine.create(compileCoroutineFunc)
            coroutine.resume(compileCoroutine)
        end
    end
})

ObjectGrabTab:CreateParagraph({Title = "Disassemble", Content = "De-compiles the build"})

ObjectGrabTab:CreateButton({
    Name = "Disassemble Parts",
    Callback = function()
        cleanupCompiledGroups()
        cleanupAnchoredParts()

        if compileCoroutine and coroutine.status(compileCoroutine) ~= "dead" then
            coroutine.close(compileCoroutine)
            compileCoroutine = nil
        end
    end
})

ObjectGrabTab:CreateButton({
    Name = "Unanchor Header Part",
    Callback = unanchorPrimaryPart
})

DefenseTab:CreateLabel("Anti-Grab")

DefenseTab:CreateToggle({
    Name = "Auto-Struggle",
    CurrentValue = false,
    Flag = "AutoStruggle",
    Callback = function(enabled)
        if enabled then
            autoStruggleCoroutine = RunService.Heartbeat:Connect(function()
                local character = localPlayer.Character
                if character and character:FindFirstChild("Head") then
                    local head = character.Head
                    local partOwner = head:FindFirstChild("PartOwner")
                    if partOwner then
                        Struggle:FireServer()
                        for _, part in pairs(character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.Anchored = true
                            end
                        end
                        while localPlayer.IsHeld.Value do
                            wait()
                        end
                        for _, part in pairs(character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.Anchored = false
                            end
                        end
                    end
                end
            end)
        else
            if autoStruggleCoroutine then
                autoStruggleCoroutine:Disconnect()
                autoStruggleCoroutine = nil
            end
        end
    end
})

DefenseTab:CreateToggle({
    Name = "Anti-Kick",
    CurrentValue = false,
    Flag = "AntiKick",
    Callback = function(enabled)
        if enabled then
            local character = localPlayer.Character
            --SetNetworkOwner:FireServer(character.HumanoidRootPart.FirePlayerPart, character.HumanoidRootPart.FirePlayerPart.CFrame)
            -- SetNetworkOwner:FireServer(character.HumanoidRootPart, character.HumanoidRootPart.CFrame)
            -- SetNetworkOwner:FireServer(character.Head, character.Head.CFrame)
            --experimental methods. use fungus ragdoll event.

            antiKickCoroutine = RunService.Heartbeat:Connect(function()
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart"):FindFirstChild("FirePlayerPart") then
                    local partOwner = character:FindFirstChild("HumanoidRootPart"):FindFirstChild("FirePlayerPart"):FindFirstChild("PartOwner")
                    if partOwner and partOwner.Value ~= localPlayer.Name then
                        SetNetworkOwner:FireServer(character.HumanoidRootPart.FirePlayerPart, character.HumanoidRootPart.FirePlayerPart.CFrame)
                        SetNetworkOwner:FireServer(character.HumanoidRootPart, character.HumanoidRootPart.CFrame)
                        SetNetworkOwner:FireServer(character.Head, character.Head.CFrame)
                        print("grabbity shap!")
                        wait(0.1)
                        Struggle:FireServer()
                    end
                end
            end)
        else
            if antiKickCoroutine then
                antiKickCoroutine:Disconnect()
                antiKickCoroutine = nil
            end
        end
    end
})
DefenseTab:CreateToggle({
    Name = "Anti-Explosion",
    CurrentValue = false,
    Flag = "AntiExplosion",
    Callback = function(enabled)
        if enabled then
            local character = localPlayer.Character
            antiKickCoroutine = RunService.Heartbeat:Connect(function()
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart"):FindFirstChild("FirePlayerPart") then
                    local partOwner = character:FindFirstChild("HumanoidRootPart"):FindFirstChild("FirePlayerPart"):FindFirstChild("PartOwner")
                    if partOwner and partOwner.Value ~= localPlayer.Name then
                        SetNetworkOwner:FireServer(character.HumanoidRootPart.FirePlayerPart, character.HumanoidRootPart.FirePlayerPart.CFrame)
                        print("grabbity shap!")
                        wait(0.1)
                        Struggle:FireServer()
                    end
                end
            end)
        else
            if antiKickCoroutine then
                antiKickCoroutine:Disconnect()
                antiKickCoroutine = nil
            end
        end
    end
})



DefenseTab:CreateLabel("Self-Defense")

DefenseTab:CreateToggle({
    Name = "Self-Defense - Air Suspend",
    CurrentValue = false,
    Flag = "SelfDefenseAirSuspend",
    Callback = function(enabled)
        if enabled then
            autoDefendCoroutine = coroutine.create(function()
                while wait(0.02) do
                    local character = localPlayer.Character
                    if character and character:FindFirstChild("Head") then
                        local head = character.Head
                        local partOwner = head:FindFirstChild("PartOwner")
                        if partOwner then
                            local attacker = Players:FindFirstChild(partOwner.Value)
                            if attacker and attacker.Character then
                                Struggle:FireServer()
                                SetNetworkOwner:FireServer(attacker.Character.Head or attacker.Character.Torso, attacker.Character.HumanoidRootPart.FirePlayerPart.CFrame)
                                task.wait(0.1)
                                local target = attacker.Character:FindFirstChild("Torso")
                                if target then
                                    local velocity = target:FindFirstChild("l") or Instance.new("BodyVelocity")
                                    velocity.Name = "l"
                                    velocity.Parent = target
                                    velocity.Velocity = Vector3.new(0, 50, 0)
                                    velocity.MaxForce = Vector3.new(0, math.huge, 0)
                                    Debris:AddItem(velocity, 100)
                                end
                            end
                        end
                    end
                end
            end)
            coroutine.resume(autoDefendCoroutine)
        else
            if autoDefendCoroutine then
                coroutine.close(autoDefendCoroutine)
                autoDefendCoroutine = nil
            end
        end
    end
})

DefenseTab:CreateToggle({
    Name = "Self-Defense Kick - Silent",
    CurrentValue = false,
    Flag = "SelfDefenseKick",
    Callback = function(enabled)
        if enabled then
            autoDefendKickCoroutine = coroutine.create(function()
                while enabled do
                    local character = localPlayer.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local humanoidRootPart = character.HumanoidRootPart
                        local head = character:FindFirstChild("Head")
                        if head then
                            local partOwner = head:FindFirstChild("PartOwner")
                            if partOwner then
                                local attacker = Players:FindFirstChild(partOwner.Value)
                                if attacker and attacker.Character then
                                    Struggle:FireServer()
                                    SetNetworkOwner:FireServer(attacker.Character.HumanoidRootPart.FirePlayerPart, attacker.Character.HumanoidRootPart.FirePlayerPart.CFrame)
                                    task.wait(0.1)
                                    if not attacker.Character.HumanoidRootPart.FirePlayerPart:FindFirstChild("BodyVelocity") then
                                        local bodyVelocity = Instance.new("BodyVelocity")
                                        bodyVelocity.Name = "BodyVelocity"
                                        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                        bodyVelocity.Velocity = Vector3.new(0, 20, 0)
                                        bodyVelocity.Parent = attacker.Character.HumanoidRootPart.FirePlayerPart
                                    end
                                end
                            end
                        end
                    end
                    wait(0.02)
                end
            end)
            coroutine.resume(autoDefendKickCoroutine)
        else
            if autoDefendKickCoroutine then
                coroutine.close(autoDefendKickCoroutine)
                autoDefendKickCoroutine = nil
            end
        end
    end
})
AuraTab:CreateLabel("Auras")

AuraTab:CreateSlider({
    Name = "Radius",
    Range = {5, 40},
    Increment = 1,
    CurrentValue = auraRadius,
    Callback = function(value)
        auraRadius = value
    end
})

AuraTab:CreateToggle({
    Name = "Air Suspend Aura",
    CurrentValue = false,
    Callback = function(enabled)
        if enabled then
            auraCoroutine = coroutine.create(function()
                while true do
                    local success, err = pcall(function()
                        local character = localPlayer.Character
                        if character and character:FindFirstChild("Head") and character:FindFirstChild("HumanoidRootPart") then
                            local head = character.Head
                            local humanoidRootPart = character.HumanoidRootPart

                            for _, player in pairs(Players:GetPlayers()) do
                                coroutine.wrap(function()
                                    if player ~= localPlayer and player.Character then
                                        local playerCharacter = player.Character
                                        local playerTorso = playerCharacter:FindFirstChild("Torso")
                                        if playerTorso then
                                            local distance = (playerTorso.Position - humanoidRootPart.Position).Magnitude
                                            if distance <= auraRadius then
                                                SetNetworkOwner:FireServer(playerTorso, playerCharacter.HumanoidRootPart.FirePlayerPart.CFrame)
                                                task.wait(0.1)
                                                local velocity = playerTorso:FindFirstChild("l") or Instance.new("BodyVelocity", playerTorso)
                                                velocity.Name = "l"
                                                velocity.Velocity = Vector3.new(0, 50, 0)
                                                velocity.MaxForce = Vector3.new(0, math.huge, 0)
                                                Debris:AddItem(velocity, 100)
                                            end
                                        end
                                    end
                                end)()
                            end
                        end
                    end)
                    if not success then
                        warn("Error in Air Suspend Aura: " .. tostring(err))
                    end
                    wait(0.02)
                end
            end)
            coroutine.resume(auraCoroutine)
        else
            if auraCoroutine then
                coroutine.close(auraCoroutine)
                auraCoroutine = nil
            end
        end
    end
})

AuraTab:CreateToggle({
    Name = "Hell send Aura",
    CurrentValue = false,
    Callback = function(enabled)
        if enabled then
            gravityCoroutine = coroutine.create(function()
                while enabled do
                    local success, err = pcall(function()
                        local character = localPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            local humanoidRootPart = character.HumanoidRootPart

                            for _, player in pairs(Players:GetPlayers()) do
                                if player ~= localPlayer and player.Character then
                                    local playerCharacter = player.Character
                                    local playerTorso = playerCharacter:FindFirstChild("Torso") or playerCharacter:FindFirstChild("UpperTorso")
                                    if playerTorso then
                                        local distance = (playerTorso.Position - humanoidRootPart.Position).Magnitude
                                        if distance <= auraRadius then
                                            SetNetworkOwner:FireServer(playerTorso, humanoidRootPart.FirePlayerPart.CFrame)
                                            task.wait(0.1)
                                            local force = playerTorso:FindFirstChild("GravityForce") or Instance.new("BodyForce")
                                            force.Parent = playerTorso
                                            force.Name = "GravityForce"
                                            for _, part in ipairs(playerCharacter:GetDescendants()) do
                                                if part:IsA("BasePart") then
                                                    part.CanCollide = false
                                                end
                                            end
                                            force.Force = Vector3.new(0, 1200, 0)
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    if not success then
                        warn("Error in Hell send Aura: " .. tostring(err))
                    end
                    wait(0.02)
                end
            end)
            coroutine.resume(gravityCoroutine)
        elseif gravityCoroutine then
            coroutine.close(gravityCoroutine)
            gravityCoroutine = nil
        end
    end
})

AuraTab:CreateToggle({
    Name = "Kick Aura",
    CurrentValue = false,
    Callback = function(enabled)
        if auraToggle == 1 then
            if enabled then
                kickCoroutine = coroutine.create(function()
                    while enabled do
                        local success, err = pcall(function()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                local humanoidRootPart = character.HumanoidRootPart

                                for _, player in pairs(Players:GetPlayers()) do
                                    if player ~= localPlayer and player.Character then
                                        local playerCharacter = player.Character
                                        local playerTorso = playerCharacter:FindFirstChild("Head")

                                        if playerTorso then
                                            local distance = (playerTorso.Position - humanoidRootPart.Position).Magnitude
                                            if distance <= auraRadius then
                                                SetNetworkOwner:FireServer(playerCharacter:WaitForChild("HumanoidRootPart").FirePlayerPart, playerCharacter.HumanoidRootPart.FirePlayerPart.CFrame)
                                                if not platforms[player] then
                                                    local platform = playerCharacter:FindFirstChild("FloatingPlatform") or Instance.new("Part")
                                                    platform.Name = "FloatingPlatform"
                                                    platform.Size = Vector3.new(5, 2, 5)
                                                    platform.Anchored = true
                                                    platform.Transparency = 1
                                                    platform.CanCollide = true
                                                    platform.Parent = playerCharacter
                                                    platforms[player] = platform
                                                end
                                            end
                                        end
                                    end
                                end
                                for player, platform in pairs(platforms) do
                                    if player.Character and player.Character.Humanoid and player.Character.Humanoid.Health > 1 then
                                        local playerHumanoidRootPart = player.Character.HumanoidRootPart
                                        platform.Position = playerHumanoidRootPart.Position - Vector3.new(0, 3.994, 0)
                                    else
                                        platforms[player] = nil
                                    end
                                end
                            end
                        end)
                        if not success then
                            warn("Error in Kick Aura: " .. tostring(err))
                        end
                        wait(0.02)
                    end
                end)
                coroutine.resume(kickCoroutine)
            elseif kickCoroutine then
                coroutine.close(kickCoroutine)
                kickCoroutine = nil
                for _, platform in pairs(platforms) do
                    if platform then
                        platform:Destroy()
                    end
                end
                platforms = {}
            end
        elseif auraToggle == 2 then
            if enabled then
                kickCoroutine = coroutine.create(function()
                    while enabled do
                        local success, err = pcall(function()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                local humanoidRootPart = character.HumanoidRootPart

                                for _, player in pairs(Players:GetPlayers()) do
                                    if player ~= localPlayer and player.Character then
                                        local playerCharacter = player.Character
                                        local playerTorso = playerCharacter:FindFirstChild("Head")

                                        if playerTorso then
                                            local distance = (playerTorso.Position - humanoidRootPart.Position).Magnitude
                                            if distance <= auraRadius then
                                                SetNetworkOwner:FireServer(playerCharacter:WaitForChild("HumanoidRootPart").FirePlayerPart, playerCharacter.HumanoidRootPart.FirePlayerPart.CFrame)
                                                if not playerCharacter.HumanoidRootPart.FirePlayerPart:FindFirstChild("BodyVelocity") then
                                                    local bodyVelocity = Instance.new("BodyVelocity")
                                                    bodyVelocity.Name = "BodyVelocity"
                                                    bodyVelocity.Velocity = Vector3.new(0, 20, 0)
                                                    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                                    bodyVelocity.Parent = playerCharacter.HumanoidRootPart.FirePlayerPart
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                        if not success then
                            warn("Error in Kick Aura (Sky mode): " .. tostring(err))
                        end
                        wait(0.02)
                    end
                end)
                coroutine.resume(kickCoroutine)
            else
                if kickCoroutine then
                    coroutine.close(kickCoroutine)
                    kickCoroutine = nil
                end
            end
        end
    end
})

AuraTab:CreateDropdown({
    Name = "Select Kick Mode",
    Options = {"Sky", "Silent"},
    CurrentOption = "",
    Callback = function(selected)
        if selected == "Sky" then 
            auraToggle = 2 
        else 
            auraToggle = 1 
        end
    end
})

AuraTab:CreateToggle({
    Name = "Poison Aura",
    CurrentValue = false,
    Callback = function(enabled)
        if enabled then
            poisonAuraCoroutine = coroutine.create(function()
                while enabled do
                    local success, err = pcall(function()
                        local character = localPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            local humanoidRootPart = character.HumanoidRootPart

                            for _, player in pairs(Players:GetPlayers()) do
                                if player ~= localPlayer and player.Character then
                                    local playerCharacter = player.Character
                                    local playerTorso = playerCharacter:FindFirstChild("Torso") or playerCharacter:FindFirstChild("UpperTorso")
                                    if playerTorso then
                                        local distance = (playerTorso.Position - humanoidRootPart.Position).Magnitude
                                        if distance <= auraRadius then
                                            local head = playerCharacter:FindFirstChild("Head")
                                            while distance <= auraRadius do
                                                SetNetworkOwner:FireServer(playerTorso, playerCharacter.HumanoidRootPart.CFrame)
                                                distance = (playerTorso.Position - humanoidRootPart.Position).Magnitude
                                                for _, part in pairs(poisonHurtParts) do
                                                    part.Size = Vector3.new(1, 3, 1)
                                                    part.Transparency = 1
                                                    part.Position = head.Position
                                                end
                                                wait()
                                                for _, part in pairs(poisonHurtParts) do
                                                    part.Position = Vector3.new(0, -200, 0)
                                                end
                                            end
                                            for _, part in pairs(poisonHurtParts) do
                                                part.Position = Vector3.new(0, -200, 0)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    if not success then
                        warn("Error in Poison Aura: " .. tostring(err))
                    end
                    wait(0.02)
                end
            end)
            coroutine.resume(poisonAuraCoroutine)
        elseif poisonAuraCoroutine then
            coroutine.close(poisonAuraCoroutine)
            for _, part in pairs(poisonHurtParts) do
                part.Position = Vector3.new(0, -200, 0)
            end
            poisonAuraCoroutine = nil
        end
    end
})
CharacterTab:CreateToggle({
    Name = "Crouch Speed",
    CurrentValue = false,
    Flag = "CrouchSpeed",
    Callback = function(enabled)
        if enabled then
            crouchSpeedCoroutine = coroutine.create(function()
                while true do
                    pcall(function()
                        if not playerCharacter.Humanoid then return end
                        if playerCharacter.Humanoid.WalkSpeed == 5 then
                            playerCharacter.Humanoid.WalkSpeed = crouchWalkSpeed
                        end
                    end)
                    wait()
                end
            end)
            coroutine.resume(crouchSpeedCoroutine)
        elseif crouchSpeedCoroutine then
            coroutine.close(crouchSpeedCoroutine)
            crouchSpeedCoroutine = nil
            if playerCharacter.Humanoid then
                playerCharacter.Humanoid.WalkSpeed = 16
            end
        end
    end
})

CharacterTab:CreateSlider({
    Name = "Set Crouch Speed",
    Range = {6, 1000},
    Increment = 1,
    CurrentValue = crouchWalkSpeed,
    Flag = "SetCrouchSpeed",
    Callback = function(value)
        crouchWalkSpeed = value
    end
})

CharacterTab:CreateToggle({
    Name = "Crouch Jump Power",
    CurrentValue = false,
    Flag = "CrouchJumpPower",
    Callback = function(enabled)
        if enabled then
            crouchJumpCoroutine = coroutine.create(function()
                while true do
                    pcall(function()
                        if not playerCharacter.Humanoid then return end
                        if playerCharacter.Humanoid.JumpPower == 12 then
                            playerCharacter.Humanoid.JumpPower = crouchJumpPower
                        end
                    end)
                    wait()
                end
            end)
            coroutine.resume(crouchJumpCoroutine)
        elseif crouchJumpCoroutine then
            coroutine.close(crouchJumpCoroutine)
            crouchJumpCoroutine = nil
            if playerCharacter.Humanoid then
                playerCharacter.Humanoid.JumpPower = 24
            end
        end
    end
})

CharacterTab:CreateSlider({
    Name = "Set Crouch Jump Power",
    Range = {6, 1000},
    Increment = 1,
    CurrentValue = crouchJumpPower,
    Flag = "SetCrouchJumpPower",
    Callback = function(value)
        crouchJumpPower = value
    end
})
FunTab:CreateLabel("Clone Manipulation (grab them to keep their NetworkOwnership)")

FunTab:CreateSlider({
    Name = "Offset",
    Range = {1, 10},
    Increment = 1,
    CurrentValue = decoyOffset,
    Callback = function(value)
        decoyOffset = value
    end
})

FunTab:CreateInput({
    Name = "Circle Radius",
    PlaceholderText = "Radius for Surround Mode (Adjust based on clones)",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        circleRadius = tonumber(value) or 10
    end
})

FunTab:CreateButton({
    Name = "Decoy Follow",
    Callback = function()
        local decoys = {}
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("Model") and descendant.Name == "YouDecoy" then
                table.insert(decoys, descendant)
            end
        end
        local numDecoys = #decoys
        local midPoint = math.ceil(numDecoys / 2)

        local function updateDecoyPositions()
            for index, decoy in pairs(decoys) do
                local torso = decoy:FindFirstChild("Torso")
                if torso then
                    local bodyPosition = torso:FindFirstChild("BodyPosition")
                    local bodyGyro = torso:FindFirstChild("BodyGyro")
                    if bodyPosition and bodyGyro then
                        local targetPosition
                        if followMode then
                            if playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart") then
                                targetPosition = playerCharacter.HumanoidRootPart.Position
                                local offset = (index - midPoint) * decoyOffset
                                local forward = playerCharacter.HumanoidRootPart.CFrame.LookVector
                                local right = playerCharacter.HumanoidRootPart.CFrame.RightVector
                                targetPosition = targetPosition - forward * decoyOffset + right * offset
                            end
                        else
                            local nearestPlayer = getNearestPlayer()
                            if nearestPlayer and nearestPlayer.Character and nearestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local angle = math.rad((index - 1) * (360 / numDecoys))
                                targetPosition = nearestPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.cos(angle) * circleRadius, 0, math.sin(angle) * circleRadius)
                                bodyGyro.CFrame = CFrame.new(torso.Position, nearestPlayer.Character.HumanoidRootPart.Position)
                            end
                        end

                        if targetPosition then
                            local distance = (targetPosition - torso.Position).Magnitude
                            if distance > stopDistance then
                                bodyPosition.Position = targetPosition
                                if followMode then
                                    bodyGyro.CFrame = CFrame.new(torso.Position, targetPosition)
                                end
                            else
                                bodyPosition.Position = torso.Position
                                bodyGyro.CFrame = torso.CFrame
                            end
                        end
                    end
                end
            end
        end

        local function setupDecoy(decoy)
            local torso = decoy:FindFirstChild("Torso")
            if torso then
                local bodyPosition = Instance.new("BodyPosition")
                local bodyGyro = Instance.new("BodyGyro")
                bodyPosition.Parent = torso
                bodyGyro.Parent = torso
                bodyPosition.MaxForce = Vector3.new(40000, 40000, 40000)
                bodyPosition.D = 100
                bodyPosition.P = 100
                bodyGyro.MaxTorque = Vector3.new(40000, 40000, 40000)
                bodyGyro.D = 100
                bodyGyro.P = 20000
                local connection = RunService.Heartbeat:Connect(function()
                    updateDecoyPositions()
                end)
                table.insert(connections, connection)
                SetNetworkOwner:FireServer(torso, playerCharacter.Head.CFrame)
            end
        end

        for _, decoy in pairs(decoys) do
            setupDecoy(decoy)
        end
        Rayfield:Notify({
            Title = "Notification",
            Content = "Got "..numDecoys.." units. Manually click each unit if they don't move",
            Duration = 6.5,
            Image = 4483362458
         })
    end
})

FunTab:CreateButton({
    Name = "Toggle Mode",
    Callback = function()
        followMode = not followMode
    end
})

FunTab:CreateButton({
    Name = "Disconnect Clones",
    Callback = cleanupConnections(connections)
})
KeybindsTab:CreateSection("Player Keybinds")
KeybindsTab:CreateParagraph({Title = "Tip", Content = "Press while looking at a player"})

KeybindsTab:CreateKeybind({
    Name = "Send To Hell",
    CurrentKeybind = "Z",
    HoldToInteract = false,
    Flag = "SendToHellKeybind",
    Callback = function()
        local mouse = localPlayer:GetMouse()
        local target = mouse.Target
        if target and target:IsA("BasePart") then
            local character = target.Parent
            if target.Name == "FirePlayerPart" then
                character = target.Parent.Parent
            end
            if character:IsA("Model") and character:FindFirstChildOfClass("Humanoid") then
                SetNetworkOwner:FireServer(character.HumanoidRootPart, character.HumanoidRootPart.CFrame)
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") or part:IsA("Part") then
                        part.CanCollide = false
                    end
                end

                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Parent = character.Torso
                bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bodyVelocity.Velocity = Vector3.new(0, -4, 0)
                character.Torso.CanCollide = false
                task.wait(1)
                character.Torso.CanCollide = false
            end
        end
    end
})

KeybindsTab:CreateKeybind({
    Name = "Kick",
    CurrentKeybind = "X",
    HoldToInteract = false,
    Flag = "KickKeybind",
    Callback = function()
        local mouse = localPlayer:GetMouse()
        local target = mouse.Target
        if target and target:IsA("BasePart") then
            local character = target.Parent
            if target.Name == "FirePlayerPart" then
                character = target.Parent.Parent
            end
            if character:IsA("Model") and character:FindFirstChildOfClass("Humanoid") then
                if kickMode == 1 then   
                    SetNetworkOwner:FireServer(character.HumanoidRootPart.FirePlayerPart, character.HumanoidRootPart.FirePlayerPart.CFrame)
                    local bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.Parent = character.HumanoidRootPart.FirePlayerPart
                    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bodyVelocity.Velocity = Vector3.new(0, 20, 0)
                elseif kickMode == 2 then
                    SetNetworkOwner:FireServer(character.HumanoidRootPart.FirePlayerPart, character.HumanoidRootPart.FirePlayerPart.CFrame)
                    local platform = Instance.new("Part")
                    platform.Name = "FloatingPlatform"
                    platform.Size = Vector3.new(5, 2, 5)
                    platform.Anchored = true
                    platform.Transparency = 1
                    platform.CanCollide = true
                    platform.Parent = character
                    while character do
                        wait()
                        platform.Position = character.HumanoidRootPart.Position - Vector3.new(0, 3.994, 0)
                    end 
                end
            end
        end
    end
})

KeybindsTab:CreateDropdown({
    Name = "Select Kick Mode",
    Options = {"Sky", "Silent"},
    CurrentOption = "Silent",
    Callback = function(selected)
        if selected == "Sky" then kickMode = 1 else kickMode = 2 end
    end
})

KeybindsTab:CreateKeybind({
    Name = "Kill (Unstable)",
    CurrentKeybind = "C",
    HoldToInteract = false,
    Flag = "KillKeybind",
    Callback = function()
        local mouse = localPlayer:GetMouse()
        local target = mouse.Target
        if target and target:IsA("BasePart") then
            local character = target.Parent
            if target.Name == "FirePlayerPart" then
                character = target.Parent.Parent
            end
            if character:IsA("Model") and character:FindFirstChildOfClass("Humanoid") then
                SetNetworkOwner:FireServer(character.HumanoidRootPart, character.HumanoidRootPart.CFrame)
                SetNetworkOwner:FireServer(character.Head, character.Head.CFrame)
                for _, motor in pairs(character.Torso:GetChildren()) do
                    SetNetworkOwner:FireServer(character.Head, character.Head.CFrame)
                    if motor:IsA('Motor6D') then motor:Destroy() end
                end
                task.wait(0.5)
                SetNetworkOwner:FireServer(character.Head, character.Head.CFrame)
            end
        end
    end
})

KeybindsTab:CreateKeybind({
    Name = "Burn",
    CurrentKeybind = "V",
    HoldToInteract = false,
    Flag = "BurnKeybind",
    Callback = function()
        local mouse = localPlayer:GetMouse()
        local target = mouse.Target
        if not ownedToys["Campfire"] then 
            Rayfield:Notify({
                Title = "Missing  toy",
                Content = "You do not own the Campfire toy. ",
                Duration = 3,
                Image = 4483362458
            })
            return
        end
        if target and target:IsA("BasePart") then
            local character = target.Parent
            if target.Name == "FirePlayerPart" then
                character = target.Parent.Parent
            end
            if character:IsA("Model") and character:FindFirstChildOfClass("Humanoid") then
                if not toysFolder:FindFirstChild("Campfire") then
                    spawnItem("Campfire", Vector3.new(-72.9304581, -5.96906614, -265.543732))
                end
                local campfire = toysFolder.Campfire
                local firePlayerPart
                SetNetworkOwner:FireServer(character.HumanoidRootPart, character.HumanoidRootPart.CFrame)
                for _, part in pairs(campfire:GetChildren()) do
                    if part.Name == "FirePlayerPart" then
                        part.Size = Vector3.new(9, 9, 9)
                        firePlayerPart = part
                        break
                    end
                end
                firePlayerPart.Position = character.Head.Position or character.HumanoidRootPart.Position
                task.wait(0.5)
                firePlayerPart.Position = Vector3.new(0, -50, 0)
            end
        end
    end
})
KeybindsTab:CreateSection("Object Keybinds")
KeybindsTab:CreateParagraph({Title = "Tip", Content = "Press anywhere"})
KeybindsTab:CreateKeybind({
    Name = "Explode Bomb",
    CurrentKeybind = "B",
    HoldToInteract = false,
    Flag = "ExplodeBombKeybind",
    Callback = function()
        if not ownedToys["BombMissile"] then 
            Rayfield:Notify({
                Title = "Missing  toy",
                Content = "You do not own the BombMissile toy. ",
                Duration = 3,
                Image = 4483362458
                

            })
            return
        end
        local connection
        connection = toysFolder.ChildAdded:Connect(function(child)
            if child.Name == "BombMissile" then
                if child:WaitForChild("ThisToysNumber", 1) then
                    if child.ThisToysNumber.Value == (toysFolder.ToyNumber.Value - 1) then
                        connection:Disconnect()
                        
                        SetNetworkOwner:FireServer(child.PartHitDetector, child.PartHitDetector.CFrame)
                        local bomb = child
                        local args = {
                            [1] = {
                                ["Radius"] = 17.5,
                                ["TimeLength"] = 2,
                                ["Hitbox"] = child.PartHitDetector,
                                ["ExplodesByFire"] = false,
                                ["MaxForcePerStudSquared"] = 225,
                                ["Model"] = child,
                                ["ImpactSpeed"] = 100,
                                ["ExplodesByPointy"] = false,
                                ["DestroysModel"] = false,
                                ["PositionPart"] = child.Body
                            },
                            [2] = child.Body.Position
                        }
                        ReplicatedStorage:WaitForChild("BombEvents"):WaitForChild("BombExplode"):FireServer(unpack(args))

                    end
                end
            end
        end)
        spawnItemCf("BombMissile", playerCharacter.Head.CFrame or playerCharacter.HumanoidRootPart.CFrame)
        wait(1)
        connection:Disconnect()
    end
})
KeybindsTab:CreateKeybind({
    Name = "Throw Bomb",
    CurrentKeybind = "M",
    HoldToInteract = true,
    Flag = "ThrowBombKeybind",
    Callback = function()
        if not ownedToys["BombMissile"] then 
            Rayfield:Notify({
                Title = "Missing  toy",
                Content = "You do not own the BombMissile toy. ",
                Duration = 3,
                Image = 4483362458
                
            })
            return
        end
        
        local connection
        connection = toysFolder.ChildAdded:Connect(function(child)
            if child.Name == "BombMissile" then
                if child:WaitForChild("ThisToysNumber", 1) then
               
                    if child.ThisToysNumber.Value == (toysFolder.ToyNumber.Value - 1) then
           
                        connection:Disconnect()

                        SetNetworkOwner:FireServer(child.PartHitDetector, child.PartHitDetector.CFrame)
                        local velocityObj = Instance.new("BodyVelocity", child.PartHitDetector)
                        velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        velocityObj.Velocity = workspace.CurrentCamera.CFrame.lookVector * 500
                        Debris:AddItem(velocityObj, 10)
                    end
                end
            end
        end)
        spawnItemCf("BombMissile", playerCharacter.Head.CFrame or playerCharacter.HumanoidRootPart.CFrame)
    end
})


KeybindsTab:CreateKeybind({
    Name = "Explode Firework",
    CurrentKeybind = "N",
    HoldToInteract = false,
    Flag = "ExplodeFireworkKeybind",
    Callback = function()
        if not ownedToys["FireworkMissile"] then 
            Rayfield:Notify({
                Title = "Missing  toy",
                Content = "You do not own the FireworkMissile toy. ",
                Duration = 3,
                Image = 4483362458
            })
            return
        end
        spawnItemCf("FireworkMissile", playerCharacter.Head.CFrame or playerCharacter.HumanoidRootPart.CFrame)
        local firework = toysFolder:WaitForChild("FireworkMissile")
        while firework ~= nil do
            arson(firework.Main)
        end
    end
})
KeybindsTab:CreateParagraph({Title = "Tip", Content = "Hold to reload bombs"})
local bombList = {}
local bombDebounce = false
KeybindsTab:CreateKeybind({
    Name = "Bomb Cache Reload",
    CurrentKeybind = "R",
    HoldToInteract = true,
    Flag = "BombCacheReload",
    Callback = function(bool)
        if not localPlayer.CanSpawnToy and localPlayer.CanSpawnToy.Value then return end
        if bombDebounce then return end
        if not ownedToys["BombMissile"] then 
            Rayfield:Notify({
                Title = "Missing toy",
                Content = "You do not own the BombMissile toy.",
                Duration = 3,
                Image = 4483362458
            })
            return
        end
        local connection
        connection = toysFolder.ChildAdded:Connect(function(child)
            if child.Name == "BombMissile" and child:WaitForChild("ThisToysNumber", 1) then
                
                if child and child.ThisToysNumber.Value == (toysFolder.ToyNumber.Value - 1) then
                    local connection2 = toysFolder.ChildRemoved:Connect(function(child2)
                        if child2 == child and bombDebounce then
                            bombDebounce = false
                            connection2:Disconnect()
                            print("Bomb was destroyed, resetting debounce.")
                        end
                    end)
                    bombDebounce = true
                    connection:Disconnect()

                    SetNetworkOwner:FireServer(child.Body, child.Body.CFrame)
                    local waiting = child.Body:WaitForChild("PartOwner", 1)

                    if not waiting then return end
                    if not waiting.Value and waiting.Value ~= localPlayer.Name then
                        bombDebounce = false
                        print("didn't get partowner")
                        return
                    end
                    

                    for _, v in pairs(child:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end

                    child:SetPrimaryPartCFrame(CFrame.new(-72.9304581, -5.96906614, -265.543732))
                    print("cframing main or what")
                    wait()
                    for _, v in pairs(child:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.Anchored = true
                        end
                    end
                    table.insert(bombList, child)

                    child.AncestryChanged:Connect(function()
                        if not child.Parent then
                            for i, bomb in ipairs(bombList) do
                                if bomb == child then
                                    table.remove(bombList, i)
                                    break
                                end
                            end
                        end
                    end)
                    connection2:Disconnect()
                    bombDebounce = false
                end
            end
        end)

        spawnItemCf("BombMissile", playerCharacter.Head.CFrame or playerCharacter.HumanoidRootPart.CFrame)
    end
})
KeybindsTab:CreateKeybind({
    Name = "Explode Cached Bomb",
    CurrentKeybind = "T",
    HoldToInteract = false,
    Flag = "ExplodeCachedBombKeybind",
    Callback = function()
        if #bombList == 0 then 
            Rayfield:Notify({
                Title = "No bombs",
                Content = "There are no cached bombs to explode.",
                Duration = 3
            })
            return
        end

        local bomb = table.remove(bombList, 1)

        local args = {
            [1] = {
                ["Radius"] = 17.5,
                ["TimeLength"] = 2,
                ["Hitbox"] = bomb.PartHitDetector,
                ["ExplodesByFire"] = false,
                ["MaxForcePerStudSquared"] = 225,
                ["Model"] = bomb,
                ["ImpactSpeed"] = 100,
                ["ExplodesByPointy"] = false,
                ["DestroysModel"] = false,
                ["PositionPart"] = localPlayer.Character.HumanoidRootPart or localPlayer.Character.PrimaryPart
            },
            [2] = localPlayer.Character.HumanoidRootPart.Position or localPlayer.Character.PrimaryPart.Position
        }
        ReplicatedStorage:WaitForChild("BombEvents"):WaitForChild("BombExplode"):FireServer(unpack(args))
    end
})
KeybindsTab:CreateKeybind({
    Name = "Explode All Cached Bombs",
    CurrentKeybind = "Y",
    HoldToInteract = false,
    Flag = "ExplodeAllCachedBombsKeybind",
    Callback = function()
        if #bombList == 0 then 
            Rayfield:Notify({
                Title = "No bombs",
                Content = "There are no cached bombs to explode.",
                Duration = 3
            })
            return
        end
        for i, v in ipairs(bombList) do
            local bomb = table.remove(bombList, i)
            local args = {
                [1] = {
                    ["Radius"] = 17.5,
                    ["TimeLength"] = 2,
                    ["Hitbox"] = bomb.PartHitDetector,
                    ["ExplodesByFire"] = false,
                    ["MaxForcePerStudSquared"] = 225,
                    ["Model"] = bomb,
                    ["ImpactSpeed"] = 100,
                    ["ExplodesByPointy"] = false,
                    ["DestroysModel"] = false,
                    ["PositionPart"] = localPlayer.Character.HumanoidRootPart or localPlayer.Character.PrimaryPart
                },
                [2] = localPlayer.Character.HumanoidRootPart.Position or localPlayer.Character.PrimaryPart.Position
            }
            ReplicatedStorage:WaitForChild("BombEvents"):WaitForChild("BombExplode"):FireServer(unpack(args))
        end
    end
})
KeybindsTab:CreateKeybind({
    Name = "Explode All Cached Bombs On Nearest Player",
    CurrentKeybind = "U",
    HoldToInteract = false,
    Flag = "ExplodeAllCachedBombsOnNearestPlayerKeybind",
    Callback = function()
        if #bombList == 0 then 
            Rayfield:Notify({
                Title = "No bombs",
                Content = "There are no cached bombs to explode.",
                Duration = 3
            })
            return
        end
        for i, v in ipairs(bombList) do
            local bomb = table.remove(bombList, i)
            local char = getNearestPlayer().Character
            local args = {
                [1] = {
                    ["Radius"] = 17.5,
                    ["TimeLength"] = 2,
                    ["Hitbox"] = bomb.PartHitDetector,
                    ["ExplodesByFire"] = false,
                    ["MaxForcePerStudSquared"] = 225,
                    ["Model"] = bomb,
                    ["ImpactSpeed"] = 100,
                    ["ExplodesByPointy"] = false,
                    ["DestroysModel"] = false,
                    ["PositionPart"] = char.HumanoidRootPart or char.Torso or char.PrimaryPart
                },
                [2] = char.HumanoidRootPart.Position or char.Torso.Position or char.PrimaryPart.Position
            }
            ReplicatedStorage:WaitForChild("BombEvents"):WaitForChild("BombExplode"):FireServer(unpack(args))
            wait(0.05)
        end
    end
})
DevTab:CreateLabel("Spawn and eat a banana first!")
DevTab:CreateToggle({
    Name = "Ragdoll All",
    CurrentValue = false,
    Callback = function(enabled)
        if enabled then
            ragdollAllCoroutine = coroutine.create(ragdollAll)
            coroutine.resume(ragdollAllCoroutine)
        else
            if ragdollAllCoroutine then
                coroutine.close(ragdollAllCoroutine)
                ragdollAllCoroutine = nil
            end
        end
    end
})
DevTab:CreateButton({
    Name = "Destroy Test",
    Callback = function()
        local stool = toysFolder:FindFirstChild("SpookyStool").Main
        CreateLine:FireServer(stool.CFrame)
    end
})
