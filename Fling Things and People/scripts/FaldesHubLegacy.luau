local players = game:GetService("Players")
local workspaceService = game:GetService("Workspace")
local replicatedStorage = game:GetService("ReplicatedStorage")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local debris = game:GetService("Debris")
local kavoUILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = players.LocalPlayer:WaitForChild("PlayerGui")

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.2, 0)
textLabel.Position = UDim2.new(0, 0, 0.4, -25)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextScaled = true
textLabel.Text = "Faldes Hub V1 will no longer be updated."
textLabel.Parent = screenGui

local textLabel2 = Instance.new("TextLabel")
textLabel2.Size = UDim2.new(0, 200, 0, 50)
textLabel2.Position = UDim2.new(0.5, -100, 0.9, -25)
textLabel2.BackgroundTransparency = 1
textLabel2.TextColor3 = Color3.new(1, 1, 1)
textLabel2.TextScaled = true
textLabel2.Parent = screenGui

local function f1(p1)
  for i = 10, 0, -1 do
    p1.BackgroundTransparency = i / 10
    wait(0.05)
  end

  p1.Visible = false
end

local function f2(p2)
  p2.BackgroundTransparency = 1
  p2.Visible = true

  for j = 0, 10 do
    p2.BackgroundTransparency = j / 10
    wait(0.05)
  end
end

f2(textLabel)

for k = 0, 100 do
  textLabel2.Text = "Загрузка faldes hub: " .. k .. "%"
  wait(0.05)
end

wait(1)

f1(textLabel)
f1(textLabel2)

wait(2)
local color = Color3.fromRGB(211, 211, 211)
local color2 = Color3.fromRGB(139, 0, 0)
local color3 = Color3.fromRGB(0, 0, 0)
local color4 = Color3.fromRGB(255, 0, 0)
local color5 = Color3.fromRGB(60, 60, 60)

local v1 = kavoUILibrary.CreateLib("[Legacy] Faldes Hub - Fling Things and People  By Arts", {
  SchemeColor = color,
  Background = color2,
  Header = color3,
  TextColor = color4,
  ElementColor = color5,
})

local grabEvents = replicatedStorage:WaitForChild("GrabEvents")
local menuToys = replicatedStorage:WaitForChild("MenuToys")
local characterEvents = replicatedStorage:WaitForChild("CharacterEvents")
grabEvents:WaitForChild("SetNetworkOwner")
characterEvents:WaitForChild("Struggle")

grabEvents:WaitForChild("CreateGrabLine")
grabEvents:WaitForChild("DestroyGrabLine")

menuToys:WaitForChild("DestroyToy")
local localPlayer = players.LocalPlayer

if not localPlayer.Character then
  localPlayer.CharacterAdded:Wait()
end

local grabEvents2 = replicatedStorage:WaitForChild("GrabEvents")
local menuToys2 = replicatedStorage:WaitForChild("MenuToys")
local characterEvents2 = replicatedStorage:WaitForChild("CharacterEvents")
local setNetworkOwner = grabEvents2:WaitForChild("SetNetworkOwner")
local struggle = characterEvents2:WaitForChild("Struggle")

grabEvents2:WaitForChild("CreateGrabLine")
grabEvents2:WaitForChild("DestroyGrabLine")

local destroyToy = menuToys2:WaitForChild("DestroyToy")
local localPlayer2 = players.LocalPlayer

if not localPlayer2.Character then
  localPlayer2.CharacterAdded:Wait()
end

localPlayer2.CharacterAdded:Connect(function(character) end)
local localPlayer3 = players.LocalPlayer
local character2 = localPlayer3.Character or localPlayer3.CharacterAdded:Wait()
localPlayer3.CharacterAdded:Connect(function(character3) character2 = character3 end)
local v2 = 20
local findFirstChild = workspace:FindFirstChild(localPlayer3.Name .. "SpawnedInToys")
local v3 = {}

_G.ToyToLoad = "BombMissile"
_G.MaxMissiles = 9

local function f3(p3, p4)
  local parent = p3.Parent

  while parent do
    if parent == p4 then
      return true
    end

    parent = parent.Parent
  end

  return false
end

_G.BlobmanDelay = 0.005

local function f4(p5)
  destroyToy:FireServer(p5 or findFirstChild:FindFirstChildWhichIsA("Model"))
end

local function f5(p6)
  local v4 = {}

  for index, value in ipairs(workspace.Map:GetDescendants()) do
    if value:IsA("Part") and value.Name == p6 then
      table.insert(v4, value)
    end
  end

  return v4
end

local poisonHurtPart = f5("PoisonHurtPart")
local paintPlayerPart = f5("PaintPlayerPart")

players.PlayerAdded:Connect(function(player) end)
players.PlayerRemoving:Connect(function(player2) end)

for key, value2 in pairs(localPlayer3:WaitForChild("PlayerGui"):WaitForChild("MenuGui"):WaitForChild("Menu"):WaitForChild("TabContents"):WaitForChild("Toys"):WaitForChild("Contents"):GetChildren()) do
  if value2.Name ~= "UIGridLayout" then
    v3[value2.Name] = true
  end
end

local function f6(p7, p8)
  task.spawn(function()
    local vector = Vector3.new(0, 0, 0)
    replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(p7, p8, vector)
  end)
end

local function f7(p9, p10, p11)
  task.spawn(function()
    local cframe = CFrame.new(p10)
    local vector2 = Vector3.new(0, 90, 0)
    replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(p9, cframe, vector2)
  end)
end

local connect

local function f8(p12)
  local ragdolled = p12:WaitForChild("Humanoid"):FindFirstChild("Ragdolled")

  if ragdolled then
    connect = ragdolled:GetPropertyChangedSignal("Value"):Connect(function()
      if ragdolled.Value then
        for index2, value3 in ipairs(p12:GetChildren()) do
          if value3:IsA("BasePart") then
            value3.Anchored = true
          end
        end
      else
        for index3, value4 in ipairs(p12:GetChildren()) do
          if value4:IsA("BasePart") then
            value4.Anchored = false
          end
        end
      end
    end)
  end
end

local function f9(p13)
  while true do
    pcall(function()
      local grabParts = workspace:FindFirstChild("GrabParts")

      if grabParts and grabParts.Name == "GrabParts" then
        local head = grabParts:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent:FindFirstChild("Head")

        if head then
          while true do
            if not workspace:FindFirstChild("GrabParts") then
              break
            end

            local v5 = p13 == "poison" and poisonHurtPart or paintPlayerPart

            for key2, value5 in pairs(v5) do
              value5.Size = Vector3.new(2, 2, 2)
              value5.Transparency = 1
              value5.Position = head.Position
            end

            wait()

            for key3, value6 in pairs(v5) do
              value6.Position = Vector3.new(0, -200, 0)
            end
          end

          for key4, value7 in pairs(partsTable) do
            value7.Position = Vector3.new(0, -200, 0)
          end
        end
      end
    end)

    wait()
  end
end

local f10

local function f11()
  while true do
    pcall(function()
      local grabParts2 = workspace:FindFirstChild("GrabParts")

      if grabParts2 and grabParts2.Name == "GrabParts" then
        local head2 = grabParts2:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent:FindFirstChild("Head")

        if head2 then
          f10(head2)
        end
      end
    end)

    wait()
  end
end

function f10(p14)
  if not findFirstChild:FindFirstChild("Campfire") then
    f7("Campfire", Vector3.new(-72.9304581, -5.96906614, -265.543732))
  end

  local campfire = findFirstChild:FindFirstChild("Campfire")

  local firePlayerPart = campfire:FindFirstChild("FirePlayerPart") or campfire.FirePlayerPart
  firePlayerPart.Size = Vector3.new(7, 7, 7)
  firePlayerPart.Position = p14.Position

  task.wait(0.3)
  firePlayerPart.Position = Vector3.new(0, -50, 0)
end

local function f12()
  while true do
    pcall(function()
      local grabParts3 = workspace:FindFirstChild("GrabParts")

      if grabParts3 and grabParts3.Name == "GrabParts" then
        local parent2 = grabParts3:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent

        if parent2.HumanoidRootPart then
          while true do
            if not workspace:FindFirstChild("GrabParts") then
              break
            end

            for key5, value8 in pairs(parent2:GetChildren()) do
              if value8:IsA("BasePart") then
                value8.CanCollide = false
              end
            end

            wait()
          end

          for key6, value9 in pairs(parent2:GetChildren()) do
            if value9:IsA("BasePart") then
              value9.CanCollide = true
            end
          end
        end
      end
    end)

    wait()
  end
end

local function f13()
  while true do
    local v6, v7 = pcall(function()
      if not findFirstChild:FindFirstChild("FoodBanana") then
        f7("FoodBanana", Vector3.new(-72.9304581, -5.96906614, -265.543732))
      end

      local foodBanana = findFirstChild:WaitForChild("FoodBanana")
      local v8

      for key7, value10 in pairs(foodBanana:GetChildren()) do
        if value10.Name == "BananaPeel" and value10:FindFirstChild("TouchInterest") then
          value10.Size = Vector3.new(10, 10, 10)
          value10.Transparency = 1

          v8 = value10
          break
        end
      end

      local bodyPosition = Instance.new("BodyPosition")
      bodyPosition.P = 20000
      bodyPosition.Parent = foodBanana.Main

      while true do
        for key8, value11 in pairs(players:GetChildren()) do
          local v9 = value11

          pcall(function()
            if v9.Character and v9.Character ~= character2 then
              local v10 = v8

              v10.Position = v9.Character.HumanoidRootPart.Position
                or v9.Character.Head.Position

              bodyPosition.Position = character2.Head.Position + Vector3.new(0, 600, 0)
              wait()
            end
          end)
        end

        wait()
      end
    end)

    if not v6 then
      warn("Error in ragdollAll: " .. tostring(v7))
    end

    wait()
  end
end

local function f14()
  while true do
    local v11, v12 = pcall(function()
      if findFirstChild:FindFirstChild("Campfire") then
        f4(findFirstChild:FindFirstChild("Campfire"))
        wait(0.5)
      end

      f6("Campfire", character2.Head.CFrame)
      local campfire2 = findFirstChild:WaitForChild("Campfire")
      local v13

      for key9, value12 in pairs(campfire2:GetChildren()) do
        if value12.Name == "FirePlayerPart" then
          value12.Size = Vector3.new(10, 10, 10)
          v13 = value12
          break
        end
      end

      setNetworkOwner:FireServer(v13, v13.CFrame)
      character2:MoveTo(v13.Position)
      wait(0.3)
      character2:MoveTo(character2.Torso.Position)

      local bodyPosition2 = Instance.new("BodyPosition")
      bodyPosition2.P = 20000
      bodyPosition2.Position = character2.Head.Position + Vector3.new(0, 600, 0)
      bodyPosition2.Parent = campfire2.Main

      while true do
        for key10, value13 in pairs(players:GetChildren()) do
          local v14 = value13

          pcall(function()
            bodyPosition2.Position = character2.Head.Position + Vector3.new(0, 600, 0)

            if v14.Character and v14.Character.HumanoidRootPart and v14.Character ~= character2 then
              local v15 = v13

              v15.Position = v14.Character.HumanoidRootPart.Position
                or v14.Character.Head.Position

              wait()
            end
          end)
        end

        wait()
      end
    end)

    if not v11 then
      warn("Error in fireAll: " .. tostring(v12))
    end

    wait()
  end
end

local homeTab = v1:NewTab("🏚️ Home")
homeTab:NewSection("Faldes_Hub FTRAP")
homeTab:NewSection("Press M to close Menu")
homeTab:NewSection("Creator Arts")
homeTab:NewSection("Beta tester Tzero")
homeTab:NewSection("Faldes Hub V1 will no longer be updated.")
homeTab:NewSection("Faldes_Hub V1 больше не будет обновляться")
homeTab:NewSection("Join TG Channel - https://t.me/+hgDXqm3iBPM5ZTAy")

homeTab:NewSection("V2 script and more another scripts in Telegram Channel"):NewButton("Faldes Hub V2", "ButtonInfo", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Artss1/Flades_Hub/refs/heads/main/Beta%20Faldes%20Hub%20V2"))()
end)

local newsTab = v1:NewTab("📆 News")
newsTab:NewSection("--------07.04.25--------")
newsTab:NewSection("обновление GUI так же много фиксов")
newsTab:NewSection("Пофикшен баг с Jump,и телепортом")
newsTab:NewSection("так же думаю скоро добавить lag,killall,bring")
newsTab:NewSection("так же добавить дальний захват и без лимитное отдаление")
newsTab:NewSection("--------21.03.25--------")
newsTab:NewSection("Большое обновление")
newsTab:NewSection("Полностью обновлены функции")
newsTab:NewSection("Обновление в PvP,Defense,Mics")
newsTab:NewSection("Добавлен RagdollAll,Aura,")
newsTab:NewSection("Новые KeyBind")
newsTab:NewSection("Полностью пропатчен блоб")
newsTab:NewSection("Исправлен баг с pois")
newsTab:NewSection("Костер хуй его знает как зделать")
newsTab:NewSection("Исправлен баг с Player после смерти")
newsTab:NewSection("--------17.03.25--------")
newsTab:NewSection("Пропатчен Blobman,устранены баги некоторых функций")
newsTab:NewSection("Blobman Worked-Блоб Работает")
newsTab:NewSection("Пофикшен Античит теперь вас не кикнет")
newsTab:NewSection("обнова функций в mics выйдет не скоро")

local pvPTab = v1:NewTab("⚔️ PvP")
local strengthSection = pvPTab:NewSection("💪Strength")
local v16 = 250
local v17 = false

local function f15(p15)
  local part1 = p15.GrabPart.WeldConstraint.Part1
  local instance

  if part1 then
    print("Part found!")
    instance = Instance.new("BodyVelocity", part1)

    p15:GetPropertyChangedSignal("Parent"):Connect(function()
      if not p15.Parent then
        if userInputService:GetLastInputType() == Enum.UserInputType.MouseButton2 and v17 then
          print("Launched!")

          instance.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
          instance.Velocity = workspace.CurrentCamera.CFrame.LookVector * v16

          debris:AddItem(instance, 1)
        elseif userInputService:GetLastInputType() == Enum.UserInputType.MouseButton1 then
          instance:Destroy()
          print("Cancel Launch!")
        else
          instance:Destroy()
          print("No two keys pressed!")
        end
      end
    end)
  end
end

workspaceService.ChildAdded:Connect(function(child)
  if child.Name == "GrabParts" then
    f15(child)
  end
end)

strengthSection:NewToggle("Toggle Fling", "Включить/выключить бросок", function(p16)
  v17 = p16

  if p16 then
    print("Fling Enabled")
  else
    print("Fling Disabled")
  end
end)

strengthSection:NewSlider("Set Strength", "Настройка силы броска", 10000, 0, function(p17)
  v16 = p17
  print("Strength set to: " .. tostring(p17))
end)

local silentAimSection = pvPTab:NewSection("SilentAim")
silentAimSection:NewSlider("Set Silent Aim", "SliderInfo", 50, 0, function(p18) end)
silentAimSection:NewToggle("On Silent Aim", "ToggleInfo", function(p19) print("Toggle On") end)

local grabsSection = pvPTab:NewSection("Grabs")
local v18

grabsSection:NewToggle("🔰NoClip grab", "noclip", function(p20)
  if p20 then
    print("noclip On")
    v18 = coroutine.create(f12)
    coroutine.resume(v18)
  else
    print("noclip Off")

    if v18 then
      coroutine.close(v18)
      v18 = nil
    end
  end
end)

local v19

grabsSection:NewToggle("☣️Poison Grab", "захват яда", function(p21)
  if p21 then
    print("Toggle On")
    v19 = coroutine.create(function() f9("poison") end)
    coroutine.resume(v19)
  else
    print("Toggle Off")

    if v19 then
      coroutine.close(v19)
      v19 = nil

      for key11, value14 in pairs(poisonHurtPart) do
        value14.Position = Vector3.new(0, -200, 0)
      end
    end
  end
end)

local v20

grabsSection:NewToggle("Radioactive Grab", "облучает игроков", function(p22)
  if p22 then
    print("Toggle On")
    v20 = coroutine.create(function() f9("radioactive") end)
    coroutine.resume(v20)
  else
    print("Toggle Off")

    if v20 then
      coroutine.close(v20)
      v20 = nil

      for key12, value15 in pairs(paintPlayerPart) do
        value15.Position = Vector3.new(0, -200, 0)
      end
    end
  end
end)

local v21

grabsSection:NewToggle("Fire Grab", "поджигает игрока", function(p23)
  if p23 then
    print("Toggle On")
    v21 = coroutine.create(f11)
    coroutine.resume(v21)
  else
    print("Toggle Off")

    if v21 then
      coroutine.close(v21)
      v21 = nil
    end
  end
end)

local defenseSection = v1:NewTab("🛡️ Defense"):NewSection("Defense")

defenseSection:NewButton(
  "🔥Anti-Cheat🔥",
  "Другие читеры и античит игры зделают сосо ведь вы не уязвимы ",
  function() print("Anti-cheat Bypas Enabled") end
)

local connect2

defenseSection:NewToggle("⛓️Anti-Grab⛓️", "не дает вас схватить", function(p24)
  if p24 then
    print("Toggle On")

    connect2 = runService.Heartbeat:Connect(function()
      local character4 = localPlayer3.Character

      if character4 and character4:FindFirstChild("Head") then
        if character4.Head:FindFirstChild("PartOwner") then
          struggle:FireServer()
          replicatedStorage.GameCorrectionEvents.StopAllVelocity:FireServer()

          for key13, value16 in pairs(character4:GetChildren()) do
            if value16:IsA("BasePart") then
              value16.Anchored = true
            end
          end

          while localPlayer3.IsHeld.Value do
            wait()
          end

          for key14, value17 in pairs(character4:GetChildren()) do
            if value17:IsA("BasePart") then
              value17.Anchored = false
            end
          end
        end
      end
    end)
  else
    print("Toggle Off")

    if connect2 then
      connect2:Disconnect()
      connect2 = nil
    end
  end
end)

defenseSection:NewToggle("🏹Self-Defense🏹", "ToggleInfo", function(p25)
  if p25 then
    print("Toggle On")

    autoDefendKickCoroutine = coroutine.create(function()
      while true do
        local character5 = localPlayer3.Character

        if character5 and character5:FindFirstChild("HumanoidRootPart") then
          local head3 = character5:FindFirstChild("Head")

          if head3 then
            local partOwner = head3:FindFirstChild("PartOwner")

            if partOwner then
              local findFirstChild2 = players:FindFirstChild(partOwner.Value)

              if findFirstChild2 and findFirstChild2.Character then
                struggle:FireServer()

                setNetworkOwner:FireServer(
                  findFirstChild2.Character.HumanoidRootPart.FirePlayerPart,
                  findFirstChild2.Character.HumanoidRootPart.FirePlayerPart.CFrame
                )

                task.wait(0.1)

                if not findFirstChild2.Character.HumanoidRootPart.FirePlayerPart:FindFirstChild("BodyVelocity") then
                  local bodyVelocity = Instance.new("BodyVelocity")
                  bodyVelocity.Name = "BodyVelocity"
                  bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                  bodyVelocity.Velocity = Vector3.new(0, 20, 0)
                  bodyVelocity.Parent = findFirstChild2.Character.HumanoidRootPart.FirePlayerPart
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
    print("Toggle Off")

    if autoDefendKickCoroutine then
      coroutine.close(autoDefendKickCoroutine)
      autoDefendKickCoroutine = nil
    end
  end
end)

-- https://discord.gg/AwGHNh7Z7T
local connect3

defenseSection:NewToggle("🧹Anti-Kick Grab", "ToggleInfo", function(p26)
  if p26 then
    print("Toggle On")

    connect3 = runService.Heartbeat:Connect(function()
      local character6 = localPlayer3.Character

      if character6 and character6:FindFirstChild("HumanoidRootPart")
        and character6.HumanoidRootPart:FindFirstChild("FirePlayerPart") then
        local partOwner2 = character6.HumanoidRootPart.FirePlayerPart:FindFirstChild("PartOwner")

        if partOwner2 and partOwner2.Value ~= localPlayer3.Name then
          local humanoidRootPart = character6:WaitForChild("HumanoidRootPart")

          replicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote"):FireServer(unpack({
            humanoidRootPart, 0,
          }))

          print("grabbity shap!")
          wait(0.1)
          struggle:FireServer()
        end
      end
    end)
  else
    print("Toggle Off")

    if connect3 then
      connect3:Disconnect()
      connect3 = nil
    end
  end
end)

defenseSection:NewToggle("Anti-explosive", "ToggleInfo", function(p27)
  if p27 then
    print("Toggle On")

    if localPlayer3.Character then
      f8(localPlayer3.Character)
    end

    characterAddedConn = localPlayer3.CharacterAdded:Connect(function(character7)
      if connect then
        connect:Disconnect()
      end

      f8(character7)
    end)
  else
    print("Toggle Off")

    if connect then
      connect:Disconnect()
      connect = nil
    end

    if characterAddedConn then
      characterAddedConn:Disconnect()
      characterAddedConn = nil
    end
  end
end)

local localPlayer4 = players.LocalPlayer

if not localPlayer4.Character then
  localPlayer4.CharacterAdded:Wait()
end

local playerTab = v1:NewTab("💻 Player")
local playerSection = playerTab:NewSection("Player")
local localPlayer5 = players.LocalPlayer
local character8 = localPlayer5.Character or localPlayer5:WaitForChild("Character")
local humanoid = character8:WaitForChild("Humanoid")
local v22 = true
local v23 = false
local walkSpeed = 5
local jumpPower = 12
local connect4

function noclip()
  v22 = false

  connect4 = runService.Stepped:Connect(function()
    if v22 == false and character8 then
      for key15, value18 in pairs(character8:GetDescendants()) do
        if value18:IsA("BasePart") and value18.CanCollide then
          value18.CanCollide = false
        end
      end
    end

    wait(0.21)
  end)
end

function clip()
  if connect4 then
    connect4:Disconnect()
  end

  v22 = true
end

localPlayer5.CharacterAdded:Connect(function(character9)
  character8 = character9
  humanoid = character8:WaitForChild("Humanoid")
end)

playerSection:NewToggle("NoClip", "ON/OFF", function(p28)
  if p28 then
    noclip()
    print("No-clip включен")
  else
    clip()
    print("No-clip отключен")
  end
end)

local function f16()
  if v23 then
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
  end
end

local connect5

playerSection:NewToggle("Infinite Jump On/Off", "Toggle Infinite Jump Power", function(p29)
  v23 = p29

  if p29 then
    print("Infinite Jump On")
    connect5 = userInputService.JumpRequest:Connect(f16)
  else
    print("Infinite Jump Off")

    if connect5 then
      connect5:Disconnect()
      connect5 = nil
    end
  end
end)

local speedSection = playerTab:NewSection("♿ Speed")
local v24

speedSection:NewToggle("Crouch speed on/off", "speed", function(p30)
  if p30 then
    print("Toggle On")

    v24 = coroutine.create(function()
      while true do
        pcall(function()
          if humanoid then
            humanoid.WalkSpeed = walkSpeed
          end
        end)

        wait()
      end
    end)

    coroutine.resume(v24)
  else
    print("Toggle Off")

    if v24 then
      coroutine.close(v24)
      v24 = nil

      if humanoid then
        humanoid.WalkSpeed = 16
      end
    end
  end
end)

speedSection:NewSlider("set speed", "Speed", 1000, 6, function(p31) walkSpeed = p31 end)

local jumpSection = playerTab:NewSection("Jump")
local v25

jumpSection:NewToggle("Crouch Jump Power On/Off", "Toggle Crouch Jump Power", function(p32)
  if p32 then
    print("Crouch Jump Power On")

    v25 = coroutine.create(function()
      while true do
        pcall(function()
          if humanoid then
            humanoid.JumpPower = jumpPower
          end
        end)

        wait()
      end
    end)

    coroutine.resume(v25)
  else
    print("Crouch Jump Power Off")

    if v25 then
      coroutine.close(v25)
      v25 = nil

      if humanoid then
        humanoid.JumpPower = 24
      end
    end
  end
end)

jumpSection:NewSlider("Set Crouch Jump Power", "Adjust the power for crouch jumps", 150, 6, function(p33)
  jumpPower = p33
end)

local auraSection = v1:NewTab("🧿 Aura"):NewSection("Aura")

auraSection:NewSlider("Radius", "Set the radius value", 50, 5, function(p34)
  v2 = p34
  print("Current Radius: " .. p34)
end)

getgenv().Toggled = false
local v26

auraSection:NewToggle("Air Suspend Aura", "Toggle the air suspend aura", function(p35)
  getgenv().Toggled = p35

  if p35 then
    v26 = coroutine.create(function()
      while true do
        local v27, v28 = pcall(function()
          local character10 = localPlayer3.Character

          local humanoidRootPart2 = character10 and character10:FindFirstChild("Head")
            and character10:FindFirstChild("HumanoidRootPart")

          local humanoidRootPart3

          if humanoidRootPart2 then
            humanoidRootPart3 = character10.HumanoidRootPart

            for key16, value19 in pairs(players:GetPlayers()) do
              local v29 = value19

              coroutine.wrap(function()
                if v29 ~= localPlayer3 and v29.Character then
                  local character11 = v29.Character
                  local torso = character11:FindFirstChild("Torso")

                  if torso then
                    if (torso.Position - humanoidRootPart3.Position).Magnitude <= v2 then
                      setNetworkOwner:FireServer(torso, character11.HumanoidRootPart.CFrame)
                      task.wait(0.1)

                      local l = torso:FindFirstChild("l") or Instance.new("BodyVelocity", torso)
                      l.Name = "l"
                      l.Velocity = Vector3.new(0, 50, 0)
                      l.MaxForce = Vector3.new(0, math.huge, 0)

                      debris:AddItem(l, 100)
                    end
                  end
                end
              end)()
            end
          end
        end)

        if not v27 then
          warn("Error in Air Suspend Aura: " .. tostring(v28))
        end

        wait(0.02)
      end
    end)

    coroutine.resume(v26)
  elseif v26 then
    coroutine.close(v26)
    v26 = nil
  end
end)

local v30

auraSection:NewToggle("Poision Aura", "ToggleInfo", function(p36)
  if p36 then
    print("Toggle On")

    v30 = coroutine.create(function()
      while p36 do
        local v31, v32 = pcall(function()
          local character12 = localPlayer3.Character

          if character12 and character12:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart4 = character12.HumanoidRootPart

            for key17, value20 in pairs(players:GetPlayers()) do
              if value20 ~= localPlayer3 and value20.Character then
                local character13 = value20.Character
                local torso2 = character13:FindFirstChild("Torso")

                if torso2 then
                  local magnitude = (torso2.Position - humanoidRootPart4.Position).Magnitude

                  if magnitude <= v2 then
                    local head4 = character13:FindFirstChild("Head")

                    while magnitude <= v2 do
                      setNetworkOwner:FireServer(torso2, character13.HumanoidRootPart.CFrame)
                      magnitude = (torso2.Position - humanoidRootPart4.Position).Magnitude

                      for key18, value21 in pairs(poisonHurtPart) do
                        value21.Size = Vector3.new(1, 3, 1)
                        value21.Transparency = 1
                        value21.Position = head4.Position
                      end

                      wait()

                      for key19, value22 in pairs(poisonHurtPart) do
                        value22.Position = Vector3.new(0, -200, 0)
                      end
                    end

                    for key20, value23 in pairs(poisonHurtPart) do
                      value23.Position = Vector3.new(0, -200, 0)
                    end
                  end
                end
              end
            end
          end
        end)

        if not v31 then
          warn("Error in Poison Aura: " .. tostring(v32))
        end

        wait(0.02)
      end
    end)

    coroutine.resume(v30)
  else
    print("Toggle Off")

    if v30 then
      coroutine.close(v30)

      for key21, value24 in pairs(poisonHurtPart) do
        value24.Position = Vector3.new(0, -200, 0)
      end

      v30 = nil
    end
  end
end)

local blobmanTab = v1:NewTab("⛓️ Blobman")

blobmanTab:NewSection("Blobman"):NewSlider("Destroy server Speed", "SliderInfo", 1, 0.5, function(blobmanDelay)
  _G.BlobmanDelay = blobmanDelay
end)

local v33

blobmanTab:NewSection("🔴 sit on BlobMan after turn on 🔴"):NewToggle("Destroy All", "Control the Blobman", function(p37)
  if p37 then
    print("Toggle On")

    v33 = coroutine.create(function()
      for key22, value25 in pairs(workspaceService:GetDescendants()) do
        if value25.Name == "CreatureBlobman" then
          print("Found CreatureBlobman")

          if value25:FindFirstChild("VehicleSeat")
            and value25.VehicleSeat:FindFirstChild("SeatWeld")
            and f3(value25.VehicleSeat.SeatWeld.Part1, localPlayer3.Character) then
            print("Mounted on blobman")
            break
          end
        end
      end

      print("Out of the loop!")
      print("No mount found")

      Rayfield:Notify({
        Title = "Error",
        Content = "You must be mounted upon a blobman to begin this process. Please mount one and toggle this again!",
        Duration = 3,
        Image = 4483362458,
      })

      blobmanToggle:Set(false)
      coroutine.close(v33)
      v33 = nil
    end)

    coroutine.resume(v33)
  else
    print("Toggle Off")

    if v33 then
      coroutine.close(v33)
      v33 = nil
    end
  end
end)

local micsTab = v1:NewTab("📜 Mics")

local function f17()
  while _G.Disabled do
    for index4, value26 in ipairs(players:GetPlayers()) do
      local v34 = value26
      local v35 = game

      if v34.Name ~= v35:GetService("Players").LocalPlayer.Name then
        pcall(function()
          if v34.Character and v34.Character:FindFirstChild("Head") then
            v34.Character.Head.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
            v34.Character.Head.Transparency = 10
            v34.Character.Head.BrickColor = BrickColor.new("Red")
            v34.Character.Head.Material = "Neon"
            v34.Character.Head.CanCollide = false
            v34.Character.Head.Massless = true
          end
        end)
      end
    end

    wait(2)
  end
end

micsTab:NewSection("Mics"):NewToggle("HitBox", "Изменяет размер и характеристики голов игроков", function(p38)
  if p38 then
    print("Toggle On")
    _G.Disabled = true
    f17()
  else
    print("Toggle Off")
    _G.Disabled = false
  end
end)

local section = micsTab:NewSection("EAT BANANA-On Ragdoll-touch banana")
local v36

section:NewToggle("Ragdoll All", "ToggleInfo", function(p39)
  if p39 then
    print("Toggle On")
    v36 = coroutine.create(f13)
    coroutine.resume(v36)
  else
    print("Toggle Off")

    if v36 then
      coroutine.close(v36)
      v36 = nil
    end
  end
end)

local v37

section:NewToggle("fire all", "поджигает всех игроков", function(p40)
  if p40 then
    print("Toggle On")
    v37 = coroutine.create(f14)
    coroutine.resume(v37)
  else
    print("Toggle Off")

    if v37 then
      v37 = nil
    end
  end
end)

local comingSoonSection = micsTab:NewSection("Coming Soon")

comingSoonSection:NewToggle("Kick All", "ToggleInfo", function(p41)
  if p41 then
    print("Toggle On")
  else
    print("Toggle Off")
  end
end)

comingSoonSection:NewToggle("Tornado", "ToggleInfo", function(p42)
  if p42 then
    print("Toggle On")
  else
    print("Toggle Off")
  end
end)

comingSoonSection:NewToggle("Control", "ToggleInfo", function(p43)
  if p43 then
    print("Toggle On")
  else
    print("Toggle Off")
  end
end)

local functionSection = v1:NewTab("⌨️ KeyBind"):NewSection("function")

functionSection:NewKeybind("Press Z to Teleport ", "Press Z to teleport to your mouse position", Enum.KeyCode.Z, function()
  local localPlayer6 = players.LocalPlayer
  local getMouse = localPlayer6:GetMouse()

  if localPlayer6.Character and localPlayer6.Character:FindFirstChild("Humanoid") then
    localPlayer6.Character:MoveTo(getMouse.Hit.Position)
    print("You just teleported to mouse position!")
  else
    print("No character found!")
  end
end)

functionSection:NewKeybind("Kill Press X", "KeybindInfo", Enum.KeyCode.X, function()
  local target = localPlayer3:GetMouse().Target

  if target and target:IsA("BasePart") then
    local parent3 = target.Parent

    if target.Name == "FirePlayerPart" then
      parent3 = target.Parent.Parent
    end

    if parent3:IsA("Model") and parent3:FindFirstChildOfClass("Humanoid") then
      local humanoidRootPart5 = parent3:FindFirstChild("HumanoidRootPart")
      local head5 = parent3:FindFirstChild("Head")
      local torso3 = parent3:FindFirstChild("Torso")

      if humanoidRootPart5 and head5 then
        setNetworkOwner:FireServer(humanoidRootPart5, humanoidRootPart5.CFrame)
        setNetworkOwner:FireServer(head5, head5.CFrame)

        if torso3 then
          for key23, value27 in pairs(torso3:GetChildren()) do
            if value27:IsA("Motor6D") then
              value27:Destroy()
            end
          end
        end

        task.wait(0.5)
        setNetworkOwner:FireServer(head5, head5.CFrame)
      else
        warn("HumanoidRootPart or Head not found for character.")
      end
    else
      warn("Target is not a valid character model.")
    end
  else
    warn("Target is not a valid BasePart.")
  end
end)

functionSection:NewKeybind("Burn Press V", "KeybindInfo", Enum.KeyCode.V, function()
  local target2 = localPlayer3:GetMouse().Target

  if not v3.Campfire then
    OrionLib:MakeNotification({
      Name = "Missing toy",
      Content = "You do not own the Campfire toy.",
      Image = "rbxassetid://4483345998",
      Time = 3,
    })

    return
  end

  if target2 and target2:IsA("BasePart") then
    local parent4 = target2.Parent

    if target2.Name == "FirePlayerPart" then
      parent4 = target2.Parent.Parent
    end

    if parent4:IsA("Model") and parent4:FindFirstChildOfClass("Humanoid") then
      if not findFirstChild or not findFirstChild:FindFirstChild("Campfire") then
        f7("Campfire", Vector3.new(-72.9304581, -5.96906614, -265.543732))
      end

      local campfire3 = findFirstChild:FindFirstChild("Campfire")

      if campfire3 then
        local v38 = nil
        local humanoidRootPart6 = parent4:FindFirstChild("HumanoidRootPart")
        local head6 = parent4:FindFirstChild("Head")

        if humanoidRootPart6 and head6 then
          setNetworkOwner:FireServer(humanoidRootPart6, humanoidRootPart6.CFrame)

          for key24, value28 in pairs(campfire3:GetChildren()) do
            if value28.Name == "FirePlayerPart" then
              value28.Size = Vector3.new(9, 9, 9)
              v38 = value28
              break
            end
          end

          if v38 then
            v38.Position = head6.Position or humanoidRootPart6.Position
            task.wait(0.5)
            v38.Position = Vector3.new(0, -50, 0)
          else
            warn("FirePlayerPart not found in Campfire.")
          end
        else
          warn("HumanoidRootPart or Head not found for character.")
        end
      else
        warn("Campfire not found in toysFolder.")
      end
    else
      warn("Target is not a valid character model.")
    end
  else
    warn("Target is not a valid BasePart.")
  end
end)

functionSection:NewKeybind("Spawn Bobmb", "KeybindInfo", Enum.KeyCode.Tab, function()
  local connect6

  if not v3.BombMissile then
    OrionLib:MakeNotification({
      Name = "Missing toy",
      Content = "You do not own the BombMissile toy.",
      Image = "rbxassetid://4483345998",
      Time = 3,
    })

    return
  elseif not findFirstChild then
    warn("Toys folder not found.")
    return
  else
    connect6 = nil

    connect6 = findFirstChild.ChildAdded:Connect(function(child2)
      if child2.Name == "BombMissile" then
        local thisToysNumber = child2:FindFirstChild("ThisToysNumber")

        if thisToysNumber then
          if thisToysNumber.Value == findFirstChild.ToyNumber.Value - 1 then
            connect6:Disconnect()
            local partHitDetector = child2:FindFirstChild("PartHitDetector")

            if partHitDetector then
              setNetworkOwner:FireServer(partHitDetector, partHitDetector.CFrame)

              local instance2 = Instance.new("BodyVelocity", partHitDetector)
              instance2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
              instance2.Velocity = workspace.CurrentCamera.CFrame.LookVector * 500

              debris:AddItem(instance2, 10)
            else
              warn("PartHitDetector not found in BombMissile.")
            end
          end
        else
          warn("ThisToysNumber not found in BombMissile.")
        end
      end
    end)

    local character14 = localPlayer3.Character

    if character14 then
      f6("BombMissile", character14.Head.CFrame or character14.HumanoidRootPart.CFrame)
    else
      warn("Player character not found.")
    end

    return
  end
end)

v1:NewTab("⚙️ Setting"):NewSection("Setting"):NewKeybind("On UI", "Переключение пользовательского интерфейса", Enum.KeyCode.M, function()
  kavoUILibrary:ToggleUI()
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Artss1/Flades_Hub/refs/heads/main/%D1%83%D0%B2%D0%B5%D0%B4%D0%BE%D0%BC%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5"))()
