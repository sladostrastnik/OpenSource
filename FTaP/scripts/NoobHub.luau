--crack by:magfun_legend
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "noobHub",
    LoadingTitle = “noobHub ロード中...",
    LoadingSubtitle = "by noobScript",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "noobHub",
        FileName = "FlingConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "NoobHub",
        Subtitle = "キーシステム",
        Note = "キー不要",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Settings = {
    FlingEnabled = false,
    AutoFling = false,
    FlingPower = 100,
    FlingRadius = 20,
    SpeedEnabled = false,
    WalkSpeed = 16,
    JumpPowerEnabled = false,
    JumpPower = 50,
    InfiniteJump = false,
    FlyEnabled = false,
    FlySpeed = 50,
    NoClip = false,
    ESP = false,
    Aimbot = false,
    AutoFarm = false,
    TeleportEnabled = false,
    GodMode = false,
    AntiRagdoll = false,
    AutoRespawn = false,
    KillAura = false,
    KillAuraRadius = 10,
    BringAll = false,
    FreezePlayers = false,
    SpinBot = false,
    SpinSpeed = 10,
    TargetPlayer = nil,
    AutoCollect = false,
    AntiAFK = false,
    ChatSpam = false,
    ChatMessage = "NoobHub on top!",
    Invisibility = false
}

-- Fling Tab
local FlingTab = Window:CreateTab("フリング")
local FlingSection = FlingTab:CreateSection("フリング制御")

local FlingToggle = FlingTab:CreateToggle({
    Name = "フリングモードを有効化",
    CurrentValue = false,
    Flag = "FlingToggle",
    Callback = function(Value)
        Settings.FlingEnabled = Value
        if Value then
            Rayfield:Notify({
                Title = "フリングモード",
                Content = "フリングモードが有効化されました！",
                Duration = 3,
            })
        end
    end,
})

local FlingPowerSlider = FlingTab:CreateSlider({
    Name = "フリングパワー",
    Range = {10, 99999},
    Increment = 10,
    Suffix = "パワー",
    CurrentValue = 100,
    Flag = "FlingPower",
    Callback = function(Value)
        Settings.FlingPower = Value
    end,
})

local FlingRadiusSlider = FlingTab:CreateSlider({
    Name = "フリング範囲",
    Range = {5, 100},
    Increment = 5,
    Suffix = "スタッド",
    CurrentValue = 20,
    Flag = "FlingRadius",
    Callback = function(Value)
        Settings.FlingRadius = Value
    end,
})

local AutoFlingToggle = FlingTab:CreateToggle({
    Name = "近くの自動フリング",
    CurrentValue = false,
    Flag = "AutoFling",
    Callback = function(Value)
        Settings.AutoFling = Value
    end,
})

local FlingAllButton = FlingTab:CreateButton({
    Name = "全プレイヤーをフリング",
    Callback = function()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP then
                    local direction = (targetHRP.Position - HumanoidRootPart.Position).Unit
                    local bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.Velocity = direction * Settings.FlingPower
                    bv.Parent = targetHRP
                    game:GetService("Debris"):AddItem(bv, 0.5)
                end
            end
        end
        Rayfield:Notify({
            Title = "全フリング",
            Content = "全プレイヤーをフリング中！",
            Duration = 2,
        })
    end,
})

local KillAuraToggle = FlingTab:CreateToggle({
    Name = "キルオーラ（フリング）",
    CurrentValue = false,
    Flag = "KillAura",
    Callback = function(Value)
        Settings.KillAura = Value
    end,
})

local KillAuraRadiusSlider = FlingTab:CreateSlider({
    Name = "キルオーラ範囲",
    Range = {5, 50},
    Increment = 5,
    Suffix = "スタッド",
    CurrentValue = 10,
    Flag = "KillAuraRadius",
    Callback = function(Value)
        Settings.KillAuraRadius = Value
    end,
})

local SpinBotToggle = FlingTab:CreateToggle({
    Name = "スピンボット",
    CurrentValue = false,
    Flag = "SpinBot",
    Callback = function(Value)
        Settings.SpinBot = Value
    end,
})

local SpinSpeedSlider = FlingTab:CreateSlider({
    Name = "スピンスピード",
    Range = {1, 50},
    Increment = 1,
    Suffix = "スピード",
    CurrentValue = 10,
    Flag = "SpinSpeed",
    Callback = function(Value)
        Settings.SpinSpeed = Value
    end,
})

local MovementTab = Window:CreateTab("移動")
local MovementSection = MovementTab:CreateSection("移動制御")

local SpeedToggle = MovementTab:CreateToggle({
    Name = "スピードブースト",
    CurrentValue = false,
    Flag = "SpeedToggle",
    Callback = function(Value)
        Settings.SpeedEnabled = Value
        if not Value then
            Humanoid.WalkSpeed = 16
        end
    end,
})

local WalkSpeedSlider = MovementTab:CreateSlider({
    Name = "歩行速度",
    Range = {16, 500},
    Increment = 5,
    Suffix = "スピード",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        Settings.WalkSpeed = Value
    end,
})

local JumpToggle = MovementTab:CreateToggle({
    Name = "ジャンプパワーブースト",
    CurrentValue = false,
    Flag = "JumpToggle",
    Callback = function(Value)
        Settings.JumpPowerEnabled = Value
        if not Value then
            Humanoid.JumpPower = 50
        end
    end,
})

local JumpPowerSlider = MovementTab:CreateSlider({
    Name = "ジャンプパワー",
    Range = {50, 500},
    Increment = 10,
    Suffix = "パワー",
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(Value)
        Settings.JumpPower = Value
    end,
})

local InfiniteJumpToggle = MovementTab:CreateToggle({
    Name = "無限ジャンプ",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(Value)
        Settings.InfiniteJump = Value
    end,
})

local FlyToggle = MovementTab:CreateToggle({
    Name = "フライモード",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        Settings.FlyEnabled = Value
    end,
})

local FlySpeedSlider = MovementTab:CreateSlider({
    Name = "フライスピード",
    Range = {10, 300},
    Increment = 5,
    Suffix = "スピード",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(Value)
        Settings.FlySpeed = Value
    end,
})

local NoClipToggle = MovementTab:CreateToggle({
    Name = "ノークリップ",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        Settings.NoClip = Value
    end,
})

local CombatTab = Window:CreateTab("戦闘")
local CombatSection = CombatTab:CreateSection("戦闘機能")

local GodModeToggle = CombatTab:CreateToggle({
    Name = "ゴッドモード",
    CurrentValue = false,
    Flag = "GodMode",
    Callback = function(Value)
        Settings.GodMode = Value
        if Value then
            Humanoid.MaxHealth = math.huge
            Humanoid.Health = math.huge
        else
            Humanoid.MaxHealth = 100
            Humanoid.Health = 100
        end
    end,
})

local AntiRagdollToggle = CombatTab:CreateToggle({
    Name = "アンチラグドール",
    CurrentValue = false,
    Flag = "AntiRagdoll",
    Callback = function(Value)
        Settings.AntiRagdoll = Value
    end,
})

local BringAllToggle = CombatTab:CreateToggle({
    Name = "全プレイヤーを引き寄せ",
    CurrentValue = false,
    Flag = "BringAll",
    Callback = function(Value)
        Settings.BringAll = Value
    end,
})

local FreezePlayers = CombatTab:CreateToggle({
    Name = "全プレイヤーをフリーズ",
    CurrentValue = false,
    Flag = "FreezePlayers",
    Callback = function(Value)
        Settings.FreezePlayers = Value
    end,
})

local InvisibilityToggle = CombatTab:CreateToggle({
    Name = "透明化",
    CurrentValue = false,
    Flag = "Invisibility",
    Callback = function(Value)
        Settings.Invisibility = Value
        if Value then
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = 1
                end
                if part:IsA("Accessory") then
                    part:Destroy()
                end
            end
        else
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = 0
                end
            end
        end
    end,
})

local TeleportTab = Window:CreateTab("テレポート")
local TeleportSection = TeleportTab:CreateSection("テレポートオプション")

local PlayerDropdown = TeleportTab:CreateDropdown({
    Name = "プレイヤー選択",
    Options = {},
    CurrentOption = {"なし"},
    MultipleOptions = false,
    Flag = "PlayerDropdown",
    Callback = function(Option)
        Settings.TargetPlayer = Players:FindFirstChild(Option[1])
    end,
})

local RefreshPlayersButton = TeleportTab:CreateButton({
    Name = "プレイヤーリスト更新",
    Callback = function()
        local playerNames = {}
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player then
                table.insert(playerNames, player.Name)
            end
        end
        PlayerDropdown:Refresh(playerNames)
    end,
})

local TeleportToPlayerButton = TeleportTab:CreateButton({
    Name = "選択したプレイヤーにテレポート",
    Callback = function()
        if Settings.TargetPlayer and Settings.TargetPlayer.Character then
            local targetHRP = Settings.TargetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetHRP then
                HumanoidRootPart.CFrame = targetHRP.CFrame
            end
        end
    end,
})

local TeleportRandomButton = TeleportTab:CreateButton({
    Name = "ランダムなプレイヤーにテレポート",
    Callback = function()
        local allPlayers = Players:GetPlayers()
        local randomPlayer = allPlayers[math.random(1, #allPlayers)]
        if randomPlayer ~= Player and randomPlayer.Character then
            local targetHRP = randomPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetHRP then
                HumanoidRootPart.CFrame = targetHRP.CFrame
            end
        end
    end,
})

local VisualTab = Window:CreateTab("ビジュアル")
local VisualSection = VisualTab:CreateSection("ビジュアル機能")

local ESPToggle = VisualTab:CreateToggle({
    Name = "プレイヤーESP",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(Value)
        Settings.ESP = Value
    end,
})

local FullbrightButton = VisualTab:CreateButton({
    Name = "フルブライト",
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end,
})

local MiscTab = Window:CreateTab("その他")
local MiscSection = MiscTab:CreateSection("その他の機能")

local AntiAFKToggle = MiscTab:CreateToggle({
    Name = "アンチAFK",
    CurrentValue = false,
    Flag = "AntiAFK",
    Callback = function(Value)
        Settings.AntiAFK = Value
    end,
})

local AutoRespawnToggle = MiscTab:CreateToggle({
    Name = "自動リスポーン",
    CurrentValue = false,
    Flag = "AutoRespawn",
    Callback = function(Value)
        Settings.AutoRespawn = Value
    end,
})

local RemoveAccessoriesButton = MiscTab:CreateButton({
    Name = "アクセサリー削除",
    Callback = function()
        for _, accessory in pairs(Character:GetChildren()) do
            if accessory:IsA("Accessory") then
                accessory:Destroy()
            end
        end
    end,
})

local ResetButton = MiscTab:CreateButton({
    Name = "キャラクターリセット",
    Callback = function()
        Character:BreakJoints()
    end,
})

local ChatSpamToggle = MiscTab:CreateToggle({
    Name = "チャットスパム",
    CurrentValue = false,
    Flag = "ChatSpam",
    Callback = function(Value)
        Settings.ChatSpam = Value
    end,
})

local ChatInput = MiscTab:CreateInput({
    Name = "チャットメッセージ",
    PlaceholderText = "メッセージを入力...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        Settings.ChatMessage = Text
    end,
})

local CreditsTab = Window:CreateTab("クレジット")
local CreditsSection = CreditsTab:CreateSection("スクリプト情報")

CreditsTab:CreateParagraph({Title = "スクリプト作成者", Content = "NoobScriptによって作成\nバージョン 1.0 アルティメットエディション"})
CreditsTab:CreateParagraph({Title = "機能", Content = "高度なフリングシステム\n完全な移動制御\nESPおよびビジュアル機能\nオートファームなど"})

local DestroyGUIButton = CreditsTab:CreateButton({
    Name = "GUIを破壊",
    Callback = function()
        Rayfield:Destroy()
    end,
})

RunService.Heartbeat:Connect(function()
    if not Character or not Character.Parent then
        Character = Player.Character
        if Character then
            Humanoid = Character:WaitForChild("Humanoid")
            HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
        end
    end

    if not Character or not HumanoidRootPart then return end

    if Settings.SpeedEnabled then
        Humanoid.WalkSpeed = Settings.WalkSpeed
    end

    if Settings.JumpPowerEnabled then
        Humanoid.JumpPower = Settings.JumpPower
    end

    if Settings.NoClip then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end

    if Settings.FlyEnabled then
        local bodyVel = HumanoidRootPart:FindFirstChild("FlyVelocity") or Instance.new("BodyVelocity")
        bodyVel.Name = "FlyVelocity"
        bodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVel.Parent = HumanoidRootPart
        
        local camera = Workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir = moveDir + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDir = moveDir - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end
        
        bodyVel.Velocity = moveDir.Unit * Settings.FlySpeed
    else
        if HumanoidRootPart:FindFirstChild("FlyVelocity") then
            HumanoidRootPart.FlyVelocity:Destroy()
        end
    end

    if Settings.AutoFling then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP and (targetHRP.Position - HumanoidRootPart.Position).Magnitude <= Settings.FlingRadius then
                    local direction = (targetHRP.Position - HumanoidRootPart.Position).Unit
                    local bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.Velocity = direction * Settings.FlingPower
                    bv.Parent = targetHRP
                    game:GetService("Debris"):AddItem(bv, 0.1)
                end
            end
        end
    end

    if Settings.KillAura then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP and (targetHRP.Position - HumanoidRootPart.Position).Magnitude <= Settings.KillAuraRadius then
                    local bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.Velocity = Vector3.new(0, Settings.FlingPower * 2, 0)
                    bv.Parent = targetHRP
                    game:GetService("Debris"):AddItem(bv, 0.1)
                end
            end
        end
    end

    if Settings.BringAll then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP then
                    targetHRP.CFrame = HumanoidRootPart.CFrame + HumanoidRootPart.CFrame.LookVector * 3
                end
            end
        end
    end

    if Settings.FreezePlayers then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP then
                    targetHRP.Anchored = true
                end
            end
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP then
                    targetHRP.Anchored = false
                end
            end
        end
    end

    if Settings.SpinBot then
        HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(Settings.SpinSpeed), 0)
    end
end)

UserInputService.JumpRequest:Connect(function()
    if Settings.InfiniteJump then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

Player.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = Character:WaitForChild("Humanoid")
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
end)

Humanoid.Died:Connect(function()
    if Settings.AutoRespawn then
        wait(1)
        Player:LoadCharacter()
    end
end)

if Settings.AntiAFK then
    local VirtualUser = game:GetService("VirtualUser")
    Player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

spawn(function()
    while wait(3) do
        if Settings.ChatSpam then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Settings.ChatMessage, "All")
        end
    end
end)

spawn(function()
    while wait(1) do
        if Settings.ESP then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= Player and player.Character then
                    local char = player.Character
                    if not char:FindFirstChild("ESPBox") then
                        local esp = Instance.new("BillboardGui")
                        esp.Name = "ESPBox"
                        esp.AlwaysOnTop = true
                        esp.Size = UDim2.new(0, 100, 0, 50)
                        esp.StudsOffset = Vector3.new(0, 3, 0)
                        esp.Parent = char

                        local frame = Instance.new("Frame")
                        frame.Size = UDim2.new(1, 0, 1, 0)
                        frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                        frame.BackgroundTransparency = 0.5
                        frame.BorderSizePixel = 2
                        frame.Parent = esp
                        
                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.Text = player.Name
                        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        nameLabel.TextScaled = true
                        nameLabel.Parent = frame
                    end
                end
            end
        else
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("ESPBox") then
                    player.Character.ESPBox:Destroy()
                end
            end
        end
    end
end)

Rayfield:Notify({
    Title = "NoobHub ロード完了！",
    Content = "すべての機能が正常に有効化されました！",
    Duration = 5,
})

print("NoobHub Loaded Successfully!")
print("Version: 1.0 Ultimate Edition")
print("Game: Fling Things and People")
