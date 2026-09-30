local PlayersService = game:GetService("Players")
local Debris = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local PhysicsService = game:GetService("ReplicatedStorage")
local viewportFrame = game:GetService("Workspace")
local runService = game:GetService("RunService")
local StarterGui = game:GetService("Lighting")
local DataStoreService = game:GetService("Debris")
local Players2 = game:GetService("TweenService")
local CollectionService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local heap = {}
local middleIndex = math.floor
local offsetX = math.random
local tableRemove = table.remove
local main = string.char
local denominator = 0
local divisor = 2
local result145 = {}

for rowIndex = 1, 256 do
    heap[rowIndex] = rowIndex
end

repeat
    local index97 = tableRemove(heap, (offsetX(1, #heap)))
    result145[index97] = main(index97 - 1)
until #heap == 0

local priorityQueue = {}

local function safeExecute()
    if #priorityQueue == 0 then
        denominator = (denominator * 29 + 8357357260595) % 35184372088832

        repeat
            divisor = divisor * 138 % 257
        until divisor ~= 1

        local remainder = divisor % 32
        local ratio = middleIndex(denominator / 2 ^ (13 - (divisor - remainder) / 32)) % 4294967296 / 2 ^ remainder
        local index105 = middleIndex(ratio % 1 * 4294967296) + middleIndex(ratio)
        local base = index105 % 65536
        local progress = (index105 - base) / 65536
        local digit = base % 256
        local power = progress % 256
        priorityQueue = {digit, (base - digit) / 256, power, (progress - power) / 256}
    end

    return table.remove(priorityQueue)
end

local keys = {}
local tree = setmetatable({}, {__index = keys, __metatable = nil})

local function createVector3(patternString, modulus)
    if keys[modulus] then
    else
        priorityQueue = {}
        denominator = modulus % 35184372088832
        divisor = modulus % 255 + 2
        local vertexCount = string.len(patternString)
        keys[modulus] = ""
        local e = 54

        for dataString = 1, vertexCount do
            e = (string.byte(patternString, dataString) + safeExecute() + e) % 256
            keys[modulus] = keys[modulus] .. result145[e + 1]
        end
    end

    return modulus
end

local notifyExport = loadstring(
    game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua")
)()

loadstring(
    game:HttpGet(
        "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"
    )
)()
loadstring(
    game:HttpGet(
        "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"
    )
)()

local testPlayer = PlayersService.LocalPlayer
local Camera = viewportFrame.CurrentCamera
local newPlayer = PlayersService.LocalPlayer
local result61 = newPlayer:WaitForChild("PlayerGui")

if game.PlaceId ~= 6961824067 then
    newPlayer:Kick("Зайди в FTAP")
    return
end

local
    config, isReady, ArcRemoteEvent, result82, fireId, output, BuoyancyRemoteFunction, HUMANOID,
    instance37, money, clonedScript, result153, billboardGui, purchaseInfo, currentEvidence,
    doorEntity, score, connection, tool, title, result116, str, result117, result118, goal,
    propertyTable, result120, result122, index87, high, low, nearestPlayer, result125, text,
    instance2, valueType, seed, containsSuper, currentNode, screenGui, heartbeatConnection,
    newPosition, dragging, bestAction

if userInputService.TouchEnabled and not userInputService.KeyboardEnabled then
    newPlayer:Kick("Скрипт не поддерживает телефоны")
    return
else
    print("Get Version...")
    wait(1)

    local parsed, result140 = pcall(
        function()
            local compiledFunction = loadstring(
                (game:HttpGet(
                    "https://raw.githubusercontent.com/Artss1/Faldes_X/refs/heads/main/Version"
                ))
            )

            if not compiledFunction then
                return nil
            end

            return compiledFunction()
        end
    )

    print("Version: " .. result140)
    print("Current Version: 3")

    wait(1)

    if not parsed or result140 ~= 3 then
        PlayersService.LocalPlayer:Kick(
            "Версия скрипта устарела, вероятнее всего у вас не оригинальный скрипт"
        )
        return
    else
        local PlayerGui = PhysicsService:WaitForChild("CharacterEvents")
        ArcRemoteEvent = PlayerGui:WaitForChild("RagdollRemote")
        result82 = PlayerGui:WaitForChild("Struggle")
        local newCharacter = PhysicsService:WaitForChild("GrabEvents")
        fireId = newCharacter:WaitForChild("SetNetworkOwner")
        output = newCharacter:WaitForChild("DestroyGrabLine")
        local PlayerCharacter = PhysicsService:WaitForChild("MenuToys")
        BuoyancyRemoteFunction = PlayerCharacter:WaitForChild("SpawnToyRemoteFunction")
        HUMANOID = PlayerCharacter:WaitForChild("DestroyToy")
        instance37 = PhysicsService:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
        money = newPlayer:WaitForChild("IsHeld")

        clonedScript = newPlayer:WaitForChild("PlayerScripts"):WaitForChild(
            "CharacterAndBeamMove", 5
        )

        result153 = viewportFrame:WaitForChild(newPlayer.Name .. "SpawnedInToys", 5)
        billboardGui = nil

        pcall(
            function()
                billboardGui = viewportFrame.Map.Hole.PoisonBigHole:WaitForChild(
                    "ExtinguishPart", 3
                )

                if billboardGui then
                    billboardGui.Size = Vector3.new(0.5, 0.5, 0.5)
                    billboardGui.Transparency = 1

                    if billboardGui:FindFirstChild("Tex") then
                        billboardGui.Tex.Transparency = 1
                    end
                end
            end
        )

        purchaseInfo = {
            Anti = {
                AntiGrab = false, AntiExplosion = false, AntiVoid = false, AntiLag = false,
                AntiKick = false, AntiKickKunai = false, AntiSticky = false, AntiPaint = false,
                AntiGucciBlobman = false, AntiGucciTrain = false, AntiRagdoll = false,
                AntiKillHamburger = false, AntiInputLag = false, AntiInputLagToy = "FoodCoconut",
                AntiFire = false, AntiRagBlob = false, ShurikenAntiKick = false,
                AntiOwnership = false, AntiOwnership2 = false, AntiBananaSit = false,
                AntiBlobmanKill = false, FightBack = false, HouseTpAntiGrab = false,
            },
            Misc = {
                ThirdPerson = false, FPSBooster = false, waterSplash = false,
                waterSplashVolume = 50, cameraShake = false, cameraShakeType = "Position",
                shakeReturnToOriginal = false, fpsHud = false, gamepass = false, masturb = false,
                fakeDeath = false, coconutDick = false, coconutDiggles = false, packetLag = false,
                packetAmount = 100, nameESP = false, pushLocal = false, pushForce = 100,
                FOVChanger = false, FOVValue = 70, explosionMissilesCount = 1, autoCache = false,
                autoCacheCount = 3, phantomPallets = false, toyList = false,
                highlightObjects = false, miniMap = false, palletGod = false, startTrax = false,
                speedTractor = false, nitroActive = false,
            },
            BlobmanBeta = {
                ignoreFriends = false, kickAuraActive = false, kickAllActive = false,
                kickActive = false, kickV2Active = false, kickV3Active = false,
                kickV4Active = false, blobmanKillAllActive = false, loopKillActive = false,
                destroyGucciActive = false, destroyGucciTask = nil, KickDelay = 0.18,
                FloatAmount = 16, driftKickActive = false, kickAllV2Active = false,
                kickMethod = "V2", ignoreHeights = {526.37768554688, 5.2832231521606},
                currentSide = "Left", auraKickedPlayers = {}, selectedTarget = nil,
            },
            PvP = {
                LegitAimEnabled = false, LegitAimHolding = false, LegitAimMode = "Crosshair",
                LegitAimVisible = false, LegitAimSmooth = false, LegitAimSmoothness = 10,
                LegitAimUnsafe = false, LegitAimHitbox = "Body", LegitAimIgnoreFriends = false,
                LegitAimWorkOnNPC = false, SilentAimEnabled = false, SilentAimStrength = 50,
                SilentAimKeybindMode = false, SilentAimKeybind = Enum.KeyCode.Unknown,
                SilentAimKeybindHeld = false, TriggerbotEnabled = false,
            },
            Grab = {
                strength = 5000, EnableThrowStrength = false, VoidGrab = false, NoclipGrab = false,
                MasslessGrab = false, MasslessGrabToys = false, MasslessGrabPlayers = false,
                MasslessWgenPartObject = false, SkyGrab = false, SpinGrab = false,
                FlingGrab = false, InfZoom = false, perspGrabSpeed = 100,
            },
            Aura = {
                auraRadius = 20, auraFriendWhitelist = false, repelAuraForce = 100,
                magnetRange = 50,
            },
            Player = {
                walkspeed = false, walkspeedValue = 1, infiniteJump = false, jumpPower = false,
                jumpPowerValue = 50, noclip = false, fly = false, flySpeed = 50, clickTP = false,
                spinbotSpeed = 10000, wallClimb = false, applyGravity = false, gravityValue = 100,
            },
            Loop = {
                BringAll = false, AntiRagBlob = false, TeleportHeight = -3, TargetPlayers = {},
                OriginalPosition = nil, LastTeleportTime = 0, TeleportCooldown = 0.3,
                ProcessedPlayers = {}, WhitelistFriends = false, floatConnection = nil,
                ownershipKickActive = false, ownershipKickV2Active = false,
                palletRagdollActive = false,
            },
            Telekinesis = {
                Enabled = false, Style = "Circle", Radius = 15, Height = 5, Speed = 10,
                TargetSpawned = false, Toy = "PalletLightBrown", CustomMainPart = nil,
                grabToysFly = false, RotX = 0, RotY = 0, RotZ = 0, lookAtMe = false,
                autoRecover = false, TreeHeight = 20, palletExplore = false,
                freezeHighlight = false, freezeAutoRecover = false, freezeLookAtMain = true,
                crazyRadius = false,
            },
        }

        currentEvidence = {
            connections = {
                antiGrab = nil, antiExplosionChar = nil, thirdPerson = nil, fpsBooster = nil,
                strength = nil,
            }, loops = {kunaiCheck = nil, antiBanana = nil, noclip = nil}, struggleTasks = {},
            antiGucci = {
                safePosition = nil, restoreFrames = 0, connection = nil, safePositionTrain = nil,
                connectionTrain = nil, hasSatThisLife = false, sitTimerTrain = nil,
                trainGucciLoop = false, trainGucciThread = nil, trainCharConn = nil,
            }, paintPartsBackup = {}, paintConnections = {}, currentKunai = nil,
            isBarrierRunning = false, originalSettings = nil, barrierNoclip = false,
            timers = {AntiBananaTimer = 0, LastUpdate = 0, UPDATE_INTERVAL = 0.03, espTimer = 0,},
            IsCharacterInRagdoll = false, Root = nil, HRPs = {}, LastGrabbedTarget = nil,
            snowballRagdollActive = false, snowballRagdollTask = nil, snowballTarget = nil,
            CameraClone = nil, CameraInitialized = false, noclipRunning = false,
            noclipTrackedParts = {}, pcldConn = nil, pcldParts = nil, pcldTime = 0,
            antiKillSpamConnection = nil, antiKillIsHolding = false, antiKillLastActionTime = 0,
            antiFireConn = nil, antiFireOriginalCF = nil, antiRagdollConns = nil,
            gamepassWorking = false, gamepassDiedHandle = nil, gamepassScriptNotify = nil,
            gamepassActivator = nil, antiInputLagConn = nil, antiRagBlobConns = {},
            antiOwnershipConns = {}, antiBananaSitConn = nil, antiBlobmanKillConn = nil,
            fightBackConn = nil, driftKickConn = nil, kickAllV2Conn = nil, miniMapGui = nil,
            miniMapPixels = {}, miniMapPlayerDots = {}, miniMapRenderConn = nil,
            miniMapInputConns = {}, miniMapZoom = 500, miniMapGridRes = 28,
            miniMapOffset = Vector3.zero, miniMapLastScanPos = Vector3.zero,
            miniMapLastScanTime = 0, masturbAnimTrack = nil, masturbLoop = nil, packetLagConn = nil,
            svastonConn = nil, GrabMaintainConnections = {}, phantomPalletsConn = nil,
            palletGodConn = nil, freezePart = nil, cameraAnchor = nil, originalCameraSubject = nil,
            ReachDistance = 30, splashAbove = {}, splashDebounce = {}, splashLastPos = {},
            shakeOffset = CFrame.identity, shakeActive = false, SPLASH_Y_DYNAMIC = -20,
            skyGrabTask = nil, highlightObjectsConn = nil, isRespawning = false,
        }

        doorEntity = {}
        doorEntity._pending = {}
        doorEntity._pendingCount = 0
        doorEntity._dedup = {}
        doorEntity._dedupCount = 0
        doorEntity._maxPerFrame = 12
        doorEntity._frameNum = 0
        doorEntity._running = false
        doorEntity._processing = false
        doorEntity._stats = {totalFires = 0, deduplicated = 0}

        doorEntity._highFreqNames = {
            SetNetworkOwner = true, CreateGrabLine = true, DestroyGrabLine = true, Grab = true,
            Drop = true, RagdollRemote = true, Struggle = true, StickyPartEvent = true,
            DestroyToy = true, StopAllVelocity = true, SpawnToyRemoteFunction = true,
            CreatureGrab = true, CreatureDrop = true, CreatureRelease = true,
        }

        function doorEntity:_makeKey(player76, sortedArray)
            local bytes = {player76.Name}

            for index39 = 1, math.min(#sortedArray, 4) do
                local openError = sortedArray[index39]
                local actualType = typeof(openError)

                if actualType == "Instance" then
                    local requestSuccess, result144 = pcall(
                        function()
                            return openError:GetFullName()
                        end
                    )
                    local index96 = index39 + 1
                    bytes[index96] = requestSuccess and result144 or openError.Name or "destroyed"
                elseif actualType == "Vector3" then
                    bytes[index39 + 1] = "V3_" .. openError.X .. "_" .. openError.Y .. "_" .. openError.Z
                elseif actualType == "CFrame" then
                    bytes[index39 + 1] = "CF_" .. openError.Position.X .. "_" .. openError.Position.Y .. "_" .. openError.Position.Z
                else
                    bytes[index39 + 1] = tostring(openError)
                end
            end

            return table.concat(bytes, "|")
        end

        function doorEntity:Fire(player87, ...)
            local messages = {...}
            self._stats.totalFires = self._stats.totalFires + 1
            local index72 = self:_makeKey(player87, messages)
            local osClock = os.clock()
            local snapshot = self._dedup[index72]

            if snapshot and osClock - snapshot.time < 0.033 then
                self._stats.deduplicated = self._stats.deduplicated + 1
                return
            end

            self._dedup[index72] = {time = osClock}
            self._dedupCount = self._dedupCount + 1
            self._pendingCount = self._pendingCount + 1
            self._pending[self._pendingCount] = {remote = player87, args = messages}
        end

        function doorEntity:ProcessFrame()
            if self._pendingCount == 0 then
                return
            end

            if currentEvidence.isRespawning and not clickAuraEnabled then
                self._pending = {}
                self._pendingCount = 0
                return
            else
                self._processing = true
                local remaining = self._maxPerFrame

                if self._pendingCount > 50 then
                    remaining = math.min(
                        self._maxPerFrame + math.floor(self._pendingCount / 10), 30
                    )
                end

                local rowCount = math.min(self._pendingCount, remaining)

                for i2 = 1, rowCount do
                    local instance46 = self._pending[i2]
                    local callSuccess, fps = pcall(
                        function()
                            instance46.remote:FireServer(unpack(instance46.args))
                        end
                    )

                    if not callSuccess then
                        warn("[Dispatcher] FireServer error:", fps)
                    end
                end

                local result146 = {}

                for i3 = rowCount + 1, self._pendingCount do
                    result146[#result146 + 1] = self._pending[i3]
                end

                self._pending = result146
                self._pendingCount = #result146
                self._processing = false

                return
            end
        end

        function doorEntity:Invoke(RemoteFunction, ...)
            self._stats.totalFires = self._stats.totalFires + 1
            local hashValues = {...}
            local postOk, msg = pcall(
                function()
                    return RemoteFunction:InvokeServer(unpack(hashValues))
                end
            )

            if not postOk then
                warn("[Dispatcher] InvokeServer error:", msg)
            end

            return postOk and msg
        end

        function doorEntity:Start()
            if self._running then
                return
            end

            self._running = true

            task.spawn(
                function()
                    while self._running do
                        self._frameNum = self._frameNum + 1
                        self:ProcessFrame()

                        if self._dedupCount > 500 then
                            local originalTable = {}
                            local startClock = os.clock()

                            for index40, earlier in pairs(self._dedup) do
                                if startClock - earlier.time < 1 then
                                    originalTable[index40] = earlier
                                end
                            end

                            self._dedup = originalTable
                            self._dedupCount = 0

                            for index51 in pairs(originalTable) do
                                self._dedupCount = self._dedupCount + 1
                            end
                        end

                        runService.Heartbeat:Wait()
                    end
                end
            )
        end

        function doorEntity:Stop()
            self._running = false
        end

        function doorEntity.GetStats(player104)
            return
                player104._stats.totalFires, player104._stats.deduplicated, player104._pendingCount
        end

        doorEntity:Start()

        function score(npcModel)
            if not npcModel then
                return
            else
                local Terrain = npcModel:FindFirstChildOfClass("Humanoid")

                if not Terrain then
                    Terrain = npcModel:WaitForChild("Humanoid", 5)
                end

                if not Terrain then
                    return
                end

                Terrain.Died:Connect(
                    function()
                        currentEvidence.isRespawning = true
                    end
                )
                return
            end
        end

        newPlayer.CharacterAdded:Connect(
            function(arguments)
                currentEvidence.isRespawning = false
                score(arguments)
            end
        )

        if newPlayer.Character then
            score(newPlayer.Character)
        end

        pcall(
            function()
                local originalDrawNew

                originalDrawNew = hookmetamethod(
                    game, "__namecall",
                    newcclosure(
                        function(finalBid, ...)
                            if doorEntity._processing then
                                return originalDrawNew(finalBid, ...)
                            else
                                local methodName = getnamecallmethod()

                                if methodName == "FireServer" then
                                    if currentEvidence.isRespawning and not clickAuraEnabled then
                                        local preOk, index98 = pcall(
                                            function()
                                                return finalBid.Name
                                            end
                                        )

                                        if preOk and doorEntity._highFreqNames[index98] then
                                            return nil
                                        end
                                    end

                                    local loaded, index99 = pcall(
                                        function()
                                            return finalBid.Name
                                        end
                                    )

                                    if loaded and doorEntity._highFreqNames[index99] then
                                        doorEntity:Fire(finalBid, ...)
                                        return nil
                                    end
                                end

                                if methodName == "InvokeServer" then
                                    local success11, index100 = pcall(
                                        function()
                                            return finalBid.Name
                                        end
                                    )

                                    if success11 and doorEntity._highFreqNames[index100] then
                                        return doorEntity:Invoke(finalBid, ...)
                                    end

                                    return originalDrawNew(finalBid, ...)
                                end

                                return originalDrawNew(finalBid, ...)
                            end
                        end
                    )
                )
            end
        )

        connection = nil
        tool = nil
        title = nil

        result116 = {}

        function result116.GetPlayerCharacter()
            local copy = newPlayer.Character

            if copy and copy:FindFirstChild("HumanoidRootPart") and copy:FindFirstChildOfClass(
                "Humanoid"
            ) then
                return copy
            end
        end

        function result116.GetPlayerRootPart()
            local character28 = result116.GetPlayerCharacter()
            return character28 and (character28:FindFirstChild("HumanoidRootPart") or character28:FindFirstChild(
                "Torso"
            ))
        end

        function result116.GetPlayerCFrame()
            local result147 = result116.GetPlayerRootPart()
            return result147 and result147.CFrame
        end

        function result116.getHum(args)
            return args and args:FindFirstChildOfClass("Humanoid")
        end

        function result116.getRoot(pointB)
            return pointB and (pointB:FindFirstChild("HumanoidRootPart") or pointB:FindFirstChild(
                "Torso"
            ))
        end

        function result116.waitForChild(player31, moduleName, deferrals)
            local currentTime9 = tick()

            while tick() - currentTime9 < (deferrals or 5) do
                local result9 = player31:FindFirstChild(moduleName)

                if result9 then
                    return result9
                end

                task.wait(0.1)
            end

            return nil
        end

        function str(player52)
            return false
        end

        result117 = {}

        function result117.SetNetworkOwner(newPrice, value11)
            if not newPrice or not newPrice.Parent then
                return
            end

            doorEntity:Fire(fireId, newPrice, value11 or result116.GetPlayerCFrame())
        end

        function result117.DestroyGrabLine(quest)
            if not quest then
                return
            end

            doorEntity:Fire(output, quest)
        end

        result118 = {}

        function result118.setupAntiGrabV1()
            money.Changed:Connect(
                function(value12)
                    local index = value12 and purchaseInfo.Anti.AntiGrab
                    local dummyPart, index101, candidate

                    if index then
                        dummyPart = (newPlayer.Character or newPlayer.CharacterAdded:Wait()):WaitForChild(
                            "HumanoidRootPart"
                        )
                        index101 = 0

                        candidate = nil

                        candidate = runService.Heartbeat:Connect(
                            function()
                                if money.Value then
                                    local currentTime10 = tick()

                                    if currentTime10 - index101 < 0.1 then
                                        return
                                    end

                                    index101 = currentTime10

                                    dummyPart.Velocity = Vector3.new()
                                    dummyPart.Anchored = true

                                    result82:FireServer(newPlayer)
                                    ArcRemoteEvent:FireServer(dummyPart, 0)
                                    return
                                end

                                dummyPart.Velocity = Vector3.new()
                                dummyPart.Anchored = false

                                candidate:Disconnect()
                            end
                        )
                    end
                end
            )
        end

        function result118.startStruggleLoop()
            local identifier = newPlayer.Character

            if not identifier or currentEvidence.struggleTasks[identifier] then
                return
            end

            currentEvidence.struggleTasks[identifier] = true

            task.spawn(
                function()
                    while currentEvidence.struggleTasks[identifier] do
                        local character14 = identifier:FindFirstChild("Head")

                        if character14 and character14:FindFirstChild("PartOwner") and money.Value then
                            pcall(
                                function()
                                    result82:FireServer()
                                    local player10 = PhysicsService:FindFirstChild(
                                        "GameCorrectionEvents"
                                    )

                                    if player10 then
                                        local result81 = player10:FindFirstChild("StopAllVelocity")

                                        if result81 then
                                            result81:FireServer()
                                        end
                                    end
                                end
                            )

                            task.wait(0.1)
                        else
                            currentEvidence.struggleTasks[identifier] = nil
                            break
                        end
                    end
                end
            )
        end

        function result118.enableAntiGrabSolaris()
            if currentEvidence.connections.antiGrab then
                currentEvidence.connections.antiGrab:Disconnect()
            end

            local index102 = 0
            local Heartbeat = runService.Heartbeat

            currentEvidence.connections.antiGrab = Heartbeat:Connect(
                function()
                    local currentTime11 = tick()

                    if currentTime11 - index102 < 0.04 then
                        return
                    else
                        index102 = currentTime11
                        local err = newPlayer.Character

                        if err and err:FindFirstChild("Head") then
                            if err.Head:FindFirstChild("PartOwner") and money.Value then
                                result118.startStruggleLoop()
                            end
                        end

                        return
                    end
                end
            )
        end

        function result118.disableAntiGrabSolaris()
            if currentEvidence.connections.antiGrab then
                currentEvidence.connections.antiGrab:Disconnect()
                currentEvidence.connections.antiGrab = nil
            end

            for index61 in pairs(currentEvidence.struggleTasks) do
                currentEvidence.struggleTasks[index61] = nil
            end
        end

        function result118.setupAntiExplosion(player69)
            if not player69:WaitForChild("Humanoid", 5) or not player69:WaitForChild(
                "HumanoidRootPart", 5
            ) then
                return
            end

            if connection then
                connection:Disconnect()
            end

            connection = viewportFrame.ChildAdded:Connect(
                function(targetPart)
                    if not purchaseInfo.Anti.AntiExplosion then
                        return
                    else
                        local container = newPlayer.Character
                        local player13 = container and container:FindFirstChild("Humanoid")
                        local basePart = container and container:FindFirstChild("HumanoidRootPart")

                        if not player13 or not basePart then
                            return
                        end

                        if targetPart:IsA("BasePart") and (targetPart.Position - basePart.Position).Magnitude <= 20 then
                            if player13.SeatPart ~= nil then
                                basePart.Anchored = true
                                task.wait(0.03)

                                basePart.AssemblyLinearVelocity = Vector3.zero
                                basePart.AssemblyAngularVelocity = Vector3.zero
                                basePart.Anchored = false
                            else
                                basePart.Anchored = true
                                task.wait()
                                player13:ChangeState(Enum.HumanoidStateType.Running)
                                basePart.Anchored = false
                                player13.AutoRotate = true

                                for childNode, player213 in ipairs(container:GetDescendants()) do
                                    if player213:IsA("BasePart") and player213.Name == "RagdollLimbPart" then
                                        player213.CanCollide = false
                                    end
                                end
                            end
                        end

                        return
                    end
                end
            )
        end

        function result118.createKunaiMessageGui()
            if tool then
                return
            end

            tool = Instance.new("ScreenGui")
            tool.Name = "KunaiMessageGui"
            tool.ResetOnSpawn = false
            tool.Parent = result61

            title = Instance.new("TextLabel")
            title.Size = UDim2.new(0, 480, 0, 38)
            title.Position = UDim2.new(0, 16, 1, -60)
            title.AnchorPoint = Vector2.new(0, 1)
            title.BackgroundTransparency = 1
            title.TextColor3 = Color3.fromRGB(255, 240, 120)
            title.Font = Enum.Font.Code
            title.TextSize = 18
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.TextTransparency = 1
            title.RichText = true
            title.Parent = tool
        end

        goal = TweenInfo.new(0.3, Enum.EasingStyle.Linear)
        propertyTable = TweenInfo.new(0.6, Enum.EasingStyle.Linear)

        function result118.typeKunaiMessage(sourceString, value13)
            local intervalSeconds = value13
            intervalSeconds = intervalSeconds or 0.038

            if not title then
                result118.createKunaiMessageGui()
            end

            title.Text = ""
            Players2:Create(title, goal, {TextTransparency = 0}):Play()

            task.spawn(
                function()
                    for startIndex = 1, #sourceString do
                        title.Text = sourceString:sub(1, startIndex)
                        task.wait(intervalSeconds)
                    end

                    task.wait(2.5)
                    Players2:Create(title, propertyTable, {TextTransparency = 1}):Play()
                end
            )
        end

        function result118.getRightLeg(player70)
            return player70:FindFirstChild("Right Leg") or player70:FindFirstChild("RightFoot") or player70:FindFirstChild(
                "RightLowerLeg"
            ) or player70:FindFirstChild("RightUpperLeg")
        end

        function result118.cleanupMyKunaiToys()
            if not result153 then
                return
            end

            for sampleIndex, value36 in ipairs(result153:GetChildren()) do
                local player214 = value36

                if player214.Name == "NinjaKunai" or player214.Name == "NinjaShuriken" or player214.Name == "AntiKick" then
                    pcall(
                        function()
                            HUMANOID:FireServer(player214)
                        end
                    )
                end
            end
        end

        function result118.attachKunai(player71)
            local result148, messageType, previous, index75, message

            if currentEvidence.kunaiAttaching then
                return
            else
                currentEvidence.kunaiAttaching = true

                if currentEvidence.currentKunai and currentEvidence.currentKunai.Parent then
                    pcall(
                        function()
                            HUMANOID:FireServer(currentEvidence.currentKunai)
                        end
                    )
                    currentEvidence.currentKunai = nil
                end

                task.wait(0.15)
                local player215 = result116.GetPlayerCharacter()

                if not player215 then
                    currentEvidence.kunaiAttaching = false
                    return
                else
                    local success6 = player215:FindFirstChild("HumanoidRootPart")

                    if not success6 then
                        currentEvidence.kunaiAttaching = false
                        return
                    end

                    result148 = result118.getRightLeg(player215)

                    if not result148 then
                        currentEvidence.kunaiAttaching = false
                        return
                    end

                    messageType = success6.CFrame * CFrame.new(0, 0, 10)

                    task.spawn(
                        function()
                            pcall(
                                function()
                                    BuoyancyRemoteFunction:InvokeServer(
                                        "NinjaKunai", messageType, Vector3.new(0, 0, 0)
                                    )
                                end
                            )
                        end
                    )

                    previous = nil

                    for info = 1, 20 do
                        task.wait(0.1)
                        previous = result153 and result153:FindFirstChild("NinjaKunai")

                        if previous and previous:FindFirstChild("StickyPart") then
                            break
                        end

                        previous = nil
                    end

                    if not previous or not previous:FindFirstChild("StickyPart") then
                        currentEvidence.kunaiAttaching = false
                        return
                    end

                    index75 = previous.StickyPart

                    for minimum = 1, 5 do
                        task.spawn(
                            function()
                                pcall(
                                    function()
                                        local randomX = math.random(-10, 10)
                                        local random = math.random(-10, 10)
                                        local randomY = math.random(-8, 8)
                                        local y = CFrame.new(
                                            randomX / 100, random / 100, randomY / 100
                                        )
                                        fireId:FireServer(index75, result148.CFrame * y)
                                    end
                                )
                            end
                        )

                        if minimum < 5 then
                            task.wait(0.05)
                        end
                    end

                    message = CFrame.new(
                        0.0490287527, 0.5, 0, 0, 0.00739139877, -0.999561906, -0.998452604,
                        -0.0478846952, 0.0282763243, -0.0476547107, 0.99882561, 0
                    )

                    for particle = 1, 5 do
                        task.spawn(
                            function()
                                pcall(
                                    function()
                                        instance37:FireServer(index75, result148, message)
                                    end
                                )
                            end
                        )

                        if particle < 5 then
                            task.wait(0.05)
                        end
                    end

                    task.spawn(
                        function()
                            for index103, player216 in previous:GetDescendants() do
                                if player216:IsA("BasePart") then
                                    player216.CanTouch = false
                                    player216.CanCollide = false
                                    player216.CanQuery = false
                                end
                            end
                        end
                    )

                    currentEvidence.currentKunai = previous
                    currentEvidence.kunaiAttaching = false

                    return
                end
            end
        end

        function result118.isKunaiAttached()
            if not purchaseInfo.Anti.AntiKickKunai then
                return false
            elseif not result153 then
                return false
            else
                local player217 = nil

                for index104, player218 in result153:GetChildren() do
                    if player218.Name == "NinjaKunai" then
                        player217 = player218
                        break
                    end
                end

                if not player217 or not player217:FindFirstChild("StickyPart") then
                    return false
                else
                    local result149 = result118.getRightLeg(result116.GetPlayerCharacter())

                    if not result149 then
                        return false
                    else
                        local character17 = player217.StickyPart
                        local weld = character17:FindFirstChild("StickyWeld")

                        if weld and weld.Part1 == result149 then
                            return true
                        end

                        return (character17.Position - result149.Position).Magnitude < 7
                    end
                end
            end
        end

        function result118.setTouchQuery(player72)
            local scrollingFrame = viewportFrame:FindFirstChild(newPlayer.Name)

            if not scrollingFrame then
                return
            end

            for site, player219 in ipairs(scrollingFrame:GetChildren()) do
                if player219:IsA("Part") or player219:IsA("BasePart") then
                    player219.CanTouch = player72
                    player219.CanQuery = player72
                end
            end
        end

        function result118.deleteAllPaintParts()
            for index7, template in ipairs(viewportFrame:GetDescendants()) do
                if template:IsA("BasePart") and template.Name == "PaintPlayerPart" then
                    local priority = template:Clone()
                    priority.Archivable = true

                    currentEvidence.paintPartsBackup[template:GetDebugId()] = {
                        clone = priority, parent = template.Parent
                    }
                    template:Destroy()
                end
            end
        end

        function result118.restorePaintParts()
            for index62, newNode in pairs(currentEvidence.paintPartsBackup) do
                if newNode.clone and newNode.parent then
                    newNode.clone.Parent = newNode.parent
                end
            end

            currentEvidence.paintPartsBackup = {}
        end

        function result118.watchNewPaintParts()
            local signal = viewportFrame.DescendantAdded

            table.insert(
                currentEvidence.paintConnections,
                signal:Connect(
                    function(guiObject)
                        if guiObject:IsA("BasePart") and guiObject.Name == "PaintPlayerPart" then
                            task.defer(
                                function()
                                    if guiObject and guiObject.Parent then
                                        local clone = guiObject:Clone()
                                        clone.Archivable = true

                                        currentEvidence.paintPartsBackup[guiObject:GetDebugId()] = {
                                            clone = clone, parent = guiObject.Parent
                                        }
                                        guiObject:Destroy()
                                    end
                                end
                            )
                        end
                    end
                )
            )
        end

        function result118.disconnectWatchers()
            for index17, chatConnection in ipairs(currentEvidence.paintConnections) do
                if chatConnection.Connected then
                    chatConnection:Disconnect()
                end
            end

            currentEvidence.paintConnections = {}
        end

        function result118.spawnBlobmanForGucci()
            local results = newPlayer.Character
            local result35 = results and results:FindFirstChild("HumanoidRootPart")
            local sum = result35 and result35.CFrame or CFrame.new(0, 50, 0)

            pcall(
                function()
                    BuoyancyRemoteFunction:InvokeServer(
                        "CreatureBlobman", sum, Vector3.new(0, 0, 0)
                    )
                end
            )
        end

        function result118.startAntiGucci()
            local capacity = newPlayer.Character or newPlayer.CharacterAdded:Wait()
            local Humanoid = capacity:WaitForChild("Humanoid")
            local instance13 = capacity:WaitForChild("HumanoidRootPart")
            currentEvidence.antiGucci.safePosition = instance13.CFrame

            local function cleanupResources()
                local character5 = viewportFrame:FindFirstChild(newPlayer.Name .. "SpawnedInToys")

                local hit = character5 and character5:FindFirstChild("CreatureBlobman")

                if not hit or not hit.Parent then
                    result118.spawnBlobmanForGucci()
                    task.wait(1)

                    local character9 = viewportFrame:FindFirstChild(
                        newPlayer.Name .. "SpawnedInToys"
                    )

                    hit = character9 and character9:FindFirstChild("CreatureBlobman")
                end

                return hit
            end

            local EquipmentSlot = cleanupResources()

            if not EquipmentSlot then
                return
            end

            local emitter = EquipmentSlot:FindFirstChildWhichIsA("VehicleSeat", true)
            local remoteEvent, index74, item, result150

            if not emitter then
                return
            else
                instance13.CFrame = emitter.CFrame + Vector3.new(0, 2, 0)
                task.wait()
                local result13 = PhysicsService:FindFirstChild("GrabEvents")
                remoteEvent = result13 and result13:FindFirstChild("CreateGrabLine")
                index74 = result13 and result13:FindFirstChild("SetNetworkOwner")
                item = result13 and result13:FindFirstChild("DestroyGrabLine")
                result150 = true
                emitter:Sit(Humanoid)

                task.spawn(
                    function()
                        local total = 0

                        while result150 do
                            for index28, value37 in ipairs(EquipmentSlot:GetDescendants()) do
                                local player220 = value37

                                if player220:IsA("BasePart") then
                                    if total % 3 == 0 then
                                        pcall(
                                            function()
                                                index74:FireServer(player220, instance13.CFrame)
                                            end
                                        )
                                    elseif total % 3 == 1 then
                                        pcall(
                                            function()
                                                remoteEvent:FireServer(
                                                    player220, Vector3.zero, player220.Position,
                                                    false
                                                )
                                            end
                                        )
                                    else
                                        pcall(
                                            function()
                                                item:FireServer(player220)
                                            end
                                        )
                                    end
                                end
                            end

                            total = total + 1
                            task.wait(0.035)
                        end
                    end
                )

                local currentTime12 = tick()

                while tick() - currentTime12 < 0.5 and purchaseInfo.Anti.AntiGucciBlobman do
                    pcall(
                        function()
                            ArcRemoteEvent:FireServer(instance13, 0)
                            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    )

                    runService.Heartbeat:Wait()
                end

                result150 = false
                local result64 = EquipmentSlot.PrimaryPart or EquipmentSlot:FindFirstChildWhichIsA(
                    "BasePart", true
                )

                if result64 then
                    pcall(
                        function()
                            fireId:FireServer(result64, instance13.CFrame)
                        end
                    )
                    pcall(
                        function()
                            sethiddenproperty(result64, "NetworkIsSleeping", false)
                        end
                    )
                end

                pcall(
                    function()
                        emitter:Destroy()
                    end
                )
                task.wait(0.1)

                if Humanoid then
                    Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    Humanoid.Sit = false
                end

                task.wait(0.05)
                instance13.CFrame = currentEvidence.antiGucci.safePosition

                pcall(
                    function()
                        if EquipmentSlot:FindFirstChild("Head") then
                            EquipmentSlot.Head.CFrame = CFrame.new(0, 50000, 0)
                            EquipmentSlot.Head.Anchored = true
                        end
                    end
                )

                return
            end
        end

        function result118.stopAntiGucci()
            purchaseInfo.Anti.AntiGucciBlobman = false

            if currentEvidence.antiGucci.connection then
                currentEvidence.antiGucci.connection:Disconnect()
                currentEvidence.antiGucci.connection = nil
            end

            local offset = newPlayer.Character

            if offset then
                local result47 = offset:FindFirstChild("HumanoidRootPart")
                local pointLight = offset:FindFirstChildOfClass("Humanoid")

                if result47 and currentEvidence.antiGucci.safePosition then
                    result47.CFrame = currentEvidence.antiGucci.safePosition
                end

                if pointLight then
                    pointLight.Sit = false
                end
            end

            task.wait(0.1)

            local character11 = viewportFrame:FindFirstChild(newPlayer.Name .. "SpawnedInToys")

            if character11 and character11:FindFirstChild("CreatureBlobman") then
                pcall(
                    function()
                        HUMANOID:FireServer(character11.CreatureBlobman)
                    end
                )
            end
        end

        function result118.startAntiGucciTrain()
            local lastTime = newPlayer.Character or newPlayer.CharacterAdded:Wait()
            lastTime:WaitForChild("Humanoid")

            local instance14 = lastTime:WaitForChild("HumanoidRootPart")

            currentEvidence.antiGucci.safePositionTrain = instance14.CFrame
            currentEvidence.antiGucci.hasSatThisLife = false
            currentEvidence.antiGucci.sitTimerTrain = nil

            local function onPlayerAdded()
                local result50 = newPlayer.Character and newPlayer.Character:FindFirstChild(
                    "HumanoidRootPart"
                )

                local result23 = newPlayer.Character and newPlayer.Character:FindFirstChildOfClass(
                    "Humanoid"
                )

                if result50 and currentEvidence.antiGucci.safePositionTrain then
                    if result23 then
                        result23:ChangeState(Enum.HumanoidStateType.Jumping)
                        result23.Sit = false
                    end

                    task.wait(0.05)
                    result50.CFrame = currentEvidence.antiGucci.safePositionTrain
                end
            end

            local function exampleUsage()
                if currentEvidence.antiGucci.hasSatThisLife then
                    return
                end

                currentEvidence.antiGucci.hasSatThisLife = true

                if currentEvidence.antiGucci.sitTimerTrain then
                    currentEvidence.antiGucci.sitTimerTrain:Cancel()
                end

                currentEvidence.antiGucci.sitTimerTrain = task.delay(
                    0.1,
                    function()
                        currentEvidence.antiGucci.sitTimerTrain = nil
                    end
                )
            end

            local function safeCall(player73)
                local player23 = newPlayer.Character and newPlayer.Character:FindFirstChild(
                    "HumanoidRootPart"
                )

                local result24 = newPlayer.Character and newPlayer.Character:FindFirstChildOfClass(
                    "Humanoid"
                )

                if not player23 or not result24 or not player73 then
                    return
                end

                currentEvidence.antiGucci.safePositionTrain = player23.CFrame
                player23.CFrame = player73.CFrame + Vector3.new(0, 0.5, 0)

                if pcall(
                    function()
                        player73:Sit(result24)
                    end
                ) then
                    task.wait(0.1)
                    onPlayerAdded()
                else
                    onPlayerAdded()
                end
            end

            local function deepCopy()
                local success12, instance47 = pcall(
                    function()
                        return viewportFrame.Map.AlwaysHereTweenedObjects.Train.Object.ObjectModel:FindFirstChildWhichIsA(
                            "Seat"
                        )
                    end
                )

                if success12 then
                    return instance47
                end

                return nil
            end

            if currentEvidence.antiGucci.connectionTrain then
                currentEvidence.antiGucci.connectionTrain:Disconnect()
            end

            local index106 = 0
            local heartbeat = runService.Heartbeat

            currentEvidence.antiGucci.connectionTrain = heartbeat:Connect(
                function()
                    if not purchaseInfo.Anti.AntiGucciTrain then
                        return
                    else
                        local currentTime13 = tick()

                        if currentTime13 - index106 < 0.033 then
                            return
                        else
                            index106 = currentTime13

                            local encryptedPayload = newPlayer.Character and newPlayer.Character:FindFirstChild(
                                "HumanoidRootPart"
                            )

                            if encryptedPayload then
                                ArcRemoteEvent:FireServer(encryptedPayload, 0)
                            end

                            return
                        end
                    end
                end
            )

            if currentEvidence.antiGucci.trainCharConn then
                currentEvidence.antiGucci.trainCharConn:Disconnect()
            end

            local event = newPlayer.CharacterAdded

            currentEvidence.antiGucci.trainCharConn = event:Connect(
                function()
                    task.wait(0.5)

                    currentEvidence.antiGucci.hasSatThisLife = false
                    currentEvidence.antiGucci.sitTimerTrain = nil

                    local bullet = newPlayer.Character and newPlayer.Character:FindFirstChild(
                        "HumanoidRootPart"
                    )

                    if bullet then
                        currentEvidence.antiGucci.safePositionTrain = bullet.CFrame
                    end
                end
            )

            currentEvidence.antiGucci.trainGucciLoop = true

            currentEvidence.antiGucci.trainGucciThread = task.spawn(
                function()
                    while currentEvidence.antiGucci.trainGucciLoop do
                        pcall(
                            function()
                                if purchaseInfo.Anti.AntiGucciTrain then
                                    if not currentEvidence.antiGucci.hasSatThisLife or currentEvidence.antiGucci.sitTimerTrain and currentEvidence.antiGucci.hasSatThisLife then
                                        local result25 = newPlayer.Character and newPlayer.Character:FindFirstChildOfClass(
                                            "Humanoid"
                                        )

                                        if result25 and not result25.Sit then
                                            if deepCopy and safeCall and exampleUsage then
                                                local result151 = deepCopy()

                                                if result151 then
                                                    safeCall(result151)
                                                    exampleUsage()
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        )

                        task.wait(0.016)
                    end
                end
            )
        end

        function result118.stopAntiGucciTrain()
            purchaseInfo.Anti.AntiGucciTrain = false

            currentEvidence.antiGucci.trainGucciLoop = false
            currentEvidence.antiGucci.hasSatThisLife = false

            if currentEvidence.antiGucci.sitTimerTrain then
                currentEvidence.antiGucci.sitTimerTrain:Cancel()
                currentEvidence.antiGucci.sitTimerTrain = nil
            end

            if currentEvidence.antiGucci.trainGucciThread then
                task.cancel(currentEvidence.antiGucci.trainGucciThread)
                currentEvidence.antiGucci.trainGucciThread = nil
            end

            if currentEvidence.antiGucci.connectionTrain then
                currentEvidence.antiGucci.connectionTrain:Disconnect()
                currentEvidence.antiGucci.connectionTrain = nil
            end

            if currentEvidence.antiGucci.trainCharConn then
                currentEvidence.antiGucci.trainCharConn:Disconnect()
                currentEvidence.antiGucci.trainCharConn = nil
            end

            local file = newPlayer.Character

            if file then
                local result26 = file:FindFirstChild("Humanoid")

                if result26 then
                    result26.Sit = false
                end
            end
        end

        function result118.ragdoll()
            local entries = newPlayer.Character and newPlayer.Character:FindFirstChild(
                "HumanoidRootPart"
            )

            if entries then
                ArcRemoteEvent:FireServer(entries, 0)
            end
        end

        function result118.startAntiBlobmanKill()
            if currentEvidence.antiBlobmanKillConn then
                currentEvidence.antiBlobmanKillConn:Disconnect()
            end

            local index76 = 0

            currentEvidence.antiBlobmanKillConn = runService.Heartbeat:Connect(
                function()
                    if not purchaseInfo.Anti.AntiBlobmanKill then
                        return
                    else
                        local previousTime = tick()

                        if previousTime - index76 < 0.033 then
                            return
                        else
                            index76 = previousTime
                            local ok = newPlayer.Character

                            if not ok then
                                return
                            else
                                local hitPart = ok:FindFirstChild("Humanoid")
                                local result96 = not hitPart
                                local success3 = ok:FindFirstChild("HumanoidRootPart")

                                if result96 or not success3 or hitPart.Health <= 0 then
                                    return
                                else
                                    hitPart.Sit = true
                                    hitPart:ChangeState(Enum.HumanoidStateType.Running)

                                    local primaryPart = workspace.CurrentCamera

                                    if primaryPart then
                                        local vectorA = primaryPart.CFrame.LookVector

                                        success3.CFrame = CFrame.new(
                                            success3.Position,
                                            success3.Position + Vector3.new(vectorA.X, 0, vectorA.Z)
                                        )
                                    end

                                    return
                                end
                            end
                        end
                    end
                end
            )
        end

        function result118.stopAntiBlobmanKill()
            purchaseInfo.Anti.AntiBlobmanKill = false

            if currentEvidence.antiBlobmanKillConn then
                currentEvidence.antiBlobmanKillConn:Disconnect()
                currentEvidence.antiBlobmanKillConn = nil
            end
        end

        function result118.startFightBack()
            if currentEvidence.fightBackConn then
                currentEvidence.fightBackConn:Disconnect()
            end

            currentEvidence.fightBackConn = task.spawn(
                function()
                    while purchaseInfo.Anti.FightBack do
                        local targetCharacter = newPlayer.Character

                        if targetCharacter and targetCharacter:FindFirstChild("Head") then
                            local scoreValue = targetCharacter.Head:FindFirstChild("PartOwner")

                            if scoreValue and scoreValue.Value ~= "" then
                                local otherPlayer = PlayersService:FindFirstChild(scoreValue.Value)

                                if otherPlayer and otherPlayer.Character then
                                    pcall(
                                        function()
                                            result82:FireServer()
                                            local playerCharacter = otherPlayer.Character

                                            local player140 = playerCharacter:FindFirstChild(
                                                "Torso"
                                            ) or playerCharacter:FindFirstChild("UpperTorso") or playerCharacter:FindFirstChild(
                                                "Head"
                                            )

                                            if player140 then
                                                fireId:FireServer(player140, player140.CFrame)
                                                task.wait()

                                                if not player140:FindFirstChild("l") then
                                                    local alignPosition = Instance.new(
                                                        "BodyVelocity"
                                                    )
                                                    alignPosition.Name = "l"
                                                    alignPosition.Velocity = Vector3.new(0, 2000, 0)
                                                    alignPosition.MaxForce = Vector3.new(
                                                        0, math.huge, 0
                                                    )
                                                    alignPosition.Parent = player140

                                                    DataStoreService:AddItem(alignPosition, 0.5)
                                                end
                                            end
                                        end
                                    )
                                end
                            end
                        end

                        task.wait(0.1)
                    end
                end
            )
        end

        function result118.stopFightBack()
            purchaseInfo.Anti.FightBack = false
            currentEvidence.fightBackConn = nil
        end

        function result118.startHouseTpAntiGrab()
            local matrix, Graph, index77

            if currentEvidence.houseTpConn then
                return
            else
                matrix = {
                    Vector3.new(295.61282348633, -7.405966758728, 486.58041381836),
                    Vector3.new(-575.04620361328, -9.2920417785645, 87.85179901123),
                    Vector3.new(-526.51696777344, -9.2968683242798, -165.31671142578),
                    Vector3.new(524.04876708984, 80.518844604492, -366.83865356445),
                    Vector3.new(577.57891845703, 121.39737701416, -93.602424621582),
                }

                function Graph()
                    if not purchaseInfo.Anti.HouseTpAntiGrab then
                        return
                    else
                        local characterModel = newPlayer.Character

                        local targetRoot = characterModel and characterModel:FindFirstChild(
                            "HumanoidRootPart"
                        )

                        local isRoblox = characterModel
                        isRoblox = characterModel and characterModel:FindFirstChildOfClass(
                            "Humanoid"
                        )

                        local result97 = not targetRoot
                        local newHumanoid = isRoblox

                        if result97 or not newHumanoid or newHumanoid.Health <= 0 then
                            return
                        else
                            local randomIndex = math.random(1, #matrix)

                            targetRoot.CFrame = CFrame.new(matrix[randomIndex])
                            targetRoot.AssemblyLinearVelocity = Vector3.zero
                            targetRoot.AssemblyAngularVelocity = Vector3.zero

                            return
                        end
                    end
                end

                currentEvidence.houseTpConn = {}
                index77 = 0
                local BenchmarkResult = runService.Heartbeat

                currentEvidence.houseTpConn.heartbeat = BenchmarkResult:Connect(
                    function()
                        if not purchaseInfo.Anti.HouseTpAntiGrab then
                            return
                        else
                            local currentTimestamp = tick()

                            if currentTimestamp - index77 < 0.04 then
                                return
                            end

                            index77 = currentTimestamp
                            Graph()
                            return
                        end
                    end
                )

                local path = newPlayer.CharacterAdded

                currentEvidence.houseTpConn.respawn = path:Connect(
                    function()
                        if not purchaseInfo.Anti.HouseTpAntiGrab then
                            return
                        else
                            local vehicle = newPlayer.Character

                            local weapon = vehicle and vehicle:FindFirstChild("HumanoidRootPart")

                            if not weapon then
                                weapon = vehicle and vehicle:WaitForChild("HumanoidRootPart", 2)
                            end

                            if weapon then
                                local mathRandom = math.random(1, #matrix)

                                weapon.CFrame = CFrame.new(matrix[mathRandom])
                                weapon.AssemblyLinearVelocity = Vector3.zero
                                weapon.AssemblyAngularVelocity = Vector3.zero
                            end

                            return
                        end
                    end
                )

                return
            end
        end

        function result118.stopHouseTpAntiGrab()
            if currentEvidence.houseTpConn then
                if currentEvidence.houseTpConn.heartbeat then
                    currentEvidence.houseTpConn.heartbeat:Disconnect()
                end

                if currentEvidence.houseTpConn.respawn then
                    currentEvidence.houseTpConn.respawn:Disconnect()
                end

                currentEvidence.houseTpConn = nil
            end
        end

        result120 = {}

        function result120.getLocalChar()
            return newPlayer.Character
        end

        function result120.getLocalRoot()
            local player142 = result120.getLocalChar()

            if not player142 then
                return
            end

            return player142:FindFirstChild("HumanoidRootPart") or player142:FindFirstChild("Torso")
        end

        function result120.getLocalHum()
            local player143 = result120.getLocalChar()

            if not player143 then
                return
            end

            return player143:FindFirstChildOfClass("Humanoid")
        end

        function result120.getInv()
            return viewportFrame:FindFirstChild(newPlayer.Name .. "SpawnedInToys")
        end

        function result120.getCurrentPlot()
            local success8 = result120.getLocalRoot()

            if not success8 then
                return nil
            else
                local player134 = viewportFrame:FindFirstChild("PlotItems")

                if not player134 then
                    return nil
                end

                for filePath = 1, 5 do
                    local clonedModel = player134:FindFirstChild("Plot" .. filePath)

                    if clonedModel then
                        local result60 = clonedModel:FindFirstChildWhichIsA("Part") or clonedModel:FindFirstChild(
                            "Baseplate"
                        )

                        if not result60 then
                            for index36, player144 in ipairs(clonedModel:GetChildren()) do
                                if player144:IsA("BasePart") then
                                    result60 = player144
                                    break
                                end
                            end
                        end

                        if result60 then
                            if (success8.Position - result60.Position).Magnitude < 100 then
                                return clonedModel
                            end
                        end
                    end
                end

                return nil
            end
        end

        function result120.SetNetworkOwner(player74) end

        function result120.ungrab(player75)
            pcall(
                function()
                    output:FireServer(player75)
                end
            )
        end

        function result120.getBlobman()
            local result98 = result120.getLocalHum()

            if result98 and result98.Sit and result98.SeatPart and result98.SeatPart.Parent then
                if result98.SeatPart.Parent.Name == "CreatureBlobman" then
                    return result98.SeatPart.Parent
                end
            end

            local player145 = result120.getInv()

            if player145 then
                local head = player145:FindFirstChild("CreatureBlobman")

                if head and head.ClassName == "Model" and head:FindFirstChild("VehicleSeat") then
                    return head
                end

                return nil
            end

            return nil
        end

        function result120.findAnyBlobman()
            local result99, ESX, index78

            if not purchaseInfo.BlobmanBeta.unsafeBlobman then
                return nil
            else
                result99 = result120.getLocalRoot()
                local minX = math.huge
                ESX = nil

                local function onCharacterAdded(player77)
                    if not player77 then
                        return
                    end

                    for index37, player146 in ipairs(player77:GetChildren()) do
                        if player146.Name == "CreatureBlobman" and player146:IsA("Model") then
                            if player146:FindFirstChild("VehicleSeat") then
                                local index68 = result99 and (player146:GetPivot().Position - result99.Position).Magnitude or 0

                                if index68 < index78 then
                                    index78 = index68
                                    ESX = player146
                                end
                            end
                        end
                    end
                end

                index78 = minX
                onCharacterAdded(result120.getInv())

                if not ESX then
                    for index38, player147 in ipairs(viewportFrame:GetChildren()) do
                        if player147.Name == "CreatureBlobman" and player147:IsA("Model") then
                            if player147:FindFirstChild("VehicleSeat") then
                                local index69 = result99 and (player147:GetPivot().Position - result99.Position).Magnitude or 0

                                if index69 < 100000 and index69 < index78 then
                                    index78 = index69
                                    ESX = player147
                                end
                            end
                        end
                    end
                end

                if not ESX then
                    local instance27 = viewportFrame:FindFirstChild("PlotItems")

                    if instance27 then
                        for pointIndex, player148 in ipairs(instance27:GetChildren()) do
                            onCharacterAdded(player148)
                        end
                    end
                end

                if not ESX then
                    local instance28 = viewportFrame:FindFirstChild("Plots")

                    if instance28 then
                        for existingPlayer, player149 in ipairs(instance28:GetChildren()) do
                            onCharacterAdded(player149)
                        end
                    end
                end

                return ESX
            end
        end

        function result120.spawnBlobman()
            local result27 = result120.getLocalRoot()

            if not result27 then
                local gameProcessed = newPlayer.Character

                if gameProcessed then
                    result27 = gameProcessed:FindFirstChild("HumanoidRootPart")
                end
            end

            local nearestIndex, inputConnection

            if not result27 then
                return nil
            else
                local result100 = result120.getBlobman()

                if result100 then
                    return result100
                else
                    local result101 = result120.findAnyBlobman()

                    if result101 and result101:FindFirstChild("VehicleSeat") then
                        return result101
                    else
                        local InsertService = result120.getInv()
                        nearestIndex = nil

                        if InsertService then
                            inputConnection = nil

                            inputConnection = InsertService.ChildAdded:Connect(
                                function(descendant)
                                    if descendant.Name == "CreatureBlobman" and descendant:IsA(
                                        "Model"
                                    ) then
                                        nearestIndex = descendant
                                        inputConnection:Disconnect()
                                    end
                                end
                            )

                            task.spawn(
                                function()
                                    pcall(
                                        function()
                                            BuoyancyRemoteFunction:InvokeServer(
                                                "CreatureBlobman",
                                                result27.CFrame * CFrame.new(3, 0, 0), Vector3.zero
                                            )
                                        end
                                    )
                                end
                            )

                            local finish = tick()

                            while not nearestIndex do
                                if tick() - finish > 2 then
                                    inputConnection:Disconnect()
                                    break
                                end

                                task.wait(0.01)
                            end
                        end

                        if nearestIndex then
                            if not nearestIndex:FindFirstChild("VehicleSeat") then
                                nearestIndex:WaitForChild("VehicleSeat", 2)
                            end

                            return nearestIndex
                        end

                        return result120.getBlobman()
                    end
                end
            end
        end

        function result120.destroyBlobman()
            local result102 = result120.getBlobman()

            if result102 then
                pcall(
                    function()
                        HUMANOID:FireServer(result102)
                    end
                )
            end
        end

        function result120.resetBlobmanPhysics()
            local vehicleModel = result120.getBlobman()

            if not vehicleModel then
                return
            end

            for index79, player150 in vehicleModel:GetDescendants() do
                if player150:IsA("BasePart") then
                    player150.AssemblyLinearVelocity = Vector3.zero
                    player150.AssemblyAngularVelocity = Vector3.zero
                end
            end
        end

        function result120.stabilizeBlobman()
            local player151 = result120.getBlobman()

            if not player151 or not player151:FindFirstChild("VehicleSeat") then
                return
            else
                local player221 = player151.VehicleSeat

                if player221 then
                    player221.CFrame = player221.CFrame + (result120.getLocalRoot().CFrame.Position - player221.Position) * 0.1
                end

                return
            end
        end

        function result120.isSittingOnBlobman()
            local result103 = result120.getLocalHum()

            return result103 and result103.Sit and result103.SeatPart and result103.SeatPart.Parent and result103.SeatPart.Parent.Name == "CreatureBlobman"
        end

        function result120.ensureSeatedOnBlobman()
            if result120.isSittingOnBlobman() then
                return true
            end

            return result120.forceSitBlobman()
        end

        function result120.ensureSitBlobman()
            local player152 = result120.getBlobman()

            if not player152 or not player152:FindFirstChild("VehicleSeat") then
                player152 = result120.spawnBlobman()
            end

            if not player152 or not player152:FindFirstChild("VehicleSeat") then
                player152 = result120.findAnyBlobman()
            end

            if not player152 or not player152:FindFirstChild("VehicleSeat") then
                return false
            else
                local instance51 = player152.VehicleSeat
                local result104 = result120.getLocalHum()
                local result105 = result120.getLocalRoot()

                if result104 and not result104.Sit and result105 then
                    result105.CFrame = instance51.CFrame + Vector3.new(0, 2, 0)
                    task.wait(0.05)
                    instance51:Sit(result104)
                    task.wait(0.1)
                end

                result120.resetBlobmanPhysics()
                result120.stabilizeBlobman()

                return result120.isSittingOnBlobman()
            end
        end

        function result120.blobGrab(player78, player79, value14)
            if not player78 then
                return
            end

            local targetUserId = player78:FindFirstChild(value14 .. "Detector")

            if not targetUserId then
                return
            end

            local actionName = targetUserId:FindFirstChild(value14 .. "Weld")
            local cash

            if not actionName then
                return
            else
                local player2 = player78:FindFirstChild("BlobmanSeatAndOwnerScript", true)

                if not player2 then
                    return
                end

                cash = player2:FindFirstChild("CreatureGrab")

                if cash then
                    pcall(
                        function()
                            cash:FireServer(targetUserId, player79, actionName)
                        end
                    )
                end

                return
            end
        end

        function result120.blobDrop(player80, player81, value15)
            if not player80 then
                return
            end

            local floorNumber = player80:FindFirstChild(value15 .. "Detector")
            local existing

            if not floorNumber then
                return
            else
                local player3 = player80:FindFirstChild("BlobmanSeatAndOwnerScript", true)

                if not player3 then
                    return
                end

                existing = player3:FindFirstChild("CreatureDrop")

                if existing then
                    pcall(
                        function()
                            existing:FireServer(floorNumber, player81)
                        end
                    )
                end

                return
            end
        end

        function result120.blobKick(player82, player83, value16)
            if not player82 or not player83 then
                return
            end

            result120.blobGrab(player82, result120.getLocalRoot(), value16)
            task.wait(0.02)
            result120.SetNetworkOwner(player83)
            task.wait(0.02)
            player83.CFrame = player83.CFrame + Vector3.new(
                0, purchaseInfo.BlobmanBeta.FloatAmount, 0
            )
            task.wait(0.02)
            result120.ungrab(player83)
            task.wait(0.02)
            result120.blobGrab(player82, player83, value16)
            task.wait(0.02)
            result120.blobDrop(player82, player83, value16)
            task.wait(0.02)
            result120.ungrab(player83)
        end

        function result120.ensureBlob()
            local player153 = result120.getBlobman()

            if not player153 then
                player153 = result120.findAnyBlobman()
            end

            if not player153 then
                player153 = result120.spawnBlobman()
            end

            if not player153 or not player153:FindFirstChild("VehicleSeat") then
                return nil
            else
                local result106 = result120.getLocalHum()
                local result107 = result120.getLocalRoot()

                if result106 and result107 and not result106.Sit then
                    result107.CFrame = player153.VehicleSeat.CFrame + Vector3.new(0, 2, 0)
                    player153.VehicleSeat:Sit(result106)
                end

                return result120.getBlobman()
            end
        end

        function result120.getPCLDPosition(playerObject, value17)
            if not currentEvidence.allPCLDParts then
                currentEvidence.allPCLDParts = {}

                for word, part2 in ipairs(workspace:GetDescendants()) do
                    if part2:IsA("BasePart") and part2.Name == "PlayerCharacterLocationDetector" then
                        local mouseLocation = part2.Position

                        if not (mouseLocation.X == 0 and mouseLocation.Y == 0 and mouseLocation.Z == 0) then
                            table.insert(currentEvidence.allPCLDParts, part2)
                        end
                    end
                end

                if not currentEvidence.pcldWatcherConn then
                    currentEvidence.pcldWatcherConn = workspace.DescendantAdded:Connect(
                        function(child)
                            if child:IsA("BasePart") and child.Name == "PlayerCharacterLocationDetector" then
                                local screenPosition = child.Position

                                if not (screenPosition.X == 0 and screenPosition.Y == 0 and screenPosition.Z == 0) then
                                    table.insert(currentEvidence.allPCLDParts, child)
                                end
                            end
                        end
                    )
                end
            end

            for columnIndex = #currentEvidence.allPCLDParts, 1, -1 do
                if not currentEvidence.allPCLDParts[columnIndex].Parent then
                    table.remove(currentEvidence.allPCLDParts, columnIndex)
                end
            end

            local currentPosition = value17

            if not currentPosition then
                local state = playerObject.Character

                local result28 = state
                result28 = state and state:FindFirstChild("HumanoidRootPart")

                if result28 then
                    currentPosition = result28.Position
                end
            end

            if not currentPosition then
                return nil
            else
                local index80 = 50
                local nearest = nil

                for segment, player154 in ipairs(currentEvidence.allPCLDParts) do
                    if player154.Parent then
                        local speed = (player154.Position - currentPosition).Magnitude

                        if speed < index80 then
                            index80 = speed
                            nearest = player154
                        end
                    end
                end

                return nearest
            end
        end

        function result120.forceSitBlobman()
            local player155 = result120.getBlobman()

            if not player155 or not player155:FindFirstChild("VehicleSeat") then
                player155 = result120.findAnyBlobman()
            end

            if not player155 or not player155:FindFirstChild("VehicleSeat") then
                player155 = result120.spawnBlobman()
            end

            local result108 = not player155
            local driverSeat

            if result108 or not player155:FindFirstChild("VehicleSeat") then
                return false
            else
                driverSeat = player155.VehicleSeat
                local expectedType = result120.getLocalHum()
                local zCoordinate = result120.getLocalRoot()

                if not expectedType or not zCoordinate then
                    local playerGui = newPlayer.Character

                    if playerGui then
                        expectedType = expectedType or playerGui:FindFirstChildOfClass("Humanoid")

                        zCoordinate = zCoordinate or playerGui:FindFirstChild("HumanoidRootPart")
                    end
                end

                if not expectedType or not zCoordinate then
                    return false
                end

                if expectedType.Sit and expectedType.SeatPart == driverSeat then
                    return true
                else
                    if driverSeat.Occupant and driverSeat.Occupant ~= expectedType then
                        pcall(
                            function()
                                driverSeat.Occupant.Jump = true
                            end
                        )
                        task.wait(0.15)
                    end

                    zCoordinate.Velocity = Vector3.zero
                    zCoordinate.RotVelocity = Vector3.zero

                    local index107 = Vector3.new(0, 2, 0)
                    zCoordinate.CFrame = driverSeat.CFrame + index107
                    task.wait(0.05)

                    if expectedType.Sit and expectedType.SeatPart == driverSeat then
                        result120.resetBlobmanPhysics()
                        return true
                    end

                    return result120.isSittingOnBlobman()
                end
            end
        end

        function result120.GetPlayerList()
            local result109 = {}

            for index63, player156 in pairs(PlayersService:GetPlayers()) do
                if player156 ~= newPlayer and not str(player156.Name) then
                    table.insert(result109, player156.DisplayName .. " @" .. player156.Name)
                end
            end

            return result109
        end

        function result120.checkTarget()
            if not purchaseInfo.BlobmanBeta.selectedTarget then
                warn("Select target")
                return nil
            elseif str(purchaseInfo.BlobmanBeta.selectedTarget) then
                warn("Player is protected")
                return nil
            else
                local success2 = PlayersService:FindFirstChild(
                    purchaseInfo.BlobmanBeta.selectedTarget
                )

                if not success2 then
                    warn("Target not found")
                    return nil
                end

                return success2
            end
        end

        function result120.isValidTarget(shooter, player84)
            if shooter == newPlayer then
                return false
            end

            if str(shooter.Name) then
                return false
            end

            local targetPlayer, active

            if purchaseInfo.BlobmanBeta.ignoreFriends or purchaseInfo.Loop.WhitelistFriends then
                active = false
                pcall(
                    function()
                        active = shooter:IsFriendsWith(newPlayer.UserId)
                    end
                )

                if active then
                    return false
                end

                targetPlayer = shooter.Character

                if not targetPlayer then
                    return false
                else
                    local success4 = targetPlayer:FindFirstChild("HumanoidRootPart")

                    if not success4 then
                        return false
                    else
                        local targetHumanoid = targetPlayer:FindFirstChildOfClass("Humanoid")

                        if not targetHumanoid or targetHumanoid.Health <= 0 then
                            return false
                        else
                            local screenHeight = success4.Position.Y

                            if screenHeight < -25 then
                                return false
                            end

                            for definition, i4 in ipairs(purchaseInfo.BlobmanBeta.ignoreHeights) do
                                if math.abs(screenHeight - i4) < 0.1 then
                                    return false
                                end
                            end

                            return true
                        end
                    end
                end
            else
                targetPlayer = shooter.Character

                if not targetPlayer then
                    return false
                else
                    local success5 = targetPlayer:FindFirstChild("HumanoidRootPart")

                    if not success5 then
                        return false
                    else
                        local hum = targetPlayer:FindFirstChildOfClass("Humanoid")

                        if not hum or hum.Health <= 0 then
                            return false
                        else
                            local altitude = success5.Position.Y

                            if altitude < -25 then
                                return false
                            end

                            for itemName, i5 in ipairs(purchaseInfo.BlobmanBeta.ignoreHeights) do
                                if math.abs(altitude - i5) < 0.1 then
                                    return false
                                end
                            end

                            return true
                        end
                    end
                end
            end
        end

        function result120.destroyPlayerGucci(player85)
            if not player85 or player85 == newPlayer then
                return false
            elseif str(player85.Name) then
                return false
            else
                local checkpointFolder = viewportFrame:FindFirstChild(
                    player85.Name .. "SpawnedInToys"
                )

                if not checkpointFolder then
                    return false
                else
                    local chunk = newPlayer.Character

                    if not chunk then
                        return false
                    else
                        local player12 = chunk:FindFirstChild("Humanoid")
                        local linearVelocity = chunk:FindFirstChild("HumanoidRootPart")

                        if not player12 or not linearVelocity then
                            return false
                        end

                        for listener, player157 in ipairs(checkpointFolder:GetChildren()) do
                            if player157.Name == "CreatureBlobman" or player157.Name == "TractorGreen" then
                                local result152 = player157:FindFirstChild("VehicleSeat")

                                local command = result152

                                command = result152 or player157:FindFirstChildWhichIsA(
                                    "VehicleSeat", true
                                )

                                if command then
                                    local elapsed = linearVelocity.CFrame

                                    linearVelocity.CFrame = command.CFrame
                                    linearVelocity.Velocity = Vector3.zero

                                    command:Sit(player12)
                                    task.wait(0.3)

                                    if player12.SeatPart == command then
                                        player12.Sit = false
                                        task.wait(0.1)
                                        linearVelocity.CFrame = elapsed
                                        task.wait(1)
                                        player157:Destroy()
                                        return true
                                    end

                                    linearVelocity.CFrame = elapsed
                                end
                            end
                        end

                        return false
                    end
                end
            end
        end

        function result120.StartDestroyGucciLoop()
            while purchaseInfo.BlobmanBeta.destroyGucciActive do
                for outputIndex, victim in ipairs(PlayersService:GetPlayers()) do
                    if victim ~= newPlayer and not str(victim.Name) and victim.Character then
                        result120.destroyPlayerGucci(victim)
                    end
                end

                task.wait(2)
            end
        end

        function result120.startDriftKick(targetName)
            driftAngle = 0
            purchaseInfo.BlobmanBeta.driftKickActive = true
            local lastUpdate = tick()
            currentEvidence.driftKickLoopId = lastUpdate
            local hashValue = 0

            if currentEvidence.driftKickConn then
                task.cancel(currentEvidence.driftKickConn)
            end

            currentEvidence.driftKickConn = task.spawn(
                function()
                    local resourceName = PlayersService:FindFirstChild(targetName)
                    local result110 = not resourceName or resourceName == newPlayer
                    local result29, player158, result111, delta, intersect, result14

                    if result110 then
                        purchaseInfo.BlobmanBeta.driftKickActive = false
                        return
                    else
                        local petClone = result120.getBlobman() or result120.findAnyBlobman() or result120.spawnBlobman(
                        )

                        if not petClone or not petClone:FindFirstChild("VehicleSeat") then
                            purchaseInfo.BlobmanBeta.driftKickActive = false
                            return
                        else
                            local x = petClone:FindFirstChild("BlobmanSeatAndOwnerScript") or petClone:FindFirstChild(
                                "BlobmanSeatAndOwnerScript[old]"
                            )

                            delta = x and x:FindFirstChild("CreatureGrab")

                            intersect = x and x:FindFirstChild("CreatureDrop")

                            local workerCount = petClone:FindFirstChild("LeftDetector")
                            local overlayGui = petClone:FindFirstChild("RightDetector")

                            local comparator = workerCount and (workerCount:FindFirstChild(
                                "LeftWeld"
                            ) or workerCount:FindFirstChildWhichIsA("Weld") or workerCount:FindFirstChildWhichIsA(
                                "JointInstance"
                            ) or workerCount:FindFirstChild("RigidConstraint"))

                            local result75 = overlayGui and (overlayGui:FindFirstChild("RightWeld") or overlayGui:FindFirstChildWhichIsA(
                                "Weld"
                            ) or overlayGui:FindFirstChildWhichIsA("JointInstance") or overlayGui:FindFirstChild(
                                "RigidConstraint"
                            ))

                            local seatInstance = petClone:FindFirstChild("VehicleSeat")
                            result14 = PhysicsService:FindFirstChild("GrabEvents")
                            result29 = petClone:FindFirstChild("HumanoidRootPart") or petClone.PrimaryPart
                            player158 = overlayGui or workerCount
                            result111 = result75 or comparator

                            if not result14 or not delta or not intersect or not player158 or not result111 or not result29 then
                                purchaseInfo.BlobmanBeta.driftKickActive = false
                                return
                            else
                                local seat = newPlayer.Character and newPlayer.Character:FindFirstChild(
                                    "Humanoid"
                                )

                                local instance10 = newPlayer.Character and newPlayer.Character:FindFirstChild(
                                    "HumanoidRootPart"
                                )

                                if seatInstance and seat then
                                    if seatInstance.Occupant ~= seat then
                                        instance10.CFrame = seatInstance.CFrame + Vector3.new(
                                            0, 2, 0
                                        )
                                        task.wait(0.2)
                                        seatInstance:Sit(seat)
                                        task.wait(0.5)
                                    end
                                end

                                while purchaseInfo.BlobmanBeta.driftKickActive do
                                    if lastUpdate ~= currentEvidence.driftKickLoopId then
                                        break
                                    end

                                    if not resourceName or not resourceName.Parent then
                                        break
                                    else
                                        local duration = newPlayer.Character

                                        local withinX = duration and duration:FindFirstChildOfClass(
                                            "Humanoid"
                                        )

                                        local player135 = withinX and withinX.SeatPart

                                        if not player135 or player135.Parent ~= petClone then
                                            purchaseInfo.BlobmanBeta.driftKickActive = false
                                            break
                                        else
                                            local ffi = resourceName.Character

                                            local withinY = ffi and ffi:FindFirstChildOfClass(
                                                "Humanoid"
                                            )

                                            local nodeIdentifier = ffi and ffi:FindFirstChild(
                                                "HumanoidRootPart"
                                            )

                                            if ffi and nodeIdentifier and withinY and withinY.Health > 0 then
                                                local lastUpdateTime = tick()

                                                while tick() - lastUpdateTime < 0.35 do
                                                    if lastUpdate ~= currentEvidence.driftKickLoopId or not purchaseInfo.BlobmanBeta.driftKickActive or not petClone or not petClone.Parent then
                                                        break
                                                    end

                                                    if resourceName.Character and resourceName.Character:FindFirstChild(
                                                        "HumanoidRootPart"
                                                    ) then
                                                        local characterRoot = resourceName.Character.HumanoidRootPart

                                                        result29.CFrame = characterRoot.CFrame
                                                        result29.AssemblyLinearVelocity = Vector3.zero

                                                        pcall(
                                                            function()
                                                                if player158 then
                                                                    delta:FireServer(
                                                                        player158, characterRoot,
                                                                        result111
                                                                    )
                                                                end

                                                                if hashValue % 3 == 0 then
                                                                    result14.SetNetworkOwner:FireServer(
                                                                        characterRoot,
                                                                        result29.CFrame
                                                                    )
                                                                elseif hashValue % 3 == 1 then
                                                                    result14.CreateGrabLine:FireServer(
                                                                        characterRoot, Vector3.zero,
                                                                        characterRoot.Position,
                                                                        false
                                                                    )
                                                                end
                                                            end
                                                        )
                                                    end

                                                    hashValue = (hashValue + 1) % 3
                                                    runService.Heartbeat:Wait()
                                                end

                                                if lastUpdate ~= currentEvidence.driftKickLoopId or not purchaseInfo.BlobmanBeta.driftKickActive or not petClone or not petClone.Parent then
                                                    break
                                                else
                                                    local array = resourceName.Character

                                                    nodeIdentifier = array and array:FindFirstChild(
                                                        "HumanoidRootPart"
                                                    )

                                                    withinY = array and array:FindFirstChildOfClass(
                                                        "Humanoid"
                                                    )

                                                    if array and nodeIdentifier and withinY and withinY.Health > 0 then
                                                        local j = nodeIdentifier.CFrame
                                                        local index81 = j + Vector3.new(0, 30, 0)
                                                        local index82 = tick()
                                                        local index83 = tick()
                                                        local iteration = 0

                                                        while purchaseInfo.BlobmanBeta.driftKickActive and petClone and petClone.Parent do
                                                            if lastUpdate ~= currentEvidence.driftKickLoopId then
                                                                break
                                                            end

                                                            if not resourceName or not resourceName.Parent then
                                                                break
                                                            else
                                                                local model = resourceName.Character

                                                                local index4 = model

                                                                index4 = model and model:FindFirstChild(
                                                                    "HumanoidRootPart"
                                                                )

                                                                local index2 = model
                                                                nodeIdentifier = index4

                                                                index2 = model and model:FindFirstChildOfClass(
                                                                    "Humanoid"
                                                                )

                                                                local result112 = not model
                                                                withinY = index2

                                                                if result112 or not nodeIdentifier or not withinY or withinY.Health <= 0 then
                                                                    break
                                                                end

                                                                if iteration < 2 and tick() - index83 > 0.8 then
                                                                    iteration = iteration + 1

                                                                    pcall(
                                                                        function()
                                                                            local result76 = player158:FindFirstChild(
                                                                                "RightWeld"
                                                                            ) or player158:FindFirstChild(
                                                                                "LeftWeld"
                                                                            ) or player158:FindFirstChildWhichIsA(
                                                                                "Weld"
                                                                            ) or player158:FindFirstChildWhichIsA(
                                                                                "JointInstance"
                                                                            ) or player158:FindFirstChild(
                                                                                "RigidConstraint"
                                                                            )

                                                                            if result76 then
                                                                                intersect:FireServer(
                                                                                    result76
                                                                                )
                                                                            end

                                                                            result14.DestroyGrabLine:FireServer(
                                                                                nodeIdentifier
                                                                            )
                                                                        end
                                                                    )

                                                                    result29.CFrame = j
                                                                    result29.AssemblyLinearVelocity = Vector3.zero

                                                                    hashValue = (hashValue + 1) % 3
                                                                    runService.Heartbeat:Wait()
                                                                    skipFrame = (skipFrame + 1) % 3

                                                                    if resourceName.Character and resourceName.Character:FindFirstChild(
                                                                        "HumanoidRootPart"
                                                                    ) then
                                                                        local humanoidRoot = resourceName.Character.HumanoidRootPart

                                                                        result29.CFrame = humanoidRoot.CFrame
                                                                        result29.AssemblyLinearVelocity = Vector3.zero

                                                                        pcall(
                                                                            function()
                                                                                if player158 then
                                                                                    delta:FireServer(
                                                                                        player158,
                                                                                        humanoidRoot,
                                                                                        result111
                                                                                    )
                                                                                end

                                                                                if hashValue % 3 == 0 then
                                                                                    result14.SetNetworkOwner:FireServer(
                                                                                        humanoidRoot,
                                                                                        result29.CFrame
                                                                                    )
                                                                                elseif hashValue % 3 == 1 then
                                                                                    result14.CreateGrabLine:FireServer(
                                                                                        humanoidRoot,
                                                                                        Vector3.zero,
                                                                                        humanoidRoot.Position,
                                                                                        false
                                                                                    )
                                                                                end
                                                                            end
                                                                        )
                                                                    end

                                                                    index82 = tick()
                                                                    index83 = tick()
                                                                elseif nodeIdentifier and withinY and withinY.Health > 0 and result29 then
                                                                    local currentTime2 = tick()
                                                                    local elapsedTime = currentTime2 - index82
                                                                    index82 = currentTime2
                                                                    driftAngle = driftAngle + 12 * elapsedTime
                                                                    local cosTheta = math.cos(
                                                                        driftAngle
                                                                    )
                                                                    local sinTheta = math.sin(
                                                                        driftAngle
                                                                    )
                                                                    local index108 = Vector3.new(
                                                                        cosTheta * 19, 0,
                                                                        sinTheta * 19
                                                                    )

                                                                    result29.CFrame = CFrame.new(
                                                                        index81.Position + index108,
                                                                        index81.Position
                                                                    )

                                                                    result29.AssemblyLinearVelocity = Vector3.zero
                                                                    result29.AssemblyAngularVelocity = Vector3.zero

                                                                    nodeIdentifier.CFrame = index81
                                                                    nodeIdentifier.AssemblyLinearVelocity = Vector3.zero
                                                                    nodeIdentifier.AssemblyAngularVelocity = Vector3.zero

                                                                    pcall(
                                                                        function()
                                                                            withinY.PlatformStand = true
                                                                            withinY.Sit = true

                                                                            if hashValue % 3 == 0 then
                                                                                result14.SetNetworkOwner:FireServer(
                                                                                    nodeIdentifier,
                                                                                    index81
                                                                                )
                                                                            elseif hashValue % 3 == 1 then
                                                                                result14.DestroyGrabLine:FireServer(
                                                                                    nodeIdentifier
                                                                                )

                                                                                result14.CreateGrabLine:FireServer(
                                                                                    nodeIdentifier,
                                                                                    Vector3.zero,
                                                                                    index81.Position,
                                                                                    false
                                                                                )
                                                                            end

                                                                            local result77 = player158:FindFirstChild(
                                                                                "RightWeld"
                                                                            ) or player158:FindFirstChild(
                                                                                "LeftWeld"
                                                                            ) or player158:FindFirstChildWhichIsA(
                                                                                "Weld"
                                                                            ) or player158:FindFirstChildWhichIsA(
                                                                                "JointInstance"
                                                                            ) or player158:FindFirstChild(
                                                                                "RigidConstraint"
                                                                            )

                                                                            if result77 then
                                                                                intersect:FireServer(
                                                                                    result77
                                                                                )
                                                                            end

                                                                            if player158 then
                                                                                delta:FireServer(
                                                                                    player158,
                                                                                    nodeIdentifier,
                                                                                    result111
                                                                                )
                                                                            end
                                                                        end
                                                                    )

                                                                    hashValue = (hashValue + 1) % 3
                                                                    runService.Heartbeat:Wait()
                                                                else
                                                                    break
                                                                end
                                                            end
                                                        end

                                                        if not purchaseInfo.BlobmanBeta.driftKickActive or lastUpdate ~= currentEvidence.driftKickLoopId then
                                                            if result29 and j then
                                                                pcall(
                                                                    function()
                                                                        local result78 = player158:FindFirstChild(
                                                                            "RightWeld"
                                                                        ) or player158:FindFirstChild(
                                                                            "LeftWeld"
                                                                        ) or player158:FindFirstChildWhichIsA(
                                                                            "Weld"
                                                                        ) or player158:FindFirstChildWhichIsA(
                                                                            "JointInstance"
                                                                        ) or player158:FindFirstChild(
                                                                            "RigidConstraint"
                                                                        )

                                                                        if result78 then
                                                                            intersect:FireServer(
                                                                                result78
                                                                            )
                                                                        end

                                                                        if resourceName and resourceName.Character and resourceName.Character:FindFirstChild(
                                                                            "HumanoidRootPart"
                                                                        ) then
                                                                            result14.DestroyGrabLine:FireServer(
                                                                                resourceName.Character.HumanoidRootPart
                                                                            )
                                                                        end
                                                                    end
                                                                )

                                                                result29.CFrame = j
                                                                result29.AssemblyLinearVelocity = Vector3.zero
                                                            end

                                                            break
                                                        end
                                                    end
                                                end
                                            end

                                            hashValue = (hashValue + 1) % 3
                                            runService.Heartbeat:Wait()
                                        end
                                    end
                                end

                                purchaseInfo.BlobmanBeta.driftKickActive = false
                                return
                            end
                        end
                    end
                end
            )
        end

        function result120.stopDriftKick()
            purchaseInfo.BlobmanBeta.driftKickActive = false
            currentEvidence.driftKickLoopId = tick()

            if currentEvidence.driftKickConn then
                task.cancel(currentEvidence.driftKickConn)
                currentEvidence.driftKickConn = nil
            end

            local targetPlayerName = purchaseInfo.BlobmanBeta.selectedTarget
            local ghostModel = result120.getBlobman()
            local result30, result15, option

            if ghostModel then
                v1076 = ghostModel:FindFirstChild("BlobmanSeatAndOwnerScript", true)
                result15 = PhysicsService:FindFirstChild("GrabEvents")
                v1081 = ghostModel:FindFirstChild("RightDetector") or ghostModel:FindFirstChild(
                    "LeftDetector"
                )

                if result15 then
                    if targetPlayerName then
                        local target = PlayersService:FindFirstChild(targetPlayerName)
                        local deltaY = target and target.Character
                        option = deltaY and deltaY:FindFirstChild("HumanoidRootPart")

                        if option then
                            pcall(
                                function()
                                    result15.DestroyGrabLine:FireServer(option)
                                end
                            )
                        end
                    end

                    pcall(
                        function()
                            result15.DestroyGrabLine:FireServer(
                                newPlayer.Character.HumanoidRootPart
                            )
                        end
                    )
                end

                result30 = ghostModel:FindFirstChild("HumanoidRootPart") or ghostModel.PrimaryPart

                if result30 then
                    pcall(
                        function()
                            result30.AssemblyLinearVelocity = Vector3.zero
                            result30.AssemblyAngularVelocity = Vector3.zero
                        end
                    )
                end
            end

            local backpack

            if targetPlayerName then
                local playerInstance = PlayersService:FindFirstChild(targetPlayerName)
                local right = playerInstance and playerInstance.Character

                if right then
                    backpack = right:FindFirstChildOfClass("Humanoid")

                    if backpack then
                        pcall(
                            function()
                                backpack.PlatformStand = false
                                backpack.Sit = false
                            end
                        )
                    end
                end
            end

            local initialCapacity = newPlayer.Character
            local result21 = initialCapacity and initialCapacity:FindFirstChildOfClass("Humanoid")

            if result21 then
                pcall(
                    function()
                        result21.PlatformStand = false
                        result21.Sit = false
                    end
                )
            end
        end

        function result120.startKickAllV2()
            purchaseInfo.BlobmanBeta.kickAllV2Active = true

            if currentEvidence.kickAllV2Conn then
                task.cancel(currentEvidence.kickAllV2Conn)
            end

            currentEvidence.kickAllV2Conn = task.spawn(
                function()
                    local characters = {}

                    for pattern, value20 in ipairs(PlayersService:GetPlayers()) do
                        if value20 ~= newPlayer and not str(value20.Name) then
                            table.insert(characters, value20)
                        end
                    end

                    local
                        currentIndex, result31, dummyHumanoid, result113, index109, originalParent,
                        startPosition, playerData, enemy, result67, line, row

                    if #characters == 0 then
                        purchaseInfo.BlobmanBeta.kickAllV2Active = false
                        return
                    else
                        local leaderstats = newPlayer.Character

                        local result32 = leaderstats
                        result32 = leaderstats and leaderstats:FindFirstChild("HumanoidRootPart")

                        local index3 = leaderstats
                        index3 = leaderstats and leaderstats:FindFirstChildOfClass("Humanoid")

                        local result114 = not result32
                        result113 = index3

                        if result114 or not result113 then
                            purchaseInfo.BlobmanBeta.kickAllV2Active = false
                            return
                        else
                            local player159 = result120.getBlobman() or result120.findAnyBlobman() or result120.spawnBlobman(
                            )

                            if not player159 or not player159:FindFirstChild("VehicleSeat") then
                                purchaseInfo.BlobmanBeta.kickAllV2Active = false
                                return
                            end

                            index109 = player159.VehicleSeat

                            if not result113.Sit or result113.SeatPart ~= index109 then
                                if index109.Occupant and index109.Occupant ~= result113 then
                                    pcall(
                                        function()
                                            index109.Occupant.Jump = true
                                        end
                                    )
                                    task.wait(0.1)
                                end

                                local currentTime3 = tick()

                                while purchaseInfo.BlobmanBeta.kickAllV2Active and tick() - currentTime3 < 0.5 do
                                    if not player159 or not player159.Parent then
                                        break
                                    end

                                    result32.CFrame = index109.CFrame + Vector3.new(0, 2, 0)
                                    pcall(
                                        function()
                                            index109:Sit(result113)
                                        end
                                    )

                                    if result113.Sit and result113.SeatPart == index109 then
                                        break
                                    end

                                    task.wait(0.03)
                                end
                            end

                            if not (result113.Sit and result113.SeatPart and result113.SeatPart.Parent and result113.SeatPart.Parent.Name == "CreatureBlobman") then
                                purchaseInfo.BlobmanBeta.kickAllV2Active = false
                                return
                            else
                                originalParent = result113.SeatPart.Parent

                                local position = originalParent:FindFirstChild(
                                    "BlobmanSeatAndOwnerScript"
                                ) or originalParent:FindFirstChild("BlobmanSeatAndOwnerScript[old]")

                                startPosition = position and position:FindFirstChild("CreatureGrab")

                                playerData = position and position:FindFirstChild("CreatureRelease")

                                local lines = {}

                                for userId, value21 in ipairs(PlayersService:GetPlayers()) do
                                    local opponent = value21

                                    if opponent ~= newPlayer and not str(opponent.Name) then
                                        if purchaseInfo.BlobmanBeta.ignoreFriends then
                                            local isArray = false
                                            pcall(
                                                function()
                                                    isArray = newPlayer:IsFriendsWith(
                                                        opponent.UserId
                                                    )
                                                end
                                            )

                                            if isArray then
                                            else
                                                ::continueIteration::
                                                currentIndex = opponent.Character

                                                result31 = currentIndex and currentIndex:FindFirstChild(
                                                    "HumanoidRootPart"
                                                )

                                                dummyHumanoid = currentIndex and currentIndex:FindFirstChildOfClass(
                                                    "Humanoid"
                                                )

                                                if result31 and dummyHumanoid and dummyHumanoid.Health > 0 then
                                                    table.insert(lines, opponent)
                                                end
                                            end
                                        else
                                            goto continueIteration
                                        end
                                    end
                                end

                                if #lines == 0 then
                                    purchaseInfo.BlobmanBeta.kickAllV2Active = false
                                    return
                                else
                                    for component, player160 in ipairs(lines) do
                                        local previousLogIndex = player160.Character and player160.Character:FindFirstChild(
                                            "HumanoidRootPart"
                                        )

                                        if previousLogIndex then
                                            result32.CFrame = previousLogIndex.CFrame
                                            task.wait(0.02)

                                            for column = 1, 3 do
                                                pcall(
                                                    function()
                                                        startPosition:FireServer(
                                                            originalParent.LeftDetector,
                                                            previousLogIndex,
                                                            originalParent.LeftDetector.LeftWeld
                                                        )

                                                        playerData:FireServer(
                                                            originalParent.LeftDetector.LeftWeld
                                                        )
                                                    end
                                                )

                                                if column < 3 then
                                                    task.wait(0.08)
                                                end
                                            end
                                        end
                                    end

                                    local parentModel = result113.SeatPart.Parent
                                    enemy = parentModel:FindFirstChild("LeftDetector")
                                    result67 = parentModel:FindFirstChild("RightDetector")

                                    local player25 = enemy and (enemy:FindFirstChild("LeftWeld") or enemy:FindFirstChildWhichIsA(
                                        "Weld"
                                    ) or enemy:FindFirstChildWhichIsA("RigidConstraint"))

                                    local result79 = result67 and (result67:FindFirstChild(
                                        "RightWeld"
                                    ) or result67:FindFirstChildWhichIsA("Weld") or result67:FindFirstChildWhichIsA(
                                        "RigidConstraint"
                                    ))

                                    local currentTime = parentModel:FindFirstChild(
                                        "BlobmanSeatAndOwnerScript"
                                    )

                                    local current = currentTime

                                    current = currentTime or parentModel:FindFirstChild(
                                        "BlobmanSeatAndOwnerScript[old]"
                                    )

                                    line = current and current:FindFirstChild("CreatureGrab")

                                    row = current and current:FindFirstChild("CreatureRelease")

                                    if not line or not row or not enemy or not player25 then
                                        purchaseInfo.BlobmanBeta.kickAllV2Active = false
                                        return
                                    end

                                    for layerIndex, player161 in ipairs(lines) do
                                        if not purchaseInfo.BlobmanBeta.kickAllV2Active then
                                            break
                                        else
                                            local xCoordinate = player161.Character

                                            local previousLogTerm = xCoordinate and xCoordinate:FindFirstChild(
                                                "HumanoidRootPart"
                                            )

                                            if previousLogTerm then
                                                result32.CFrame = previousLogTerm.CFrame
                                                task.wait(0.02)

                                                for amount = 1, 3 do
                                                    if not purchaseInfo.BlobmanBeta.kickAllV2Active then
                                                        break
                                                    end

                                                    pcall(
                                                        function()
                                                            line:FireServer(
                                                                enemy, previousLogTerm, player25
                                                            )
                                                            row:FireServer(player25)
                                                        end
                                                    )

                                                    if amount < 3 then
                                                        task.wait(0.08)
                                                    end
                                                end
                                            end
                                        end
                                    end

                                    result32.CFrame = CFrame.new(0, 100, 0)
                                    task.wait(0.1)

                                    for nodeName, value22 in ipairs(parentModel:GetDescendants()) do
                                        local player162 = value22

                                        if player162:IsA("BasePart") then
                                            pcall(
                                                function()
                                                    player162.Anchored = true
                                                end
                                            )
                                        end
                                    end

                                    task.wait(0.1)

                                    for propertyName, player163 in ipairs(lines) do
                                        local yCoordinate = player163.Character

                                        local result33 = yCoordinate

                                        result33 = yCoordinate and player163.Character:FindFirstChild(
                                            "HumanoidRootPart"
                                        )

                                        if result33 then
                                            local radians = math.rad(
                                                (propertyName - 1) * (360 / #lines)
                                            )
                                            local cosine = math.cos(radians)
                                            local sine = math.sin(radians)
                                            result33.CFrame = CFrame.new(
                                                15 * cosine, 110, 15 * sine
                                            )
                                        end
                                    end

                                    task.wait(0.1)

                                    for k = 1, 2 do
                                        for constraint, player164 in ipairs(lines) do
                                            local requestId = player164.Character and player164.Character:FindFirstChild(
                                                "HumanoidRootPart"
                                            )

                                            if requestId then
                                                pcall(
                                                    function()
                                                        fireId:FireServer(
                                                            requestId,
                                                            CFrame.new(requestId.Position)
                                                        )

                                                        output:FireServer(requestId)
                                                    end
                                                )
                                            end
                                        end

                                        task.wait(0.1)
                                    end

                                    task.wait(0.3)

                                    for hiddenIndex, player165 in ipairs(lines) do
                                        if not purchaseInfo.BlobmanBeta.kickAllV2Active then
                                            break
                                        else
                                            local result34 = player165.Character and player165.Character:FindFirstChild(
                                                "HumanoidRootPart"
                                            )

                                            if result34 then
                                                pcall(
                                                    function()
                                                        line:FireServer(enemy, result34, player25)
                                                    end
                                                )

                                                if result67 and result79 then
                                                    pcall(
                                                        function()
                                                            line:FireServer(
                                                                result67, result34, result79
                                                            )
                                                        end
                                                    )
                                                end
                                            end
                                        end
                                    end

                                    for worker, value23 in ipairs(parentModel:GetDescendants()) do
                                        local player166 = value23

                                        if player166:IsA("BasePart") then
                                            pcall(
                                                function()
                                                    player166.Anchored = false
                                                end
                                            )
                                        end
                                    end

                                    purchaseInfo.BlobmanBeta.kickAllV2Active = false
                                    return
                                end
                            end
                        end
                    end
                end
            )
        end

        function result120.stopKickAllV2()
            purchaseInfo.BlobmanBeta.kickAllV2Active = false

            if currentEvidence.kickAllV2Conn then
                task.cancel(currentEvidence.kickAllV2Conn)
                currentEvidence.kickAllV2Conn = nil
            end
        end

        result122 = {}

        function result122.enableThirdPerson()
            purchaseInfo.Misc.ThirdPerson = true

            newPlayer.CameraMode = Enum.CameraMode.Classic
            newPlayer.CameraMinZoomDistance = 2
            newPlayer.CameraMaxZoomDistance = 128

            currentEvidence.thirdPersonCloneConn = runService.RenderStepped:Connect(
                function()
                    if not purchaseInfo.Misc.ThirdPerson then
                        return
                    else
                        local currentTime4 = tick()

                        if currentEvidence._thirdPersonLastUpdate and currentTime4 - currentEvidence._thirdPersonLastUpdate < 0.05 then
                            return
                        else
                            currentEvidence._thirdPersonLastUpdate = currentTime4
                            local ServerStorage = newPlayer.Character

                            if not ServerStorage or not ServerStorage:FindFirstChild(
                                "HumanoidRootPart"
                            ) then
                                return
                            else
                                local players = {
                                    "Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm",
                                    "Right Arm", "Left Leg", "Right Leg", "LeftUpperArm",
                                    "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm",
                                    "RightHand", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
                                    "RightUpperLeg", "RightLowerLeg", "RightFoot",
                                }

                                for action, modelName in ipairs(players) do
                                    local accessory = ServerStorage:FindFirstChild(modelName)

                                    if accessory and accessory:IsA("BasePart") and accessory.Transparency > 0 then
                                        accessory.Transparency = 0
                                    end
                                end

                                local hitboxPart = ServerStorage:FindFirstChild("HumanoidRootPart")

                                if hitboxPart then
                                    hitboxPart.Transparency = 1
                                end

                                for sample, REMOTE_EVENT_NAME in ipairs(players) do
                                    local currentInstance = ServerStorage:FindFirstChild(
                                        REMOTE_EVENT_NAME
                                    )

                                    if currentInstance then
                                        for index64, box in pairs(currentInstance:GetChildren()) do
                                            if box:IsA("Decal") and box.Transparency > 0 then
                                                box.Transparency = 0
                                            end
                                        end
                                    end
                                end

                                if ServerStorage:FindFirstChild("Head") then
                                    for index65, player167 in pairs(ServerStorage:GetChildren()) do
                                        if player167:IsA("Accessory") then
                                            local originalName = player167.Name

                                            if originalName ~= "bloxcxy" and originalName ~= "TypingKeyboardMyWorld" then
                                                local beam = player167:FindFirstChild("Handle")

                                                if beam and beam.Transparency > 0 then
                                                    beam.Transparency = 0
                                                end
                                            end
                                        end
                                    end
                                end

                                return
                            end
                        end
                    end
                end
            )
        end

        function result122.disableThirdPerson()
            purchaseInfo.Misc.ThirdPerson = false

            newPlayer.CameraMode = Enum.CameraMode.Classic
            newPlayer.CameraMinZoomDistance = 0.5
            newPlayer.CameraMaxZoomDistance = 0.5

            if currentEvidence.thirdPersonCloneConn then
                currentEvidence.thirdPersonCloneConn:Disconnect()
                currentEvidence.thirdPersonCloneConn = nil
            end
        end

        function result122.enableFPSBooster()
            purchaseInfo.Misc.FPSBooster = true
            local TerrainService = viewportFrame.Terrain

            if not currentEvidence.originalSettings then
                currentEvidence.originalSettings = {
                    GlobalShadows = StarterGui.GlobalShadows, Brightness = StarterGui.Brightness,
                    WaterTransparency = TerrainService.WaterTransparency,
                    WaterWaveSize = TerrainService.WaterWaveSize,
                    WaterWaveSpeed = TerrainService.WaterWaveSpeed,
                }
            end

            StarterGui.GlobalShadows = false
            StarterGui.Brightness = 0

            TerrainService.WaterTransparency = 1
            TerrainService.WaterWaveSize = 0
            TerrainService.WaterWaveSpeed = 0

            for index66, trail in pairs(viewportFrame:GetDescendants()) do
                if trail:IsA("ParticleEmitter") or trail:IsA("Trail") or trail:IsA("Smoke") or trail:IsA(
                    "Fire"
                ) or trail:IsA("Sparkles") then
                    trail.Enabled = false
                end

                if trail:IsA("Decal") then
                    if not (trail.Parent and trail.Parent.Name == "RespawnLocation") then
                        if not trail:GetAttribute("OriginalTexture") then
                            trail:SetAttribute("OriginalTexture", trail.Texture)
                        end

                        trail.Texture = "rbxasset://textures/face.png"
                    end
                end

                if trail:IsA("Texture") then
                    if not trail:GetAttribute("OriginalTexture") then
                        trail:SetAttribute("OriginalTexture", trail.Texture)
                    end

                    trail.Texture = "rbxasset://textures/face.png"
                end

                if trail:IsA("MeshPart") or trail:IsA("UnionOperation") or trail:IsA("Part") then
                    if not trail:GetAttribute("OriginalMaterial") then
                        trail:SetAttribute("OriginalMaterial", trail.Material.Name)
                        trail:SetAttribute("OriginalReflectance", trail.Reflectance)
                    end

                    trail.Material = Enum.Material.SmoothPlastic
                    trail.Reflectance = 0
                end
            end

            if currentEvidence.connections.fpsBooster then
                currentEvidence.connections.fpsBooster:Disconnect()
            end

            local list = viewportFrame.DescendantAdded

            currentEvidence.connections.fpsBooster = list:Connect(
                function(effect)
                    if not purchaseInfo.Misc.FPSBooster then
                        return
                    end

                    if effect:IsA("ParticleEmitter") or effect:IsA("Trail") or effect:IsA("Smoke") or effect:IsA(
                        "Fire"
                    ) or effect:IsA("Sparkles") then
                        effect.Enabled = false
                    end

                    if effect:IsA("Decal") then
                        if not (effect.Parent and effect.Parent.Name == "RespawnLocation") then
                            if not effect:GetAttribute("OriginalTexture") then
                                effect:SetAttribute("OriginalTexture", effect.Texture)
                            end

                            effect.Texture = "rbxasset://textures/face.png"
                        end
                    end

                    if effect:IsA("Texture") then
                        if not effect:GetAttribute("OriginalTexture") then
                            effect:SetAttribute("OriginalTexture", effect.Texture)
                        end

                        effect.Texture = "rbxasset://textures/face.png"
                    end

                    if effect:IsA("MeshPart") or effect:IsA("UnionOperation") or effect:IsA("Part") then
                        if not effect:GetAttribute("OriginalMaterial") then
                            effect:SetAttribute("OriginalMaterial", effect.Material.Name)
                            effect:SetAttribute("OriginalReflectance", effect.Reflectance)
                        end

                        effect.Material = Enum.Material.SmoothPlastic
                        effect.Reflectance = 0
                    end
                end
            )
        end

        function result122.disableFPSBooster()
            purchaseInfo.Misc.FPSBooster = false

            if currentEvidence.connections.fpsBooster then
                currentEvidence.connections.fpsBooster:Disconnect()
                currentEvidence.connections.fpsBooster = nil
            end

            if currentEvidence.originalSettings then
                local instance40 = viewportFrame.Terrain

                StarterGui.GlobalShadows = currentEvidence.originalSettings.GlobalShadows
                StarterGui.Brightness = currentEvidence.originalSettings.Brightness

                instance40.WaterTransparency = currentEvidence.originalSettings.WaterTransparency
                instance40.WaterWaveSize = currentEvidence.originalSettings.WaterWaveSize
                instance40.WaterWaveSpeed = currentEvidence.originalSettings.WaterWaveSpeed

                for index67, particleEmitter in pairs(viewportFrame:GetDescendants()) do
                    if particleEmitter:IsA("ParticleEmitter") or particleEmitter:IsA("Trail") or particleEmitter:IsA(
                        "Smoke"
                    ) or particleEmitter:IsA("Fire") or particleEmitter:IsA("Sparkles") then
                        particleEmitter.Enabled = true
                    end

                    if particleEmitter:IsA("Decal") and particleEmitter:GetAttribute(
                        "OriginalTexture"
                    ) then
                        particleEmitter.Texture = particleEmitter:GetAttribute("OriginalTexture")
                    end

                    if particleEmitter:IsA("Texture") and particleEmitter:GetAttribute(
                        "OriginalTexture"
                    ) then
                        particleEmitter.Texture = particleEmitter:GetAttribute("OriginalTexture")
                    end

                    if (particleEmitter:IsA("MeshPart") or particleEmitter:IsA("UnionOperation") or particleEmitter:IsA(
                        "Part"
                    )) and particleEmitter:GetAttribute("OriginalMaterial") then
                        particleEmitter.Material = Enum.Material[particleEmitter:GetAttribute(
                            "OriginalMaterial"
                        )]
                        particleEmitter.Reflectance = particleEmitter:GetAttribute(
                            "OriginalReflectance"
                        ) or 0
                    end
                end

                currentEvidence.originalSettings = nil
            end
        end

        function result122.enablePhantomPallets()
            purchaseInfo.Misc.phantomPallets = true
            local BUTTON_PRESSED_COLOR = Color3.fromRGB(130, 130, 130)
            local serialized = Color3.fromRGB(160, 165, 180)

            currentEvidence.phantomPalletsConn = runService.Heartbeat:Connect(
                function()
                    if not purchaseInfo.Misc.phantomPallets then
                        return
                    else
                        local moduleFolder = viewportFrame:FindFirstChild(
                            newPlayer.Name .. "SpawnedInToys"
                        )

                        if moduleFolder then
                            for pair, player168 in ipairs(moduleFolder:GetChildren()) do
                                if player168.Name == "PalletLightBrown" then
                                    for centroidIndex, value24 in ipairs(player168:GetDescendants()) do
                                        local stepPart = value24

                                        if stepPart:IsA("BasePart") and stepPart.Transparency ~= 1 then
                                            if not stepPart:GetAttribute("PhantomOrigColor") then
                                                stepPart:SetAttribute(
                                                    "PhantomOrigColor", stepPart.Color
                                                )
                                            end

                                            if not stepPart:GetAttribute("PhantomOrigMaterial") then
                                                stepPart:SetAttribute(
                                                    "PhantomOrigMaterial", stepPart.Material.Name
                                                )
                                            end

                                            if not stepPart:GetAttribute("PhantomOrigTransparency") then
                                                stepPart:SetAttribute(
                                                    "PhantomOrigTransparency", stepPart.Transparency
                                                )
                                            end

                                            stepPart.Color = BUTTON_PRESSED_COLOR
                                            stepPart.Material = Enum.Material.Basalt
                                            stepPart.Transparency = 0.8

                                            if not stepPart:FindFirstChild("PhantomGlowLight") then
                                                local light = Instance.new("PointLight")
                                                light.Name = "PhantomGlowLight"
                                                light.Color = serialized
                                                light.Brightness = 0.8
                                                light.Range = 5
                                                light.Shadows = false
                                                light.Parent = stepPart
                                            end
                                        elseif stepPart:IsA("Decal") or stepPart:IsA("Texture") then
                                            pcall(
                                                function()
                                                    stepPart:Destroy()
                                                end
                                            )
                                        end
                                    end
                                end
                            end
                        end

                        return
                    end
                end
            )
        end

        function result122.disablePhantomPallets()
            purchaseInfo.Misc.phantomPallets = false

            if currentEvidence.phantomPalletsConn then
                currentEvidence.phantomPalletsConn:Disconnect()
                currentEvidence.phantomPalletsConn = nil
            end

            local parentInstance = viewportFrame:FindFirstChild(newPlayer.Name .. "SpawnedInToys")

            if parentInstance then
                for currentPlayer, player169 in ipairs(parentInstance:GetChildren()) do
                    if player169.Name == "PalletLightBrown" then
                        for propertyValue, segmentPart in ipairs(player169:GetDescendants()) do
                            if segmentPart:IsA("BasePart") then
                                local instance19 = segmentPart:FindFirstChild("PhantomGlowLight")

                                if instance19 then
                                    instance19:Destroy()
                                end

                                local timer = segmentPart:GetAttribute("PhantomOrigColor")
                                local inventorySystem = segmentPart:GetAttribute(
                                    "PhantomOrigMaterial"
                                )
                                local spinController = segmentPart:GetAttribute(
                                    "PhantomOrigTransparency"
                                )

                                if timer then
                                    segmentPart.Color = timer
                                    segmentPart:SetAttribute("PhantomOrigColor", nil)
                                end

                                if inventorySystem then
                                    segmentPart.Material = Enum.Material[inventorySystem]
                                    segmentPart:SetAttribute("PhantomOrigMaterial", nil)
                                end

                                if spinController ~= nil then
                                    segmentPart.Transparency = spinController
                                    segmentPart:SetAttribute("PhantomOrigTransparency", nil)
                                end
                            end
                        end
                    end
                end
            end
        end

        function result122.ExecuteBarrierDestroyer()
            local prefix = newPlayer.Name

            local result115 = not newPlayer.Character or not newPlayer.Character:FindFirstChild(
                "HumanoidRootPart"
            )

            local desiredActions, player170

            if result115 then
                warn("Character not found")
                return false
            else
                local targetCFrame = newPlayer.Character.HumanoidRootPart.CFrame

                pcall(
                    function()
                        BuoyancyRemoteFunction:InvokeServer(
                            "InstrumentWoodwindOcarina",
                            CFrame.new(
                                184.148834, -5.54824972, 498.136749, 0.829037189, -0.214714944,
                                0.516328275, 0, 0.923344612, 0.383972496, -0.559193552,
                                -0.318327487, 0.765486956
                            ), Vector3.new(0, 34, 0)
                        )
                    end
                )

                task.wait(0.3)
                local success9 = result116.waitForChild(viewportFrame, prefix .. "SpawnedInToys", 3)

                if not success9 then
                    warn("Toy folder not found")
                    return false
                end

                desiredActions = result116.waitForChild(success9, "InstrumentWoodwindOcarina", 3)

                if not desiredActions then
                    warn("Ocarina not found")
                    return false
                else
                    local success10 = result116.waitForChild(desiredActions, "HoldPart", 2)

                    if not success10 then
                        warn("HoldPart not found")
                        return false
                    end

                    task.wait(0.1)
                    success10.HoldItemRemoteFunction:InvokeServer(
                        desiredActions, viewportFrame[prefix]
                    )
                    task.wait(0.3)

                    if not newPlayer.Character or not newPlayer.Character:FindFirstChild(
                        "HumanoidRootPart"
                    ) then
                        return false
                    end

                    newPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(304.06, 25.77, 488.54)
                    task.wait(0.15)

                    if desiredActions and desiredActions.Parent then
                        pcall(
                            function()
                                HUMANOID:FireServer(desiredActions)
                            end
                        )
                    end

                    task.wait(0.15)

                    if newPlayer.Character and newPlayer.Character:FindFirstChild(
                        "HumanoidRootPart"
                    ) then
                        newPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
                    end

                    for entityIdentifier, player171 in ipairs(viewportFrame.Plots:GetChildren()) do
                        local data = player171:FindFirstChild("Barrier")

                        if data then
                            for inputIndex, player172 in ipairs(data:GetChildren()) do
                                if player172:IsA("BasePart") then
                                    player172.CanCollide = false
                                end
                            end
                        end
                    end

                    task.wait(0.5)

                    pcall(
                        function()
                            BuoyancyRemoteFunction:InvokeServer(
                                "Campfire", newPlayer.Character.HumanoidRootPart.CFrame,
                                Vector3.zero
                            )
                        end
                    )

                    task.wait(0.2)
                    player170 = result116.waitForChild(success9, "Campfire", 2)

                    if not player170 then
                        warn("Failed to spawn campfire")
                        return false
                    else
                        local player136 = player170:FindFirstChild("SoundPart")

                        if not player136 then
                            pcall(
                                function()
                                    HUMANOID:FireServer(player170)
                                end
                            )
                            return false
                        else
                            result117.SetNetworkOwner(
                                player136, newPlayer.Character.HumanoidRootPart.CFrame
                            )
                            player136.CFrame = CFrame.new(304, 25, 488)
                            task.wait(2)
                            local fin = player170.Parent ~= nil

                            if player170 and player170.Parent then
                                pcall(
                                    function()
                                        HUMANOID:FireServer(player170)
                                    end
                                )
                            end

                            return fin
                        end
                    end
                end
            end
        end

        function result122.startMiniMap()
            local
                raycastParams, sorter, bar, height, rayOrigin, changed, first, completed, index84,
                screenSize, bestChild, bestLabel, connectionHandle, magnitude

            if currentEvidence.miniMapGui then
                return
            else
                raycastParams = RaycastParams.new()
                raycastParams.FilterType = Enum.RaycastFilterType.Exclude

                sorter = Instance.new("ScreenGui")
                sorter.Name = "CustomMinimapGui"
                sorter.ResetOnSpawn = false

                pcall(
                    function()
                        sorter.Parent = Debris
                    end
                )

                if not sorter.Parent then
                    sorter.Parent = result61
                end

                currentEvidence.miniMapGui = sorter

                bar = Instance.new("Frame", sorter)
                bar.Size = UDim2.new(0, 220, 0, 220)
                bar.Position = UDim2.new(0.01, 0, 0.02, 0)
                bar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                bar.BorderColor3 = Color3.fromRGB(255, 105, 180)
                bar.BorderSizePixel = 2
                bar.ClipsDescendants = true
                bar.Visible = true
                bar.Active = true

                currentEvidence.miniMapFrame = bar
                height = currentEvidence.miniMapGridRes
                currentEvidence.miniMapPixels = {}

                for step = 1, height do
                    currentEvidence.miniMapPixels[step] = {}

                    for elementIndex = 1, height do
                        local backgroundFrame = Instance.new("Frame", bar)
                        backgroundFrame.Size = UDim2.new(1 / height, 0, 1 / height, 0)

                        backgroundFrame.Position = UDim2.new(
                            (step - 1) / height, 0, (elementIndex - 1) / height, 0
                        )

                        backgroundFrame.BorderSizePixel = 0
                        backgroundFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

                        currentEvidence.miniMapPixels[step][elementIndex] = backgroundFrame
                    end
                end

                local mainFrame = Instance.new("ImageLabel", bar)
                mainFrame.Name = "ViewArrow"
                mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                mainFrame.Size = UDim2.new(0, 20, 0, 14)
                mainFrame.BackgroundTransparency = 1
                mainFrame.ZIndex = 15
                mainFrame.Image = "rbxassetid://7072706796"
                mainFrame.ImageColor3 = Color3.fromRGB(0, 255, 255)
                mainFrame.Rotation = 0

                currentEvidence.miniMapViewLine = mainFrame
                rayOrigin = nil
                changed = false
                first = false
                completed = false
                index84 = 0
                screenSize = nil
                bestChild = nil
                bestLabel = nil
                connectionHandle = nil
                local tagAdded = bar.InputBegan

                table.insert(
                    currentEvidence.miniMapInputConns,
                    tagAdded:Connect(
                        function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                                changed = true
                                first = false
                                completed = false
                                index84 = tick()
                                rayOrigin = Input.Position
                                screenSize = bar.Position
                                bestChild = currentEvidence.miniMapOffset

                                bestLabel = userInputService.InputChanged:Connect(
                                    function(inputObject)
                                        if (inputObject.UserInputType == Enum.UserInputType.MouseMovement or inputObject.UserInputType == Enum.UserInputType.Touch) and changed then
                                            local difference = inputObject.Position - rayOrigin
                                            local index85 = tick() - index84

                                            if not first and not completed then
                                                if difference.Magnitude > 5 then
                                                    if index85 > 0.25 then
                                                        completed = true
                                                    else
                                                        first = true
                                                    end
                                                end
                                            end

                                            if first then
                                                bar.Position = UDim2.new(
                                                    screenSize.X.Scale,
                                                    screenSize.X.Offset + difference.X,
                                                    screenSize.Y.Scale,
                                                    screenSize.Y.Offset + difference.Y
                                                )
                                            elseif completed then
                                                currentEvidence.miniMapOffset = bestChild - Vector3.new(
                                                    difference.X / bar.AbsoluteSize.X * currentEvidence.miniMapZoom,
                                                    0,
                                                    difference.Y / bar.AbsoluteSize.Y * currentEvidence.miniMapZoom
                                                )
                                            end
                                        end
                                    end
                                )

                                connectionHandle = userInputService.InputEnded:Connect(
                                    function(eventName)
                                        if eventName.UserInputType == Enum.UserInputType.MouseButton1 or eventName.UserInputType == Enum.UserInputType.Touch then
                                            if changed then
                                                changed = false

                                                if not first and not completed and (eventName.Position - rayOrigin).Magnitude < 15 and newPlayer.Character then
                                                    local instance11 = newPlayer.Character:FindFirstChild(
                                                        "HumanoidRootPart"
                                                    )

                                                    if instance11 then
                                                        local center = instance11.Position + currentEvidence.miniMapOffset

                                                        local position2 = center.X + ((eventName.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X - 0.5) * currentEvidence.miniMapZoom

                                                        local position3 = center.Z + ((eventName.Position.Y - bar.AbsolutePosition.Y) / bar.AbsoluteSize.Y - 0.5) * currentEvidence.miniMapZoom

                                                        raycastParams.FilterDescendantsInstances = {
                                                            newPlayer.Character
                                                        }

                                                        local rayResult = viewportFrame:Raycast(
                                                            Vector3.new(position2, 1000, position3),
                                                            Vector3.new(0, -2000, 0), raycastParams
                                                        )

                                                        local index110 = rayResult and rayResult.Position.Y or instance11.Position.Y
                                                        instance11.CFrame = CFrame.new(
                                                            position2, index110 + 4, position3
                                                        )
                                                    end
                                                end
                                            end

                                            if bestLabel then
                                                bestLabel:Disconnect()
                                                bestLabel = nil
                                            end

                                            if connectionHandle then
                                                connectionHandle:Disconnect()
                                                connectionHandle = nil
                                            end
                                        end
                                    end
                                )
                            end
                        end
                    )
                )

                local tagRemoved = bar.InputChanged

                table.insert(
                    currentEvidence.miniMapInputConns,
                    tagRemoved:Connect(
                        function(endInput)
                            if endInput.UserInputType == Enum.UserInputType.MouseWheel then
                                currentEvidence.miniMapZoom = math.clamp(
                                    currentEvidence.miniMapZoom + endInput.Position.Z * -100, 50,
                                    1500
                                )
                            end
                        end
                    )
                )

                magnitude = currentEvidence.miniMapZoom
                local instance41 = userInputService.TouchPinch

                table.insert(
                    currentEvidence.miniMapInputConns,
                    instance41:Connect(
                        function(player86, totalTime, value18, goalY)
                            if not bar.Visible then
                                return
                            end

                            if goalY == Enum.UserInputState.Begin then
                                magnitude = currentEvidence.miniMapZoom
                            elseif goalY == Enum.UserInputState.Change then
                                currentEvidence.miniMapZoom = math.clamp(
                                    magnitude / totalTime, 50, 1500
                                )
                            end
                        end
                    )
                )

                local instance26 = PlayersService.PlayerRemoving

                table.insert(
                    currentEvidence.miniMapInputConns,
                    instance26:Connect(
                        function(player88)
                            if currentEvidence.miniMapPlayerDots[player88.Name] then
                                currentEvidence.miniMapPlayerDots[player88.Name]:Destroy()
                                currentEvidence.miniMapPlayerDots[player88.Name] = nil
                            end
                        end
                    )
                )

                currentEvidence.miniMapRenderConn = runService.RenderStepped:Connect(
                    function()
                        if not purchaseInfo.Misc.miniMap then
                            return
                        else
                            local weight = newPlayer.Character

                            local player15 = weight and weight:FindFirstChild("HumanoidRootPart")

                            if not player15 then
                                return
                            else
                                local max = player15.Position + currentEvidence.miniMapOffset
                                local currentTime5 = tick()
                                local splitHorizontally = (max - currentEvidence.miniMapLastScanPos).Magnitude > 6
                                local StringContainer = currentTime5 - currentEvidence.miniMapLastScanTime > 1.5

                                if bar.Visible and (splitHorizontally or StringContainer) then
                                    currentEvidence.miniMapLastScanPos = max
                                    currentEvidence.miniMapLastScanTime = currentTime5

                                    raycastParams.FilterDescendantsInstances = {weight}

                                    for characterIndex = 1, height do
                                        for now = 1, height do
                                            local traceResult = viewportFrame:Raycast(
                                                max + Vector3.new(
                                                    ((characterIndex - 1) / (height - 1) - 0.5) * currentEvidence.miniMapZoom,
                                                    100,
                                                    ((now - 1) / (height - 1) - 0.5) * currentEvidence.miniMapZoom
                                                ), Vector3.new(0, -200, 0), raycastParams
                                            )

                                            if traceResult and traceResult.Instance then
                                                local color = traceResult.Instance.Color

                                                local clamped = math.clamp(
                                                    (traceResult.Position.Y - max.Y + 30) / 60, 0.3,
                                                    1.2
                                                )

                                                local clampedX = math.clamp(
                                                    color.R * 255 * clamped, 0, 255
                                                )
                                                local clampedDistance = math.clamp(
                                                    color.G * 255 * clamped, 0, 255
                                                )
                                                local clampedY = math.clamp(
                                                    color.B * 255 * clamped, 0, 255
                                                )

                                                currentEvidence.miniMapPixels[characterIndex][now].BackgroundColor3 = Color3.fromRGB(
                                                    clampedX, clampedDistance, clampedY
                                                )
                                            else
                                                currentEvidence.miniMapPixels[characterIndex][now].BackgroundColor3 = Color3.fromRGB(
                                                    15, 15, 20
                                                )
                                            end
                                        end
                                    end
                                end

                                if bar.Visible then
                                    local deltaX = Camera and Camera.CFrame

                                    if deltaX then
                                        local vectorB = deltaX.LookVector
                                        local angleRadians = math.atan2(vectorB.Z, vectorB.X)

                                        if currentEvidence.miniMapViewLine then
                                            local mathCos = math.cos(angleRadians)
                                            local mathSin = math.sin(angleRadians)

                                            currentEvidence.miniMapViewLine.Position = UDim2.new(
                                                0.5 + mathCos * 18 / bar.AbsoluteSize.X, 0,
                                                0.5 + mathSin * 18 / bar.AbsoluteSize.Y, 0
                                            )

                                            currentEvidence.miniMapViewLine.Rotation = math.deg(
                                                angleRadians
                                            ) + 90
                                        end
                                    end

                                    for index41, value25 in pairs(PlayersService:GetPlayers()) do
                                        local judgePlayer = value25
                                        local otherCharacter = judgePlayer.Character

                                        local result36 = otherCharacter

                                        result36 = otherCharacter and judgePlayer.Character:FindFirstChild(
                                            "HumanoidRootPart"
                                        )

                                        if result36 then
                                            local imageLabel = currentEvidence.miniMapPlayerDots[judgePlayer.Name]

                                            if not imageLabel then
                                                imageLabel = Instance.new("Frame", bar)
                                                imageLabel.Size = UDim2.new(0, 26, 0, 26)
                                                imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
                                                imageLabel.BackgroundTransparency = 1
                                                imageLabel.ZIndex = 10

                                                local controller = Instance.new("Frame", imageLabel)
                                                controller.Size = UDim2.new(1, 0, 1, 0)

                                                controller.BackgroundColor3 = judgePlayer == newPlayer and Color3.fromRGB(
                                                    0, 255, 255
                                                ) or Color3.fromRGB(255, 50, 50)

                                                Instance.new("UICorner", controller).CornerRadius = UDim.new(
                                                    1, 0
                                                )

                                                local titleLabel = Instance.new(
                                                    "ImageLabel", controller
                                                )
                                                titleLabel.Size = UDim2.new(1, -4, 1, -4)
                                                titleLabel.Position = UDim2.new(0, 2, 0, 2)
                                                titleLabel.BackgroundTransparency = 1

                                                Instance.new("UICorner", titleLabel).CornerRadius = UDim.new(
                                                    1, 0
                                                )
                                                titleLabel.ClipsDescendants = true

                                                task.spawn(
                                                    function()
                                                        local decoded, result119 = pcall(
                                                            function()
                                                                return PlayersService:GetUserThumbnailAsync(
                                                                    judgePlayer.UserId,
                                                                    Enum.ThumbnailType.HeadShot,
                                                                    Enum.ThumbnailSize.Size48x48
                                                                )
                                                            end
                                                        )

                                                        if decoded and result119 then
                                                            titleLabel.Image = result119
                                                        end
                                                    end
                                                )

                                                local messageLabel = Instance.new(
                                                    "TextLabel", imageLabel
                                                )
                                                messageLabel.Size = UDim2.new(0, 100, 0, 12)
                                                messageLabel.Position = UDim2.new(0.5, -50, 1, 2)
                                                messageLabel.BackgroundTransparency = 1
                                                messageLabel.Text = judgePlayer.DisplayName
                                                messageLabel.TextColor3 = Color3.fromRGB(
                                                    255, 255, 255
                                                )
                                                messageLabel.TextStrokeTransparency = 0.3
                                                messageLabel.TextStrokeColor3 = Color3.fromRGB(
                                                    0, 0, 0
                                                )
                                                messageLabel.TextSize = 10
                                                messageLabel.Font = Enum.Font.GothamBold
                                                messageLabel.ZIndex = 11

                                                currentEvidence.miniMapPlayerDots[judgePlayer.Name] = imageLabel
                                            end

                                            local average = (result36.Position.X - max.X) / currentEvidence.miniMapZoom
                                            local factor = (result36.Position.Z - max.Z) / currentEvidence.miniMapZoom

                                            imageLabel.Position = UDim2.new(
                                                0.5 + average, 0, 0.5 + factor, 0
                                            )
                                            imageLabel.Visible = math.abs(average) < 0.5 and math.abs(
                                                factor
                                            ) < 0.5
                                        end
                                    end
                                end

                                return
                            end
                        end
                    end
                )

                return
            end
        end

        function result122.stopMiniMap()
            purchaseInfo.Misc.miniMap = false

            if currentEvidence.miniMapRenderConn then
                currentEvidence.miniMapRenderConn:Disconnect()
                currentEvidence.miniMapRenderConn = nil
            end

            for vehicleEntity, conn in ipairs(currentEvidence.miniMapInputConns) do
                if conn.Connected then
                    conn:Disconnect()
                end
            end

            currentEvidence.miniMapInputConns = {}

            for index42, player173 in pairs(currentEvidence.miniMapPlayerDots) do
                if player173 and player173.Parent then
                    player173:Destroy()
                end
            end

            currentEvidence.miniMapPlayerDots = {}

            if currentEvidence.miniMapGui then
                currentEvidence.miniMapGui:Destroy()
                currentEvidence.miniMapGui = nil
                currentEvidence.miniMapFrame = nil
                currentEvidence.miniMapViewLine = nil
            end
        end

        local instance52 = notifyExport:CreateWindow(
            {
                Title = "Faldes_X   V3", Footer = "Hello!" .. testPlayer.Name,
                Icon = 92147420968826, NotifySide = "Right", ShowCustomCursor = true,
                AlwaysOnTop = true,
            }
        )

        local ikConstraint = {
            Main = instance52:AddTab("Main", "landmark"),
            Combat = instance52:AddTab("Combat", "hand-fist"),
            plr = instance52:AddTab("Player", "user-round"),
            Defense = instance52:AddTab("Defense", "shield"),
            Target = instance52:AddTab("Target", "crosshair"),
            Aura = instance52:AddTab("Aura", "shield-alert"),
            Fun = instance52:AddTab("Fun", "face-grinning"),
            Key = instance52:AddTab("Keybind", "keyboard"),
            Ser = instance52:AddTab("Server", "server"),
            Mics = instance52:AddTab("Mics", "layout-dashboard"),
            ["UI Settings"] = instance52:AddTab("UI Settings", "settings"),
        }

        ikConstraint.Main:AddGroupbox(
            {
                Side = "Left", Name = "Inf", Description = "Описание", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        ):AddToggle(
            "St",
            {
                Text = "Rejoin", Tooltip = "Включение силы",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player89)
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, newPlayer)
                end,
            }
        )

        local instance17 = ikConstraint.Combat:AddGroupbox(
            {
                Side = "Left", Name = "LineSetting",
                Description = "найтройка линиий и другое",
                IconName = "triangle-alert", Collapsed = false, DisableCollapsing = false,
            }
        )

        instance17:AddSlider(
            "Str",
            {
                Text = "Set Strengh", Default = 0, Min = 1, Max = 40000, Rounding = 1, Suffix = "%",
                Compact = false, HideMax = false,
                FormatDisplayValue = function(player90, value19)
                    if value19 == player90.Max then
                        return "Max"
                    end
                end,
                Callback = function(player91)
                    purchaseInfo.Grab.strength = player91
                end,
            }
        )

        instance17:AddToggle(
            "St",
            {
                Text = "Toggle Strenght", Tooltip = "Включение силы",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player92)
                    purchaseInfo.Grab.EnableThrowStrength = player92

                    if player92 then
                        GrabFeature.enableStrength()
                    else
                        GrabFeature.disableStrength()
                    end
                end,
            }
        )

        local instance6 = ikConstraint.Combat:AddGroupbox(
            {
                Side = "Right", Name = "Grab", Description = "Grabs", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        instance6:AddToggle(
            "St1",
            {
                Text = "Trax Grab", Tooltip = "трахаем",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = true,
                Callback = function(player93)
                    purchaseInfo.Misc.traxGrab = player93

                    if not player93 then
                        if purchaseInfo.Misc.traxGrabThread then
                            task.cancel(purchaseInfo.Misc.traxGrabThread)
                            purchaseInfo.Misc.traxGrabThread = nil
                        end

                        if purchaseInfo.Misc.traxGrabConn then
                            purchaseInfo.Misc.traxGrabConn:Disconnect()
                            purchaseInfo.Misc.traxGrabConn = nil
                        end

                        for index43, player174 in pairs(PlayersService:GetPlayers()) do
                            if player174 ~= newPlayer and player174.Character then
                                for index44, player175 in pairs(
                                    player174.Character:GetDescendants()
                                ) do
                                    if player175:IsA("BasePart") then
                                        player175.CanCollide = true
                                        local instance43 = player175:FindFirstChild("_TraxBP")

                                        if instance43 then
                                            instance43:Destroy()
                                        end

                                        local instance42 = player175:FindFirstChild("_TraxBG")

                                        if instance42 then
                                            instance42:Destroy()
                                        end
                                    end
                                end
                            end
                        end

                        task.spawn(
                            function()
                                local player4 = workspace:FindFirstChild(
                                    newPlayer.Name .. "SpawnedInToys"
                                )

                                local joint

                                if player4 then
                                    joint = player4:FindFirstChild("InstrumentDrumSnare")

                                    if joint then
                                        pcall(
                                            function()
                                                PhysicsService.MenuToys.DestroyToy:FireServer(joint)
                                            end
                                        )

                                        if joint.Parent then
                                            joint:Destroy()
                                        end
                                    end
                                end
                            end
                        )

                        return
                    end

                    purchaseInfo.Misc.traxGrabThread = task.spawn(
                        function()
                            local ElevatorStatusFunction = PhysicsService:WaitForChild("MenuToys"):WaitForChild(
                                "SpawnToyRemoteFunction"
                            )

                            local function createClass(player94)
                                if not player94 or not player94.Parent then
                                    return nil, nil
                                else
                                    local result94 = player94:FindFirstChild("_TraxBP")
                                    local result93 = player94:FindFirstChild("_TraxBG")

                                    if result94 and result93 then
                                        return result94, result93
                                    else
                                        local bodyPosition = Instance.new("BodyPosition")
                                        bodyPosition.Name = "_TraxBP"
                                        bodyPosition.MaxForce = Vector3.new(
                                            1000000000, 1000000000, 1000000000
                                        )
                                        bodyPosition.D = 500
                                        bodyPosition.P = 10000
                                        bodyPosition.Parent = player94

                                        local angularVelocity = Instance.new("BodyGyro")
                                        angularVelocity.Name = "_TraxBG"
                                        angularVelocity.MaxTorque = Vector3.new(
                                            1000000000, 1000000000, 1000000000
                                        )
                                        angularVelocity.D = 500
                                        angularVelocity.P = 10000
                                        angularVelocity.Parent = player94

                                        return bodyPosition, angularVelocity
                                    end
                                end
                            end

                            local function deepCopyTable(player95, player96)
                                if not player95 then
                                    return
                                else
                                    local result121, player176 = createClass(player95)

                                    if result121 and result121.Parent then
                                        result121.Position = player96.Position
                                    end

                                    if player176 and player176.Parent then
                                        player176.CFrame = player96
                                    end

                                    return
                                end
                            end

                            local tweenInfo = CFrame.new(0, 800000, 0)

                            pcall(
                                function()
                                    ElevatorStatusFunction:InvokeServer(
                                        "InstrumentDrumSnare", tweenInfo, Vector3.zero
                                    )
                                end
                            )

                            local player24

                            for edge = 1, 100 do
                                local player5 = workspace:FindFirstChild(
                                    newPlayer.Name .. "SpawnedInToys"
                                )

                                if player5 then
                                    player24 = player5:FindFirstChild("InstrumentDrumSnare")
                                end

                                if player24 then
                                    break
                                end

                                task.wait()
                            end

                            if not player24 then
                                warn("[Trax Grab] No drum")
                                purchaseInfo.Misc.traxGrab = false
                                return
                            end

                            local marker = player24:FindFirstChild("SoundPart")
                            local createVector, rightIndex, index86

                            if not marker then
                                warn("[Trax Grab] No SoundPart")
                                purchaseInfo.Misc.traxGrab = false
                                return
                            else
                                marker.CanCollide = false
                                marker.Anchored = false

                                function createVector()
                                    for index45, player177 in pairs(PlayersService:GetPlayers()) do
                                        if player177 ~= newPlayer and player177.Character then
                                            local character15 = player177.Character:FindFirstChild(
                                                "Head"
                                            )

                                            if character15 and character15:FindFirstChild(
                                                "PartOwner"
                                            ) and character15.PartOwner.Value == newPlayer.Name then
                                                return player177
                                            end
                                        end
                                    end

                                    return nil
                                end

                                rightIndex = 0
                                index86 = tick()
                                local RenderStepped = runService.Heartbeat

                                purchaseInfo.Misc.traxGrabConn = RenderStepped:Connect(
                                    function(player97)
                                        if not purchaseInfo.Misc.traxGrab then
                                            return
                                        else
                                            local gui = newPlayer.Character

                                            local player16 = gui and gui:FindFirstChild(
                                                "HumanoidRootPart"
                                            )

                                            if not player16 then
                                                return
                                            else
                                                local currentTime6 = tick()
                                                local offsetY = (math.sin(
                                                    (currentTime6 - index86) * 4
                                                ) * 0.5 + 0.5) * 3
                                                local player178 = createVector()

                                                if not player178 or not player178.Character then
                                                    return
                                                else
                                                    local camera = player178.Character
                                                    local success7 = camera:FindFirstChild(
                                                        "HumanoidRootPart"
                                                    )
                                                    local surfaceAppearance = camera:FindFirstChildOfClass(
                                                        "Humanoid"
                                                    )

                                                    if not success7 or not surfaceAppearance or surfaceAppearance.Health <= 0 then
                                                        return
                                                    else
                                                        local cashStat = surfaceAppearance:FindFirstChild(
                                                            "Ragdolled"
                                                        )

                                                        if cashStat and cashStat.Value == true then
                                                            local object = player178.Character

                                                            local player17 = object and object:FindFirstChild(
                                                                "HumanoidRootPart"
                                                            )

                                                            local isPinned = object
                                                            isPinned = object and object:FindFirstChild(
                                                                "Head"
                                                            )

                                                            if not player17 or not isPinned then
                                                                return
                                                            end

                                                            for index46, player179 in pairs(
                                                                object:GetDescendants()
                                                            ) do
                                                                if player179:IsA("BasePart") then
                                                                    player179.CanCollide = false
                                                                end
                                                            end

                                                            local leftChild = player16.CFrame * CFrame.new(
                                                                0, 0, -offsetY
                                                            )
                                                            deepCopyTable(
                                                                player17, leftChild * _traxHRPOffset
                                                            )

                                                            player17.AssemblyLinearVelocity = Vector3.zero
                                                            player17.AssemblyAngularVelocity = Vector3.zero

                                                            local initialValue = object:FindFirstChild(
                                                                "LeftLeg"
                                                            )

                                                            local result54 = initialValue

                                                            result54 = initialValue or object:FindFirstChild(
                                                                "LeftFoot"
                                                            ) or object:FindFirstChild("Left Leg")

                                                            if result54 then
                                                                deepCopyTable(
                                                                    result54,
                                                                    leftChild * _traxLLOffset
                                                                )
                                                            end

                                                            local result69 = object:FindFirstChild(
                                                                "RightLeg"
                                                            )

                                                            local result68 = result69

                                                            result68 = result69 or object:FindFirstChild(
                                                                "RightFoot"
                                                            ) or object:FindFirstChild("Right Leg")

                                                            if result68 then
                                                                deepCopyTable(
                                                                    result68,
                                                                    leftChild * _traxRLOffset
                                                                )
                                                            end

                                                            local result16 = object:FindFirstChild(
                                                                "Head"
                                                            )

                                                            if result16 then
                                                                deepCopyTable(
                                                                    result16,
                                                                    (CFrame.lookAt(
                                                                        (player17.CFrame * CFrame.new(
                                                                            0, 1.9, -0.2
                                                                        )).Position,
                                                                        player16.Position
                                                                    ))
                                                                )
                                                            end

                                                            return
                                                        end

                                                        rightIndex = rightIndex - 1

                                                        if rightIndex <= 0 then
                                                            local explosion = camera:FindFirstChild(
                                                                "Head"
                                                            )

                                                            if explosion then
                                                                marker.CFrame = CFrame.new(
                                                                    explosion.Position.X,
                                                                    explosion.Position.Y + 0.2,
                                                                    explosion.Position.Z
                                                                )

                                                                marker.AssemblyLinearVelocity = Vector3.zero
                                                                marker.AssemblyAngularVelocity = Vector3.new(
                                                                    1000, 1000, 1000
                                                                )
                                                                marker.CanCollide = true
                                                            end

                                                            rightIndex = 3
                                                        end

                                                        if rightIndex == 1 then
                                                            marker.CanCollide = false
                                                            marker.CFrame = tweenInfo
                                                            marker.AssemblyAngularVelocity = Vector3.zero
                                                        end

                                                        return
                                                    end
                                                end
                                            end
                                        end
                                    end
                                )

                                return
                            end
                        end
                    )
                end,
            }
        )

        instance6:AddToggle(
            "St2",
            {
                Text = "VoidGrab", Tooltip = "в ад",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player98)
                    purchaseInfo.Grab.VoidGrab = player98
                end,
            }
        )

        instance6:AddToggle(
            "St3",
            {
                Text = "Sky Grab", Tooltip = "к богу",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player99)
                    purchaseInfo.Grab.SkyGrab = player99
                end,
            }
        )

        instance6:AddToggle(
            "St4",
            {
                Text = "Spin Grab", Tooltip = "спинер",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player100)
                    purchaseInfo.Grab.SpinGrab = player100
                end,
            }
        )

        instance6:AddToggle(
            "St5",
            {
                Text = "Fling Grab", Tooltip = "флинг",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player101)
                    purchaseInfo.Grab.FlingGrab = player101
                end,
            }
        )

        -- https://discord.gg/AwGHNh7Z7T
        index87 = 0
        high = nil
        low = nil

        instance6:AddToggle(
            "St5",
            {
                Text = "InfZoom", Tooltip = "отяжка",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player102)
                    purchaseInfo.Grab.InfZoom = player102

                    if player102 then
                        index87 = 0

                        high = userInputService.InputChanged:Connect(
                            function(taskFunction)
                                if not purchaseInfo.Grab.InfZoom then
                                    return
                                end

                                if taskFunction.UserInputType == Enum.UserInputType.MouseWheel then
                                    if viewportFrame:FindFirstChild("GrabParts") then
                                        if taskFunction.Position.Z ~= 1 then
                                            index87 = index87 - 1.5
                                        else
                                            index87 = index87 + 1.5
                                        end
                                    else
                                        index87 = 0
                                    end
                                end
                            end
                        )

                        low = viewportFrame.ChildAdded:Connect(
                            function(button)
                                if not purchaseInfo.Grab.InfZoom then
                                    return
                                end

                                if button.Name == "GrabParts" then
                                    index87 = 0
                                    local character29 = button:WaitForChild("DragPart", 5)
                                    local textButton = character29 and character29:FindFirstChild(
                                        "DragAttach"
                                    )

                                    if textButton then
                                        while button.Parent and task.wait() do
                                            if not purchaseInfo.Grab.InfZoom then
                                                break
                                            end

                                            textButton.Position = viewportFrame.CurrentCamera.CFrame.LookVector * index87
                                        end
                                    end
                                end
                            end
                        )
                    else
                        if high then
                            high:Disconnect()
                            high = nil
                        end

                        if low then
                            low:Disconnect()
                            low = nil
                        end

                        index87 = 0
                    end
                end,
            }
        )

        instance6:AddToggle(
            "St5",
            {
                Text = "NoclipGrab", Tooltip = "ноуклип че непонятного",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player103)
                    purchaseInfo.Grab.NoclipGrab = enabled
                    GrabFeature.toggleNoclip(enabled)
                end,
            }
        )

        instance6:AddToggle(
            "St5",
            {
                Text = "MasslessGrab", Tooltip = "силач",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player105)
                    purchaseInfo.Grab.MasslessGrab = player105

                    if player105 then
                        task.spawn(
                            function()
                                while purchaseInfo.Grab.MasslessGrab do
                                    local character12 = workspace:FindFirstChild("GrabParts")

                                    if character12 then
                                        local DEBUG_MODE = false

                                        if purchaseInfo.Grab.MasslessGrabToys then
                                            for cell, player180 in ipairs(character12:GetChildren()) do
                                                local weldConstraint = player180:FindFirstChildOfClass(
                                                    "WeldConstraint"
                                                )

                                                if weldConstraint and weldConstraint.Part1 then
                                                    local childPart = weldConstraint.Part1
                                                    local element = PlayersService:GetPlayerFromCharacter(
                                                        childPart.Parent
                                                    )

                                                    if not element then
                                                        element = PlayersService:GetPlayerFromCharacter(
                                                            childPart
                                                        )
                                                    end

                                                    if element and element ~= newPlayer then
                                                        DEBUG_MODE = true
                                                        break
                                                    end
                                                end
                                            end
                                        end

                                        if not DEBUG_MODE then
                                            for index47, player181 in pairs(
                                                {character12:FindFirstChild("DragPart"), character12:FindFirstChild(
                                                    "DragPart1"
                                                ),}
                                            ) do
                                                if player181 then
                                                    local result = player181:FindFirstChildOfClass(
                                                        "AlignOrientation"
                                                    )

                                                    if result then
                                                        result.MaxAngularVelocity = math.huge
                                                        result.MaxTorque = math.huge
                                                        result.Responsiveness = 9999999999999
                                                    end

                                                    local instance = player181:FindFirstChildOfClass(
                                                        "AlignPosition"
                                                    )

                                                    if instance then
                                                        instance.MaxAxesForce = Vector3.new(
                                                            math.huge, math.huge, math.huge
                                                        )

                                                        instance.MaxForce = math.huge
                                                        instance.MaxVelocity = math.huge
                                                        instance.Responsiveness = 9999999999999
                                                    end
                                                end
                                            end
                                        end
                                    end

                                    task.wait()
                                end

                                local player11 = workspace:FindFirstChild("GrabParts")

                                if player11 then
                                    for index48, player182 in pairs(
                                        {player11:FindFirstChild("DragPart"), player11:FindFirstChild(
                                            "DragPart1"
                                        ),}
                                    ) do
                                        if player182 then
                                            local elevatorModel = newPlayer.Character

                                            local result37 = elevatorModel

                                            result37 = elevatorModel and elevatorModel:FindFirstChild(
                                                "HumanoidRootPart"
                                            )

                                            if result37 then
                                                result37.AssemblyLinearVelocity = player182.AssemblyLinearVelocity
                                                result37.AssemblyAngularVelocity = player182.AssemblyAngularVelocity
                                            end

                                            local player = player182:FindFirstChildOfClass(
                                                "AlignOrientation"
                                            )

                                            if player then
                                                player.MaxAngularVelocity = 20000
                                                player.MaxTorque = 100000
                                                player.Responsiveness = 40
                                            end

                                            local success = player182:FindFirstChildOfClass(
                                                "AlignPosition"
                                            )

                                            if success then
                                                success.MaxAxesForce = Vector3.new(
                                                    100000, 100000, 100000
                                                )
                                                success.MaxForce = 100000
                                                success.MaxVelocity = 20000
                                                success.Responsiveness = 40
                                            end
                                        end
                                    end
                                end
                            end
                        )
                    end
                end,
            }
        )

        local timestamp = ikConstraint.Defense:AddGroupbox(
            {
                Side = "Left", Name = "Defense", Description = "Def", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Anti Grab V1",
                Tooltip = "Anti-Grab V1 хорошо работает в связке с V2",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player106)
                    purchaseInfo.Anti.AntiGrab = player106
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Anti Grab V2", Tooltip = "Anti Grab V2",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player107)
                    if player107 then
                        result118.enableAntiGrabSolaris()
                    else
                        result118.disableAntiGrabSolaris()
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Anti Grab House Tp", Tooltip = "Anti Grab тепает к дому",
                DisabledTooltip = "PATCHED", Default = false, Disabled = true, Visible = true,
                Risky = false,
                Callback = function(player108)
                    purchaseInfo.Anti.HouseTpAntiGrab = player108

                    if player108 then
                        result118.startHouseTpAntiGrab()
                    else
                        result118.stopHouseTpAntiGrab()
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "FightBack", Tooltip = "Назад в бой",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player109)
                    purchaseInfo.Anti.FightBack = player109

                    if player109 then
                        result118.startFightBack()
                    else
                        result118.stopFightBack()
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Destroy All Gucci", Tooltip = "Destroy All Gucci",
                DisabledTooltip = "PATCHED", Default = false, Disabled = true, Visible = true,
                Risky = false,
                Callback = function(player110)
                    purchaseInfo.BlobmanBeta.destroyGucciActive = player110

                    if player110 then
                        purchaseInfo.BlobmanBeta.destroyGucciTask = task.spawn(
                            result120.StartDestroyGucciLoop
                        )
                    elseif purchaseInfo.BlobmanBeta.destroyGucciTask then
                        task.cancel(purchaseInfo.BlobmanBeta.destroyGucciTask)
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Anti Scticky", Tooltip = "Anti Scticky",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player111)
                    purchaseInfo.Anti.AntiSticky = player111

                    if player111 then
                        result118.setTouchQuery(false)
                    else
                        result118.setTouchQuery(true)
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Anti Lag", Tooltip = "Anti Lag",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player112)
                    purchaseInfo.Anti.AntiLag = player112

                    if clonedScript then
                        clonedScript.Disabled = player112
                    end
                end,
            }
        )

        userInputService.InputBegan:Connect(
            function(inputString, player113)
                if inputString.UserInputType ~= Enum.UserInputType.Keyboard then
                    return
                elseif inputString.KeyCode ~= Enum.KeyCode.L then
                    return
                else
                    if userInputService:IsKeyDown(Enum.KeyCode.LeftAlt) and userInputService:IsKeyDown(
                        Enum.KeyCode.LeftControl
                    ) and userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                        if not purchaseInfo.Anti.AntiLag then
                            purchaseInfo.Anti.AntiLag = true

                            if clonedScript then
                                clonedScript.Disabled = true
                            end
                        end
                    end

                    return
                end
            end
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Anti Gucci (Blobman)", Tooltip = "Anti Gucci (Blobman)",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player114)
                    purchaseInfo.Anti.AntiGucciBlobman = player114

                    if player114 then
                        result118.startAntiGucci()
                    else
                        result118.stopAntiGucci()
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "AntiGucciTrain", Tooltip = "Anti Gucci (Blobman)",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player115)
                    purchaseInfo.Anti.AntiGucciTrain = player115

                    if player115 then
                        result118.startAntiGucciTrain()
                    else
                        result118.stopAntiGucciTrain()
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "AntiRagdoll", Tooltip = "AntiRagdoll",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player116)
                    purchaseInfo.Anti.AntiRagdoll = player116

                    if player116 then
                        currentEvidence.antiRagdollConns = {}

                        local function onPlayerRemoving(player117)
                            if not purchaseInfo.Anti.AntiRagdoll then
                                return
                            end

                            local scrollFrame = player117:WaitForChild("Humanoid", 5)

                            if not scrollFrame then
                                return
                            else
                                scrollFrame.BreakJointsOnDeath = false
                                scrollFrame.AutoRotate = true

                                if scrollFrame.PlatformStand and not purchaseInfo.Misc.fakeDeath then
                                    scrollFrame.PlatformStand = false
                                end

                                local distance = scrollFrame:GetPropertyChangedSignal("AutoRotate")

                                table.insert(
                                    currentEvidence.antiRagdollConns,
                                    distance:Connect(
                                        function()
                                            if purchaseInfo.Anti.AntiRagdoll and scrollFrame.AutoRotate == false then
                                                scrollFrame.AutoRotate = true
                                            end
                                        end
                                    )
                                )

                                local instance20 = scrollFrame:GetPropertyChangedSignal(
                                    "PlatformStand"
                                )

                                table.insert(
                                    currentEvidence.antiRagdollConns,
                                    instance20:Connect(
                                        function()
                                            if purchaseInfo.Anti.AntiRagdoll and not purchaseInfo.Misc.fakeDeath and scrollFrame.PlatformStand == true then
                                                scrollFrame.PlatformStand = false
                                            end
                                        end
                                    )
                                )

                                local instance29 = runService.RenderStepped

                                table.insert(
                                    currentEvidence.antiRagdollConns,
                                    instance29:Connect(
                                        function()
                                            if purchaseInfo.Anti.AntiRagdoll and scrollFrame.Sit and scrollFrame.SeatPart == nil then
                                                scrollFrame.Sit = false
                                            end
                                        end
                                    )
                                )

                                return
                            end
                        end

                        if newPlayer.Character then
                            onPlayerRemoving(newPlayer.Character)
                        end

                        local queue = newPlayer.CharacterAdded
                        currentEvidence.connections.antiRagdoll = queue:Connect(onPlayerRemoving)
                    else
                        if currentEvidence.connections.antiRagdoll then
                            currentEvidence.connections.antiRagdoll:Disconnect()
                            currentEvidence.connections.antiRagdoll = nil
                        end

                        if currentEvidence.antiRagdollConns then
                            for n, characterConnection in ipairs(currentEvidence.antiRagdollConns) do
                                characterConnection:Disconnect()
                            end

                            currentEvidence.antiRagdollConns = nil
                        end

                        local Lighting = newPlayer.Character

                        local result22 = Lighting
                        result22 = Lighting and Lighting:FindFirstChildOfClass("Humanoid")

                        if result22 then
                            result22.BreakJointsOnDeath = true
                        end
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "AntiKillHamburger", Tooltip = "AntiKillHamburger",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player118)
                    purchaseInfo.Anti.AntiKillHamburger = player118
                    local currencyStat, match

                    if player118 then
                        if currentEvidence.antiKillSpamConnection then
                            currentEvidence.antiKillSpamConnection:Disconnect()
                            currentEvidence.antiKillSpamConnection = nil
                        end

                        match = false

                        currentEvidence.antiKillSpamConnection = runService.Heartbeat:Connect(
                            function()
                                if not purchaseInfo.Anti.AntiKillHamburger then
                                    return
                                end

                                local payload = newPlayer.Character
                                local hitHumanoid

                                if not payload or not payload:FindFirstChild("Humanoid") or payload.Humanoid.Health <= 0 then
                                    return
                                else
                                    local character2 = viewportFrame:FindFirstChild(
                                        newPlayer.Name .. "SpawnedInToys"
                                    )

                                    hitHumanoid = character2 and character2:FindFirstChild(
                                        "FoodHamburger"
                                    )

                                    if not hitHumanoid or not hitHumanoid:FindFirstChild("HoldPart") then
                                        pcall(
                                            function()
                                                PhysicsService.MenuToys.SpawnToyRemoteFunction:InvokeServer(
                                                    "FoodHamburger", CFrame.new(0, 300, 0),
                                                    Vector3.new(0, 0, 0)
                                                )
                                            end
                                        )

                                        match = false
                                        return
                                    end

                                    match = not match

                                    if match then
                                        pcall(
                                            function()
                                                hitHumanoid.HoldPart.HoldItemRemoteFunction:InvokeServer(
                                                    hitHumanoid, payload
                                                )
                                            end
                                        )
                                    else
                                        pcall(
                                            function()
                                                hitHumanoid.HoldPart.DropItemRemoteFunction:InvokeServer(
                                                    hitHumanoid, CFrame.new(0, 300, 0),
                                                    Vector3.new(0, 0, 0)
                                                )
                                            end
                                        )
                                    end

                                    return
                                end
                            end
                        )
                    else
                        if currentEvidence.antiKillSpamConnection then
                            currentEvidence.antiKillSpamConnection:Disconnect()
                            currentEvidence.antiKillSpamConnection = nil
                        end

                        local character3 = viewportFrame:FindFirstChild(
                            newPlayer.Name .. "SpawnedInToys"
                        )

                        currencyStat = character3 and character3:FindFirstChild("FoodHamburger")

                        if currencyStat and currencyStat:FindFirstChild("HoldPart") then
                            pcall(
                                function()
                                    currencyStat.HoldPart.DropItemRemoteFunction:InvokeServer(
                                        currencyStat, CFrame.new(0, 300, 0), Vector3.new(0, 0, 0)
                                    )
                                end
                            )
                        end
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "AntiBlobman Kill", Tooltip = "AntiBlobman Kill",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player119)
                    purchaseInfo.Anti.AntiBlobmanKill = player119

                    if player119 then
                        result118.startAntiBlobmanKill()
                    else
                        result118.stopAntiBlobmanKill()
                    end
                end,
            }
        )

        purchaseInfo.Anti.removeAllAntiInput = false
        nearestPlayer = nil

        timestamp:AddToggle(
            "St5",
            {
                Text = "removeAllAntiInput", Tooltip = "remove All Anti-Input",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player120)
                    purchaseInfo.Anti.removeAllAntiInput = player120

                    if player120 then
                        nearestPlayer = task.spawn(
                            function()
                                local result123 = {
                                    FoodHamburger = true, FoodCoconut = true,
                                    FoodPizzaCheese = true, FoodPizzaPepperoni = true,
                                    FoodHotdog = true, FoodMushroomPoison = true, FoodBread = true,
                                    FoodDippyEgg = true, FoodMayonnaise = true,
                                    FoodFrenchFries = true, FoodMeatStick = true, FoodDonut = true,
                                    FoodCakePink = true, InstrumentGuitarBanjo = true,
                                    InstrumentGuitarViolin = true, InstrumentGuitarUkulele = true,
                                    InstrumentWoodwindSaxophone = true,
                                    InstrumentWoodwindOcarina = true,
                                    InstrumentBrassVuvuzelaQwizik = true,
                                    InstrumentBrassTrumpet = true, InstrumentDrumBongos = true,
                                    InstrumentDrumSnare = true, InstrumentPianoMelodica = true,
                                    InstrumentVoiceMicrophone = true, CupMugWhite = true,
                                    CupMugBrown = true, PoopPile = true, PoopPileSparkle = true,
                                }

                                local left = newPlayer.Character or newPlayer.CharacterAdded:Wait()
                                local HumanoidRootPart = left:WaitForChild("HumanoidRootPart")
                                local openSet = {}

                                local touchConnection = viewportFrame.DescendantAdded:Connect(
                                    function(point)
                                        if result123[point.Name] and point:IsA("Model") then
                                            task.spawn(
                                                function()
                                                    if point:WaitForChild("HoldPart", 3) then
                                                        table.insert(openSet, point)
                                                    end
                                                end
                                            )
                                        end
                                    end
                                )

                                for index5, player183 in ipairs(viewportFrame:GetDescendants()) do
                                    if result123[player183.Name] and player183:IsA("Model") and player183:FindFirstChild(
                                        "HoldPart"
                                    ) then
                                        table.insert(openSet, player183)
                                    end
                                end

                                while purchaseInfo.Anti.removeAllAntiInput do
                                    for stack = #openSet, 1, -1 do
                                        local top = openSet[stack]

                                        if not top or not top.Parent or not top:FindFirstChild(
                                            "HoldPart"
                                        ) then
                                            table.remove(openSet, stack)
                                        else
                                            local instance9 = top.HoldPart

                                            pcall(
                                                function()
                                                    instance9.HoldItemRemoteFunction:InvokeServer(
                                                        top, left
                                                    )
                                                end
                                            )

                                            task.wait(0.05)

                                            pcall(
                                                function()
                                                    instance9.DropItemRemoteFunction:InvokeServer(
                                                        top,
                                                        CFrame.new(
                                                            HumanoidRootPart.Position + Vector3.new(
                                                                0, -2000, 0
                                                            )
                                                        ), Vector3.new(0, 0, 0)
                                                    )
                                                end
                                            )

                                            task.wait(0.1)
                                        end
                                    end

                                    task.wait(0.2)
                                end

                                touchConnection:Disconnect()
                            end
                        )
                    elseif nearestPlayer then
                        task.cancel(nearestPlayer)
                        nearestPlayer = nil
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "AntiPaint", Tooltip = "Вас не покрасят",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player121)
                    purchaseInfo.Anti.AntiPaint = player121

                    if player121 then
                        result118.deleteAllPaintParts()
                        result118.watchNewPaintParts()
                    else
                        result118.disconnectWatchers()
                        result118.restorePaintParts()
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Anti Fire", Tooltip = "Анти огонь",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player122)
                    purchaseInfo.Anti.AntiFire = player122
                    local index88

                    if player122 then
                        local newPart = viewportFrame:FindFirstChild("Map") and viewportFrame.Map:FindFirstChild(
                            "Hole"
                        ) and viewportFrame.Map.Hole:FindFirstChild("PoisonBigHole") and viewportFrame.Map.Hole.PoisonBigHole:FindFirstChild(
                            "ExtinguishPart"
                        )

                        if newPart then
                            currentEvidence.antiFireOriginalCF = newPart.CFrame
                            index88 = 0

                            currentEvidence.antiFireConn = runService.Heartbeat:Connect(
                                function()
                                    if not purchaseInfo.Anti.AntiFire then
                                        return
                                    else
                                        local currentTime7 = tick()

                                        if currentTime7 - index88 < 0.05 then
                                            return
                                        else
                                            index88 = currentTime7
                                            local sourcePlayer = newPlayer.Character

                                            local character16 = sourcePlayer and sourcePlayer:FindFirstChild(
                                                "HumanoidRootPart"
                                            )

                                            if not character16 then
                                                return
                                            end

                                            if character16:FindFirstChild("FireLight") or character16:FindFirstChild(
                                                "FireParticleEmitter"
                                            ) then
                                                newPart.CFrame = character16.CFrame
                                            elseif currentEvidence.antiFireOriginalCF then
                                                newPart.CFrame = currentEvidence.antiFireOriginalCF
                                            end

                                            return
                                        end
                                    end
                                end
                            )
                        end
                    else
                        if currentEvidence.antiFireConn then
                            currentEvidence.antiFireConn:Disconnect()
                            currentEvidence.antiFireConn = nil
                        end

                        if currentEvidence.antiFireOriginalCF then
                            local handle = viewportFrame:FindFirstChild("Map") and viewportFrame.Map:FindFirstChild(
                                "Hole"
                            ) and viewportFrame.Map.Hole:FindFirstChild("PoisonBigHole") and viewportFrame.Map.Hole.PoisonBigHole:FindFirstChild(
                                "ExtinguishPart"
                            )

                            if handle then
                                handle.CFrame = currentEvidence.antiFireOriginalCF
                            end
                        end
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Anti Explosion", Tooltip = "Anti Explosion",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player123)
                    purchaseInfo.Anti.AntiExplosion = player123

                    if player123 then
                        if newPlayer.Character then
                            result118.setupAntiExplosion(newPlayer.Character)
                        end

                        if currentEvidence.connections.antiExplosionChar then
                            currentEvidence.connections.antiExplosionChar:Disconnect()
                        end

                        local size = newPlayer.CharacterAdded

                        currentEvidence.connections.antiExplosionChar = size:Connect(
                            function(player124)
                                if connection then
                                    connection:Disconnect()
                                end

                                result118.setupAntiExplosion(player124)
                            end
                        )
                    else
                        if connection then
                            connection:Disconnect()
                            connection = nil
                        end

                        if currentEvidence.connections.antiExplosionChar then
                            currentEvidence.connections.antiExplosionChar:Disconnect()
                            currentEvidence.connections.antiExplosionChar = nil
                        end
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "Anti Void", Tooltip = "Anti Void",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player125)
                    purchaseInfo.Anti.AntiVoid = player125

                    if player125 then
                        viewportFrame.FallenPartsDestroyHeight = -1000

                        task.spawn(
                            function()
                                while purchaseInfo.Anti.AntiVoid do
                                    local vehicleClone = result116.GetPlayerCharacter()

                                    if vehicleClone and vehicleClone:FindFirstChild(
                                        "HumanoidRootPart"
                                    ) then
                                        if vehicleClone.HumanoidRootPart.Position.Y < -800 then
                                            vehicleClone:SetPrimaryPartCFrame(CFrame.new(0, 100, 0))
                                        end
                                    end

                                    task.wait(0.1)
                                end
                            end
                        )
                    else
                        viewportFrame.FallenPartsDestroyHeight = -100
                    end
                end,
            }
        )

        timestamp:AddToggle(
            "St5",
            {
                Text = "AntiOwnership", Tooltip = "AntiOwnership",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player126)
                    purchaseInfo.Anti.AntiOwnership = player126

                    if player126 then
                        currentEvidence.antiOwnershipConns.task = task.spawn(
                            function()
                                pcall(
                                    function()
                                        local instance39 = PhysicsService:WaitForChild(
                                            "CharacterEvents"
                                        ):WaitForChild("Struggle")

                                        while purchaseInfo.Anti.AntiOwnership do
                                            local folder = newPlayer.Character

                                            if folder and folder:FindFirstChild("Head") then
                                                if folder.Head:FindFirstChild("PartOwner") then
                                                    pcall(
                                                        function()
                                                            instance39:FireServer(newPlayer)
                                                        end
                                                    )

                                                    for index49, value26 in pairs(
                                                        folder:GetChildren()
                                                    ) do
                                                        local player184 = value26

                                                        if player184:IsA("BasePart") then
                                                            pcall(
                                                                function()
                                                                    player184.Anchored = true
                                                                end
                                                            )
                                                        end
                                                    end

                                                    local stringValue = newPlayer:FindFirstChild(
                                                        "IsHeld"
                                                    )

                                                    while stringValue and stringValue.Value and purchaseInfo.Anti.AntiOwnership do
                                                        task.wait(0.05)
                                                    end

                                                    for index50, value27 in pairs(
                                                        folder:GetChildren()
                                                    ) do
                                                        local player185 = value27

                                                        if player185:IsA("BasePart") then
                                                            pcall(
                                                                function()
                                                                    player185.Anchored = false
                                                                end
                                                            )
                                                        end
                                                    end
                                                end
                                            end

                                            task.wait(0.1)
                                        end
                                    end
                                )
                            end
                        )
                    else
                        if currentEvidence.antiOwnershipConns.task then
                            task.cancel(currentEvidence.antiOwnershipConns.task)
                            currentEvidence.antiOwnershipConns.task = nil
                        end

                        local found = newPlayer.Character

                        if found then
                            for index52, value28 in pairs(found:GetChildren()) do
                                local player186 = value28

                                if player186:IsA("BasePart") then
                                    pcall(
                                        function()
                                            player186.Anchored = false
                                        end
                                    )
                                end
                            end
                        end
                    end
                end,
            }
        )

        local RunService = ikConstraint.Defense:AddGroupbox(
            {
                Side = "Right", Name = "Anti Kick", Description = "Def", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        RunService:AddToggle(
            "St5",
            {
                Text = "Gravity AntiKick", Tooltip = "Gravity AntiKick",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = true,
                Callback = function(player127)
                    purchaseInfo.Anti.AntiKickKunai = player127

                    if player127 then
                        workspace.Gravity = 5000
                    else
                        workspace.Gravity = 196.2
                    end
                end,
            }
        )

        RunService:AddToggle(
            "St5",
            {
                Text = "Shuriken AntiKick", Tooltip = "Shuriken AntiKick",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player128)
                    purchaseInfo.Anti.ShurikenAntiKick = player128

                    if player128 then
                        task.spawn(
                            function()
                                local instance33 = PhysicsService:WaitForChild("GrabEvents"):WaitForChild(
                                    "SetNetworkOwner"
                                )
                                local instance38 = PhysicsService:WaitForChild("PlayerEvents"):WaitForChild(
                                    "StickyPartEvent"
                                )
                                local HitmanBoardRemote = PhysicsService.MenuToys.SpawnToyRemoteFunction
                                local AimbotLogEvent = PhysicsService:WaitForChild("MenuToys"):WaitForChild(
                                    "DestroyToy"
                                )
                                local errorMessage = newPlayer:WaitForChild("CanSpawnToy")

                                local function generateUniqueIdentifier()
                                    if newPlayer.Character and newPlayer.Character:FindFirstChild(
                                        "HumanoidRootPart"
                                    ) then
                                        return newPlayer.Character.HumanoidRootPart
                                    end

                                    return newPlayer.CharacterAdded:Wait():WaitForChild(
                                        "HumanoidRootPart"
                                    )
                                end

                                local function mainLoop()
                                    if not viewportFrame.PlotItems.PlayersInPlots:FindFirstChild(
                                        newPlayer.Name
                                    ) then
                                        return false
                                    end

                                    for index53, player187 in pairs(
                                        viewportFrame.Plots:GetChildren()
                                    ) do
                                        local result62 = player187:FindFirstChild("PlotSign")

                                        local result83 = result62
                                        result83 = result62 and result62:FindFirstChild(
                                            "ThisPlotsOwners"
                                        )

                                        if result83 then
                                            for index54, player188 in pairs(result83:GetChildren()) do
                                                if player188.Value == newPlayer.Name then
                                                    local result10 = viewportFrame.PlotItems:FindFirstChild(
                                                        player187.Name
                                                    )

                                                    if result10 then
                                                        return true, result10
                                                    end
                                                end
                                            end
                                        end
                                    end

                                    return false
                                end

                                local function Scheduler()
                                    local result11 = viewportFrame:FindFirstChild(
                                        newPlayer.Name .. "SpawnedInToys"
                                    )

                                    if result11 and AimbotLogEvent then
                                        for index55, value29 in pairs(result11:GetChildren()) do
                                            local player189 = value29

                                            if player189.Name == "AntiKick" or player189.Name == "NinjaShuriken" then
                                                pcall(
                                                    function()
                                                        AimbotLogEvent:FireServer(player189)
                                                    end
                                                )
                                            end
                                        end
                                    end
                                end

                                local function onInputBegan(player129)
                                    if not player129 or not player129:FindFirstChild("StickyPart") then
                                        return
                                    else
                                        local player190 = generateUniqueIdentifier()

                                        if not player190 then
                                            return
                                        else
                                            if player129:FindFirstChild("SoundPart") then
                                                if not player129.SoundPart:FindFirstChild(
                                                    "PartOwner"
                                                ) or player129.SoundPart.PartOwner.Value ~= newPlayer.Name then
                                                    instance33:FireServer(
                                                        player129.SoundPart,
                                                        player129.SoundPart.CFrame
                                                    )
                                                end
                                            end

                                            local v = player190:FindFirstChild("FirePlayerPart") or player190:WaitForChild(
                                                "FirePlayerPart", 5
                                            )

                                            if v then
                                                instance38:FireServer(
                                                    player129.StickyPart, v,
                                                    CFrame.new(0, 0, 0) * CFrame.Angles(
                                                        0, math.rad(90), math.rad(90)
                                                    )
                                                )
                                            end

                                            for index56, clonePart in pairs(player129:GetChildren()) do
                                                if clonePart:IsA("BasePart") then
                                                    clonePart.CanTouch = false
                                                    clonePart.CanCollide = false
                                                    clonePart.CanQuery = false
                                                end
                                            end

                                            return
                                        end
                                    end
                                end

                                local function initialize(BOOST_REMOTE_EVENT_NAME)
                                    local currentTime8 = tick()

                                    while not errorMessage.Value do
                                        if not purchaseInfo.Anti.ShurikenAntiKick or tick() - currentTime8 > 5 then
                                            return nil
                                        end

                                        task.wait(0.1)
                                    end

                                    local instance44 = generateUniqueIdentifier()

                                    if instance44 then
                                        task.spawn(
                                            function()
                                                pcall(
                                                    function()
                                                        HitmanBoardRemote:InvokeServer(
                                                            BOOST_REMOTE_EVENT_NAME,
                                                            instance44.CFrame * CFrame.new(0, 3, 15),
                                                            Vector3.new(0, 0, 0)
                                                        )
                                                    end
                                                )
                                            end
                                        )
                                    end

                                    local result124, character25 = mainLoop()

                                    local LocalPlayer = viewportFrame:FindFirstChild(
                                        newPlayer.Name .. "SpawnedInToys"
                                    )

                                    if result124 and character25 then
                                        return character25:WaitForChild(BOOST_REMOTE_EVENT_NAME, 2)
                                    end

                                    if not viewportFrame.PlotItems.PlayersInPlots:FindFirstChild(
                                        newPlayer.Name
                                    ) and LocalPlayer then
                                        return LocalPlayer:WaitForChild(BOOST_REMOTE_EVENT_NAME, 2)
                                    end

                                    return nil
                                end

                                local result126

                                while purchaseInfo.Anti.ShurikenAntiKick do
                                    task.wait(0.05)

                                    if not newPlayer.Character or not newPlayer.Character:FindFirstChild(
                                        "Humanoid"
                                    ) or newPlayer.Character.Humanoid.Health <= 0 then
                                    else
                                        local character4 = viewportFrame:FindFirstChild(
                                            newPlayer.Name .. "SpawnedInToys"
                                        )

                                        local node = character4 and character4:FindFirstChild(
                                            "NinjaShuriken"
                                        )

                                        if viewportFrame.PlotItems.PlayersInPlots:FindFirstChild(
                                            newPlayer.Name
                                        ) then
                                            local result127, player191 = mainLoop()

                                            if result127 and player191 and viewportFrame.Plots:FindFirstChild(
                                                player191.Name
                                            ) then
                                                local result63 = viewportFrame.Plots[player191.Name]:FindFirstChild(
                                                    "PlotSign"
                                                )

                                                if result63 and result63.ThisPlotsOwners.Value.TimeRemainingNum.Value > 89 then
                                                    node = initialize("NinjaShuriken")

                                                    if node == nil then
                                                    else
                                                        node.Name = "AntiKick"
                                                        onInputBegan(node)
                                                        ::continuePlayer::
                                                        ::innerContinue::
                                                        ::continueColumn::

                                                        if not node then
                                                            if viewportFrame.PlotItems.PlayersInPlots:FindFirstChild(
                                                                newPlayer.Name
                                                            ) then
                                                            else
                                                                node = initialize("NinjaShuriken")

                                                                if node == nil then
                                                                else
                                                                    node.Name = "AntiKick"

                                                                    if not node then
                                                                    else
                                                                        ::continueCandidate::

                                                                        if node then
                                                                            if not not purchaseInfo.Anti.ShurikenAntiKick then
                                                                                if not not node:FindFirstChild(
                                                                                    "StickyPart"
                                                                                ) then
                                                                                    if not (node.StickyPart.CanTouch == false) then
                                                                                        if not not newPlayer.Character then
                                                                                            if not not newPlayer.Character:FindFirstChild(
                                                                                                "HumanoidRootPart"
                                                                                            ) then
                                                                                                v1940 = not node:FindFirstChild(
                                                                                                    "StickyPart"
                                                                                                )
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end

                                                                        repeat
                                                                            if node and node:FindFirstChild(
                                                                                "StickyPart"
                                                                            ) and node.StickyPart.CanTouch == true then
                                                                                onInputBegan(node)
                                                                                node.Name = "AntiKick"
                                                                            end

                                                                            task.wait(0.3)
                                                                            local result128 = not node

                                                                            result126 = result128

                                                                            result126 = result128 or not purchaseInfo.Anti.ShurikenAntiKick or not node:FindFirstChild(
                                                                                "StickyPart"
                                                                            ) or node.StickyPart.CanTouch == false or not newPlayer.Character or not newPlayer.Character:FindFirstChild(
                                                                                "HumanoidRootPart"
                                                                            ) or not node:FindFirstChild(
                                                                                "StickyPart"
                                                                            ) or (newPlayer.Character.HumanoidRootPart.Position - node.StickyPart.Position).Magnitude >= 20
                                                                        until result126

                                                                        if not node or not node:FindFirstChild(
                                                                            "StickyPart"
                                                                        ) or not newPlayer.Character or not newPlayer.Character:FindFirstChild(
                                                                            "HumanoidRootPart"
                                                                        ) or (newPlayer.Character.HumanoidRootPart.Position - node.StickyPart.Position).Magnitude >= 20 then
                                                                            Scheduler()
                                                                        end

                                                                        pcall(
                                                                            function()
                                                                                if purchaseInfo.Anti.ShurikenAntiKick then
                                                                                    if not not newPlayer.Character then
                                                                                        if not not newPlayer.Character:FindFirstChild(
                                                                                            "Humanoid"
                                                                                        ) then
                                                                                            if not not node then
                                                                                                if not not node:FindFirstChild(
                                                                                                    "StickyPart"
                                                                                                ) then
                                                                                                    v1981 = not node.StickyPart:FindFirstChild(
                                                                                                        "StickyWeld"
                                                                                                    )
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end

                                                                                local result129

                                                                                repeat
                                                                                    task.wait(0.05)
                                                                                    local result130 = not purchaseInfo.Anti.ShurikenAntiKick

                                                                                    result129 = result130

                                                                                    result129 = result130 or not newPlayer.Character or not newPlayer.Character:FindFirstChild(
                                                                                        "Humanoid"
                                                                                    ) or not node or not node:FindFirstChild(
                                                                                        "StickyPart"
                                                                                    ) or not node.StickyPart:FindFirstChild(
                                                                                        "StickyWeld"
                                                                                    ) or not node.StickyPart.StickyWeld.Part1
                                                                                until result129

                                                                                if not node or not node:FindFirstChild(
                                                                                    "StickyPart"
                                                                                ) or newPlayer.Character and newPlayer.Character:FindFirstChild(
                                                                                    "Humanoid"
                                                                                ) and newPlayer.Character.Humanoid.Health <= 0 or not node.StickyPart:FindFirstChild(
                                                                                    "StickyWeld"
                                                                                ).Part1 then
                                                                                    Scheduler()
                                                                                end
                                                                            end
                                                                        )
                                                                    end
                                                                end
                                                            end
                                                        else
                                                            goto continueCandidate
                                                        end
                                                    end
                                                else
                                                    goto continuePlayer
                                                end
                                            else
                                                goto innerContinue
                                            end
                                        else
                                            goto continueColumn
                                        end
                                    end
                                end

                                Scheduler()
                            end
                        )
                    else
                        local function serializeTable()
                            local result12 = viewportFrame:FindFirstChild(
                                newPlayer.Name .. "SpawnedInToys"
                            )

                            local AntiCheatEvent = PhysicsService:WaitForChild("MenuToys"):WaitForChild(
                                "DestroyToy"
                            )

                            if result12 and AntiCheatEvent then
                                for index57, value30 in pairs(result12:GetChildren()) do
                                    local player192 = value30

                                    if player192.Name == "AntiKick" or player192.Name == "NinjaShuriken" then
                                        pcall(
                                            function()
                                                AntiCheatEvent:FireServer(player192)
                                            end
                                        )
                                    end
                                end
                            end
                        end

                        serializeTable()
                    end
                end,
            }
        )

        RunService:AddToggle(
            "St5",
            {
                Text = "AntiKick Kunai", Tooltip = "AntiKick Kunai",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player130)
                    purchaseInfo.Anti.AntiKickKunai = player130

                    if player130 then
                        result118.createKunaiMessageGui()
                        result118.attachKunai(false)

                        if currentEvidence.loops.kunaiCheck then
                            task.cancel(currentEvidence.loops.kunaiCheck)
                        end

                        currentEvidence.loops.kunaiCheck = task.spawn(
                            function()
                                local shared = false
                                local index89 = 0

                                while purchaseInfo.Anti.AntiKickKunai do
                                    task.wait(0.2)
                                    local characterInstance = result116.GetPlayerCharacter()

                                    if not characterInstance then
                                    else
                                        local result131 = result118.getRightLeg(characterInstance)

                                        if not result131 then
                                        else
                                            local sound = currentEvidence.currentKunai

                                            if sound and (not sound.Parent or not sound:FindFirstChild(
                                                "StickyPart"
                                            )) then
                                                sound = nil
                                                currentEvidence.currentKunai = nil
                                            end

                                            if sound then
                                                local player137 = sound:FindFirstChild("StickyPart")

                                                if player137 then
                                                    local motor = player137:FindFirstChild(
                                                        "StickyWeld"
                                                    )

                                                    if motor and (motor and motor.Part1) == result131 then
                                                        index89 = 0
                                                    else
                                                        ::continueLoop::
                                                        pcall(
                                                            function()
                                                                HUMANOID:FireServer(sound)
                                                            end
                                                        )
                                                        currentEvidence.currentKunai = nil
                                                        task.wait(0.2)
                                                        ::continueNeighbor::
                                                        index89 = index89 + 1

                                                        if index89 > 3 and purchaseInfo.Anti.ShurikenAntiKick then
                                                            shared = not shared
                                                            index89 = 0
                                                        elseif index89 > 3 then
                                                            index89 = 0
                                                        end

                                                        if shared then
                                                            pcall(
                                                                function()
                                                                    local instance12 = characterInstance:FindFirstChild(
                                                                        "HumanoidRootPart"
                                                                    )

                                                                    if instance12 then
                                                                        BuoyancyRemoteFunction:InvokeServer(
                                                                            "NinjaShuriken",
                                                                            instance12.CFrame * CFrame.new(
                                                                                0, 12, 20
                                                                            ), Vector3.new(0, 0, 0)
                                                                        )
                                                                    end
                                                                end
                                                            )

                                                            task.wait(0.5)

                                                            if result153 then
                                                                for index90, i in result153:GetChildren(
                                                                ) do
                                                                    if i.Name == "NinjaShuriken" and i ~= currentEvidence.currentKunai then
                                                                        i.Name = "AntiKick"
                                                                        currentEvidence.currentKunai = i
                                                                        local player138 = i:FindFirstChild(
                                                                            "StickyPart"
                                                                        )

                                                                        if player138 then
                                                                            pcall(
                                                                                function()
                                                                                    fireId:FireServer(
                                                                                        player138,
                                                                                        player138.CFrame
                                                                                    )
                                                                                end
                                                                            )

                                                                            local encoded = characterInstance:FindFirstChild(
                                                                                "HumanoidRootPart"
                                                                            ) and characterInstance.HumanoidRootPart:FindFirstChild(
                                                                                "FirePlayerPart"
                                                                            )

                                                                            if encoded then
                                                                                pcall(
                                                                                    function()
                                                                                        instance37:FireServer(
                                                                                            player138,
                                                                                            encoded,
                                                                                            CFrame.new(
                                                                                                0,
                                                                                                0, 0
                                                                                            ) * CFrame.Angles(
                                                                                                0,
                                                                                                math.rad(
                                                                                                    90
                                                                                                ),
                                                                                                math.rad(
                                                                                                    90
                                                                                                )
                                                                                            )
                                                                                        )
                                                                                    end
                                                                                )
                                                                            end
                                                                        end

                                                                        break
                                                                    end
                                                                end
                                                            end
                                                        else
                                                            result118.attachKunai(true)
                                                        end
                                                    end
                                                else
                                                    goto continueLoop
                                                end
                                            else
                                                goto continueNeighbor
                                            end
                                        end
                                    end
                                end
                            end
                        )
                    else
                        if currentEvidence.loops.kunaiCheck then
                            task.cancel(currentEvidence.loops.kunaiCheck)
                            currentEvidence.loops.kunaiCheck = nil
                        end

                        if currentEvidence.currentKunai and currentEvidence.currentKunai.Parent then
                            pcall(
                                function()
                                    HUMANOID:FireServer(currentEvidence.currentKunai)
                                end
                            )
                        end

                        currentEvidence.currentKunai = nil

                        if title then
                            title.Text = ""
                            title.TextTransparency = 1
                        end
                    end
                end,
            }
        )

        result125 = {}

        function config()
            local character26 = text()
            return character26 and character26:FindFirstChild("HumanoidRootPart")
        end

        function text()
            return newPlayer.Character
        end

        function instance2()
            local result132 = text()
            return result132 and result132:FindFirstChildOfClass("Humanoid")
        end

        function isReady()
            local result133 = instance2()

            if result133 and valueType == nil then
                valueType = result133.JumpPower
                seed = result133.JumpHeight
            end
        end

        valueType = nil
        seed = nil

        local instance21 = ikConstraint.plr:AddGroupbox(
            {
                Side = "Left", Name = "Player", Description = "Def", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        instance21:AddToggle(
            "St5",
            {
                Text = "Toggle Speed", Tooltip = "Toggle Speed",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player131)
                    purchaseInfo.Player.walkspeed = player131

                    if result125.WS then
                        result125.WS:Disconnect()
                    end

                    if player131 then
                        result125.WS = runService.Stepped:Connect(
                            function()
                                local result134 = config()
                                local result135 = instance2()

                                if result134 and result135 then
                                    local currentY = result134.AssemblyLinearVelocity.Y

                                    result134.CFrame = result134.CFrame + result135.MoveDirection * (16 * purchaseInfo.Player.walkspeedValue / 100)

                                    result134.AssemblyLinearVelocity = Vector3.new(
                                        result134.AssemblyLinearVelocity.X, currentY,
                                        result134.AssemblyLinearVelocity.Z
                                    )
                                end
                            end
                        )
                    end
                end,
            }
        )

        instance21:AddSlider(
            "VV",
            {
                Text = "Speed Multiplier", Default = 0, Min = 1, Max = 35, Rounding = 1,
                Suffix = "%", Compact = false, HideMax = false,
                FormatDisplayValue = function(player132, player133)
                    if value == player132.Max then
                        return "Max"
                    end
                end,
                Callback = function(func)
                    purchaseInfo.Player.walkspeedValue = func
                end,
            }
        )

        instance21:AddToggle(
            "St5",
            {
                Text = "noclip", Tooltip = "noclip",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(original)
                    purchaseInfo.Player.noclip = original

                    if result125.NC then
                        result125.NC:Disconnect()
                    end

                    if original then
                        result125.NC = runService.Stepped:Connect(
                            function()
                                local character27 = text()

                                if character27 then
                                    for index58, player193 in pairs(character27:GetDescendants()) do
                                        if player193:IsA("BasePart") then
                                            player193.CanCollide = false
                                        end
                                    end
                                end
                            end
                        )
                    end
                end,
            }
        )

        instance21:AddToggle(
            "St5",
            {
                Text = "infiniteJump", Tooltip = "infiniteJump",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(width)
                    purchaseInfo.Player.infiniteJump = width

                    if result125.IJ then
                        result125.IJ:Disconnect()
                    end

                    if width then
                        result125.IJ = userInputService.JumpRequest:Connect(
                            function()
                                local result136 = instance2()

                                if result136 then
                                    result136:ChangeState(Enum.HumanoidStateType.Freefall)
                                    task.wait()
                                    result136:ChangeState(Enum.HumanoidStateType.Jumping)
                                end
                            end
                        )
                    end
                end,
            }
        )

        instance21:AddToggle(
            "St5",
            {
                Text = "JumpPower", Tooltip = "JumpPower",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(reason)
                    purchaseInfo.Player.jumpPower = reason
                    local instance45 = instance2()

                    if instance45 then
                        isReady()

                        if reason then
                            if instance45.UseJumpPower == false then
                                instance45.JumpHeight = math.clamp(
                                    purchaseInfo.Player.jumpPowerValue / 10, 7.2, 50
                                )
                            else
                                instance45.JumpPower = purchaseInfo.Player.jumpPowerValue
                            end
                        elseif instance45.UseJumpPower == false then
                            instance45.JumpHeight = seed or 7.2
                        else
                            instance45.JumpPower = valueType or 50
                        end
                    end
                end,
            }
        )

        instance21:AddSlider(
            "VV",
            {
                Text = "jumpPowerValue", Default = 0, Min = 50, Max = 150, Rounding = 1,
                Suffix = "%", Compact = false, HideMax = false,
                FormatDisplayValue = function(other, secondVector)
                    if value == other.Max then
                        return "Max"
                    end
                end,
                Callback = function(exponent)
                    purchaseInfo.Player.jumpPowerValue = exponent

                    if purchaseInfo.Player.jumpPower then
                        local result137 = instance2()

                        if result137 then
                            if result137.UseJumpPower == false then
                                result137.JumpHeight = math.clamp(exponent / 10, 7.2, 50)
                            else
                                result137.JumpPower = exponent
                            end
                        end
                    end
                end,
            }
        )

        instance21:AddToggle(
            "St5",
            {
                Text = "applyGravity", Tooltip = "applyGravity",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(callbackFunction)
                    purchaseInfo.Player.applyGravity = callbackFunction

                    if callbackFunction then
                        if result125.GR then
                            task.cancel(result125.GR)
                        end

                        result125.GR = task.spawn(
                            function()
                                while purchaseInfo.Player.applyGravity do
                                    viewportFrame.Gravity = purchaseInfo.Player.gravityValue
                                    task.wait()
                                end
                            end
                        )
                    else
                        viewportFrame.Gravity = 100
                    end
                end,
            }
        )

        instance21:AddSlider(
            "VV",
            {
                Text = "gravityValue", Default = 100, Min = 100, Max = 500, Rounding = 1,
                Suffix = "%", Compact = false, HideMax = false,
                FormatDisplayValue = function(newValue, pointA)
                    if value == newValue.Max then
                        return "Max"
                    end
                end,
                Callback = function(eventData)
                    purchaseInfo.Player.gravityValue = eventData
                end,
            }
        )

        containsSuper = false
        currentNode = nil
        screenGui = nil
        heartbeatConnection = nil
        newPosition = Vector3.zero

        function flyStart()
            if containsSuper then
                return
            else
                local player18 = newPlayer.Character and newPlayer.Character:FindFirstChild(
                    "HumanoidRootPart"
                )

                if not player18 then
                    return
                end

                containsSuper = true

                screenGui = Instance.new("BodyGyro")
                screenGui.P = 20000
                screenGui.D = 500
                screenGui.MaxTorque = Vector3.new(100000, 100000, 100000)
                screenGui.CFrame = player18.CFrame
                screenGui.Parent = player18

                currentNode = Instance.new("BodyVelocity")
                currentNode.MaxForce = Vector3.new(100000, 100000, 100000)
                currentNode.Velocity = Vector3.zero
                currentNode.Parent = player18

                heartbeatConnection = runService.Heartbeat:Connect(
                    function(radius)
                        if not containsSuper then
                            heartbeatConnection:Disconnect()
                            heartbeatConnection = nil
                            return
                        else
                            local bodyGyro = viewportFrame.CurrentCamera

                            local player14 = newPlayer.Character and newPlayer.Character:FindFirstChildOfClass(
                                "Humanoid"
                            )

                            if not bodyGyro or not player14 then
                                return
                            else
                                local velocity = player14.MoveDirection
                                local toTarget = Vector3.zero

                                if velocity.Magnitude > 0.01 then
                                    local firstVector = bodyGyro.CFrame.LookVector
                                    local halfSize = bodyGyro.CFrame.RightVector
                                    local directionToTarget = Vector3.new(
                                        firstVector.X, 0, firstVector.Z
                                    ).Unit
                                    local directionVector = Vector3.new(halfSize.X, 0, halfSize.Z).Unit
                                    local t = velocity:Dot(directionToTarget)
                                    local deltaZ = velocity:Dot(directionVector)
                                    local scalar = purchaseInfo.Player.flySpeed

                                    toTarget = (directionToTarget * t + directionVector * deltaZ) * scalar + Vector3.new(
                                        0, firstVector.Y * t * scalar, 0
                                    )
                                end

                                newPosition = newPosition:Lerp(
                                    toTarget,
                                    math.clamp(
                                        radius * (toTarget.Magnitude > newPosition.Magnitude and 8 or 6),
                                        0, 1
                                    )
                                )

                                if currentNode then
                                    currentNode.Velocity = newPosition
                                end

                                if screenGui then
                                    screenGui.CFrame = bodyGyro.CFrame
                                end

                                return
                            end
                        end
                    end
                )

                return
            end
        end

        function flyStop()
            containsSuper = false
            newPosition = Vector3.zero

            if screenGui then
                screenGui:Destroy()
                screenGui = nil
            end

            if currentNode then
                currentNode:Destroy()
                currentNode = nil
            end

            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
        end

        instance21:AddLabel("Fly Bind"):AddKeyPicker(
            "Isdw",
            {
                Default = "P", SyncToggleState = false, Mode = "Toggle", Text = "Fly Bind",
                NoUI = false, WaitForCallback = false,
                Callback = function(quantity)
                    if not purchaseInfo.Player.flyEnabled then
                        return
                    end

                    if containsSuper then
                        purchaseInfo.Player.fly = false
                        flyStop()
                    else
                        purchaseInfo.Player.fly = true
                        flyStart()
                    end
                end, ChangedCallback = function(origin, handler) end,
            }
        )

        instance21:AddSlider(
            "VV",
            {
                Text = "Fly Speed", Default = 0, Min = 1, Max = 100, Rounding = 1, Suffix = "%",
                Compact = false, HideMax = false,
                FormatDisplayValue = function(options, player26)
                    if value == options.Max then
                        return "Max"
                    end
                end,
                Callback = function(player27)
                    purchaseInfo.Player.flySpeed = player27
                end,
            }
        )

        instance21:AddToggle(
            "St5",
            {
                Text = "Toggle Fly", Tooltip = "Toggle Fly", DisabledTooltip = "PATCHED",
                Default = false, Disabled = true, Visible = true, Risky = false,
                Callback = function(player28)
                    purchaseInfo.Player.flyEnabled = player28

                    if not player28 and containsSuper then
                        flyStop()
                    end
                end,
            }
        )

        newPlayer.CharacterAdded:Connect(
            function()
                task.wait(0.5)

                if containsSuper then
                    flyStop()
                end
            end
        )

        local instance18 = ikConstraint.plr:AddGroupbox(
            {
                Side = "Right", Name = "Mics", Description = "Def", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        instance18:AddToggle(
            "St",
            {
                Text = "Toggle miniMap", Tooltip = "Toggle miniMap (может лагать)",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = true,
                Callback = function(player29)
                    purchaseInfo.Misc.miniMap = player29

                    if player29 then
                        result122.startMiniMap()
                    else
                        result122.stopMiniMap()
                    end
                end,
            }
        )

        instance18:AddToggle(
            "St",
            {
                Text = "Toggle FOV", Tooltip = "Fov",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player30)
                    purchaseInfo.Misc.FOVChanger = player30

                    if not player30 then
                        viewportFrame.CurrentCamera.FieldOfView = 70
                    else
                        viewportFrame.CurrentCamera.FieldOfView = purchaseInfo.Misc.FOVValue
                    end
                end,
            }
        )

        instance18:AddSlider(
            "Isdwx",
            {
                Text = "FOV", Default = 70, Min = 40, Max = 120, Rounding = 1, Suffix = "%",
                Compact = false, HideMax = false,
                FormatDisplayValue = function(player32, value2)
                    if value2 == player32.Max then
                        return "Max"
                    end
                end,
                Callback = function(player33)
                    purchaseInfo.Misc.FOVValue = player33

                    if purchaseInfo.Misc.FOVChanger then
                        viewportFrame.CurrentCamera.FieldOfView = player33
                    end
                end,
            }
        )

        instance18:AddToggle(
            "St",
            {
                Text = "ThirdPerson", Tooltip = "Включение третьего лица",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player34)
                    purchaseInfo.Misc.ThirdPerson = player34

                    if player34 then
                        result122.enableThirdPerson()
                    else
                        result122.disableThirdPerson()
                    end
                end,
            }
        )

        instance18:AddDropdown(
            "Index",
            {
                Values = {
                    "Delete Legs Local", "Delete Right Leg Local", "Delete Left Leg Local",
                    "Delete Right Arm Local", "Delete Left Arm Local", "Delete All Local",
                    "Delete Legs Grabbed Player", "Delete Right Leg Grabbed",
                    "Delete Left Leg Grabbed", "Delete Right Arm Grabbed",
                    "Delete Left Arm Grabbed", "Delete All Grabbed",
                }, Default = 1, Multi = false, Text = "Action",
                Tooltip = "выбор удаления", Searchable = false,
                FormatDisplayValue = function(player35)
                    return Value
                end,
                Callback = function(player36)
                    antiSelectedAction = player36
                end,
            }
        )

        instance18:AddButton(
            {
                Text = "Delete",
                Func = function()
                    task.spawn(
                        function()
                            local function generateRandomPoints()
                                local character13 = viewportFrame:FindFirstChild("GrabParts")

                                if not character13 then
                                    return nil
                                end

                                for index6, player194 in ipairs(character13:GetChildren()) do
                                    if player194.Name == "GrabPart" then
                                        local motorJoint = player194:FindFirstChildOfClass(
                                            "WeldConstraint"
                                        ) or player194:FindFirstChildOfClass("Weld") or player194:FindFirstChildOfClass(
                                            "ManualWeld"
                                        )

                                        if motorJoint then
                                            local parentPart = motorJoint.Part0
                                            local part1 = motorJoint.Part1

                                            if part1 and part1 ~= player194 then
                                                return part1
                                            end

                                            if parentPart and parentPart ~= player194 then
                                                return parentPart
                                            end
                                        end
                                    end
                                end

                                return nil
                            end

                            local function initializeSystem()
                                local player195 = generateRandomPoints()
                                local result138 = not player195 or not player195.Parent
                                local bestPair

                                if result138 then
                                    return nil
                                else
                                    local hitCharacter = player195.Parent
                                    local raycastResult = hitCharacter:FindFirstChild("Head")
                                    local result139 = not raycastResult
                                    local terrain = hitCharacter:FindFirstChildOfClass("Humanoid")

                                    if result139 or not terrain then
                                        return nil
                                    else
                                        local currencyValue = terrain:FindFirstChild("Ragdolled")

                                        if currencyValue and currencyValue.Value == true then
                                            return hitCharacter
                                        else
                                            PhysicsService:WaitForChild("MenuToys"):WaitForChild(
                                                "SpawnToyRemoteFunction"
                                            )
                                            local graph = CFrame.new(0, 800000, 0)
                                            bestPair = nil

                                            for neighbor = 1, 50 do
                                                local player6 = workspace:FindFirstChild(
                                                    newPlayer.Name .. "SpawnedInToys"
                                                )

                                                if player6 then
                                                    bestPair = player6:FindFirstChild(
                                                        "InstrumentDrumSnare"
                                                    )
                                                end

                                                if bestPair then
                                                    break
                                                end

                                                task.wait()
                                            end

                                            if not bestPair then
                                                return hitCharacter
                                            else
                                                local zonePart = bestPair:FindFirstChild(
                                                    "SoundPart"
                                                )

                                                if not zonePart then
                                                    return hitCharacter
                                                end

                                                zonePart.CanCollide = false
                                                zonePart.Anchored = false

                                                zonePart.CFrame = CFrame.new(
                                                    raycastResult.Position.X,
                                                    raycastResult.Position.Y + 0.2,
                                                    raycastResult.Position.Z
                                                )

                                                zonePart.AssemblyLinearVelocity = Vector3.zero
                                                zonePart.AssemblyAngularVelocity = Vector3.new(
                                                    1000, 1000, 1000
                                                )
                                                zonePart.CanCollide = true

                                                for vertex = 1, 30 do
                                                    task.wait(0.05)
                                                    local healthValue = terrain:FindFirstChild(
                                                        "Ragdolled"
                                                    )

                                                    if healthValue and healthValue.Value == true then
                                                        break
                                                    end
                                                end

                                                zonePart.CanCollide = false
                                                zonePart.CFrame = graph
                                                zonePart.AssemblyAngularVelocity = Vector3.zero

                                                pcall(
                                                    function()
                                                        PhysicsService.MenuToys.DestroyToy:FireServer(
                                                            bestPair
                                                        )
                                                    end
                                                )

                                                if bestPair.Parent then
                                                    bestPair:Destroy()
                                                end

                                                return hitCharacter
                                            end
                                        end
                                    end
                                end
                            end

                            local platformPart, partA, endPart, hookPart

                            if antiSelectedAction == "Delete Legs Local" then
                                local angle = newPlayer.Character or newPlayer.CharacterAdded:Wait()
                                local result55 = angle:FindFirstChild("Left Leg")
                                local result70 = angle:FindFirstChild("Right Leg")

                                local result86 = angle:WaitForChild("Torso") or angle:WaitForChild(
                                    "UpperTorso"
                                )

                                local result38 = angle:WaitForChild("HumanoidRootPart")
                                local AuctionBidEvent = PhysicsService:WaitForChild(
                                    "CharacterEvents"
                                ):WaitForChild("RagdollRemote")

                                if result55 and result70 and result86 and result38 then
                                    local result2 = viewportFrame.FallenPartsDestroyHeight
                                    local source = result86.CFrame
                                    viewportFrame.FallenPartsDestroyHeight = -100
                                    AuctionBidEvent:FireServer(result38, 2)
                                    task.wait(0.5)
                                    result55.CFrame = CFrame.new(0, -10000, 0)
                                    result70.CFrame = CFrame.new(0, -10000, 0)
                                    task.wait(0.3)
                                    result86.CFrame = CFrame.new(0, -9970, 0)
                                    task.wait(0.5)
                                    result86.CFrame = source
                                    task.wait(0.5)
                                    viewportFrame.FallenPartsDestroyHeight = result2
                                end

                                return
                            elseif antiSelectedAction == "Delete Right Leg Local" then
                                local visited = newPlayer.Character or newPlayer.CharacterAdded:Wait(
                                )
                                local result71 = visited:FindFirstChild("Right Leg")

                                local result87 = visited:WaitForChild("Torso") or visited:WaitForChild(
                                    "UpperTorso"
                                )

                                local result39 = visited:WaitForChild("HumanoidRootPart")
                                local AuctionRemoteEvent = PhysicsService:WaitForChild(
                                    "CharacterEvents"
                                ):WaitForChild("RagdollRemote")

                                if result71 and result87 and result39 then
                                    local result3 = viewportFrame.FallenPartsDestroyHeight
                                    local ReplicatedStorage = result87.CFrame
                                    viewportFrame.FallenPartsDestroyHeight = -100
                                    AuctionRemoteEvent:FireServer(result39, 2)
                                    task.wait(0.5)
                                    result71.CFrame = CFrame.new(0, -10000, 0)
                                    task.wait(0.3)
                                    result87.CFrame = CFrame.new(0, -9970, 0)
                                    task.wait(0.5)
                                    result87.CFrame = ReplicatedStorage
                                    task.wait(0.5)
                                    viewportFrame.FallenPartsDestroyHeight = result3
                                end

                                return
                            elseif antiSelectedAction == "Delete Left Leg Local" then
                                local direction = newPlayer.Character or newPlayer.CharacterAdded:Wait(
                                )
                                local result56 = direction:FindFirstChild("Left Leg")

                                local result88 = direction:WaitForChild("Torso") or direction:WaitForChild(
                                    "UpperTorso"
                                )

                                local result40 = direction:WaitForChild("HumanoidRootPart")
                                local BlockRemoteEvent = PhysicsService:WaitForChild(
                                    "CharacterEvents"
                                ):WaitForChild("RagdollRemote")

                                if result56 and result88 and result40 then
                                    local result4 = viewportFrame.FallenPartsDestroyHeight
                                    local Workspace = result88.CFrame
                                    viewportFrame.FallenPartsDestroyHeight = -100
                                    BlockRemoteEvent:FireServer(result40, 2)
                                    task.wait(0.5)
                                    result56.CFrame = CFrame.new(0, -10000, 0)
                                    task.wait(0.3)
                                    result88.CFrame = CFrame.new(0, -9970, 0)
                                    task.wait(0.5)
                                    result88.CFrame = Workspace
                                    task.wait(0.5)
                                    viewportFrame.FallenPartsDestroyHeight = result4
                                end

                                return
                            elseif antiSelectedAction == "Delete Right Arm Local" then
                                local cost = newPlayer.Character or newPlayer.CharacterAdded:Wait()
                                local result65 = cost:FindFirstChild("Right Arm")

                                local result89 = cost:WaitForChild("Torso") or cost:WaitForChild(
                                    "UpperTorso"
                                )

                                local result41 = cost:WaitForChild("HumanoidRootPart")
                                local BoloRemoteEvent = PhysicsService:WaitForChild(
                                    "CharacterEvents"
                                ):WaitForChild("RagdollRemote")

                                if result65 and result89 and result41 then
                                    local result5 = viewportFrame.FallenPartsDestroyHeight
                                    local parent = result89.CFrame
                                    viewportFrame.FallenPartsDestroyHeight = -100
                                    BoloRemoteEvent:FireServer(result41, 2)
                                    task.wait(0.5)
                                    result65.CFrame = CFrame.new(0, -10000, 0)
                                    task.wait(0.3)
                                    result89.CFrame = CFrame.new(0, -9970, 0)
                                    task.wait(0.5)
                                    result89.CFrame = parent
                                    task.wait(0.5)
                                    viewportFrame.FallenPartsDestroyHeight = result5
                                end

                                return
                            elseif antiSelectedAction == "Delete Left Arm Local" then
                                local depth = newPlayer.Character or newPlayer.CharacterAdded:Wait()
                                local result52 = depth:FindFirstChild("Left Arm")

                                local result90 = depth:WaitForChild("Torso") or depth:WaitForChild(
                                    "UpperTorso"
                                )

                                local result42 = depth:WaitForChild("HumanoidRootPart")
                                local CableUpdateEvent = PhysicsService:WaitForChild(
                                    "CharacterEvents"
                                ):WaitForChild("RagdollRemote")

                                if result52 and result90 and result42 then
                                    local result6 = viewportFrame.FallenPartsDestroyHeight
                                    local name = result90.CFrame
                                    viewportFrame.FallenPartsDestroyHeight = -100
                                    CableUpdateEvent:FireServer(result42, 2)
                                    task.wait(0.5)
                                    result52.CFrame = CFrame.new(0, -10000, 0)
                                    task.wait(0.3)
                                    result90.CFrame = CFrame.new(0, -9970, 0)
                                    task.wait(0.5)
                                    result90.CFrame = name
                                    task.wait(0.5)
                                    viewportFrame.FallenPartsDestroyHeight = result6
                                end

                                return
                            elseif antiSelectedAction == "Delete All Local" then
                                local currentQuantity = newPlayer.Character or newPlayer.CharacterAdded:Wait(
                                )
                                local instance16 = currentQuantity:FindFirstChild("Left Leg")
                                local instance31 = currentQuantity:FindFirstChild("Right Leg")
                                local instance15 = currentQuantity:FindFirstChild("Left Arm")
                                local instance30 = currentQuantity:FindFirstChild("Right Arm")

                                local result91 = currentQuantity:WaitForChild("Torso") or currentQuantity:WaitForChild(
                                    "UpperTorso"
                                )

                                local result43 = currentQuantity:WaitForChild("HumanoidRootPart")
                                local CameraFocusRemote = PhysicsService:WaitForChild(
                                    "CharacterEvents"
                                ):WaitForChild("RagdollRemote")

                                if result91 and result43 then
                                    local result7 = viewportFrame.FallenPartsDestroyHeight
                                    local playerIdentifier = result91.CFrame
                                    viewportFrame.FallenPartsDestroyHeight = -100
                                    CameraFocusRemote:FireServer(result43, 2)
                                    task.wait(0.5)

                                    if instance16 then
                                        instance16.CFrame = CFrame.new(0, -10000, 0)
                                    end

                                    if instance31 then
                                        instance31.CFrame = CFrame.new(0, -10000, 0)
                                    end

                                    if instance15 then
                                        instance15.CFrame = CFrame.new(0, -10000, 0)
                                    end

                                    if instance30 then
                                        instance30.CFrame = CFrame.new(0, -10000, 0)
                                    end

                                    task.wait(0.3)
                                    result91.CFrame = CFrame.new(0, -9970, 0)
                                    task.wait(0.5)
                                    result91.CFrame = playerIdentifier
                                    task.wait(0.5)
                                    viewportFrame.FallenPartsDestroyHeight = result7
                                end

                                return
                            elseif antiSelectedAction == "Delete Legs Grabbed Player" then
                                local player196 = initializeSystem()

                                if not player196 then
                                    return
                                else
                                    local result57 = player196:FindFirstChild("Left Leg")
                                    local result72 = player196:FindFirstChild("Right Leg")
                                    local character23 = player196:FindFirstChild("Torso") or player196:FindFirstChild(
                                        "UpperTorso"
                                    )

                                    if not character23 then
                                        return
                                    else
                                        local deltaTime = character23.CFrame
                                        viewportFrame.FallenPartsDestroyHeight = -100

                                        local function addVectors(floorPart)
                                            if not floorPart then
                                                return
                                            end

                                            pcall(
                                                function()
                                                    fireId:FireServer(floorPart, floorPart.CFrame)
                                                end
                                            )
                                            task.wait(0.05)

                                            floorPart.Anchored = true
                                            floorPart.CFrame = CFrame.new(0, -10000, 0)
                                            floorPart.CanCollide = false

                                            task.wait(0.05)
                                            floorPart.Anchored = false
                                        end

                                        addVectors(result57)

                                        task.wait(0.1)
                                        addVectors(result72)
                                        task.wait(0.3)
                                        character23.CFrame = CFrame.new(0, -9970, 0)
                                        task.wait(0.5)
                                        character23.CFrame = deltaTime
                                        task.wait(0.5)
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        return
                                    end
                                end
                            elseif antiSelectedAction == "Delete Right Leg Grabbed" then
                                local player197 = initializeSystem()

                                if not player197 then
                                    return
                                else
                                    hookPart = player197:FindFirstChild("Right Leg")
                                    local character24 = player197:FindFirstChild("Torso") or player197:FindFirstChild(
                                        "UpperTorso"
                                    )

                                    if not character24 or not hookPart then
                                        return
                                    else
                                        local currentCFrame = character24.CFrame
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        pcall(
                                            function()
                                                fireId:FireServer(hookPart, hookPart.CFrame)
                                            end
                                        )
                                        task.wait(0.05)

                                        hookPart.Anchored = true
                                        hookPart.CFrame = CFrame.new(0, -10000, 0)
                                        hookPart.CanCollide = false

                                        task.wait(0.05)
                                        hookPart.Anchored = false
                                        task.wait(0.3)
                                        character24.CFrame = CFrame.new(0, -9970, 0)
                                        task.wait(0.5)
                                        character24.CFrame = currentCFrame
                                        task.wait(0.5)
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        return
                                    end
                                end
                            elseif antiSelectedAction == "Delete Left Leg Grabbed" then
                                local player198 = initializeSystem()

                                if not player198 then
                                    return
                                else
                                    endPart = player198:FindFirstChild("Left Leg")
                                    local character18 = player198:FindFirstChild("Torso") or player198:FindFirstChild(
                                        "UpperTorso"
                                    )

                                    if not character18 or not endPart then
                                        return
                                    else
                                        local originalCFrame = character18.CFrame
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        pcall(
                                            function()
                                                fireId:FireServer(endPart, endPart.CFrame)
                                            end
                                        )
                                        task.wait(0.05)

                                        endPart.Anchored = true
                                        endPart.CFrame = CFrame.new(0, -10000, 0)
                                        endPart.CanCollide = false

                                        task.wait(0.05)
                                        endPart.Anchored = false
                                        task.wait(0.3)
                                        character18.CFrame = CFrame.new(0, -9970, 0)
                                        task.wait(0.5)
                                        character18.CFrame = originalCFrame
                                        task.wait(0.5)
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        return
                                    end
                                end
                            elseif antiSelectedAction == "Delete Right Arm Grabbed" then
                                local player199 = initializeSystem()

                                if not player199 then
                                    return
                                else
                                    partA = player199:FindFirstChild("Right Arm")
                                    local character19 = player199:FindFirstChild("Torso") or player199:FindFirstChild(
                                        "UpperTorso"
                                    )

                                    if not character19 or not partA then
                                        return
                                    else
                                        local cameraCFrame = character19.CFrame
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        pcall(
                                            function()
                                                fireId:FireServer(partA, partA.CFrame)
                                            end
                                        )
                                        task.wait(0.05)

                                        partA.Anchored = true
                                        partA.CFrame = CFrame.new(0, -10000, 0)
                                        partA.CanCollide = false

                                        task.wait(0.05)
                                        partA.Anchored = false
                                        task.wait(0.3)
                                        character19.CFrame = CFrame.new(0, -9970, 0)
                                        task.wait(0.5)
                                        character19.CFrame = cameraCFrame
                                        task.wait(0.5)
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        return
                                    end
                                end
                            elseif antiSelectedAction == "Delete Left Arm Grabbed" then
                                local player200 = initializeSystem()

                                if not player200 then
                                    return
                                else
                                    platformPart = player200:FindFirstChild("Left Arm")
                                    local character20 = player200:FindFirstChild("Torso") or player200:FindFirstChild(
                                        "UpperTorso"
                                    )

                                    if not character20 or not platformPart then
                                        return
                                    else
                                        local cframe = character20.CFrame
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        pcall(
                                            function()
                                                fireId:FireServer(platformPart, platformPart.CFrame)
                                            end
                                        )
                                        task.wait(0.05)

                                        platformPart.Anchored = true
                                        platformPart.CFrame = CFrame.new(0, -10000, 0)
                                        platformPart.CanCollide = false

                                        task.wait(0.05)
                                        platformPart.Anchored = false
                                        task.wait(0.3)
                                        character20.CFrame = CFrame.new(0, -9970, 0)
                                        task.wait(0.5)
                                        character20.CFrame = cframe
                                        task.wait(0.5)
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        return
                                    end
                                end
                            elseif antiSelectedAction == "Delete All Grabbed" then
                                local player201 = initializeSystem()

                                if not player201 then
                                    return
                                else
                                    local result58 = player201:FindFirstChild("Left Leg")
                                    local result73 = player201:FindFirstChild("Right Leg")
                                    local result53 = player201:FindFirstChild("Left Arm")
                                    local result66 = player201:FindFirstChild("Right Arm")
                                    local character21 = player201:FindFirstChild("Torso") or player201:FindFirstChild(
                                        "UpperTorso"
                                    )

                                    if not character21 then
                                        return
                                    else
                                        local partCFrame = character21.CFrame
                                        viewportFrame.FallenPartsDestroyHeight = -100

                                        local function calculateDistance(startPart)
                                            if not startPart then
                                                return
                                            end

                                            pcall(
                                                function()
                                                    fireId:FireServer(startPart, startPart.CFrame)
                                                end
                                            )
                                            task.wait(0.05)

                                            startPart.Anchored = true
                                            startPart.CFrame = CFrame.new(0, -10000, 0)
                                            startPart.CanCollide = false

                                            task.wait(0.05)
                                            startPart.Anchored = false
                                        end

                                        calculateDistance(result58)

                                        task.wait(0.05)
                                        calculateDistance(result73)
                                        task.wait(0.05)
                                        calculateDistance(result53)
                                        task.wait(0.05)
                                        calculateDistance(result66)
                                        task.wait(0.3)
                                        character21.CFrame = CFrame.new(0, -9970, 0)
                                        task.wait(0.5)
                                        character21.CFrame = partCFrame
                                        task.wait(0.5)
                                        viewportFrame.FallenPartsDestroyHeight = -100
                                        return
                                    end
                                end
                            else
                                return
                            end
                        end
                    )
                end, DoubleClick = false, Tooltip = "Удалить выбранные части",
                DisabledTooltip = "Отключено", Disabled = false, Visible = true,
                Risky = false,
            }
        )

        instance18:AddButton(
            {
                Text = "Fake Korblox",
                Func = function()
                    task.spawn(
                        function()
                            local sign = newPlayer.Character or newPlayer.CharacterAdded:Wait()
                            local result74 = sign:FindFirstChild("Right Leg")

                            local result84 = sign:WaitForChild("Torso") or sign:WaitForChild(
                                "UpperTorso"
                            )

                            local result44 = sign:WaitForChild("HumanoidRootPart")
                            local ClipboardEvent = PhysicsService:WaitForChild("CharacterEvents"):WaitForChild(
                                "RagdollRemote"
                            )

                            if result74 and result84 and result44 then
                                local result8 = viewportFrame.FallenPartsDestroyHeight
                                local startCFrame = result84.CFrame
                                viewportFrame.FallenPartsDestroyHeight = -100
                                ClipboardEvent:FireServer(result44, 2)
                                task.wait(0.5)
                                result74.CFrame = CFrame.new(0, -10000, 0)
                                task.wait(0.3)
                                result84.CFrame = CFrame.new(0, -9970, 0)
                                task.wait(0.5)
                                result84.CFrame = startCFrame
                                task.wait(0.5)
                                viewportFrame.FallenPartsDestroyHeight = result8
                            end

                            task.wait(0.2)

                            local PLAYER_CHARACTER = newPlayer.Character and newPlayer.Character:FindFirstChild(
                                "HumanoidRootPart"
                            )

                            local result59, HUMANOID_ROOT_PART, bestDistance, offsetZ

                            if not PLAYER_CHARACTER then
                                return
                            else
                                local startTime = CFrame.new(0, 0, -5)

                                BuoyancyRemoteFunction:InvokeServer(
                                    "NinjaKunai", PLAYER_CHARACTER.CFrame * startTime, Vector3.zero
                                )

                                task.wait(0.5)

                                local character6 = viewportFrame:FindFirstChild(
                                    newPlayer.Name .. "SpawnedInToys"
                                )

                                result59 = character6 and character6:FindFirstChild("NinjaKunai")

                                if not result59 or not result59:FindFirstChild("StickyPart") then
                                    return
                                end

                                PLAYER_CHARACTER.CFrame = CFrame.new(
                                    result59.StickyPart.Position + Vector3.new(0, 0, 2)
                                )

                                task.wait(0.1)
                                HUMANOID_ROOT_PART = PhysicsService:WaitForChild("GrabEvents")

                                pcall(
                                    function()
                                        fireId:FireServer(
                                            result59.StickyPart, result59.StickyPart.CFrame
                                        )
                                    end
                                )

                                pcall(
                                    function()
                                        HUMANOID_ROOT_PART.CreateGrabLine:FireServer(
                                            result59.StickyPart, Vector3.zero,
                                            result59.StickyPart.Position, false
                                        )
                                    end
                                )

                                task.wait(0.05)
                                pcall(
                                    function()
                                        HUMANOID_ROOT_PART.DestroyGrabLine:FireServer(
                                            result59.StickyPart
                                        )
                                    end
                                )

                                for index59, obstacleTemplate in pairs(result59:GetChildren()) do
                                    if obstacleTemplate:IsA("BasePart") then
                                        obstacleTemplate.CanTouch = false
                                        obstacleTemplate.CanQuery = false
                                    end
                                end

                                bestDistance = PLAYER_CHARACTER:FindFirstChild("FirePlayerPart") or PLAYER_CHARACTER:WaitForChild(
                                    "FirePlayerPart", 5
                                )

                                if not bestDistance then
                                    local result85 = sign:FindFirstChild("Torso")

                                    local result95 = result85
                                    result95 = result85 or sign:FindFirstChild("UpperTorso")

                                    bestDistance = result95 and result95:FindFirstChild(
                                        "FirePlayerPart"
                                    )
                                end

                                if not bestDistance then
                                    bestDistance = PLAYER_CHARACTER
                                end

                                if bestDistance then
                                    offsetZ = CFrame.new(0.5, -1.3, 0) * CFrame.Angles(
                                        0, 0, math.rad(90)
                                    )

                                    for triangle = 1, 10 do
                                        task.spawn(
                                            function()
                                                pcall(
                                                    function()
                                                        instance37:FireServer(
                                                            result59.StickyPart, bestDistance,
                                                            offsetZ
                                                        )
                                                    end
                                                )
                                            end
                                        )
                                    end
                                end

                                currentEvidence.kunaiMonitorConn = task.spawn(
                                    function()
                                        local newDenominator = CFrame.new(0.5, -1.3, 0) * CFrame.Angles(
                                            0, 0, math.rad(90)
                                        )
                                        local MAX_ITERATIONS = 0

                                        while result59 and result59.Parent and result59:FindFirstChild(
                                            "StickyPart"
                                        ) do
                                            task.wait(0.5)
                                            local index91 = 22602600474909
                                            local childName = createVector3
                                            local player202 = newPlayer[tree[childName(
                                                '\212"\2\144\220\245\159p{', index91
                                            )]]
                                            local smallest = player202

                                            if player202 then
                                                index91 = 22191104583773
                                                childName = tree[index91]
                                                smallest = player202:FindFirstChild(childName)
                                            end

                                            local player203 = smallest

                                            if not player203 then
                                            else
                                                local player139 = result59:FindFirstChild(
                                                    "StickyPart"
                                                )

                                                if not player139 then
                                                    break
                                                elseif (player139.Position - player203.Position).Magnitude < 2 then
                                                else
                                                    local count = player203.CFrame
                                                    player203.CFrame = player139.CFrame * CFrame.new(
                                                        0, 0, 4
                                                    )
                                                    task.wait(0.2)

                                                    if MAX_ITERATIONS % 3 == 0 then
                                                        pcall(
                                                            function()
                                                                fireId:FireServer(
                                                                    player139, player139.CFrame
                                                                )
                                                            end
                                                        )
                                                    elseif MAX_ITERATIONS % 3 == 1 then
                                                        pcall(
                                                            function()
                                                                HUMANOID_ROOT_PART.CreateGrabLine:FireServer(
                                                                    player139, Vector3.zero,
                                                                    player139.Position, false
                                                                )
                                                            end
                                                        )
                                                    else
                                                        pcall(
                                                            function()
                                                                HUMANOID_ROOT_PART.DestroyGrabLine:FireServer(
                                                                    player139
                                                                )
                                                            end
                                                        )
                                                    end

                                                    task.wait(0.05)

                                                    local nearestDistance = player203:FindFirstChild(
                                                        "FirePlayerPart"
                                                    ) or player203:WaitForChild("FirePlayerPart", 5)

                                                    if not nearestDistance then
                                                        local character22 = player202 and (player202:FindFirstChild(
                                                            "Torso"
                                                        ) or player202:FindFirstChild("UpperTorso"))

                                                        nearestDistance = character22 and character22:FindFirstChild(
                                                            "FirePlayerPart"
                                                        )
                                                    end

                                                    if not nearestDistance then
                                                        nearestDistance = player203
                                                    end

                                                    if nearestDistance then
                                                        pcall(
                                                            function()
                                                                instance37:FireServer(
                                                                    player139, nearestDistance,
                                                                    newDenominator
                                                                )
                                                            end
                                                        )
                                                    end

                                                    task.wait(0.1)
                                                    player203.CFrame = count
                                                    MAX_ITERATIONS = MAX_ITERATIONS + 1
                                                end
                                            end
                                        end
                                    end
                                )

                                return
                            end
                        end
                    )
                end, DoubleClick = false,
                Tooltip = "Fake корблокс (видите его только вы)",
                DisabledTooltip = "Отключено", Disabled = false, Visible = true,
                Risky = false,
            }
        )

        local player9 = _G
        player9.Invisibility = _G.Invisibility or {}

        _G.Invisibility.noclipEnabled = false
        _G.Invisibility.cameraOffset = 10
        _G.Invisibility.undergroundDepthOffset = 20
        _G.Invisibility.initialized = false
        _G.Invisibility.originalPosition = nil
        _G.Invisibility.originalCameraCFrame = nil
        _G.Invisibility.noclipConnection = nil
        _G.Invisibility.humanoidRootPartTransparency = nil

        local context = _G.Invisibility
        context.character = newPlayer.Character or newPlayer.CharacterAdded:Wait()

        local localPlayer = _G.Invisibility.character
        _G.Invisibility.humanoidRootPart = localPlayer:WaitForChild("HumanoidRootPart")
        local Player = _G.Invisibility.character

        _G.Invisibility.head = Player:WaitForChild("Head")
        _G.Invisibility.camera = viewportFrame.CurrentCamera

        function _G.Invisibility.setNoclip(player37)
            if player37 then
                local instance36 = runService.Stepped

                _G.Invisibility.noclipConnection = instance36:Connect(
                    function()
                        for index60, player204 in pairs(_G.Invisibility.character:GetChildren()) do
                            if player204:IsA("BasePart") then
                                player204.CanCollide = false
                            end
                        end
                    end
                )
            elseif _G.Invisibility.noclipConnection then
                _G.Invisibility.noclipConnection:Disconnect()
                _G.Invisibility.noclipConnection = nil
            end
        end

        function _G.Invisibility.setHumanoidRootPartTransparency(player141)
            if _G.Invisibility.humanoidRootPart then
                _G.Invisibility.humanoidRootPart.Transparency = player141
            end
        end

        function _G.Invisibility.toggleNoclip(value3)
            if _G.Invisibility.noclipEnabled ~= value3 then
                _G.Invisibility.noclipEnabled = value3

                if _G.Invisibility.noclipEnabled then
                    _G.Invisibility.originalPosition = _G.Invisibility.humanoidRootPart.Position
                    _G.Invisibility.originalCameraCFrame = _G.Invisibility.camera.CFrame
                    _G.Invisibility.humanoidRootPartTransparency = _G.Invisibility.humanoidRootPart.Transparency
                    _G.Invisibility.setHumanoidRootPartTransparency(1)
                    _G.Invisibility.setNoclip(true)

                    local index92 = _G.Invisibility.originalPosition.Y + _G.Invisibility.cameraOffset

                    local instance48 = Vector3.new(
                        _G.Invisibility.originalPosition.X,
                        index92 - _G.Invisibility.undergroundDepthOffset,
                        _G.Invisibility.originalPosition.Z
                    )

                    _G.Invisibility.humanoidRootPart.CFrame = CFrame.new(instance48)
                    local position6 = Vector3.new(instance48.X, index92, instance48.Z)

                    _G.Invisibility.camera.CFrame = CFrame.new(
                        position6, position6 + _G.Invisibility.camera.CFrame.LookVector
                    )
                else
                    _G.Invisibility.setNoclip(false)

                    local instance49 = Vector3.new(
                        _G.Invisibility.humanoidRootPart.Position.X,
                        _G.Invisibility.originalPosition.Y,
                        _G.Invisibility.humanoidRootPart.Position.Z
                    )

                    _G.Invisibility.humanoidRootPart.CFrame = CFrame.new(instance49)

                    _G.Invisibility.setHumanoidRootPartTransparency(
                        _G.Invisibility.humanoidRootPartTransparency or 0
                    )
                end
            end
        end

        runService.Heartbeat:Connect(
            function()
                if _G.Invisibility.noclipEnabled and _G.Invisibility.originalPosition then
                    local index93 = _G.Invisibility.originalPosition.Y + _G.Invisibility.cameraOffset - _G.Invisibility.undergroundDepthOffset

                    local mouse = _G.Invisibility.humanoidRootPart.Position

                    if math.abs(mouse.Y - index93) > 0.1 then
                        _G.Invisibility.humanoidRootPart.CFrame = CFrame.new(
                            mouse.X, index93, mouse.Z
                        )
                    end
                end
            end
        )

        runService.RenderStepped:Connect(
            function()
                if _G.Invisibility.noclipEnabled and _G.Invisibility.originalPosition then
                    local endPosition = _G.Invisibility.humanoidRootPart.Position

                    local position7 = Vector3.new(
                        endPosition.X,
                        _G.Invisibility.originalPosition.Y + _G.Invisibility.cameraOffset,
                        endPosition.Z
                    )

                    _G.Invisibility.camera.CFrame = CFrame.new(
                        position7, position7 + _G.Invisibility.camera.CFrame.LookVector
                    )
                end
            end
        )

        newPlayer.CharacterAdded:Connect(
            function(callback)
                task.wait(0.5)

                _G.Invisibility.character = callback
                _G.Invisibility.humanoidRootPart = callback:WaitForChild("HumanoidRootPart")
                _G.Invisibility.head = callback:WaitForChild("Head")

                if _G.Invisibility.noclipEnabled then
                    _G.Invisibility.originalPosition = _G.Invisibility.humanoidRootPart.Position
                    _G.Invisibility.originalCameraCFrame = _G.Invisibility.camera.CFrame
                    _G.Invisibility.humanoidRootPartTransparency = _G.Invisibility.humanoidRootPart.Transparency
                    _G.Invisibility.setNoclip(true)
                    _G.Invisibility.setHumanoidRootPartTransparency(1)

                    local instance50 = Vector3.new(
                        _G.Invisibility.humanoidRootPart.Position.X,
                        _G.Invisibility.originalPosition.Y + _G.Invisibility.cameraOffset - _G.Invisibility.undergroundDepthOffset,
                        _G.Invisibility.humanoidRootPart.Position.Z
                    )

                    _G.Invisibility.humanoidRootPart.CFrame = CFrame.new(instance50)
                end
            end
        )

        newPlayer.CharacterRemoving:Connect(
            function()
                if _G.Invisibility.noclipEnabled then
                    _G.Invisibility.setNoclip(false)
                end
            end
        )

        _G.Invisibility.initialized = true

        instance18:AddToggle(
            "St",
            {
                Text = "Invisibility", Tooltip = "Invisibility (beta)",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = true,
                Callback = function(player38)
                    if _G.Invisibility.initialized then
                        _G.Invisibility.toggleNoclip(player38)
                    end
                end,
            }
        )

        local instance22 = ikConstraint.Combat:AddGroupbox(
            {
                Side = "Left", Name = "Player", Description = "AIM ASSIST", IconName = "crosshair",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        instance22:AddToggle(
            "Indewx",
            {
                Text = "SilentAim", Tooltip = "SilentAim",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(value4)
                    purchaseInfo.PvP.SilentAimEnabled = value4

                    if value4 and not currentEvidence.CameraInitialized then
                        currentEvidence.CameraClone = Camera:Clone()
                        currentEvidence.CameraClone.Parent = workspace
                        currentEvidence.CameraClone.Name = "SilentCamera"
                        currentEvidence.CameraClone.CFrame = Camera.CFrame

                        workspace.CurrentCamera = currentEvidence.CameraClone
                        currentEvidence.CameraInitialized = true
                    end
                end,
            }
        )

        instance22:AddSlider(
            "Inasddex",
            {
                Text = "Silent", Default = 1, Min = 1, Max = 200, Rounding = 1, Suffix = "%",
                Compact = false, HideMax = false,
                FormatDisplayValue = function(player39, value5)
                    if value5 == player39.Max then
                        return "Max"
                    end
                end,
                Callback = function(player40)
                    purchaseInfo.PvP.SilentAimStrength = player40
                end,
            }
        )

        instance22:AddLabel("Keybind"):AddKeyPicker(
            "Iasdndex",
            {
                Default = "O", SyncToggleState = false, Mode = "Hold", Text = "Silent Aim Key",
                NoUI = false, WaitForCallback = false,
                Callback = function(player41)
                    purchaseInfo.PvP.SilentAimKeybindHeld = player41
                end, ChangedCallback = function(player42, player43) end,
            }
        )

        instance22:AddToggle(
            "Indfweex",
            {
                Text = "Triggerbot", Tooltip = "Triggerbot",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player44)
                    purchaseInfo.PvP.TriggerbotEnabled = player44
                end,
            }
        )

        local instance23 = ikConstraint.Combat:AddGroupbox(
            {
                Side = "Left", Name = "Player", Description = "AIM LEGIT", IconName = "crosshair",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        instance23:AddToggle(
            "Indefasdfx",
            {
                Text = "Legit Aim", Tooltip = "Legit Aim",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(countOrError)
                    purchaseInfo.PvP.LegitAimEnabled = countOrError

                    if not countOrError then
                        purchaseInfo.PvP.LegitAimHolding = false
                    else
                        pcall(
                            function()
                                if userInputService:IsKeyDown(Enum.KeyCode.Q) then
                                    purchaseInfo.PvP.LegitAimHolding = true
                                end
                            end
                        )
                    end

                    warn("[LegitAim] Enabled:", countOrError)
                end,
            }
        )

        instance23:AddLabel("Silent Aim Key"):AddKeyPicker(
            "Indegjjgjgx",
            {
                Default = "L", SyncToggleState = false, Mode = "Hold", Text = "Silent Aim Key",
                NoUI = false, WaitForCallback = false,
                Callback = function(player45)
                    purchaseInfo.PvP.LegitAimHolding = player45
                end, ChangedCallback = function(player46, player47) end,
            }
        )

        instance23:AddDropdown(
            "Indgfkgjlfex",
            {
                Values = {"Closest to Crosshair", "Closest Distance"}, Default = 1, Multi = false,
                Text = "Target Mode", Tooltip = "Target Mode", Searchable = false,
                FormatDisplayValue = function(value6)
                    return value6
                end, MaxVisibleDropdownItems = 12,
                Callback = function(value7)
                    if value7 == "Closest to Crosshair" then
                        purchaseInfo.PvP.LegitAimMode = "Crosshair"
                    else
                        purchaseInfo.PvP.LegitAimMode = "Distance"
                    end
                end,
            }
        )

        instance23:AddDropdown(
            "Indfgjfklex",
            {
                Values = {"Head", "Body", "Left Arm", "Right Arm", "Left Leg", "Right Leg"},
                Default = 1, Multi = false, Text = "AimHitbox", Tooltip = "AimHitbox",
                Searchable = false,
                FormatDisplayValue = function(value8)
                    return value8
                end, MaxVisibleDropdownItems = 12,
                Callback = function(player48)
                    purchaseInfo.PvP.LegitAimHitbox = player48
                end,
            }
        )

        instance23:AddToggle(
            "Infdgddex",
            {
                Text = "Only Visible", Tooltip = "Only Visible",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player49)
                    purchaseInfo.PvP.LegitAimVisible = player49
                end,
            }
        )

        instance23:AddToggle(
            "Indfgdfdex",
            {
                Text = "AimSmooth", Tooltip = "AimSmooth",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player50)
                    purchaseInfo.PvP.LegitAimSmooth = player50
                end,
            }
        )

        instance23:AddToggle(
            "Idfdndex",
            {
                Text = "Unsafe mode", Tooltip = "Unsafe",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = true,
                Callback = function(player51)
                    purchaseInfo.PvP.LegitAimUnsafe = player51
                end,
            }
        )

        instance23:AddToggle(
            "Inwwwedex",
            {
                Text = "IgnoreFriends", Tooltip = "IgnoreFriends",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player53)
                    purchaseInfo.PvP.LegitAimIgnoreFriends = player53
                end,
            }
        )

        instance23:AddToggle(
            "Inrefdex",
            {
                Text = "WorkOnNPC", Tooltip = "WorkOnNPC",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player54)
                    purchaseInfo.PvP.LegitAimWorkOnNPC = player54

                    if not player54 then
                        LegitAimFeature.npcCache = nil
                    end
                end,
            }
        )

        local instance24 = ikConstraint.Target:AddGroupbox(
            {
                Side = "Left", Name = "Player", Description = "Def", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        purchaseInfo.BlobmanBeta.cloneFlingActive = false
        purchaseInfo.BlobmanBeta.cloneFlingTarget = nil
        purchaseInfo.BlobmanBeta.cloneFlingConn = nil
        purchaseInfo.BlobmanBeta.cloneFlingCleanup = nil

        instance24:AddDropdown(
            "Inwerdex",
            {
                Values = {"A", "B", "C"}, Default = 1, Multi = false,
                Text = "Select Target CloneFling", Tooltip = "Select Target", Searchable = false,
                FormatDisplayValue = function(value9)
                    return value9
                end, MaxVisibleDropdownItems = 12,
                Callback = function(char)
                    local xString = char:match("@(.+)$")

                    if xString then
                        purchaseInfo.BlobmanBeta.cloneFlingTarget = xString
                    end
                end,
            }
        )

        ikConstraint.Key:AddGroupbox(
            {
                Side = "Left", Name = "Player", Description = "Def", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        ):AddLabel("Throw Bomb"):AddKeyPicker(
            "Index",
            {
                Default = "Z", SyncToggleState = false, Mode = "Toggle", Text = "Throw Bomb",
                NoUI = false, WaitForCallback = false,
                Callback = function(player55)
                    task.spawn(
                        function()
                            local UserInputService = newPlayer.Character
                            local projectile = UserInputService and UserInputService:FindFirstChild(
                                "Head"
                            )
                            local result80, tween, newRoot, hash

                            if not projectile then
                                return
                            elseif not (UserInputService and UserInputService:FindFirstChild(
                                "HumanoidRootPart"
                            )) then
                                return
                            else
                                local PLAYER = PhysicsService:WaitForChild("GrabEvents")
                                result80 = PLAYER:WaitForChild("SetNetworkOwner")
                                tween = PLAYER:WaitForChild("CreateGrabLine")
                                newRoot = PLAYER:WaitForChild("DestroyGrabLine")
                                local playerId = projectile.CFrame

                                hash = nil

                                hash = viewportFrame:WaitForChild(
                                    newPlayer.Name .. "SpawnedInToys", 5
                                ).ChildAdded:Connect(
                                    function(RemoteEvent)
                                        local empty = RemoteEvent.Name == "BombMissile"
                                        local part

                                        if empty and RemoteEvent:WaitForChild("ThisToysNumber", 3) then
                                            local currentScore = RemoteEvent.ThisToysNumber.Value

                                            local character7 = viewportFrame:FindFirstChild(
                                                newPlayer.Name .. "SpawnedInToys"
                                            )

                                            local result92 = character7 and character7:FindFirstChild(
                                                "ToyNumber"
                                            )

                                            if result92 and currentScore == result92.Value - 1 then
                                                hash:Disconnect()

                                                part = RemoteEvent:FindFirstChild("Body") or RemoteEvent:FindFirstChild(
                                                    "PartHitDetector"
                                                )

                                                if part then
                                                    pcall(
                                                        function()
                                                            result80:FireServer(part, part.CFrame)
                                                        end
                                                    )

                                                    pcall(
                                                        function()
                                                            tween:FireServer(
                                                                part, Vector3.zero, part.Position,
                                                                false
                                                            )
                                                        end
                                                    )

                                                    task.wait(0.05)
                                                    pcall(
                                                        function()
                                                            newRoot:FireServer(part)
                                                        end
                                                    )

                                                    local bodyVelocity = Instance.new(
                                                        "BodyVelocity"
                                                    )
                                                    bodyVelocity.MaxForce = Vector3.new(
                                                        math.huge, math.huge, math.huge
                                                    )

                                                    bodyVelocity.Velocity = viewportFrame.CurrentCamera.CFrame.LookVector * 500

                                                    bodyVelocity.P = 2000
                                                    bodyVelocity.Parent = part

                                                    DataStoreService:AddItem(bodyVelocity, 5)
                                                end
                                            end
                                        end
                                    end
                                )

                                BuoyancyRemoteFunction:InvokeServer(
                                    "BombMissile", playerId, Vector3.new(0, 0, 0)
                                )
                                task.delay(
                                    5,
                                    function()
                                        pcall(
                                            function()
                                                hash:Disconnect()
                                            end
                                        )
                                    end
                                )
                                return
                            end
                        end
                    )
                end, ChangedCallback = function(player56, player57) end,
            }
        )

        instance18:AddLabel("Zoom"):AddKeyPicker(
            "Insaddex",
            {
                Default = "X", SyncToggleState = false, Mode = "Hold", Text = "Zoom", NoUI = false,
                WaitForCallback = false,
                Callback = function(player58)
                    if player58 then
                        zoomOrigFOV = purchaseInfo.Misc.FOVValue or 70
                        zoomOrigSens = userInputService.MouseDeltaSensitivity

                        Players2:Create(
                            viewportFrame.CurrentCamera,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {FieldOfView = 10}
                        ):Play()

                        userInputService.MouseDeltaSensitivity = zoomOrigSens * 0.33333333333333
                    else
                        Players2:Create(
                            viewportFrame.CurrentCamera,
                            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {FieldOfView = zoomOrigFOV}
                        ):Play()

                        userInputService.MouseDeltaSensitivity = zoomOrigSens
                    end
                end, ChangedCallback = function(player59, player60) end,
            }
        )

        local instance25 = ikConstraint.Fun:AddGroupbox(
            {
                Side = "Left", Name = "Player", Description = "Fun", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        instance25:AddToggle(
            "Index",
            {
                Text = "Jerk", Tooltip = "Jerk Off",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player61)
                    purchaseInfo.Misc.masturb = player61

                    if player61 then
                        local innerPlayer = (newPlayer.Character or newPlayer.CharacterAdded:Wait()):FindFirstChildOfClass(
                            "Humanoid"
                        )

                        if not innerPlayer then
                            return
                        end

                        local character = innerPlayer:FindFirstChildOfClass("Animator")

                        if not character then
                            character = Instance.new("Animator")
                            character.Parent = innerPlayer
                        end

                        local Players = Instance.new("Animation")
                        Players.AnimationId = "rbxassetid://168268306"

                        currentEvidence.masturbAnimTrack = character:LoadAnimation(Players)
                        currentEvidence.masturbAnimTrack.Priority = Enum.AnimationPriority.Action
                        currentEvidence.masturbAnimTrack:Play()

                        currentEvidence.masturbLoop = task.spawn(
                            function()
                                while purchaseInfo.Misc.masturb do
                                    task.wait(0.1)

                                    if currentEvidence.masturbAnimTrack and currentEvidence.masturbAnimTrack.IsPlaying then
                                        currentEvidence.masturbAnimTrack.TimePosition = 0.3
                                    end
                                end
                            end
                        )

                        return
                    end

                    if currentEvidence.masturbAnimTrack then
                        currentEvidence.masturbAnimTrack:Stop()
                        currentEvidence.masturbAnimTrack = nil
                    end

                    currentEvidence.masturbLoop = nil
                end,
            }
        )

        instance25:AddToggle(
            "Index",
            {
                Text = "fakeDeath", Tooltip = "fakeDeath",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player62)
                    purchaseInfo.Misc.fakeDeath = player62
                    local start = newPlayer.Character
                    local result45

                    if not start then
                        return
                    else
                        local bloomEffect = start:FindFirstChildOfClass("Humanoid")

                        if not bloomEffect then
                            return
                        end

                        result45 = start:FindFirstChild("HumanoidRootPart")

                        if player62 then
                            currentEvidence.fakeDeathAnimConn = nil
                            currentEvidence.fakeDeathRagdollLoop = nil

                            local currentJumpPower = bloomEffect.JumpPower
                            local result51 = bloomEffect.JumpHeight

                            currentEvidence.fakeDeathSavedSpeed = bloomEffect.WalkSpeed
                            currentEvidence.fakeDeathSavedJumpPower = currentJumpPower
                            currentEvidence.fakeDeathSavedJumpHeight = result51

                            bloomEffect.WalkSpeed = 0
                            bloomEffect.JumpPower = 0
                            bloomEffect.JumpHeight = 0

                            local status = bloomEffect:FindFirstChildOfClass("Animator")

                            if status then
                                for index8, soundInstance in ipairs(
                                    status:GetPlayingAnimationTracks()
                                ) do
                                    soundInstance:Stop(0)
                                end

                                currentEvidence.fakeDeathAnimConn = status.AnimationPlayed:Connect(
                                    function(track)
                                        if purchaseInfo.Misc.fakeDeath then
                                            task.defer(
                                                function()
                                                    track:Stop(0)
                                                end
                                            )
                                        end
                                    end
                                )
                            end

                            bloomEffect.BreakJointsOnDeath = false
                            bloomEffect.PlatformStand = true

                            currentEvidence.fakeDeathRagdollLoop = task.spawn(
                                function()
                                    while purchaseInfo.Misc.fakeDeath do
                                        task.wait(0.3)
                                        local dummy = newPlayer.Character
                                        local examplePart = dummy and dummy:FindFirstChildOfClass(
                                            "Humanoid"
                                        )

                                        local result46 = dummy and dummy:FindFirstChild(
                                            "HumanoidRootPart"
                                        )

                                        if examplePart and result46 and examplePart.Health > 0 then
                                            pcall(
                                                function()
                                                    ArcRemoteEvent:FireServer(result46, 2)
                                                end
                                            )
                                            examplePart.PlatformStand = true
                                        end
                                    end
                                end
                            )

                            if currentEvidence.fakeDeathCharAdded then
                                currentEvidence.fakeDeathCharAdded:Disconnect()
                            end

                            currentEvidence.fakeDeathCharAdded = newPlayer.CharacterAdded:Connect(
                                function(rawCommand)
                                    purchaseInfo.Misc.fakeDeath = false

                                    if currentEvidence.fakeDeathAnimConn then
                                        currentEvidence.fakeDeathAnimConn:Disconnect()
                                        currentEvidence.fakeDeathAnimConn = nil
                                    end

                                    currentEvidence.fakeDeathRagdollLoop = nil

                                    if currentEvidence.fakeDeathCharAdded then
                                        currentEvidence.fakeDeathCharAdded:Disconnect()
                                        currentEvidence.fakeDeathCharAdded = nil
                                    end
                                end
                            )
                        else
                            purchaseInfo.Misc.fakeDeath = false
                            task.wait(0.5)

                            if currentEvidence.fakeDeathAnimConn then
                                currentEvidence.fakeDeathAnimConn:Disconnect()
                                currentEvidence.fakeDeathAnimConn = nil
                            end

                            currentEvidence.fakeDeathRagdollLoop = nil

                            if currentEvidence.fakeDeathCharAdded then
                                currentEvidence.fakeDeathCharAdded:Disconnect()
                                currentEvidence.fakeDeathCharAdded = nil
                            end

                            bloomEffect.WalkSpeed = currentEvidence.fakeDeathSavedSpeed or 16
                            bloomEffect.JumpPower = currentEvidence.fakeDeathSavedJumpPower or 50
                            bloomEffect.JumpHeight = currentEvidence.fakeDeathSavedJumpHeight or 7.2

                            currentEvidence.fakeDeathSavedSpeed = nil
                            currentEvidence.fakeDeathSavedJumpPower = nil
                            currentEvidence.fakeDeathSavedJumpHeight = nil

                            pcall(
                                function()
                                    ArcRemoteEvent:FireServer(result45, 0)
                                end
                            )

                            bloomEffect.PlatformStand = false
                            bloomEffect:ChangeState(Enum.HumanoidStateType.GettingUp)

                            if result45 then
                                result45.AssemblyLinearVelocity = Vector3.zero
                                result45.AssemblyAngularVelocity = Vector3.zero
                            end
                        end

                        return
                    end
                end,
            }
        )

        instance25:AddToggle(
            "Index",
            {
                Text = "Penis", Tooltip = "Penis",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player63)
                    purchaseInfo.Misc.coconutDick = player63

                    if player63 then
                        currentEvidence.coconutDickTask = task.spawn(
                            function()
                                local CHARACTER = PhysicsService:WaitForChild("GrabEvents")
                                local instance34 = CHARACTER:WaitForChild("SetNetworkOwner")
                                local playerPosition = CHARACTER:WaitForChild("CreateGrabLine")
                                local VoteRemoteEvent = CHARACTER:WaitForChild("DestroyGrabLine")
                                local InputValidator = PhysicsService:WaitForChild("MenuToys"):WaitForChild(
                                    "SpawnToyRemoteFunction"
                                )

                                while purchaseInfo.Misc.coconutDick do
                                    local parts = newPlayer.Character

                                    local player19 = parts and parts:FindFirstChild(
                                        "HumanoidRootPart"
                                    )

                                    if not player19 then
                                        task.wait(0.1)
                                    else
                                        local iterator = player19.CFrame

                                        local instance3 = viewportFrame:FindFirstChild(
                                            newPlayer.Name .. "SpawnedInToys"
                                        )

                                        local endTime = 0

                                        if instance3 then
                                            for index9, player205 in ipairs(instance3:GetChildren()) do
                                                if player205.Name == "FoodCoconut" then
                                                    endTime = endTime + 1
                                                end

                                                if endTime >= 5 then
                                                    break
                                                end
                                            end
                                        end

                                        for playerEntity = 1, 5 - endTime do
                                            pcall(
                                                function()
                                                    InputValidator:InvokeServer(
                                                        "FoodCoconut",
                                                        CFrame.new(
                                                            461.67614746094, 32.383609771729,
                                                            -404.24761962891
                                                        ), Vector3.zero
                                                    )
                                                end
                                            )

                                            task.wait(0.05)
                                        end

                                        task.wait(0.15)

                                        local character8 = viewportFrame:FindFirstChild(
                                            newPlayer.Name .. "SpawnedInToys"
                                        )

                                        if not character8 then
                                            task.wait(0.1)
                                        else
                                            local neighbors = {}

                                            for index10, entityModel in ipairs(
                                                character8:GetChildren()
                                            ) do
                                                if entityModel.Name == "FoodCoconut" then
                                                    local beltPart = entityModel:FindFirstChild(
                                                        "SoundPart"
                                                    )

                                                    if beltPart then
                                                        table.insert(
                                                            neighbors,
                                                            {model = entityModel, part = beltPart}
                                                        )
                                                    end
                                                end

                                                if #neighbors >= 5 then
                                                    break
                                                end
                                            end

                                            if #neighbors < 5 then
                                                task.wait(0.5)
                                            else
                                                for index11, value31 in ipairs(neighbors) do
                                                    local hitbox = value31

                                                    if not purchaseInfo.Misc.coconutDick then
                                                        break
                                                    end

                                                    if hitbox.model.Parent and hitbox.part.Parent then
                                                        player19.CFrame = hitbox.part.CFrame * CFrame.new(
                                                            0, 3, 0
                                                        )
                                                        task.wait(0.1)

                                                        for token = 1, 5 do
                                                            if not purchaseInfo.Misc.coconutDick then
                                                                break
                                                            end

                                                            if not (hitbox.model.Parent and hitbox.part.Parent) then
                                                                break
                                                            else
                                                                local decodeSuccess = pcall(
                                                                    function()
                                                                        instance34:FireServer(
                                                                            hitbox.part,
                                                                            player19.CFrame
                                                                        )
                                                                    end
                                                                )

                                                                task.wait(0.05)

                                                                pcall(
                                                                    function()
                                                                        playerPosition:FireServer(
                                                                            hitbox.part,
                                                                            Vector3.zero,
                                                                            hitbox.part.Position,
                                                                            false
                                                                        )
                                                                    end
                                                                )

                                                                task.wait(0.05)
                                                                pcall(
                                                                    function()
                                                                        VoteRemoteEvent:FireServer(
                                                                            hitbox.part
                                                                        )
                                                                    end
                                                                )
                                                                task.wait(0.05)

                                                                if decodeSuccess or pcall(
                                                                    function()
                                                                        instance34:FireServer(
                                                                            hitbox.part,
                                                                            player19.CFrame
                                                                        )
                                                                    end
                                                                ) then
                                                                    break
                                                                end

                                                                task.wait(0.1)
                                                            end
                                                        end

                                                        task.wait(0.1)
                                                    end
                                                end

                                                if not purchaseInfo.Misc.coconutDick then
                                                    break
                                                else
                                                    player19.CFrame = iterator
                                                    task.wait(0.1)

                                                    for index12, entityData in ipairs(neighbors) do
                                                        if entityData.model.Parent and entityData.part.Parent then
                                                            if entityData.part.Anchored then
                                                                entityData.part.Anchored = false
                                                            end

                                                            entityData.part.CanCollide = false

                                                            if not entityData.part:FindFirstChildOfClass(
                                                                "BodyPosition"
                                                            ) then
                                                                local label = Instance.new(
                                                                    "BodyPosition"
                                                                )

                                                                label.MaxForce = Vector3.new(
                                                                    5000000000000000000,
                                                                    5000000000000000000,
                                                                    5000000000000000000
                                                                )

                                                                label.D = 500
                                                                label.P = 10000000
                                                                label.Parent = entityData.part
                                                            end

                                                            if not entityData.part:FindFirstChildOfClass(
                                                                "BodyGyro"
                                                            ) then
                                                                local manager = Instance.new(
                                                                    "BodyGyro"
                                                                )

                                                                manager.MaxTorque = Vector3.new(
                                                                    5000000000000000000,
                                                                    5000000000000000000,
                                                                    5000000000000000000
                                                                )

                                                                manager.D = 1000
                                                                manager.P = 50000
                                                                manager.Parent = entityData.part
                                                            end
                                                        end
                                                    end

                                                    task.wait(0.2)
                                                    local inserted = true

                                                    for index13, vehicleInfo in ipairs(neighbors) do
                                                        if not vehicleInfo.model.Parent or not vehicleInfo.part.Parent then
                                                            inserted = false
                                                            break
                                                        end
                                                    end

                                                    if not inserted or #neighbors < 5 then
                                                        if not purchaseInfo.Misc.coconutDick then
                                                            break
                                                        end
                                                    else
                                                        currentEvidence.coconutDickCheckCount = 0

                                                        local function traverse(rootInstance)
                                                            for index14, player206 in ipairs(
                                                                PlayersService:GetPlayers()
                                                            ) do
                                                                if player206 ~= newPlayer then
                                                                    local player7 = viewportFrame:FindFirstChild(
                                                                        player206.Name
                                                                    )

                                                                    if player7 then
                                                                        local instance7 = player7:FindFirstChild(
                                                                            "GrabParts"
                                                                        )

                                                                        if instance7 then
                                                                            for index15, part3 in ipairs(
                                                                                instance7:GetChildren(
                                                                                )
                                                                            ) do
                                                                                if part3:IsA(
                                                                                    "BasePart"
                                                                                ) then
                                                                                    for
                                                                                        index16,
                                                                                        part4 in ipairs(
                                                                                        rootInstance:GetDescendants(
                                                                                        )
                                                                                    ) do
                                                                                        if part4:IsA(
                                                                                            "BasePart"
                                                                                        ) and (part3.Position - part4.Position).Magnitude < 10 then
                                                                                            return true
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end

                                                            return false
                                                        end

                                                        while purchaseInfo.Misc.coconutDick do
                                                            local player20 = newPlayer.Character and newPlayer.Character:FindFirstChild(
                                                                "HumanoidRootPart"
                                                            )

                                                            if not player20 then
                                                                break
                                                            else
                                                                local input = player20.CFrame
                                                                local forwardVector = input.LookVector
                                                                local rightVector = input.RightVector
                                                                local cameraPosition = input.Position
                                                                local index94 = tick()

                                                                local result141 = {
                                                                    cameraPosition + rightVector * -0.7 + forwardVector * 0.5 + Vector3.new(
                                                                        0, -1, 0
                                                                    ),
                                                                    cameraPosition + rightVector * 0.7 + forwardVector * 0.5 + Vector3.new(
                                                                        0, -1, 0
                                                                    ),
                                                                    cameraPosition + forwardVector * 2 + Vector3.new(
                                                                        0, -1, 0
                                                                    ),
                                                                    cameraPosition + forwardVector * 3.5 + Vector3.new(
                                                                        0, -1, 0
                                                                    ),
                                                                    cameraPosition + forwardVector * 5 + Vector3.new(
                                                                        0, -1, 0
                                                                    ),
                                                                }

                                                                for alpha, voxel in ipairs(
                                                                    neighbors
                                                                ) do
                                                                    if voxel.model.Parent and voxel.part.Parent then
                                                                        local result17 = voxel.model:FindFirstChild(
                                                                            "HoldPart"
                                                                        )

                                                                        local currency = result17

                                                                        currency = result17 and result17:FindFirstChild(
                                                                            "HoldingPlayer"
                                                                        )

                                                                        if not (currency and currency.Value == newPlayer) then
                                                                            if voxel.part.Anchored then
                                                                                voxel.part.Anchored = false
                                                                            end

                                                                            voxel.part.CanCollide = false
                                                                            local humanoidRootPart = voxel.part:FindFirstChildOfClass(
                                                                                "BodyPosition"
                                                                            )

                                                                            if not humanoidRootPart then
                                                                                humanoidRootPart = Instance.new(
                                                                                    "BodyPosition"
                                                                                )

                                                                                humanoidRootPart.MaxForce = Vector3.new(
                                                                                    5000000000000000000,
                                                                                    5000000000000000000,
                                                                                    5000000000000000000
                                                                                )

                                                                                humanoidRootPart.D = 500
                                                                                humanoidRootPart.P = 10000000
                                                                                humanoidRootPart.Parent = voxel.part
                                                                            end

                                                                            local position4 = math.sin(
                                                                                index94 * 3 + alpha * 1.7
                                                                            ) * 0.01

                                                                            humanoidRootPart.Position = result141[alpha] + Vector3.new(
                                                                                position4, 0,
                                                                                position4
                                                                            )

                                                                            local frame = voxel.part:FindFirstChildOfClass(
                                                                                "BodyGyro"
                                                                            )

                                                                            if not frame then
                                                                                frame = Instance.new(
                                                                                    "BodyGyro"
                                                                                )

                                                                                frame.MaxTorque = Vector3.new(
                                                                                    5000000000000000000,
                                                                                    5000000000000000000,
                                                                                    5000000000000000000
                                                                                )

                                                                                frame.D = 1000
                                                                                frame.P = 50000
                                                                                frame.Parent = voxel.part
                                                                            end

                                                                            frame.CFrame = player20.CFrame
                                                                        end
                                                                    end
                                                                end

                                                                runService.Heartbeat:Wait()
                                                                currentEvidence.coconutDickCheckCount = (currentEvidence.coconutDickCheckCount or 0) + 1

                                                                if currentEvidence.coconutDickCheckCount >= 3 then
                                                                    currentEvidence.coconutDickCheckCount = 0

                                                                    for index18, value32 in ipairs(
                                                                        neighbors
                                                                    ) do
                                                                        local partData = value32

                                                                        if partData.model.Parent and partData.part.Parent then
                                                                            local less = false
                                                                            local result18 = partData.model:FindFirstChild(
                                                                                "HoldPart"
                                                                            )

                                                                            local valueObject = result18

                                                                            valueObject = result18 and result18:FindFirstChild(
                                                                                "HoldingPlayer"
                                                                            )

                                                                            if valueObject and valueObject.Value and valueObject.Value ~= newPlayer then
                                                                                less = true
                                                                            end

                                                                            if not less then
                                                                                for
                                                                                    index19,
                                                                                    player207 in ipairs(
                                                                                    PlayersService:GetPlayers(
                                                                                    )
                                                                                ) do
                                                                                    if player207 ~= newPlayer then
                                                                                        local points = player207.Character

                                                                                        local result48 = points

                                                                                        result48 = points and points:FindFirstChild(
                                                                                            "HumanoidRootPart"
                                                                                        )

                                                                                        if result48 and (result48.Position - partData.part.Position).Magnitude < 5 then
                                                                                            less = true
                                                                                            break
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end

                                                                            local maximum = (partData.part.Position - player20.Position).Magnitude

                                                                            local index70 = result141[index18] and (partData.part.Position - result141[index18]).Magnitude or 0

                                                                            local isUnderwater = forwardVector:Dot(
                                                                                (partData.part.Position - player20.Position).Unit
                                                                            ) < 0

                                                                            if maximum > 10 and not less then
                                                                                local length = player20.CFrame

                                                                                player20.CFrame = partData.part.CFrame * CFrame.new(
                                                                                    0, 3, 0
                                                                                )

                                                                                task.wait(0.1)

                                                                                pcall(
                                                                                    function()
                                                                                        instance34:FireServer(
                                                                                            partData.part,
                                                                                            player20.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        playerPosition:FireServer(
                                                                                            partData.part,
                                                                                            Vector3.zero,
                                                                                            partData.part.Position,
                                                                                            false
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        instance34:FireServer(
                                                                                            partData.part,
                                                                                            player20.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        VoteRemoteEvent:FireServer(
                                                                                            partData.part
                                                                                        )
                                                                                    end
                                                                                )

                                                                                task.wait(0.1)
                                                                                player20.CFrame = length
                                                                            elseif not less and index70 > 2 and not isUnderwater then
                                                                                pcall(
                                                                                    function()
                                                                                        instance34:FireServer(
                                                                                            partData.part,
                                                                                            player20.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        playerPosition:FireServer(
                                                                                            partData.part,
                                                                                            Vector3.zero,
                                                                                            partData.part.Position,
                                                                                            false
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        instance34:FireServer(
                                                                                            partData.part,
                                                                                            player20.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        VoteRemoteEvent:FireServer(
                                                                                            partData.part
                                                                                        )
                                                                                    end
                                                                                )
                                                                            elseif not less and index70 > 2 and isUnderwater then
                                                                                local TweenService = player20.CFrame

                                                                                player20.CFrame = partData.part.CFrame * CFrame.new(
                                                                                    0, 3, 0
                                                                                )

                                                                                task.wait(0.1)

                                                                                pcall(
                                                                                    function()
                                                                                        instance34:FireServer(
                                                                                            partData.part,
                                                                                            player20.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        playerPosition:FireServer(
                                                                                            partData.part,
                                                                                            Vector3.zero,
                                                                                            partData.part.Position,
                                                                                            false
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        instance34:FireServer(
                                                                                            partData.part,
                                                                                            player20.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        VoteRemoteEvent:FireServer(
                                                                                            partData.part
                                                                                        )
                                                                                    end
                                                                                )

                                                                                task.wait(0.1)
                                                                                player20.CFrame = TweenService
                                                                            elseif traverse(
                                                                                partData.model
                                                                            ) and not isUnderwater then
                                                                                pcall(
                                                                                    function()
                                                                                        instance34:FireServer(
                                                                                            partData.part,
                                                                                            player20.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        playerPosition:FireServer(
                                                                                            partData.part,
                                                                                            Vector3.zero,
                                                                                            partData.part.Position,
                                                                                            false
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        instance34:FireServer(
                                                                                            partData.part,
                                                                                            player20.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        VoteRemoteEvent:FireServer(
                                                                                            partData.part
                                                                                        )
                                                                                    end
                                                                                )
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        )
                    else
                        if currentEvidence.coconutDickTask then
                            task.cancel(currentEvidence.coconutDickTask)
                            currentEvidence.coconutDickTask = nil
                        end

                        local instance4 = viewportFrame:FindFirstChild(
                            newPlayer.Name .. "SpawnedInToys"
                        )

                        if instance4 then
                            for index20, player208 in ipairs(instance4:GetChildren()) do
                                if player208.Name == "FoodCoconut" then
                                    local fragment = player208:FindFirstChild("SoundPart")

                                    if fragment then
                                        local entry = fragment:FindFirstChildOfClass("BodyPosition")

                                        if entry then
                                            entry:Destroy()
                                        end

                                        local humanoid = fragment:FindFirstChildOfClass("BodyGyro")

                                        if humanoid then
                                            humanoid:Destroy()
                                        end

                                        fragment.CanCollide = true
                                        fragment.AssemblyLinearVelocity = Vector3.zero
                                        fragment.AssemblyAngularVelocity = Vector3.zero
                                    end
                                end
                            end
                        end
                    end
                end,
            }
        )

        instance25:AddToggle(
            "Index",
            {
                Text = "Siski", Tooltip = "Sisi",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = false,
                Callback = function(player64)
                    purchaseInfo.Misc.coconutDiggles = player64

                    if player64 then
                        currentEvidence.coconutDigglesTask = task.spawn(
                            function()
                                local Character = PhysicsService:WaitForChild("GrabEvents")
                                local instance35 = Character:WaitForChild("SetNetworkOwner")
                                local record = Character:WaitForChild("CreateGrabLine")
                                local fireEvent = Character:WaitForChild("DestroyGrabLine")
                                local QueueRequestFunction = PhysicsService:WaitForChild("MenuToys"):WaitForChild(
                                    "SpawnToyRemoteFunction"
                                )

                                while purchaseInfo.Misc.coconutDiggles do
                                    local middle = newPlayer.Character

                                    local player21 = middle and middle:FindFirstChild(
                                        "HumanoidRootPart"
                                    )

                                    if not player21 then
                                        task.wait(0.1)
                                    else
                                        local HttpService = player21.CFrame

                                        local instance5 = viewportFrame:FindFirstChild(
                                            newPlayer.Name .. "SpawnedInToys"
                                        )

                                        local targetPosition = 0

                                        if instance5 then
                                            for index21, player209 in ipairs(
                                                instance5:GetChildren()
                                            ) do
                                                if player209.Name == "FoodCoconut" then
                                                    targetPosition = targetPosition + 1
                                                end

                                                if targetPosition >= 2 then
                                                    break
                                                end
                                            end
                                        end

                                        for zone = 1, 2 - targetPosition do
                                            pcall(
                                                function()
                                                    QueueRequestFunction:InvokeServer(
                                                        "FoodCoconut",
                                                        CFrame.new(
                                                            461.67614746094, 32.383609771729,
                                                            -404.24761962891
                                                        ), Vector3.zero
                                                    )
                                                end
                                            )

                                            task.wait(0.05)
                                        end

                                        task.wait(0.15)

                                        local character10 = viewportFrame:FindFirstChild(
                                            newPlayer.Name .. "SpawnedInToys"
                                        )

                                        if not character10 then
                                            task.wait(0.1)
                                        else
                                            local edges = {}

                                            for index22, modelPath in ipairs(
                                                character10:GetChildren()
                                            ) do
                                                if modelPath.Name == "FoodCoconut" then
                                                    local dropperPart = modelPath:FindFirstChild(
                                                        "SoundPart"
                                                    )

                                                    if dropperPart then
                                                        table.insert(
                                                            edges,
                                                            {model = modelPath, part = dropperPart}
                                                        )
                                                    end
                                                end

                                                if #edges >= 2 then
                                                    break
                                                end
                                            end

                                            if #edges < 2 then
                                                task.wait(0.5)
                                            else
                                                for index23, vehicleData in ipairs(edges) do
                                                    vehicleData.model.Name = "CoconutDiggles"
                                                end

                                                currentEvidence.coconutDigglesCoconuts = edges

                                                for index24, value33 in ipairs(edges) do
                                                    local particleData = value33

                                                    if not purchaseInfo.Misc.coconutDiggles then
                                                        break
                                                    end

                                                    if particleData.model.Parent and particleData.part.Parent then
                                                        player21.CFrame = particleData.part.CFrame * CFrame.new(
                                                            0, 3, 0
                                                        )
                                                        task.wait(0.1)

                                                        for id = 1, 5 do
                                                            if not purchaseInfo.Misc.coconutDiggles then
                                                                break
                                                            end

                                                            if not (particleData.model.Parent and particleData.part.Parent) then
                                                                break
                                                            else
                                                                local loadSuccess = pcall(
                                                                    function()
                                                                        instance35:FireServer(
                                                                            particleData.part,
                                                                            player21.CFrame
                                                                        )
                                                                    end
                                                                )

                                                                task.wait(0.05)

                                                                pcall(
                                                                    function()
                                                                        record:FireServer(
                                                                            particleData.part,
                                                                            Vector3.zero,
                                                                            particleData.part.Position,
                                                                            false
                                                                        )
                                                                    end
                                                                )

                                                                task.wait(0.05)
                                                                pcall(
                                                                    function()
                                                                        fireEvent:FireServer(
                                                                            particleData.part
                                                                        )
                                                                    end
                                                                )
                                                                task.wait(0.05)

                                                                if loadSuccess or pcall(
                                                                    function()
                                                                        instance35:FireServer(
                                                                            particleData.part,
                                                                            player21.CFrame
                                                                        )
                                                                    end
                                                                ) then
                                                                    break
                                                                end

                                                                task.wait(0.1)
                                                            end
                                                        end

                                                        task.wait(0.1)
                                                    end
                                                end

                                                if not purchaseInfo.Misc.coconutDiggles then
                                                    break
                                                else
                                                    player21.CFrame = HttpService
                                                    task.wait(0.1)

                                                    for index25, elevator in ipairs(edges) do
                                                        if elevator.model.Parent and elevator.part.Parent then
                                                            if elevator.part.Anchored then
                                                                elevator.part.Anchored = false
                                                            end

                                                            elevator.part.CanCollide = false

                                                            if not elevator.part:FindFirstChildOfClass(
                                                                "BodyPosition"
                                                            ) then
                                                                local attachment = Instance.new(
                                                                    "BodyPosition"
                                                                )

                                                                attachment.MaxForce = Vector3.new(
                                                                    5000000000000000000,
                                                                    5000000000000000000,
                                                                    5000000000000000000
                                                                )

                                                                attachment.D = 500
                                                                attachment.P = 10000000
                                                                attachment.Parent = elevator.part
                                                            end

                                                            if not elevator.part:FindFirstChildOfClass(
                                                                "BodyGyro"
                                                            ) then
                                                                local textLabel = Instance.new(
                                                                    "BodyGyro"
                                                                )

                                                                textLabel.MaxTorque = Vector3.new(
                                                                    5000000000000000000,
                                                                    5000000000000000000,
                                                                    5000000000000000000
                                                                )

                                                                textLabel.D = 1000
                                                                textLabel.P = 50000
                                                                textLabel.Parent = elevator.part
                                                            end
                                                        end
                                                    end

                                                    task.wait(0.2)
                                                    local greater = true

                                                    for index26, boid in ipairs(edges) do
                                                        if not boid.model.Parent or not boid.part.Parent then
                                                            greater = false
                                                            break
                                                        end
                                                    end

                                                    if not greater or #edges < 2 then
                                                        if not purchaseInfo.Misc.coconutDiggles then
                                                            break
                                                        end
                                                    else
                                                        currentEvidence.coconutDigglesCheckCount = 0

                                                        local function clamp(root)
                                                            for index27, player210 in ipairs(
                                                                PlayersService:GetPlayers()
                                                            ) do
                                                                if player210 ~= newPlayer then
                                                                    local player8 = viewportFrame:FindFirstChild(
                                                                        player210.Name
                                                                    )

                                                                    if player8 then
                                                                        local instance8 = player8:FindFirstChild(
                                                                            "GrabParts"
                                                                        )

                                                                        if instance8 then
                                                                            for index29, part5 in ipairs(
                                                                                instance8:GetChildren(
                                                                                )
                                                                            ) do
                                                                                if part5:IsA(
                                                                                    "BasePart"
                                                                                ) then
                                                                                    for
                                                                                        index30,
                                                                                        part6 in ipairs(
                                                                                        root:GetDescendants(
                                                                                        )
                                                                                    ) do
                                                                                        if part6:IsA(
                                                                                            "BasePart"
                                                                                        ) and (part5.Position - part6.Position).Magnitude < 10 then
                                                                                            return true
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end

                                                            return false
                                                        end

                                                        while purchaseInfo.Misc.coconutDiggles do
                                                            local player22 = newPlayer.Character and newPlayer.Character:FindFirstChild(
                                                                "HumanoidRootPart"
                                                            )

                                                            if not player22 then
                                                                break
                                                            else
                                                                local entity = player22.CFrame
                                                                local surfaceNormal = entity.LookVector
                                                                local index73 = entity.RightVector
                                                                local upVector = entity.UpVector
                                                                local partPosition = entity.Position
                                                                local index95 = tick()

                                                                local result142 = {
                                                                    partPosition + index73 * -0.6 + upVector * 0.2 + surfaceNormal * 0.3,
                                                                    partPosition + index73 * 0.6 + upVector * 0.2 + surfaceNormal * 0.3,
                                                                }

                                                                for index31, managedObject in ipairs(
                                                                    edges
                                                                ) do
                                                                    if managedObject.model.Parent and managedObject.part.Parent then
                                                                        local result19 = managedObject.model:FindFirstChild(
                                                                            "HoldPart"
                                                                        )

                                                                        local coins = result19

                                                                        coins = result19 and result19:FindFirstChild(
                                                                            "HoldingPlayer"
                                                                        )

                                                                        if not (coins and coins.Value == newPlayer) then
                                                                            if managedObject.part.Anchored then
                                                                                managedObject.part.Anchored = false
                                                                            end

                                                                            managedObject.part.CanCollide = false
                                                                            local rootPart = managedObject.part:FindFirstChildOfClass(
                                                                                "BodyPosition"
                                                                            )

                                                                            if not rootPart then
                                                                                rootPart = Instance.new(
                                                                                    "BodyPosition"
                                                                                )

                                                                                rootPart.MaxForce = Vector3.new(
                                                                                    5000000000000000000,
                                                                                    5000000000000000000,
                                                                                    5000000000000000000
                                                                                )

                                                                                rootPart.D = 500
                                                                                rootPart.P = 10000000
                                                                                rootPart.Parent = managedObject.part
                                                                            end

                                                                            local position5 = math.sin(
                                                                                index95 * 3 + index31 * 1.7
                                                                            ) * 0.01

                                                                            rootPart.Position = result142[index31] + Vector3.new(
                                                                                position5, 0,
                                                                                position5
                                                                            )

                                                                            local fileHandle = managedObject.part:FindFirstChildOfClass(
                                                                                "BodyGyro"
                                                                            )

                                                                            if not fileHandle then
                                                                                fileHandle = Instance.new(
                                                                                    "BodyGyro"
                                                                                )

                                                                                fileHandle.MaxTorque = Vector3.new(
                                                                                    5000000000000000000,
                                                                                    5000000000000000000,
                                                                                    5000000000000000000
                                                                                )

                                                                                fileHandle.D = 1000
                                                                                fileHandle.P = 50000
                                                                                fileHandle.Parent = managedObject.part
                                                                            end

                                                                            fileHandle.CFrame = player22.CFrame
                                                                        end
                                                                    end
                                                                end

                                                                runService.Heartbeat:Wait()

                                                                currentEvidence.coconutDigglesCheckCount = (currentEvidence.coconutDigglesCheckCount or 0) + 1

                                                                if currentEvidence.coconutDigglesCheckCount >= 3 then
                                                                    currentEvidence.coconutDigglesCheckCount = 0

                                                                    for index32, value34 in ipairs(
                                                                        edges
                                                                    ) do
                                                                        local surface = value34

                                                                        if surface.model.Parent and surface.part.Parent then
                                                                            local result143 = false
                                                                            local result20 = surface.model:FindFirstChild(
                                                                                "HoldPart"
                                                                            )

                                                                            local gold = result20

                                                                            gold = result20 and result20:FindFirstChild(
                                                                                "HoldingPlayer"
                                                                            )

                                                                            if gold and gold.Value and gold.Value ~= newPlayer then
                                                                                result143 = true
                                                                            end

                                                                            if not result143 then
                                                                                for
                                                                                    index33,
                                                                                    player211 in ipairs(
                                                                                    PlayersService:GetPlayers(
                                                                                    )
                                                                                ) do
                                                                                    if player211 ~= newPlayer then
                                                                                        local response = player211.Character

                                                                                        local result49 = response

                                                                                        result49 = response and response:FindFirstChild(
                                                                                            "HumanoidRootPart"
                                                                                        )

                                                                                        if result49 and (result49.Position - surface.part.Position).Magnitude < 5 then
                                                                                            result143 = true
                                                                                            break
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end

                                                                            local currentLength = (surface.part.Position - player22.Position).Magnitude

                                                                            local index71 = result142[index32] and (surface.part.Position - result142[index32]).Magnitude or 0

                                                                            local splitHorizontal = surfaceNormal:Dot(
                                                                                (surface.part.Position - player22.Position).Unit
                                                                            ) < 0

                                                                            if currentLength > 10 and not result143 then
                                                                                local playerPed = player22.CFrame

                                                                                player22.CFrame = surface.part.CFrame * CFrame.new(
                                                                                    0, 3, 0
                                                                                )

                                                                                task.wait(0.1)

                                                                                pcall(
                                                                                    function()
                                                                                        instance35:FireServer(
                                                                                            surface.part,
                                                                                            player22.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        record:FireServer(
                                                                                            surface.part,
                                                                                            Vector3.zero,
                                                                                            surface.part.Position,
                                                                                            false
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        instance35:FireServer(
                                                                                            surface.part,
                                                                                            player22.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        fireEvent:FireServer(
                                                                                            surface.part
                                                                                        )
                                                                                    end
                                                                                )

                                                                                task.wait(0.1)
                                                                                player22.CFrame = playerPed
                                                                            elseif not result143 and index71 > 2 and not splitHorizontal then
                                                                                pcall(
                                                                                    function()
                                                                                        instance35:FireServer(
                                                                                            surface.part,
                                                                                            player22.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        record:FireServer(
                                                                                            surface.part,
                                                                                            Vector3.zero,
                                                                                            surface.part.Position,
                                                                                            false
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        instance35:FireServer(
                                                                                            surface.part,
                                                                                            player22.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        fireEvent:FireServer(
                                                                                            surface.part
                                                                                        )
                                                                                    end
                                                                                )
                                                                            elseif not result143 and index71 > 2 and splitHorizontal then
                                                                                local coroutineHandle = player22.CFrame

                                                                                player22.CFrame = surface.part.CFrame * CFrame.new(
                                                                                    0, 3, 0
                                                                                )

                                                                                task.wait(0.1)

                                                                                pcall(
                                                                                    function()
                                                                                        instance35:FireServer(
                                                                                            surface.part,
                                                                                            player22.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        record:FireServer(
                                                                                            surface.part,
                                                                                            Vector3.zero,
                                                                                            surface.part.Position,
                                                                                            false
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        instance35:FireServer(
                                                                                            surface.part,
                                                                                            player22.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        fireEvent:FireServer(
                                                                                            surface.part
                                                                                        )
                                                                                    end
                                                                                )

                                                                                task.wait(0.1)
                                                                                player22.CFrame = coroutineHandle
                                                                            elseif clamp(
                                                                                surface.model
                                                                            ) and not splitHorizontal then
                                                                                pcall(
                                                                                    function()
                                                                                        instance35:FireServer(
                                                                                            surface.part,
                                                                                            player22.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        record:FireServer(
                                                                                            surface.part,
                                                                                            Vector3.zero,
                                                                                            surface.part.Position,
                                                                                            false
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        instance35:FireServer(
                                                                                            surface.part,
                                                                                            player22.CFrame
                                                                                        )
                                                                                    end
                                                                                )

                                                                                pcall(
                                                                                    function()
                                                                                        fireEvent:FireServer(
                                                                                            surface.part
                                                                                        )
                                                                                    end
                                                                                )
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        )
                    else
                        if currentEvidence.coconutDigglesTask then
                            task.cancel(currentEvidence.coconutDigglesTask)
                            currentEvidence.coconutDigglesTask = nil
                        end

                        if currentEvidence.coconutDigglesCoconuts then
                            for index34, pet in ipairs(currentEvidence.coconutDigglesCoconuts) do
                                if pet.model and pet.model.Parent then
                                    pet.model.Name = "FoodCoconut"

                                    if pet.part and pet.part.Parent then
                                        local placeholder = pet.part:FindFirstChildOfClass(
                                            "BodyPosition"
                                        )

                                        if placeholder then
                                            placeholder:Destroy()
                                        end

                                        local key = pet.part:FindFirstChildOfClass("BodyGyro")

                                        if key then
                                            key:Destroy()
                                        end

                                        pet.part.CanCollide = true
                                        pet.part.AssemblyLinearVelocity = Vector3.zero
                                        pet.part.AssemblyAngularVelocity = Vector3.zero
                                    end
                                end
                            end

                            currentEvidence.coconutDigglesCoconuts = nil
                        end
                    end
                end,
            }
        )

        local instance32 = ikConstraint.Ser:AddGroupbox(
            {
                Side = "Left", Name = "Server", Description = "Def", IconName = "boxes",
                Collapsed = false, DisableCollapsing = false,
            }
        )

        instance32:AddSlider(
            "Index",
            {
                Text = "packetAmount", Default = 100, Min = 10, Max = 5000, Rounding = 1,
                Suffix = "%", Compact = false, HideMax = false,
                FormatDisplayValue = function(player65, value10)
                    if value10 == player65.Max then
                        return "Max"
                    end
                end,
                Callback = function(player66)
                    purchaseInfo.Misc.packetAmount = player66
                end,
            }
        )

        instance32:AddToggle(
            "Index",
            {
                Text = "Start Lag (packet)", Tooltip = "packetLag",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = true,
                Callback = function(player67)
                    purchaseInfo.Misc.packetLag = player67

                    if player67 then
                        currentEvidence.packetLagConn = task.spawn(
                            function()
                                local AppendEntriesEvent = PhysicsService:WaitForChild("GrabEvents"):WaitForChild(
                                    "ExtendGrabLine"
                                )

                                while purchaseInfo.Misc.packetLag do
                                    pcall(
                                        function()
                                            AppendEntriesEvent:FireServer(
                                                string.rep(
                                                    "Balls Balls Balls Balls",
                                                    purchaseInfo.Misc.packetAmount or 100
                                                )
                                            )
                                        end
                                    )

                                    task.wait()
                                end
                            end
                        )
                    else
                        currentEvidence.packetLagConn = nil
                    end
                end,
            }
        )

        dragging = false
        bestAction = nil

        instance32:AddToggle(
            "Index",
            {
                Text = "Start Lag (line)", Tooltip = "lineLag",
                DisabledTooltip = "Подсказка когда отключено",
                Default = false, Disabled = false, Visible = true, Risky = true,
                Callback = function(player68)
                    dragging = player68

                    if player68 then
                        bestAction = task.spawn(
                            function()
                                while dragging do
                                    for number = 1, 35 do
                                        for index35, value35 in ipairs(PlayersService:GetPlayers()) do
                                            local player212 = value35

                                            if player212.Character and player212.Character:FindFirstChild(
                                                "Torso"
                                            ) then
                                                pcall(
                                                    function()
                                                        PhysicsService.GrabEvents.CreateGrabLine:FireServer(
                                                            player212.Character.Torso,
                                                            player212.Character.Torso.CFrame
                                                        )
                                                    end
                                                )
                                            end
                                        end
                                    end

                                    task.wait(0.5)
                                end
                            end
                        )
                    elseif bestAction then
                        task.cancel(bestAction)
                        bestAction = nil
                    end
                end,
            }
        )

        notifyExport:Notify(
            {
                Title = "Faldes_X V3",
                Description = "Скрипт находится в разработке многие функции могут быть поломаны",
                Time = 4,
            }
        )

        return
    end
end
