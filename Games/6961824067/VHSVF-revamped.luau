sendmessage = true

print("start")
setfpscap(999)

local timefunc = os.clock()
local timefunc1 = os.clock()
local lastline = 0
function get_time(cmd, svar)
	local funcs = {
		rww = function() local temp = timefunc; timefunc = os.clock() return os.clock() - temp end,
		rwwv = function(var) return os.clock(), os.clock() - var end,
		rw = function() if timefunc ~= 0 then local temp = timefunc timefunc = 0 return os.clock() - temp else timefunc = os.clock() end end,
		rwv = function(var) if var ~= 0 then return 0, os.clock() - var else return os.clock(), 0 end end,
		r = function() if timefunc1 ~= 0 then return os.clock() - timefunc1 end end,
		rv = function(var) if var ~= 0 then return os.clock() - var end end
	}; return funcs[cmd](svar)
end; function loadprogress(line) end
loadprogress(17)

--♥locals♥
	local S = {
		Players = game:GetService("Players"),
		RS = game:GetService("ReplicatedStorage"),
		RS1 = game:GetService("RobloxReplicatedStorage"),
		RSs = game:GetService("RunService"),
		w = game:GetService("Workspace"),
		r = game:GetService("RunService"),
		d = game:GetService("Debris"),
		HS = game:GetService("HttpService"),
		UIS = game:GetService("UserInputService"),
		StarterGui = game:GetService("StarterGui"),
		TS = game:GetService("TeleportService"),
		TCS = game:GetService("TextChatService")} --REVAMP

	local me = S.Players.LocalPlayer; local pccontrol = me.PlayerGui.ControlsGui.PCFrame
	local O = {
		Events = {
			-- saymsg = S.RS.DefaultChatSystemChatEvents.SayMessageRequest,
			-- getmsg = S.RS.DefaultChatSystemChatEvents.OnMessageDoneFiltering,
			DestroyToyEvent = S.RS.MenuToys.DestroyToy,
			SetLineColorEvent = S.RS.DataEvents.UpdateLineColorsEvent,
			ExtendLineEvent = S.RS.GrabEvents.ExtendGrabLine,
			DestroyGrabLine = S.RS.GrabEvents.DestroyGrabLine,
			CreateGrabEvent = S.RS.GrabEvents.CreateGrabLine,
			StruggleEvent = S.RS.CharacterEvents.Struggle,
			StickyPartEvent = S.RS.PlayerEvents.StickyPartEvent,
			BombEvent = S.RS.BombEvents.BombExplode,
			SetNetworkOwnerEvent = S.RS.GrabEvents.SetNetworkOwner,
			RagdollEvent = S.RS.CharacterEvents.RagdollRemote,
			SpawnToyEvent = S.RS.MenuToys.SpawnToyRemoteFunction,
			UseEvent = S.RS.HoldEvents.Use,
			look = S.RS.CharacterEvents.Look},

		me = S.Players.LocalPlayer,
		mouse = me:GetMouse(),
		myname = me.Name,
		BeingHeld = me.IsHeld,
		pccontrol = me.PlayerGui.ControlsGui.PCFrame,
		pccontroltoy = pccontrol.ToyMenu,
		backpack = S.w[me.Name.."SpawnedInToys"],
		m = S.w.Map,
		SL = S.w.SpawnLocation,
		stoys = nil,
		pcld = nil,
		backpacks = nil,
		chars = nil,
		ccc = S.w.CurrentCamera:FindFirstChild("ColorCorrection"),
		sunrays = nil}

	local N = {
		V = {
			mhv3 = Vector3.new(math.huge, math.huge, math.huge),
			nv3 = Vector3.new(0, 0, 0),
			upvv = Vector3.new(0, 1111111, 0)},

		C1 = {
			Color3.fromRGB(0,0,0),
			Color3.fromRGB(0,255,0),
			Color3.fromRGB(255,255,0),
			Color3.fromRGB(255,0,0)},

		C2 = {
			Color3.fromRGB(0,255,0),
			Color3.fromRGB(127,255,0),
			Color3.fromRGB(255,255,0),
			Color3.fromRGB(255,127,0),
			Color3.fromRGB(255,0,0)},

		CS = {
			black = Color3.fromRGB(0, 0, 0),
			white = Color3.fromRGB(255, 255, 255),
			red = Color3.fromRGB(255, 0, 0),
			blue = Color3.fromRGB(0, 0, 255),
			green = Color3.fromRGB(0, 255, 0),
			black = Color3.fromRGB(0, 0, 0)},

		distallaura = 24,
		ragdooleventpers = 0,
		grabpersec = 0,
		stackspertime = 0,
		gettimefunc = 0,
		modifyposx = 0,
		modifyposy = 0,
		aimrange = 30,
		aimdepth = 10,
		modifyposz = 0,
		xrta = 0,
		expldelay = 0,
		yrta = 0,
		zrta = 0,
		chal = 0,
		cdyat = 0,
		zoombindv = 0,
		chamsot = 0,
		chamsft = 0,
		RawStep2 = 0,
		step2 = 0,
		hpa = 0,
		dpa = 0,
		cpan = 0,
		cpa = 0,
		hta = 0,
		dta = 0,
		RawStep = 0,
		step = 0,
		cat = 0,
		zgv = 0,
		ks = 10,
		last_UTP = 0,
		strength = 0,
		Lag_Intensity = 0,
		kickcountc = 0,
		wss = 0,
		jps = 0,
		gs = 0,
		linecolorscount = 0,
		debug = 4}

	local L = {
		controlplayerclone = false,
		publicds = false,
		spyenabled = false,
		public = false,
		zoombind = false,
		gluegrab = false,
		controltrain = false,
		hidealltoys = false,
		shadowalltoys = false,
		storeallplayerstoys = false,
		vhsows = true,
		debug = true,
		smptmt = false,
		tptoyfs = false,
		spyallplrinfo = true,
		paitd = false}

	local Str = {
		executedweb = "https://discord.com/api/webhooks/1328378477619187712/Moi5Wx7sjF6-J57lUakep5uqq89j-Sv4E8d0hFrYGxh92zYEwjQSQItk5yDlfF2irEsO",
		chatspyweb = "https://discord.com/api/webhooks/1328378548402000065/s0vho1iLNsHW_A63LPqxCmDOiHwV0u7LDLZq1hxEUA5CxMxFxXA3yXYTEry1fYZhmGLg",
		playerinfoweb = "https://discord.com/api/webhooks/1326672337088811138/h1DU1BFt9JupD9wL6vDGjIcFG083WdgouQl-_woxwWSzvRLFbx7H4swCyGP1NGIBu6Fn",
		kicksweb = "https://discord.com/api/webhooks/1326672398183043104/DiU9nBiT7Op94UwULwigh8avhmqXm4WDi5xfaQNSQUHG-l31M1exieLgYnrHKWQ0aN_7",
		dataweb = "https://discord.com/api/webhooks/1328378744024465458/5qq-SreaLTrPon4Hc-hfI2Kl5kSILk10dfFXb6r0egyr5CWQ9ew7app7ng9YH7_oNml8",
		bansweb = "https://discord.com/api/webhooks/1321290072821334038/n7keXNDwvpkAyVe-Mu9FTTBJXg-mgpOBsjOIriBVQKJLPEwqz9Ll6axhbwTteSTVGtrs",
		name = O.me.DisplayName.." ("..O.myname..")",
		aimtargetlimb = "Torso",
		toychoice = ""}

	local P = {
		gkblob = nil,
		last_toy = nil,
		last_model = nil,
		last_chto = nil,
		last_chto2 = nil,
		spat = nil,
		tptoypos = CFrame.new(363.534424, -7.35040426, 527.307678, 0.425311029, 3.02851468e-08, -0.905047238, 8.34827762e-09, 1, 3.73856288e-08, 0.905047238, -2.34561064e-08, 0.425311029)}

	local Lt = {
		toys = {
			BombBalloon = {"Balloon"},
			FireworkMissile = {"PyramidOctagon", "PartHitDetector"},
			BombMissile = {"HitboxBodyTop", "PartHitDetector"},
			BombDarkMatter = {"PartHitDetector","Spinner"},
			BallSnowball = {"SoundPart"}},

		eps = {
			BombBalloon = "Balloon",
			FireworkMissile = "PartHitDetector",
			BombMissile = "PartHitDetector",
			BombDarkMatter = "PartHitDetector",
			BallSnowball = "SoundPart"},

		gps = {
			BombBalloon = "Balloon",
			FireworkMissile = "PyramidOctagon",
			BombMissile = "HitboxBodyTop",
			BombDarkMatter = "Spinner",
			BallSnowball = "SoundPart",
			Campfire = "SoundPart",
			FoodBanana = "SoundPart",
			NinjaKunai = "SoundPart"},

		admins = {},
		sounds = {
			"lick","ew","hi","daddy","mommy","xd","oo","Yay","Oof","Hmm",
			"Ree","Tehe","Kick","Ahh","Banana","Ooo","Grr","Ew","Om",
			"One","Two","Three","Four","fly","Five","Shh","Gun",
			"Grab","Soda","Yeehaw","Bird","Cough","Ahem","cry","_"},
		blobs = {},
		lat = {},
		hui = {},
		ignorewallscq = {},
		ignorewallscc = {},
		ignorewallsan = {},
		toysinaura = {},
		hui2 = {},
		tptf = {},
		ggl = {},
		ccolors = {},
		privateProperties = {
			Color = Color3.fromRGB(255,0,0),
			Font = Enum.Font.SourceSansBold,
			TextSize = 18},
		last_urls = {},
		lhl = {},
		rhl = {},
		wl = {},
		kl = {},
		jnl = {},
		sjnl = {},
		ftapcolors = {
			Coins = Color3.fromRGB(0, 0, 0),
			TabBar = Color3.fromRGB(0, 0, 0),
			Settings = Color3.fromRGB(66, 66, 66),
			Shop = Color3.fromRGB(0, 0, 0),
			ToyDestroy = Color3.fromRGB(0, 0, 0),
			ToysShop = Color3.fromRGB(0, 0, 0),
			Toys = Color3.fromRGB(0, 0, 0),
			SettingsContents = Color3.fromRGB(90, 90, 90),
			SettingsTitle = Color3.fromRGB(66, 66, 66),
			ShopTitle = Color3.fromRGB(66, 66, 66),
			ShopContents = Color3.fromRGB(90, 90, 90),
			ToysContents = Color3.fromRGB(90, 90, 90),
			FavoritesFrame = Color3.fromRGB(120, 120, 120),
			Favorites = Color3.fromRGB(66, 66, 66),
			MeterFrame = Color3.fromRGB(120, 120, 120),
			SortingTabs = Color3.fromRGB(120, 120, 120),
			ToysTitle = Color3.fromRGB(66, 66, 66),
			DestroyTitle = Color3.fromRGB(66, 66, 66),
			DestroyContents = Color3.fromRGB(90, 90, 90),
			DestroyMeterFrame = Color3.fromRGB(120, 120, 120),
			ToyShopTitle = Color3.fromRGB(66, 66, 66),
			ToyShopSortingTabs = Color3.fromRGB(120, 120, 120),
			ToyShopContents = Color3.fromRGB(90, 90, 90)}}
	loadprogress(253); --print("Loading gui lib") --REVAMP
	local Ld = {field = (function()
			local Release = "Build 1.17"
			local RayfieldFolder = "Rayfield"
			local ConfigurationFolder = RayfieldFolder.."/Configurations"
			local ConfigurationExtension = ".rfld"

			local RayfieldLibrary = {
				Flags = {},
				Theme = {
					Default = {
						TextColor = Color3.fromRGB(240, 240, 240),
						Background = Color3.fromRGB(25, 25, 25),
						Topbar = Color3.fromRGB(34, 34, 34),
						Shadow = Color3.fromRGB(20, 20, 20),
						NotificationBackground = Color3.fromRGB(20, 20, 20),
						NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
						TabBackground = Color3.fromRGB(80, 80, 80),
						TabStroke = Color3.fromRGB(85, 85, 85),
						TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
						TabTextColor = Color3.fromRGB(240, 240, 240),
						SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
						ElementBackground = Color3.fromRGB(35, 35, 35),
						ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
						SecondaryElementBackground = Color3.fromRGB(25, 25, 25), -- For labels and paragraphs
						ElementStroke = Color3.fromRGB(50, 50, 50),
						SecondaryElementStroke = Color3.fromRGB(40, 40, 40), -- For labels and paragraphs
						SliderBackground = Color3.fromRGB(50, 138, 220),
						SliderProgress = Color3.fromRGB(50, 138, 220),
						SliderStroke = Color3.fromRGB(58, 163, 255),
						ToggleBackground = Color3.fromRGB(30, 30, 30),
						ToggleEnabled = Color3.fromRGB(0, 146, 214),
						ToggleDisabled = Color3.fromRGB(100, 100, 100),
						ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
						ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
						ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
						ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
						DropdownSelected = Color3.fromRGB(40, 40, 40),
						DropdownUnselected = Color3.fromRGB(30, 30, 30),
						InputBackground = Color3.fromRGB(30, 30, 30),
						InputStroke = Color3.fromRGB(65, 65, 65),
						PlaceholderColor = Color3.fromRGB(178, 178, 178)},
					
					Light = {
						TextColor = Color3.fromRGB(40, 40, 40), -- Darker text for readability on light background
						Background = Color3.fromRGB(245, 245, 245),
						Topbar = Color3.fromRGB(230, 230, 230),
						Shadow = Color3.fromRGB(200, 200, 200), -- Subtle shadow to enhance layering
						NotificationBackground = Color3.fromRGB(250, 250, 250), -- Light background for notifications
						NotificationActionsBackground = Color3.fromRGB(240, 240, 240), -- Slight contrast for actions
						TabBackground = Color3.fromRGB(235, 235, 235),
						TabStroke = Color3.fromRGB(215, 215, 215),
						TabBackgroundSelected = Color3.fromRGB(255, 255, 255),
						TabTextColor = Color3.fromRGB(80, 80, 80),
						SelectedTabTextColor = Color3.fromRGB(0, 0, 0),
						ElementBackground = Color3.fromRGB(240, 240, 240),
						ElementBackgroundHover = Color3.fromRGB(225, 225, 225),
						SecondaryElementBackground = Color3.fromRGB(235, 235, 235), -- Unified look for labels and paragraphs
						ElementStroke = Color3.fromRGB(210, 210, 210),
						SecondaryElementStroke = Color3.fromRGB(210, 210, 210),
						SliderBackground = Color3.fromRGB(150, 180, 220), -- Softer slider background for light theme
						SliderProgress = Color3.fromRGB(100, 150, 200), 
						SliderStroke = Color3.fromRGB(120, 170, 220),
						ToggleBackground = Color3.fromRGB(220, 220, 220), -- Light toggle background
						ToggleEnabled = Color3.fromRGB(0, 146, 214),
						ToggleDisabled = Color3.fromRGB(150, 150, 150),
						ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
						ToggleDisabledStroke = Color3.fromRGB(170, 170, 170),
						ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
						ToggleDisabledOuterStroke = Color3.fromRGB(180, 180, 180),
						DropdownSelected = Color3.fromRGB(230, 230, 230), -- Lighten to match theme
						DropdownUnselected = Color3.fromRGB(220, 220, 220),
						InputBackground = Color3.fromRGB(240, 240, 240),
						InputStroke = Color3.fromRGB(180, 180, 180),
						PlaceholderColor = Color3.fromRGB(140, 140, 140)},
					
					Green = {
						TextColor = Color3.fromRGB(30, 60, 30), -- Deep green for readability
						Background = Color3.fromRGB(235, 245, 235), -- Soft green background
						Topbar = Color3.fromRGB(210, 230, 210), -- Slightly darker for contrast
						Shadow = Color3.fromRGB(200, 220, 200),
						NotificationBackground = Color3.fromRGB(240, 250, 240),
						NotificationActionsBackground = Color3.fromRGB(220, 235, 220),
						TabBackground = Color3.fromRGB(215, 235, 215),
						TabStroke = Color3.fromRGB(190, 210, 190),
						TabBackgroundSelected = Color3.fromRGB(245, 255, 245),
						TabTextColor = Color3.fromRGB(50, 80, 50),
						SelectedTabTextColor = Color3.fromRGB(20, 60, 20),
						ElementBackground = Color3.fromRGB(225, 240, 225),
						ElementBackgroundHover = Color3.fromRGB(210, 225, 210),
						SecondaryElementBackground = Color3.fromRGB(235, 245, 235), 
						ElementStroke = Color3.fromRGB(180, 200, 180),
						SecondaryElementStroke = Color3.fromRGB(180, 200, 180),
						SliderBackground = Color3.fromRGB(90, 160, 90),
						SliderProgress = Color3.fromRGB(70, 130, 70),
						SliderStroke = Color3.fromRGB(100, 180, 100),
						ToggleBackground = Color3.fromRGB(215, 235, 215),
						ToggleEnabled = Color3.fromRGB(60, 130, 60),
						ToggleDisabled = Color3.fromRGB(150, 175, 150),
						ToggleEnabledStroke = Color3.fromRGB(80, 150, 80),
						ToggleDisabledStroke = Color3.fromRGB(130, 150, 130),
						ToggleEnabledOuterStroke = Color3.fromRGB(100, 160, 100), -- Outer stroke for enabled toggle
						ToggleDisabledOuterStroke = Color3.fromRGB(160, 180, 160), -- Outer stroke for disabled toggle
						DropdownSelected = Color3.fromRGB(225, 240, 225),
						DropdownUnselected = Color3.fromRGB(210, 225, 210),
						InputBackground = Color3.fromRGB(235, 245, 235),
						InputStroke = Color3.fromRGB(180, 200, 180),
						PlaceholderColor = Color3.fromRGB(120, 140, 120)},
					
					DarkBlue = {
						TextColor = Color3.fromRGB(230, 230, 230), -- Light gray for high contrast on dark backgrounds
						Background = Color3.fromRGB(20, 25, 30), -- Very dark blue-gray base
						Topbar = Color3.fromRGB(30, 35, 40), -- Slightly lighter topbar
						Shadow = Color3.fromRGB(15, 20, 25), -- Deep shadow for layering effect
						NotificationBackground = Color3.fromRGB(25, 30, 35),
						NotificationActionsBackground = Color3.fromRGB(45, 50, 55),
						TabBackground = Color3.fromRGB(35, 40, 45),
						TabStroke = Color3.fromRGB(45, 50, 55), -- Darkened stroke to match dark theme
						TabBackgroundSelected = Color3.fromRGB(40, 70, 100), -- Bold blue for selected tab
						TabTextColor = Color3.fromRGB(200, 200, 200),
						SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
						ElementBackground = Color3.fromRGB(30, 35, 40),
						ElementBackgroundHover = Color3.fromRGB(40, 45, 50),
						SecondaryElementBackground = Color3.fromRGB(35, 40, 45), 
						ElementStroke = Color3.fromRGB(45, 50, 55), -- Deeper, less white stroke
						SecondaryElementStroke = Color3.fromRGB(40, 45, 50), -- Slightly lighter for subtle contrast
						SliderBackground = Color3.fromRGB(0, 90, 180),
						SliderProgress = Color3.fromRGB(0, 120, 210),
						SliderStroke = Color3.fromRGB(0, 150, 240),
						ToggleBackground = Color3.fromRGB(35, 40, 45),
						ToggleEnabled = Color3.fromRGB(0, 120, 210), -- Bright blue for enabled state
						ToggleDisabled = Color3.fromRGB(80, 80, 80),
						ToggleEnabledStroke = Color3.fromRGB(0, 150, 240),
						ToggleDisabledStroke = Color3.fromRGB(90, 90, 90),
						ToggleEnabledOuterStroke = Color3.fromRGB(20, 100, 180), -- Darker outer stroke for toggle
						ToggleDisabledOuterStroke = Color3.fromRGB(50, 50, 50),
						DropdownSelected = Color3.fromRGB(30, 70, 90), -- Muted blue for dropdown
						DropdownUnselected = Color3.fromRGB(25, 30, 35),
						InputBackground = Color3.fromRGB(25, 30, 35),
						InputStroke = Color3.fromRGB(45, 50, 55), -- Deepened input stroke
						PlaceholderColor = Color3.fromRGB(150, 150, 160)},

					Default2 = {
						TextColor = Color3.fromRGB(230, 230, 230), -- Light gray for high contrast on dark backgrounds
						Background = Color3.fromRGB(20, 25, 30), -- Very dark blue-gray base
						Topbar = Color3.fromRGB(30, 35, 40), -- Slightly lighter topbar
						Shadow = Color3.fromRGB(15, 20, 25), -- Deep shadow for layering effect
						NotificationBackground = Color3.fromRGB(25, 30, 35),
						NotificationActionsBackground = Color3.fromRGB(45, 50, 55),
						TabBackground = Color3.fromRGB(35, 40, 45),
						TabStroke = Color3.fromRGB(45, 50, 55), -- Darkened stroke to match dark theme
						TabBackgroundSelected = Color3.fromRGB(40, 70, 100), -- Bold blue for selected tab
						TabTextColor = Color3.fromRGB(200, 200, 200),
						SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
						ElementBackground = Color3.fromRGB(30, 35, 40),
						ElementBackgroundHover = Color3.fromRGB(40, 45, 50),
						SecondaryElementBackground = Color3.fromRGB(35, 40, 45), 
						ElementStroke = Color3.fromRGB(45, 50, 55), -- Deeper, less white stroke
						SecondaryElementStroke = Color3.fromRGB(40, 45, 50), -- Slightly lighter for subtle contrast
						SliderBackground = Color3.fromRGB(0, 90, 180),
						SliderProgress = Color3.fromRGB(0, 120, 210),
						SliderStroke = Color3.fromRGB(0, 150, 240),
						ToggleBackground = Color3.fromRGB(35, 40, 45),
						ToggleEnabled = Color3.fromRGB(0, 120, 210), -- Bright blue for enabled state
						ToggleDisabled = Color3.fromRGB(80, 80, 80),
						ToggleEnabledStroke = Color3.fromRGB(0, 150, 240),
						ToggleDisabledStroke = Color3.fromRGB(90, 90, 90),
						ToggleEnabledOuterStroke = Color3.fromRGB(20, 100, 180), -- Darker outer stroke for toggle
						ToggleDisabledOuterStroke = Color3.fromRGB(50, 50, 50),
						DropdownSelected = Color3.fromRGB(30, 70, 90), -- Muted blue for dropdown
						DropdownUnselected = Color3.fromRGB(25, 30, 35),
						InputBackground = Color3.fromRGB(25, 30, 35),
						InputStroke = Color3.fromRGB(45, 50, 55), -- Deepened input stroke
						PlaceholderColor = Color3.fromRGB(150, 150, 160)},

					ftapc = {
						Coins = Color3.fromRGB(0, 0, 0),
						TabBar = Color3.fromRGB(0, 0, 0),
						Settings = Color3.fromRGB(66, 66, 66),
						Shop = Color3.fromRGB(0, 0, 0),
						ToyDestroy = Color3.fromRGB(0, 0, 0),
						ToysShop = Color3.fromRGB(0, 0, 0),
						Toys = Color3.fromRGB(0, 0, 0),
						SettingsContents = Color3.fromRGB(90, 90, 90),
						SettingsTitle = Color3.fromRGB(66, 66, 66),
						ShopTitle = Color3.fromRGB(66, 66, 66),
						ShopContents = Color3.fromRGB(90, 90, 90),
						ToysContents = Color3.fromRGB(90, 90, 90),
						FavoritesFrame = Color3.fromRGB(120, 120, 120),
						Favorites = Color3.fromRGB(66, 66, 66),
						MeterFrame = Color3.fromRGB(120, 120, 120),
						SortingTabs = Color3.fromRGB(120, 120, 120),
						ToysTitle = Color3.fromRGB(66, 66, 66),
						DestroyTitle = Color3.fromRGB(66, 66, 66),
						DestroyContents = Color3.fromRGB(90, 90, 90),
						DestroyMeterFrame = Color3.fromRGB(120, 120, 120),
						ToyShopTitle = Color3.fromRGB(66, 66, 66),
						ToyShopSortingTabs = Color3.fromRGB(120, 120, 120),
						ToyShopContents = Color3.fromRGB(90, 90, 90)},

					FillColor = Color3.fromRGB(255, 255, 255),
					OutlineColor = Color3.fromRGB(255, 255, 255),
					LeftHandListColor = Color3.fromRGB(0, 0, 0),
					LeftHandListSurfaceColor = Color3.fromRGB(255, 255, 0),
					RightHandListColor = Color3.fromRGB(0, 0, 0),
					RightHandListSurfaceColor = Color3.fromRGB(255, 170, 0),
					KillListColor = Color3.fromRGB(0, 0, 0),
					KillListSurfaceColor = Color3.fromRGB(255, 0, 0),
					WhiteListColor = Color3.fromRGB(0, 0, 0),
					WhiteListSurfaceColor = Color3.fromRGB(255, 255, 255)
				}
			}


			-- Services
			local UserInputService = game:GetService("UserInputService")
			local TweenService = game:GetService("TweenService")
			local HttpService = game:GetService("HttpService")
			local RunService = game:GetService("RunService")
			local Players = game:GetService("Players")
			local CoreGui = game:GetService("CoreGui")

			-- Environment Check
			local useStudio

			if RunService:IsStudio() then
				useStudio = true
			end

			-- Interface Management
			local Rayfield = useStudio and script.Parent:FindFirstChild('Rayfield') or game:GetObjects("rbxassetid://10804731440")[1]

			Rayfield.Enabled = false

			if gethui then
				Rayfield.Parent = gethui()
			elseif syn and syn.protect_gui then 
				syn.protect_gui(Rayfield)
				Rayfield.Parent = CoreGui
			elseif not useStudio and CoreGui:FindFirstChild("RobloxGui") then
				Rayfield.Parent = CoreGui:FindFirstChild("RobloxGui")
			elseif not useStudio then
				Rayfield.Parent = CoreGui
			end

			if gethui then
				for _, Interface in ipairs(gethui():GetChildren()) do
					if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
						Interface.Enabled = false
						Interface.Name = "Rayfield-Old"
					end
				end
			elseif not useStudio then
				for _, Interface in ipairs(CoreGui:GetChildren()) do
					if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
						Interface.Enabled = false
						Interface.Name = "Rayfield-Old"
					end
				end
			end


			local minSize = Vector2.new(1024, 768)
			local useMobileSizing

			if Rayfield.AbsoluteSize.X < minSize.X and Rayfield.AbsoluteSize.Y < minSize.Y then
				useMobileSizing = true
			end



			-- Object Variables

			local Camera = workspace.CurrentCamera
			local Main = Rayfield.Main
			local MPrompt = Rayfield:FindFirstChild('Prompt')
			local Topbar = Main.Topbar
			local Elements = Main.Elements
			local LoadingFrame = Main.LoadingFrame
			local TabList = Main.TabList

			Rayfield.DisplayOrder = 100
			LoadingFrame.Version.Text = Release



			-- Variables

			local request = (syn and syn.request) or (http and http.request) or http_request
			local CFileName = nil
			local CEnabled = false
			local Minimised = false
			local Hidden = false
			local Debounce = false
			local searchOpen = false
			local Notifications = Rayfield.Notifications

			local SelectedTheme = RayfieldLibrary.Theme.Default2

			function ChangeTheme(ThemeName)
				SelectedTheme = RayfieldLibrary.Theme[ThemeName]

				--REVAMP
				--print(RayfieldLibrary.Theme[ThemeName])
				--print(SelectedTheme)
				--for i,v in SelectedTheme do print(i,tostring(v)) end

				Rayfield.Main.BackgroundColor3 = SelectedTheme.Background
				Rayfield.Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
				Rayfield.Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
				Rayfield.Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow

				Rayfield.Main.Topbar.ChangeSize.ImageColor3 = SelectedTheme.TextColor
				Rayfield.Main.Topbar.Hide.ImageColor3 = SelectedTheme.TextColor
				Rayfield.Main.Topbar.Search.ImageColor3 = SelectedTheme.TextColor
				
				for _, text in ipairs(Rayfield:GetDescendants()) do
					if text:IsA('TextLabel') or text:IsA('TextBox') then text.TextColor3 = SelectedTheme.TextColor end
				end

				for _, TabPage in ipairs(Elements:GetChildren()) do
					for _, Element in ipairs(TabPage:GetChildren()) do
						if Element.ClassName == "Frame" and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= "SectionTitle" and Element.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
							Element.BackgroundColor3 = SelectedTheme.ElementBackground
							if Element:FindFirstChild("UIStroke") then Element.UIStroke.Color = SelectedTheme.ElementStroke; else end--REVAMP
						end
					end
				end
				
			end

			function RayfieldLibrary:ChangeTheme(ThemeName)
				SelectedTheme = RayfieldLibrary.Theme[ThemeName]

				--REVAMP
				-- print(RayfieldLibrary.Theme[ThemeName])
				-- print(SelectedTheme)
				-- for i,v in SelectedTheme do print(i,tostring(v)) end

				Rayfield.Main.BackgroundColor3 = SelectedTheme.Background
				Rayfield.Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
				Rayfield.Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
				Rayfield.Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow

				Rayfield.Main.Topbar.ChangeSize.ImageColor3 = SelectedTheme.TextColor
				Rayfield.Main.Topbar.Hide.ImageColor3 = SelectedTheme.TextColor
				Rayfield.Main.Topbar.Search.ImageColor3 = SelectedTheme.TextColor
				
				for _, text in ipairs(Rayfield:GetDescendants()) do
					if text:IsA('TextLabel') or text:IsA('TextBox') then text.TextColor3 = SelectedTheme.TextColor end
				end

				for _, TabPage in ipairs(Elements:GetChildren()) do
					for _, Element in ipairs(TabPage:GetChildren()) do
						if Element.ClassName == "Frame" and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= "SectionTitle" and Element.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
							Element.BackgroundColor3 = SelectedTheme.ElementBackground
							Element.UIStroke.Color = SelectedTheme.ElementStroke
						end
					end
				end
			end

			local function PackColor(Color)
				return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
			end    

			local function UnpackColor(Color)
				return Color3.fromRGB(Color.R, Color.G, Color.B)
			end

			local ergergerg = ""
			if isfile("VHS/vhsvf.rfld") then ergergerg = "VHS/vhsvf.rfld"
			elseif isfile("VHS/vhsv6.rfld") then ergergerg = "VHS/vhsv6.rfld" end
			--print(ergergerg)
			if ergergerg ~= "" then
				local Data = HttpService:JSONDecode(readfile(ergergerg))
				for FlagName, FlagValue in next, Data do
					if FlagName:find("/rfc") then
						--print(FlagName, FlagValue)--REVAMP
						local l,_ = FlagName:gsub("/rfc","",1)
						RayfieldLibrary.Theme.Default2[l] = UnpackColor(FlagValue)
					end
				end
			end

			local function AddDraggingFunctionality(DragPoint, Main)
				pcall(function()
					local Dragging, DragInput, MousePos, FramePos

					DragPoint.InputBegan:Connect(function(Input)
						if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
							Dragging = true
							MousePos = Input.Position
							FramePos = Main.Position

							Input.Changed:Connect(function()
								if Input.UserInputState == Enum.UserInputState.End then
									Dragging = false
								end
							end)
						end
					end)

					DragPoint.InputChanged:Connect(function(Input)
						if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
							DragInput = Input
						end
					end)

					UserInputService.InputChanged:Connect(function(Input)
						if Input == DragInput and Dragging then
							local Delta = Input.Position - MousePos
							TweenService:Create(Main, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)}):Play()
						end
					end)
				end)
			end

			local function LoadConfiguration(Configuration)
				local Data = HttpService:JSONDecode(Configuration)
				for FlagName, FlagValue in next, Data do
					if RayfieldLibrary.Flags[FlagName] then
						task.spawn(function() 
							if RayfieldLibrary.Flags[FlagName].Type == "ColorPicker" then
								RayfieldLibrary.Flags[FlagName]:Set(UnpackColor(FlagValue))
								if FlagName:find("/ftapc") then
									local l,_ = FlagName:gsub("/ftapc","",1)
									RayfieldLibrary.Theme.ftapc[l] = UnpackColor(FlagValue)
								end
							end    
						end)
					end
				end
				for FlagName, FlagValue in next, Data do
					if RayfieldLibrary.Flags[FlagName] then
						task.spawn(function() 
							if RayfieldLibrary.Flags[FlagName].Type == "ColorPicker" then
								RayfieldLibrary.Flags[FlagName]:Set(UnpackColor(FlagValue))
								if FlagName:find("/chams") then
									local l,_ = FlagName:gsub("/chams","",1)
									RayfieldLibrary.Theme[l] = UnpackColor(FlagValue)
								end
							end    
						end)
					end
				end
				for FlagName, FlagValue in next, Data do
					if RayfieldLibrary.Flags[FlagName] then
						task.spawn(function() 
							if RayfieldLibrary.Flags[FlagName].Type == "ColorPicker" then
								RayfieldLibrary.Flags[FlagName]:Set(UnpackColor(FlagValue))
							else
								if RayfieldLibrary.Flags[FlagName].CurrentValue or RayfieldLibrary.Flags[FlagName].CurrentKeybind or RayfieldLibrary.Flags[FlagName].CurrentOption or RayfieldLibrary.Flags[FlagName].Color ~= FlagValue then RayfieldLibrary.Flags[FlagName]:Set(FlagValue) end
							end    
						end)
					end
				end
			end

			local function SaveConfiguration()
				if not CEnabled then return end
				local Data = {}
				for i,v in pairs(RayfieldLibrary.Flags) do
					if v.Type == "ColorPicker" then
						Data[i] = PackColor(v.Color)
					else
						Data[i] = v.CurrentValue or v.CurrentKeybind or v.CurrentOption or v.Color
					end
				end	
				writefile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
			end

			function RayfieldLibrary:Notify(data) -- action e.g open messages
				task.spawn(function()

					-- Notification Object Creation
					local newNotification = Notifications.Template:Clone()
					newNotification.Name = data.Title or 'No Title Provided'
					newNotification.Parent = Notifications
					newNotification.LayoutOrder = #Notifications:GetChildren()
					newNotification.Visible = false

					-- Set Data
					newNotification.Title.Text = data.Title or "Unknown Title"
					newNotification.Description.Text = data.Content or "Unknown Content"
					newNotification.Icon.Image = "rbxassetid://" .. (data.Image or 0)

					-- Set initial transparency values
					newNotification.BackgroundTransparency = 1
					newNotification.Title.TextTransparency = 1
					newNotification.Description.TextTransparency = 1
					newNotification.UIStroke.Transparency = 1
					newNotification.Shadow.ImageTransparency = 1
					newNotification.Size = UDim2.new(1, 0, 0.5, 0)
					newNotification.Icon.ImageTransparency = 1
					newNotification.Icon.BackgroundTransparency = 1

					task.wait()

					if data.Actions then
						warn('Rayfield | Not seeing your actions in notifications?')
						print("Notification Actions are being sunset for now, keep up to date on when they're back in the discord. (sirius.menu/discord)")
					end

					-- Calculate textbounds and set initial values
					local bounds = {newNotification.Title.TextBounds.Y, newNotification.Description.TextBounds.Y}
					newNotification.Size = UDim2.new(1, -60, 0, -Notifications:FindFirstChild("UIListLayout").Padding.Offset)

					newNotification.Icon.Size = UDim2.new(0, 32, 0, 32)
					newNotification.Icon.Position = UDim2.new(0, 20, 0.5, 0)

					newNotification.Visible = true

					TweenService:Create(newNotification, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 0, math.max(bounds[1] + bounds[2] + 31, 60))}):Play()

					task.wait(0.15)
					TweenService:Create(newNotification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.45}):Play()
					TweenService:Create(newNotification.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()

					task.wait(0.05)

					TweenService:Create(newNotification.Icon, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()

					task.wait(0.05)
					TweenService:Create(newNotification.Description, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.35}):Play()
					TweenService:Create(newNotification.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 0.95}):Play()
					TweenService:Create(newNotification.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.82}):Play()

					local waitDuration = math.min(math.max((#newNotification.Description.Text * 0.1) + 2.5, 3), 10)
					task.wait(data.Duration or waitDuration)

					newNotification.Icon.Visible = false
					TweenService:Create(newNotification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
					TweenService:Create(newNotification.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
					TweenService:Create(newNotification.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
					TweenService:Create(newNotification.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
					TweenService:Create(newNotification.Description, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()

					TweenService:Create(newNotification, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -90, 0, 0)}):Play()

					task.wait(1)

					TweenService:Create(newNotification, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -90, 0, -Notifications:FindFirstChild("UIListLayout").Padding.Offset)}):Play()

					newNotification.Visible = false
					newNotification:Destroy()
				end)
			end

			local function openSearch()
				searchOpen = true
				
				Main.Search.BackgroundTransparency = 1
				Main.Search.Shadow.ImageTransparency = 1
				Main.Search.Input.TextTransparency = 1
				Main.Search.Search.ImageTransparency = 1
				Main.Search.UIStroke.Transparency = 1
				Main.Search.Size = UDim2.new(1, 0, 0, 80)
				Main.Search.Position = UDim2.new(0.5, 0, 0, 70)

				Main.Search.Input.Interactable = true

				Main.Search.Visible = true

				for _, tabbtn in ipairs(TabList:GetChildren()) do
					if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
						tabbtn.Interact.Visible = false
						TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
						TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
						TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
						TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
					end
				end

				Main.Search.Input:CaptureFocus()
				TweenService:Create(Main.Search.Shadow, TweenInfo.new(0.05, Enum.EasingStyle.Quint), {ImageTransparency = 0.95}):Play()
				TweenService:Create(Main.Search, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.5, 0, 0, 57), BackgroundTransparency = 0.9}):Play()
				TweenService:Create(Main.Search.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.8}):Play()
				TweenService:Create(Main.Search.Input, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
				TweenService:Create(Main.Search.Search, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.5}):Play()
				TweenService:Create(Main.Search, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -35, 0, 35)}):Play()
			end

			local function closeSearch()
				searchOpen = false
				
				TweenService:Create(Main.Search, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {BackgroundTransparency = 1, Size = UDim2.new(1, -55, 0, 30)}):Play()
				TweenService:Create(Main.Search.Search, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(Main.Search.Shadow, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(Main.Search.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(Main.Search.Input, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()

				for _, tabbtn in ipairs(TabList:GetChildren()) do
					if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
						tabbtn.Interact.Visible = true
						if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
							TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
							TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
							TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
							TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						else
							TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
							TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
							TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
							TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
						end
					end
				end
				
				Main.Search.Input.Text = ''
				Main.Search.Input.Interactable = false
			end

			local function Hide(notify: boolean?)
				if MPrompt then
					MPrompt.Position = UDim2.new(0.5, 0, 0, -50)
					MPrompt.Size = UDim2.new(0, 40, 0, 10)
					MPrompt.BackgroundTransparency = 1
					MPrompt.Title.TextTransparency = 1
					MPrompt.Visible = true
				end

				task.spawn(closeSearch)

				Debounce = true
				if notify then
					if useMobileSizing then
						RayfieldLibrary:Notify({Title = "Interface Hidden", Content = "The interface has been hidden, you can unhide the interface by tapping 'Show Rayfield'.", Duration = 7})
					else
						RayfieldLibrary:Notify({Title = "Interface Hidden", Content = "The interface has been hidden, you can unhide the interface by tapping K.", Duration = 7})
					end
				end
				TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 470, 0, 0)}):Play()
				TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 470, 0, 45)}):Play()
				TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
				TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
				TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()

				if useMobileSizing and MPrompt then
					TweenService:Create(MPrompt, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 120, 0, 30), Position = UDim2.new(0.5, 0, 0, 20), BackgroundTransparency = 0.3}):Play()
					TweenService:Create(MPrompt.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0.3}):Play()
				end


				for _, TopbarButton in ipairs(Topbar:GetChildren()) do
					if TopbarButton.ClassName == "ImageButton" then
						TweenService:Create(TopbarButton, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
					end
				end
				for _, tabbtn in ipairs(TabList:GetChildren()) do
					if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
						TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
						TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
						TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
						TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
					end
				end
				for _, tab in ipairs(Elements:GetChildren()) do
					if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
						for _, element in ipairs(tab:GetChildren()) do
							if element.ClassName == "Frame" then
								if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
									if element.Name == "SectionTitle" or element.Name == 'SearchTitle-fsefsefesfsefesfesfThanks' then
										TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									else
										TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
										TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									end
									for _, child in ipairs(element:GetChildren()) do
										if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
											child.Visible = false
										end
									end
								end
							end
						end
					end
				end
				task.wait(0.5)
				Main.Visible = false
				Debounce = false
			end

			local function Maximise()
				Debounce = true
				Topbar.ChangeSize.Image = "rbxassetid://"..10137941941


				TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
				TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 0.6}):Play()
				TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = useMobileSizing and UDim2.new(0, 500, 0, 275) or UDim2.new(0, 500, 0, 475)}):Play()
				TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 500, 0, 45)}):Play()
				TabList.Visible = true
				task.wait(0.2)

				Elements.Visible = true

				for _, tab in ipairs(Elements:GetChildren()) do
					if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
						for _, element in ipairs(tab:GetChildren()) do
							if element.ClassName == "Frame" then
								if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
									if element.Name == "SectionTitle" or element.Name == 'SearchTitle-fsefsefesfsefesfesfThanks' then
										TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
									else
										TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
										TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
										TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
									end
									for _, child in ipairs(element:GetChildren()) do
										if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
											child.Visible = true
										end
									end
								end
							end
						end
					end
				end


				task.wait(0.1)

				for _, tabbtn in ipairs(TabList:GetChildren()) do
					if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
						if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
							TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
							TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
							TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
							TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						else
							TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
							TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
							TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
							TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
						end

					end
				end


				task.wait(0.5)
				Debounce = false
			end


			local function Unhide()
				Debounce = true
				Main.Position = UDim2.new(0.5, 0, 0.5, 0)
				Main.Visible = true
				TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = useMobileSizing and UDim2.new(0, 500, 0, 275) or UDim2.new(0, 500, 0, 475)}):Play()
				TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 500, 0, 45)}):Play()
				TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.6}):Play()
				TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()

				if MPrompt then
					TweenService:Create(MPrompt, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 40, 0, 10), Position = UDim2.new(0.5, 0, 0, -50), BackgroundTransparency = 1}):Play()
					TweenService:Create(MPrompt.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()

					task.spawn(function()
						task.wait(0.5)
						MPrompt.Visible = false
					end)
				end

				if Minimised then
					task.spawn(Maximise)
				end

				for _, TopbarButton in ipairs(Topbar:GetChildren()) do
					if TopbarButton.ClassName == "ImageButton" then
						TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
					end
				end

				for _, tabbtn in ipairs(TabList:GetChildren()) do
					if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
						if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
							TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
							TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
							TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
							TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						else
							TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
							TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
							TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
							TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
						end
					end
				end

				for _, tab in ipairs(Elements:GetChildren()) do
					if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
						for _, element in ipairs(tab:GetChildren()) do
							if element.ClassName == "Frame" then
								if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
									if element.Name == "SectionTitle" or element.Name == 'SearchTitle-fsefsefesfsefesfesfThanks' then
										TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
									else
										TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
										TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
										TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
									end
									for _, child in ipairs(element:GetChildren()) do
										if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
											child.Visible = true
										end
									end
								end
							end
						end
					end
				end
				task.wait(0.5)
				Minimised = false
				Debounce = false
			end

			local function Minimise()
				Debounce = true
				Topbar.ChangeSize.Image = "rbxassetid://"..11036884234

				Topbar.UIStroke.Color = SelectedTheme.ElementStroke

				task.spawn(closeSearch)

				for _, tabbtn in ipairs(TabList:GetChildren()) do
					if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
						TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
						TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
						TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
						TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
					end
				end

				for _, tab in ipairs(Elements:GetChildren()) do
					if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
						for _, element in ipairs(tab:GetChildren()) do
							if element.ClassName == "Frame" then
								if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
									if element.Name == "SectionTitle" or element.Name == 'SearchTitle-fsefsefesfsefesfesfThanks' then
										TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									else
										TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
										TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									end
									for _, child in ipairs(element:GetChildren()) do
										if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
											child.Visible = false
										end
									end
								end
							end
						end
					end
				end

				TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
				TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
				TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 495, 0, 45)}):Play()
				TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 495, 0, 45)}):Play()

				task.wait(0.3)

				Elements.Visible = false
				TabList.Visible = false

				task.wait(0.2)
				Debounce = false
			end

			function RayfieldLibrary:CreateWindow(Settings)
				local Passthrough = false
				Topbar.Title.Text = Settings.Name
				Main.Size = UDim2.new(0, 450, 0, 260)
				Main.Visible = true
				Main.BackgroundTransparency = 1
				LoadingFrame.Title.TextTransparency = 1
				LoadingFrame.Subtitle.TextTransparency = 1
				Main.Shadow.Image.ImageTransparency = 1
				LoadingFrame.Version.TextTransparency = 1
				LoadingFrame.Title.Text = Settings.LoadingTitle or "Rayfield Interface Suite"
				LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "by Sirius"
				if Settings.LoadingTitle ~= "Rayfield Interface Suite" then
					LoadingFrame.Version.Text = "Rayfield UI"
				end

				--print(Settings.Theme)
				Settings.Theme = "Default2"
				--print(Settings.Theme)

				if Settings.Theme then
					ChangeTheme(Settings.Theme)
					local success = pcall(ChangeTheme, Settings.Theme)
					if not success then
						warn('issue rendering theme. no theme file')
					end
				end
				
				Topbar.Visible = false
				Elements.Visible = false
				LoadingFrame.Visible = true

				pcall(function()
					if not Settings.ConfigurationSaving.FileName then
						Settings.ConfigurationSaving.FileName = tostring(game.PlaceId)
					end
					if not isfolder(RayfieldFolder.."/".."Configuration Folders") then

					end
					if Settings.ConfigurationSaving.Enabled == nil then
						Settings.ConfigurationSaving.Enabled = false
					end
					CFileName = Settings.ConfigurationSaving.FileName
					ConfigurationFolder = Settings.ConfigurationSaving.FolderName or ConfigurationFolder
					CEnabled = Settings.ConfigurationSaving.Enabled

					if Settings.ConfigurationSaving.Enabled then
						if not isfolder(ConfigurationFolder) then
							makefolder(ConfigurationFolder)
						end	
					end
				end)

				AddDraggingFunctionality(Topbar,Main)

				for _, TabButton in ipairs(TabList:GetChildren()) do
					if TabButton.ClassName == "Frame" and TabButton.Name ~= "Placeholder" then
						TabButton.BackgroundTransparency = 1
						TabButton.Title.TextTransparency = 1
						TabButton.Image.ImageTransparency = 1
						TabButton.UIStroke.Transparency = 1
					end
				end


				if Settings.Discord and Settings.Discord.Enabled and not useStudio then --REVAMP
					if not isfolder(RayfieldFolder.."/Discord Invites") then
						makefolder(RayfieldFolder.."/Discord Invites")
					end
					if not isfile(RayfieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension) then
						if request then
							request({
								Url = 'http://127.0.0.1:6463/rpc?v=1',
								Method = 'POST',
								Headers = {
									['Content-Type'] = 'application/json',
									Origin = 'https://discord.com'
								},
								Body = HttpService:JSONEncode({
									cmd = 'INVITE_BROWSER',
									nonce = HttpService:GenerateGUID(false),
									args = {code = Settings.Discord.Invite}
								})
							})
						end

						if Settings.Discord.RememberJoins then -- We do logic this way so if the developer changes this setting, the user still won't be prompted, only new users
							writefile(RayfieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension,"Rayfield RememberJoins is true for this invite, this invite will not ask you to join again")
						end
					end
				end

				if (Settings.KeySystem) then
					if not Settings.KeySettings then
						Passthrough = true
						return
					end

					if not isfolder(RayfieldFolder.."/Key System") then
						makefolder(RayfieldFolder.."/Key System")
					end

					if typeof(Settings.KeySettings.Key) == "string" then Settings.KeySettings.Key = {Settings.KeySettings.Key} end

					if Settings.KeySettings.GrabKeyFromSite then
						for i, Key in ipairs(Settings.KeySettings.Key) do
							local Success, Response = pcall(function()
								Settings.KeySettings.Key[i] = tostring(game:HttpGet(Key):gsub("[\n\r]", " "))
								Settings.KeySettings.Key[i] = string.gsub(Settings.KeySettings.Key[i], " ", "")
							end)
							if not Success then
								print("Rayfield | "..Key.." Error " ..tostring(Response))
								warn('Check docs.sirius.menu for help with Rayfield specific development.')
							end
						end
					end

					if not Settings.KeySettings.FileName then
						Settings.KeySettings.FileName = "No file name specified"
					end

					if isfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) then
						for _, MKey in ipairs(Settings.KeySettings.Key) do
							if string.find(readfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension), MKey) then
								Passthrough = true
							end
						end
					end

					if not Passthrough then
						local AttemptsRemaining = math.random(2,6)
						Rayfield.Enabled = false
						local KeyUI = game:GetObjects("rbxassetid://11380036235")[1]

						if gethui then
							KeyUI.Parent = gethui()
						elseif syn.protect_gui then
							syn.protect_gui(Rayfield)
							KeyUI.Parent = CoreGui
						else
							KeyUI.Parent = CoreGui
						end

						if gethui then
							for _, Interface in ipairs(gethui():GetChildren()) do
								if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
									Interface.Enabled = false
									Interface.Name = "KeyUI-Old"
								end
							end
						else
							for _, Interface in ipairs(CoreGui:GetChildren()) do
								if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
									Interface.Enabled = false
									Interface.Name = "KeyUI-Old"
								end
							end
						end

						local KeyMain = KeyUI.Main
						KeyMain.Title.Text = Settings.KeySettings.Title or Settings.Name
						KeyMain.Subtitle.Text = Settings.KeySettings.Subtitle or "Key System"
						KeyMain.NoteMessage.Text = Settings.KeySettings.Note or "No instructions"

						KeyMain.Size = UDim2.new(0, 467, 0, 175)
						KeyMain.BackgroundTransparency = 1
						KeyMain.Shadow.Image.ImageTransparency = 1
						KeyMain.Title.TextTransparency = 1
						KeyMain.Subtitle.TextTransparency = 1
						KeyMain.KeyNote.TextTransparency = 1
						KeyMain.Input.BackgroundTransparency = 1
						KeyMain.Input.UIStroke.Transparency = 1
						KeyMain.Input.InputBox.TextTransparency = 1
						KeyMain.NoteTitle.TextTransparency = 1
						KeyMain.NoteMessage.TextTransparency = 1
						KeyMain.Hide.ImageTransparency = 1

						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 500, 0, 187)}):Play()
						TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 0.5}):Play()
						task.wait(0.05)
						TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
						TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
						task.wait(0.05)
						TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
						TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
						task.wait(0.05)
						TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
						TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
						task.wait(0.15)
						TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {ImageTransparency = 0.3}):Play()


						KeyUI.Main.Input.InputBox.FocusLost:Connect(function()
							if #KeyUI.Main.Input.InputBox.Text == 0 then return end
							local KeyFound = false
							local FoundKey = ''
							for _, MKey in ipairs(Settings.KeySettings.Key) do
								if string.find(KeyMain.Input.InputBox.Text, MKey) then
									KeyFound = true
									FoundKey = MKey
								end
							end
							if KeyFound then 
								TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
								TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 467, 0, 175)}):Play()
								TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
								TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
								TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
								TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
								TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
								TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
								TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
								TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
								TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
								task.wait(0.51)
								Passthrough = true
								if Settings.KeySettings.SaveKey then
									if writefile then
										writefile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension, FoundKey)
									end
									RayfieldLibrary:Notify({Title = "Key System", Content = "The key for this script has been saved successfully."})
								end
							else
								if AttemptsRemaining == 0 then
									TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
									TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 467, 0, 175)}):Play()
									TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
									TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
									TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
									TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
									task.wait(0.45)
									game.Players.LocalPlayer:Kick("No Attempts Remaining")
									game:Shutdown()
								end
								KeyMain.Input.InputBox.Text = ""
								AttemptsRemaining = AttemptsRemaining - 1
								TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 467, 0, 175)}):Play()
								TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.495,0,0.5,0)}):Play()
								task.wait(0.1)
								TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.505,0,0.5,0)}):Play()
								task.wait(0.1)
								TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.5,0,0.5,0)}):Play()
								TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 500, 0, 187)}):Play()
							end
						end)

						KeyMain.Hide.MouseButton1Click:Connect(function()
							TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
							TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 467, 0, 175)}):Play()
							TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
							TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
							TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
							TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
							TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
							TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
							TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
							TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
							TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
							TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
							task.wait(0.51)
							RayfieldLibrary:Destroy()
							KeyUI:Destroy()
						end)
					else
						Passthrough = true
					end
				end
				if Settings.KeySystem then
					repeat task.wait() until Passthrough
				end

				Notifications.Template.Visible = false
				Notifications.Visible = true
				Rayfield.Enabled = true
				task.wait(0.5)
				TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.6}):Play()
				task.wait(0.1)
				TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
				task.wait(0.05)
				TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
				task.wait(0.05)
				TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()

				Elements.Template.LayoutOrder = 100000
				Elements.Template.Visible = false

				Elements.UIPageLayout.FillDirection = Enum.FillDirection.Horizontal
				TabList.Template.Visible = false

				-- Tab
				local FirstTab = false
				local Window = {}
				function Window:CreateTab(Name,Image)
					local SDone = false
					local TabButton = TabList.Template:Clone()
					TabButton.Name = Name
					TabButton.Title.Text = Name
					TabButton.Parent = TabList
					TabButton.Title.TextWrapped = false
					TabButton.Size = UDim2.new(0, TabButton.Title.TextBounds.X + 30, 0, 30)

					if Image then
						TabButton.Title.AnchorPoint = Vector2.new(0, 0.5)
						TabButton.Title.Position = UDim2.new(0, 37, 0.5, 0)
						TabButton.Image.Image = "rbxassetid://"..Image
						TabButton.Image.Visible = true
						TabButton.Title.TextXAlignment = Enum.TextXAlignment.Left
						TabButton.Size = UDim2.new(0, TabButton.Title.TextBounds.X + 52, 0, 30)
					end

					TabButton.BackgroundTransparency = 1
					TabButton.Title.TextTransparency = 1
					TabButton.Image.ImageTransparency = 1
					TabButton.UIStroke.Transparency = 1

					TabButton.Visible = true

					-- Create Elements Page
					local TabPage = Elements.Template:Clone()
					TabPage.Name = Name
					TabPage.Visible = true

					TabPage.LayoutOrder = #Elements:GetChildren()

					for _, TemplateElement in ipairs(TabPage:GetChildren()) do
						if TemplateElement.ClassName == "Frame" and TemplateElement.Name ~= "Placeholder" then
							TemplateElement:Destroy()
						end
					end

					TabPage.Parent = Elements
					if not FirstTab then
						Elements.UIPageLayout.Animated = false
						Elements.UIPageLayout:JumpTo(TabPage)
						Elements.UIPageLayout.Animated = true
					end

					TabButton.UIStroke.Color = SelectedTheme.TabStroke
					-- Animate
					task.wait(0.1)
					if FirstTab then
						TabButton.BackgroundColor3 = SelectedTheme.TabBackground
						TabButton.Image.ImageColor3 = SelectedTheme.TabTextColor
						TabButton.Title.TextColor3 = SelectedTheme.TabTextColor
						TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
						TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
						TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
						TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()

					else
						FirstTab = Name
						TabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
						TabButton.Image.ImageColor3 = SelectedTheme.SelectedTabTextColor
						TabButton.Title.TextColor3 = SelectedTheme.SelectedTabTextColor
						TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
						TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
					end


					TabButton.Interact.MouseButton1Click:Connect(function()
						if Minimised then return end
						TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
						TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
						TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.TabBackgroundSelected}):Play()
						TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextColor3 = SelectedTheme.SelectedTabTextColor}):Play()
						TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageColor3 = SelectedTheme.SelectedTabTextColor}):Play()

						for _, OtherTabButton in ipairs(TabList:GetChildren()) do
							if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TabButton and OtherTabButton.Name ~= "Placeholder" then
								TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.TabBackground}):Play()
								TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextColor3 = SelectedTheme.TabTextColor}):Play()
								TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageColor3 = SelectedTheme.TabTextColor}):Play()
								TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
								TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
								TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
								TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
							end
						end
						if Elements.UIPageLayout.CurrentPage ~= TabPage then
							Elements.UIPageLayout:JumpTo(TabPage)
						end

					end)

					local Tab = {}

					-- Button
					function Tab:CreateButton(ButtonSettings)
						local ButtonValue = {}

						local Button = Elements.Template.Button:Clone()
						Button.Name = ButtonSettings.Name
						Button.Title.Text = ButtonSettings.Name
						Button.Visible = true
						Button.Parent = TabPage

						Button.BackgroundTransparency = 1
						Button.UIStroke.Transparency = 1
						Button.Title.TextTransparency = 1

						TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	


						Button.Interact.MouseButton1Click:Connect(function()
							local Success, Response = pcall(ButtonSettings.Callback)
							if not Success then
								TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
								TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Button.Title.Text = "Callback Error"
								print("Rayfield | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
								warn('Check docs.sirius.menu for help with Rayfield specific development.')
								task.wait(0.5)
								Button.Title.Text = ButtonSettings.Name
								TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 0.9}):Play()
								TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
							else
								SaveConfiguration()
								TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
								TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
								TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								task.wait(0.2)
								TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 0.9}):Play()
								TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
							end
						end)

						Button.MouseEnter:Connect(function()
							TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
							TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 0.7}):Play()
						end)

						Button.MouseLeave:Connect(function()
							TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
							TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 0.9}):Play()
						end)

						function ButtonValue:Set(NewButton)
							Button.Title.Text = NewButton
							Button.Name = NewButton
						end

						return ButtonValue
					end

					-- ColorPicker
					function Tab:CreateColorPicker(ColorPickerSettings) -- by Throit
						ColorPickerSettings.Type = "ColorPicker"
						local ColorPicker = Elements.Template.ColorPicker:Clone()
						local Background = ColorPicker.CPBackground
						local Display = Background.Display
						local Main = Background.MainCP
						local Slider = ColorPicker.ColorSlider
						ColorPicker.ClipsDescendants = true
						ColorPicker.Name = ColorPickerSettings.Name
						ColorPicker.Title.Text = ColorPickerSettings.Name
						ColorPicker.Visible = true
						ColorPicker.Parent = TabPage
						ColorPicker.Size = UDim2.new(1, -10, 0, 45)
						Background.Size = UDim2.new(0, 39, 0, 22)
						Display.BackgroundTransparency = 0
						Main.MainPoint.ImageTransparency = 1
						ColorPicker.Interact.Size = UDim2.new(1, 0, 1, 0)
						ColorPicker.Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
						ColorPicker.RGB.Position = UDim2.new(0, 17, 0, 70)
						ColorPicker.HexInput.Position = UDim2.new(0, 17, 0, 90)
						Main.ImageTransparency = 1
						Background.BackgroundTransparency = 1
						
						for _, rgbinput in ipairs(ColorPicker.RGB:GetChildren()) do
							if rgbinput:IsA("Frame") then
								rgbinput.BackgroundColor3 = SelectedTheme.InputBackground
								rgbinput.UIStroke.Color = SelectedTheme.InputStroke
							end
						end
						
						ColorPicker.HexInput.BackgroundColor3 = SelectedTheme.InputBackground
						ColorPicker.HexInput.UIStroke.Color = SelectedTheme.InputStroke
						


						local opened = false 
						local mouse = game.Players.LocalPlayer:GetMouse()
						Main.Image = "http://www.roblox.com/asset/?id=11415645739"
						local mainDragging = false 
						local sliderDragging = false 
						ColorPicker.Interact.MouseButton1Down:Connect(function()
							task.spawn(function()
								TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
								TweenService:Create(ColorPicker.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								task.wait(0.2)
								TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(ColorPicker.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
							end)

							if not opened then
								opened = true 
								TweenService:Create(Background, TweenInfo.new(0.45, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 18, 0, 15)}):Play()
								task.wait(0.1)
								TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 120)}):Play()
								TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 173, 0, 86)}):Play()
								TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
								TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.289, 0, 0.5, 0)}):Play()
								TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.8, Enum.EasingStyle.Exponential), {Position = UDim2.new(0, 17, 0, 40)}):Play()
								TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Position = UDim2.new(0, 17, 0, 73)}):Play()
								TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0.574, 0, 1, 0)}):Play()
								TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
								TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {ImageTransparency = SelectedTheme ~= RayfieldLibrary.Theme.Default and 0.25 or 0.1}):Play()
								TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
							else
								opened = false
								TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 45)}):Play()
								TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 39, 0, 22)}):Play()
								TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 1, 0)}):Play()
								TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
								TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Position = UDim2.new(0, 17, 0, 70)}):Play()
								TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Position = UDim2.new(0, 17, 0, 90)}):Play()
								TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
								TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
								TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
								TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
							end
							
						end)

						UserInputService.InputEnded:Connect(function(input, gameProcessed) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
								mainDragging = false
								sliderDragging = false
							end end)
						Main.MouseButton1Down:Connect(function()
							if opened then
								mainDragging = true 
							end
						end)
						Main.MainPoint.MouseButton1Down:Connect(function()
							if opened then
								mainDragging = true 
							end
						end)
						Slider.MouseButton1Down:Connect(function()
							sliderDragging = true 
						end)
						Slider.SliderPoint.MouseButton1Down:Connect(function()
							sliderDragging = true 
						end)
						local h,s,v = ColorPickerSettings.Color:ToHSV()
						local color = Color3.fromHSV(h,s,v) 
						local hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
						ColorPicker.HexInput.InputBox.Text = hex
						local function setDisplay()
							--Main
							Main.MainPoint.Position = UDim2.new(s,-Main.MainPoint.AbsoluteSize.X/2,1-v,-Main.MainPoint.AbsoluteSize.Y/2)
							Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
							Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
							Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
							--Slider 
							local x = h * Slider.AbsoluteSize.X
							Slider.SliderPoint.Position = UDim2.new(0,x-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
							Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
							local color = Color3.fromHSV(h,s,v) 
							local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
							ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
							ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
							ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
							hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
							ColorPicker.HexInput.InputBox.Text = hex
						end
						setDisplay()
						ColorPicker.HexInput.InputBox.FocusLost:Connect(function()
							if not pcall(function()
									local r, g, b = string.match(ColorPicker.HexInput.InputBox.Text, "^#?(%w%w)(%w%w)(%w%w)$")
									local rgbColor = Color3.fromRGB(tonumber(r, 16),tonumber(g, 16), tonumber(b, 16))
									h,s,v = rgbColor:ToHSV()
									hex = ColorPicker.HexInput.InputBox.Text
									setDisplay()
									ColorPickerSettings.Color = rgbColor
								end) 
							then 
								ColorPicker.HexInput.InputBox.Text = hex 
							end
							pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
							local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
							ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
							SaveConfiguration()
						end)
						--RGB
						local function rgbBoxes(box,toChange)
							local value = tonumber(box.Text) 
							local color = Color3.fromHSV(h,s,v) 
							local oldR,oldG,oldB = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
							local save 
							if toChange == "R" then save = oldR;oldR = value elseif toChange == "G" then save = oldG;oldG = value else save = oldB;oldB = value end
							if value then 
								value = math.clamp(value,0,255)
								h,s,v = Color3.fromRGB(oldR,oldG,oldB):ToHSV()

								setDisplay()
							else 
								box.Text = tostring(save)
							end
							local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
							ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
							SaveConfiguration()
						end
						ColorPicker.RGB.RInput.InputBox.FocusLost:connect(function()
							rgbBoxes(ColorPicker.RGB.RInput.InputBox,"R")
							pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
						end)
						ColorPicker.RGB.GInput.InputBox.FocusLost:connect(function()
							rgbBoxes(ColorPicker.RGB.GInput.InputBox,"G")
							pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
						end)
						ColorPicker.RGB.BInput.InputBox.FocusLost:connect(function()
							rgbBoxes(ColorPicker.RGB.BInput.InputBox,"B")
							pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
						end)

						RunService.RenderStepped:connect(function()
							if mainDragging then 
								local localX = math.clamp(mouse.X-Main.AbsolutePosition.X,0,Main.AbsoluteSize.X)
								local localY = math.clamp(mouse.Y-Main.AbsolutePosition.Y,0,Main.AbsoluteSize.Y)
								Main.MainPoint.Position = UDim2.new(0,localX-Main.MainPoint.AbsoluteSize.X/2,0,localY-Main.MainPoint.AbsoluteSize.Y/2)
								s = localX / Main.AbsoluteSize.X
								v = 1 - (localY / Main.AbsoluteSize.Y)
								Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
								Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
								Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
								local color = Color3.fromHSV(h,s,v) 
								local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
								ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
								ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
								ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
								ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
								pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
								ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
								SaveConfiguration()
							end
							if sliderDragging then 
								local localX = math.clamp(mouse.X-Slider.AbsolutePosition.X,0,Slider.AbsoluteSize.X)
								h = localX / Slider.AbsoluteSize.X
								Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
								Slider.SliderPoint.Position = UDim2.new(0,localX-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
								Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
								Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
								Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
								local color = Color3.fromHSV(h,s,v) 
								local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
								ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
								ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
								ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
								ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
								pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
								ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
								SaveConfiguration()
							end
						end)

						if Settings.ConfigurationSaving then
							if Settings.ConfigurationSaving.Enabled and ColorPickerSettings.Flag then
								RayfieldLibrary.Flags[ColorPickerSettings.Flag] = ColorPickerSettings
							end
						end

						function ColorPickerSettings:Set(RGBColor)
							ColorPickerSettings.Color = RGBColor
							h,s,v = ColorPickerSettings.Color:ToHSV()
							color = Color3.fromHSV(h,s,v)
							setDisplay()
						end

						ColorPicker.MouseEnter:Connect(function()
							TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
						end)

						ColorPicker.MouseLeave:Connect(function()
							TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
						end)

						return ColorPickerSettings
					end

					-- Section
					function Tab:CreateSection(SectionName)

						local SectionValue = {}

						if SDone then
							local SectionSpace = Elements.Template.SectionSpacing:Clone()
							SectionSpace.Visible = true
							SectionSpace.Parent = TabPage
						end

						local Section = Elements.Template.SectionTitle:Clone()
						Section.Title.Text = SectionName
						Section.Visible = true
						Section.Parent = TabPage

						Section.Title.TextTransparency = 1
						TweenService:Create(Section.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()

						function SectionValue:Set(NewSection)
							Section.Title.Text = NewSection
						end

						SDone = true

						return SectionValue
					end

					-- Label
					function Tab:CreateLabel(LabelText)
						local LabelValue = {}

						local Label = Elements.Template.Label:Clone()
						Label.Title.Text = LabelText
						Label.Visible = true
						Label.Parent = TabPage

						Label.BackgroundTransparency = 1
						Label.UIStroke.Transparency = 1
						Label.Title.TextTransparency = 1

						Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
						Label.UIStroke.Color = SelectedTheme.SecondaryElementStroke

						TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						TweenService:Create(Label.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

						function LabelValue:Set(NewLabel)
							Label.Title.Text = NewLabel
						end

						return LabelValue
					end

					-- Paragraph
					function Tab:CreateParagraph(ParagraphSettings)
						local ParagraphValue = {}

						local Paragraph = Elements.Template.Paragraph:Clone()
						Paragraph.Title.Text = ParagraphSettings.Title
						Paragraph.Content.Text = ParagraphSettings.Content
						Paragraph.Visible = true
						Paragraph.Parent = TabPage

						Paragraph.BackgroundTransparency = 1
						Paragraph.UIStroke.Transparency = 1
						Paragraph.Title.TextTransparency = 1
						Paragraph.Content.TextTransparency = 1

						Paragraph.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
						Paragraph.UIStroke.Color = SelectedTheme.SecondaryElementStroke

						TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	
						TweenService:Create(Paragraph.Content, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

						function ParagraphValue:Set(NewParagraphSettings)
							Paragraph.Title.Text = NewParagraphSettings.Title
							Paragraph.Content.Text = NewParagraphSettings.Content
						end

						return ParagraphValue
					end

					-- Input
					function Tab:CreateInput(InputSettings)
						local Input = Elements.Template.Input:Clone()
						Input.Name = InputSettings.Name
						Input.Title.Text = InputSettings.Name
						Input.Visible = true
						Input.Parent = TabPage

						Input.BackgroundTransparency = 1
						Input.UIStroke.Transparency = 1
						Input.Title.TextTransparency = 1

						Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
						Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke

						TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						TweenService:Create(Input.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

						Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText
						Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)

						Input.InputFrame.InputBox.FocusLost:Connect(function()


							local Success, Response = pcall(function()
								InputSettings.Callback(Input.InputFrame.InputBox.Text)
							end)
							if not Success then
								TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Input.Title.Text = "Callback Error"
								print("Rayfield | "..InputSettings.Name.." Callback Error " ..tostring(Response))
								warn('Check docs.sirius.menu for help with Rayfield specific development.')
								task.wait(0.5)
								Input.Title.Text = InputSettings.Name
								TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
							end

							if InputSettings.RemoveTextAfterFocusLost then
								Input.InputFrame.InputBox.Text = ""
							end
							SaveConfiguration()
						end)

						Input.MouseEnter:Connect(function()
							TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
						end)

						Input.MouseLeave:Connect(function()
							TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
						end)

						Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
							TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)}):Play()
						end)

						local InputSettings = {}
						function InputSettings:Set(text) --Doesnt fire the event
							Input.InputFrame.InputBox.Text = text
						end
						return InputSettings
					end

					-- Dropdown
					function Tab:CreateDropdown(DropdownSettings)
						local Dropdown = Elements.Template.Dropdown:Clone()
						if string.find(DropdownSettings.Name,"closed") then
							Dropdown.Name = "Dropdown"
						else
							Dropdown.Name = DropdownSettings.Name
						end
						Dropdown.Title.Text = DropdownSettings.Name
						Dropdown.Visible = true
						Dropdown.Parent = TabPage

						Dropdown.List.Visible = false
						if DropdownSettings.CurrentOption then
							if type(DropdownSettings.CurrentOption) == "string" then
								DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption}
							end
							if not DropdownSettings.MultipleOptions and type(DropdownSettings.CurrentOption) == "table" then
								DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption[1]}
							end
						else
							DropdownSettings.CurrentOption = {}
						end

						if DropdownSettings.MultipleOptions then
							if DropdownSettings.CurrentOption and type(DropdownSettings.CurrentOption) == "table" then
								if #DropdownSettings.CurrentOption == 1 then
									Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
								elseif #DropdownSettings.CurrentOption == 0 then
									Dropdown.Selected.Text = "None"
								else
									Dropdown.Selected.Text = "Various"
								end
							else
								DropdownSettings.CurrentOption = {}
								Dropdown.Selected.Text = "None"
							end
						else
							Dropdown.Selected.Text = DropdownSettings.CurrentOption[1] or "None"
						end


						Dropdown.BackgroundTransparency = 1
						Dropdown.UIStroke.Transparency = 1
						Dropdown.Title.TextTransparency = 1
						Dropdown.Toggle.ImageColor3 = SelectedTheme.TextColor

						Dropdown.Size = UDim2.new(1, -10, 0, 45)

						TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						TweenService:Create(Dropdown.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

						for _, ununusedoption in ipairs(Dropdown.List:GetChildren()) do
							if ununusedoption.ClassName == "Frame" and ununusedoption.Name ~= "Placeholder" then
								ununusedoption:Destroy()
							end
						end

						Dropdown.Toggle.Rotation = 180

						Dropdown.Interact.MouseButton1Click:Connect(function()
							TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
							TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
							task.wait(0.1)
							TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
							TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
							if Debounce then return end
							if Dropdown.List.Visible then
								Debounce = true
								TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 45)}):Play()
								for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
									if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
										TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
										TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
									end
								end
								TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ScrollBarImageTransparency = 1}):Play()
								TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Rotation = 180}):Play()	
								task.wait(0.35)
								Dropdown.List.Visible = false
								Debounce = false
							else
								TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 180)}):Play()
								Dropdown.List.Visible = true
								TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ScrollBarImageTransparency = 0.7}):Play()
								TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Rotation = 0}):Play()	
								for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
									if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
										TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
										TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
										TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
									end
								end
							end
						end)

						Dropdown.MouseEnter:Connect(function()
							if not Dropdown.List.Visible then
								TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
							end
						end)

						Dropdown.MouseLeave:Connect(function()
							TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
						end)

						local function SetDropdownOptions()
							for _, Option in ipairs(DropdownSettings.Options) do
								local DropdownOption = Elements.Template.Dropdown.List.Template:Clone()
								DropdownOption.Name = Option
								DropdownOption.Title.Text = Option
								DropdownOption.Parent = Dropdown.List
								DropdownOption.Visible = true
								
								DropdownOption.UIStroke.Color = SelectedTheme.ElementStroke

								DropdownOption.BackgroundColor3 = DropdownSettings.CurrentOption == Option and SelectedTheme.DropdownSelected or SelectedTheme.DropdownUnselected

								DropdownOption.BackgroundTransparency = 1
								DropdownOption.UIStroke.Transparency = 1
								DropdownOption.Title.TextTransparency = 1

								--local Dropdown = Tab:CreateDropdown({
								--	Name = "Dropdown Example",
								--	Options = {"Option 1","Option 2"},
								--	CurrentOption = {"Option 1"},
								--  MultipleOptions = true,
								--	Flag = "Dropdown1",
								--	Callback = function(TableOfOptions)

								--	end,
								--})


								DropdownOption.Interact.ZIndex = 50
								DropdownOption.Interact.MouseButton1Click:Connect(function()
									if not DropdownSettings.MultipleOptions and table.find(DropdownSettings.CurrentOption, Option) then 
										return
									end

									if table.find(DropdownSettings.CurrentOption, Option) then
										table.remove(DropdownSettings.CurrentOption, table.find(DropdownSettings.CurrentOption, Option))
										if DropdownSettings.MultipleOptions then
											if #DropdownSettings.CurrentOption == 1 then
												Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
											elseif #DropdownSettings.CurrentOption == 0 then
												Dropdown.Selected.Text = "None"
											else
												Dropdown.Selected.Text = "Various"
											end
										else
											Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
										end
									else
										if not DropdownSettings.MultipleOptions then
											table.clear(DropdownSettings.CurrentOption)
										end
										table.insert(DropdownSettings.CurrentOption, Option)
										if DropdownSettings.MultipleOptions then
											if #DropdownSettings.CurrentOption == 1 then
												Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
											elseif #DropdownSettings.CurrentOption == 0 then
												Dropdown.Selected.Text = "None"
											else
												Dropdown.Selected.Text = "Various"
											end
										else
											Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
										end
										TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.DropdownSelected}):Play()
										Debounce = true
										task.wait(0.2)
										TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
									end


									local Success, Response = pcall(function()
										DropdownSettings.Callback(DropdownSettings.CurrentOption)
									end)

									if not Success then
										TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
										TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										Dropdown.Title.Text = "Callback Error"
										print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
										warn('Check docs.sirius.menu for help with Rayfield specific development.')
										task.wait(0.5)
										Dropdown.Title.Text = DropdownSettings.Name
										TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
										TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
									end

									for _, droption in ipairs(Dropdown.List:GetChildren()) do
										if droption.ClassName == "Frame" and droption.Name ~= "Placeholder" and not table.find(DropdownSettings.CurrentOption, droption.Name) then
											TweenService:Create(droption, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.DropdownUnselected}):Play()
										end
									end
									if not DropdownSettings.MultipleOptions then
										task.wait(0.1)
										TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 45)}):Play()
										for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
											if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
												TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
												TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
												TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
											end
										end
										TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ScrollBarImageTransparency = 1}):Play()
										TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Rotation = 180}):Play()	
										task.wait(0.35)
										Dropdown.List.Visible = false
									end
									Debounce = false
									SaveConfiguration()
								end)
							end
						end
						SetDropdownOptions()

						for _, droption in ipairs(Dropdown.List:GetChildren()) do
							if droption.ClassName == "Frame" and droption.Name ~= "Placeholder" then
								if not table.find(DropdownSettings.CurrentOption, droption.Name) then
									droption.BackgroundColor3 = SelectedTheme.DropdownUnselected
								else
									droption.BackgroundColor3 = SelectedTheme.DropdownSelected
								end
							end
						end

						function DropdownSettings:Set(NewOption)
							DropdownSettings.CurrentOption = NewOption

							if typeof(DropdownSettings.CurrentOption) == "string" then
								DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption}
							end

							if not DropdownSettings.MultipleOptions then
								DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption[1]}
							end

							if DropdownSettings.MultipleOptions then
								if #DropdownSettings.CurrentOption == 1 then
									Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
								elseif #DropdownSettings.CurrentOption == 0 then
									Dropdown.Selected.Text = "None"
								else
									Dropdown.Selected.Text = "Various"
								end
							else
								Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
							end


							local Success, Response = pcall(function()
								DropdownSettings.Callback(NewOption)
							end)
							if not Success then
								TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Dropdown.Title.Text = "Callback Error"
								print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
								warn('Check docs.sirius.menu for help with Rayfield specific development.')
								task.wait(0.5)
								Dropdown.Title.Text = DropdownSettings.Name
								TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
							end

							for _, droption in ipairs(Dropdown.List:GetChildren()) do
								if droption.ClassName == "Frame" and droption.Name ~= "Placeholder" then
									if not table.find(DropdownSettings.CurrentOption, droption.Name) then
										droption.BackgroundColor3 = SelectedTheme.DropdownUnselected
									else
										droption.BackgroundColor3 = SelectedTheme.DropdownSelected
									end
								end
							end
							--SaveConfiguration()
						end

						function DropdownSettings:Refresh(optionsTable: table) -- updates a dropdown with new options from optionsTable
							DropdownSettings.Options = optionsTable
							for _, option in Dropdown.List:GetChildren() do
								if option.ClassName == "Frame" and option.Name ~= "Placeholder" then
									option:Destroy()
								end
							end
							SetDropdownOptions()
						end

						if Settings.ConfigurationSaving then
							if Settings.ConfigurationSaving.Enabled and DropdownSettings.Flag then
								RayfieldLibrary.Flags[DropdownSettings.Flag] = DropdownSettings
							end
						end

						return DropdownSettings
					end

					-- Keybind
					function Tab:CreateKeybind(KeybindSettings)
						local CheckingForKey = false
						local Keybind = Elements.Template.Keybind:Clone()
						Keybind.Name = KeybindSettings.Name
						Keybind.Title.Text = KeybindSettings.Name
						Keybind.Visible = true
						Keybind.Parent = TabPage

						Keybind.BackgroundTransparency = 1
						Keybind.UIStroke.Transparency = 1
						Keybind.Title.TextTransparency = 1

						Keybind.KeybindFrame.BackgroundColor3 = SelectedTheme.InputBackground
						Keybind.KeybindFrame.UIStroke.Color = SelectedTheme.InputStroke

						TweenService:Create(Keybind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						TweenService:Create(Keybind.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

						Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
						Keybind.KeybindFrame.Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)

						Keybind.KeybindFrame.KeybindBox.Focused:Connect(function()
							CheckingForKey = true
							Keybind.KeybindFrame.KeybindBox.Text = ""
						end)
						Keybind.KeybindFrame.KeybindBox.FocusLost:Connect(function()
							CheckingForKey = false
							if Keybind.KeybindFrame.KeybindBox.Text == nil or "" then
								Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
								SaveConfiguration()
							end
						end)

						Keybind.MouseEnter:Connect(function()
							TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
						end)

						Keybind.MouseLeave:Connect(function()
							TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
						end)

						UserInputService.InputBegan:Connect(function(input, processed)

							if CheckingForKey then
								if input.KeyCode ~= Enum.KeyCode.Unknown then
									if input.KeyCode == Enum.KeyCode.K then
										Keybind.KeybindFrame.KeybindBox.Text = ""
										KeybindSettings.CurrentKeybind = ""
									else
										local SplitMessage = string.split(tostring(input.KeyCode), ".")
										local NewKeyNoEnum = SplitMessage[3]
										Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeyNoEnum)
										KeybindSettings.CurrentKeybind = tostring(NewKeyNoEnum)
										Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
										SaveConfiguration()
									end
								end
							elseif KeybindSettings.CurrentKeybind ~= "" and KeybindSettings.CurrentKeybind ~= nil then -- Test
								local current_keybind = ''
								local success, respone = pcall(function()
									current_keybind = Enum.KeyCode[KeybindSettings.CurrentKeybind]
								end)
								if not success then
									return
								end
								if (input.KeyCode ~= current_keybind or processed) then
									return
								end
								local Held = true
								local Connection
								Connection = input.Changed:Connect(function(prop)
									if prop == "UserInputState" then
										Connection:Disconnect()
										Held = false
									end
								end)

								if not KeybindSettings.HoldToInteract then
									local Success, Response = pcall(KeybindSettings.Callback)
									if not Success then
										TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
										TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										Keybind.Title.Text = "Callback Error"
										print("Rayfield | "..KeybindSettings.Name.." Callback Error " ..tostring(Response))
										warn('Check docs.sirius.menu for help with Rayfield specific development.')
										task.wait(0.5)
										Keybind.Title.Text = KeybindSettings.Name
										TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
										TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
									end
								else
									task.wait(0.25)
									if Held then
										local Loop; Loop = RunService.Stepped:Connect(function()
											if not Held then
												KeybindSettings.Callback(false) -- maybe pcall this
												Loop:Disconnect()
											else
												KeybindSettings.Callback(true) -- maybe pcall this
											end
										end)
									end
								end
							end
						end)

						Keybind.KeybindFrame.KeybindBox:GetPropertyChangedSignal("Text"):Connect(function()
							TweenService:Create(Keybind.KeybindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)}):Play()
						end)

						function KeybindSettings:Set(NewKeybind)
							Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeybind)
							KeybindSettings.CurrentKeybind = tostring(NewKeybind)
							Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
							SaveConfiguration()
						end
						if Settings.ConfigurationSaving then
							if Settings.ConfigurationSaving.Enabled and KeybindSettings.Flag then
								RayfieldLibrary.Flags[KeybindSettings.Flag] = KeybindSettings
							end
						end
						return KeybindSettings
					end

					-- Toggle
					function Tab:CreateToggle(ToggleSettings)
						local ToggleValue = {}

						local Toggle = Elements.Template.Toggle:Clone()
						Toggle.Name = ToggleSettings.Name
						Toggle.Title.Text = ToggleSettings.Name
						Toggle.Visible = true
						Toggle.Parent = TabPage

						Toggle.BackgroundTransparency = 1
						Toggle.UIStroke.Transparency = 1
						Toggle.Title.TextTransparency = 1
						Toggle.Switch.BackgroundColor3 = SelectedTheme.ToggleBackground

						if SelectedTheme ~= RayfieldLibrary.Theme.Default then
							Toggle.Switch.Shadow.Visible = false
						end

						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

						if not ToggleSettings.CurrentValue then
							Toggle.Switch.Indicator.Position = UDim2.new(1, -40, 0.5, 0)
							Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
							Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
							Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
						else
							Toggle.Switch.Indicator.Position = UDim2.new(1, -20, 0.5, 0)
							Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
							Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
							Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
						end

						Toggle.MouseEnter:Connect(function()
							TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
						end)

						Toggle.MouseLeave:Connect(function()
							TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
						end)

						Toggle.Interact.MouseButton1Click:Connect(function()
							if ToggleSettings.CurrentValue then
								ToggleSettings.CurrentValue = false
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
								TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
								TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
								task.wait(0.05)
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
								task.wait(0.15)
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()	
							else
								ToggleSettings.CurrentValue = true
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
								TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
								TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
								task.wait(0.05)
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()	
								task.wait(0.15)
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()		
							end

							local Success, Response = pcall(function()
								ToggleSettings.Callback(ToggleSettings.CurrentValue)
							end)
							if not Success then
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Toggle.Title.Text = "Callback Error"
								print("Rayfield | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
								warn('Check docs.sirius.menu for help with Rayfield specific development.')
								task.wait(0.5)
								Toggle.Title.Text = ToggleSettings.Name
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
							end


							SaveConfiguration()
						end)

						function ToggleSettings:Set(NewToggleValue)
							if NewToggleValue then
								ToggleSettings.CurrentValue = true
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
								TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
								TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
								task.wait(0.05)
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()	
								task.wait(0.15)
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()	
							else
								ToggleSettings.CurrentValue = false
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
								TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
								TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
								task.wait(0.05)
								TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
								task.wait(0.15)
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()	
							end
							local Success, Response = pcall(function()
								ToggleSettings.Callback(ToggleSettings.CurrentValue)
							end)
							if not Success then
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Toggle.Title.Text = "Callback Error"
								print("Rayfield | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
								warn('Check docs.sirius.menu for help with Rayfield specific development.')
								task.wait(0.5)
								Toggle.Title.Text = ToggleSettings.Name
								TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
							end
							SaveConfiguration()
						end

						if Settings.ConfigurationSaving then
							if Settings.ConfigurationSaving.Enabled and ToggleSettings.Flag then
								RayfieldLibrary.Flags[ToggleSettings.Flag] = ToggleSettings
							end
						end

						return ToggleSettings
					end

					-- Slider
					function Tab:CreateSlider(SliderSettings)
						local Dragging = false
						local Slider = Elements.Template.Slider:Clone()
						Slider.Name = SliderSettings.Name
						Slider.Title.Text = SliderSettings.Name
						Slider.Visible = true
						Slider.Parent = TabPage

						Slider.BackgroundTransparency = 1
						Slider.UIStroke.Transparency = 1
						Slider.Title.TextTransparency = 1

						if SelectedTheme ~= RayfieldLibrary.Theme.Default then
							Slider.Main.Shadow.Visible = false
						end

						Slider.Main.BackgroundColor3 = SelectedTheme.SliderBackground
						Slider.Main.UIStroke.Color = SelectedTheme.SliderStroke
						Slider.Main.Progress.UIStroke.Color = SelectedTheme.SliderStroke
						Slider.Main.Progress.BackgroundColor3 = SelectedTheme.SliderProgress

						TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						TweenService:Create(Slider.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

						Slider.Main.Progress.Size =	UDim2.new(0, Slider.Main.AbsoluteSize.X * ((SliderSettings.CurrentValue + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (SliderSettings.CurrentValue / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)

						if not SliderSettings.Suffix then
							Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue)
						else
							Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue) .. " " .. SliderSettings.Suffix
						end


						Slider.MouseEnter:Connect(function()
							TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
						end)

						Slider.MouseLeave:Connect(function()
							TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
						end)

						Slider.Main.Interact.InputBegan:Connect(function(Input)
							if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
								TweenService:Create(Slider.Main.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								TweenService:Create(Slider.Main.Progress.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Dragging = true 
							end 
						end)

						Slider.Main.Interact.InputEnded:Connect(function(Input) 
							if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
								TweenService:Create(Slider.Main.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0.4}):Play()
								TweenService:Create(Slider.Main.Progress.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0.3}):Play()
								Dragging = false 
							end 
						end)

						Slider.Main.Interact.MouseButton1Down:Connect(function(X)
							local Current = Slider.Main.Progress.AbsolutePosition.X + Slider.Main.Progress.AbsoluteSize.X
							local Start = Current
							local Location = X
							local Loop; Loop = RunService.Stepped:Connect(function()
								if Dragging then
									Location = UserInputService:GetMouseLocation().X
									Current = Current + 0.025 * (Location - Start)

									if Location < Slider.Main.AbsolutePosition.X then
										Location = Slider.Main.AbsolutePosition.X
									elseif Location > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
										Location = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
									end

									if Current < Slider.Main.AbsolutePosition.X + 5 then
										Current = Slider.Main.AbsolutePosition.X + 5
									elseif Current > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
										Current = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
									end

									if Current <= Location and (Location - Start) < 0 then
										Start = Location
									elseif Current >= Location and (Location - Start) > 0 then
										Start = Location
									end
									TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Current - Slider.Main.AbsolutePosition.X, 1, 0)}):Play()
									local NewValue = SliderSettings.Range[1] + (Location - Slider.Main.AbsolutePosition.X) / Slider.Main.AbsoluteSize.X * (SliderSettings.Range[2] - SliderSettings.Range[1])

									NewValue = math.floor(NewValue / SliderSettings.Increment + 0.5) * (SliderSettings.Increment * 10000000) / 10000000
									if not SliderSettings.Suffix then
										Slider.Main.Information.Text = tostring(NewValue)
									else
										Slider.Main.Information.Text = tostring(NewValue) .. " " .. SliderSettings.Suffix
									end

									if SliderSettings.CurrentValue ~= NewValue then
										local Success, Response = pcall(function()
											SliderSettings.Callback(NewValue)
										end)
										if not Success then
											TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
											TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
											Slider.Title.Text = "Callback Error"
											print("Rayfield | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
											warn('Check docs.sirius.menu for help with Rayfield specific development.')
											task.wait(0.5)
											Slider.Title.Text = SliderSettings.Name
											TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
											TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
										end

										SliderSettings.CurrentValue = NewValue
										SaveConfiguration()
									end
								else
									TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Location - Slider.Main.AbsolutePosition.X > 5 and Location - Slider.Main.AbsolutePosition.X or 5, 1, 0)}):Play()
									Loop:Disconnect()
								end
							end)
						end)

						function SliderSettings:Set(NewVal)
							TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Slider.Main.AbsoluteSize.X * ((NewVal + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (NewVal / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)}):Play()
							Slider.Main.Information.Text = tostring(NewVal) .. " " .. (SliderSettings.Suffix or "")
							local Success, Response = pcall(function()
								SliderSettings.Callback(NewVal)
							end)
							if not Success then
								TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Slider.Title.Text = "Callback Error"
								print("Rayfield | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
								warn('Check docs.sirius.menu for help with Rayfield specific development.')
								task.wait(0.5)
								Slider.Title.Text = SliderSettings.Name
								TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
							end
							SliderSettings.CurrentValue = NewVal
							SaveConfiguration()
						end
						if Settings.ConfigurationSaving then
							if Settings.ConfigurationSaving.Enabled and SliderSettings.Flag then
								RayfieldLibrary.Flags[SliderSettings.Flag] = SliderSettings
							end
						end
						return SliderSettings
					end


					return Tab
				end

				Elements.Visible = true

				task.wait(0.7)
				TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
				TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
				TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
				task.wait(0.2)
				TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Size = useMobileSizing and UDim2.new(0, 500, 0, 275) or UDim2.new(0, 500, 0, 475)}):Play()
				TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.6}):Play()

				Topbar.BackgroundTransparency = 1
				Topbar.Divider.Size = UDim2.new(0, 0, 0, 1)
				Topbar.Divider.BackgroundColor3 = SelectedTheme.ElementStroke
				Topbar.CornerRepair.BackgroundTransparency = 1
				Topbar.Title.TextTransparency = 1
				Topbar.Search.ImageTransparency = 1
				Topbar.ChangeSize.ImageTransparency = 1
				Topbar.Hide.ImageTransparency = 1

				task.wait(0.5)
				Topbar.Visible = true
				TweenService:Create(Topbar, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				task.wait(0.1)
				TweenService:Create(Topbar.Divider, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 0, 1)}):Play()
				task.wait(0.1)
				TweenService:Create(Topbar.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
				task.wait(0.1)
				TweenService:Create(Topbar.Search, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
				task.wait(0.1)
				TweenService:Create(Topbar.ChangeSize, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
				task.wait(0.1)
				TweenService:Create(Topbar.Hide, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
				task.wait(0.3)

				return Window
			end

			local function setVisibility(visibility: boolean, notify: boolean?)
				if Debounce then return end
				if visibility then
					Hidden = false
					Unhide()
				else
					Hidden = true
					Hide(notify)
				end
			end

			function RayfieldLibrary:SetVisibility(visibility: boolean)
				setVisibility(visibility, false)
			end

			function RayfieldLibrary:IsVisible(): boolean
				return not Hidden
			end

			function RayfieldLibrary:Destroy()
				Rayfield:Destroy()
			end

			Topbar.ChangeSize.MouseButton1Click:Connect(function()
				if Debounce then return end
				if Minimised then
					Minimised = false
					Maximise()
				else
					Minimised = true
					Minimise()
				end
			end)

			Main.Search.Input:GetPropertyChangedSignal('Text'):Connect(function()

				if #Main.Search.Input.Text > 0 then
					if not Elements.UIPageLayout.CurrentPage:FindFirstChild('SearchTitle-fsefsefesfsefesfesfThanks') then 
						local searchTitle = Elements.Template.SectionTitle:Clone()
						searchTitle.Parent = Elements.UIPageLayout.CurrentPage
						searchTitle.Name = 'SearchTitle-fsefsefesfsefesfesfThanks'
						searchTitle.LayoutOrder = -100
						searchTitle.Title.Text = "Results from '"..Elements.UIPageLayout.CurrentPage.Name.."'"
						searchTitle.Visible = true
					end
				else
					local searchTitle = Elements.UIPageLayout.CurrentPage:FindFirstChild('SearchTitle-fsefsefesfsefesfesfThanks')

					if searchTitle then
						searchTitle:Destroy()
					end
				end

				for _, element in ipairs(Elements.UIPageLayout.CurrentPage:GetChildren()) do
					if element.ClassName ~= 'UIListLayout' and element.Name ~= 'Placeholder' and element.Name ~= 'SearchTitle-fsefsefesfsefesfesfThanks' then
						if element.Name == 'SectionTitle' then
							if #Main.Search.Input.Text == 0 then
								element.Visible = true
							else
								element.Visible = false
							end
						else
							if string.lower(element.Name):find(string.lower(Main.Search.Input.Text), 1, true) then
								element.Visible = true
							else
								element.Visible = false
							end
						end
					end
				end
			end)

			Main.Search.Input.FocusLost:Connect(function(enterPressed)
				if #Main.Search.Input.Text == 0 and searchOpen then
					task.wait(0.12)
					closeSearch()
				end
			end)

			Topbar.Search.MouseButton1Click:Connect(function()
				task.spawn(function()
					if searchOpen then
						closeSearch()
					else
						openSearch()
					end
				end)
			end)


			Topbar.Hide.MouseButton1Click:Connect(function()
				setVisibility(Hidden, not useMobileSizing)
			end)

			UserInputService.InputBegan:Connect(function(input, processed)
				if (input.KeyCode == Enum.KeyCode.K and not processed) then
					if Debounce then return end
					if Hidden then
						Hidden = false
						Unhide()
					else
						Hidden = true
						Hide()
					end
				end
			end)

			if MPrompt then
				MPrompt.Interact.MouseButton1Click:Connect(function()
					if Debounce then return end
					if Hidden then
						Hidden = false
						Unhide()
					end
				end)
			end

			for _, TopbarButton in ipairs(Topbar:GetChildren()) do
				if TopbarButton.ClassName == "ImageButton" then
					TopbarButton.MouseEnter:Connect(function()
						TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
					end)

					TopbarButton.MouseLeave:Connect(function()
						TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
					end)
				end
			end


			function RayfieldLibrary:LoadConfiguration()
				if CEnabled then
					pcall(function()
						if isfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension) then
							LoadConfiguration(readfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension))
							RayfieldLibrary:Notify({Title = "Configuration Loaded", Content = "The configuration file for this script has been loaded from a previous session."})
						end
					end)
				end
			end

			if useStudio then
				-- run w/ studio
				-- Feel free to place your own script here to see how it'd work in Roblox Studio before running it on your execution software.

				local Window = RayfieldLibrary:CreateWindow({
					Name = "Rayfield Example Window",
					LoadingTitle = "Rayfield Interface Suite",
					Theme = 'DarkBlue',
					LoadingSubtitle = "by Sirius",
					ConfigurationSaving = {
						Enabled = true,
						FolderName = nil, -- Create a custom folder for your hub/game
						FileName = "Big Hub"
					},
					Discord = {
						Enabled = false,
						Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
						RememberJoins = true -- Set this to false to make them join the discord every time they load it up
					},
					KeySystem = false, -- Set this to true to use our key system
					KeySettings = {
						Title = "Untitled",
						Subtitle = "Key System",
						Note = "No method of obtaining the key is provided",
						FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
						SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
						GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
						Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
					}
				})

				local Tab = Window:CreateTab("Tab Example", 4483362458) -- Title, Image
				local Tab2 = Window:CreateTab("Tab Example 2", 4483362458) -- Title, Image

				local Section = Tab2:CreateSection("Section")

				local ColorPicker = Tab2:CreateColorPicker({
					Name = "Color Picker",
					Color = Color3.fromRGB(255,255,255),
					Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
					Callback = function(Value)
						-- The function that takes place every time the color picker is moved/changed
						-- The variable (Value) is a Color3fromRGB value based on which color is selected
					end
				})

				local Slider = Tab2:CreateSlider({
					Name = "Slider Example",
					Range = {0, 100},
					Increment = 10,
					Suffix = "Bananas",
					CurrentValue = 40,
					Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
					Callback = function(Value)
						-- The function that takes place when the slider changes
						-- The variable (Value) is a number which correlates to the value the slider is currently at
					end,
				})

				local Input = Tab2:CreateInput({
					Name = "Input Example",
					PlaceholderText = "Input Placeholder",
					RemoveTextAfterFocusLost = false,
					Callback = function(Text)
						-- The function that takes place when the input is changed
						-- The variable (Text) is a string for the value in the text box
					end,
				})

				RayfieldLibrary:Notify({Title = "Rayfield Interface", Content = "Welcome to Rayfield. These - are the brand new notification design for Rayfield, with custom sizing and Rayfield calculated wait times.", Image = 4483362458})

				local Section = Tab:CreateSection("Section Example")

				local Button = Tab:CreateButton({
					Name = "Button Example",
					Callback = function()
						-- The function that takes place when the button is pressed
					end,
				})

				local Toggle = Tab:CreateToggle({
					Name = "Toggle Example",
					CurrentValue = false,
					Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
					Callback = function(Value)
						-- The function that takes place when the toggle is pressed
						-- The variable (Value) is a boolean on whether the toggle is true or false
					end,
				})

				local ColorPicker = Tab:CreateColorPicker({
					Name = "Color Picker",
					Color = Color3.fromRGB(255,255,255),
					Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
					Callback = function(Value)
						-- The function that takes place every time the color picker is moved/changed
						-- The variable (Value) is a Color3fromRGB value based on which color is selected
					end
				})

				local Slider = Tab:CreateSlider({
					Name = "Slider Example",
					Range = {0, 100},
					Increment = 10,
					Suffix = "Bananas",
					CurrentValue = 40,
					Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
					Callback = function(Value)
						-- The function that takes place when the slider changes
						-- The variable (Value) is a number which correlates to the value the slider is currently at
					end,
				})

				local Input = Tab:CreateInput({
					Name = "Input Example",
					PlaceholderText = "Input Placeholder",
					RemoveTextAfterFocusLost = false,
					Callback = function(Text)
						-- The function that takes place when the input is changed
						-- The variable (Text) is a string for the value in the text box
					end,
				})

				local Dropdown = Tab:CreateDropdown({
					Name = "Dropdown Example",
					Options = {"Option 1","Option 2"},
					CurrentOption = {"Option 1"},
					MultipleOptions = false,
					Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
					Callback = function(Option)
						-- The function that takes place when the selected option is changed
						-- The variable (Option) is a table of strings for the current selected options
					end,
				})

				local Keybind = Tab:CreateKeybind({
					Name = "Keybind Example",
					CurrentKeybind = "Q",
					HoldToInteract = false,
					Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
					Callback = function(Keybind)
						-- The function that takes place when the keybind is pressed
						-- The variable (Keybind) is a boolean for whether the keybind is being held or not (HoldToInteract needs to be true)
					end,
				})

				local Label = Tab:CreateLabel("Label Example")

				local Paragraph = Tab:CreateParagraph({Title = "Paragraph Example", Content = "Paragraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph Example"})
			end
			return RayfieldLibrary
	end)()}
	loadprogress(260)
	local instance = (_G.chatSpyInstance or 0) + 1
	_G.chatSpyInstance = instance
	local chamsfillcolor = Color3.fromRGB(255,255,255)
	local chamsoutlinecolor = Color3.fromRGB(0,0,0)
	local function check_prem() return true end
	local a = 0
	local debugL1
	-- local chatFrame = O.me.PlayerGui.Chat.Frame
	me, pccontrol, ldsp, ldsb, ldsbip = nil, nil, nil, nil, nil

--♥setings♥
	function rfnotify(text1, text2) Ld.field:Notify({Title = text1,Content = text2,Duration = 5,Image = 4483362458}) end
	function dnotify(text, n) if L.debug and N.debug == n then rfnotify("Debug", text) end end
	function fstatus(text) rfnotify("Function Status", text) end
	function lnotify(text) rfnotify("Script Loader", text) end

	-- S.RS.GamepassEvents.GamepassUpdatedOnWebsite:Destroy() да
	-- S.RS.DefaultChatSystemChatEvents.OnNewMessage:Destroy()
	-- S.RS1.NewPlayerGroupDetails:Destroy() да
	-- S.RS1.CanChatWith:Destroy() да
	-- S.RS.GrabEvents.EndGrabEarly:Destroy()
	-- S.RS.HouseEvents.GrayButtonEvent:Destroy() да
	-- S.RS.MenuToys.LimitedTimeToyEvent:Destroy() да
	-- S.RS1.NewPlayerCanManageDetails:Destroy() да
	-- S.RS1.SendPlayerProfileSettings:Destroy() да
	-- S.RS.DefaultChatSystemChatEvents.OnChannelJoined:Destroy()
	-- S.RS.DataEvents.DataRemoteEvent:Destroy()

	O.camera = S.w.CurrentCamera
	local camera = S.w.CurrentCamera:Clone()
	camera.Parent = S.w
	S.w.CurrentCamera = camera
	
	animator = O.me.Character:WaitForChild("Humanoid"):WaitForChild("Animator")
	local anim = Instance.new("Animation")

	anim.AnimationId = "rbxassetid://18353618958"
	typing = animator:LoadAnimation(anim)

	anim.AnimationId = "rbxassetid://6980229055"
	crouch = animator:LoadAnimation(anim)

	anim.AnimationId = "rbxassetid://7047322890"
	throwed = animator:LoadAnimation(anim)

	anim.AnimationId = "rbxassetid://168268306"
	jerkoff = animator:LoadAnimation(anim)

	O.m.Hole.PoisonBigHole.PoisonHurtPart.Size = Vector3.new(2,2,2)
	O.m.Hole.PoisonSmallHole.PoisonHurtPart.Size = Vector3.new(2,2,2)
	O.m.FactoryIsland.PoisonContainer.Name = "fff"
	O.m.FactoryIsland.PoisonContainer.PoisonHurtPart.Size = Vector3.new(2,2,2)
	O.m.FactoryIsland.fff.PoisonHurtPart.Size = Vector3.new(2,2,2)

	game.Lighting.FogEnd = 1000000000000
	game.Lighting.Sky.StarCount = 5000
	game.Lighting.ShadowSoftness = 1
	game.Lighting.Sky.SkyboxBk = "rbxassetid://1289067181"
	game.Lighting.Sky.SkyboxDn = "rbxassetid://1289084895"
	game.Lighting.Sky.SkyboxFt = "rbxassetid://1289065660"
	game.Lighting.Sky.SkyboxLf = "rbxassetid://1289065992"
	game.Lighting.Sky.SkyboxRt = "rbxassetid://1289066325"
	game.Lighting.Sky.SkyboxUp = "rbxassetid://1289076870"
	game.Lighting.Sky.SunTextureId = "rbxasset://sky/sun.jpg"
	game.Lighting.Sky.MoonTextureId = "rbxasset://sky/moon.jpg"
	O.sunrays = Instance.new("SunRaysEffect", game.Lighting)
	O.sunrays.Intensity = 0
	O.sunrays.Spread = 0

	O.bloomeffect = Instance.new("BloomEffect", game.Lighting)
	O.bloomeffect.Intensity = 0
	O.bloomeffect.Size = 0
	O.bloomeffect.Threshold = 0

	O.ccc = Instance.new("ColorCorrectionEffect", S.w.CurrentCamera)
	O.ccc.Enabled = false

	O.invis = Instance.new("ColorCorrectionEffect", S.w.CurrentCamera)
	O.invis.Enabled = false
	O.invis.TintColor = Color3.fromRGB(200, 200, 200)

	O.headzoom = Instance.new("ColorCorrectionEffect", S.w.CurrentCamera)
	O.headzoom.Enabled = false
	O.headzoom.TintColor = Color3.fromRGB(200, 200, 255)

	O.hls = Instance.new("Folder", S.w)
	O.hls.Name = "♥hls♥"

	O.chars = Instance.new("Folder", S.w)
	O.chars.Name = "♥chars♥"

	O.backpacks = Instance.new("Folder", S.w)
	O.backpacks.Name = "♥backpacks♥"
	-- O.backpack.Parent = O.backpacks

	O.pclds = Instance.new("Folder", S.w)
	O.pclds.Name = "♥pclds♥"

	O.stoys = Instance.new("Folder", S.w)
	O.stoys.Name = "♥stoys♥"

	-- chatFrame.ChatChannelParentFrame.Visible = true
	-- chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
	
	pst = true
	loadprogress(366)

--♥pre-start♥
	local fgh = {
		now = 1736508292, -- 10.01
		now1 = 1737397338, -- 20.01
		now2 = 1738503582, -- 02.02
		now3 = 1738937926, -- 07.02
		now4 = 1739197319, -- 10.02
		now5 = 1739687259, -- 16.02
		now6 = 1740412819, -- 24.02
		now7 = 1740923854, -- 02.03
		now8 = 1741609511, -- 10.03
		now9 = 1742221402, -- 17.03
		now10 = 1743314047, -- 30.03
		now11 = 1743713185, -- 03.04
		now12 = 1744219105, -- 09.04
		now13 = 1744219105 + 86400*4, -- 13.04
		now14 = 1744219105 + 86400*4 + 86400*7, -- 20.04
		now15 = 1745882507, -- 29.04
		now16 = 1745882507 + 86400*8, -- 07.05
		now17 = 1745882507 + 86400*8 + 86400*14, -- 21.05
		now18 = 1751840669,
		day = 86400,
		week = 604800,
		month = 2592000
	}

	local rthrthrthrthrthgbgfhh = { -- day = 86400 █ week = 604800 █ month = 2592000 █ now(10.01) = 1736508292
	}
	-- if os.time() > fgh.now18 + fgh.month then while task.wait() do end end

	local function randomCode(length)
		local code = ""
		local symbols = {"-", "_"}
		local letters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "O.m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
		local numbers = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
		for i = 1, length do
			local randomIndex = math.random(1, 3)
			if randomIndex == 1 then
				code = code .. symbols[math.random(1, #symbols)]
			elseif randomIndex == 2 then
				code = code .. letters[math.random(1, #letters)]
			else
				code = code .. numbers[math.random(1, #numbers)]
			end
		end
		return code
	end

	local rthierhyhert

	local function check_prem(plr)
		do return true end --REVAMP
		-- if plr == O.me then return false else return true end -- owner
		if not(plr) then plr = O.me end
		if plr == O.me then
			-- if therrthh9rthjuiqwebuqwhe then while therrthh9rthjuiqwebuqwhe do task.wait() end end
			if rthierhyhert == nil then
				-- therrthh9rthjuiqwebuqwhe = true
				-- local irthuy8irthgurtghrtg = randomCode(5)
				-- local con = S.RS.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data)
				-- 	if data.Message == irthuy8irthgurtghrtg then irthuy8irthgurtghrtg = data.SpeakerUserId end
				-- end)
				-- O.Events.saymsg:FireServer(irthuy8irthgurtghrtg,"All")
				-- while irthuy8irthgurtghrtg ~= O.me.UserId do task.wait() end
				-- con:Disconnect()
				local t = true
				local time = os.time()
				for i,v in pairs(rthrthrthrthrthgbgfhh) do
					if tonumber(i) == O.me.UserId and v > time then
						t = false
					end
				end; rthierhyhert = t
				therrthh9rthjuiqwebuqwhe = false
				return rthierhyhert
			else return rthierhyhert end
		else
			local t = true
			local time = os.time()
			for i,v in pairs(rthrthrthrthrthgbgfhh) do
				if tonumber(i) == plr.UserId and v > time then
					t = false
				end
			end
			return t
		end
	end

	local function if3_help(a1, b1, b2)
		local t = false
		if a1 == b1 or a1 == b2 then
			t = true
		end
		return t
	end

	local function dssend(url, cont, name)
		do return true end--REVAMP
		request({
			Url = url,
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = S.HS:JSONEncode({content = cont, username = name})
		})
	end

	--REVAMP
	local function chatMessage(str)
		str = tostring(str)
		if S.TCS.ChatVersion == Enum.ChatVersion.TextChatService then
			S.TCS.TextChannels.RBXGeneral:SendAsync(str)
		else
			S.RS.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
		end
	end

	local function dssend1(url, msg)
		do return true end--REVAMP
		dssend(url, msg, Str.name)
	end

	if L.vhsows then function check_prem(plr) if plr and plr ~= O.me then return true end end end

	task.defer(function()
		while task.wait() do
			local s, v = pcall(function()
				local cframe = S.w.CurrentCamera.CFrame
				if aimtoggle then
					if not(ffc(S.w, "GrabParts")) then
						local pos = S.w.CurrentCamera.CFrame.Position + (S.w.CurrentCamera.CFrame.LookVector*N.aimdepth)
						local min, prt = 10000
						for _,char in pairs(O.chars:GetChildren()) do
							local limb = ffc(char, Str.aimtargetlimb); if limb then
								local mag = (limb.Position-pos).Magnitude; if mag <= N.aimrange and mag < min then
									min = mag
									prt = limb
								end
							end
						end
						if prt then
							local params = RaycastParams.new()
							params.FilterType = Enum.RaycastFilterType.Exclude
							params.FilterDescendantsInstances = {O.me.Character}
							local limb = S.w:Raycast(cframe.Position, CFrame.new(cframe.Position, prt.Position).LookVector*N.aimrange, params)
							if limb then
								if limb.Instance == prt or limb.Instance.Parent == prt.Parent then cframe = CFrame.new(cframe.Position, prt.Position)
								elseif aimignorewalls then
									if limb.Instance.CanQuery then limb.Instance.CanQuery = false; table.insert(Lt.ignorewallscq, limb.Instance) end
									if limb.Instance.CanCollide then limb.Instance.CanCollide = false; table.insert(Lt.ignorewallscc, limb.Instance) end
									if not(limb.Instance.Anchored) then limb.Instance.Anchored = true; table.insert(Lt.ignorewallsan, limb.Instance) end
								end
							end
						end
					else
						for _,prt in pairs(Lt.ignorewallscq) do prt.CanQuery = true end; Lt.ignorewallscq = {}
						for _,prt in pairs(Lt.ignorewallsan) do prt.Anchored = false end; Lt.ignorewallsan = {}
						for _,prt in pairs(Lt.ignorewallscc) do prt.CanCollide = true end; Lt.ignorewallscc = {}
					end
				end; O.camera.CFrame = cframe
			end)
			if not(s) then print(v) end
		end
	end)
	loadprogress(497)

--♥func♥
	function After_AG() end
	function get_all12() end
	function get_plr() end
	function get_rank() end
	function blob_kick() end
	--♥best♥
		--♥helps♥
			function magnitude(pos, pos1) if typeof(pos) == "Instance" then pos = pos.Position end; if typeof(pos1) == "Instance" then pos1 = pos1.Position end; return (pos - pos1).Magnitude end
			function fireti(prt1, prt2, t) firetouchinterest(prt1, prt2, t) end
			function PackColor(Color) return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255} end
			function UnpackColor(Color) return Color3.fromRGB(Color.R, Color.G, Color.B) end
			function ffc(parent, name) return parent:FindFirstChild(name) end
			function unwc(prt) for _,wc in pairs(prt:GetChildren()) do if wc.Name == "WeldConstraint" then wc:Destroy() end end end
			function unct(toy) for _,prt in pairs(toy:GetChildren()) do if prt:IsA("Part") then prt.CanTouch = false end end end
			function reloadcabm() O.me.PlayerScripts.CharacterAndBeamMove.Enabled = false; O.me.PlayerScripts.CharacterAndBeamMove.Enabled = true end
			function resetlines() for _,md in pairs(O.chars:GetDescendants()) do if md.Name == "GrabParts" then md:Destroy() end end end
			function stopme() for _,prt in pairs(O.me.Character:GetDescendants()) do if prt:IsA("Part") then prt.Velocity = N.V.nv3; prt.RootVelocity = N.V.nv3 end end end

		--♥checks♥
			function check_list(list, find) if find and list then for _,v in pairs(list) do if v == find then return v end end end end
			function check_limbs(prt) return check_list({"Head","Right Arm","Right Leg","Left Arm","Left Leg","Torso","HumanoidRootPart"}, prt.Name) end
			function check_hum(hum) if hum and hum.Health ~= 0 and hum:GetState() ~= Enum.HumanoidStateType.Dead then return true end end
			function check_spy(nk) local t = false; t = check_list(Lt.jnl, nk); t = check_list(Lt.sjnl, nk); return t end
			function check_whll(nk) return not(check_list(Lt.wl, nk)) end
			function check_mag1(prt, prt1) if magnitude(prt, prt1) < O.me.CurrentReach.Value-10 then return true end end
			function check_mag2(prt, prt1) if magnitude(prt, prt1) > O.me.CurrentReach.Value-10 then return true end end
			function check_admin(id) return check_list(Lt.admins, id) end
			function check_plr(obj, t) local hrp, hum, hd, hrp1, hum1, hd1 = get_all12(obj)
			if hrp and hum and check_hum(hum) and hd and hrp1 and hum1 and check_hum(hum1) and hd1 and not(get_plr(obj).InPlot.Value) then
			if t then t = check_mag1(hrp, hrp1) else t = true end; if t then return hrp, hum, hd, hrp1, hum1, hd1 end end end
			function check_plr1(obj, t) local hrp, hum, hd, hrp1, hum1, hd1 = get_all12(obj) 
			if hrp and hum and check_hum(hum) and hd and hrp1 and hum1 and check_hum(hum1) and hd1 then
			if t then t = check_mag1(hrp, hrp1) else t = true end; if t then return hrp, hum, hd, hrp1, hum1, hd1 end end end
			function check_rank(plr) if get_rank(O.me) > get_rank(plr) then return true end end
			function check_rank1(plr) if check_rank(plr) and check_whll(plr.Name) then return true end end

		--♥gets♥
			function get_end(list) local endd; for _,v in pairs(list) do endd = v end; return endd end
			function get_endi(list) local enddi; for i,_ in pairs(list) do enddi = i end; return enddi end
			function get_rotate(list) local rot = {}; local is = get_endi(list); for i,v in pairs(list) do rot[is-i+1] = v end; return rot end
			function get_parents(obj) if obj.Parent then local p = obj; local tree = {obj} while p.Parent do p = p.Parent; table.insert(tree, p) end; return tree end end
			function get_child(obj, tree) local last = obj; for _,obj in ipairs(tree) do if last:FindFirstChild(obj) then last = last[obj] end end return last end
			function get_char(obj) if obj then for _,plr in ipairs(S.Players:GetPlayers()) do local pf; if obj == plr then return plr.Character end
			if plr.Character then pf = check_list(get_parents(obj), plr.Character) end; if pf then return pf end end end end
			function get_plr(obj) local char = get_char(obj); for _,plr in ipairs(S.Players:GetPlayers()) do if plr.Character and plr.Character == char then return plr end end end
			-- function get_char_child(obj, name) return (get_plr(obj).Character or (get_plr(obj).CharacterAdded:Wait() and get_plr(obj).Character)):WaitForChild(name) end
			function get_char_child(obj, name) local char = get_char(obj); if char and char:FindFirstChild(name) then return char[name] end end
			-- function get_mychar_child(name) return (O.me.Character or (O.me.CharacterAdded:Wait() and O.me.Character)):WaitForChild(name) end
			function get_mychar_child(name) local char = O.me.Character; if char and char:FindFirstChild(name) then return char[name] end end
			function get_hrp() return get_mychar_child("HumanoidRootPart") end
			function get_hum() return get_mychar_child("Humanoid") end
			function get_hd() return get_mychar_child("Head") end
			function get_hrp1(obj) return get_char_child(obj, "HumanoidRootPart") end
			function get_hum1(obj) return get_char_child(obj, "Humanoid") end
			function get_hd1(obj) return get_char_child(obj, "Head") end
			function get_all() return get_hrp(), get_hum(), get_hd() end
			function get_all1(obj) return get_hrp1(obj), get_hum1(obj), get_hd1(obj) end
			function get_all12(obj) return get_hrp(), get_hum(), get_hd(), get_hrp1(obj), get_hum1(obj), get_hd1(obj) end
			function get_mylimbs() return {get_mychar_child("Right Arm"), get_mychar_child("Right Leg"), get_mychar_child("Left Arm"), get_mychar_child("Left Leg")} end
			function get_grabprt(toy) for _,prt in pairs(toy:GetChildren()) do if prt:IsA("BasePart") and prt.CanQuery and prt.CanCollide then return prt end end end
			function get_grabprt1(toy) if Lt.gps[toy.Name] then return Lt.gps[toy.Name] else return get_grabprt(toy) end end
			function get_po(toy) for _,prt in pairs(toy:GetChildren()) do if prt:FindFirstChild("PartOwner") then return prt.PartOwner end end end
			function get_rank(plr) local rank = 0; if not(check_prem(plr)) then rank = 1 end; if check_admin(plr.UserId) then rank = 2 end; if plr == O.me and L.vhsows then rank = 3 end; return rank end
			function get_center(prts) local vec = Vector3.new(); for _,prt in pairs(prts) do vec = vec+prt.Position end; return vec/table.maxn(prts) end
			function get_mouse() return O.mouse.Target, O.mouse.Hit end
			function get_limbs(obj) return {get_char_child(obj, "Right Arm"), get_char_child(obj, "Right Leg"), get_char_child(obj, "Left Arm"), get_char_child(obj, "Left Leg")} end
			function get_plrs(str) local plrs = {}; for _,plr in ipairs(S.Players:GetPlayers()) do local t = true; for i,s in pairs(str:split("")) do if plr.Name:split("")[i] ~= s then t = false end end; if t then table.insert(plrs, plr) end end; return plrs end
			function get_plrs1(str) if str == "ALLL" then return S.Players:GetPlayers() elseif str == "ALL" then local plrs = S.Players:GetPlayers(); for i,plr in pairs(plrs) do if get_rank(plr) == 2 then table.remove(plrs, i) end end elseif str == "all" then local plrs = S.Players:GetPlayers(); for i,plr in pairs(plrs) do if get_rank(plr) > 0 then table.remove(plrs, i) end end end end
			function get_plrs2(str) return get_plrs1(str) or get_plrs(str) end

		--♥convs♥
			function conv_LtoS(list) local str = ""; for _,v in pairs(list) do str = str..v end; return str end
			function conv_TtoS(list) local list1 = get_rotate(list); local str = ""; for i,v in pairs(list1) do if i ~= get_endi(list1) then str = str..tostring(v).."." end end
			str = str..tostring(get_end(list1)); return str end

		--♥events♥
			function grab(prt) O.Events.SetNetworkOwnerEvent:FireServer(prt, prt.CFrame) end
			function toy_spawn(name, cframe) O.Events.SpawnToyEvent:InvokeServer(name, cframe, Vector3.new(0,0,0)) end
			function toy_spawn1(name) toy_spawn(name, get_hd().CFrame) end
			function toy_spawn2(name) toy_spawn(name, CFrame.new(get_hd().Position+Vector3.new(0, 1, 0), get_hd().Position)*CFrame.Angles(math.pi, 0, 0)) end
			function toy_delete(toy) O.Events.DestroyToyEvent:FireServer(toy) end
			function toy_explode(BombPHT,PosPart,Pos) local data = {{["Hitbox"] =  BombPHT,["PositionPart"] = PosPart},Pos}; O.Events.BombEvent:FireServer(unpack(data)) end
			function toy_explode1(prt, pos) toy_explode(prt, prt, pos) end
			function toy_explode2(prt) toy_explode1(prt, prt.Position) end
			function ungrab(prt) if prt then O.Events.DestroyGrabLine:FireServer(prt) if prt:FindFirstChild("whograb") then prt.whograb:Destroy() end
			else O.Events.StruggleEvent:FireServer(O.me); O.Events.RagdollEvent:FireServer(get_hrp(), 0) end end
			function strungle() O.Events.StruggleEvent:FireServer() end

		--♥creates♥
			function create_blv(parent, name, value) local bv = Instance.new("BoolValue", parent); bv.Value = value; bv.Name = name; return bv end
			function create_ov(parent, name, value) local ov = Instance.new("ObjectValue", parent); ov.Value = value; ov.Name = name; return ov end
			function create_sv(parent, name, value) local sv = Instance.new("StringValue", parent); sv.Value = value; sv.Name = name; return sv end
			function create_nv(parent, name, value) local nv = Instance.new("NumberValue", parent); nv.Value = value; nv.Name = name; return nv end
			function create_bp(parent, name, pos, maxf) local bp = Instance.new("BodyPosition", parent)
			bp.Name = name; bp.MaxForce = maxf; bp.D = 105; bp.P = 8000; if pos then bp.Position = pos end; return bp end
			function create_bp1(parent, name, pos) return create_bp(parent, name, pos, N.V.mhv3) end
			function create_bp2(parent, name) return create_bp1(parent, name, parent.Position) end
			function create_bg(parent, name, maxt, d, cframe) local bg = Instance.new("BodyGyro", parent)
			bg.Name = name; bg.MaxTorque = maxt; bg.D = d; if cframe then bg.CFrame = cframe end return bg end
			function create_bg1(parent, name, cframe) return create_bg(parent, name, N.V.mhv3, 100, cframe) end
			function create_bg2(parent, name) return create_bg1(parent, name, parent.CFrame) end
			function create_bv(parent, name, vl, maxf) local vel = Instance.new("BodyVelocity", parent);
			vel.Name = name; vel.Velocity = vl; vel.MaxForce = maxf; return vel end
			function create_bv1(parent, name, vl) return create_bv(parent, name, vl, N.V.mhv3) end
			function create_sb(parent, name, adr, c3, sc3, t, st, lt) local sb = Instance.new("SelectionBox", parent); sb.Name = name
			sb.Adornee = adr; sb.Color3 = c3; sb.SurfaceColor3 = sc3; sb.Transparency = t; sb.SurfaceTransparency = st; sb.LineThickness = lt; return sb end
			function create_sb05(prt, name, adr, c3, sc3, t, st) return create_sb(prt, name, adr, c3, sc3, t, st, 0.01) end
			function create_sb1(prt, name, c3, sc3, t, st) return create_sb05(prt, name, prt, c3, sc3, t, st) end
			function create_sb2(prt, name, c3, sc3) return create_sb1(prt, name, c3, sc3, 0, 0.7) end
			function create_sb3(prt, name, sc3) return create_sb2(prt, name, Color3.fromRGB(0, 0, 0), sc3) end
			function create_spl(parent, name, prt, hum, c3, t) local spl = Instance.new("SelectionPartLasso", parent)
			spl.Name = name; spl.Part = prt; spl.Humanoid = hum; spl.Color3 = c3; spl.Transparency = t; return spl end
			function create_spl1(prt, name, c3, t) return create_spl(prt, name, prt, get_hum(), c3, t) end
			function create_spl15(prt, name, c3, hum) return create_spl(prt, name, prt, hum, c3, 1) end
			function create_spl2(prt, name, c3) return create_spl1(prt, name, c3, 1) end
			function create_spnl(parent, name, vec, hum, c3, t) local spnl = Instance.new("SelectionPointLasso", parent)
			spnl.Name = name; spnl.Point = vec; spnl.Humanoid = hum; spnl.Color3 = c3; spnl.Transparency = t; return spnl end
			function create_spnl1(prt, name, vec, c3) return create_spnl(prt, name, vec, get_hum(), c3, 1) end
			function create_md(parent, name) local md = Instance.new("Model", parent); md.Name = name; return md end
			function create_v3v(parent, name, vec) local v3v = Instance.new("Vector3Value", parent); v3v.Name = name; v3v.Value = vec; return v3v end
			function create_v3v1(parent, name) return create_v3v(parent, name, Vector3.new()) end
			function create_bav(parent, name, vec, maxt) local bav = Instance.new("BodyAngularVelocity", parent)
			bav.Name = name; bav.AngularVelocity = vec; bav.MaxTorque = maxt; return bav end
			function create_bav1(parent, name, vec) return create_bav(PlayerEvents, name, vec, N.V.mhv3) end
			function create_prt(parent, name, pos, size, t, cc, ct, cq, a) local prt = Instance.new("Part", parent); prt.Size = size
			prt.Transparency = t; prt.Name = name; prt.CanCollide = cc; prt.CanTouch = ct; prt.CanQuery = cq; return prt end
			function create_prt1(parent, name, pos, size, ct, cq, a) return create_prt(parent, name, pos, size, 1, false, ct, cq, a) end
			function create_prt2(parent, name, size, ct, cq) return create_prt1(parent, name, Vector3.new(), size, ct, cq, true) end
			function create_prt3(parent, name, size, cq) return create_prt2(parent, name, size, false, cq) end
			function create_ao(parent, name, att) local ao = Instance.new("AlignOrientation", parent); ao.MaxTorque = math.huge; ao.Name = name
			ao.Responsiveness = 200; ao.Mode = Enum.OrientationAlignmentMode.OneAttachment; ao.Attachment0 = att; return ao end
			function create_att(parent, name) local att = Instance.new("Attachment", parent); att.Name = name; return att end

		--♥waits♥
			function wfc(parent, name) return parent:WaitForChild(name) end
			function wfc05(parent, name) while not(ffc(parent, name)) do task.wait() end; return ffc(parent, name) end
			function wfc1(parent, tree) for i,name in pairs(tree) do tree[i] = wfc(parent, name); parent = tree[i] end return unpack(tree) end
			function wfc2(parent, tree) for _,name in pairs(tree) do parent = wfc(parent, name) end; return parent end
			function wfc11(parent, childs) for i,name in pairs(childs) do childs[i] = wfc(parent, name) end; return unpack(childs) end
			function wft(toy, name) if Lt.toys[name] then return wfc11(toy, Lt.toys[name]) end end
			function wfgp(toy, name) if Lt.gps[name] then return wfc(toy, Lt.gps[name]) else return get_grabprt(toy) end end
			function wfep(toy, name) if Lt.eps[name] then return wfc(toy, Lt.eps[name]) else return get_grabprt(toy) end end

		--♥ifs♥
			function dif_tree(parent, tree) for _,name in pairs(tree) do if parent then parent = ffc(parent, name) end end; return parent end
			function dif_parent(obj) if obj and obj.Parent then return obj end end
			function dif_soso(num, num1, dnum) if num == num1 or math.abs(num - num1) <= dnum then return true end end
			function dif_sov(v, v1, dnum) if dif_soso(v.x, v1.x, dnum) and dif_soso(v.y, v1.y, dnum) and dif_soso(v.z, v1.z, dnum) then return true end end


		--♥kicks♥
			--function skick(msg) O.me:Kick("Кикнут админом скрипта/kicked by the script admin, Сообщение/Message: "..msg); dssend1(Str.bansweb, msg) end

		--♥sets♥
			function set_sb(sb, choice, data, choice1) if sb then if choice1 then sb[choice] = data[choice1] else sb[choice] = data end end end
			function set_sb1(sb, data, choice) set_sb(sb, "SurfaceColor3", data, choice) end
			function set_spl(spl, choice, data, choice1) if spl then if choice1 then spl[choice] = data[choice1] else spl[choice] = data end end end
			function set_spl1(spl, data, choice) set_spl(spl, "Color3", data, choice) end
			function set_all(sb, spl, choice, data, choice1) set_sb(sb, choice, data, choice1); set_spl(spl, choice, data, choice1) end
			function set_all1(sb, spl, data, choice) set_sb1(sb, data, choice); set_spl1(spl, data, choice) end

	--♥grab♥
		local function auto_grab(prt, hrp, sb, spl, cdata, bp, bg, ttp)
			local bv = prt:FindFirstChild("igrab")
			local po = prt:FindFirstChild("PartOwner")
			local sv = prt:FindFirstChild("whograb")
			if not(sv) then
				sv = create_sv(prt, "whograb", "")
				prt.ChildAdded:Connect(function(obj)
					if obj.Name == "PartOwner" then
						sv.Value = obj.Value
					end
				end)
			end
			local function auto()
				set_all1(sb, spl, cdata, 3)
				local save = hrp.CFrame
				local t = false
				local old_pos = Vector3.new()
				local tv, time = get_time("rwv", 0)
				local vel = Vector3.new()
				local vlt = {}
				while (not(po) or po.Value ~= O.myname) and task.wait() do
					while not(dif_parent(hrp)) and task.wait() do hrp = get_hrp() end
					if not(prt.Parent) then break end
					if check_hum(hrp.Parent.Humanoid) then
						if check_mag2(prt, hrp) or t then
							if old_pos ~= prt.Position and ttp then
								tv, time = get_time("rwv", tv)
								vel = (prt.Position - old_pos)/time
								tv, time = get_time("rwv", tv)
								old_pos = prt.Position
							end
							set_all1(sb, spl, cdata, 4)
							if ttp then hrp.CFrame = prt.CFrame+vel+vel*O.me:GetNetworkPing()
							else hrp.CFrame = prt.CFrame end
							grab(prt)
							t = true
						else grab(prt) end
					else set_all1(sb, spl, cdata, 5) end
					po = prt:FindFirstChild("PartOwner")
				end
				if t then 
					hrp.CFrame = save
					for _,prt in pairs(hrp.Parent:GetChildren()) do
						if prt:IsA("BasePart") then
							prt.Velocity = N.V.nv3
						end
					end
				end
				set_all1(sb, spl, cdata, 1)
			end
			if sv.Value ~= O.myname then
				if S.w:FindFirstChild("GrabParts") then ungrab(wfc2(S.w.GrabParts, {"GrabPart", "WeldConstraint"}).Part1) end
				auto()
			else set_all1(sb, spl, cdata, 1) end
			if bv then
				set_all1(sb, spl, cdata, 2)
				while not(prt:FindFirstChild("PartOwner")) do task.wait() end
				bp.MaxForce = N.V.nv3
				bg.MaxTorque = N.V.nv3
				while bv.Parent do task.wait() end
				bp.Position = prt.Position
				bg.CFrame = prt.CFrame
				bp.MaxForce = N.V.mhv3
				bg.MaxTorque = N.V.mhv3
				set_all1(sb, spl, cdata, 1)
			end
			set_all1(sb, spl, cdata, 1)
		end

		local function auto_grab1(prt, prt1, hrp, sb, spl, cdata, bp, bg, ttp)
			local bv = prt:FindFirstChild("igrab")
			local po = prt:FindFirstChild("PartOwner")
			local sv = prt:FindFirstChild("whograb")
			if not(sv) then
				sv = create_sv(prt, "whograb", "")
				prt.ChildAdded:Connect(function(obj)
					if obj.Name == "PartOwner" then
						sv.Value = obj.Value
					end
				end)
			end
			local function auto()
				set_all1(sb, spl, cdata, 3)
				local save = hrp.CFrame
				local t = false
				local old_pos = Vector3.new()
				local tv, time = get_time("rwv", 0)
				local vel = Vector3.new()
				local vlt = {}
				while (not(po) or po.Value ~= O.myname) and task.wait() do
					while not(dif_parent(hrp)) and task.wait() do hrp = get_hrp() end
					if not(prt1.Parent) then break end
					if check_hum(hrp.Parent.Humanoid) then
						if check_mag2(prt1, hrp) or t then
							if old_pos ~= prt1.Position and ttp then
								tv, time = get_time("rwv", tv)
								vel = (prt1.Position - old_pos)/time
								tv, time = get_time("rwv", tv)
								old_pos = prt1.Position
							end
							set_all1(sb, spl, cdata, 4)
							if ttp then hrp.CFrame = prt1.CFrame+vel+vel*O.me:GetNetworkPing()
							else hrp.CFrame = prt1.CFrame end
							grab(prt); grab(prt1)
							t = true
						else grab(prt); grab(prt1) end
					else set_all1(sb, spl, cdata, 5) end
					po = prt:FindFirstChild("PartOwner")
				end
				if t then 
					hrp.CFrame = save
					for _,prt in pairs(hrp.Parent:GetChildren()) do
						if prt:IsA("BasePart") then
							prt.Velocity = N.V.nv3
						end
					end
				end
				set_all1(sb, spl, cdata, 1)
			end
			if sv.Value ~= O.myname then
				if S.w:FindFirstChild("GrabParts") then ungrab(wfc2(S.w.GrabParts, {"GrabPart", "WeldConstraint"}).Part1) end
				auto()
			else set_all1(sb, spl, cdata, 1) end
			if bv then
				set_all1(sb, spl, cdata, 2)
				while not(prt:FindFirstChild("PartOwner")) do task.wait() end
				bp.MaxForce = N.V.nv3
				bg.MaxTorque = N.V.nv3
				while bv.Parent do task.wait() end
				bp.Position = prt.Position
				bg.CFrame = prt.CFrame
				bp.MaxForce = N.V.mhv3
				bg.MaxTorque = N.V.mhv3
				set_all1(sb, spl, cdata, 1)
			end
			set_all1(sb, spl, cdata, 1)
		end

		local function auto_grab2(prt, hrp, sb, spl, cdata, bp, bg, ttp)
			local bv = prt:FindFirstChild("igrab")
			local po = prt:FindFirstChild("PartOwner")
			local function auto()
				set_all1(sb, spl, cdata, 3)
				local save = hrp.CFrame
				local t = false
				local old_pos = Vector3.new()
				local tv, time = get_time("rwv", 0)
				local vel = Vector3.new()
				local vlt = {}
				while (not(po) or po.Value ~= O.myname) and task.wait() do
					while not(dif_parent(hrp)) and task.wait() do hrp = get_hrp() end
					if not(prt.Parent) then break end
					if check_hum(hrp.Parent.Humanoid) then
						if check_mag2(prt, hrp) or t then
							if old_pos ~= prt.Position and ttp then
								tv, time = get_time("rwv", tv)
								vel = (prt.Position - old_pos)/time
								tv, time = get_time("rwv", tv)
								old_pos = prt.Position
							end
							set_all1(sb, spl, cdata, 4)
							if ttp then hrp.CFrame = prt.CFrame+vel+vel*O.me:GetNetworkPing()
							else hrp.CFrame = prt.CFrame end
							grab(prt)
							t = true
						else grab(prt) end
					else set_all1(sb, spl, cdata, 5) end
					po = prt:FindFirstChild("PartOwner")
				end
				if t then 
					hrp.CFrame = save
					for _,prt in pairs(hrp.Parent:GetChildren()) do
						if prt:IsA("BasePart") then
							prt.Velocity = N.V.nv3
						end
					end
				end
				set_all1(sb, spl, cdata, 1)
			end; auto()
			if bv then
				set_all1(sb, spl, cdata, 2)
				while not(prt:FindFirstChild("PartOwner")) do task.wait() end
				bp.MaxForce = N.V.nv3
				bg.MaxTorque = N.V.nv3
				while bv.Parent do task.wait() end
				bp.Position = prt.Position
				bg.CFrame = prt.CFrame
				bp.MaxForce = N.V.mhv3
				bg.MaxTorque = N.V.mhv3
				set_all1(sb, spl, cdata, 1)
			end
			set_all1(sb, spl, cdata, 1)
		end

		local function safe_grab(prt, hrp, sb, spl, cdata, bp, bg)
			if prt and hrp and prt:IsA("Part") and prt.CollisionGroup == "Items" then
				if check_limbs(prt.Name) then char_grab(prt, hrp, sb, spl, cdata, bp, bg)
				else
					local po = prt:FindFirstChild("PartOwner")
					local save = hrp.CFrame
					local t = false
					local old_pos = Vector3.new()
					local tv, time = get_time("rwv", 0)
					local vel = Vector3.new()
					if (not(po) or po.Value ~= O.myname) then
						get_time("rw")
						while (not(po) or po.Value ~= O.myname) and task.wait() do
							if not(prt.Parent) or not(hrp.Parent) then break end
							if check_hum(hrp.Parent.Humanoid) then
								if check_mag2(prt, hrp) or t then
									if old_pos ~= prt.Position and ttp then
										tv, time = get_time("rwv", tv)
										vel = (prt.Position - old_pos)/time
										tv, time = get_time("rwv", tv)
										old_pos = prt.Position
									end
									if ttp then hrp.CFrame = prt.CFrame+vel+vel*O.me:GetNetworkPing()
									else hrp.CFrame = prt.CFrame end
									grab(prt)
									t = true
								else grab(prt) end
							end
							po = get_po(prt.Parent)
						end
						get_time("rw")
						if t then 
							hrp.CFrame = save
							for _,prt in pairs(hrp.Parent:GetChildren()) do
								if prt:IsA("BasePart") then
									prt.Velocity = N.V.nv3
								end
							end
						end
					end
				end
			end
		end
			
		local function loop_grab(prt)
			local ov = prt:FindFirstChild("ait")
			if not(ov) then
				local sb = create_sb1(prt, "aitsb", Color3.fromRGB(255, 0, 255), Color3.fromRGB(255, 0, 0), 0.5, 0)
				ov = create_ov(prt, "ait", sb)
				while prt.Parent and ov.Parent and task.wait() do
					local hrp, hum = get_all()
					if hrp and hum and check_hum(hum) and check_mag1(hrp, prt) then
						grab(prt)
						local save = sb.SurfaceColor3
						sb.SurfaceColor3 = sb.Color3
						sb.Color3 = save
						task.wait()
						grab(prt)
						local save = sb.SurfaceColor3
						sb.SurfaceColor3 = sb.Color3
						sb.Color3 = save
					end
				end
			end
		end

		--REVAMP
		local function char_grab(prt, hrp, sb, spl, cdata, bp, bg)
			local bv = prt:FindFirstChild("igrab"); if bv then
				set_all1(sb, spl, cdata, 2)
				bp.MaxForce = N.V.nv3
				bg.MaxTorque = N.V.nv3
				while bv.Parent do task.wait() end
				bp.Position = prt.Position
				bg.CFrame = prt.CFrame
				bp.MaxForce = N.V.mhv3
				bg.MaxTorque = N.V.mhv3
				set_all1(sb, spl, cdata, 1)
			end
		end

		local function create_freeze(prt, t)
			local t1 = false
			local bp = ffc(prt, "frzbp"); if not(bp) then bp = create_bp2(prt, "frzbp"); t1 = true end
			local bg = ffc(prt, "frzbg"); if not(bg) then bg = create_bg2(prt, "frzbg"); t1 = true end
			local sb = ffc(prt, "frzsb"); if not(sb) then sb = create_sb2(prt, "frzsb", N.CS.blue, Color3.fromRGB(0, 255, 255)); t1 = true end
			local args = {bp, bg, sb}; if t then table.insert(args, t1) end return unpack(args)
		end

		local function freeze(prt, hrp)
			local bp, bg, sb, t = create_freeze(prt, true)
			if t then
				task.spawn(function(hrp)
					while bp.Parent and bg.Parent and sb.Parent and task.wait() do
						while not(dif_parent(hrp)) and task.wait() do hrp = get_hrp() end
						auto_grab(prt, hrp, sb, nil, N.C2, bp, bg)
					end; ungrab(prt)
				end)
			end
		end

		local function char_freeze(char, hrp) --REVAMP
			for _,limb in pairs(get_limbs(char)) do
				local bp, bg, sb, t = create_freeze(limb, true)
				local prt = ffc(limb, "frzprt"); if not(prt) then prt = create_prt3(limb, "frzprt", limb.Size+Vector3.new(0.1,0.1,0.1), true); t = true end
				if t then
					task.defer(function()
						while task.wait() do
							if not(char.HumanoidRootPart.WeldHRP.Enabled) then
								local bp = ffc(limb.RagdollLimbPart, "frzbp"); if bp then bp:Destroy() end
								local bg = ffc(limb.RagdollLimbPart, "frzbg"); if bg then bg:Destroy() end
								local prt = ffc(limb.RagdollLimbPart, "frzprt"); if prt then prt:Destroy() end
								local sb = ffc(limb.RagdollLimbPart, "frzsb"); if sb then sb:Destroy() end
								prt.CFrame = limb.CFrame
								char_grab(prt, hrp, sb, nil, N.C2, bp, bg)
							else
								bp, bg = create_freeze(limb.RagdollLimbPart)
								-- char_grab(prt, hrp, , nil, N.C2, bp, bg)
							end
						end
					end)
				end; local limbs1 = {char.Torso, char.Head}
				for _,limb in pairs(limbs1) do
					local bp, bg, sb, t = create_freeze(limb, true)
					local prt = ffc(limb, "frzprt"); if not(prt) then prt = create_prt3(limb, "frzprt", limb.Size+Vector3.new(0.1,0.1,0.1), true); t = true end
					if t then
						task.defer(function()
							while task.wait() do
								prt.CFrame = limb.CFrame
								if limb.Name == "Head" then auto_grab2(limb, hrp, sb, nil, N.C2, bp, bg) else char_grab(prt, hrp, sb, nil, N.C2, bp, bg) end
							end
						end)
					end
				end
			end
		end

		local function safe_freeze(toy, prt, hrp)
			if check_limbs(prt) or get_char(toy) then
				freeze(toy.Head, hrp)
			else freeze(prt, hrp) end
		end

	--♥toys♥
		local function toy_sspawn(name, funcid, dovt)
			local hrp, hum = get_all()
			local t, toy = true, nil
			if check_hum(hum) then
				while O.me.InPlot.Value and not(O.me.InOwnedPlot.Value) do task.wait() end
				while not(O.me.CanSpawnToy.Value) do task.wait() end
				if funcid == 1 then task.spawn(toy_spawn1, name) end
				if funcid == 2 then task.spawn(toy_spawn2, name) end
				task.delay(1, function() t = false end)
				while not(O.backpack:FindFirstChild(name.."/n")) and t do task.wait() end
				if not(O.backpack:FindFirstChild(name.."/n")) then return toy_sspawn(name, funcid, dovt) 
				else toy = O.backpack[name.."/n"].Value end
				if not(dovt) then O.backpack[name.."/n"]:Destroy() end
				if dovt then return toy, O.backpack[name.."/n"] else return toy end
			end
		end

		local function toy_aspawn(name, funcid, hrp)
			local toy, ov = toy_sspawn(name, funcid, true)
			auto_grab(wfgp(toy, name), hrp)
			ov.Name = name.."/a"
			return toy, ov
		end

		local function toy_void(prt, hrp, t)
			prt.Parent.Name = "_"; if not(O.me.InPlot.Value) then
				auto_grab(prt ,hrp); if prt.Parent then
					for _,prt in pairs(prt.Parent:GetChildren()) do
						if prt:IsA("Part") or prt:IsA("MeshPart") then
							prt.CanTouch = false
							prt.CanCollide = false
						end
					end; local bp = create_bp1(prt, "vtbp", prt.Position + Vector3.new(math.random(0,100), 1111111, math.random(0,100)))
					if get_rank(O.me) > 1 and t then
						task.delay(0.1, function()
							bp:Destroy()
							create_bv1(prt, "bpppbv", Vector3.new(100000, 100000, 0))
						end)
					end
				end
			end
		end

		local function toy_vspawn(name, funcid, t)
			local toy, ov = toy_sspawn(name, funcid, true)
			toy_void(wfgp(toy, name), get_hrp(), t)
			ov.Name = name.."/v"
			return toy, ov
		end

	--♥plrs♥
		local function plr_kill(plr, t, t1)
			local hrp, hum, hd, hrp1, hum1, hd1 = check_plr(plr, t); if hrp then
				auto_grab1(hd1, hrp1, hrp, nil, nil, nil, nil, nil, t1)
				hum1:ChangeState(15); ungrab(hd1)
				for a=0,20 do
					if dif_parent(hrp1) and dif_parent(hrp1.Parent) then
						hrp1.Parent:PivotTo(CFrame.new(0, -11111, 0))
						grab(hd1); hum1:ChangeState(15); ungrab(hd1); task.wait(0.1)
					end
				end
			end
		end

		local function plr_fling(plr, t)
			local hrp, hum, hd, hrp1, hum1, hd1 = check_plr(plr, t)
			if hrp and not(hrp1:FindFirstChild("pfbv")) then
				-- auto_grab(hd1, hrp)
				grab(hd1)
				local bv = create_bv1(hrp1, "pfbv", Vector3.new(0, 1000000000, 0))
				local con = hd1.PartOwner.AncestryChanged:Connect(function()
					bv:Destroy()
				end)
			end
		end

		local function plr_grab(plr, t)
			local hrp, hum, hd, hrp1, hum1, hd1 = check_plr(plr, t)
			if hrp then auto_grab(hd1, hrp) end
		end

		local function plr_ragdoll(plr, t)
			local hrp, hum, hd, hrp1, hum1, hd1 = check_plr(plr, t)
			if hrp then
				auto_grab(hd1, hrp)
				local save = hrp1.Position
				local bp = create_bp1(hrp1, "rgbp", hrp1.Position + Vector3.new(0, 1000, 0)); task.wait(0.1)
				bp.Position = save + Vector3.new(0, -10, 0); task.wait(0.1)
				bp.Position = save; task.wait(0.1)
				bp:Destroy(); task.wait(0.1)
			end
		end

		local function plr_split(plr, t)
			local hrp, hum, hd, hrp1, hum1, hd1 = check_plr(plr, t)
			if hrp and not(hd1:FindFirstChild("spited")) then
				create_blv(hd1, "spited", true)	
				hrp1.Parent.Torso:Destroy()
			end
		end

		local function plr_sit(seat, hum)
			if hum and check_hum(hum) then
				while hum.SeatPart ~= seat and task.wait() do
					if not(seat.Occupant) then
						seat:Sit(hum)
					end
				end
			end
		end

		local function plr_explode(plr, toy, name, ptm)
			local hrp, hum, hd, hrp1, hum1, hd1 = check_plr1(plr, false); if hrp then
				local gp, ep = wfgp(toy, name), wfep(toy, name)
				auto_grab(gp, hrp); local pos = hrp1.Position
				if ptm then pos = hrp1.Position+hrp1.Velocity*(O.me:GetNetworkPing()+0.3) end
				toy_explode(ep, hrp1, pos)
			else return true end
		end

		local function plr_tospawn(plr, t)
			local hrp, hum, hd, hrp1, hum1, hd1 = check_plr(plr, t)
			if hrp and not(hrp1:FindFirstChild("tsbp")) then
				auto_grab(hd1, hrp)
				local bp = create_bp1(hrp1, "tsbp", Vector3.new(0, 0, 0))
				task.wait(0.3)
				bp:Destroy()
				ungrab(hd1)
			end
		end

		local function plr_fire(lt, t)
			local function respawn(old_toy)
				toy_delete(old_toy)
				local toy = (ffc(O.backpack, "Campfire/v") and O.backpack["Campfire/v"].Value) or toy_vspawn("Campfire", 2)
				local prt, fl = wfc1(toy, {"FirePlayerPart","FireLight"}); toy.SoundPart.vtbp.Position = Vector3.new()
				-- prt.Anchored = true; prt.CanTouch = true; prt.Position = Vector3.new(0, 10000, 0)
				if not(fl.Enabled) then return respawn(toy) else return toy, prt, fl end
			end; local lt1 = {}
			for _,plr in pairs(lt) do local hrp1, hum1 = get_all1(plr); table.insert(lt1, {hrp1, hum1}) end
			local hrp, hum = get_all()
			if hrp and check_hum(hum) then
				local toy, prt, fl = respawn()
				local save = prt.Position
				prt.Anchored = false
				for i,args in pairs(lt1) do
					if not(toy.Parent) or not(fl.Enabled) then 
						toy, prt, fl = respawn(toy)
						prt.Anchored = false
					end
					local hrp1, hum1 = unpack(args)
					if dif_parent(hrp1) and check_hum(hum1) then
						while not(ffc(hrp1, "FireLight")) and task.wait() do
							if not(dif_parent(hrp)) or not(check_hum(hum)) then break end
							if not(dif_parent(hrp1)) or not(check_hum(hum1)) then break end
							fireti(prt, hrp1, 0); task.wait(); fireti(prt, hrp1, 1)
						end
					end
				end; prt.Anchored = true
			end
		end

		local function plr_sragdoll(plr)
			local hrp, hum, hd, hrp1, hum1, hd1 = check_plr1(plr); if hrp then
				local toy = toy_aspawn("BallSnowball", 2, hrp)
				local gp, prt = wfgp(toy), wfc(toy, "SnowRagdollPart")
				create_bv1(prt, "srbv", Vector3.new(100000, 100000, 0))
				fireti(prt, hrp1, 0)
			end
		end

		local function plr_spray(lt)
			local function respawn()
				local toy = ffc(O.backpack, "SprayCanWD/v") and O.backpack["SprayCanWD/v"].Value
				if not(toy) then
					toy = toy_vspawn("SprayCanWD", 2)
					local prt = wfc(toy, "StickyRemoverPart")
					local bp = ffc(toy.Part,"vtbp"); if bp then bp.MaxForce = N.V.nv3 end
					grab(toy.Part); ungrab(toy.Part); prt.Anchored = true; unwc(prt)
					return prt
				else return toy.StickyRemoverPart end
			end; local lt1 = {}
			for _,plr in pairs(lt) do local hrp1, hum1 = get_all1(plr); local ll1 = get_char_child(plr, "Left Leg"); table.insert(lt1, {hrp1, hum1, ll1}) end
			local hrp, hum = get_all()
			if dif_parent(hrp) and check_hum(hum) then
				local prt = respawn()
				for i,args in pairs(lt1) do
					if not(prt.Parent) then
						prt = respawn()
						prt.Anchored = false
					end; local hrp1, hum1, ll1 = unpack(args)
					if dif_parent(hrp1) and check_hum(hum1) and dif_parent(rl1) then
						fireti(prt, ll1, 0)
						-- task.wait()
						fireti(prt, ll1, 1)
						table.remove(lt1, i)
					end
				end; prt.Anchored = true
			end
		end

		local function plr_bragdoll(lt)
			local function respawn()
				local toy = (ffc(O.backpack, "FoodBanana/v") and O.backpack["FoodBanana/v"].Value) or toy_vspawn("FoodBanana", 2)
				local holdprt, soundprt, bplprt = wfc11(toy, {"HoldPart","SoundPart","BananaPeel"})
				if ffc(toy, "EdiblePart") then
					local bp = ffc(toy.SoundPart,"vtbp"); if bp then bp.MaxForce = N.V.nv3 end
					local dropevent, holdevent = wfc11(holdprt, {"DropItemRemoteFunction","HoldItemRemoteFunction"})
					for _,prt in pairs(toy:GetChildren()) do if prt:IsA("Part") then create_nv(prt, "tvalue", prt.Transparency); prt.Transparency = 1 end end
					task.spawn(function() holdevent:InvokeServer(toy, O.me.Character) end); while toy.HitboxPart.CanQuery do task.wait() end
					task.spawn(function() O.Events.UseEvent:FireServer(toy, O.me.Character) end); while ffc(toy, "EdiblePart") do task.wait() end
					O.me.Character.GrabbingScript.Enabled = false
					task.spawn(function() dropevent:InvokeServer(toy, holdprt.CFrame, Vector3.new()) end); while not(toy.HitboxPart.CanQuery) do task.wait() end
					O.me.Character.GrabbingScript.Enabled = true
					if not(bplprt.CanTouch) then bplprt.Name = "_"; bplprt = wfc(toy, "BananaPeel")
					else bplprt.Name = "t"; toy.BananaPeel.Name = "_"; bplprt.Name = "BananaPeel" end
					for _,prt in pairs(toy:GetChildren()) do if prt:IsA("Part") and ffc(prt, "tvalue") then prt.Transparency = prt.tvalue.Value end end
					grab(soundprt); ungrab(soundprt); bplprt.Anchored = true; if bp then bp.MaxForce = N.V.mhv3 end
				end
				return toy, bplprt
			end; local lt1 = {}
			for _,plr in pairs(lt) do local hrp1, hum1 = get_all1(plr); local rl1 = get_char_child(plr, "Right Leg"); table.insert(lt1, {hrp1, hum1, rl1}) end
			local hrp, hum = get_all()
			if dif_parent(hrp) and check_hum(hum) then
				local toy, prt = respawn()
				prt.Anchored = false
				for _,args in pairs(lt1) do
					if not(toy.Parent) then
						toy, prt = respawn()
						prt.Anchored = false
					end; local hrp1, hum1, rl1 = unpack(args)
					if dif_parent(hrp1) and check_hum(hum1) and dif_parent(rl1) then
						fireti(prt, rl1, 0)
						-- task.wait()
						fireti(prt, rl1, 1)
					end
				end; prt.Anchored = true
			end
		end

		local function plr_bring(plr, cframe)
			local hrp, hum, hd, hrp1, hum1, hd1 = check_plr(plr); if hrp then
				auto_grab(hd1, hrp); hrp1.CFrame = cframe or hrp.CFrame + hrp.CFrame.LookVector*3 + Vector3.new(0, 10, 0)
				for _,prt in pairs(hrp1.Parent:GetDescendants()) do
					if prt:IsA("Part") then
						prt.Velocity = Vector3.new()
					end
				end
				ungrab(hd1)
			end
		end

		local function plr_kick(hrp, hum, plrs, mblob, blobs, rl)
			local function func(hrp, hum, plr, rl)
				local hrp1, hum1, hd1 = get_all1(get_char(plr))
				local rl1 = "Left"; if rl == "Left" then rl1 = "Right" end
				if dif_parent(hrp) and check_hum(hum) and dif_parent(hrp1) and check_hum(hum1) then
					local pcld = ffc(hrp1.Parent, "pcldov") and hrp1.Parent.pcldov.Value
					if hum.SeatPart and dif_parent(pcld) and autoasyncanticheat then
						local rc = S.w:Raycast(pcld.Position, Vector3.new(0, -5, 0))
						local t = true; task.delay(1, function() t = false end)
						local ids = "2t1t"; if ik then ids = "2t1" end
						while rc and rc["Instance"] and rc.Distance < 5 and t and task.wait() do
							if not(dif_parent(hrp)) or not(check_hum(hum)) then break end
							if not(dif_parent(hrp1)) or not(check_hum(hum1)) then break end
							if not(hum.SeatPart) then break end
							if twohand then
								local function func1()
									blob_kick(mblob,hrp1,rl,"2")
									blob_kick(mblob,hrp1,rl1,"2")
									if forcedasync then
										blob_kick(mblob,hrp1,rl,"12")
										blob_kick(mblob,hrp1,rl1,"12")
										for a=0,15 do grab(hd1); task.wait() end
										create_bp1(hrp1, "fabp", hrp.Position + Vector3.new(0, 10, 0) + S.w.CurrentCamera.CFrame.LookVector*10)
									end
									if not(dif_parent(hrp)) or not(check_hum(hum)) then t = false end
									if not(dif_parent(hrp1)) or not(check_hum(hum1)) then t = false end
									if not(hum.SeatPart) then t = false end
									blob_kick(mblob,hrp1,rl,"1")
									blob_kick(mblob,hrp1,rl1,"1")
									if forcedasync then local bp = dif_tree(hrp, {"fabp"}); if bp then bp:Destroy() end end
									if not(ik) and not(forcedasync) then task.wait(0.3) end
								end; if multithreadedmode then task.defer(func1)
								else func1() end
							else
								if multithreadedmode then
									task.defer(function()
										local bp = create_bp1(hrp1, "fabp", hrp.Position + Vector3.new(0, 10, 0) + S.w.CurrentCamera.CFrame.LookVector*10)
										blob_kick(mblob,hrp1,rl,ids,0.3)
										bp:Destroy()
									end)
								else
									local bp = create_bp1(hrp1, "fabp", hrp.Position + Vector3.new(0, 10, 0) + S.w.CurrentCamera.CFrame.LookVector*10)
									blob_kick(mblob,hrp1,rl,ids,0.3)
									bp:Destroy()
								end
							end
							rc = S.w:Raycast(pcld.Position, Vector3.new(0, -5, 0))
						end
					end; if pcld or not(autoasyncanticheat) or not(onlyasyncmode) then
						if allblobs then
							for _,blob in pairs(blobs) do
								if blob:FindFirstChild("VehicleSeat") and blob.VehicleSeat.Occupant then
									blob_kick(blob,hrp1,rl,"1")
									if twohand then blob_kick(blob,hrp1,rl1,"1") end
								end
							end
						end; blob_kick(mblob,hrp1,rl,"1")
						if twohand then blob_kick(mblob,hrp1,rl1,1) end
						if not(ksm) then task.wait((10-N.ks)/10) end
					end
				end
			end; local t, t1, t2 = true, false, false
			local list1, list2 = {}, {}
			if parallelmode then
				for _,plr in pairs(plrs) do
					if t then table.insert(list1, plr); t = not(t)
					else table.insert(list2, plr); t = not(t) end
				end; t = false
				task.defer(function() for i,plr in pairs(list1) do func(hrp, hum, plr, "Right") end; t1 = true; if t1 and t2 then t = true end end)
				task.defer(function() for i,plr in pairs(list2) do func(hrp, hum, plr, "Left") end; t2 = true; if t1 and t2 then t = true end end)
				while not(t) do task.wait() end
			else for _,plr in pairs(plrs) do func(hrp, hum, plr, rl) end end
		end

	--♥sets♥
		local function set_ftap_color()
			local Data = {}
			for i,v in pairs(Lt.ftapcolors) do
				Data[i] = PackColor(v)
			end
			writefile("VHS/FTAPColors.vhs",tostring(S.HS:JSONEncode(Data)))

			local plrgui = O.me.PlayerGui
			local tabs = plrgui.MenuGui.Menu.TabBar.Tabs
			local tbcont = plrgui.MenuGui.Menu.TabContents
			local seting = tbcont.Settings
			local shop = tbcont.Shop
			local tbcont_toys = tbcont.Toys
			local tbcont_toysdestroy = tbcont.ToyDestroy
			local tbcont_toyhop = tbcont.ToyShop

			plrgui.MenuGui.TopRight.CoinsFrame.BackgroundColor3 = Lt.ftapcolors.Coins
			plrgui.MenuGui.Menu.TabBar.BackgroundColor3 = Lt.ftapcolors.TabBar
			tabs.Settings.BackgroundColor3 = Lt.ftapcolors.Settings
			tabs.Shop.BackgroundColor3 = Lt.ftapcolors.Shop
			tabs.ToyDestroy.BackgroundColor3 = Lt.ftapcolors.ToyDestroy
			tabs.ToyShop.BackgroundColor3 = Lt.ftapcolors.ToysShop
			tabs.Toys.BackgroundColor3 = Lt.ftapcolors.Toys
			seting.Contents.BackgroundColor3 = Lt.ftapcolors.SettingsContents
			seting.Title.BackgroundColor3 = Lt.ftapcolors.SettingsTitle
			shop.Title.BackgroundColor3 = Lt.ftapcolors.ShopTitle
			shop.Contents.BackgroundColor3 = Lt.ftapcolors.ShopContents
			tbcont_toys.Contents.BackgroundColor3 = Lt.ftapcolors.ToysContents
			tbcont_toys.FavoritesFrame.BackgroundColor3 = Lt.ftapcolors.FavoritesFrame
			tbcont_toys.FavoritesFrame.Favorites.BackgroundColor3 = Lt.ftapcolors.Favorites
			tbcont_toys.MeterFrame.BackgroundColor3 = Lt.ftapcolors.MeterFrame
			tbcont_toys.SortingTabs.BackgroundColor3 = Lt.ftapcolors.SortingTabs
			tbcont_toys.Title.BackgroundColor3 = Lt.ftapcolors.ToysTitle
			tbcont_toysdestroy.Title.BackgroundColor3 = Lt.ftapcolors.DestroyTitle
			tbcont_toysdestroy.Contents.BackgroundColor3 = Lt.ftapcolors.DestroyContents
			tbcont_toysdestroy.MeterFrame.BackgroundColor3 = Lt.ftapcolors.DestroyMeterFrame
			tbcont_toyhop.Title.BackgroundColor3 = Lt.ftapcolors.ToyShopTitle
			tbcont_toyhop.SortingTabs.BackgroundColor3 = Lt.ftapcolors.ToyShopSortingTabs
			tbcont_toyhop.Contents.BackgroundColor3 = Lt.ftapcolors.ToyShopContents
		end

		local function set_line_color()
			local Data = {}
			for i,v in ipairs(Lt.ccolors) do
				Data[i] = PackColor(v)
			end

			writefile("VHS/LineColor.vhs",tostring(S.HS:JSONEncode(Data)))

			local args = {
				ColorSequenceKeypoint.new(0, Lt.ccolors[1]),
				ColorSequenceKeypoint.new(0.10, Lt.ccolors[2]),
				ColorSequenceKeypoint.new(0.15, Lt.ccolors[3]),
				ColorSequenceKeypoint.new(0.20, Lt.ccolors[4]),
				ColorSequenceKeypoint.new(0.25, Lt.ccolors[5]),
				ColorSequenceKeypoint.new(0.30, Lt.ccolors[6]),
				ColorSequenceKeypoint.new(0.35, Lt.ccolors[7]),
				ColorSequenceKeypoint.new(0.40, Lt.ccolors[8]),
				ColorSequenceKeypoint.new(0.45, Lt.ccolors[9]),
				ColorSequenceKeypoint.new(0.50, Lt.ccolors[10]),
				ColorSequenceKeypoint.new(0.55, Lt.ccolors[11]),
				ColorSequenceKeypoint.new(0.60, Lt.ccolors[12]),
				ColorSequenceKeypoint.new(0.65, Lt.ccolors[13]),
				ColorSequenceKeypoint.new(0.70, Lt.ccolors[14]),
				ColorSequenceKeypoint.new(0.75, Lt.ccolors[15]),
				ColorSequenceKeypoint.new(0.80, Lt.ccolors[16]),
				ColorSequenceKeypoint.new(0.85, Lt.ccolors[17]),
				ColorSequenceKeypoint.new(0.90, Lt.ccolors[18]),
				ColorSequenceKeypoint.new(0.95, Lt.ccolors[19]),
				ColorSequenceKeypoint.new(1, Lt.ccolors[20])
			}
			O.Events.SetLineColorEvent:FireServer(ColorSequence.new(args))
		end

	--♥others♥
		local function datadssend()
			while os.time()%60 ~= 0 do task.wait() end
			local last_time = os.time()
			while task.wait() do
				local time = os.time()
				if time - last_time == 60 then
					last_time = time
					dssend(Str.dataweb, time, O.me.DisplayName.." ("..O.myname..")")
				end
			end
		end
		
		local function update_hui()
			Lt.hui = {}
			Lt.hui2 = {}
			local p = "p"
			if L.vhsows then p = "" end
			for _,plr in ipairs(S.Players:GetPlayers()) do
				if plr ~= O.me then
					if not(check_prem(plr)) then
						if plr:FindFirstChild("IsFriendsWith") and plr:IsFriendsWith(O.me.userId) then
							table.insert(Lt.hui, plr.DisplayName.." ("..plr.Name..") ♦Friend♦ ♥Premium User♥")
							Lt.hui2[plr.Name..p] = plr.DisplayName.." ("..plr.Name..") ♦Friend♦ ♥Premium User♥" 
						else
							table.insert(Lt.hui, plr.DisplayName.." ("..plr.Name..") ♥Premium User♥")
							Lt.hui2[plr.Name..p] = plr.DisplayName.." ("..plr.Name..") ♥Premium User♥" 
						end
					else
						if plr:FindFirstChild("IsFriendsWith") and plr:IsFriendsWith(O.me.userId) then
							table.insert(Lt.hui, plr.DisplayName.." ("..plr.Name..") ♦Friend♦")
							Lt.hui2[plr.Name] = plr.DisplayName.." ("..plr.Name..") ♦Friend♦"
						else
							table.insert(Lt.hui, plr.DisplayName.." ("..plr.Name..")")
							Lt.hui2[plr.Name] = plr.DisplayName.." ("..plr.Name..")"
						end
					end
				end
			end
		end; update_hui()

		function blob_kick(blob,hrp,rl,ids,t)
			if blob and hrp then
				local script = ffc(blob, "BlobmanSeatAndOwnerScript")
				local detec = ffc(blob, rl.."Detector")
				if script and detec then
					local weld = ffc(detec, rl.."Weld")
					local grab = ffc(script, "CreatureGrab")
					local drop = ffc(script, "CreatureDrop")
					if weld and grab and drop then
						local funcs = {
							["1"] = function() grab:FireServer(detec,hrp,weld) end,
							["2"] = function() drop:FireServer(weld,hrp) end,
							["t"] = function() if t then task.wait(t) end end,
							["g"] = function() grab(hrp) end}
						for _,id in pairs(string.split(ids, "")) do funcs[id]() end
					end
				end
			end
		end

		local erthrtherger = not(check_prem(O.me)) or L.vhsows
		local function antiblobkick(bcpk, toy)
			task.spawn(function()
				if toy:IsA("Model") and toy.Name == "CreatureBlobman" then
					local plr = (bcpk.Name:find("SpawnedInToys") and bcpk.owner.Value) or (bcpk.Name:find("Plot") and wfc(toy, "PlayerValue").Value)
					if dif_parent(plr) and check_rank(plr) then
						local ld, rd = toy:WaitForChild("LeftDetector"), toy:WaitForChild("RightDetector")
						local lw, lo = ld:WaitForChild("LeftWeld"), ld:WaitForChild("LeftAlignOrientation")
						local rw, ro = rd:WaitForChild("RightWeld"), rd:WaitForChild("RightAlignOrientation")
						lw.Changed:Connect(function(at)
							if at == "Attachment0" and antiblob then
								local hrp, hum = get_all()
								if dif_parent(hrp) and check_hum(hum) and lw.Attachment0 == hrp.RootAttachment then
									lw.Enabled = false; lo.Enabled = false
									if erthrtherger then blob_kick(toy, hrp, "Left", "2") end
									local a1, a2, a3 = dif_parent(lw), dif_parent(hrp), hrp:FindFirstChild("RootAttachment")
									local a4, a5, a6 = dif_parent(a3), lw.Attachment0 == a3, dif_parent(toy)
									while a1 and a2 and a3 and a4 and a5 and a6 and task.wait() do
										if erthrtherger then blob_kick(toy, hrp, "Left", "2") end
										a1, a2, a3 = dif_parent(lw), dif_parent(hrp), hrp:FindFirstChild("RootAttachment")
										a4, a5, a6 = dif_parent(a3), lw.Attachment0 == a3, dif_parent(toy)
									end; lw.Enabled = true; lo.Enabled = true
								end
							end
						end)
						rw.Changed:Connect(function(at)
							if at == "Attachment0" and antiblob then
								local hrp, hum = get_all()
								if dif_parent(hrp) and check_hum(hum) and rw.Attachment0 == hrp.RootAttachment then
									rw.Enabled = false; ro.Enabled = false
									if erthrtherger then blob_kick(toy, hrp, "Right", "2") end
									local a1, a2, a3 = dif_parent(rw), dif_parent(hrp), hrp:FindFirstChild("RootAttachment")
									local a4, a5, a6 = dif_parent(a3), rw.Attachment0 == a3, dif_parent(toy)
									while a1 and a2 and a3 and a4 and a5 and a6 and task.wait() do
										if erthrtherger then blob_kick(toy, hrp, "Right", "2") end
										a1, a2, a3 = dif_parent(rw), dif_parent(hrp), hrp:FindFirstChild("RootAttachment")
										a4, a5, a6 = dif_parent(a3), rw.Attachment0 == a3, dif_parent(toy)
									end; rw.Enabled = true; ro.Enabled = true
								end
							end
						end)
					end
				end
			end)
		end

		local function reset_gq()
			for _,obj in pairs(S.w:GetDescendants()) do 
				if obj:IsA("Part") and obj:FindFirstChild("gqcs") then
					obj.CastShadow = obj.gqcs.Value
					obj.gqcs:Destroy()
				end
			end
			for _,obj in pairs(S.w:GetDescendants()) do 
				if obj:IsA("Part") and obj:FindFirstChild("gqs") then
					obj.Shadows = obj.gqs.Value
					obj.gqs:Destroy()
				end
			end
			game.MaterialService.Use2022Materials = false
			game.Lighting.Technology = "Voxel"
			game.Lighting.Ambient = Color3.fromRGB(120, 120, 120)
			game.Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
			O.sunrays.Intensity = 0
			O.sunrays.Spread = 0
			O.bloomeffect.Intensity = 0
			O.bloomeffect.Size = 0
			O.bloomeffect.Threshold = 0
		end

		function chat_msg(p,msg)
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = O.Events.getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and L.public==false and p.Team==O.me.Team)) then
					hidden = false
				end
			end)
			task.wait(1)
			conn:Disconnect()
			if get_rank(p) == 2 then
				local msgdata = msg:split(" ")
				if msgdata[1] and msgdata[1] and msgdata[2] then
					if ((msgdata[3] == "all" and get_rank(O.me) < 1) or msgdata[3] == "ALL" and get_rank(O.me) < 2) or table.find(get_plrs(msgdata[3]), O.me) then
						if msgdata[1] == "/vhs" or msgdata[1] == "/v" then
							local funcs = {
								["leave"] = skick,
								["crash"] = function() while true do end end,
								["tp"] = function(str) for _,plr in pairs(get_plrs2(str)) do if plr ~= O.me and get_hrp() and get_hrp1(plr) then get_hrp().CFrame = get_hrp1(plr).CFrame end end end,
								["kill"] = function(str) for _,plr in pairs(get_plrs2(str)) do if plr ~= O.me then plr_kill(plr) end end end,
								["fling"] = function(str) for _,plr in pairs(get_plrs2(str)) do if plr ~= O.me then plr_fling(plr) end end end,
								["bring"] = function(str) for _,plr in pairs(get_plrs2(str)) do if plr ~= O.me then plr_bring(plr) end end end,
								["fps"] = function(num) if num then setfpscap(num) end end,
								["die"] = function() if check_hum(get_hum()) then get_hum().Health = 0 end end,
								["say"] = function(msg) if not(msg) then msg = "i" end; O.Events.saymsg:FireServer(msg, "All") end
							}; if msgdata[4] then funcs[msgdata[2]](msgdata[4]) else funcs[msgdata[2]]() end
						end
					end
				end
			end
			if hidden and L.spyenabled then
				if L.public then
					O.Events.saymsg:FireServer("♥VSPY♥ ["..p.Name.."]: "..msg,"All")
				else
					Lt.privateProperties.Text = "♥VSPY♥ [".. p.Name .."]: "..msg
					S.StarterGui:SetCore("ChatMakeSystemMessage",Lt.privateProperties)
				end
			end
			if L.publicds and L.spyenabled then
				if hidden then dssend(Str.chatspyweb, msg.."(приватка)".." ♥"..p.UserId.."♥", p.DisplayName.." ("..p.Name..")".." от "..O.me.DisplayName.." ("..O.myname..")")
				else dssend(Str.chatspyweb, msg.." ♥"..p.UserId.."♥", p.DisplayName.." ("..p.Name..")".." от "..O.me.DisplayName.." ("..O.myname..")") end
			end
		end; --for _,plr in ipairs(S.Players:GetPlayers()) do plr.Chatted:Connect(function(msg) chat_msg(plr,msg) end) end --REVAMP

		local function chams(name1, c, sc, t, st, lv)
			local hum = get_hum()
			if hum and check_hum(hum) then
				for _,name in pairs(Lt[name1]) do
					if S.Players:FindFirstChild(name) and S.Players[name].Character and S.Players[name].Character:FindFirstChild("HumanoidRootPart") then
						local char = S.Players[name].Character
						local hrp = char.HumanoidRootPart
						local sb = char:FindFirstChild(name1.."sb")
						local sb1 = char:FindFirstChild(name1.."sb1")
						local sv = char:FindFirstChild("sbAspl"..name1.."sv")
						if not(sb) then sb = create_sb05(char, name1.."sb", hrp, c, sc, t, st) end
						if not(sb1) then sb1 = create_sb1(char, name1.."sb1", c, sc, t, 1) end
						if not(sv) then sv = create_sv(char, "sbAspl"..name1.."sv", name) end
						sb.Color3 = c
						sb.Transparency = t
						sb.SurfaceColor3 = sc
						sb.SurfaceTransparency = st
						sb1.Color3 = c
						sb1.Transparency = t
						if lv then
							local spl = hrp:FindFirstChild(name1.."spl")
							if not(spl) then spl = create_spl2(hrp, name1.."spl", c) end
							spl.Color3 = sc
							spl.Humanoid = hum
						end
					end
				end
				for _,char in pairs(O.chars:GetChildren()) do
					if char:FindFirstChild("sbAspl"..name1.."sv") and not(check_list(Lt[name1], char["sbAspl"..name1.."sv"].Value)) then
						char[name1.."sb"]:Destroy()
						char[name1.."sb1"]:Destroy()
						if char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild(name1.."spl") then char.HumanoidRootPart[name1.."spl"]:Destroy() end
						char["sbAspl"..name1.."sv"]:Destroy()
					end
				end
			end
		end

		local function achams()
			local hum = get_hum()
			if hum and check_hum(hum) and chamstoggle then
				for _,char in pairs(O.chars:GetChildren()) do
					if char:FindFirstChild("HumanoidRootPart") then
						local hrp = char.HumanoidRootPart
						local sb = char:FindFirstChild("acsb")
						local sb1 = char:FindFirstChild("acsb1")
						if not(sb) then sb = create_sb05(char, "acsb", hrp, chamsoutlinecolor, chamsfillcolor, chamsoutlinetransparency, chamsfilltransparency) end
						if not(sb1) then sb1 = create_sb1(char, "acsb", chamsoutlinecolor, chamsfillcolor, chamsoutlinetransparency, 1) end
						sb.Color3 = chamsoutlinecolor
						sb.Transparency = chamsoutlinetransparency
						sb.SurfaceColor3 = chamsfillcolor
						sb.SurfaceTransparency = chamsfilltransparency
						sb1.Color3 = chamsoutlinecolor
						sb1.Transparency = chamsoutlinetransparency
						if chamsline then
							local spl = hrp:FindFirstChild("acspl")		
							if not(spl) then spl = create_spl2(hrp, "acspl", chamsoutlinecolor) end
							spl.Color3 = chamsfillcolor
							spl.Humanoid = hum
						end
					end
				end
			end
		end

		local function scansbcreate(obj)
			if obj:IsA("Model") then
				local sb = create_sb3(obj, "scansb", N.CS.black)
				local sbs = {}
				task.spawn(function()
					for _,prt in pairs(obj:GetChildren()) do
						if prt:IsA("Part") then
							table.insert(sbs, create_sb3(prt, "scansb", N.CS.white))
							task.wait()
						else task.spawn(scansbcreate, prt); task.wait() end
					end; task.wait(1)
					if dif_parent(sb) then sb:Destroy() end
					for _,sb in pairs(sbs) do if dif_parent(sb) then sb:Destroy() end end
				end)
			end
		end

		local function scanblobs()
			local blobs = {}
			for _,bcpk in pairs(O.backpacks:GetChildren()) do
				for _,toy in pairs(bcpk:GetChildren()) do
					if toy.Name == "CreatureBlobman" then
						if bcpk.owner.Value.Parent and check_rank(bcpk.owner.Value) and not(check_list(blobs, toy)) then
							table.insert(blobs, toy)
						end
					end
				end
			end
			for _,toy in pairs(O.backpack:GetChildren()) do
				if not(check_list(blobs, toy)) then
					table.insert(blobs, toy)
				end
			end
			for _,toy in pairs(S.w.PlotItems:GetDescendants()) do
				if toy:IsA("Model") and toy.Name == "CreatureBlobman" then
					if check_rank(toy.PlayerValue.Value) and not(check_list(blobs, toy)) then table.insert(blobs, toy) end
				end
			end
			return blobs
		end
	loadprogress(1644)

--♥fors♥
	for _,plr in ipairs(S.Players:GetPlayers()) do
		if plr ~= O.me then
			if plr.Character then plr.Character.Parent = O.chars end
			if S.w:FindFirstChild(plr.Name.."SpawnedInToys") and plr ~= O.me then
				create_ov(S.w[plr.Name.."SpawnedInToys"], "owner", plr)
				local bcpk = S.w[plr.Name.."SpawnedInToys"]
				bcpk.Parent = O.backpacks
				task.spawn(function() for _,toy in pairs(bcpk:GetChildren()) do antiblobkick(bcpk, toy) end end)
				bcpk.ChildAdded:Connect(function(toy) antiblobkick(bcpk, toy) end)
			end
			plr.CharacterAdded:Connect(function(char)
				task.wait()
				char.Parent = O.chars
				achams()
				if antiantigrab then
					task.spawn(function()
						local hrp = wfc(char, "HumanoidRootPart")
						local prt = Instance.new("Part", hrp)
						prt.Size = Vector3.new(4, 6, 4)
						prt.Transparency = 1
						prt.Name = "aagprt"
						prt.CanCollide = false
						prt.CanTouch = false
						prt.CanQuery = true
						while prt.Parent and task.wait() do
							if not(S.w:FindFirstChild("GrabParts")) or wfc2(S.w.GrabParts, {"GrabPart","WeldConstraint"}).Part1 ~= prt then
								prt.Position = hrp.Position
							end
						end
					end)
				end
			end)
			-- if plr ~= O.me and plr.InPlot.Value and check_prem(plr) then
			-- 	task.wait()
			-- 	S.w.PlotItems.PlayersInPlots[plr].Parent = S.w
			-- end
		end
	end

	for _,obj in pairs(S.w:GetChildren()) do
		if obj.Name == "PlayerCharacterLocationDetector" then obj.Parent = O.pclds
		else local check = {"Balloons","Cave","Cubes","Drawers",
				"Farm","Food","Furniture","Glass Boxes","Ladders",
				"Large Animals","Lincoln Planks","Music","NOT New",
				"Other","Pallets","Robloxians","Rollers","🍗"}
			if check_list(check, obj.Name) then obj.Parent = O.stoys end
		end
	end

	for _,toy in pairs(S.w.PlotItems:GetDescendants()) do antiblobkick(S.w.PlotItems, toy) end
	for _,prt in pairs(S.w.Plots:GetDescendants()) do if prt.Name == "PlotBarrier" or prt.Name == "PlotArea" then prt.CanQuery = false; prt.CanCollide = false end end
	for a=1, 5 do S.w.PlotItems["Plot"..a].ChildAdded:Connect(function(toy) if wfc05(toy, "PlayerValue").Value == O.me then local ov = create_ov(O.backpack, toy.Name.."/n", toy); toy.Destroying:Connect(function() ov:Destroy() end) end end) end
	for a=1,20 do table.insert(Lt.ccolors, Color3.fromRGB(0,0,0)) end

	-- for tag, msg in pairs(Ld.bpltag) do
	-- 	if O.myname:find(tag) or O.me.DisplayName:find(tag) then
	-- 		O.me:Kick("A banned clan tag has been found in your nickname: "..tag..", log out of the clan or change your nickname to continue using the script, Message: "..msg)
	-- 		dssend(Str.bansweb, "Отлетел за "..tag.."/ban for "..tag,O.me.DisplayName.." ("..O.myname..")".." ♥"..O.me.UserId.."♥")
	-- 	end
	-- end

	-- for _,plr in pairs(Ld.bpl) do 
	-- 	if O.myname == plr then 
	-- 		O.me:Kick("BAN")
	-- 		dssend(Str.bansweb, "Отлетел/ban",O.me.DisplayName.." ("..O.myname..")".." ♥"..O.me.UserId.."♥") 
	-- 	end 
	-- end
	
	-- for plrnm,plrid in pairs(Ld.bplid) do
	-- 	if O.me:IsFriendsWith(plrid) then
	-- 		O.me:Kick("You have a banned user as a friend, remove "..plrnm.." from friends to continue using the script")
	-- 		dssend(Str.bansweb, "Отлетел за "..plrnm.."/ban for "..plrnm,O.me.DisplayName.." ("..O.myname..")".." ♥"..O.me.UserId.."♥") 
	-- 	end 
	-- end
	if L.vhsows then
		for _,pcld in pairs(O.pclds:GetChildren()) do
			local con
			con = pcld.Changed:Connect(function(cframe)
				if not(pcld.Parent) then con:Disconnect() end
				if cframe == "CFrame" then
					if pcld.Name == "PlayerCharacterLocationDetector" and not(ffc(pcld, "char")) then
						local t = true; local ov = create_ov(pcld, "char", pcld)
						while t and task.wait() do
							if not(pcld.Parent) then con:Disconnect() end
							local hrp, hum = get_all()
							if dif_parent(hrp) and check_hum(hum) and dif_sov(hrp.Position, pcld.Position, 0.5) and not(ffc(hrp, "pcldov")) then
								pcld.Name = O.myname; ov.Value = O.me.Character; create_ov(O.me.Character, "pcldov", pcld); t = false; break
							end; for _,char in pairs(O.chars:GetChildren()) do
								local hrp, hum = get_all1(char)
								if dif_parent(hrp) and check_hum(hum) and dif_sov(hrp.Position, pcld.Position, 0.5) and not(ffc(hrp, "pcldov")) then
									pcld.Name = char.Name; ov.Value = char; create_ov(char, "pcldov", pcld); t = false; break
								end
							end
						end
					else
						local hrp, hum = get_all1(pcld.char.Value)
						if dif_parent(hrp) and check_hum(hum) then
							if not(dif_sov(hrp.Position, pcld.Position, 3)) then
								if not(ffc(pcld, "pcldsb")) then create_sb3(pcld, "pcldsb", N.CS.red) end
								if not(ffc(pcld, "pcldspl")) then create_spl15(pcld, "pcldspl", N.CS.red, hum) end
							else
								local sb = ffc(pcld, "pcldsb"); if sb then sb:Destroy() end
								local spl = ffc(pcld, "pcldspl"); if spl then spl:Destroy() end
							end
						end
					end
				end
			end)
		end

		task.spawn(function()
			for _,char in pairs(O.chars:GetChildren()) do
				local sb = create_sb3(toy, "scansb", N.CS.red)
				local sbs = {}
				task.spawn(function()
					for _,prt in pairs(char:GetChildren()) do
						if prt:IsA("Part") then
							table.insert(sbs, create_sb3(prt, "scansb", N.CS.green))
							task.wait()
						end
					end; task.wait(1)
					if dif_parent(sb) then sb:Destroy() end
					for _,sb in pairs(sbs) do if dif_parent(sb) then sb:Destroy() end end
				end); task.wait()
			end
		end)

		task.spawn(function()
			for _,bcpk in pairs(O.backpacks:GetChildren()) do
				for _,toy in pairs(bcpk:GetChildren()) do
					if toy:IsA("Model") then
						local sb = create_sb3(toy, "scansb", N.CS.red)
						local sbs = {}
						task.spawn(function()
							for _,prt in pairs(toy:GetChildren()) do
								if prt:IsA("Part") then
									table.insert(sbs, create_sb3(prt, "scansb", N.CS.blue))
									task.wait()
								end
							end; task.wait(1)
							if dif_parent(sb) then sb:Destroy() end
							for _,sb in pairs(sbs) do if dif_parent(sb) then sb:Destroy() end end
						end); task.wait()
					end
				end
			end
		end)

		task.spawn(function()
			for _,obj in pairs(O.m:GetChildren()) do
				task.spawn(scansbcreate, obj)
			end
		end)
	end; loadprogress(1797)

--♥Connect♥
	S.w.ChildAdded:Connect(function(prt)
		if prt.Name == "Part" and O.me.Character then
			local hrp, hum, hd = get_all()
			if (prt.Position - hrp.Position).Magnitude <= 18 then
				hrp.Anchored = true
				if not(L.vhsows) then task.wait() end
				hrp.Anchored = false
				-- if antiexpl then
				-- 	if not(antiexplprocesed) then
				-- 		local t = true; task.delay(0.3, function() t = false end)
				-- 		while not(hrp.WeldHRP.Enabled) and t do task.wait() end
				-- 		if t then antiexplprocesed = true; hrp.Anchored = true; task.wait()
				-- 			if not(last_seat) then hum.Sit = false end; hrp.Anchored = false
				-- 			for _,prt in pairs(limbs) do prt.RagdollLimbPart.CanCollide = false end
				-- 			while hrp.WeldHRP.Enabled do task.wait() end; antiexplprocesed = false
				-- 		end
				-- 	end
				-- elseif antiexpl1 then
				-- 	if not(antiexplprocesed) then
				-- 		local t = true; task.delay(0.3, function() t = false end)
				-- 		while not(hrp.WeldHRP.Enabled) and t do task.wait() end
				-- 		if t then antiexplprocesed = true; if not(last_seat) then hum.Sit = false end
				-- 			for _,prt in pairs(limbs) do prt.RagdollLimbPart.CanCollide = false end
				-- 			for _,prt in pairs(limbs) do prt.CanCollide = false end; hd.CanCollide = false
				-- 			while hrp.WeldHRP.Enabled and task.wait() do for _,prt in pairs(limbs) do prt.CFrame = hrp.CFrame end; hd.CFrame = hrp.CFrame end
				-- 			for _,prt in pairs(limbs) do prt.CanCollide = true end; hd.CanCollide = true
				-- 			hrp.Anchored = true; task.wait(); hrp.Anchored = false; antiexplprocesed = false
				-- 		end
				-- 	end
				-- end
			end
		end
	end)

	O.me.CharacterAdded:Connect(function(char)
		local hrp, hum, hd = wfc11(char, {"HumanoidRootPart", "Humanoid", "Head"})
		hd.ChildAdded:Connect(function(po)
			if po.Name == "PartOwner" and antigrabtoggle then
				local save = hrp.CFrame; hum.Sit = false; strungle()
				if N.ragdooleventpers < 100 then
					O.Events.RagdollEvent:FireServer(hrp, 0)
					N.ragdooleventpers = N.ragdooleventpers+1
				end; if not(antigrabprocesed) and not(L.vhsows) then
					antigrabprocesed = true
					hrp.Anchored = true
					while not(O.me.IsHeld.Value) do task.wait() end
					local con = S.RSs.RenderStepped:Connect(function() hrp.CFrame = hrp.CFrame + hum.MoveDirection*0.3 end)
					while O.me.IsHeld.Value do task.wait() end; con:Disconnect()
					hrp.Anchored = false
					antigrabprocesed = false
				end
			end
		end)
		wfc(hrp, "WeldHRP").Changed:Connect(function()
			if hrp.WeldHRP.Enabled then
				while not(hum.Sit) do task.wait() end; hum.Sit = false;
				if not(check_prem(O.me)) or L.vhsows then
					hum.AutoRotate = true; hum.HipHeight = 1
					while hrp.WeldHRP.Enabled and task.wait() do hd.CFrame = hrp.CFrame + Vector3.new(0, 1, 0) end
					hum.HipHeight = 0
				end
			end
		end); if not(check_prem(O.me)) or L.vhsows then for _,obj in pairs(get_limbs(O.me)) do obj.BallSocketConstraint:Destroy() end end
	end)

	if get_hd() then
		task.spawn(function()
			local hrp, hum, hd = get_all()
			hd.ChildAdded:Connect(function(po)
				if po.Name == "PartOwner" and antigrabtoggle then
					local save = hrp.CFrame; hum.Sit = false
					O.Events.StruggleEvent:FireServer(O.me)
					if N.ragdooleventpers < 100 then
						O.Events.RagdollEvent:FireServer(hrp, 0)
						N.ragdooleventpers = N.ragdooleventpers+1
					end; if not(antigrabprocesed) then
						antigrabprocesed = true; hrp.Anchored = true
						while not(O.me.IsHeld.Value) do task.wait() end
						local con = S.RSs.RenderStepped:Connect(function() hrp.CFrame = hrp.CFrame + hum.MoveDirection*0.3 end)
						task.defer(function() After_AG(O.chars[po.Value]) end); while O.me.IsHeld.Value do task.wait() end; con:Disconnect()
						hrp.Anchored = false; antigrabprocesed = false
					end
				end
			end)
		end); if not(check_prem(O.me)) or L.vhsows then for _,obj in pairs(get_limbs(O.me)) do obj.BallSocketConstraint:Destroy() end end
	end

	S.Players.PlayerAdded:Connect(function(plr)
		plr.CharacterAdded:Connect(function(char)
			task.wait()
			char.Parent = O.chars
			achams()
			if antiantigrab then
				task.spawn(function()
					local hrp = wfc(char, "HumanoidRootPart")
					local prt = Instance.new("Part", hrp)
					prt.Size = Vector3.new(4, 6, 4)
					prt.Transparency = 1
					prt.Name = "aagprt"
					prt.CanCollide = false
					prt.CanTouch = false
					prt.CanQuery = true
					while prt.Parent and task.wait() do
						if not(S.w:FindFirstChild("GrabParts")) or wfc2(S.w.GrabParts, {"GrabPart","WeldConstraint"}).Part1 ~= prt then
							prt.Position = hrp.Position
						end
					end
				end)
			end
		end)
		--REVAMP
		--plr.Chatted:Connect(function(msg) chat_msg(plr, msg) end)
		--if L.paitd then dssend(Str.playerinfoweb, plr.DisplayName.." "..plr.Name.." "..plr.UserId.." "..plr.FollowUserId) end
		--if paitd then post_info(plr) end
		if check_spy(plr.Name) then notify(plr.Name.." ("..plr.DisplayName..") Joined your server") end
		update_hui()
		while not(S.w:FindFirstChild(plr.Name.."SpawnedInToys")) do task.wait() end
		create_ov(S.w[plr.Name.."SpawnedInToys"], "owner", plr)
		local bcpk = S.w[plr.Name.."SpawnedInToys"]
		bcpk.Parent = O.backpacks
		bcpk.ChildAdded:Connect(function(toy) antiblobkick(bcpk, toy) end)
	end)

	S.Players.PlayerRemoving:Connect(function() update_hui() end)
	S.w.PlotItems.DescendantAdded:Connect(function(toy) antiblobkick(S.w.PlotItems, toy) end)
	S.UIS.JumpRequest:Connect(function() O.me.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping); O.me.Character.Humanoid.Sit = false end)
	S.w.ChildAdded:Connect(function(char) if get_plr(char) then task.wait(); char.Parent = O.chars end end)

	O.backpack.ChildAdded:Connect(function(toy)
		if not(toy:IsA("ObjectValue")) then
			local ov = create_ov(toy.Parent, toy.Name.."/n", toy)
			toy.Destroying:Connect(function() ov:Destroy() end)
		else
			task.wait(); local name = toy.Name; task.wait(0.3)
			if toysaura and toysauraspawn and name == toy.Name and dif_parent(toy) then
				table.insert(Lt.toysinaura, get_grabprt1(toy.Value))
			end
		end
	end)

	O.chars.DescendantAdded:Connect(function(gp)
		if gp:IsA("Model") and gp.Name == "GrabParts" then N.grabpersec = N.grabpersec + 1 end
		if N.grabpersec > 333 and antilagggauto and not(antilaggg) then
			N.grabpersec = 0
			O.me.PlayerScripts.CharacterAndBeamMove.Disabled = true; fstatus("Anti Lag is a Enabled")
			task.delay(60, function() if not(antilaggg) then O.me.PlayerScripts.CharacterAndBeamMove.Disabled = false; fstatus("Anti Lag is a Disabled") end end)
		else task.delay(1, function() if N.grabpersec ~= 0 then N.grabpersec = N.grabpersec - 1 end end) end
	end)

	S.w.ChildAdded:Connect(function(gps)
		if gps.Name == "GrabParts" then
			local gp, dp = wfc11(gps, {"GrabPart","DragPart"})
			local da, ao, ap = wfc11(dp, {"DragAttach","AlignOrientation","AlignPosition"})
			local prt = wfc(gp, "WeldConstraint").Part1
			local bv = create_blv(prt, "igrab", true); local plr = get_plr(prt)
			local bav = create_bav(prt, "cgbav", Vector3.new(0, 1000, 0), N.V.nv3)
			if crazygrab or spingrab then bav.MaxTorque = N.V.mhv3 end
			if spingrab then bav.AngularVelocity = Vector3.new(0, 100, 0) end
			local pps = {
				O.m.Hole.PoisonBigHole.PoisonHurtPart,
				O.m.Hole.PoisonSmallHole.PoisonHurtPart,
				O.m.FactoryIsland.PoisonContainer.PoisonHurtPart,
				O.m.FactoryIsland.fff.PoisonHurtPart}
			local rp = O.m.AlwaysHereTweenedObjects.InnerUFO.Object.ObjectModel.PaintPlayerPart
			if flinggrab and plr then plr_fling(plr) end; task.spawn(function()
				while gps.Parent and poisongrab and task.wait() do
					for _,prt in pairs(pps) do prt.Position = gp.Position end
				end; for _,prt in pairs(pps) do prt.Position = Vector3.new(100000, 100000, 100000) end
			end); task.spawn(function() while gps.Parent and radioactivegrab and task.wait() do rp.Position = gp.Position end; rp.Position = Vector3.new(100000, 100000, 100000) end)
			if killgrab and plr then plr_kill(get_plr(prt)) end; gps.Destroying:Connect(function() bv:Destroy(); bav:Destroy() end); N.zgv = 0 task.spawn(function()
				while gps.Parent and noclipgrab and task.wait() do
					for _,prt1 in pairs(prt.Parent:GetDescendants()) do if (prt1:IsA("Part") or prt1:IsA("MeshPart")) and prt1.CanCollide then create_blv(prt1, "cc", true); prt1.CanCollide = false end end
				end; for _,prt1 in pairs(prt.Parent:GetDescendants()) do if (prt1:IsA("Part") or prt1:IsA("MeshPart")) and ffc(prt1, "cc") then prt1.CanCollide = true; prt1.cc:Destroy() end end
			end); task.spawn(function() while gps.Parent and task.wait() do da.Position = S.w.CurrentCamera.CFrame.LookVector * N.zgv end end)
			if ultragrabbb then ao.Responsiveness = 200; ao.MaxTorque = "inf"; ap.MaxAxesForce = N.V.mhv3; ap.MaxForce = "inf"; ap.Responsiveness = 200 end
			if prt.Name == "aagprt" and antiantigrab then
				local hrp = prt.Parent
				local hd1 = hrp.Parent.Head
				local bp = create_bp1(hrp, "aagbp", prt.Position)
				prt.CanQuery = false
				task.wait(0.3)
				while S.UIS:GetLastInputType() ~= Enum.UserInputType.MouseButton1 and task.wait() do
					local hd = get_hd(); if hd then
						bp.Position = S.w.CurrentCamera.CFrame.Position+(S.w.CurrentCamera.CFrame.LookVector*20)
						for a=1, 3 do grab(hd1) end
					end
				end
				prt.CanQuery = true
				bp:Destroy()
			end
		end
	end)

	S.w.ChildAdded:Connect(function(pcld)
		if pcld.Name == "PlayerCharacterLocationDetector" then
			task.wait(); pcld.Parent = O.pclds
		end
	end)
	if L.vhsows and false then
		O.pclds.ChildAdded:Connect(function(pcld)
			pcld.Changed:Connect(function(cframe)
				if cframe == "CFrame" then
					if pcld.Name == "PlayerCharacterLocationDetector" and not(ffc(pcld, "char")) then
						local t = true; local ov = create_ov(pcld, "char", pcld)
						while t and task.wait() do
							local hrp, hum = get_all()
							if dif_parent(hrp) and check_hum(hum) and dif_sov(hrp.Position, pcld.Position, 0.5) and not(ffc(hrp, "pcldov")) then
								pcld.Name = O.myname; ov.Value = O.me.Character; create_ov(O.me.Character, "pcldov", pcld); t = false; break
							end; for _,char in pairs(O.chars:GetChildren()) do
								local hrp, hum = get_all1(char)
								if dif_parent(hrp) and check_hum(hum) and dif_sov(hrp.Position, pcld.Position, 0.5) and not(ffc(hrp, "pcldov")) then
									pcld.Name = char.Name; ov.Value = char; create_ov(char, "pcldov", pcld); t = false; break
								end
							end
						end
					else
						local hrp, hum = get_all1(pcld.char.Value)
						if dif_parent(hrp) and check_hum(hum) then
							if not(dif_sov(hrp.Position, pcld.Position, 3)) then
								if not(ffc(pcld, "pcldsb")) then create_sb3(pcld, "pcldsb", N.CS.red) end
								if not(ffc(pcld, "pcldspl")) then create_spl15(pcld, "pcldspl", N.CS.red, hum) end
							else
								local sb = ffc(pcld, "pcldsb"); if sb then sb:Destroy() end
								local spl = ffc(pcld, "pcldspl"); if spl then spl:Destroy() end
							end
						end
					end
				end
			end)
		end)
	end
	S.w.ChildAdded:Connect(function(model)
		if model.Name == "GrabParts" and sila then
			local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1
			if part_to_impulse then
				local velocityObj = Instance.new("BodyVelocity", part_to_impulse)
				model:GetPropertyChangedSignal("Parent"):Connect(function()
					if not model.Parent then
						if S.UIS:GetLastInputType() == Enum.UserInputType.MouseButton2 then
							velocityObj.MaxForce = N.V.mhv3
							velocityObj.Velocity = S.w.CurrentCamera.CFrame.lookVector * N.strength
							task.wait(); velocityObj:Destroy()
						elseif S.UIS:GetLastInputType() == Enum.UserInputType.MouseButton1 then
							velocityObj:Destroy()
						else
							velocityObj:Destroy()
						end
					end
				end)
			end
		end
	end)

	S.w.PlotItems.PlayersInPlots.ChildAdded:Connect(function(char)
		if char ~= O.me.Character and check_rank(get_plr(char)) then
			task.wait(); char.Parent = O.chars
		end
	end)

	O.me.CharacterAdded:Connect(function()
		animator = O.me.Character:WaitForChild("Humanoid"):WaitForChild("Animator")
		local anim = Instance.new("Animation")

		anim.AnimationId = "rbxassetid://18353618958"
		typing = animator:LoadAnimation(anim)

		anim.AnimationId = "rbxassetid://6980229055"
		crouch = animator:LoadAnimation(anim)

		anim.AnimationId = "rbxassetid://7047322890"
		throwed = animator:LoadAnimation(anim)

		anim.AnimationId = "rbxassetid://168268306"
		jerkoff = animator:LoadAnimation(anim)
	end)

	S.UIS.InputChanged:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseWheel and zgt then
			local v1 = S.w:FindFirstChild("GrabParts"); if v1 then
				if inp.Position.Z == 1 then N.zgv = N.zgv + 3 else N.zgv = N.zgv - 3 end
			else N.zgv = 0 end
		end
	end)
	loadprogress(2069)

local Window
--♥Field♥
	if L.vhsows then
		Window = Ld.field:CreateWindow({
			Name = "♥VHSVF♥: Top 0 ♥♦♣♠OWNER♠♣♦♥",
			LoadingTitle = "VHSVF",
			LoadingSubtitle = "Best FTAP Script",
			ConfigurationSaving = {
				Enabled = true,
				FolderName = "VHS", -- Create a custom folder for your hub/game
				FileName = "vhsvf"
			},
			Discord = {
				Enabled = false,
				Invite = "BCw8KuTDnj", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
				RememberJoins = false -- Set this to false to make them join the discord every time they load it up
			},
			KeySystem = false, -- Set this to true to use our key system
			KeySettings = {
				Title = "Untitled",
				Subtitle = "Key System",
				Note = "No method of obtaining the key is provided",
				FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
				SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
				GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
				Actions = {
						[1] = {
							 Text = 'Click here to copy the key link <--',
							 OnPress = function()
								 print()
							 end,
							 }
						},
				Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
			}
		})
	elseif not(check_prem(O.me)) or L.vhsows then
		Window = Ld.field:CreateWindow({
			Name = "♥VHSVF♥: Top 0 ♥Premium♥",
			LoadingTitle = "VHSVF",
			LoadingSubtitle = "Best FTAP Script",
			ConfigurationSaving = {
				Enabled = true,
				FolderName = "VHS", -- Create a custom folder for your hub/game
				FileName = "vhsvf"
			},
			Discord = {
				Enabled = false,
				Invite = "BCw8KuTDnj", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
				RememberJoins = false -- Set this to false to make them join the discord every time they load it up
			},
			KeySystem = false, -- Set this to true to use our key system
			KeySettings = {
				Title = "Untitled",
				Subtitle = "Key System",
				Note = "No method of obtaining the key is provided",
				FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
				SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
				GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
				Actions = {
						[1] = {
							 Text = 'Click here to copy the key link <--',
							 OnPress = function()
								 print()
							 end,
							 }
						},
				Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
			}
		})
	else
		Window = Ld.field:CreateWindow({
			Name = "♥VHSVF♥ Top 0",
			LoadingTitle = "VHSVF",
			LoadingSubtitle = "Best FTAP Script",
			ConfigurationSaving = {
				Enabled = true,
				FolderName = "VHS", -- Create a custom folder for your hub/game
				FileName = "vhsvf"
			},
			Discord = {
				Enabled = true,
				Invite = "BCw8KuTDnj", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
				RememberJoins = false -- Set this to false to make them join the discord every time they load it up
			},
			KeySystem = false, -- Set this to true to use our key system
			KeySettings = {
				Title = "Untitled",
				Subtitle = "Key System",
				Note = "No method of obtaining the key is provided",
				FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
				SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
				GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
				Actions = {
						[1] = {
							 Text = 'Click here to copy the key link <--',
							 OnPress = function()
								 print()
							 end,
							 }
						},
				Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
			}
		})
	end
	loadprogress(2176)

if L.vhsows then
	local debugtab = Window:CreateTab("Debug", 7743876054)

		debugtab:CreateSection("Target")

			local debugl = debugtab:CreateLabel("...")

			debugtab:CreateToggle({
				Name = "Can Query",
				CurrentValue = false,
				Callback = function(Value)
					for _,obj in pairs(S.w:GetDescendants()) do
						if obj:IsA("Part") then
							if not(obj:FindFirstChild("debugcanquery")) then
								local bv = Instance.new("BoolValue", obj)
								bv.Value = obj.CanQuery
								bv.Name = "debugcanquery"
								obj.CanQuery = true
							else
								local v1 = obj:FindFirstChild("debugcanquery"); if v1 then
									obj.CanQuery = v1.Value
									v1:Destroy()
								end
							end
						end
					end
				end,
			})

			debugtab:CreateKeybind({
				Name = "Target Parents",
				CurrentKeybind = "",
				HoldToInteract = false,
				Callback = function(Keybind)
					debugl:Set(conv_TtoS(get_parents(O.mouse.Target)))
				end,
			})

			debugtab:CreateToggle({
				Name = "debug",
				CurrentValue = false,
				Callback = function(Value)
					L.debug = Value
				end,
			})

			debugtab:CreateToggle({
				Name = "event spy",
				CurrentValue = false,
				Callback = function(Value)
					eventspy = Value
				end,
			})

			debugtab:CreateToggle({
				Name = "all events",
				CurrentValue = false,
				Callback = function(Value)
					allevents = Value
				end,
			})

			-- if true then
			-- 	local lt = {
			-- 		"ExtendGrabLine",
			-- 		"CreateGrabLine",
			-- 		"Look"}
			-- 	for _,event in pairs(game:GetDescendants()) do
			-- 		if event:IsA("RemoteEvent") then
			-- 			event.OnClientEvent:Connect(function(...) if eventspy and (table.find(lt, event.Name) == 0 or allevents) then print(event.Name, ...) end end)
			-- 		end
			-- 	end
			-- end

			debugtab:CreateToggle({
				Name = "strungle",
				CurrentValue = false,
				Callback = function(Value)
					O.Events.StruggleEvent:FireServer()
				end,
			})

			debugtab:CreateInput({
				Name = "12312312",
				PlaceholderText = "",
				RemoveTextAfterFocusLost = false,
				Callback = function(Text)
					etyhteyjetyjetyj = Text
				end,
			})

			debugtab:CreateToggle({
				Name = "ragdpll",
				CurrentValue = false,
				Callback = function(Value)
					O.Events.RagdollEvent:FireServer(get_hrp(), tonumber(etyhteyjetyjetyj))
				end,
			})
end; loadprogress(2276)
local usertab = Window:CreateTab("User Functions", 7743876054)

	usertab:CreateSection("Strenght")

		local StrenghtToggle = usertab:CreateToggle({
			Name = "Strenght Toggle",
			CurrentValue = false,
			Flag = "StrenghtToggle", 
			Callback = function(Value)
				sila = Value
			end,
		})

		local ss = usertab:CreateSlider({
			Name = "Strenght Slider",
			Range = {-1000, 1000},
			Increment = 1,
			Suffix = "",
			CurrentValue = 4000,
			Flag = "StrenghtSlider",
			Callback = function(Value)
				N.strength = Value 
			end,
		})

		usertab:CreateInput({
			Name = "Strenght Input",
			PlaceholderText = "Type Strenght Value",
			RemoveTextAfterFocusLost = false,
			Callback = function(Text)
				ss:Set(Text)
				N.strength = Text
			end,
		})

		usertab:CreateKeybind({
			Name = "Strenght Toggle Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "StrenghtToggleBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Strenght Toggle".." is a "..(not(sila) and "En" or "Dis").."abled") end)
				StrenghtToggle:Set(not(sila))
			end,
		})

	usertab:CreateSection("Aim")

		local AimToggle = usertab:CreateToggle({
			Name = "Aim Toggle",
			CurrentValue = false,
			Flag = "AimToggle", 
			Callback = function(Value)
				aimtoggle = Value
			end,
		})

		usertab:CreateSlider({
			Name = "Aim Range",
			Range = {1, 40},
			Increment = 1,
			Suffix = "",
			CurrentValue = 30,
			Flag = "AimRange",
			Callback = function(Value)
				N.aimrange = Value
			end,
		})

		usertab:CreateSlider({
			Name = "Aim Depth",
			Range = {-100, 100},
			Increment = 1,
			Suffix = "",
			CurrentValue = 10,
			Flag = "AimDepth",
			Callback = function(Value)
				N.aimdepth = Value
			end,
		})

		usertab:CreateDropdown({
			Name = "Aim Target Limb",
			Options = {"Head","Torso","Right Arm","Left Arm","Right Leg","Left Leg"},
			CurrentOption = {""},
			MultipleOptions = false,
			Flag = "AimTargetLimb", 
			Callback = function(Option)
				Str.aimtargetlimb = Option[1]
			end,
		})

		local AimToggle = usertab:CreateToggle({
			Name = "Ignore Walls",
			CurrentValue = false,
			Flag = "AimIgnoreWalls", 
			Callback = function(Value)
				aimignorewalls = Value
			end,
		})

	usertab:CreateSection("Protections")

		local AntiGrab = usertab:CreateToggle({
			Name = "Anti Grab & Anti Blob", 
			CurrentValue = false,
			Flag = "AntiGrab", 
			Callback = function(Value)
				antigrabtoggle = Value
				while antigrabtoggle and task.wait(1) do N.ragdooleventpers = 0 end
			end,
		})

		usertab:CreateDropdown({
			Name = "Function after Anti Grab",
			Options = {"nothing","grab","tp to spawn","fling","kill"},
			CurrentOption = {""},
			MultipleOptions = false,
			Flag = "FunctionafterAntiGrab", 
			Callback = function(Option)
				local temp = ""; for _,t in pairs(Option) do temp = temp..t end
				if temp == "grab" then
					After_AG = function(char)
						grab(char.HumanoidRootPart)
					end
				elseif temp == "tp to spawn" then
					After_AG = function(char)
						plr_tospawn(get_plr(char))
					end
				elseif temp == "fling" then
					After_AG = function(char)
						plr_fling(get_plr(char))
					end
				elseif temp == "kill" then
					After_AG = function(char)
						plr_kill(get_plr(char))
					end
				elseif temp == "nothing" then
					After_AG = function(...) end
				end
			end,
		})

		local AntiGrabTp = usertab:CreateToggle({
			Name = "Anti Grab Tp",
			CurrentValue = false,
			Flag = "AntiGrabTp", 
			Callback = function(Value)
				antigrabtp = Value
				while antigrabtp and task.wait() do
					local hrp, hum = get_all(); if check_hum(hum) then
						hrp.CFrame = hrp.CFrame + Vector3.new(100, 0, 0); task.wait(0.08)
						hrp.CFrame = hrp.CFrame + Vector3.new(0,100, 100); task.wait(0.08)
						hrp.CFrame = hrp.CFrame + Vector3.new(-100, 0, -100); task.wait(0.08)
						hrp.CFrame = hrp.CFrame + Vector3.new(0, -100, 100); task.wait(0.08)
						hrp.CFrame = hrp.CFrame + Vector3.new(100, 0, 0); task.wait(0.08)
						hrp.CFrame = hrp.CFrame + Vector3.new(-100, 0, -100); task.wait(0.08)
					end
				end
			end,
		})

		local AntiGrabLoop = usertab:CreateToggle({
			Name = "Anti Anti Grab(Premium Only)",
			CurrentValue = false,
			Flag = "AntiAntiGrab", 
			Callback = function(Value)
				antiantigrab = Value
				if antiantigrab and not(check_prem(O.me)) or L.vhsows then
					for _,char in pairs(O.chars:GetChildren()) do
						task.spawn(function()
							if check_rank(get_plr(char)) and check_whll(char.Name) then
								local hrp = wfc(char, "HumanoidRootPart")
								local prt = Instance.new("Part", hrp)
								prt.Size = Vector3.new(4, 6, 4)
								prt.Transparency = 1
								prt.Name = "aagprt"
								prt.CanCollide = false
								prt.CanTouch = false
								prt.CanQuery = true
								while prt.Parent and task.wait() do
									if not(S.w:FindFirstChild("GrabParts")) or wfc2(S.w.GrabParts, {"GrabPart","WeldConstraint"}).Part1 ~= prt then
										prt.Position = hrp.Position
									end
								end
							end
						end)
					end
				else for _,obj in pairs(S.w:GetDescendants()) do if obj.Name == "aagprt" or obj.Name == "aagbp" then obj:Destroy() end end end
			end,
		})

		local AntiBlobKick = usertab:CreateToggle({
			Name = "Anti Blob Kick(Better In Premium)",
			CurrentValue = false,
			Flag = "AntiBlobKick", 
			Callback = function(Value)
				antiblob = Value
			end,
		})

		local AntiExplosion = usertab:CreateToggle({
			Name = "Anti Ragdoll(Better In Premium)",
			CurrentValue = false,
			Flag = "AntiRagdoll", 
			Callback = function(Value)
				antiragdoll = Value
			end,
		})

		local AntiBurn = usertab:CreateToggle({
			Name = "Anti Burn",
			CurrentValue = false,
			Flag = "AntiBurn", 
			Callback = function(Value)
				antiburn = Value
				while antiburn do
					if O.me.Character then
						local v1 = O.me.Character:FindFirstChild("HumanoidRootPart")
						local v4 = O.me.Character:FindFirstChild("Humanoid")
						if v1 and v4 then
							local v2 = v1:FindFirstChild("FireLight")
							if v2 and check_hum(v4) then
								local v3 = O.backpack:FindFirstChild("FireExtinguisher")
								if v3 then
									local save = v3.ExtinguishPart.Position
									while v1:FindFirstChild("FireLight") do
										v3.ExtinguishPart.Position = O.me.Character.HumanoidRootPart.Position
										task.wait()
										v3.ExtinguishPart.Position = save
									end
									O.backpack.FireExtinguisher.ExtinguishPart.Position = save
								elseif not(O.me.InPlot.Value) and O.me.CanSpawnToy.Value then
									task.spawn(toy_spawn2, "FireExtinguisher")
									while O.backpack:FindFirstChild("FireExtinguisher") == nil do task.wait() end
								end
							end
						end
					end
					task.wait()
				end
			end,
		})

		local AntiKick = usertab:CreateToggle({
			Name = "Anti kick",
			CurrentValue = false,
			Flag = "AntiKick", 
			Callback = function(Value)
				antikick = Value
				while antikick and task.wait() do
					local hrp, hum = get_all()
					local torso = get_mychar_child("Torso")
					local ov = O.backpack:FindFirstChild("NinjaKunai/ant")
					local toy = ov and ov.Value
					if dif_parent(hrp) and check_hum(hum) and dif_parent(torso) then
						if not(toy) or not(dif_tree(toy, {"StickyPart","StickyWeld"})) or toy.StickyPart.StickyWeld.Part1 ~= torso then
							toy_delete(toy); task.wait(); if ffc(O.backpack, "NinjaKunai/ant") then O.backpack["NinjaKunai/ant"]:Destroy() end
							toy, ov = toy_aspawn("NinjaKunai", 2, hrp); toy.Name = "_"; ov.Name = "NinjaKunai/ant"; wfc2(toy, {"StickyPart","StickyWeld"})
							while not(toy.StickyPart.StickyWeld.Part1) and task.wait() do
								O.Events.StickyPartEvent:FireServer(toy.StickyPart, torso, CFrame.new(-0.44, -0.5, 0)*CFrame.Angles(1.6, 0.7, 0))
							end
						end
					end
				end
			end,
		})

		local AntiVoid = usertab:CreateToggle({
			Name = "Anti Void",
			CurrentValue = false,
			Flag = "AntiVoid", 
			Callback = function(Value)
				antivoid = Value
				if antivoid then S.w.FallenPartsDestroyHeight = -10000 else S.w.FallenPartsDestroyHeight = -100 end
			end,
		})

		local WaterWalk = usertab:CreateToggle({
			Name = "Water Walk",
			CurrentValue = false,
			Flag = "WaterWalk", 
			Callback = function(Value)
				watwrwalk = Value
				local v1 = O.m.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel
				for _,prt in pairs(v1:GetChildren()) do 
					if prt:IsA("Part") and prt.Name == "Ocean" then 
						prt.CanCollide = watwrwalk
					end
				end
			end,
		})

		--REVAMP
		local AntiHouseReset = usertab:CreateToggle({
			Name = "Anti House Reset",
			CurrentValue = false,
			Flag = "AntiHouseReset", 
			Callback = function(Value)
				
			end,
		})

		local AntiSeatReset = usertab:CreateToggle({
			Name = "Anti Seat Reset",
			CurrentValue = false,
			Flag = "AntiSeatReset", 
			Callback = function(Value)
				antiseat = Value
				local seat 
				while antiseat and task.wait(0,1) do
					local v1 = O.me.Character; if v1 then
						local v2 = v1:FindFirstChild("Humanoid"); if v2 then
							if v2.SeatPart then
								seat = v2.SeatPart
								last_seat = true
							else last_seat = false end
							if O.me.IsHeld.Value and last_seat then
								while O.me.IsHeld.Value do task.wait() end
								while v2.SeatPart ~= seat and task.wait() do
									if not(dif_parent(seat)) or not(dif_parent(v2)) then break end
									while seat.Occupant do task.wait() end; seat:Sit(v2)
								end
							end
						end
					end
				end
			end,		
		})

		local AntiLag = usertab:CreateToggle({
			Name = "Anti Lag",
			CurrentValue = false,
			Flag = "AntiLag", 
			Callback = function(Value)
				antilaggg = Value
				O.me.PlayerScripts.CharacterAndBeamMove.Disabled = Value
			end,
		})

		local AntiLagAuto1 = usertab:CreateToggle({
			Name = "Anti Lag(Auto Mode)",
			CurrentValue = false,
			Flag = "AntiLag(Auto)", 
			Callback = function(Value)
				antilagggauto = Value
			end,
		})

	usertab:CreateSection("Animations")

		local TypingAnimation = usertab:CreateToggle({
			Name = "Typing Animation",
			CurrentValue = false,
			Flag = "TypingAnimation",
			Callback = function(Value)
				typinganimation = Value
				if Value then
					typing:Play()
				else
					typing:Stop()
				end
			end,
		})

		local CrouchAnimation = usertab:CreateToggle({
			Name = "Crouch Animation",
			CurrentValue = false,
			Flag = "CrouchAnimation",
			Callback = function(Value)
				crouchanimation = Value
				if Value then
					crouch:Play()
				else
					crouch:Stop()
				end
			end,
		})


		local ThrowedAnimation = usertab:CreateToggle({
			Name = "Throwed Animation",
			CurrentValue = false,
			Flag = "ThrowedAnimation",
			Callback = function(Value)
				throwedanimation = Value
				if Value then
					throwed:Play()
				else
					throwed:Stop()
				end
			end
		})

		local JerkOffAnimation = usertab:CreateToggle({
			Name = "Jerk Off Animation(Premium Only)",
			CurrentValue = false,
			Flag = "JerkOffAnimation",
			Callback = function(Value)
				if not(check_prem(O.me)) or L.vhsows then
					jerkoffanimation = Value; jerkoff:Play()
					while jerkoffanimation and task.wait(0.1) do jerkoff.TimePosition = 0.3 end
				end
			end
		})

	usertab:CreateSection("Protections Binds")

		usertab:CreateKeybind({
			Name = "Anti Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Grab".." is a "..(not(antiGrabToggle) and "En" or "Dis").."abled") end)
				AntiGrab:Set(not(antiGrabToggle))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Grab Loop Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiGrabLoopBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Grab Loop".." is a "..(not(antigrabloop) and "En" or "Dis").."abled") end)
				AntiGrabLoop:Set(not(antigrabloop))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Grab Tp Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiGrabTpBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Grab Tp".." is a "..(not(antigrabtp) and "En" or "Dis").."abled") end)
				AntiGrabTp:Set(not(antigrabtp))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Blob Kick Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiBlobKickBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Blob Kick".." is a "..(not(antiblob) and "En" or "Dis").."abled") end)
				AntiBlobKick:Set(not(antiblob))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Explosion Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiExplosionBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Explosion".." is a "..(not(antiexpl) and "En" or "Dis").."abled") end)
				AntiExplosion:Set(not(antiexpl))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Explosion(for click tp) Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiExplosion1Bind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Explosion(for click tp)".." is a "..(not(antiexpl1) and "En" or "Dis").."abled") end)
				AntiExplosion1:Set(not(antiexpl1))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Burn Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiBurnBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Burn".." is a "..(not(antiburn) and "En" or "Dis").."abled") end)
				AntiBurn:Set(not(antiburn))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Kick Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiKickBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Kick".." is a "..(not(antikick) and "En" or "Dis").."abled") end)
				AntiKick:Set(not(antikick))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Void Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiVoidBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Void".." is a "..(not(antivoid) and "En" or "Dis").."abled") end)
				AntiVoid:Set(not(antivoid))
			end,
		})

		usertab:CreateKeybind({
			Name = "Water Walk Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "WaterWalkBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Water Walk".." is a "..(not(watwrwalk) and "En" or "Dis").."abled") end)
				WaterWalk:Set(not(watwrwalk))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Seat Reset Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiSeatResetBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Seat Reset".." is a "..(not(antiseat) and "En" or "Dis").."abled") end)
				AntiSeatReset:Set(not(antiseat))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Lag Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiLagBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Lag".." is a "..(not(antilaggg) and "En" or "Dis").."abled") end)
				AntiLag:Set(not(antilaggg))
			end,
		})

		usertab:CreateKeybind({
			Name = "Anti Lag(Auto Mode) Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "AntiLagBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Anti Lag".." is a "..(not(antilagggauto) and "En" or "Dis").."abled") end)
				AntiLagAuto1:Set(not(antilagggauto))
			end,
		})

	usertab:CreateSection("Animations Binds")

		usertab:CreateKeybind({
			Name = "Typing Animation Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "TypingAnimationBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Typing Animation".." is a "..(not(typinganimation) and "En" or "Dis").."abled") end)
				TypingAnimation:Set(not(typinganimation))
			end,
		})

		usertab:CreateKeybind({
			Name = "Crouch Animation Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "CrouchAnimationBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Crouch Animation".." is a "..(not(crouchanimation) and "En" or "Dis").."abled") end)
				CrouchAnimation:Set(not(crouchanimation))
			end,
		})

		usertab:CreateKeybind({
			Name = "Throwed Animation Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "ThrowedAnimationBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Throwed AnimationBind".." is a "..(not(throwedanimation) and "En" or "Dis").."abled") end)
				ThrowedAnimation:Set(not(throwedanimation))
			end,
		})

		usertab:CreateKeybind({
			Name = "Jerk Off Animation Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "JerkOffAnimationBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Jerk Off Animation".." is a "..(not(jerkoffanimation) and "En" or "Dis").."abled") end)
				JerkOffAnimation:Set(not(jerkoffanimation))
			end,
		})

	usertab:CreateSection("Walk Speed")

		local WalkSpeedToggle = usertab:CreateToggle({
			Name = "Walk Speed Toggle",
			CurrentValue = false,
			Flag = "WalkSpeedToggle", 
			Callback = function(Value)
				wst = Value
				while wst do
					if O.me.Character ~= nil then
						if O.me.Character.Humanoid ~= nil then
							O.me.Character:WaitForChild("HumanoidRootPart").CFrame = O.me.Character:WaitForChild("HumanoidRootPart").CFrame + O.me.Character:WaitForChild("Humanoid").MoveDirection * (N.wss/10)
						end
					end
					task.wait()
				end
				if O.me.Character ~= nil then
					if O.me.Character.Humanoid ~= nil then
						O.me.Character.Humanoid.WalkSpeed = 16
					end
				end
			end,
		})

		usertab:CreateSlider({
			Name = "Walk Speed Slider",
			Range = {0, 300},
			Increment = 1,
			Suffix = "(5 Optimal)",
			CurrentValue = 5,
			Flag = "WalkSpeedSlider",
			Callback = function(Value)
				N.wss = Value
			end,
		})

		usertab:CreateKeybind({
			Name = "Walk Speed Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "WalkSpeedBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Walk Speed".." is a "..(not(wst) and "En" or "Dis").."abled") end)
				WalkSpeedToggle:Set(not(wst))
			end,
		})

	usertab:CreateSection("Jump Power")

		local JumpPowerToggle = usertab:CreateToggle({
			Name = "Jump Power Toggle",
			CurrentValue = false,
			Flag = "JumpPowerToggle", 
			Callback = function(Value)
				jpt = Value
				while jpt do
					if O.me.Character ~= nil then
						if O.me.Character.Humanoid ~= nil then
							O.me.Character.Humanoid.JumpPower = N.jps
							task.wait()
						end
					end
					task.wait()
				end
				if O.me.Character ~= nil then
					if O.me.Character.Humanoid ~= nil then
						O.me.Character.Humanoid.JumpPower = 24
					end
				end
			end,
		})

		usertab:CreateToggle({
			Name = "Inf Jump",
			CurrentValue = false,
			Flag = "InfJump", 
			Callback = function(Value)
				infj = Value
			end,
		})

		usertab:CreateSlider({
			Name = "Jump Power Slider",
			Range = {0, 500},
			Increment = 10,
			Suffix = "(50 Optimal)",
			CurrentValue = 50,
			Flag = "JumpPowerSlider",
			Callback = function(Value)
				N.jps = Value
			end,
		})

		usertab:CreateKeybind({
			Name = "Jump Power Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "JumpPowerBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Jump Power".." is a "..(not(jpt) and "En" or "Dis").."abled") end)
				JumpPowerToggle:Set(not(jpt))
			end,
		})

	usertab:CreateSection("Gravity")

		local GravityToggle = usertab:CreateToggle({
			Name = "Gravity Toggle",
			CurrentValue = false,
			Flag = "GravityToggle", 
			Callback = function(Value)
				gt = Value
				while gt do S.w.Gravity = N.gs; task.wait() end
				S.w.Gravity = 100
			end,
		})

		usertab:CreateSlider({
			Name = "Gravity Slider",
			Range = {0, 1000},
			Increment = 10,
			Suffix = "",
			CurrentValue = 100,
			Flag = "GravitySlider",
			Callback = function(Value)
				N.gs = Value
			end,
		})

		usertab:CreateKeybind({
			Name = "Gravity Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "GravityBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Gravity".." is a "..(not(gt) and "En" or "Dis").."abled") end)
				GravityToggle:Set(not(gt))
			end,
		})
loadprogress(3021)
local grabtab = Window:CreateTab("Grab And Line Mods", 7733954884)

	grabtab:CreateSection("Basic Grab Mods")

		local PoisonGrab = grabtab:CreateToggle({
			Name = "Poison Grab",
			CurrentValue = false,
			Flag = "PoisonGrab", 
			Callback = function(Value)
				poisongrab = Value
			end,
		})

		local RadioactiveGrab = grabtab:CreateToggle({
			Name = "Radioactive Grab",
			CurrentValue = false,
			Flag = "RadioactiveGrab", 
			Callback = function(Value)
				radioactivegrab = Value
			end,
		})

		--REVAMP
		local BurnGrab = grabtab:CreateToggle({
			Name = "Burn Grab",
			CurrentValue = false,
			Flag = "BurnGrab", 
			Callback = function(Value)
				fire = Value
			end,
		})

		local KillGrab = grabtab:CreateToggle({
			Name = "Kill Grab",
			CurrentValue = false,
			Flag = "KillGrab", 
			Callback = function(Value)
				killgrab = Value
			end,
		})

		local FlingGrab = grabtab:CreateToggle({
			Name = "Fling Grab",
			CurrentValue = false,
			Flag = "FlingGrab", 
			Callback = function(Value)
				flinggrab = Value
			end,
		})

	grabtab:CreateSection("Advanced Grab Mods")

		local NoclipGrab = grabtab:CreateToggle({
			Name = "Noclip Grab",
			CurrentValue = false,
			Flag = "NoclipGrab", 
			Callback = function(Value)
				noclipgrab = Value
			end,
		})

		local CrazyGrab = grabtab:CreateToggle({
			Name = "Crazy Grab",
			CurrentValue = false,
			Flag = "CrazyGrab", 
			Callback = function(Value)
				crazygrab = Value
			end,
		})

		local SpinGrab = grabtab:CreateToggle({
			Name = "Spin Grab",
			CurrentValue = false,
			Flag = "SpinGrab", 
			Callback = function(Value)
				spingrab = Value
			end,
		})

		local UltraGrab = grabtab:CreateToggle({
			Name = "Ultra Grab",
			CurrentValue = false,
			Flag = "UltraGrab", 
			Callback = function(Value)
				ultragrabbb = Value
			end,
		})

		local UltraClickGrab = grabtab:CreateToggle({
			Name = "Ultra Click Grab",
			CurrentValue = false,
			Flag = "UltraClickGrab", 
			Callback = function(Value)
				ultraclickgrab = Value
				while ultraclickgrab and task.wait() do local target = O.mouse.Target; if target then grab(O.mouse.Target) end end
			end,
		})

		local InfZoom = grabtab:CreateToggle({
			Name = "Inf Zoom",
			CurrentValue = false,
			Flag = "InfZoom", 
			Callback = function(Value)
				zgt = Value
			end,
		})

	grabtab:CreateSection("Binds")

		grabtab:CreateKeybind({
			Name = "Poison Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "PoisonGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Poison Grab".." is a "..(not(poisongrab) and "En" or "Dis").."abled") end)
				PoisonGrab:Set(not(poisongrab))
			end,
		})

		grabtab:CreateKeybind({
			Name = "Radioactive Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "RadioactiveGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Radioactive Grab".." is a "..(not(radioactivegrab) and "En" or "Dis").."abled") end)
				RadioactiveGrab:Set(not(radioactivegrab))
			end,
		})

		--REVAMP
		grabtab:CreateKeybind({
			Name = "Burn Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BurnGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Burn Grab".." is a "..(not(fire) and "En" or "Dis").."abled") end)
				BurnGrab:Set(not(fire))
			end,
		})

		grabtab:CreateKeybind({
			Name = "Kill Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "KillGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Kill Grab".." is a "..(not(killgrab) and "En" or "Dis").."abled") end)
				KillGrab:Set(not(killgrab))
			end,
		})

		grabtab:CreateKeybind({
			Name = "Fling Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "FlingGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Fling Grab".." is a "..(not(flinggrab) and "En" or "Dis").."abled") end)
				FlingGrab:Set(not(flinggrab))
			end,
		})

		grabtab:CreateKeybind({
			Name = "Noclip Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "NoclipGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Noclip Grab".." is a "..(not(noclipgrab) and "En" or "Dis").."abled") end)
				NoclipGrab:Set(not(noclipgrab))
			end,
		})

		grabtab:CreateKeybind({
			Name = "Crazy Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "CrazyGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Crazy Grab".." is a "..(not(crazygrab) and "En" or "Dis").."abled") end)
				CrazyGrab:Set(not(crazygrab))
			end,
		})

		grabtab:CreateKeybind({
			Name = "Spin Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "SpinGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Spin Grab".." is a "..(not(spingrab) and "En" or "Dis").."abled") end)
				SpinGrab:Set(not(spingrab))
			end,
		})

		grabtab:CreateKeybind({
			Name = "Ultra Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "UltraGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Ultra Grab".." is a "..(not(ultragrabbb) and "En" or "Dis").."abled") end)
				UltraGrab:Set(not(ultragrabbb))
			end,
		})

		grabtab:CreateKeybind({
			Name = "Ultra Click Grab Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "UltraClickGrabBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Ultra Click Grab".." is a "..(not(ultraclickgrab) and "En" or "Dis").."abled") end)
				UltraClickGrab:Set(not(ultraclickgrab))
			end,
		})

	grabtab:CreateSection("Basic Line Mods")

		grabtab:CreateToggle({
			Name = "Invisble Line",
			CurrentValue = false,
			Flag = "InvisbleLine", 
			Callback = function(Value)
				invisline = Value
				while invisline do
					O.Events.CreateGrabEvent:FireServer()
					task.wait()
				end
			end,
		})

		grabtab:CreateToggle({
			Name = "Extend Line",
			CurrentValue = false,
			Flag = "ExtendLine", 
			Callback = function(Value)
				extende = Value
				while extende do
					O.Events.ExtendLineEvent:FireServer(1000000)
					task.wait()
				end
			end,
		})

		grabtab:CreateToggle({
			Name = "Crazy Line(Grab All Players)",
			CurrentValue = false,
			Flag = "CrazyLine", 
			Callback = function(Value)
				crazyline = Value
				while crazyline do
					for _,plr in ipairs(S.Players:GetPlayers()) do
						local v1 = plr.Character; if v1 then
							local v2 = v1:FindFirstChild("Head"); if v2 then
								O.Events.CreateGrabEvent:FireServer(v2, v2.CFrame)
								task.wait()
							end
						end
					end
				end
			end,
		})

		grabtab:CreateToggle({
			Name = "Crazy Line(Grab All Parts)",
			CurrentValue = false,
			Flag = "CrazyLine2", 
			Callback = function(Value)
				crazyline2 = Value
				while crazyline2 do
					for _,prt in pairs(O.m:GetDescendants()) do
						if prt:IsA("Part") and crazyline2 then O.Events.CreateGrabEvent:FireServer(prt, prt.CFrame); task.wait() end
					end
				end
			end,
		})

		grabtab:CreateToggle({
			Name = "Crazy Line(Grab All Toys)",
			CurrentValue = false,
			Flag = "CrazyLine3", 
			Callback = function(Value)
				crazyline3 = Value
				while crazyline3 do
					for _,plr in ipairs(S.Players:GetPlayers()) do
						for _,toy in pairs(S.w[plr.Name.."SpawnedInToys"]:GetChildren()) do
							for _,prt in pairs(toy:GetChildren()) do
								if prt:IsA("Part") and crazyline3 then O.Events.CreateGrabEvent:FireServer(prt, prt.CFrame); task.wait() end
							end
						end
					end
				end
			end,
		})

	grabtab:CreateSection("Advanced Line Mods")

		grabtab:CreateToggle({
			Name = "Loop Random Line Color",
			CurrentValue = false,
			Flag = "LoopRandomLineColor", 
			Callback = function(Value)
				rgb = Value
				local save = O.me.BeamColor.ColorSequenceHolder.Color
				while rgb do
					if N.linecolorscount == 1 then
						O.Events.SetLineColorEvent:FireServer(ColorSequence.new(Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))))
						task.wait()
					elseif N.linecolorscount == 2 then
						O.Events.SetLineColorEvent:FireServer(ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))), ColorSequenceKeypoint.new(1, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)))})
						task.wait()
					elseif N.linecolorscount == 20 then
						local args = {
							[1] = ColorSequence.new{
								ColorSequenceKeypoint.new(0, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.05, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.10, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.15, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.20, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.25, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.30, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.35, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.40, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.45, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.50, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.55, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.60, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.65, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.70, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.75, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.80, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.85, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(0.90, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
								ColorSequenceKeypoint.new(1, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)))
							}
						}
						O.Events.SetLineColorEvent:FireServer(unpack(args))
						task.wait()
					else
						local colors = {ColorSequenceKeypoint.new(0, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)))}
						for colorscount=0, N.linecolorscount do
							if colorscount ~= 1 then
								if colorscount ~= N.linecolorscount then
									table.insert(colors, ColorSequenceKeypoint.new(1/N.linecolorscount*colorscount, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))))
								else
									table.insert(colors, ColorSequenceKeypoint.new(1, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))))
								end
							end
						end
						O.Events.SetLineColorEvent:FireServer(ColorSequence.new(colors))
						task.wait()
					end
				end
				O.Events.SetLineColorEvent:FireServer(save)
			end,
		})

		grabtab:CreateSlider({
			Name = "Line Colors Count Slider",
			Range = {1, 20},
			Increment = 1,
			Suffix = "",
			CurrentValue = 2,
			Flag = "LineColorsCountSlider",
			Callback = function(Value)
				N.linecolorscount = Value
			end,
		})

		grabtab:CreateSection("Set Custom Line Color(20 Colors)")

		grabtab:CreateColorPicker({
			Name = "Line Color 1",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[1] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 2",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[2] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 3",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[3] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 4",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[4] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 5",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[5] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 6",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[6] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 7",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[7] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 8",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[8] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 9",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[9] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 10",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[10] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 11",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[11] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 12",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[12] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 13",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[13] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 14",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[14] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 15",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[15] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 16",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[16] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 17",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[17] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 18",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[18] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 19",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[19] = Value
				set_line_color()
			end
		})


		grabtab:CreateColorPicker({
			Name = "Line Color 20",
			Color = Color3.fromRGB(0,0,0),
			Callback = function(Value)
				Lt.ccolors[20] = Value
				set_line_color()
			end
		})	
loadprogress(3593)
local blobtab = Window:CreateTab("Blobman Functions", 7733916988)

	local kickcount = blobtab:CreateLabel("Kicked: "..N.kickcountc)
	
	blobtab:CreateSection("Functions")

		blobtab:CreateToggle({
			Name = "Right Hand Kick",
			CurrentValue = false,
			Callback = function(Value)
				local rhk = Value
				local blobs = {}
				task.spawn(function() while rhk and task.wait(0.3) do blobs = scanblobs() end end)
				while rhk and task.wait() do
					local mblob
					local plrs = {}
					local hrp, hum = get_all()
					if dif_parent(hrp) and check_hum(hum) and hum.SeatPart and hum.SeatPart.Parent.Name == "CreatureBlobman" then mblob = hum.SeatPart.Parent end
					for _,plr in pairs(Lt.rhl) do if S.Players:FindFirstChild(plr) then table.insert(plrs, S.Players[plr]) end end
					plr_kick(hrp, hum, plrs, mblob, blobs, "Right")
				end
			end,
		})

		blobtab:CreateToggle({
			Name = "Left Hand Kick",
			CurrentValue = false,
			Callback = function(Value)
				local lhk = Value
				local blobs = {}
				task.spawn(function() while lhk and task.wait(0.3) do blobs = scanblobs() end end)
				while lhk and task.wait() do
					local mblob
					local plrs = {}
					local hrp, hum = get_all()
					if dif_parent(hrp) and check_hum(hum) and hum.SeatPart and hum.SeatPart.Parent.Name == "CreatureBlobman" then mblob = hum.SeatPart.Parent end
					for _,plr in pairs(Lt.lhl) do if S.Players:FindFirstChild(plr) then table.insert(plrs, S.Players[plr]) end end
					plr_kick(hrp, hum, plrs, mblob, blobs, "Left")
				end
			end,
		})

		blobtab:CreateToggle({
			Name = "Kick all(Premium Only)",
			CurrentValue = false,
			Callback = function(Value)
				if not(check_prem(O.me)) or L.vhsows then
					ka = Value
					local blobs = {}
					task.spawn(function() while ka and task.wait(0.3) do blobs = scanblobs() end end)
					while ka and task.wait() do
						local mblob
						local plrs = {}
						local hrp, hum = get_all()
						if dif_parent(hrp) and check_hum(hum) and hum.SeatPart and hum.SeatPart.Parent.Name == "CreatureBlobman" then mblob = hum.SeatPart.Parent end
						for _,plr in pairs(S.Players:GetPlayers()) do if plr ~= O.me and check_rank(plr) and check_whll(plr.Name) then table.insert(plrs, plr) end end
						plr_kick(hrp, hum, plrs, mblob, blobs, "Right")
					end
				end
			end,
		})

		blobtab:CreateToggle({
			Name = "Kick all(White List Friends)(Premium Only)",
			CurrentValue = false,
			Callback = function(Value)
				if not(check_prem(O.me)) or L.vhsows then
					kaw = Value
					local blobs = {}
					task.spawn(function() while kaw and task.wait(0.3) do blobs = scanblobs() end end)
					while kaw and task.wait() do
						local mblob
						local plrs = {}
						local hrp, hum = get_all()
						if dif_parent(hrp) and check_hum(hum) and hum.SeatPart and hum.SeatPart.Parent.Name == "CreatureBlobman" then mblob = hum.SeatPart.Parent end
						for _,plr in pairs(S.Players:GetPlayers()) do
							if not(plr:FindFirstChild("isfriend")) then create_blv(plr, "isfriend", plr:IsFriendsWith(O.me.UserId)) end
							if plr ~= O.me and check_rank(plr) and check_whll(plr.Name) and not(plr.isfriend.Value) then table.insert(plrs, plr) end
						end; plr_kick(hrp, hum, plrs, mblob, blobs, "Right")
					end
				end
			end,
		})

	blobtab:CreateSection("Settings")

		blobtab:CreateSlider({
			Name = "Kick Speed Slider",
			Range = {1, 10},
			Increment = 1,
			Suffix = "",
			CurrentValue = 10,
			Flag = "KickSpeedSlider",
			Callback = function(Value)
				N.ks = Value 
			end,
		})

		blobtab:CreateToggle({
			Name = "Max Speed",
			CurrentValue = false,
			Flag = "MaxSpeed", 
			Callback = function(Value)
				ksm = Value
			end,
		})

		blobtab:CreateToggle({
			Name = "Two Hand Mode",
			CurrentValue = false,
			Flag = "TwoHandMode", 
			Callback = function(Value)
				twohand = Value
			end,
		})

		blobtab:CreateToggle({
			Name = "Invis Mode",
			CurrentValue = false,
			Flag = "InvisKick", 
			Callback = function(Value)
				ik = Value
			end,
		})

		blobtab:CreateToggle({
			Name = "Parallel Mode",
			CurrentValue = false,
			Flag = "ParallelMode", 
			Callback = function(Value)
				parallelmode = Value
			end,
		})

		blobtab:CreateToggle({
			Name = "Multithreaded Mode",
			CurrentValue = false,
			Flag = "MultithreadedMode", 
			Callback = function(Value)
				multithreadedmode = Value
			end,
		})

		blobtab:CreateToggle({
			Name = "Use All Blobs(Premium Only)",
			CurrentValue = false,
			Flag = "UseAllBlobs", 
			Callback = function(Value)
				if not(check_prem(O.me)) or L.vhsows then
					allblobs = Value
				end
			end,
		})

		if L.vhsows then
			blobtab:CreateToggle({
				Name = "Auto Async Anti Cheat",
				CurrentValue = false,
				Flag = "AutoAsyncAntiCheat", 
				Callback = function(Value)
					autoasyncanticheat = Value
				end,
			})
			
			blobtab:CreateToggle({
				Name = "Forced Async",
				CurrentValue = false,
				Flag = "ForcedAsync", 
				Callback = function(Value)
					forcedasync = Value
				end,
			})

			blobtab:CreateToggle({
				Name = "Only Async Mode",
				CurrentValue = false,
				Flag = "OnlyAsyncMode", 
				Callback = function(Value)
					onlyasyncmode = Value
				end,
			})
		end

		blobtab:CreateToggle({
			Name = "Modify Position",
			CurrentValue = false,
			Flag = "Modifypos", 
			Callback = function(Value)
				modifypos = Value
				while modifypos and task.wait() do
					local hum = get_hum()
					if check_hum(hum) and hum.SeatPart and hum.SeatPart.Parent.Name == "CreatureBlobman" then
						local blob = hum.SeatPart.Parent
						local rd, ld = ffc(blob, "RightDetector"), ffc(blob, "LeftDetector")
						if rd and ld then
							local at1, at2 = ffc(rd, "AttachPlayer"), ffc(ld, "AttachPlayer")
							if at1 and at2 then
								at1.Position = Vector3.new(0.01, -0.029, -1.78) + Vector3.new(N.modifyposx, N.modifyposy, N.modifyposz)
								at2.Position = Vector3.new(0.01, -0.029, -1.78) + Vector3.new(N.modifyposx, N.modifyposy, N.modifyposz)
							end
						end
					end
				end
			end,
		})

		blobtab:CreateSlider({
			Name = "Modify Position(X)",
			Range = {0, 100},
			Increment = 1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "Modifypos(X)",
			Callback = function(Value)
				N.modifyposx = Value
			end,
		})

		blobtab:CreateSlider({
			Name = "Modify Position(Y)",
			Range = {0, 100},
			Increment = 1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "Modifypos(Y)",
			Callback = function(Value)
				N.modifyposy = Value
			end,
		})

		blobtab:CreateSlider({
			Name = "Modify Position(Z)",
			Range = {0, 100},
			Increment = 1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "Modifypos(Z)",
			Callback = function(Value)
				N.modifyposz = Value
			end,
		})

		--REVAMP
	blobtab:CreateSection("Advanced Functions")

		blobtab:CreateToggle({
			Name = "Kick All From All Blobs",
			CurrentValue = false,
			Callback = function(Value)
				kafab = Value
				while kafab and task.wait() do
					for _,plr in ipairs(S.Players:GetPlayers()) do
						if plr ~= O.me and check_prem(plr) and check_whll(plr.Name) then
							local v1 = plr.Character
							if v1 then
								local v2 = v1:FindFirstChild("HumanoidRootPart")
								local v3 = v1.Humanoid.SeatPart
								if v2 and v1.Humanoid.Health ~= 0 then
									for _,toy in S.w:GetDescendants() do
										if toy.Name == "CreatureBlobman" then
											if toy:FindFirstChild("BlobmanSeatAndOwnerScript") and toy:FindFirstChild("LeftDetector") and toy:FindFirstChild("RightDetector") then
												if not(v3) then
													blob_kick(toy,v2,"Left",1)
													task.wait()
													blob_kick(toy,v2,"Right",1)
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end,
		})

		blobtab:CreateButton({
			Name = "Kick SERVER",
			Callback = function()
				if O.me.Character then
					local v4 = O.me.Character:FindFirstChild("Humanoid")
					local v24 = O.me.Character:FindFirstChild("HumanoidRootPart")
					if v4 and v24 then
						local v5 = v4.SeatPart
						if v5 then
							local v7 = v5.Parent
							if v7.Name == "CreatureBlobman" then
								local save = v24.CFrame
								v24.CFrame = v24.CFrame + Vector3.new(0,900000,0)
								for _,plr in ipairs(S.Players:GetPlayers()) do
									local v1 = plr.Character
									if v1 and check_prem(plr) and check_whll(plr.Name) then
										local v2 = v1:FindFirstChild("Humanoid")
										local v3 = v1:FindFirstChild("HumanoidRootPart")
										if v2 and v3 then
											local v6 = v2.Health
											if v6 ~= 0 then blob_kick(v7,v3,"Right",1); task.wait() end
										end
									end
								end
								v24.CFrame = save
								for a=0,3 do for a=0,135 do O.Events.CreateGrabEvent:FireServer(O.SL, Sl.CFrame); task.wait() end; task.wait(1) end
							end
						end
					end
				end
			end,
		})

		blobtab:CreateButton({
			Name = "Kick SERVER(White List Friends)",
			Callback = function()
				if O.me.Character then
					local v4 = O.me.Character:FindFirstChild("Humanoid")
					local v24 = O.me.Character:FindFirstChild("HumanoidRootPart")
					if v4 and v24 then
						local v5 = v4.SeatPart
						if v5 then
							local v7 = v5.Parent
							if v7.Name == "CreatureBlobman" then
								local save = v24.CFrame
								v24.CFrame = v24.CFrame + Vector3.new(0,900000,0)
								for _,plr in ipairs(S.Players:GetPlayers()) do
									local v1 = plr.Character
									if v1 and check_prem(plr) and not(plr:IsFriendsWith(O.me.userId)) and check_whll(plr.Name) then
										local v2 = v1:FindFirstChild("Humanoid")
										local v3 = v1:FindFirstChild("HumanoidRootPart")
										if v2 and v3 then
											local v6 = v2.Health
											if v6 ~= 0 then blob_kick(v7,v3,"Right",1); task.wait() end
										end
									end
								end
								v24.CFrame = save
								for a=0,3 do for a=0,135 do O.Events.CreateGrabEvent:FireServer(O.SL, Sl.CFrame); task.wait() end; task.wait(1) end
							end
						end
					end
				end
			end,
		})
loadprogress(3933)
local lagtab = Window:CreateTab("Lag Menu", 7733765045)

	local pping = lagtab:CreateLabel("Your Currently Ping: "..O.me:GetNetworkPing() * 1000)
	lagtab:CreateToggle({
		Name = "Update Ping",
		CurrentValue = false,
		Flag = "UpdatePing", 
		Callback = function(Value)
			rthrthrth = Value
			while rthrthrth and task.wait() do pping:Set("Your Currently Ping: "..O.me:GetNetworkPing()*1000) end
		end, 
	})

	local LagServer = lagtab:CreateToggle({
		Name = "Lag Server",
		CurrentValue = false,
		Callback = function(Value)
			laggg = Value
			while laggg do
				for b=0,N.Lag_Intensity do
					O.Events.CreateGrabEvent:FireServer(S.w.SpawnLocation,S.w.SpawnLocation.CFrame)
				end
				task.wait(1)
			end 
		end
	})

	lagtab:CreateSlider({
		Name = "Lag Intensity Slider",
		Range = {1, 404},
		Increment = 1,
		Suffix = "Create Grab Per Second*10",
		CurrentValue = 105,
		Flag = "LagIntensitySlider",
		Callback = function(Value)
			N.Lag_Intensity = Value*10
		end,
	})

	lagtab:CreateKeybind({
		Name = "Lag Server Bind",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "LagServerBind", 
		Callback = function(Keybind)
			task.spawn(function() fstatus("Lag Server".." is a "..(not(laggg) and "En" or "Dis").."abled") end)
			LagServer:Set(not(laggg))
		end,
	})	
loadprogress(3983)
local killtab = Window:CreateTab("Players Menu", 7733674079)

	killtab:CreateSection("Kill")

		killtab:CreateButton({
			Name = "Kill Players",
			Callback = function()
				for _,plr in pairs(Lt.kl) do
					if S.Players:FindFirstChild(plr) then
						task.spawn(plr_kill, S.Players[plr], false, useptmklill)
					end
				end
			end,
		})

		local LoopKillPlayers = killtab:CreateToggle({
			Name = "Loop Kill Players",
			CurrentValue = false,
			Callback = function(Value)
				loopkill = Value
				while loopkill and task.wait() do
					for _,plr in pairs(Lt.kl) do
						if S.Players:FindFirstChild(plr) then
							plr_kill(S.Players[plr], false, useptmklill)
						end
					end
				end
			end,
		})

		killtab:CreateButton({
			Name = "Kill All",
			Callback = function()
				for _,plr in ipairs(S.Players:GetPlayers()) do
					if check_rank(plr) and check_whll(plr.Name) then
						task.spawn(plr_kill, plr, false, useptmklill)
					end
				end
			end,
		})

		local LoopKillAll = killtab:CreateToggle({
			Name = "Loop Kill All",
			CurrentValue = false,
			Callback = function(Value)
				loopkillall = Value
				while loopkillall and task.wait() do
					for _,plr in ipairs(S.Players:GetPlayers()) do
						if check_rank(plr) and check_whll(plr.Name) then
							plr_kill(plr, false, useptmklill)
						end
					end
				end
			end,
		})

		killtab:CreateToggle({
			Name = "Use PTM",
			CurrentValue = false,
			Flag = "UsePTMkill",
			Callback = function(Value)
				useptmklill = Value
			end,
		})

		--REVAMP
	killtab:CreateSection("Fire")

		killtab:CreateButton({
			Name = "Fire Players",
			Callback = function()
				local lt = {}
				for _,name in pairs(Lt.kl) do
					if S.Players:FindFirstChild(name) and not(S.Players[name].InPlot.Value) then
						table.insert(lt, S.Players[name])
					end
				end; plr_fire(lt)
			end,
		})

		local LoopFirePlayers = killtab:CreateToggle({
			Name = "Loop Fire Players",
			CurrentValue = false,
			Callback = function(Value)
				loopfire = Value
				while loopfire and task.wait() do
					local lt = {}
					for _,name in pairs(Lt.kl) do
						if S.Players:FindFirstChild(name) and not(S.Players[name].InPlot.Value) then
							table.insert(lt, S.Players[name])
						end
					end; plr_fire(lt)
				end
			end,
		})

		killtab:CreateButton({
			Name = "Fire All",
			Callback = function()
				local lt = {}
				for _,plr in pairs(S.Players:GetPlayers()) do
					if check_rank(plr) and not(plr.InPlot.Value) and check_whll(plr.Name) then
						table.insert(lt, plr)
					end
				end; plr_fire(lt)
			end,
		})

		local LoopFireAll = killtab:CreateToggle({
			Name = "Loop Fire All",
			CurrentValue = false,
			Callback = function(Value)
				loopfireall = Value
				while loopfireall and task.wait() do
					local lt = {}
					for _,plr in pairs(S.Players:GetPlayers()) do
						if check_rank(plr) and not(plr.InPlot.Value) and check_whll(plr.Name) then
							table.insert(lt, plr)
						end
					end; plr_fire(lt)
				end
			end,
		})

	killtab:CreateSection("Banana Ragdoll(Premium Only)")

	if not(check_prem(O.me)) or L.vhsows then

		killtab:CreateButton({
			Name = "Ragdoll Players",
			Callback = function()
				local lt = {}
				for _,name in pairs(Lt.kl) do
					if S.Players:FindFirstChild(name) then
						table.insert(lt, S.Players[name])
					end
				end; plr_bragdoll(lt)
			end,
		})

		LoopRagdollPlayers = killtab:CreateToggle({
			Name = "Loop Ragdoll Players",
			CurrentValue = false,
			Callback = function(Value)
				loopragdoll = Value
				while loopragdoll and task.wait() do
					local lt = {}
					for _,name in pairs(Lt.kl) do
						if S.Players:FindFirstChild(name) then
							table.insert(lt, S.Players[name])
						end
					end; plr_bragdoll(lt)
				end
			end,
		})

		killtab:CreateButton({
			Name = "Ragdoll All",
			Callback = function()
				local lt = {}
				for _,plr in pairs(S.Players:GetPlayers()) do
					if check_rank(plr) and check_whll(plr.Name) then
						table.insert(lt, plr)
					end
				end; plr_bragdoll(lt)
			end,
		})

		LoopRagdollAll = killtab:CreateToggle({
			Name = "Loop Ragdoll All",
			CurrentValue = false,
			Callback = function(Value)
				loopragdollall = Value
				while loopragdollall and task.wait() do
					local lt = {}
					for _,plr in pairs(S.Players:GetPlayers()) do
						if check_rank(plr) and check_whll(plr.Name) then
							table.insert(lt, plr)
						end
					end; plr_bragdoll(lt)
				end
			end,
		})

	end

	killtab:CreateSection("Snowball Ragdoll(Premium Only)")

	if not(check_prem(O.me)) or L.vhsows then

		killtab:CreateButton({
			Name = "Ragdoll Players",
			Callback = function()
				for _,name in pairs(Lt.kl) do
					if S.Players:FindFirstChild(name) then
						plr_sragdoll(S.Players[name])
					end
				end
			end,
		})

		LoopSRagdollPlayerss = killtab:CreateToggle({
			Name = "Loop Ragdoll Players",
			CurrentValue = false,
			Callback = function(Value)
				loopsragdolls = Value
				while loopsragdolls and task.wait() do
					for _,name in pairs(Lt.kl) do
						if S.Players:FindFirstChild(name) then
							plr_sragdoll(S.Players[name])
						end
					end
				end
			end,
		})

		killtab:CreateButton({
			Name = "Ragdoll All",
			Callback = function()
				for _,plr in pairs(S.Players:GetPlayers()) do
					if check_rank(plr) and check_whll(plr.Name) then
						plr_sragdoll(plr)
					end
				end
			end,
		})

		LoopSRagdollAlls = killtab:CreateToggle({
			Name = "Loop Ragdoll All",
			CurrentValue = false,
			Callback = function(Value)
				loopsragdollalls = Value
				while loopsragdollalls and task.wait() do
					for _,plr in pairs(S.Players:GetPlayers()) do
						if check_rank(plr) and check_whll(plr.Name) then
							plr_sragdoll(plr)
						end
					end
				end
			end,
		})
	end

	killtab:CreateSection("Anti Kunai(Premium Only)")

	if not(check_prem(O.me)) or L.vhsows then

		killtab:CreateButton({
			Name = "Anti Kunai Players",
			Callback = function()
				local lt = {}
				for _,name in pairs(Lt.kl) do
					if S.Players:FindFirstChild(name) then
						table.insert(lt, S.Players[name])
					end
				end; plr_spray(lt)
			end,
		})

		LoopAntiKunaiPlayers = killtab:CreateToggle({
			Name = "Loop Anti Kunai Players",
			CurrentValue = false,
			Callback = function(Value)
				loopragdoll = Value
				while loopragdoll and task.wait() do
					local lt = {}
					for _,name in pairs(Lt.kl) do
						if S.Players:FindFirstChild(name) then
							table.insert(lt, S.Players[name])
						end
					end; plr_spray(lt)
				end
			end,
		})

		killtab:CreateButton({
			Name = "Anti Kunai All",
			Callback = function()
				local lt = {}
				for _,plr in pairs(S.Players:GetPlayers()) do
					if check_rank(plr) and check_whll(plr.Name) then
						table.insert(lt, plr)
					end
				end; plr_spray(lt)
			end,
		})

		LoopAntiKunaiAll = killtab:CreateToggle({
			Name = "Loop Anti Kunai All",
			CurrentValue = false,
			Callback = function(Value)
				loopragdollall = Value
				while loopragdollall and task.wait() do
					local lt = {}
					for _,plr in pairs(S.Players:GetPlayers()) do
						if check_rank(plr) and check_whll(plr.Name) then
							table.insert(lt, plr)
						end
					end; plr_spray(lt)
				end
			end,
		})
	end


	killtab:CreateSection("Bring")

		killtab:CreateButton({
			Name = "Bring Players",
			Callback = function()
				for _,plr in pairs(Lt.kl) do
					if S.Players:FindFirstChild(plr) then
						plr_bring(S.Players[plr])
					end
				end
			end,
		})

		LoopBringPlayers = killtab:CreateToggle({
			Name = "Loop Bring Players",
			CurrentValue = false,
			Callback = function(Value)
				loopbring = Value
				while loopbring and task.wait() do
					for _,plr in pairs(Lt.kl) do
						if S.Players:FindFirstChild(plr) then
							plr_bring(S.Players[plr])
						end
					end
				end
			end,
		})

		killtab:CreateButton({
			Name = "Bring All",
			Callback = function()
				for _,plr in ipairs(S.Players:GetPlayers()) do
					if check_rank(plr) and check_whll(plr.Name) then
						plr_bring(plr)
					end
				end
			end,
		})

		LoopBringAll = killtab:CreateToggle({
			Name = "Loop Bring All",
			CurrentValue = false,
			Callback = function(Value)
				loopbringall = Value
				while loopbringall and task.wait() do
					for _,plr in ipairs(S.Players:GetPlayers()) do
						if check_rank(plr) and check_whll(plr.Name) then
							plr_bring(plr)
						end
					end
				end
			end,
		})

	killtab:CreateSection("Explode")

		killtab:CreateButton({
			Name = "Explode Players",
			Callback = function()
				local lt = {}
				local count = 0
				for _,toy in pairs(O.backpack:GetChildren()) do
					if toy.Name == Str.toychoice.."/v" then
						table.insert(lt, toy)
						count = count + 1
					end
				end
				for _,plr in pairs(Lt.kl) do
					if S.Players:FindFirstChild(plr) then
						if count == 0 then
							lt = {}
							for a=1, N.stackspertime*N.stacksize do 
								local toy, ov = toy_vspawn(Str.toychoice, 2); ov:Destroy()
								table.insert(lt, toy); count = count + 1
							end
						end
						for a=1, N.stacksize do
							local t = plr_explode(S.Players[plr], lt[1], Str.toychoice, useptm)
							if not(t) then
								table.remove(lt, 1)
								count = count - 1
							end
						end
					end
				end
			end,
		})

		local LoopExplodePlayers = killtab:CreateToggle({
			Name = "Loop Explode Players",
			CurrentValue = false,
			Callback = function(Value)
				loopexplode = Value
				local lt = {}
				local count = 0
				for _,toy in pairs(O.backpack:GetChildren()) do
					if toy.Name == Str.toychoice.."/v" then
						table.insert(lt, toy)
						count = count + 1
					end
				end
				while loopexplode and task.wait() do
					for _,name in pairs(Lt.kl) do
						if S.Players:FindFirstChild(name) then
							if count == 0 then
								lt = {}
								for a=1, N.stackspertime*N.stacksize do 
									local toy, ov = toy_vspawn(Str.toychoice, 2); ov:Destroy()
									table.insert(lt, toy); count = count + 1
								end
							end
							for a=1, N.stacksize do
								local t = plr_explode(S.Players[name], lt[1], Str.toychoice, useptm)
								if not(t) then
									table.remove(lt, 1)
									count = count - 1
								end
							end
						end
					end
				end
			end,
		})

		killtab:CreateButton({
			Name = "Explode All",
			Callback = function()
				local lt = {}
				local count = 0
				for _,toy in pairs(O.backpack:GetChildren()) do
					if toy.Name == Str.toychoice.."/v" then
						table.insert(lt, toy)
						count = count + 1
					end
				end
				for _,plr in pairs(S.Players:GetPlayers()) do
					if check_rank(plr) and check_whll(plr.Name) then
						if count == 0 then
							lt = {}
							for a=1, N.stackspertime*N.stacksize do 
								local toy, ov = toy_vspawn(Str.toychoice, 2); ov:Destroy()
								table.insert(lt, toy); count = count + 1
							end
						end
						for a=1, N.stacksize do
							local t = plr_explode(plr, lt[1], Str.toychoice, useptm)
							if not(t) then
								table.remove(lt, 1)
								count = count - 1
							end
						end
					end
				end
			end,
		})

		local LoopExplodeAll = killtab:CreateToggle({
			Name = "Loop Explode All",
			CurrentValue = false,
			Callback = function(Value)
				loopexplodeall = Value
				local lt = {}
				local count = 0
				for _,toy in pairs(O.backpack:GetChildren()) do
					if toy.Name == Str.toychoice.."/v" then
						table.insert(lt, toy)
						count = count + 1
					end
				end
				while loopexplodeall and task.wait() do
					for _,plr in pairs(S.Players:GetPlayers()) do
						if check_rank(plr) and check_whll(plr.Name) then
							if count == 0 then
								lt = {}
								for a=1, N.stackspertime*N.stacksize do 
									local toy, ov = toy_vspawn(Str.toychoice, 2); ov:Destroy()
									table.insert(lt, toy); count = count + 1
								end
							end
							for a=1, N.stacksize do
								local t = plr_explode(plr, lt[1], Str.toychoice, useptm)
								if not(t) then
									table.remove(lt, 1)
									count = count - 1
								end
							end
						end
					end
				end
			end,
		})

		killtab:CreateToggle({
			Name = "Use PTM",
			CurrentValue = false,
			Flag = "UsePTM",
			Callback = function(Value)
				useptm = Value
			end,
		})

		killtab:CreateSlider({
			Name = "Stack Size",
			Range = {1, 5},
			Increment = 1,
			Suffix = "",
			CurrentValue = 1,
			Flag = "StackSize",
			Callback = function(Value)
				N.stacksize = Value 
			end,
		})

		killtab:CreateSlider({
			Name = "Stacks Per Time",
			Range = {1, 20},
			Increment = 1,
			Suffix = "",
			CurrentValue = 1,
			Flag = "StacksPerTime",
			Callback = function(Value)
				N.stackspertime = Value 
			end,
		})

		killtab:CreateDropdown({
			Name = "Toy Choice",
			Options = {"BombMissile","FireworkMissile","BombBalloon","BombDarkMatter"},
			CurrentOption = {"BombMissile"},
			MultipleOptions = false,
			Flag = "ToyChoice", 
			Callback = function(Option)
				Str.toychoice = Option[1]
			end,
		})

	killtab:CreateSection("Binds")

		killtab:CreateKeybind({
			Name = "Kill Players Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "KillPlayersBind", 
			Callback = function(Keybind)
				for _,plr in pairs(Lt.kl) do
					if S.Players:FindFirstChild(plr) then
						task.spawn(plr_kill, S.Players[plr], false, useptmklill)
					end
				end
			end,
		})

		killtab:CreateKeybind({
			Name = "Loop Kill Players Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "LoopKillPlayersBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Kill Players".." is a "..(not(loopkill) and "En" or "Dis").."abled") end)
				LoopKillPlayers:Set(not(loopkill))
			end,
		})

		killtab:CreateKeybind({
			Name = "Kill All Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "KillAllBind", 
			Callback = function(Keybind)
				for _,plr in ipairs(S.Players:GetPlayers()) do
					if check_rank(plr) and check_whll(plr.Name) then
						task.spawn(plr_kill, plr, false, useptmklill)
					end
				end
			end,
		})

		killtab:CreateKeybind({
			Name = "Loop Kill All Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "LoopKillAllBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Kill All".." is a "..(not(loopkillall) and "En" or "Dis").."abled") end)
				LoopKillAll:Set(not(loopkillall))
			end,
		})

		--REVAMP
		killtab:CreateKeybind({
			Name = "Fire Players Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "FirePlayersBind", 
			Callback = function(Keybind)
				local lt = {}
				for _,name in pairs(Lt.kl) do
					if S.Players:FindFirstChild(name) and not(S.Players[name].InPlot.Value) then
						table.insert(lt, S.Players[name])
					end
				end; plr_fire(lt)
			end,
		})

		killtab:CreateKeybind({
			Name = "Loop Fire Players Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "LoopFirePlayersBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Fire Players".." is a "..(not(loopfire) and "En" or "Dis").."abled") end)
				LoopFirePlayers:Set(not(loopfire))
			end,
		})

		killtab:CreateKeybind({
			Name = "Fire All Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "FireAllBind", 
			Callback = function(Keybind)
				local lt = {}
				for _,plr in pairs(S.Players:GetPlayers()) do
					if check_rank(plr) and not(plr.InPlot.Value) and check_whll(plr.Name) then
						table.insert(lt, plr)
					end
				end; plr_fire(lt)
			end,
		})

		killtab:CreateKeybind({
			Name = "Loop Fire All Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "LoopFireAllBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Fire Players".." is a "..(not(loopfireall) and "En" or "Dis").."abled") end)
				LoopFireAll:Set(not(loopfireall))
			end,
		})


		if not(check_prem(O.me)) or L.vhsows then

			killtab:CreateKeybind({
				Name = "Banana Ragdoll Players Bind",
				CurrentKeybind = "",
				HoldToInteract = false,
				Flag = "RagdollPlayersBind", 
				Callback = function(Keybind)
					local lt = {}
					for _,name in pairs(Lt.kl) do
						if S.Players:FindFirstChild(name) then
							table.insert(lt, S.Players[name])
						end
					end; plr_bragdoll(lt)
				end,
			})

			killtab:CreateKeybind({
				Name = "Loop Banana Ragdoll Players Bind",
				CurrentKeybind = "",
				HoldToInteract = false,
				Flag = "LoopRagdollPlayersBind", 
				Callback = function(Keybind)
					task.spawn(function() fstatus("Loop Ragdoll Players".." is a "..(not(loopragdoll) and "En" or "Dis").."abled") end)
					LoopRagdollPlayers:Set(not(loopragdoll))
				end,
			})

			killtab:CreateKeybind({
				Name = "Banana Ragdoll All Bind",
				CurrentKeybind = "",
				HoldToInteract = false,
				Flag = "RagdollAllBind", 
				Callback = function(Keybind)
					local lt = {}
					for _,plr in pairs(S.Players:GetPlayers()) do
						if check_rank(plr) and check_whll(plr.Name) then
							table.insert(lt, plr)
						end
					end; plr_bragdoll(lt)
				end,
			})

			killtab:CreateKeybind({
				Name = "Loop Banana Ragdoll All Bind",
				CurrentKeybind = "",
				HoldToInteract = false,
				Flag = "LoopRagdollAllBind", 
				Callback = function(Keybind)
					task.spawn(function() fstatus("Loop Ragdoll Players".." is a "..(not(loopragdollall) and "En" or "Dis").."abled") end)
					LoopRagdollAll:Set(not(loopragdollall))
				end,
			})

			killtab:CreateKeybind({
				Name = "Snowball Ragdoll Players Bind",
				CurrentKeybind = "",
				HoldToInteract = false,
				Flag = "SRagdollPlayersBind", 
				Callback = function(Keybind)
					for _,name in pairs(Lt.kl) do
						if S.Players:FindFirstChild(name) then
							plr_sragdoll(S.Players[name])
						end
					end
				end,
			})

			killtab:CreateKeybind({
				Name = "Loop Snowball Ragdoll Players Bind",
				CurrentKeybind = "",
				HoldToInteract = false,
				Flag = "LoopSRagdollPlayersBind", 
				Callback = function(Keybind)
					task.spawn(function() fstatus("Loop Snowball Ragdoll Players".." is a "..(not(loopsragdolls) and "En" or "Dis").."abled") end)
					LoopSRagdollPlayerss:Set(not(loopsragdolls))
				end,
			})

			killtab:CreateKeybind({
				Name = "Snowball Ragdoll All Bind",
				CurrentKeybind = "",
				HoldToInteract = false,
				Flag = "SRagdollAllBind", 
				Callback = function(Keybind)
					for _,plr in pairs(S.Players:GetPlayers()) do
						if check_rank(plr) and check_whll(plr.Name) then
							plr_sragdoll(plr)
						end
					end
				end,
			})

			killtab:CreateKeybind({
				Name = "Loop Snowball Ragdoll All Bind",
				CurrentKeybind = "",
				HoldToInteract = false,
				Flag = "LoopSRagdollAllBind", 
				Callback = function(Keybind)
					task.spawn(function() fstatus("Loop Snowball Ragdoll Players".." is a "..(not(loopsragdollalls) and "En" or "Dis").."abled") end)
					LoopSRagdollAlls:Set(not(loopsragdollalls))
				end,
			})
		end

		killtab:CreateKeybind({
			Name = "Bring Players Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BringPlayersBind", 
			Callback = function(Keybind)
				for _,plr in pairs(Lt.kl) do
					if S.Players:FindFirstChild(plr) then
						plr_bring(S.Players[plr])
					end
				end
			end,
		})

		killtab:CreateKeybind({
			Name = "Loop Bring Players Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "LoopBringPlayersBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Ragdoll Players".." is a "..(not(loopbring) and "En" or "Dis").."abled") end)
				LoopBringPlayers:Set(not(loopbring))
			end,
		})

		killtab:CreateKeybind({
			Name = "Bring All Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BringAllBind", 
			Callback = function(Keybind)
				for _,plr in ipairs(S.Players:GetPlayers()) do
					if check_rank(plr) and check_whll(plr.Name) then
						plr_bring(plr)
					end
				end
			end,
		})

		killtab:CreateKeybind({
			Name = "Loop Bring All Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "Loop=BringAllBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Bring All".." is a "..(not(loopbringall) and "En" or "Dis").."abled") end)
				LoopBringAll:Set(not(loopbringall))
			end,
		})

		killtab:CreateKeybind({
			Name = "Explode Players Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "ExplodePlayersBind", 
			Callback = function(Keybind)
				local lt = {}
				local count = 0
				for _,toy in pairs(O.backpack:GetChildren()) do
					if toy.Name == Str.toychoice.."/v" then
						table.insert(lt, toy)
						count = count + 1
					end
				end
				for _,plr in pairs(Lt.kl) do
					if S.Players:FindFirstChild(plr) then
						if count == 0 then
							lt = {}
							for a=1, N.stackspertime*N.stacksize do 
								local toy, ov = toy_vspawn(Str.toychoice, 2); ov:Destroy()
								table.insert(lt, toy); count = count + 1
							end
						end
						for a=1, N.stacksize do
							local t = plr_explode(S.Players[plr], lt[1], Str.toychoice, useptm)
							if not(t) then
								table.remove(lt, 1)
								count = count - 1
							end
						end
					end
				end
			end,
		})

		killtab:CreateKeybind({
			Name = "Loop Explode Players Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "LoopExplodePlayersBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Bring All".." is a "..(not(loopexplode) and "En" or "Dis").."abled") end)
				LoopExplodePlayers:Set(not(loopexplode))
			end,
		})

		killtab:CreateKeybind({
			Name = "Explode All Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "ExplodeAllBind", 
			Callback = function(Keybind)
				local lt = {}
				local count = 0
				for _,toy in pairs(O.backpack:GetChildren()) do
					if toy.Name == Str.toychoice.."/v" then
						table.insert(lt, toy)
						count = count + 1
					end
				end
				for _,plr in pairs(S.Players:GetPlayers()) do
					if check_rank(plr) and check_whll(plr.Name) then
						if count == 0 then
							lt = {}
							for a=1, N.stackspertime*N.stacksize do 
								local toy, ov = toy_vspawn(Str.toychoice, 2); ov:Destroy()
								table.insert(lt, toy); count = count + 1
							end
						end
						for a=1, N.stacksize do
							local t = plr_explode(plr, lt[1], Str.toychoice, useptm)
							if not(t) then
								table.remove(lt, 1)
								count = count - 1
							end
						end
					end
				end
			end,
		})

		killtab:CreateKeybind({
			Name = "Loop Explode All Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "LoopExplodeAllBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Bring All".." is a "..(not(loopexplodeall) and "En" or "Dis").."abled") end)
				LoopExplodeAll:Set(not(loopexplodeall))
			end,
		})
loadprogress(4810)
local liststab = Window:CreateTab("Players Lists", 7733674079)

	local function create_players_lists()
		update_hui()
		liststab:CreateSection("Blobman Functions")
		liststab:CreateDropdown({
			Name = "Right Hand List",
			Options = Lt.hui,
			CurrentOption = {""},
			MultipleOptions = true,
			Flag = "RightHandList", 
			Callback = function(Option)
				Lt.rhl = {"f"}
				for i,v in pairs(Option) do
					for i2,v2 in pairs(Lt.hui2) do
						if v == v2 then table.insert(Lt.rhl, i2) end
					end
				end
			end,
		})

		liststab:CreateDropdown({
			Name = "Left Hand List",
			Options = Lt.hui,
			CurrentOption = {""},
			MultipleOptions = true,
			Flag = "LeftHandList", 
			Callback = function(Option)
				Lt.lhl = {"f"}
				for i,v in pairs(Option) do
					for i2,v2 in pairs(Lt.hui2) do
						if v == v2 then table.insert(Lt.lhl, i2) end
					end
				end
			end,
		})

		liststab:CreateSection("Players Menu")
		liststab:CreateDropdown({
			Name = "Kill List",
			Options = Lt.hui,
			CurrentOption = {""},
			MultipleOptions = true,
			Flag = "PlayersList", 
			Callback = function(Option)
				Lt.kl = {}
				for i,v in pairs(Option) do
					for i2,v2 in pairs(Lt.hui2) do
						if v == v2 then table.insert(Lt.kl, i2) end
					end
				end
			end,
		})

		liststab:CreateSection("Others")
		liststab:CreateDropdown({
			Name = "White List",
			Options = Lt.hui,
			CurrentOption = {""},
			MultipleOptions = true,
			Flag = "WhiteList", 
			Callback = function(Option)
				Lt.wl = {"f"}
				for i,v in pairs(Option) do
					for i2,v2 in pairs(Lt.hui2) do
						if v == v2 then table.insert(Lt.wl, i2) end
					end
				end
			end,
		})

		liststab:CreateDropdown({
			Name = "Join Notify(Temp) List",
			Options = Lt.hui,
			CurrentOption = {""},
			MultipleOptions = true,
			Flag = "SpyList", 
			Callback = function(Option)
				Lt.jnl = {"f"}
				for i,v in pairs(Option) do
					for i2,v2 in pairs(Lt.hui2) do
						if v == v2 then table.insert(Lt.jnl, i2) end
					end
				end
			end,
		})
	end

	liststab:CreateButton({
		Name = "Create updating lists",
		Callback = function() create_players_lists() end,
	})

	liststab:CreateSection("Add/Remove Player to ... List")

		liststab:CreateKeybind({
			Name = "Right Hand",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "Add/RemovePlayertoRightHand", 
			Callback = function(Keybind)
				local target = O.mouse.Target
				if target and check_limbs(target) and check_rank(get_plr(target)) then
					local i = table.find(Lt.rhl, target.Parent.Name)
					if i then
						fstatus(Lt.rhl[i]..": Remove from Right Hand List")
						table.remove(Lt.rhl, i)
					else
						table.insert(Lt.rhl, target.Parent.Name)
						fstatus(target.Parent.Name..": Add from Right Hand List")
					end
				end
			end,
		})

		liststab:CreateKeybind({
			Name = "Left Hand",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "Add/RemovePlayertoLeftHand", 
			Callback = function(Keybind)
				local target = O.mouse.Target
				if target and check_limbs(target) and check_rank(get_plr(target)) then
					local i = table.find(Lt.lhl, target.Parent.Name)
					if i then
						fstatus(Lt.lhl[i]..": Remove from Left Hand List")
						table.remove(Lt.lhl, i)
					else
						table.insert(Lt.lhl, target.Parent.Name)
						fstatus(target.Parent.Name..": Add from Left Hand List")
					end
				end
			end,
		})

		liststab:CreateKeybind({
			Name = "Kill",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "Add/RemovePlayertoPlayersList", 
			Callback = function(Keybind)
				local target = O.mouse.Target
				if target and check_limbs(target) and check_rank(get_plr(target)) then
					local i = table.find(Lt.kl, target.Parent.Name)
					if i then
						fstatus(Lt.kl[i]..": Remove from Players List")
						table.remove(Lt.kl, i)
					else
						table.insert(Lt.kl, target.Parent.Name)
						fstatus(target.Parent.Name..": Add from Players List")
					end
				end
			end,
		})

		liststab:CreateKeybind({
			Name = "White",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "Add/RemovePlayertoWhiteList", 
			Callback = function(Keybind)
				local target = O.mouse.Target
				if target and check_limbs(target) and check_rank(get_plr(target)) then
					local i = table.find(Lt.wl, target.Parent.Name)
					if i then
						fstatus(Lt.wl[i]..": Remove from White List")
						table.remove(Lt.wl, i)
					else
						table.insert(Lt.wl, target.Parent.Name)
						fstatus(target.Parent.Name..": Add from White List")
					end
				end
			end,
		})

		liststab:CreateKeybind({
			Name = "Join Notify(Temp)",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "Add/RemovePlayertoSpyList(Temp)", 
			Callback = function(Keybind)
				local target = O.mouse.Target
				if target and check_limbs(target) and check_rank(get_plr(target)) then
					local i = table.find(Lt.jnl, target.Parent.Name)
					if i then
						fstatus(Lt.jnl[i]..": Remove from Join Notify List(Temp)")
						table.remove(Lt.jnl, i)
					else
						table.insert(Lt.jnl, target.Parent.Name)
						fstatus(target.Parent.Name..": Add from Join Notify List(Temp)")
					end
				end
			end,
		})

		liststab:CreateKeybind({
			Name = "Join Notify(Save)",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "Add/RemovePlayertoSpyList(Save)", 
			Callback = function(Keybind)
				local target = O.mouse.Target
				if target and check_limbs(target) and check_rank(get_plr(target)) then
					local i = table.find(Lt.jnl, target.Parent.Name)
					local i1 = table.find(Lt.sjnl, target.Parent.Name)
					if i then
						fstatus(Lt.jnl[i]..": Remove from Join Notify List(Temp)")
						table.remove(Lt.jnl, i)
					else
						table.insert(Lt.jnl, target.Parent.Name)
						fstatus(target.Parent.Name..": Add from Join Notify List(Temp)")
					end
					if i1 ~= 0 then
						fstatus(Lt.sjnl[i]..": Remove from Join Notify List(Save)")
						table.remove(Lt.sjnl, i1)
						writefile("VHS/sjnl.vhs",tostring(S.HS:JSONEncode(Lt.sjnl)))
					else
						table.insert(Lt.sjnl, target.Parent.Name)
						fstatus(target.Parent.Name..": Add from Join Notify List(Save)")
						writefile("VHS/sjnl.vhs",tostring(S.HS:JSONEncode(Lt.sjnl)))
					end
				end
			end,
		})

	create_players_lists()
loadprogress(5037)
local auratab = Window:CreateTab("Auras", 7733666258)

	auratab:CreateSection("Auras")

		local TpToSpawnAura = auratab:CreateToggle({
			Name = "Tp To Spawn Aura",
			CurrentValue = false,
			Flag = "TpToSpawnAura",
			Callback = function(Value)
				flingaura = Value
				while flingaura and task.wait() do
					for _,plr in ipairs(Players:GetPlayers()) do
						if plr ~= O.me and check_rank1(plr) then
							task.spawn(plr_tospawn, plr, true)
						end
					end
				end
			end,
		})

		local FlingAura = auratab:CreateToggle({
			Name = "Fling Aura",
			CurrentValue = false,
			Flag = "FlingAura",
			Callback = function(Value)
				fling2aura = Value
				while fling2aura and task.wait() do
					for _,plr in ipairs(Players:GetPlayers()) do
						if plr ~= O.me and check_rank1(plr) then
							task.spawn(plr_fling, plr, true)
						end
					end
				end
			end,
		})

		local KillAura = auratab:CreateToggle({
			Name = "Kill Aura",
			CurrentValue = false,
			Flag = "KillAura",
			Callback = function(Value)
				killaura = Value
				while killaura and task.wait() do
					for _,plr in ipairs(Players:GetPlayers()) do
						if plr ~= O.me and check_rank1(plr) then
							task.spawn(plr_kill, plr, true)
						end
					end
				end
			end,
		})

		local GrabAura = auratab:CreateToggle({
			Name = "Grab Aura",
			CurrentValue = false,
			Flag = "GrabAura",
			Callback = function(Value)
				grabaura = Value
				while grabaura and task.wait() do
					for _,plr in ipairs(Players:GetPlayers()) do
						if plr ~= O.me and check_rank1(plr) then
							task.spawn(plr_grab, plr, true)
						end
					end
				end
			end,
		})

		--REVAMP
		local SplitAura = auratab:CreateToggle({
			Name = "Split Aura",
			CurrentValue = false,
			Flag = "SplitAura",
			Callback = function(Value)
				splitaura = Value
				while splitaura and task.wait() do
					for _,plr in ipairs(Players:GetPlayers()) do
						if plr ~= O.me and check_rank1(plr) then
							task.spawn(function()
								plr_ragdoll(plr, true)
								plr_split(plr, true)
							end)
						end
					end
				end
			end,
		})

		local FreezeToy = auratab:CreateToggle({
			Name = "Freeze Toy",
			CurrentValue = false,
			Flag = "FreezeToy",
			Callback = function(Value)
				freezetoy = Value
				while freezetoy and task.wait() do
					local v1 = O.me.Character; if v1 then
						local v2 = v1:FindFirstChild("HumanoidRootPart"); if v2 then
							for _,plr in ipairs(S.Players:GetPlayers()) do
								if plr ~= O.me and check_prem(plr) and O.backpacks:FindFirstChild(plr.Name.."SpawnedInToys") and check_whll(plr.Name) then 
									for _,toy in pairs(O.backpacks[plr.Name.."SpawnedInToys"]:GetChildren()) do
										for _,prt in pairs(toy:GetChildren()) do
											if prt:IsA("Part") then
												if prt.CanQuery then
													if (prt.Position - v2.Position).Magnitude < N.distallaura then
														task.spawn(function()
															if not(prt:FindFirstChild("ftabp")) then
																local bp = Instance.new("BodyPosition", prt)
																bp.Position = prt.Position
																bp.D = 100
																bp.MaxForce = N.V.mhv3
																bp.Name = "ftabp"
															end
															if not(prt:FindFirstChild("ftabg")) then
																local bg = Instance.new("BodyGyro", prt)
																bg.CFrame = prt.CFrame
																bg.D = 100
																bg.MaxTorque = N.V.mhv3
																bg.Name = "ftabg"
															end
															if not(prt:FindFirstChild("ftahl")) then
																local hl = Instance.new("Highlight", S.w.hls)
																hl.Adornee = toy
																hl.OutlineColor = Color3.fromRGB(0, 0, 255)
																hl.FillColor = Color3.fromRGB(0, 255, 255)
																hl.FillTransparency = 0.5
																hl.OutlineTransparency = 0
																hl.Name = "ftahl"
																local hlv = Instance.new("ObjectValue", prt)
																hlv.Value = hl
																hlv.Name = "ftahl"
															end
															local po = false
															for _,obj in pairs(toy:GetDescendants()) do if obj.Name == "PartOwner" then po = obj; break end end
															if not(po) or po.Value ~= O.myname then
																grab(prt)
																task.wait()
															end
														end)
													elseif prt:FindFirstChild("ftabp") then prt.ftabp:Destroy(); prt.ftabg:Destroy(); prt.ftahl.Value:Destroy(); prt.ftahl:Destroy() end
													break
												end
											end
										end
									end
								end
							end
						end
					end
				end
				for _,obj in pairs(S.w:GetDescendants()) do if obj.Name == "ftabp" or obj.Name == "ftabg" or obj.Name == "ftahl" then obj:Destroy() end end
			end,
		})

		local DeleteToy = auratab:CreateToggle({
			Name = "Tp Toy",
			CurrentValue = false,
			Flag = "DeleteToy",
			Callback = function(Value)
				deletetoy = Value
				while deletetoy and task.wait() do
					local v1 = O.me.Character; if v1 then
						local v2 = v1:FindFirstChild("HumanoidRootPart"); if v2 then
							for _,plr in ipairs(S.Players:GetPlayers()) do
								if plr ~= O.me and check_prem(plr) and O.backpacks:FindFirstChild(plr.Name.."SpawnedInToys") and check_whll(plr.Name) then 
									for _,toy in pairs(O.backpacks[plr.Name.."SpawnedInToys"]:GetChildren()) do
										for _,prt in pairs(toy:GetChildren()) do
											if prt:IsA("Part") and prt.CanQuery and prt.Name ~= "Deleting" and magnitude(prt, v2) < N.distallaura then
												task.spawn(function()
													local save = prt.Name
													prt.Name = "Deleting"
													while deletetoy and task.wait() do
														grab(prt)
														if (prt:FindFirstChild("PartOwner") and prt.PartOwner.Value == O.myname) or not(prt.Parent) or (prt.Position - v2.Position).Magnitude > 30 then break end
													end
													prt.CFrame = P.tptoypos
													prt.Name = save
												end)
												break
											end
										end
									end
								end
								if not(L.tptoyfs) then task.wait() end
							end
						end
					end
				end
			end,
		})

		auratab:CreateKeybind({
			Name = "Choice Tp Toy Position",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "ChoiceTpToyPosition", 
			Callback = function(Keybind)
				local v1 = get_hrp(); if v1 then P.tptoypos = v1.CFrame end
			end,
		})

		auratab:CreateToggle({
			Name = "Tp Toy fast speed(bad fps)",
			CurrentValue = false,
			Flag = "TpToyfastspeed",
			Callback = function(Value)
				L.tptoyfs = Value
			end,
		})

	auratab:CreateSection("Auras Binds")

		auratab:CreateKeybind({
			Name = "Tp To Spawn Aura Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "TpToSpawnAuraBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Tp To Spawn Aura".." is a "..(not(flingaura) and "En" or "Dis").."abled") end)
				TpToSpawnAura:Set(not(flingaura))
			end,
		})

		auratab:CreateKeybind({
			Name = "Fling Aura Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "FlingAuraBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Fling Aura".." is a "..(not(fling2aura) and "En" or "Dis").."abled") end)
				FlingAura:Set(not(fling2aura))
			end,
		})

		auratab:CreateKeybind({
			Name = "Kill Aura (void (fast but 65% chance)) Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "KillAuraBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Kill Aura (void (fast but 65% chance))".." is a "..(not(killaura) and "En" or "Dis").."abled") end)
				KillAura:Set(not(killaura))
			end,
		})

		auratab:CreateKeybind({
			Name = "Kill Aura (health (slow but 80% chance) Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "KillAuraBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Kill Aura (health (slow but 80% chance)".." is a "..(not(killaura1) and "En" or "Dis").."abled") end)
				KillAura1:Set(not(killaura1))
			end,
		})

		auratab:CreateKeybind({
			Name = "Grab Aura Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "GrabAuraBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Grab Aura".." is a "..(not(grabaura) and "En" or "Dis").."abled") end)
				GrabAura:Set(not(grabaura))
			end,
		})

		auratab:CreateKeybind({
			Name = "Split Aura Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "SplitAuraBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Split Aura".." is a "..(not(splitaura) and "En" or "Dis").."abled") end)
				SplitAura:Set(not(splitaura))
			end,
		})

		auratab:CreateKeybind({
			Name = "Freeze Toy Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "FreezeToyBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Freeze Toy".." is a "..(not(freezetoy) and "En" or "Dis").."abled") end)
				FreezeToy:Set(not(freezetoy))
			end,
		})

		auratab:CreateKeybind({
			Name = "Delete Toy Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "DeleteToyBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Delete Toy".." is a "..(not(deletetoy) and "En" or "Dis").."abled") end)
				DeleteToy:Set(not(deletetoy))
			end,
		})

	auratab:CreateSection("Toys Aura")

		auratab:CreateToggle({
			Name = "Aura Toggle",
			CurrentValue = false,
			Callback = function(Value)
				toysaura = Value
				local hrp, hum, hd = get_all()
				local dopdis, dophght = 1000, 1000
				while toysaura and task.wait() do
					while not(dif_parent(hrp)) and task.wait() do hrp = get_hrp() end
					while not(dif_parent(hd)) and task.wait() do hd = get_hd() end
					while not(dif_parent(hum)) and task.wait() do hum = get_hum() end
					while not(check_hum(hum)) do task.wait() end
					local count = table.maxn(Lt.toysinaura)
					local center = dif_parent(toysauracenter) or hd
					local circle = ((2 * math.pi) / count)
					if toysauradestabilizedistance then dopdis = dopdis - dopdis*2 end
					if toysauradestabilizehight then dophght = dophght - dophght*2 end
					local distance = toysdistance + count + ((toysauradestabilizedistance and dopdis) or 0)
					local height = toysaurahight + ((toysauradestabilizehight and dophght) or 0)
					for i,prt in pairs(Lt.toysinaura) do
						if dif_parent(prt) then
							local bp = ffc(prt, "tabp"); if not(bp) then bp = create_bp2(prt, "tabp") end
							local att = ffc(prt, "taatt"); if not(att) then att = create_att(prt, "taatt") end
							local ao = ffc(prt, "taao"); if not(ao) then ao = create_ao(prt, "taao", att) end
							local sb = ffc(prt, "tasb"); if not(sb) then sb = create_sb3(prt, "tasb", N.CS.black) end
							local rp = ffc(prt, "rpv3v"); if not(rp) then rp = create_v3v(prt, "rpv3v", Vector3.new(math.random(-1000, 1000), 100000, math.random(-1000, 1000))) end
							local spl = ffc(prt, "taspl"); if not(spl) and toysauravisualize then spl = create_spl2(prt, "taspl", N.CS.black) end
							if toysauravisualize then sb.Transparency = 0; sb.SurfaceTransparency = 0.7
							else sb.Transparency = 1; sb.SurfaceTransparency = 1; if spl then spl:Destroy() end end
							auto_grab(prt, hrp, sb, spl, N.C2, bp, ao)
							local hd1 = dif_tree(toy, {"HoldPart", "RigidConstraint"})
							if hd1 and hd1.Attachment1 then auto_grab(hd1.Attachment1.Parent.Parent.Head, hrp, sb, spl, N.C2, bp, ao) end
							for _,prt in pairs(prt.Parent:GetDescendants()) do if prt:IsA("BasePart") and prt.CanCollide then prt.CanCollide = false; create_sv(prt, "f", "f") end end
							if toysaurahide then bp.Position = rp.Value
							else local angle = i*circle
								if toysaurarotation then
									angle = angle + (math.pi*(toysaurarotationcurettstep/5400))
									toysaurarotationcurettstep = toysaurarotationcurettstep+toysaurarotationstep
								end; local x, y = math.cos(angle) * distance, math.sin(angle) * distance
								if toysaurasquare then local cospidist = math.cos(math.pi/4)*distance
									if x > cospidist then x = cospidist end
									if y > cospidist then y = cospidist end
									if x < -(cospidist) then x = -(cospidist) end
									if y < -(cospidist) then y = -(cospidist) end
								end; local cords = {x,height,y}
								if toysauraxy then cords = {cords[2],cords[1],cords[3]} end
								if toysaurayz then cords = {cords[1],cords[3],cords[2]} end
								local cframe = CFrame.new(Vector3.new(unpack(cords)))*center.CFrame
								if toysauralookat then cframe = CFrame.new(cframe.Position, center.Position) end
								if toysauralock then cframe = CFrame.new(Vector3.new(unpack(cords))*center.Position) end
								cframe = cframe * CFrame.Angles(math.rad(toysauraxrotation), math.rad(toysaurayrotation), math.rad(toysaurazrotation))
								bp.Position = cframe.Position; ao.CFrame = cframe
							end
						else table.remove(Lt.toysinaura, i) end
					end
				end
				for i,prt in pairs(Lt.toysinaura) do
					if dif_parent(prt) then
						for _,prt in pairs(prt.Parent:GetDescendants()) do if prt:IsA("BasePart") and ffc(prt, "f") then prt.CanCollide = true; ffc(prt, "f"):Destroy() end end
						local bp = ffc(prt, "tabp"); if bp then bp:Destroy() end
						local att = ffc(prt, "taatt"); if att then att:Destroy() end
						local ao = ffc(prt, "taao"); if ao then ao:Destroy() end
						local sb = ffc(prt, "tasb"); if sb then sb:Destroy() end
						local rp = ffc(prt, "rpv3v"); if rp then rp:Destroy() end
						local spl = ffc(prt, "taspl"); if spl then spl:Destroy() end
					end
				end; Lt.toysinaura = {}
			end,
		})

		auratab:CreateToggle({
			Name = "Spawn Toy Toggle",
			CurrentValue = false,
			Flag = "SpawnToyToggle",
			Callback = function(Value)
				toysauraspawn = Value
			end,
		})

		auratab:CreateToggle({
			Name = "Hide Aura Toggle",
			CurrentValue = false,
			Flag = "HideAuraToggle",
			Callback = function(Value)
				toysaurahide = Value
			end,
		})

		auratab:CreateToggle({
			Name = "Visualize Toggle",
			CurrentValue = false,
			Flag = "VisualizeToggle",
			Callback = function(Value)
				toysauravisualize = Value
			end,
		})

		auratab:CreateToggle({
			Name = "Rotation Toggle",
			CurrentValue = false,
			Flag = "RotationToggle",
			Callback = function(Value)
				toysaurarotation = Value
				toysaurarotationcurettstep = 0
			end,
		})

		auratab:CreateSlider({
			Name = "Rotation Slider",
			Range = {1, 100},
			Increment = 1,
			Suffix = "",
			CurrentValue = 5,
			Flag = "RotationSlider",
			Callback = function(Value)
				toysaurarotationstep = Value
			end,
		})

		auratab:CreateSlider({
			Name = "Distance Slider",
			Range = {-100, 100},
			Increment = 1,
			Suffix = "",
			CurrentValue = 10,
			Flag = "DistanceSlider",
			Callback = function(Value)
				toysdistance = Value
			end,
		})

		auratab:CreateSlider({
			Name = "Hight Slider",
			Range = {-100, 100},
			Increment = 1,
			Suffix = "",
			CurrentValue = -2,
			Flag = "HightSlider",
			Callback = function(Value)
				toysaurahight = Value
			end,
		})

		auratab:CreateSlider({
			Name = "X Rotation",
			Range = {-180, 180},
			Increment = 1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "XRotation",
			Callback = function(Value)
				toysauraxrotation = Value
			end,
		})

		auratab:CreateSlider({
			Name = "Y Rotation",
			Range = {-180, 180},
			Increment = 1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "YRotation",
			Callback = function(Value)
				toysaurayrotation = Value
			end,
		})

		auratab:CreateSlider({
			Name = "Z Rotation",
			Range = {-180, 180},
			Increment = 1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "ZRotation",
			Callback = function(Value)
				toysaurazrotation = Value
			end,
		})

		auratab:CreateToggle({
			Name = "Look At Toggle",
			CurrentValue = false,
			Flag = "LookAtToggle",
			Callback = function(Value)
				toysauralookat = Value
			end,
		})

		auratab:CreateToggle({
			Name = "Lock Toggle",
			CurrentValue = false,
			Flag = "LockToggle",
			Callback = function(Value)
				toysauralock = Value
			end,
		})

		auratab:CreateToggle({
			Name = "XY Toggle",
			CurrentValue = false,
			Flag = "XYToggle",
			Callback = function(Value)
				toysauraxy = Value
			end,
		})

		auratab:CreateToggle({
			Name = "YZ Toggle",
			CurrentValue = false,
			Flag = "YZToggle",
			Callback = function(Value)
				toysaurayz = Value
			end,
		})

		auratab:CreateToggle({
			Name = "Square Toggle",
			CurrentValue = false,
			Flag = "SquareToggle",
			Callback = function(Value)
				toysaurasquare = Value
			end,
		})

		auratab:CreateToggle({
			Name = "Destabilize Distance (+-1000)",
			CurrentValue = false,
			Flag = "DestabilizeDistance(+-1000)",
			Callback = function(Value)
				toysauradestabilizedistance = Value
			end,
		})

		auratab:CreateToggle({
			Name = "Destabilize Hight (+-1000)",
			CurrentValue = false,
			Flag = "DestabilizeHight(+-1000)",
			Callback = function(Value)
				toysauradestabilizehight = Value
			end,
		})

		auratab:CreateKeybind({
			Name = "Select Center Part",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "SelectCenterPart", 
			Callback = function(Keybind)
				toysauracenter = O.mouse.Target
			end,
		})

		auratab:CreateKeybind({
			Name = "Add toy",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "Addtoy", 
			Callback = function(Keybind)
				local target = O.mouse.Target
				if dif_parent(target) and (target.CollisionGroup == "Items" or target.CollisionGroup == "PlotItems") then
					table.insert(Lt.toysinaura, target)
				end
			end,
		})
loadprogress(5602)
local toytab = Window:CreateTab("Toys Menu", 7733946818)

	toytab:CreateSection("Explosions")

		toytab:CreateKeybind({
			Name = "Explode All Bombs",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "ExplodeAllBombs", 
			Callback = function(Keybind)
				local hrp, hum = get_all()
				local target = O.mouse.Target
				if hrp and hum and check_hum(hum) and target then
					local save = hrp.CFrame
					local lt1, lt2, lt3, lt4 = {}, {}, {}, {}
					local hit = O.mouse.Hit
					local pos = Vector3.new(hit.x, hit.y, hit.z)
					for _,toy in pairs(O.backpacks:GetDescendants()) do
						if toy.Name == "BombMissile" and toy:FindFirstChild("HitboxBodyTop") then table.insert(lt1, toy)
						elseif toy.Name == "FireworkMissile" and toy:FindFirstChild("PyramidOctagon") then table.insert(lt2, toy)
						elseif toy.Name == "BombBalloon" and toy:FindFirstChild("Balloon") then table.insert(lt3, toy)
						elseif toy.Name == "BombDarkMatter" and toy:FindFirstChild("Spinner") then table.insert(lt4, toy)
						end
					end
					for _,toy in pairs(lt1) do create_spl2(toy.HitboxBodyTop, "eabspl", N.CS.red); create_sb3(toy, "eabsb", N.CS.red) end
					for _,toy in pairs(lt2) do create_spl2(toy.PyramidOctagon, "eabspl", N.CS.red); create_sb3(toy, "eabsb", N.CS.red) end
					for _,toy in pairs(lt3) do create_spl2(toy.Balloon, "eabspl", N.CS.red); create_sb3(toy, "eabsb", N.CS.red) end
					for _,toy in pairs(lt4) do create_spl2(toy.Spinner, "eabspl", N.CS.red); create_sb3(toy, "eabsb", N.CS.red) end
					for _,toy in pairs(lt1) do auto_grab(toy.HitboxBodyTop, hrp, toy.eabsb, toy.HitboxBodyTop.eabspl, N.C2) end
					for _,toy in pairs(lt2) do auto_grab(toy.PyramidOctagon, hrp, toy.eabsb, toy.PyramidOctagon.eabspl, N.C2) end
					for _,toy in pairs(lt3) do auto_grab(toy.Balloon, hrp, toy.eabsb, toy.Balloon.eabspl, N.C2) end
					for _,toy in pairs(lt4) do auto_grab(toy.Spinner, hrp, toy.eabsb, toy.Spinner.eabspl, N.C2) end
					hrp.CFrame = save
					if target then
						for _,toy in pairs(lt1) do
							if L.smptmt then pos = target.Position end
							toy_explode(toy.PartHitDetector, target, pos)
							if N.expldelay ~= 0 then task.wait(N.expldelay) end
						end
						for _,toy in pairs(lt2) do
							if L.smptmt then pos = target.Position end
							toy_explode(toy.PartHitDetector, target, pos)
							if N.expldelay ~= 0 then task.wait(N.expldelay) end
						end
						for _,toy in pairs(lt3) do
							if L.smptmt then pos = target.Position end
							toy_explode(toy.Balloon, target, pos)
							if N.expldelay ~= 0 then task.wait(N.expldelay) end
						end
						for _,toy in pairs(lt4) do
							if L.smptmt then pos = target.Position end
							toy_explode(toy.PartHitDetector, target, pos)
							if N.expldelay ~= 0 then task.wait(N.expldelay) end
						end
					end
				end
			end,
		})

		toytab:CreateKeybind({
			Name = "Explode All My Bombs",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "ExplodeAllMyBombs", 
			Callback = function(Keybind)
				local hrp, hum = get_all()
				if hrp and hum and check_hum(hum) then
					local save = hrp.CFrame
					local lt1, lt2, lt3, lt4 = {}, {}, {}, {}
					for _,ov in pairs(O.backpack:GetChildren()) do
						if ov.Name == "BombMissile/v" and ov.Value:FindFirstChild("HitboxBodyTop") then table.insert(lt1, ov.Value)
						elseif ov.Name == "FireworkMissile/v" and ov.Value:FindFirstChild("PyramidOctagon") then table.insert(lt2, ov.Value)
						elseif ov.Name == "BombBalloon/v" and ov.Value:FindFirstChild("Balloon") then table.insert(lt3, ov.Value)
						elseif ov.Name == "BombDarkMatter/v" and ov.Value:FindFirstChild("Spinner") then table.insert(lt4, ov.Value)
						end
					end
					for _,toy in pairs(lt1) do create_spl2(toy.HitboxBodyTop, "eabspl", N.CS.red); create_sb3(toy, "eabsb", N.CS.red) end
					for _,toy in pairs(lt2) do create_spl2(toy.PyramidOctagon, "eabspl", N.CS.red); create_sb3(toy, "eabsb", N.CS.red) end
					for _,toy in pairs(lt3) do create_spl2(toy.Balloon, "eabspl", N.CS.red); create_sb3(toy, "eabsb", N.CS.red) end
					for _,toy in pairs(lt4) do create_spl2(toy.Spinner, "eabspl", N.CS.red); create_sb3(toy, "eabsb", N.CS.red) end
					for _,toy in pairs(lt1) do auto_grab(toy.HitboxBodyTop, hrp, toy.eabsb, toy.HitboxBodyTop.eabspl, N.C2) end
					for _,toy in pairs(lt2) do auto_grab(toy.PyramidOctagon, hrp, toy.eabsb, toy.PyramidOctagon.eabspl, N.C2) end
					for _,toy in pairs(lt3) do auto_grab(toy.Balloon, hrp, toy.eabsb, toy.Balloon.eabspl, N.C2) end
					for _,toy in pairs(lt4) do auto_grab(toy.Spinner, hrp, toy.eabsb, toy.Spinner.eabspl, N.C2) end
					hrp.CFrame = save
					for _,toy in pairs(lt1) do
						local pos, target = O.mouse.Hit, O.mouse.Target
						while not(O.mouse.Target) and task.wait() do pos = O.mouse.Hit end
						if L.smptmt then pos = target.Position end; target = O.mouse.Target
						if get_rank(O.me) > 1 then toy_explode1(toy.PartHitDetector, pos.Position)
						else toy_explode(toy.PartHitDetector, target, pos.Position) end
						if N.expldelay ~= 0 then task.wait(N.expldelay) end
					end
					for _,toy in pairs(lt2) do
						local pos, target = O.mouse.Hit, O.mouse.Target
						while not(O.mouse.Target) and task.wait() do pos = O.mouse.Hit end
						if L.smptmt then pos = target.Position end; target = O.mouse.Target
						if get_rank(O.me) > 1 then toy_explode1(toy.PartHitDetector, pos.Position)
						else toy_explode(toy.PartHitDetector, target, pos.Position) end
						if N.expldelay ~= 0 then task.wait(N.expldelay) end
					end
					for _,toy in pairs(lt3) do
						local pos, target = O.mouse.Hit, O.mouse.Target
						while not(O.mouse.Target) and task.wait() do pos = O.mouse.Hit end
						if L.smptmt then pos = target.Position end; target = O.mouse.Target
						if get_rank(O.me) > 1 then toy_explode1(toy.Balloon, pos.Position)
						else toy_explode(toy.Balloon, target, pos.Position) end
						if N.expldelay ~= 0 then task.wait(N.expldelay) end
					end
					for _,toy in pairs(lt4) do
						local pos, target = O.mouse.Hit, O.mouse.Target
						while not(O.mouse.Target) and task.wait() do pos = O.mouse.Hit end
						if L.smptmt then pos = target.Position end; target = O.mouse.Target
						if get_rank(O.me) > 1 then toy_explode1(toy.PartHitDetector, pos.Position)
						else toy_explode(toy.PartHitDetector, target, pos.Position) end
						if N.expldelay ~= 0 then task.wait(N.expldelay) end
					end
				end
			end,
		})

		toytab:CreateSlider({
			Name = "Delay",
			Range = {0, 1},
			Increment = 0.01,
			Suffix = "",
			CurrentValue = 0,
			Flag = "DelaySlider",
			Callback = function(Value)
				N.expldelay = Value
			end,
		})

		toytab:CreateToggle({
			Name = "Switch Mouse Position to Mouse Target",
			CurrentValue = false,
			Flag = "SwitchMousePositiontoMouseTarget",
			Callback = function(Value)
				L.smptmt = Value
			end,
		})

	toytab:CreateSection("Bomb Missile")

		toytab:CreateKeybind({
			Name = "Spawn Explosion",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BombMissile.SpawnExplosionBind",
			Callback = function(Keybind)
				local hrp, hum = get_all()
				local hit = O.mouse.Hit
				local target = O.mouse.Target
				local prt = wfc(toy_aspawn("BombMissile", 2, hrp), "PartHitDetector")
				if hit then toy_explode(prt, target, hit.Position)
				else toy_explode2(prt) end
			end,
		})

		local BombMissileLoopSpawn = toytab:CreateToggle({
			Name = "Loop Spawn",
			CurrentValue = false,
			Callback = function(Value)
				loopspawnrocket = Value
				while loopspawnrocket and task.wait() do toy_vspawn("BombMissile", 2, true) end
			end,
		})

		toytab:CreateKeybind({
			Name = "Loop Spawn Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BombMissile.LoopSpawnBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Spawn BombMissile".." is a "..(not(loopspawnrocket) and "En" or "Dis").."abled") end)
				BombMissileLoopSpawn:Set(not(loopspawnrocket))
			end,
		})

	toytab:CreateSection("Firework Missile")

		toytab:CreateKeybind({
			Name = "Spawn Explosion",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "FireworkMissile.SpawnExplosionBind",
			Callback = function(Keybind)
				local hrp, hum = get_all()
				local target = O.mouse.Target
				local hit = O.mouse.Hit
				local prt = wfc(toy_aspawn("FireworkMissile", 2, hrp), "PartHitDetector")
				if hit then toy_explode(prt, target, hit.Position) 
				else toy_explode2(prt) end
			end,
		})

		local FireworkMissileLoopSpawn = toytab:CreateToggle({
			Name = "Loop Spawn",
			CurrentValue = false,
			Callback = function(Value)
				loopspawnfireworkrocket = Value
				while loopspawnfireworkrocket and task.wait() do toy_vspawn("FireworkMissile", 2, true) end
			end,
		})

		toytab:CreateKeybind({
			Name = "Loop Spawn Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "FireworkMissile.LoopSpawnBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Spawn FireworkMissile".." is a "..(not(loopspawnfireworkrocket) and "En" or "Dis").."abled") end)
				FireworkMissileLoopSpawn:Set(not(loopspawnfireworkrocket))
			end,
		})

	toytab:CreateSection("Bomb Balloon")

		toytab:CreateKeybind({
			Name = "Spawn Explosion",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BombBalloon.SpawnExplosionBind",
			Callback = function(Keybind)
				local hrp, hum = get_all()
				local target = O.mouse.Target
				local hit = O.mouse.Hit
				local prt = wfc(toy_aspawn("BombBalloon", 2, hrp), "Balloon")
				if target then toy_explode(prt, target, hit.Position) 
				else toy_explode(prt, prt, prt.Position) end
			end,
		})

		local BombBalloonLoopSpawn = toytab:CreateToggle({
			Name = "Loop Spawn",
			CurrentValue = false,
			Callback = function(Value)
				loopspawnBombBalloon = Value
				while loopspawnBombBalloon and task.wait() do toy_vspawn("BombBalloon", 2, true) end
			end,
		})

		toytab:CreateKeybind({
			Name = "Loop Spawn Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BombBalloon.LoopSpawnBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Spawn".." is a "..(not(loopspawnBombBalloon) and "En" or "Dis").."abled") end)
				BombBalloonLoopSpawn:Set(not(loopspawnBombBalloon))
			end,
		})

	toytab:CreateSection("Bomb Dark Matter")

		toytab:CreateKeybind({
			Name = "Spawn Explosion",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BombDarkMatter.SpawnExplosionBind",
			Callback = function(Keybind)
				local hrp, hum = get_all()
				local target = O.mouse.Target
				local hit = O.mouse.Hit
				local prt = wfc(toy_aspawn("BombDarkMatter", 2, hrp), "PartHitDetector")
				if hit then toy_explode(prt, target, hit.Position) 
				else toy_explode2(prt) end
			end,
		})

		local BombDarkMatterLoopSpawn = toytab:CreateToggle({
			Name = "Loop Spawn",
			CurrentValue = false,
			Callback = function(Value)
				loopspawnbombdarkmatter = Value
				while loopspawnbombdarkmatter and task.wait() do toy_vspawn("BombDarkMatter", 2, true) end
			end,
		})

		toytab:CreateKeybind({
			Name = "Loop Spawn Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BombDarkMatter.LoopSpawnBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Spawn BombDarkMatter".." is a "..(not(loopspawnbombdarkmatter) and "En" or "Dis").."abled") end)
				BombDarkMatterLoopSpawn:Set(not(loopspawnbombdarkmatter))
			end,
		})

	toytab:CreateSection("Ball Snowball")

		toytab:CreateKeybind({
			Name = "Spawn Explosion",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BallSnowball.SpawnExplosionBind",
			Callback = function(Keybind)
				local hrp, hum = get_all()
				local target = O.mouse.Target
				local prt = wfc(toy_aspawn("BallSnowball", 2, hrp), "SoundPart")
				if hit then toy_explode(prt, target, hit.Position) 
				else toy_explode2(prt) end
			end,
		})

		local BallSnowballLoopSpawn = toytab:CreateToggle({
			Name = "Loop Spawn",
			CurrentValue = false,
			Callback = function(Value)
				loopspawnballsnowball = Value
				while loopspawnballsnowball and task.wait() do toy_vspawn("BallSnowball", 2, true) end
			end,
		})

		toytab:CreateKeybind({
			Name = "Loop Spawn Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BallSnowball.LoopSpawnBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Spawn BallSnowball".." is a "..(not(loopspawnballsnowball) and "En" or "Dis").."abled") end)
				BallSnowballLoopSpawn:Set(not(loopspawnballsnowball))
			end,
		})

		--REVAMP
	toytab:CreateSection("Spawn")

		local LoopSpawn = toytab:CreateToggle({
			Name = "Loop Spawn",
			CurrentValue = false,
			Callback = function(Value)
				loopspawn = Value
				while loopspawn and task.wait() do toy_sspawn(P.last_toy.Name) end
			end,
		})

		toytab:CreateKeybind({
			Name = "Loop Spawn Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "LoopSpawnBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Loop Spawn".." is a "..(not(loopspawn) and "En" or "Dis").."abled") end)
				LoopSpawn:Set(not(loopspawn))
			end,
		})

	toytab:CreateSection("Tp")

		toytab:CreateToggle({
			Name = "Fast Mode",
			CurrentValue = false,
			Flag = "FastMode", 
			Callback = function(Value)
				fastmode = Value
			end,
		})

		toytab:CreateToggle({
			Name = "All Per Time",
			CurrentValue = false,
			Flag = "AllPerTime", 
			Callback = function(Value)
				allpertime = Value
			end,
		})

		toytab:CreateButton({
			Name = "Tp All Pallets",
			Callback = function()
				local hrp, hum = get_all()
				local lt = {}
				if hum and check_hum(hum) then
					local save = hrp.CFrame
					for _,bcpk in pairs(O.backpacks:GetChildren()) do
						if bcpk.owner.Value.Parent and check_rank(bcpk.owner.Value) then
							for _,toy in pairs(bcpk:GetChildren()) do
								if toy.Name == "PalletLightBrown" then
									local prt = get_grabprt(toy); if prt then
										table.insert(lt, prt)
									end
								end
							end
						end
					end
					local ltf = {}
					if fastmode then
						while table.maxn(lt) ~= 0 do 
							local ltc = table.clone(lt)
							local t = true
							local spnl = create_spnl1(hrp, "tapspl", Vector3.new(), N.CS.red)
							while t do
								local max_mag = 0
								local max_prt_id = 0
								local max_prt
								local center = get_center(ltc)
								for i,prt in pairs(ltc) do
									local mag = (prt.Position - center).Magnitude
									if mag > O.me.CurrentReach.Value-10 and mag > max_mag then 
										max_mag = mag
										max_prt_id = i
										max_prt = prt
									end
								end
								if max_mag == 0 then
									ltf[center] = {ltc,spnl}
									spnl.Point = center
									for _,prt in pairs(ltc) do
										create_sb3(prt, "tapsb", N.CS.red)
										table.remove(lt, table.find(lt, prt))
									end; t = false
								else table.remove(ltc, max_prt_id) end
							end; task.wait()
						end
					else
						while table.maxn(lt) ~= 0 do 
							local ltc = table.clone(lt)
							local t = true
							local spnl = create_spnl1(hrp, "tapspl", Vector3.new(), N.CS.black)
							while t do
								local max_mag = 0
								local max_prt_id = 0
								local max_prt
								local center = get_center(ltc)
								spnl.Point = center
								for i,prt in pairs(ltc) do
									if not(prt:FindFirstChild("tapsb")) then create_sb3(prt, "tapsb", N.CS.black) end
									local mag = (prt.Position - center).Magnitude
									if mag > O.me.CurrentReach.Value-10 and mag > max_mag then 
										max_mag = mag
										max_prt_id = i
										max_prt = prt
									end
								end
								if max_mag == 0 then
									ltf[center] = {ltc,spnl}
									spnl.Color3 = N.CS.red
									for _,prt in pairs(ltc) do
										set_sb1(prt.tapsb, N.CS.red)
										table.remove(lt, table.find(lt, prt))
									end; t = false
								else table.remove(ltc, max_prt_id); max_prt.tapsb:Destroy() end
								task.wait()
							end
						end
					end
					if allpertime then
						for pos, group in pairs(ltf) do
							hrp.CFrame = CFrame.new(pos); task.wait(O.me:GetNetworkPing()*2)
							for _,prt in group[1] do grab(prt); task.spawn(auto_grab, prt, hrp, prt.tapsb, group[2], N.C2) end
							for _,prt in group[1] do auto_grab(prt, hrp, prt.tapsb, group[2], N.C2) end
						end
						for pos, group in pairs(ltf) do
							for _,prt in group[1] do prt.CFrame = P.tptoypos; prt.tapsb:Destroy() end
							group[2]:Destroy()
						end
					else
						for pos, group in pairs(ltf) do
							hrp.CFrame = CFrame.new(pos); task.wait(O.me:GetNetworkPing()*2)
							for _,prt in group[1] do grab(prt); task.spawn(auto_grab, prt, hrp, prt.tapsb, group[2], N.C2) end
							for _,prt in group[1] do auto_grab(prt, hrp, prt.tapsb, group[2], N.C2) end
							for _,prt in group[1] do prt.CFrame = P.tptoypos; prt.tapsb:Destroy() end
							group[2]:Destroy()
						end
					end
				end
			end,
		})

		toytab:CreateButton({
			Name = "Tp All Players Toys",
			Callback = function()
				local hrp, hum = get_all()
				local lt = {}
				local lt1 = {}
				if hum and check_hum(hum) then
					local save = hrp.CFrame
					for _,bcpk in pairs(O.backpacks:GetChildren()) do
						if bcpk.owner.Value.Parent and check_rank(bcpk.owner.Value) then
							for _,toy in pairs(bcpk:GetChildren()) do
								local prt = get_grabprt(toy); if prt then
									table.insert(lt, prt)
								end
							end
						end
					end
					for _,prt in pairs(lt) do
						table.insert(lt1, create_sb3(prt.Parent, "tapsb", N.CS.white))
						hrp.CFrame = prt.CFrame
						task.wait(); grab(prt)
					end
					for _,prt in pairs(lt) do
						table.insert(lt1, create_spl2(prt, "tapspl", N.CS.white))
						hrp.CFrame = prt.CFrame
						task.wait(); grab(prt)
					end
					for _,prt in pairs(lt) do
						safe_grab(prt, hrp)
						task.wait(0.3)
						if check_hum(hum) then prt.CFrame = P.tptoypos end
					end
					hrp.CFrame = save
					for _,obj in pairs(lt1) do obj:Destroy() end
				end
			end,
		})

	toytab:CreateSection("Auto Farm Coins")

		toytab:CreateToggle({
			Name = "Auto Farm Coins",
			CurrentValue = false,
			Flag = "AutoFarmCoins",
			Callback = function(Value)
				autofarmcoins = Value
				while autofarmcoins and task.wait() do
					while not(S.w.Slots.Slots.SlotHandle.LightBall.Shine.Enabled) do task.wait() end
					local hrp, hum = get_all(); if dif_parent(hrp) and check_hum(hum) then
						auto_grab(S.w.Slots.Slots.SlotHandle.Handle, hrp)
						S.w.Slots.Slots.SlotHandle.LightBall.Shine.Enabled = false
					end
				end
			end,
		})
loadprogress(6128)
local bindtab = Window:CreateTab("Binds", 7733799901)
	
	bindtab:CreateKeybind({
		Name = "Click TP",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "ClickTPBind", 
		Callback = function(Keybind)
			local hrp, hum = get_all()
			local hit = O.mouse.Hit
			local target = O.mouse.Target
			if hrp and hum and check_hum(hum) and target then hrp.CFrame = CFrame.new(hit.x, hit.y+5, hit.z) end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Click TP(hold)",
		CurrentKeybind = "",
		HoldToInteract = true,
		Flag = "ClickTPBindhold", 
		Callback = function(Keybind)
			local hrp, hum = get_all()
			local hit = O.mouse.Hit
			local target = O.mouse.Target
			if hrp and hum and check_hum(hum) and target then hrp.CFrame = CFrame.new(hit.x, hit.y+5, hit.z) end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Invisble Grab",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "InvisbleTouchBind", 
		Callback = function(Keybind)
			local hrp, hum = get_all()
			local target = O.mouse.Target
			if hrp and hum and check_hum(hum) and target then auto_grab(target, hrp) end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Invisble Grab(Safe Mode)",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "InvisbleTouchBindSafeMode", 
		Callback = function(Keybind)
			local hrp, hum = get_all()
			local target = O.mouse.Target
			if hrp and hum and check_hum(hum) and target then safe_grab(target, hrp) end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Ungrab ALL",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "UngrabAll",
		Callback = function(Keybind)
			for _,bcpk in pairs(O.backpacks:GetChildren()) do for _,toy in pairs(bcpk:GetChildren()) do ungrab(get_grabprt(toy)) end end
			for _,char in pairs(O.chars:GetChildren()) do if char:FindFirstChild("Head") then ungrab(char.Head) end end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Fling Player",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "FlingPlayerBind", 
		Callback = function(Keybind)
			local target = O.mouse.Target; if target and check_limbs(target) then plr_fling(target) end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Bring Player",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "BringPlayeBind", 
		Callback = function(Keybind)
			local target = O.mouse.Target; if target and check_limbs(target) then plr_bring(target) end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Bring Object",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "BringObject", 
		Callback = function(Keybind)
			local hrp, hum = get_all()
			local target = O.mouse.Target
			if hrp and hum and check_hum(hum) and target then
				safe_grab(target, hrp)
				local bp = create_bp1(target, "bpbp", hrp.Position + hrp.CFrame.LookVector*3 + Vector3.new(0, 10, 0))
				task.wait(0.3); bp:Destroy(); ungrab(target)
			end
		end,
	})

	--REVAMP
	bindtab:CreateKeybind({
		Name = "Split Player",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "SplitPlayer", 
		Callback = function(Keybind)
			local target = O.mouse.Target
			if target and check_limbs(target) then plr_split(target, false) end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Stop Velocity",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "StopVelocityBind", 
		Callback = function(Keybind)
			for _, v in pairs(O.me.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
				end
			end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Zoom",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "Zoom", 
		Callback = function(Keybind)
			L.zoombind = not(L.zoombind)
			if L.zoombind then
				N.zoombindv = S.w.CurrentCamera.FieldOfView
				S.w.CurrentCamera.FieldOfView = 10
			else
				S.w.CurrentCamera.FieldOfView = N.zoombindv
			end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Lock Grab",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "LockGrab", 
		Callback = function(Keybind)
			S.w.GrabParts:Clone().Parent = S.w
			S.w.GrabParts:Destroy()
			S.w.GrabParts.BeamPart:Destroy()
			a=a+1
			S.w.GrabParts.Name = a
		end,
	})

	bindtab:CreateKeybind({
		Name = "Delete All Lock Grabs",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "DeleteAllLockGrabsBind", 
		Callback = function(Keybind)
			delete_clone_grab()
		end,
	})

	bindtab:CreateKeybind({
		Name = "Freeze Grab",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "FreezeGrab", 
		Callback = function(Keybind)
			local gp = S.w:FindFirstChild("GrabParts")
			local target = O.mouse.Target
			local hrp, hum = get_all()
			if dif_parent(hrp) and check_hum(hum) then
				local prt
				if gp then prt = wfc2(gp, {"GrabPart", "WeldConstraint"}).Part1
				elseif target then prt = target end
				safe_freeze(prt.Parent, prt, hrp)
			end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Unfreeze Grab",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "UnfreezeGrab", 
		Callback = function(Keybind)
			local target = O.mouse.Target; if target then
				local bp = target:FindFirstChild("frzbp")
				local bg = target:FindFirstChild("frzbg")
				local sb = target:FindFirstChild("frzsb")
				for _,obj in pairs(target.Parent:GetDescendants()) do if obj.Name == "frzbp" then bp = obj end end
				for _,obj in pairs(target.Parent:GetDescendants()) do if obj.Name == "frzbg" then bg = obj end end
				for _,obj in pairs(target.Parent:GetDescendants()) do if obj.Name == "frzsb" then sb = obj end end
				if bp and bg and sb then
					bp:Destroy()
					bg:Destroy()
					sb:Destroy()
				end
			end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Unfreeze All Grabs",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "UnfreezeAllGrabs",
		Callback = function(Keybind)
			for _,bp in pairs(S.w:GetDescendants()) do if bp.Name == "frzbp" then bp:Destroy() end end
			for _,bg in pairs(S.w:GetDescendants()) do if bg.Name == "frzbg" then bg:Destroy() end end
			for _,sb in pairs(S.w:GetDescendants()) do if sb.Name == "frzsb" then sb:Destroy() end end
		end,
	})

	--REVAMP
	bindtab:CreateKeybind({
		Name = "Glue Grab",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "GlueGrabBind", 
		Callback = function(Keybind)
			if not(L.gluegrab) then
				local v1 = O.me.Character; if v1 then
					local v2 = v1:FindFirstChild("HumanoidRootPart"); if v2 then
						local v3 = S.w:FindFirstChild("GrabParts"); if v3 then
							local prt = v3.GrabPart.WeldConstraint.Part1
							grab(prt)
							table.insert(Lt.ggl, prt)
							L.gluegrab = true
							while Lt.ggl ~= {} and task.wait() do
								local v1 = O.me.Character; if v1 then
									local v2 = v1:FindFirstChild("HumanoidRootPart"); if v2 then
										local first_prt
										local att0
										for _,prt in pairs(Lt.ggl) do
											if prt.Parent then
												local ov = prt:FindFirstChild("ggfpcf")
												local ov1 = prt:FindFirstChild("ggcpcf")
												local ov2 = prt:FindFirstChild("gghlov")
												local bp = prt:FindFirstChild("ggbp")
												local bg = prt:FindFirstChild("ggbg")
												if not(first_prt) then 
													first_prt = prt
													if not(ov) then
														ov = Instance.new("CFrameValue", prt)
														ov.Value = prt.CFrame
														ov.Name = "ggfpcf"
													end
												else
													if not(bp) then
														bp = Instance.new("BodyPosition", prt)
														bp.D = 100
														bp.MaxForce = N.V.mhv3
														bp.Name = "ggbp"
													end
													if not(bg) then
														bg = Instance.new("BodyGyro", prt)
														bg.D = 100
														bg.MaxTorque = N.V.mhv3
														bg.Name = "ggbg"
													end
													if not(ov1) then
														ov1 = Instance.new("CFrameValue", prt)
														ov1.Value = prt.CFrame
														ov1.Name = "ggcpcf"
													end
													local fCframeOld = first_prt.ggfpcf.Value
													local firstCFrameNew = first_prt.CFrame
													local sCFrameOld = ov1.Value

													local function sqrt(input) return math.sqrt(input) end
													local function cos(input) return math.cos(input) end
													local function sin(input) return math.sin(input) end
													local function acos(input) return math.acos(input) end
													local function asin(input) return math.asin(input) end



													--Надо для обоих частей функции
													local fhypDif = sqrt(fCframeOld.lookVector.x^2+fCframeOld.lookVector.z^2)
													fhypDif = 1/fhypDif
													local fRadLookOld = {
													x=acos(fCframeOld.lookVector.x*fhypDif),
													y=asin(fCframeOld.lookVector.y)}
													local firstHypDifNew = sqrt(firstCFrameNew.lookVector.x^2+firstCFrameNew.lookVector.z^2)
													firstHypDifNew = 1/firstHypDifNew
													local firstRadLookNew={x=nil, y=nil}

													if firstCFrameNew.lookVector.z < 0 then
														firstRadLookNew.x = acos(firstCFrameNew.lookVector.x*firstHypDifNew)+(math.pi-acos(firstCFrameNew.lookVector.x*firstHypDifNew))*2
													else firstRadLookNew.x = acos(firstCFrameNew.lookVector.x*firstHypDifNew) end
													if sqrt(firstCFrameNew.lookVector.x^2+firstCFrameNew.lookVector.z^2)<0 then
														firstRadLookNew.y = asin(firstCFrameNew.lookVector.y)+((math.pi/2) - asin(firstCFrameNew.lookVector.y))*2
													else firstRadLookNew.y = asin(firstCFrameNew.lookVector.y) end

													local fDifRad={
													x=fRadLookOld.x-firstRadLookNew.x,
													y=fRadLookOld.y-firstRadLookNew.y}



													--Нахождение координат
													local partDif = fCframeOld.Position - sCFrameOld.Position
													local distance = sqrt((partDif.y)^2+(partDif.x)^2+(partDif.z)^2)
													local distHypdif = 1/distance
													local distVector = partDif*distHypdif
													local distVectorHypDif = sqrt(distVector.x^2+distVector.z^2)
													distVectorHypDif = 1/distVectorHypDif
													local distVectorRad = {x=nil,y=nil}

													if distVector.z*distVectorHypDif < 0 then
														distVectorRad.x = acos(distVector.x*distVectorHypDif)+(math.pi-acos(distVector.x*distVectorHypDif))*2
													else distVectorRad.x = acos(distVector.x*distVectorHypDif) end
													if sqrt(distVector.x^2+distVector.z^2)<0 then
														distVectorRad.y = asin(distVector.y)+((math.pi/2)-asin(distVector.y))*2
													else distVectorRad.y = asin(distVector.y) end

													local finalVectorRad = {
													x=distVectorRad.x-fDifRad.x,
													y=distVectorRad.y-fDifRad.y}
													local finalPosVector = Vector3.new(
														cos(finalVectorRad.x/(1/cos(finalVectorRad.y))),
														sin(finalVectorRad.y),
														sin(finalVectorRad.x/(1/cos(finalVectorRad.y))))
													finalPosVector = finalPosVector/distHypdif



													--Нахождение лукВектора
													local sHypDif = 1/sqrt(sCFrameOld.lookVector.x^2+sCFrameOld.lookVector.z^2)
													local sRadLookOld = {x=nil,y=nil}

													if sCFrameOld.lookVector.z*sHypDif < 0 then
														sRadLookOld.x = acos(sCFrameOld.lookVector.x*sHypDif)+(math.pi-acos(sCFrameOld.lookVector.x*sHypDif))*2
													else sRadLookOld.x = acos(sCFrameOld.lookVector.x*sHypDif) end
													if sqrt(sCFrameOld.lookVector.x^2+sCFrameOld.lookVector.z^2)<0 then
														sRadLookOld.y = asin(sCFrameOld.lookVector.y)+((math.pi/2)-asin(sCFrameOld.lookVector.y))*2
													else sRadLookOld.y = asin(sCFrameOld.lookVector.y) end

													local finalLookRad = {
													x=sRadLookOld.x-fDifRad.x,
													y=sRadLookOld.y-fDifRad.y}
													local finalLookVector = Vector3.new(
														cos(finalLookRad.x/(1/cos(finalLookRad.y))),
														sin(finalLookRad.y),
														sin(finalLookRad.x/(1/cos(finalLookRad.y))))
													local FinalCFrame = CFrame.new(finalPosVector, finalLookVector)

													bp.Position = first_prt.Position - finalPosVector
													-- bg.CFrame = prt.CFrame
													-- bg.CFrame.LookVector = finalLookVector
													-- prt.CFrame.LookVector = finalLookVector
													-- bg.CFrame = prt.CFrame
													bg.CFrame = CFrame.new(finalPosVector, finalLookVector)
												end
												if not(ov2) then
													hl = Instance.new("Highlight", S.w.hls)
													hl.Name = "gghl"
													hl.FillColor = Color3.fromRGB(0, 255, 0)
													hl.OutlineColor = Color3.fromRGB(0, 255, 0)
													hl.FillTransparency = 0.5
													hl.OutlineTransparency = 0
													hl.Adornee = prt.Parent
													ov2 = Instance.new("ObjectValue", prt)
													ov2.Name = "gghlov"
													ov2.Value = hl
												else hl = ov2.Value end
												if prt ~= first_prt then
													auto_grab(prt, v2, hl, N.C2)
												end
											end
										end
										first_prt = nil
									end
								end
							end
						end
					end
				end

			else
				local v1 = O.me.Character; if v1 then
					local v2 = v1:FindFirstChild("HumanoidRootPart"); if v2 then
						local v3 = S.w:FindFirstChild("GrabParts"); if v3 then
							local prt = v3.GrabPart.WeldConstraint.Part1
							grab(prt)
							table.insert(Lt.ggl, prt)
						end
					end
				end
			end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Unglue All Grabs",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "UnglueAllGrabsBind", 
		Callback = function(Keybind)
			Lt.ggl = {}
			for _,obj in pairs(S.w:GetDescendants()) do if obj.Name == "gghl" or obj.Name == "gghlov" or obj.Name == "ggfpcf" or obj.Name == "ggbp" or obj.Name == "ggbg" then obj:Destroy() end end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Auto Clicker",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "AutoClicker", 
		Callback = function(Keybind)
			local v1 = O.mouse.Target; if v1 then loop_grab(v1) end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Auto Clicker(all similar nearby)",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "AutoClicker(all similar objects are nearby)", 
		Callback = function(Keybind)
			local v1 = O.mouse.Target; if v1 then
				local v7 = v1.ClassName
				local v2 = v1.CanCollide
				local v3 = v1.CanQuery
				local v4 = v1.CanTouch
				local v5 = v1.CollisionGroup 
				local v6 = v1.Name
				for _,obj in pairs(S.w:GetDescendants()) do
					if obj.ClassName == v7 and obj.CanCollide == v2 and obj.CanQuery == v3 and obj.CanTouch == v4 and obj.CollisionGroup == v5 and obj.Name == v6 then
						if check_mag1(v1, obj) then
							task.spawn(loop_grab, obj)
						end
					end
				end
			end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Delete Auto Clicker",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "DeleteAutoClicker", 
		Callback = function(Keybind)
			local v1 = O.mouse.Target; if v1:FindFirstChild("ait") then v1.ait.Value:Destroy(); v1.ait:Destroy() end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Delete All Auto Clickers",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "DeleteAllAutoClicker", 
		Callback = function(Keybind)
			for _,obj in pairs(S.w:GetDescendants()) do if obj.Name == "ait" then obj.Value:Destroy(); obj:Destroy() end end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Delete Object",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "DeleteObjectBind", 
		Callback = function(Keybind)
			local target = O.mouse.Target
			grab(target)
			wait(0.1)
			if target.PartOwner and target.PartOwner.Value == O.myname then
				target.CFrame = P.tptoypos
			end
		end,
	})

	bindtab:CreateKeybind({
		Name = "Sit On Blob",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "SitOnBlob", 
		Callback = function(Keybind)
			if O.me.Character then
				if not(O.backpack:FindFirstChild("CreatureBlobman")) then
					while not(O.me.CanSpawnToy.Value) do task.wait() end
					task.spawn(toy_spawn2, "CreatureBlobman")
				end
				while not(O.backpack:FindFirstChild("CreatureBlobman")) do task.wait() end
				while not(O.me.Character.Humanoid.SeatPart) and task.wait() do
					O.backpack:FindFirstChild("CreatureBlobman").VehicleSeat:sit(O.me.Character.Humanoid)
				end
			end
		end,
	})

	--REVAMP
	bindtab:CreateKeybind({
		Name = "Control Player/Clone",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "ControlPlayerClone", 
		Callback = function(Keybind)
			L.controlplayerclone = not(L.controlplayerclone)
			local hrp, hum = get_all()
			local target = O.mouse.Target
			if L.controlplayerclone and hrp and hum and check_hum(hum) and target then
				local toy = target.Parent
				local hrp1 = toy:FindFirstChild("HumanoidRootPart")
				local hum1 = toy:FindFirstChild("Humanoid") or toy:FindFirstChild("Pet") or toy:FindFirstChild("HumanoidCreature")
				if toy:IsA("Model") and hrp1 and hum1 and check_hum(hum1) then
					grab(get_grabprt(toy))
					O.me.Character = toy
					S.w.CurrentCamera.CameraSubject = hum1
					local bp = create_bp1(hrp1, "cpcbp", hrp1.Position)
					local kt = false
					local con = hum1.Running:Connect(function() if kt then bp.MaxForce = N.V.nv3 else bp.Position = hrp1.Position; bp.MaxForce = N.V.mhv3 end end)
					local con1 = S.UIS.InputBegan:Connect(function(i,p)
						local key = i.KeyCode
						local ekey = Enum.KeyCode
						if not(p) then
							if key == ekey.W then
								local t = true
								local con2 = i.Changed:Connect(function(p) if p == "UserInputState" then t = false end end)
								while t and task.wait() do bp.Position = bp.Position + hrp1.CFrame.LookVector; kt = true end
								con2:Disconnect()
								kt = false
							elseif key == ekey.S then
								local t = true
								local con2 = i.Changed:Connect(function(p) if p == "UserInputState" then t = false end end)
								while t and task.wait() do bp.Position = bp.Position - hrp1.CFrame.LookVector; kt = true end
								con2:Disconnect()
								kt = false
							elseif key == ekey.D then
								local t = true
								local con2 = i.Changed:Connect(function(p) if p == "UserInputState" then t = false end end)
								while t and task.wait() do bp.Position = bp.Position + hrp1.CFrame.RightVector; kt = true end
								con2:Disconnect()
								kt = false
							elseif key == ekey.A then
								local t = true
								local con2 = i.Changed:Connect(function(p) if p == "UserInputState" then t = false end end)
								while t and task.wait() do bp.Position = bp.Position - hrp1.CFrame.RightVector; kt = true end
								con2:Disconnect()
								kt = false
							end
						end
					end)
					while L.controlplayerclone and O.me.Character and toy.Parent and O.me.Character == toy and task.wait() do
						O.Events.StruggleEvent:FireServer(O.me)
						while not(get_grabprt(toy):FindFirstChild("PartOwner")) and task.wait() do hrp.CFrame = get_grabprt(toy).CFrame; grab(get_grabprt(toy)) end
						hrp.CFrame = CFrame.new(572, 165, -40)
					end
					bp:Destroy()
					con:Disconnect()
					con1:Disconnect()
					O.me.Character = hrp.Parent
					S.w.CurrentCamera.CameraSubject = hum
					hrp.CFrame = hrp1.CFrame + Vector3.new(0, 20, 0)
				end
			end
		end,
	})


	bindtab:CreateKeybind({
		Name = "Create Big Snow Ball",
		CurrentKeybind = "",
		HoldToInteract = false,
		Flag = "CreateBigSnowBall", 
		Callback = function(Keybind)
			local hrp, hum = get_all()
			if dif_parent(hrp) and check_hum(hum) then
				local toy = toy_aspawn("BallSnowball", 2, hrp)
				local prt = toy.SnowRagdollPart
				toy.SoundPart.CanTouch = false
				local save = prt.CFrame
				while prt.Size.X < 70 and task.wait() do
					while not(dif_parent(hrp)) or not(check_hum(hum)) and task.wait() do hrp, hum = get_all() end
					fireti(prt, O.m.MountainSnowTop.Snow, 0); prt.CFrame = save + Vector3.new(10, 0, 10)
					task.wait()
					fireti(prt, O.m.MountainSnowTop.Snow, 1); prt.CFrame = save + Vector3.new(-10, 0, -10)
				end; toy.SoundPart.CanTouch = true
			end
		end,
	})

	if L.vhsows then
		bindtab:CreateKeybind({
			Name = "ULTRA ANTIGRAB",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "ULTRAANTIGRAB", 	
			Callback = function(Keybind)
				local hrp, hum = get_all()
				if hum and check_hum(hum) then
					if not(O.backpack:FindFirstChild("antigrabblob")) then
						repeat task.wait() until not(O.me.InPlot.Value)
						repeat task.wait() until O.me.CanSpawnToy.Value
						task.spawn(toy_spawn2, "CreatureBlobman")
						for _,toy in pairs(O.backpack:GetChildren()) do if toy.Name == "CreatureBlobman" then create_blv(toy, "notantigrabblob", true) end end
						repeat task.wait() until O.backpack:FindFirstChild("CreatureBlobman") and not(O.backpack.CreatureBlobman:FindFirstChild("antigrabblob"))
						local blob = O.backpack.CreatureBlobman
						blob.Name = "antigrabblob"; task.wait(0.3)
						for a=1, 55 do O.Events.RagdollEvent:FireServer(hrp, 0); task.wait() end
						repeat O.Events.RagdollEvent:FireServer(hrp, 0); blob.VehicleSeat:sit(hum); task.wait(0.5) until hum.SeatPart
						for a=1, 55 do O.Events.RagdollEvent:FireServer(hrp, 0); task.wait() end
						hum.Sit = false
						safe_grab(blob.GrabbableHitbox, hrp)
						local bp = create_bp1(blob.VehicleSeat, "antigrabblob", Vector3.new(0, 1111111, 0))
					else toy_delete(O.backpack.antigrabblob) end
				end
			end,
		})

		bindtab:CreateKeybind({
			Name = "ragdpll",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "ragdpll",
			Callback = function(Keybind)
				local hrp, hum = get_all()
				rthrthrtthrth = not(rthrthrtthrth)
				if rthrthrtthrth then local blob = toy_sspawn("CreatureBlobman", 2)
					task.wait(0.3); blob.VehicleSeat:sit(hum)
					O.Events.RagdollEvent:FireServer(hrp, 999999)
				else O.Events.RagdollEvent:FireServer(hrp, 0) end
			end,
		})

		--REVAMP
		bindtab:CreateKeybind({
			Name = "Bug Houses",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "BugHouses", 
			Callback = function(Keybind)
				local hrp, hum = get_all()
				if hrp and hum and check_hum(hum) then
					local blob = hum.SeatPart.Parent
					blob_kick(blob, hrp, "Right", 1)
					task.wait(0.5)
					O.me:Kick("rejoin")
					S.TS:Teleport(6961824067,O.me)
				end
			end,
		})

		bindtab:CreateKeybind({
			Name = "invis",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "invisible", 
			Callback = function(Keybind)
				local hrp, hum = get_all()
				if dif_parent(hrp) and check_hum(hum) then
					if hrp:FindFirstChild("RootJoint") then
						local torso = hrp.Parent.Torso
						local arg1 = torso.Neck.C0
						local arg2 = hrp.RootJoint.C0
						local arg3 = torso["Right Shoulder"].C0
						hrp.RootJoint.Name = "invis"; reloadcabm(); resetlines(); O.invis.Enabled = true
						while O.invis.Enabled and task.wait(1) do
	 						O.Events.look:FireServer(CFrame.new(), CFrame.new(0, 10000, 0), CFrame.new(), "high")
							O.Events.look:FireServer(CFrame.new(), CFrame.new(0, 10000, 0), CFrame.new(), "medium")
							O.Events.look:FireServer(CFrame.new(), CFrame.new(0, 10000, 0), CFrame.new(), "low")
							O.Events.look:FireServer(CFrame.new(), CFrame.new(0, 10000, 0), CFrame.new(), "lowest")
						end
						O.Events.look:FireServer(arg1, arg2, arg3, "high")
						O.Events.look:FireServer(arg1, arg2, arg3, "medium")
						O.Events.look:FireServer(arg1, arg2, arg3, "low")
						O.Events.look:FireServer(arg1, arg2, arg3, "lowest")
					else hrp.invis.Name = "RootJoint"; reloadcabm(); O.invis.Enabled = false end
				end
			end,
		})

		bindtab:CreateKeybind({
			Name = "headzoom",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "headzoom",
			Callback = function(Keybind)
				local hrp, hum, hd = get_all()
				if dif_parent(hrp) and check_hum(hum) and dif_parent(hd) then
					local rootj = hrp.RootJoint
					local torso = hrp.Parent.Torso
					local rs = torso["Right Shoulder"]
					if torso:FindFirstChild("Neck") then
						torso.Neck.Name = "headzoom"; reloadcabm(); resetlines(); O.headzoom.Enabled = true
						while O.headzoom.Enabled and task.wait() do
							local target, hit = get_mouse(); if target and hit then
								local mag = (magnitude(hd.Position, hit.Position) - 3) * -1
								local y = hit.Position.Y - hd.Position.Y
								local cframe = CFrame.new(0, y+1, mag, -1, 0, 0, 0, 0, 1, 0, 1, -0)
								if _G.fc then cframe = (S.w.CurrentCamera.CFrame - hd.Position) * Vector3.new(-1, -1, -1) end
								O.Events.look:FireServer(cframe, rootj.C0, rs.C0, "high")
								O.Events.look:FireServer(cframe, rootj.C0, rs.C0, "medium")
								O.Events.look:FireServer(cframe, rootj.C0, rs.C0, "low")
								O.Events.look:FireServer(cframe, rootj.C0, rs.C0, "lowest")
							end
						end
					else torso.headzoom.Name = "Neck"; reloadcabm(); O.headzoom.Enabled = false end
				end
			end,
		})
		
	end
loadprogress(6818)
-- local notifytab = Window:CreateTab("Notify", 7733920644)

	-- notifytab:CreateToggle({
	-- 	Name = "Blob Spawn",
	-- 	CurrentValue = false,
	-- 	Flag = "BlobSpawn",
	-- 	Callback = function(Value)
	-- 		blobspawnnotify = Value
	-- 	end,
	-- })

	-- notifytab:CreateDropdown({
	-- 	Name = "Action",
	-- 	Options = {"delete blob","kill blob owner","notify"},
	-- 	CurrentOption = {""},
	-- 	MultipleOptions = true,
	-- 	Flag = "BlobSpawnAction", 
	-- 	Callback = function(Option)
			
	-- 	end,
	-- })
loadprogress(6840)
local scripttab = Window:CreateTab("Script", 7733920644)

	scripttab:CreateButton({
		Name = "Dex For Xeno",
		Callback = function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/fgdergewrgegr/all/refs/heads/main/DEX%20for%20xeno'))()
		end,
	})

	scripttab:CreateButton({
		Name = "Rejoin Game",
		Callback = function()
			local TeleportService = game:GetService("TeleportService")
			local Players = game:GetService("Players")
			local LocalPlayer = O.me

			local Rejoin = coroutine.create(function()
				local Success, ErrorMessage = pcall(function()
					TeleportService:Teleport(game.PlaceId, LocalPlayer)
				end)

				if ErrorMessage and not Success then
					warn(ErrorMessage)
				end
			end)

			coroutine.resume(Rejoin)
		end,
	})
loadprogress(6870)
local visualtab = Window:CreateTab("Visual", 7733774602)

	visualtab:CreateSection("Chams")

		visualtab:CreateToggle({
			Name = "Toggle",
			CurrentValue = false,
			Flag = "ChamsToggle",
			Callback = function(Value)
				chamstoggle = Value
				achams()
				if not(chamstoggle) then
					local check = {"acsb", "acsb1", "acspl"}
					for _,obj in pairs(O.chars:GetDescendants()) do if check_list(check, obj.Name) then obj:Destroy() end end
				end
			end,
		})

		visualtab:CreateToggle({
			Name = "Line",
			CurrentValue = false,
			Flag = "ChamsLine",
			Callback = function(Value)
				chamsline = Value
				achams()
				if not(chamsline) then for _,char in pairs(O.chars:GetChildren()) do if char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("acspl") then char.HumanoidRootPart.acspl:Destroy() end end end
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Color",
			Color = Color3.fromRGB(0,0,0),
			Flag = "OutlineColor/chams",
			Callback = function(Value)
				chamsoutlinecolor = Value
				achams()
			end
		})

		visualtab:CreateSlider({
			Name = "Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "ChamsOutlineTransparency",
			Callback = function(Value)
				chamsoutlinetransparency = Value
				achams()
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Surface Color",
			Color = Color3.fromRGB(0,0,0),
			Flag = "FillColor/chams",
			Callback = function(Value)
				chamsfillcolor = Value
				achams()
			end
		})

		visualtab:CreateSlider({
			Name = "Surface Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0.7,
			Flag = "ChamsFillTransparency",
			Callback = function(Value)
				chamsfilltransparency = Value
				achams()
			end,
		})

	visualtab:CreateSection("Left Hand List Chams")

		visualtab:CreateToggle({
			Name = "Toggle",
			CurrentValue = false,
			Flag = "LeftHandList/ChamsToggle",
			Callback = function(Value)
				lefthandlistchamstoggleoggle = Value
				while lefthandlistchamstoggleoggle and task.wait() do chams("lhl", lefthandlistcolor, lefthandlistsurfacecolor, lefthandlisttransparency, lefthandlistsurfacetransparency, lefthandlistline) end
				local check = {"lhlsb", "lhlsb1", "lhlspl", "sbAspllhlsv"}
				for _,obj in pairs(O.chars:GetDescendants()) do if check_list(check, obj.Name) then obj:Destroy() end end
			end,
		})

		visualtab:CreateToggle({
			Name = "Line",
			CurrentValue = false,
			Flag = "LeftHandList/Line",
			Callback = function(Value)
				lefthandlistline = Value
				if not(lefthandlistline) then for _,char in pairs(O.chars:GetChildren()) do if char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("lhlspl") then char.HumanoidRootPart.lhlspl:Destroy() end end end
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Color",
			Color = Color3.fromRGB(0,0,0),
			Flag = "LeftHandListColor/chams",
			Callback = function(Value)
				lefthandlistcolor = Value
			end
		})

		visualtab:CreateSlider({
			Name = "Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "LeftHandListTransparency",
			Callback = function(Value)
				lefthandlisttransparency = Value
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Surface Color",
			Color = Color3.fromRGB(255,255,0),
			Flag = "LeftHandListSurfaceColor/chams",
			Callback = function(Value)
				lefthandlistsurfacecolor = Value
			end
		})

		visualtab:CreateSlider({
			Name = "Surface Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0.7,
			Flag = "LeftHandListSurfaceTransparency",
			Callback = function(Value)
				lefthandlistsurfacetransparency = Value
			end,
		})

	visualtab:CreateSection("Right Hand List Chams")

		visualtab:CreateToggle({
			Name = "Toggle",
			CurrentValue = false,
			Flag = "RightHandList/ChamsToggle",
			Callback = function(Value)
				righthandlistchamstoggleoggle = Value
				while righthandlistchamstoggleoggle and task.wait() do chams("rhl", righthandlistcolor, righthandlistsurfacecolor, righthandlisttransparency, righthandlistsurfacetransparency, righthandlistline) end
				local check = {"rhlsb", "rhlsb1", "rhlspl", "sbAsplrhlsv"}
				for _,obj in pairs(O.chars:GetDescendants()) do if check_list(check, obj.Name) then obj:Destroy() end end
			end,
		})

		visualtab:CreateToggle({
			Name = "Line",
			CurrentValue = false,
			Flag = "RightHandList/Line",
			Callback = function(Value)
				righthandlistline = Value
				if not(righthandlistline) then for _,char in pairs(O.chars:GetChildren()) do if char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("rhlspl") then char.HumanoidRootPart.rhlspl:Destroy() end end end
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Color",
			Color = Color3.fromRGB(0,0,0),
			Flag = "RightHandListColor/chams",
			Callback = function(Value)
				righthandlistcolor = Value
			end
		})

		visualtab:CreateSlider({
			Name = "Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "RightHandListTransparency",
			Callback = function(Value)
				righthandlisttransparency = Value
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Surface Color",
			Color = Color3.fromRGB(255,170,0),
			Flag = "RightHandListSurfaceColor/chams",
			Callback = function(Value)
				righthandlistsurfacecolor = Value
			end
		})

		visualtab:CreateSlider({
			Name = "Surface Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0.7,
			Flag = "RightHandListSurfaceTransparency",
			Callback = function(Value)
				righthandlistsurfacetransparency = Value
			end,
		})

	visualtab:CreateSection("Kill List Chams")

		visualtab:CreateToggle({
			Name = "Toggle",
			CurrentValue = false,
			Flag = "KillList/ChamsToggle",
			Callback = function(Value)
				killlistchamstoggleoggle = Value
				while killlistchamstoggleoggle and task.wait() do chams("kl", killlistcolor, killlistsurfacecolor, killlisttransparency, killlistsurfacetransparency, killlistline) end
				local check = {"klsb", "klsb1", "klspl", "sbAsplklsv"}
				for _,obj in pairs(O.chars:GetDescendants()) do if check_list(check, obj.Name) then obj:Destroy() end end
			end,
		})

		visualtab:CreateToggle({
			Name = "Line",
			CurrentValue = false,
			Flag = "KillList/Line",
			Callback = function(Value)
				killlistline = Value
				if not(killlistline) then for _,char in pairs(O.chars:GetChildren()) do if char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("klspl") then char.HumanoidRootPart.klspl:Destroy() end end end
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Color",
			Color = Color3.fromRGB(0,0,0),
			Flag = "KillListColor/chams",
			Callback = function(Value)
				killlistcolor = Value
			end
		})

		visualtab:CreateSlider({
			Name = "Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "KillListTransparency",
			Callback = function(Value)
				killlisttransparency = Value
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Surface Color",
			Color = Color3.fromRGB(255,0,0),
			Flag = "KillListSurfaceColor/chams",
			Callback = function(Value)
				killlistsurfacecolor = Value
			end
		})

		visualtab:CreateSlider({
			Name = "Surface Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0.7,
			Flag = "KillListSurfaceTransparency",
			Callback = function(Value)
				killlistsurfacetransparency = Value
			end,
		})

	visualtab:CreateSection("White List Chams")

		visualtab:CreateToggle({
			Name = "Toggle",
			CurrentValue = false,
			Flag = "WhiteList/ChamsToggle",
			Callback = function(Value)
				whitelistchamstoggleoggle = Value
				while whitelistchamstoggleoggle and task.wait() do chams("wl", whitelistcolor, whitelistsurfacecolor, whitelisttransparency, whitelistsurfacetransparency, whitelistline) end
				local check = {"wlsb", "wlsb1", "wlspl", "sbAsplwlsv"}
				for _,obj in pairs(O.chars:GetDescendants()) do if check_list(check, obj.Name) then obj:Destroy() end end
			end,
		})

		visualtab:CreateToggle({
			Name = "Line",
			CurrentValue = false,
			Flag = "WhiteList/Line",
			Callback = function(Value)
				whitelistline = Value
				if not(whitelistline) then for _,char in pairs(O.chars:GetChildren()) do if char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("wlspl") then char.HumanoidRootPart.wlspl:Destroy() end end end
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Color",
			Color = Color3.fromRGB(0,0,0),
			Flag = "WhiteListColor/chams",
			Callback = function(Value)
				whitelistcolor = Value
			end
		})

		visualtab:CreateSlider({
			Name = "Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "WhiteListTransparency",
			Callback = function(Value)
				whitelisttransparency = Value
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Surface Color",
			Color = Color3.fromRGB(255,255,255),
			Flag = "WhiteListSurfaceColor/chams",
			Callback = function(Value)
				whitelistsurfacecolor = Value
			end
		})

		visualtab:CreateSlider({
			Name = "Surface Transparency",
			Range = {0, 1},
			Increment = 0.1,
			Suffix = "",
			CurrentValue = 0.7,
			Flag = "WhiteListSurfaceTransparency",
			Callback = function(Value)
				whitelistsurfacetransparency = Value
			end,
		})

	visualtab:CreateSection("FPS Boost")

		visualtab:CreateDropdown({
			Name = "Graphics Quality",
			Options = {"Bad","Default","Good","Best"},
			CurrentOption = {""},
			MultipleOptions = false,
			Flag = "GraphicsQuality", 
			Callback = function(Option)
				local temp = ""; for _,t in pairs(Option) do temp = temp..t end
				if temp == "Bad" then
					reset_gq()
					for _,obj in pairs(S.w:GetDescendants()) do if obj:IsA("Part") then local bv = Instance.new("BoolValue", obj); bv.Name = "gqcs"; bv.Value = obj.CastShadow; obj.CastShadow = false end end
					game.Lighting.Technology = "Legacy"
					game.MaterialService.Use2022Materials = true
				elseif temp == "Default" then reset_gq()
				elseif temp == "Good" then
					reset_gq()
					game.Lighting.Technology = "ShadowMap"
				elseif temp == "Best" then
					reset_gq()
					-- for _,obj in pairs(S.w:GetDescendants()) do if obj:IsA("Part") then local bv = Instance.new("BoolValue", obj); bv.Name = "gqcs"; bv.Value = obj.CastShadow; obj.CastShadow = true end end
					for _,obj in pairs(S.w:GetDescendants()) do if obj:IsA("PointLight") then local bv = Instance.new("BoolValue", obj); bv.Name = "gqs"; bv.Value = obj.Shadows; obj.Shadows = true end end
					for _,obj in pairs(S.w:GetDescendants()) do if obj:IsA("SpotLight") then local bv = Instance.new("BoolValue", obj); bv.Name = "gqs"; bv.Value = obj.Shadows; obj.Shadows = true end end
					O.sunrays.Intensity = 0.25
					O.sunrays.Spread = 1
					game.Lighting.Technology = "Future"
					game.Lighting.OutdoorAmbient = Color3.fromRGB(160, 160, 160)
					game.Lighting.Ambient = Color3.fromRGB(80, 80, 80)
					O.bloomeffect.Intensity = 1
					O.bloomeffect.Size = 1
					O.bloomeffect.Threshold = 1
				end
			end,
		})

		visualtab:CreateToggle({
			Name = "Hide All Toys",
			CurrentValue = false,
			Flag = "HideAllToys",
			Callback = function(Value)
				L.hidealltoys = not(L.hidealltoys)
				local t = L.hidealltoys
				while t == L.hidealltoys and task.wait() do
					for _,plr in ipairs(S.Players:GetPlayers()) do 
						if plr ~= O.me then
							if O.backpacks:FindFirstChild(plr.Name.."SpawnedInToys") then
								for _,toy in pairs(O.backpacks[plr.Name.."SpawnedInToys"]:GetChildren()) do
									for _,prt in pairs(toy:GetDescendants()) do
										if prt:IsA("Part") then
											local nb = prt:FindFirstChild("TValue")
											if not(nb) then
												nb = Instance.new("NumberValue", prt)
												nb.Name = "TValue"
												nb.Value = prt.Transparency
											end
											if L.hidealltoys then prt.Transparency = 1 else prt.Transparency = nb.Value end
										end
									end
									task.wait()
								end
							end
						end
					end
				end
			end,
		})

		visualtab:CreateToggle({
			Name = "No Shadow All Toys",
			CurrentValue = false,
			Flag = "NoShadowAllToys",
			Callback = function(Value)
				L.shadowalltoys = not(L.shadowalltoys)
				local t = L.shadowalltoys
				while t == L.shadowalltoys and task.wait() do
					for _,plr in ipairs(S.Players:GetPlayers()) do 
						if plr ~= O.me then
							if O.backpacks:FindFirstChild(plr.Name.."SpawnedInToys") then
								for _,toy in pairs(O.backpacks[plr.Name.."SpawnedInToys"]:GetChildren()) do
									for _,prt in pairs(toy:GetDescendants()) do
										if prt:IsA("Part") then
											local bv = prt:FindFirstChild("SValue")
											if not(bv) then
												bv = Instance.new("BoolValue", prt)
												bv.Name = "SValue"
												bv.Value = prt.CastShadow
											end
											if L.shadowalltoys then prt.CastShadow = false else prt.CastShadow = bv.Value end
										end
									end
									task.wait()
								end
							end
						end
					end
				end
			end,
		})

		visualtab:CreateToggle({
			Name = "Store All Players Toys",
			CurrentValue = false,
			Flag = "StoreAllToys",
			Callback = function(Value)
				L.storeallplayerstoys = not(L.storeallplayerstoys)
				local t = L.storeallplayerstoys
				while t == L.storeallplayerstoys and task.wait() do
					for _,plr in ipairs(S.Players:GetPlayers()) do 
						if plr ~= O.me then
							if L.storeallplayerstoys then
								if O.backpacks:FindFirstChild(plr.Name.."SpawnedInToys") then
									O.backpacks[plr.Name.."SpawnedInToys"].Parent = S.RS
								end
							else 
								if S.RS:FindFirstChild(plr.Name.."SpawnedInToys") then 
									S.RS[plr.Name.."SpawnedInToys"].Parent = S.w 
								end 
							end
						end
					end
				end
			end,
		})

	visualtab:CreateSection("Sky")

		visualtab:CreateColorPicker({
			Name = "Clouds Color",
			Color = Color3.fromRGB(0,0,0),
			Flag = "CloudsColor",
			Callback = function(Value)
				S.w.Terrain.Clouds.Color = Value
			end
		})

		visualtab:CreateSlider({
			Name = "Time Slider",
			Range = {0, 23},
			Increment = 0.001,
			Suffix = "",
			CurrentValue = 14,
			Flag = "FOVSlider",
			Callback = function(Value)
				game.Lighting.ClockTime = Value
			end,
		})

		visualtab:CreateToggle({
			Name = "Time Sync",
			CurrentValue = false,
			Flag = "timesync",
			Callback = function(Value)
				timesync = Value
				while timesync and task.wait(1) do
					local data = request({
						Url = "https://www.timeapi.io/api/time/current/zone?timeZone=Europe%2FAmsterdam",
						Method = "GET",
					})
					data = S.HS:JSONDecode(data.Body)
					game.Lighting.TimeOfDay = tostring(tonumber(data.hour)+1)..":"..data.minute..":"..data.seconds
				end
			end,
		})

	visualtab:CreateSection("World")

		visualtab:CreateColorPicker({
			Name = "Ocean Color",
			Color = Color3.fromRGB(8,137,207),
			Flag = "OceanColor",
			Callback = function(Value)
				local v1 = O.m.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel
				for _,prt in pairs(v1:GetChildren()) do 
					if prt:IsA("Part") and prt.Name == "Ocean" then
						prt.Color = Value
					end
				end
			end
		})

	visualtab:CreateSection("Others")

		visualtab:CreateSlider({
			Name = "FOV Slider",
			Range = {1, 120},
			Increment = 1,
			Suffix = "(70 Normally)",
			CurrentValue = 70,
			Flag = "FOVSlider",
			Callback = function(Value)
				S.w.CurrentCamera.FieldOfView = Value 
			end,
		})

	visualtab:CreateSection("Color Correction")

		visualtab:CreateToggle({
			Name = "LSD",
			CurrentValue = false,
			Flag = "LSD",
			Callback = function(Value)
				LSD = Value
				O.ccc.Enabled = LSD
				if LSD then
					local save1 = O.ccc.Brightness
					local save2 = O.ccc.Contrast
					local save3 = O.ccc.Saturation
					O.ccc.Brightness = 1
					O.ccc.Contrast = 10
					O.ccc.Saturation = 1
					while LSD do
						O.ccc.TintColor = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
						task.wait()
					end
					O.ccc.Brightness = save1
					O.ccc.Contrast = save2
					O.ccc.Saturation = save3
				end
			end,
		})

		visualtab:CreateToggle({
			Name = "Color Correction",
			CurrentValue = false,
			Flag = "ColorCorrection",
			Callback = function(Value)
				O.ccc.Enabled = Value
			end,
		})

		visualtab:CreateSlider({
			Name = "Brightness",
			Range = {0,10},
			Increment = 1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "Brightness",
			Callback = function(Value)
				O.ccc.Brightness = Value
			end,
		})

		visualtab:CreateSlider({
			Name = "Contrast",
			Range = {0,100},
			Increment = 1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "Contrast",
			Callback = function(Value)
				O.ccc.Contrast = Value
			end,
		})

		visualtab:CreateSlider({
			Name = "Saturation",
			Range = {0,100},
			Increment = 1,
			Suffix = "",
			CurrentValue = 0,
			Flag = "Saturation",
			Callback = function(Value)
				O.ccc.Saturation = Value
			end,
		})

		visualtab:CreateColorPicker({
			Name = "Tint Color",
			Color = Color3.fromRGB(0,0,0),
			Flag = "TintColor",
			Callback = function(Value)
				O.ccc.TintColor = Value
			end
		})
loadprogress(7485)
local guitab = Window:CreateTab("GUI", 7733774602)

	guitab:CreateSection("Rayfield")

		guitab:CreateColorPicker({
			Name = "TextColor",
			Color = Color3.fromRGB(240, 240, 240),
			Flag = "TextColor/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.TextColor = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "Background",
			Color = Color3.fromRGB(25, 25, 25),
			Flag = "Background/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.Background = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "Topbar",
			Color = Color3.fromRGB(34, 34, 34),
			Flag = "Topbar/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.Topbar = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "Shadow",
			Color = Color3.fromRGB(20, 20, 20),
			Flag = "Shadow/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.Shadow = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "NotificationBackground",
			Color = Color3.fromRGB(20, 20, 20),
			Flag = "NotificationBackground/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.NotificationBackground = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "NotificationActionsBackground",
			Color = Color3.fromRGB(230, 230, 230),
			Flag = "NotificationActionsBackground/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.NotificationActionsBackground = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "TabBackground",
			Color = Color3.fromRGB(80, 80, 80),
			Flag = "TextTabBackgroundColor/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.TextTabBackgroundColor = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "TabStroke",
			Color = Color3.fromRGB(85, 85, 85),
			Flag = "TabStroke/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.TabStroke = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "TabBackgroundSelected",
			Color = Color3.fromRGB(210, 210, 210),
			Flag = "TabBackgroundSelected/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.TabBackgroundSelected = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "TabTextColor",
			Color = Color3.fromRGB(240, 240, 240),
			Flag = "TabTextColor/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.TabTextColor = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "SelectedTabTextColor",
			Color = Color3.fromRGB(50, 50, 50),
			Flag = "SelectedTabTextColor/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.SelectedTabTextColor = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ElementBackground",
			Color = Color3.fromRGB(35, 35, 35),
			Flag = "ElementBackground/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ElementBackground = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ElementBackgroundHover",
			Color = Color3.fromRGB(40, 40, 40),
			Flag = "ElementBackgroundHover/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ElementBackgroundHover = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "SecondaryElementBackground",
			Color = Color3.fromRGB(25, 25, 25),
			Flag = "SecondaryElementBackground/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.SecondaryElementBackground = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ElementStroke",
			Color = Color3.fromRGB(50, 50, 50),
			Flag = "ElementStroke/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ElementStroke = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "SecondaryElementStroke",
			Color = Color3.fromRGB(40, 40, 40),
			Flag = "SecondaryElementStroke/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.SecondaryElementStroke = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "SliderBackground",
			Color = Color3.fromRGB(43, 105, 159),
			Flag = "SliderBackground/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.SliderBackground = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "SliderProgress",
			Color = Color3.fromRGB(43, 105, 159),
			Flag = "SliderProgress/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.SliderProgress = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "SliderStroke",
			Color = Color3.fromRGB(48, 119, 177),
			Flag = "SliderStroke/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.SliderStroke = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ToggleBackground",
			Color = Color3.fromRGB(30, 30, 30),
			Flag = "ToggleBackground/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ToggleBackground = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ToggleEnabled",
			Color = Color3.fromRGB(0, 146, 214),
			Flag = "ToggleEnabled/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ToggleEnabled = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ToggleDisabled",
			Color = Color3.fromRGB(100, 100, 100),
			Flag = "ToggleDisabled/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ToggleDisabled = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ToggleEnabledStroke",
			Color = Color3.fromRGB(0, 170, 255),
			Flag = "ToggleEnabledStroke/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ToggleEnabledStroke = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ToggleDisabledStroke",
			Color = Color3.fromRGB(125, 125, 125),
			Flag = "ToggleDisabledStroke/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ToggleDisabledStroke = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ToggleEnabledOuterStroke",
			Color = Color3.fromRGB(100, 100, 100),
			Flag = "ToggleEnabledOuterStroke/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ToggleEnabledOuterStroke = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "ToggleDisabledOuterStroke",
			Color = Color3.fromRGB(65, 65, 65),
			Flag = "ToggleDisabledOuterStroke/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.ToggleDisabledOuterStroke = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "InputBackground",
			Color = Color3.fromRGB(30, 30, 30),
			Flag = "InputBackground/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.InputBackground = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "InputStroke",
			Color = Color3.fromRGB(65, 65, 65),
			Flag = "InputStroke/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.InputStroke = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

		guitab:CreateColorPicker({
			Name = "PlaceholderColor",
			Color = Color3.fromRGB(178, 178, 178),
			Flag = "PlaceholderColor/rfc",
			Callback = function(Value)
				Ld.field.Theme.Default2.PlaceholderColor = Value
				Ld.field:ChangeTheme("Default2")
			end
		})

	guitab:CreateSection("FTAP")

		guitab:CreateColorPicker({
			Name = "Coins",
			Color = Color3.fromRGB(0, 0, 0),
			Flag = "Coins/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.Coins = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "TabBar",
			Color = Color3.fromRGB(66, 66, 66),
			Flag = "TabBar/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.TabBar = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "Settings",
			Color = Color3.fromRGB(0, 0, 0),
			Flag = "Settings/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.Settings = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "Shop",
			Color = Color3.fromRGB(0, 0, 0),
			Flag = "Shop/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.Shop = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "ToyDestroy",
			Color = Color3.fromRGB(0, 0, 0),
			Flag = "ToyDestroy/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.ToyDestroy = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "ToyShop",
			Color = Color3.fromRGB(0, 0, 0),
			Flag = "ToyShop/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.ToyShop = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "Toys",
			Color = Color3.fromRGB(0, 0, 0),
			Flag = "Toys/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.Toys = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "SettingsContents",
			Color = Color3.fromRGB(90, 90, 90),
			Flag = "SettingsContents/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.SettingsContents = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "SettingsTitle",
			Color = Color3.fromRGB(66, 66, 66),
			Flag = "SettingsTitle/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.SettingsTitle = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "ShopTitle",
			Color = Color3.fromRGB(66, 66, 66),
			Flag = "ShopTitle/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.ShopTitle = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "ShopContents",
			Color = Color3.fromRGB(90, 90, 90),
			Flag = "ShopContents/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.ShopContents = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "ToysContents",
			Color = Color3.fromRGB(90, 90, 90),
			Flag = "ToysContents/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.ToysContents = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "FavoritesFrame",
			Color = Color3.fromRGB(120, 120, 120),
			Flag = "FavoritesFrame/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.FavoritesFrame = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "Favorites",
			Color = Color3.fromRGB(66, 66, 66),
			Flag = "Favorites/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.Favorites = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "MeterFrame",
			Color = Color3.fromRGB(120, 120, 120),
			Flag = "MeterFrame/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.MeterFrame = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "SortingTabs",
			Color = Color3.fromRGB(120, 120, 120),
			Flag = "SortingTabs/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.SortingTabs = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "ToysTitle",
			Color = Color3.fromRGB(66, 66, 66),
			Flag = "ToysTitle/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.ToysTitle = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "DestroyTitle",
			Color = Color3.fromRGB(66, 66, 66),
			Flag = "DestroyTitle/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.DestroyTitle = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "DestroyContents",
			Color = Color3.fromRGB(90, 90, 90),
			Flag = "DestroyContents/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.DestroyContents = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "DestroyMeterFrame",
			Color = Color3.fromRGB(120, 120, 120),
			Flag = "DestroyMeterFrame/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.DestroyMeterFrame = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "ToyShopTitle",
			Color = Color3.fromRGB(66, 66, 66),
			Flag = "ToyShopTitle/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.ToyShopTitle = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "ToyShopSortingTabs",
			Color = Color3.fromRGB(120, 120, 120),
			Flag = "ToyShopSortingTabs/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.ToyShopSortingTabs = Value
				set_ftap_color()
			end
		})

		guitab:CreateColorPicker({
			Name = "ToyShopContents",
			Color = Color3.fromRGB(90, 90, 90),
			Flag = "ToyShopContents/ftapc",
			Callback = function(Value)
				Lt.ftapcolors.ToyShopContents = Value
				set_ftap_color()
			end
		})

		GridLayoutX = 90
		GridLayoutY = 90
		guitab:CreateSlider({
			Name = "Grid Layout X",
			Range = {0, 100},
			Increment = 1,
			Suffix = "(90 Default)",
			CurrentValue = 90,
			Flag = "GridLayoutX",
			Callback = function(Value)
				GridLayoutX = Value
				O.me.PlayerGui.MenuGui.Menu.TabContents.Toys.Contents.UIGridLayout.CellSize = UDim2.new(0, GridLayoutX, 0, GridLayoutY)
				O.me.PlayerGui.MenuGui.Menu.TabContents.ToyShop.Contents.UIGridLayout.CellSize = UDim2.new(0, GridLayoutX, 0, GridLayoutY)
				O.me.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents.UIGridLayout.CellSize = UDim2.new(0, GridLayoutX, 0, GridLayoutY)
			end,
		})

		guitab:CreateSlider({
			Name = "Grid Layout Y",
			Range = {0, 100},
			Increment = 1,
			Suffix = "(90 Default)",
			CurrentValue = 90,
			Flag = "GridLayoutY",
			Callback = function(Value)
				GridLayoutY = Value
				O.me.PlayerGui.MenuGui.Menu.TabContents.Toys.Contents.UIGridLayout.CellSize = UDim2.new(0, GridLayoutX, 0, GridLayoutY)
				O.me.PlayerGui.MenuGui.Menu.TabContents.ToyShop.Contents.UIGridLayout.CellSize = UDim2.new(0, GridLayoutX, 0, GridLayoutY)
				O.me.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents.UIGridLayout.CellSize = UDim2.new(0, GridLayoutX, 0, GridLayoutY)
			end,
		})
loadprogress(8043)
local chattab = Window:CreateTab("Chat Menu", 7733678388)

	chattab:CreateSection("Spy")

		chattab:CreateToggle({
			Name = "Spy Toggle",
			CurrentValue = false,
			Flag = "SpyToggle",
			Callback = function(Value)
				L.spyenabled = Value
				Lt.privateProperties.Text = "♥VSPY "..(L.spyenabled and "EN" or "DIS").."ABLED♥"
				O.me:WaitForChild("PlayerGui"):WaitForChild("Chat")
				S.StarterGui:SetCore("ChatMakeSystemMessage",Lt.privateProperties)
			end, 
		})

		chattab:CreateToggle({
			Name = "Publish To Chat",
			CurrentValue = false,
			Flag = "PublishToChat",
			Callback = function(Value)
				L.public = Value
			end, 
		})

		chattab:CreateToggle({
			Name = "Publish To Discord",
			CurrentValue = false,
			Flag = "PublishToDiscord",
			Callback = function(Value)
				L.publicds = Value
			end, 
		})

		chattab:CreateColorPicker({
			Name = "Spy Color",
			Color = Color3.fromRGB(255,0,0),
			Callback = function(Value)
				Lt.privateProperties.Color = Value
			end
		})

	chattab:CreateSection("Player Spy")

		chattab:CreateToggle({
			Name = "Publish All Info To Discord",
			CurrentValue = false,
			Flag = "PublishAllInfoToDiscord",
			Callback = function(Value)
				L.paitd = Value
				if L.spyallplrinfo then
					for _,plr in ipairs(S.Players:GetPlayers()) do
						dssend(Str.playerinfoweb, plr.DisplayName.." "..plr.Name.." "..plr.UserId.." "..plr.FollowUserId,O.me.DisplayName.." ("..O.myname..")")
					end
					L.spyallplrinfo = false
				end
			end, 
		})

	chattab:CreateSection("Sound Spam(Premium Only)")

	if not(check_prem(O.me)) or L.vhsows then

		SoundSpam = chattab:CreateToggle({
			Name = "Spam",
			CurrentValue = false,
			Flag = "Spam",
			Callback = function(Value)
				spam = Value
				while spam and task.wait(spamspeed or 0) do
					if sounds then
						for _,sound in pairs(sounds) do
							if sound ~= "" then
								S.Players:Chat(sound)
								task.wait(spamspeed or 0)
							end
						end
					end
				end
			end, 
		})

		chattab:CreateDropdown({
			Name = "Sounds",
			Options = Lt.sounds,
			CurrentOption = {""},
			MultipleOptions = true,
			Flag = "SoundsList", 
			Callback = function(Option)
				sounds = Option
			end,
		})

		chattab:CreateSlider({
			Name = "Speed Slider",
			Range = {0, 1},
			Increment = 0.01,
			Suffix = "",
			CurrentValue = 0,
			Flag = "SpeedSlider",
			Callback = function(Value)
				spamspeed = Value 
			end,
		})

		chattab:CreateKeybind({
			Name = "Spam Bind",
			CurrentKeybind = "",
			HoldToInteract = false,
			Flag = "SpamBind", 
			Callback = function(Keybind)
				task.spawn(function() fstatus("Sound Spam".." is a "..(not(spam) and "En" or "Dis").."abled") end)
				SoundSpam:Set(not(spam))
			end,
		})
	end
loadprogress(8160)
local infotab = Window:CreateTab("Info", 7733964719)
	infotab:CreateButton({
		Name = "Copy Discord URL", -- d͟s͟c͟.͟g͟g͟/͟v͟h͟s͟s͟
		Callback = function()
			setclipboard("https://discord.gg/BCw8KuTDnj")
		end,
	})

	infotab:CreateButton({
		Name = "Say to chat disscord link",
		Callback = function()
			O.Events.saymsg:FireServer("d͟s͟c͟.͟g͟g͟/͟v͟h͟s͟s͟","All")
		end,
	})
loadprogress(8178)
S.w.ChildAdded:Connect(function(mmodel)
	if mmodel.Name == "BlackHoleKick" then
		N.kickcountc = N.kickcountc+1
		kickcount:Set("Kicked: "..N.kickcountc)
		dssend(Str.kicksweb, "+kick",O.me.DisplayName.." ("..O.myname..")")
	end
end)
task.spawn(dssend, Str.executedweb, "Запустился/It started",O.me.DisplayName.." ("..O.myname..")")
loadprogress(8187)

--REVAMP
if sendmessage then chatMessage("♥VHSVF♥: 💀 OWNER MODE loaded") end
-- if get_rank(O.me) ~= 1 then
-- 	local msg = ""
-- 	if check_list(Lt.admins, O.me.UserId) then msg = ": Admin mode" end
-- 	if L.vhsows then msg = ": OWNER MODE" end
-- 	chatMessage("♥VHSVF♥: 💀"..msg)
-- 	--bchat("dsc.gg/vhss")
-- end

lnotify("Loading Configurations"); task.wait(0.3); loadprogress(8193)
if isfile("VHS/sjnl.vhs") then Lt.sjnl = S.HS:JSONDecode(readfile("VHS/sjnl.vhs")) end; loadprogress("last")
if isfile("VHS/LineColor.vhs") then for i,v in ipairs(S.HS:JSONDecode(readfile("VHS/LineColor.vhs"))) do Lt.ccolors[i] = UnpackColor(v) end end; loadprogress(7242)
task.delay(1, function() Lt.ftapcolors = Ld.field.Theme.ftapc end); loadprogress("last")
task.delay(1, function() chamsfillcolor = Ld.field.Theme.FillColor end); loadprogress("last")
task.delay(1, function() chamsoutlinecolor = Ld.field.Theme.OutlineColor end); loadprogress("last")
task.delay(1, function() lefthandlistcolor = Ld.field.Theme.LeftHandListColor end); loadprogress("last")
task.delay(1, function() lefthandlistsurfacecolor = Ld.field.Theme.LeftHandListSurfaceColor end); loadprogress("last")
task.delay(1, function() righthandlistcolor = Ld.field.Theme.RightHandListColor end); loadprogress("last")
task.delay(1, function() righthandlistsurfacecolor = Ld.field.Theme.RightHandListSurfaceColor end); loadprogress("last")
task.delay(1, function() killlistcolor = Ld.field.Theme.KillListColor end); loadprogress("last")
task.delay(1, function() killlistsurfacecolor = Ld.field.Theme.KillListSurfaceColor end); loadprogress("last")
task.delay(1, function() whitelistcolor = Ld.field.Theme.WhiteListColor end); loadprogress("last")
task.delay(1, function() whitelistsurfacecolor = Ld.field.Theme.WhiteListSurfaceColor end); loadprogress("last")
task.delay(1, function() achams() end); loadprogress("last")
task.delay(1, function() set_ftap_color() end); loadprogress("last")
task.delay(1, function() set_line_color() end); loadprogress("last")
task.spawn(pcall, function()
	if IY_LOADED and not _G.IY_DEBUG == true then
		-- error("Infinite Yield is already running!", 0)
		return
	end

	pcall(function() getgenv().IY_LOADED = true end)

	local cloneref = cloneref or function(o) return o end
	COREGUI = cloneref(game:GetService("CoreGui"))
	Players = cloneref(game:GetService("Players"))

	if not game:IsLoaded() then
		local notLoaded = Instance.new("Message")
		notLoaded.Parent = COREGUI
		notLoaded.Text = "Infinite Yield is waiting for the game to load"
		game.Loaded:Wait()
		notLoaded:Destroy()
	end

	currentVersion = "6"

	Holder = Instance.new("Frame")
	Title = Instance.new("TextLabel")
	Dark = Instance.new("Frame")
	Cmdbar = Instance.new("TextBox")
	CMDsF = Instance.new("ScrollingFrame")
	cmdListLayout = Instance.new("UIListLayout")
	SettingsButton = Instance.new("ImageButton")
	ColorsButton = Instance.new("ImageButton")
	Settings = Instance.new("Frame")
	Prefix = Instance.new("TextLabel")
	PrefixBox = Instance.new("TextBox")
	Keybinds = Instance.new("TextLabel")
	StayOpen = Instance.new("TextLabel")
	Button = Instance.new("Frame")
	On = Instance.new("TextButton")
	Positions = Instance.new("TextLabel")
	EventBind = Instance.new("TextLabel")
	Plugins = Instance.new("TextLabel")
	Example = Instance.new("TextButton")
	Notification = Instance.new("Frame")
	Title_2 = Instance.new("TextLabel")
	Text_2 = Instance.new("TextLabel")
	CloseButton = Instance.new("TextButton")
	CloseImage = Instance.new("ImageLabel")
	PinButton = Instance.new("TextButton")
	PinImage = Instance.new("ImageLabel")
	Tooltip = Instance.new("Frame")
	Title_3 = Instance.new("TextLabel")
	Description = Instance.new("TextLabel")
	IntroBackground = Instance.new("Frame")
	Logo = Instance.new("ImageLabel")
	Credits = Instance.new("TextBox")
	KeybindsFrame = Instance.new("Frame")
	Close = Instance.new("TextButton")
	Add = Instance.new("TextButton")
	Delete = Instance.new("TextButton")
	Holder_2 = Instance.new("ScrollingFrame")
	Example_2 = Instance.new("Frame")
	Text_3 = Instance.new("TextLabel")
	Delete_2 = Instance.new("TextButton")
	KeybindEditor = Instance.new("Frame")
	background_2 = Instance.new("Frame")
	Dark_3 = Instance.new("Frame")
	Directions = Instance.new("TextLabel")
	BindTo = Instance.new("TextButton")
	TriggerLabel = Instance.new("TextLabel")
	BindTriggerSelect = Instance.new("TextButton")
	Add_2 = Instance.new("TextButton")
	Toggles = Instance.new("ScrollingFrame")
	ClickTP  = Instance.new("TextLabel")
	Select = Instance.new("TextButton")
	ClickDelete = Instance.new("TextLabel")
	Select_2 = Instance.new("TextButton")
	Cmdbar_2 = Instance.new("TextBox")
	Cmdbar_3 = Instance.new("TextBox")
	CreateToggle = Instance.new("TextLabel")
	Button_2 = Instance.new("Frame")
	On_2 = Instance.new("TextButton")
	shadow_2 = Instance.new("Frame")
	PopupText_2 = Instance.new("TextLabel")
	Exit_2 = Instance.new("TextButton")
	ExitImage_2 = Instance.new("ImageLabel")
	PositionsFrame = Instance.new("Frame")
	Close_3 = Instance.new("TextButton")
	Delete_5 = Instance.new("TextButton")
	Part = Instance.new("TextButton")
	Holder_4 = Instance.new("ScrollingFrame")
	Example_4 = Instance.new("Frame")
	Text_5 = Instance.new("TextLabel")
	Delete_6 = Instance.new("TextButton")
	TP = Instance.new("TextButton")
	AliasesFrame = Instance.new("Frame")
	Close_2 = Instance.new("TextButton")
	Delete_3 = Instance.new("TextButton")
	Holder_3 = Instance.new("ScrollingFrame")
	Example_3 = Instance.new("Frame")
	Text_4 = Instance.new("TextLabel")
	Delete_4 = Instance.new("TextButton")
	Aliases = Instance.new("TextLabel")
	PluginsFrame = Instance.new("Frame")
	Close_4 = Instance.new("TextButton")
	Add_3 = Instance.new("TextButton")
	Holder_5 = Instance.new("ScrollingFrame")
	Example_5 = Instance.new("Frame")
	Text_6 = Instance.new("TextLabel")
	Delete_7 = Instance.new("TextButton")
	PluginEditor = Instance.new("Frame")
	background_3 = Instance.new("Frame")
	Dark_2 = Instance.new("Frame")
	Img = Instance.new("ImageButton")
	AddPlugin = Instance.new("TextButton")
	FileName = Instance.new("TextBox")
	About = Instance.new("TextLabel")
	Directions_2 = Instance.new("TextLabel")
	shadow_3 = Instance.new("Frame")
	PopupText_3 = Instance.new("TextLabel")
	Exit_3 = Instance.new("TextButton")
	ExitImage_3 = Instance.new("ImageLabel")
	AliasHint = Instance.new("TextLabel")
	PluginsHint = Instance.new("TextLabel")
	PositionsHint = Instance.new("TextLabel")
	ToPartFrame = Instance.new("Frame")
	background_4 = Instance.new("Frame")
	ChoosePart = Instance.new("TextButton")
	CopyPath = Instance.new("TextButton")
	Directions_3 = Instance.new("TextLabel")
	Path = Instance.new("TextLabel")
	shadow_4 = Instance.new("Frame")
	PopupText_5 = Instance.new("TextLabel")
	Exit_4 = Instance.new("TextButton")
	ExitImage_5 = Instance.new("ImageLabel")
	logs = Instance.new("Frame")
	shadow = Instance.new("Frame")
	Hide = Instance.new("TextButton")
	ImageLabel = Instance.new("ImageLabel")
	PopupText = Instance.new("TextLabel")
	Exit = Instance.new("TextButton")
	ImageLabel_2 = Instance.new("ImageLabel")
	background = Instance.new("Frame")
	chat = Instance.new("Frame")
	Clear = Instance.new("TextButton")
	SaveChatlogs = Instance.new("TextButton")
	Toggle = Instance.new("TextButton")
	scroll_2 = Instance.new("ScrollingFrame")
	join = Instance.new("Frame")
	Toggle_2 = Instance.new("TextButton")
	Clear_2 = Instance.new("TextButton")
	scroll_3 = Instance.new("ScrollingFrame")
	listlayout = Instance.new("UIListLayout",scroll_3)
	selectChat = Instance.new("TextButton")
	selectJoin = Instance.new("TextButton")

	function randomString()
		local length = math.random(10,20)
		local array = {}
		for i = 1, length do
			array[i] = string.char(math.random(32, 126))
		end
		return table.concat(array)
	end

	PARENT = nil
	if get_hidden_gui or gethui then
		local hiddenUI = get_hidden_gui or gethui
		local Main = Instance.new("ScreenGui")
		Main.Name = randomString()
		Main.Parent = hiddenUI()
		PARENT = Main
	elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
		local Main = Instance.new("ScreenGui")
		Main.Name = randomString()
		syn.protect_gui(Main)
		Main.Parent = COREGUI
		PARENT = Main
	elseif COREGUI:FindFirstChild('RobloxGui') then
		PARENT = COREGUI.RobloxGui
	else
		local Main = Instance.new("ScreenGui")
		Main.Name = randomString()
		Main.Parent = COREGUI
		PARENT = Main
	end

	shade1 = {}
	shade2 = {}
	shade3 = {}
	text1 = {}
	text2 = {}
	scroll = {}

	Holder.Name = randomString()
	Holder.Parent = PARENT
	Holder.Active = true
	Holder.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Holder.BorderSizePixel = 0
	Holder.Position = UDim2.new(1, -250, 1, -220)
	Holder.Size = UDim2.new(0, 250, 0, 220)
	Holder.ZIndex = 10
	table.insert(shade2,Holder)

	Title.Name = "Title"
	Title.Parent = Holder
	Title.Active = true
	Title.BackgroundColor3 = Color3.fromRGB(36,36,37)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0, 250, 0, 20)
	Title.Font = Enum.Font.SourceSans
	Title.TextSize = 18
	Title.Text = "Infinite Yield VHS"

	do
		local emoji = ({
			["01 01"] = "🎆",
			[(function(Year)
				local A = math.floor(Year/100)
				local B = math.floor((13+8*A)/25)
				local C = (15-B+A-math.floor(A/4))%30
				local D = (4+A-math.floor(A/4))%7
				local E = (19*(Year%19)+C)%30
				local F = (2*(Year%4)+4*(Year%7)+6*E+D)%7
				local G = (22+E+F)
				if E == 29 and F == 6 then
					return "04 19"
				elseif E == 28 and F == 6 then
					return "04 18"
				elseif 31 < G then
					return ("04 %02d"):format(G-31)
				end
				return ("03 %02d"):format(G)
			end)(tonumber(os.date"%Y"))] = "🥚",
			["10 31"] = "🎃",
			["12 25"] = "🎄"
		})[os.date("%m %d")]
		if emoji then
			Title.Text = ("%s %s %s"):format(emoji, Title.Text, emoji)
		end
	end

	Title.TextColor3 = Color3.new(1, 1, 1)
	Title.ZIndex = 10
	table.insert(shade1,Title)
	table.insert(text1,Title)

	Dark.Name = "Dark"
	Dark.Parent = Holder
	Dark.Active = true
	Dark.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	Dark.BorderSizePixel = 0
	Dark.Position = UDim2.new(0, 0, 0, 45)
	Dark.Size = UDim2.new(0, 250, 0, 175)
	Dark.ZIndex = 10
	table.insert(shade1,Dark)

	Cmdbar.Name = "Cmdbar"
	Cmdbar.Parent = Holder
	Cmdbar.BackgroundTransparency = 1
	Cmdbar.BorderSizePixel = 0
	Cmdbar.Position = UDim2.new(0, 5, 0, 20)
	Cmdbar.Size = UDim2.new(0, 240, 0, 25)
	Cmdbar.Font = Enum.Font.SourceSans
	Cmdbar.TextSize = 18
	Cmdbar.TextXAlignment = Enum.TextXAlignment.Left
	Cmdbar.TextColor3 = Color3.new(1, 1, 1)
	Cmdbar.Text = ""
	Cmdbar.ZIndex = 10
	Cmdbar.PlaceholderText = "Command Bar"

	CMDsF.Name = "CMDs"
	CMDsF.Parent = Holder
	CMDsF.BackgroundTransparency = 1
	CMDsF.BorderSizePixel = 0
	CMDsF.Position = UDim2.new(0, 5, 0, 45)
	CMDsF.Size = UDim2.new(0, 245, 0, 175)
	CMDsF.ScrollBarImageColor3 = Color3.fromRGB(78,78,79)
	CMDsF.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	CMDsF.CanvasSize = UDim2.new(0, 0, 0, 0)
	CMDsF.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	CMDsF.ScrollBarThickness = 8
	CMDsF.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	CMDsF.VerticalScrollBarInset = 'Always'
	CMDsF.ZIndex = 10
	table.insert(scroll,CMDsF)

	cmdListLayout.Parent = CMDsF

	SettingsButton.Name = "SettingsButton"
	SettingsButton.Parent = Holder
	SettingsButton.BackgroundTransparency = 1
	SettingsButton.Position = UDim2.new(0, 230, 0, 0)
	SettingsButton.Size = UDim2.new(0, 20, 0, 20)
	SettingsButton.Image = "rbxassetid://1204397029"
	SettingsButton.ZIndex = 10

	ReferenceButton = Instance.new("ImageButton")
	ReferenceButton.Name = "ReferenceButton"
	ReferenceButton.Parent = Holder
	ReferenceButton.BackgroundTransparency = 1
	ReferenceButton.Position = UDim2.new(0, 212, 0, 2)
	ReferenceButton.Size = UDim2.new(0, 16, 0, 16)
	ReferenceButton.Image = "rbxassetid://3523243755"
	ReferenceButton.ZIndex = 10

	Settings.Name = "Settings"
	Settings.Parent = Holder
	Settings.Active = true
	Settings.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(0, 0, 0, 220)
	Settings.Size = UDim2.new(0, 250, 0, 175)
	Settings.ZIndex = 10
	table.insert(shade1,Settings)

	SettingsHolder = Instance.new("ScrollingFrame")
	SettingsHolder.Name = "Holder"
	SettingsHolder.Parent = Settings
	SettingsHolder.BackgroundTransparency = 1
	SettingsHolder.BorderSizePixel = 0
	SettingsHolder.Size = UDim2.new(1,0,1,0)
	SettingsHolder.ScrollBarImageColor3 = Color3.fromRGB(78,78,79)
	SettingsHolder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	SettingsHolder.CanvasSize = UDim2.new(0, 0, 0, 235)
	SettingsHolder.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	SettingsHolder.ScrollBarThickness = 8
	SettingsHolder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	SettingsHolder.VerticalScrollBarInset = 'Always'
	SettingsHolder.ZIndex = 10
	table.insert(scroll,SettingsHolder)

	Prefix.Name = "Prefix"
	Prefix.Parent = SettingsHolder
	Prefix.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Prefix.BorderSizePixel = 0
	Prefix.BackgroundTransparency = 1
	Prefix.Position = UDim2.new(0, 5, 0, 5)
	Prefix.Size = UDim2.new(1, -10, 0, 20)
	Prefix.Font = Enum.Font.SourceSans
	Prefix.TextSize = 14
	Prefix.Text = "Prefix"
	Prefix.TextColor3 = Color3.new(1, 1, 1)
	Prefix.TextXAlignment = Enum.TextXAlignment.Left
	Prefix.ZIndex = 10
	table.insert(shade2,Prefix)
	table.insert(text1,Prefix)

	PrefixBox.Name = "PrefixBox"
	PrefixBox.Parent = Prefix
	PrefixBox.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	PrefixBox.BorderSizePixel = 0
	PrefixBox.Position = UDim2.new(1, -20, 0, 0)
	PrefixBox.Size = UDim2.new(0, 20, 0, 20)
	PrefixBox.Font = Enum.Font.SourceSansBold
	PrefixBox.TextSize = 14
	PrefixBox.Text = ''
	PrefixBox.TextColor3 = Color3.new(0, 0, 0)
	PrefixBox.ZIndex = 10
	table.insert(shade3,PrefixBox)
	table.insert(text2,PrefixBox)

	function makeSettingsButton(name,iconID,off)
		local button = Instance.new("TextButton")
		button.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
		button.BorderSizePixel = 0
		button.Position = UDim2.new(0,0,0,0)
		button.Size = UDim2.new(1,0,0,25)
		button.Text = ""
		button.ZIndex = 10
		local icon = Instance.new("ImageLabel")
		icon.Name = "Icon"
		icon.Parent = button
		icon.Position = UDim2.new(0,5,0,5)
		icon.Size = UDim2.new(0,16,0,16)
		icon.BackgroundTransparency = 1
		icon.Image = iconID
		icon.ZIndex = 10
		if off then
			icon.ScaleType = Enum.ScaleType.Crop
			icon.ImageRectSize = Vector2.new(16,16)
			icon.ImageRectOffset = Vector2.new(off,0)
		end
		local label = Instance.new("TextLabel")
		label.Name = "ButtonLabel"
		label.Parent = button
		label.BackgroundTransparency = 1
		label.Text = name
		label.Position = UDim2.new(0,28,0,0)
		label.Size = UDim2.new(1,-28,1,0)
		label.Font = Enum.Font.SourceSans
		label.TextColor3 = Color3.new(1, 1, 1)
		label.TextSize = 14
		label.ZIndex = 10
		label.TextXAlignment = Enum.TextXAlignment.Left
		table.insert(shade2,button)
		table.insert(text1,label)
		return button
	end

	ColorsButton = makeSettingsButton("Edit Theme","rbxassetid://4911962991")
	ColorsButton.Position = UDim2.new(0,5,0,55)
	ColorsButton.Size = UDim2.new(1,-10,0,25)
	ColorsButton.Name = "Colors"
	ColorsButton.Parent = SettingsHolder

	Keybinds = makeSettingsButton("Edit Keybinds","rbxassetid://129697930")
	Keybinds.Position = UDim2.new(0, 5, 0, 85)
	Keybinds.Size = UDim2.new(1, -10, 0, 25)
	Keybinds.Name = "Keybinds"
	Keybinds.Parent = SettingsHolder

	Aliases = makeSettingsButton("Edit Aliases","rbxassetid://5147488658")
	Aliases.Position = UDim2.new(0, 5, 0, 115)
	Aliases.Size = UDim2.new(1, -10, 0, 25)
	Aliases.Name = "Aliases"
	Aliases.Parent = SettingsHolder

	StayOpen.Name = "StayOpen"
	StayOpen.Parent = SettingsHolder
	StayOpen.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	StayOpen.BorderSizePixel = 0
	StayOpen.BackgroundTransparency = 1
	StayOpen.Position = UDim2.new(0, 5, 0, 30)
	StayOpen.Size = UDim2.new(1, -10, 0, 20)
	StayOpen.Font = Enum.Font.SourceSans
	StayOpen.TextSize = 14
	StayOpen.Text = "Keep Menu Open"
	StayOpen.TextColor3 = Color3.new(1, 1, 1)
	StayOpen.TextXAlignment = Enum.TextXAlignment.Left
	StayOpen.ZIndex = 10
	table.insert(shade2,StayOpen)
	table.insert(text1,StayOpen)

	Button.Name = "Button"
	Button.Parent = StayOpen
	Button.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(1, -20, 0, 0)
	Button.Size = UDim2.new(0, 20, 0, 20)
	Button.ZIndex = 10
	table.insert(shade3,Button)

	On.Name = "On"
	On.Parent = Button
	On.BackgroundColor3 = Color3.fromRGB(150, 150, 151)
	On.BackgroundTransparency = 1
	On.BorderSizePixel = 0
	On.Position = UDim2.new(0, 2, 0, 2)
	On.Size = UDim2.new(0, 16, 0, 16)
	On.Font = Enum.Font.SourceSans
	On.FontSize = Enum.FontSize.Size14
	On.Text = ""
	On.TextColor3 = Color3.new(0, 0, 0)
	On.ZIndex = 10

	Positions = makeSettingsButton("Edit/Goto Waypoints","rbxassetid://5147488592")
	Positions.Position = UDim2.new(0, 5, 0, 145)
	Positions.Size = UDim2.new(1, -10, 0, 25)
	Positions.Name = "Waypoints"
	Positions.Parent = SettingsHolder

	EventBind = makeSettingsButton("Edit Event Binds","rbxassetid://5147695474",759)
	EventBind.Position = UDim2.new(0, 5, 0, 205)
	EventBind.Size = UDim2.new(1, -10, 0, 25)
	EventBind.Name = "EventBinds"
	EventBind.Parent = SettingsHolder

	Plugins = makeSettingsButton("Manage Plugins","rbxassetid://5147695474",743)
	Plugins.Position = UDim2.new(0, 5, 0, 175)
	Plugins.Size = UDim2.new(1, -10, 0, 25)
	Plugins.Name = "Plugins"
	Plugins.Parent = SettingsHolder

	Example.Name = "Example"
	Example.Parent = Holder
	Example.BackgroundTransparency = 1
	Example.BorderSizePixel = 0
	Example.Size = UDim2.new(0, 190, 0, 20)
	Example.Visible = false
	Example.Font = Enum.Font.SourceSans
	Example.TextSize = 18
	Example.Text = "Example"
	Example.TextColor3 = Color3.new(1, 1, 1)
	Example.TextXAlignment = Enum.TextXAlignment.Left
	Example.ZIndex = 10
	table.insert(text1,Example)

	Notification.Name = randomString()
	Notification.Parent = PARENT
	Notification.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(1, -500, 1, 20)
	Notification.Size = UDim2.new(0, 250, 0, 100)
	Notification.ZIndex = 10
	table.insert(shade1,Notification)

	Title_2.Name = "Title"
	Title_2.Parent = Notification
	Title_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Title_2.BorderSizePixel = 0
	Title_2.Size = UDim2.new(0, 250, 0, 20)
	Title_2.Font = Enum.Font.SourceSans
	Title_2.TextSize = 14
	Title_2.Text = "Notification Title"
	Title_2.TextColor3 = Color3.new(1, 1, 1)
	Title_2.ZIndex = 10
	table.insert(shade2,Title_2)
	table.insert(text1,Title_2)

	Text_2.Name = "Text"
	Text_2.Parent = Notification
	Text_2.BackgroundTransparency = 1
	Text_2.BorderSizePixel = 0
	Text_2.Position = UDim2.new(0, 5, 0, 25)
	Text_2.Size = UDim2.new(0, 240, 0, 75)
	Text_2.Font = Enum.Font.SourceSans
	Text_2.TextSize = 16
	Text_2.Text = "Notification Text"
	Text_2.TextColor3 = Color3.new(1, 1, 1)
	Text_2.TextWrapped = true
	Text_2.ZIndex = 10
	table.insert(text1,Text_2)

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Notification
	CloseButton.BackgroundTransparency = 1
	CloseButton.Position = UDim2.new(1, -20, 0, 0)
	CloseButton.Size = UDim2.new(0, 20, 0, 20)
	CloseButton.Text = ""
	CloseButton.ZIndex = 10

	CloseImage.Parent = CloseButton
	CloseImage.BackgroundColor3 = Color3.new(1, 1, 1)
	CloseImage.BackgroundTransparency = 1
	CloseImage.Position = UDim2.new(0, 5, 0, 5)
	CloseImage.Size = UDim2.new(0, 10, 0, 10)
	CloseImage.Image = "rbxassetid://5054663650"
	CloseImage.ZIndex = 10

	PinButton.Name = "PinButton"
	PinButton.Parent = Notification
	PinButton.BackgroundTransparency = 1
	PinButton.Size = UDim2.new(0, 20, 0, 20)
	PinButton.ZIndex = 10
	PinButton.Text = ""

	PinImage.Parent = PinButton
	PinImage.BackgroundColor3 = Color3.new(1, 1, 1)
	PinImage.BackgroundTransparency = 1
	PinImage.Position = UDim2.new(0, 3, 0, 3)
	PinImage.Size = UDim2.new(0, 14, 0, 14)
	PinImage.ZIndex = 10
	PinImage.Image = "rbxassetid://6234691350"

	Tooltip.Name = randomString()
	Tooltip.Parent = PARENT
	Tooltip.Active = true
	Tooltip.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	Tooltip.BackgroundTransparency = 0.1
	Tooltip.BorderSizePixel = 0
	Tooltip.Size = UDim2.new(0, 200, 0, 96)
	Tooltip.Visible = false
	Tooltip.ZIndex = 10
	table.insert(shade1,Tooltip)

	Title_3.Name = "Title"
	Title_3.Parent = Tooltip
	Title_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Title_3.BackgroundTransparency = 0.1
	Title_3.BorderSizePixel = 0
	Title_3.Size = UDim2.new(0, 200, 0, 20)
	Title_3.Font = Enum.Font.SourceSans
	Title_3.TextSize = 14
	Title_3.Text = ""
	Title_3.TextColor3 = Color3.new(1, 1, 1)
	Title_3.TextTransparency = 0.1
	Title_3.ZIndex = 10
	table.insert(shade2,Title_3)
	table.insert(text1,Title_3)

	Description.Name = "Description"
	Description.Parent = Tooltip
	Description.BackgroundTransparency = 1
	Description.BorderSizePixel = 0
	Description.Size = UDim2.new(0,180,0,72)
	Description.Position = UDim2.new(0,10,0,18)
	Description.Font = Enum.Font.SourceSans
	Description.TextSize = 16
	Description.Text = ""
	Description.TextColor3 = Color3.new(1, 1, 1)
	Description.TextTransparency = 0.1
	Description.TextWrapped = true
	Description.ZIndex = 10
	table.insert(text1,Description)

	IntroBackground.Name = "IntroBackground"
	IntroBackground.Parent = Holder
	IntroBackground.Active = true
	IntroBackground.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	IntroBackground.BorderSizePixel = 0
	IntroBackground.Position = UDim2.new(0, 0, 0, 45)
	IntroBackground.Size = UDim2.new(0, 250, 0, 175)
	IntroBackground.ZIndex = 10

	Logo.Name = "Logo"
	Logo.Parent = Holder
	Logo.BackgroundTransparency = 1
	Logo.BorderSizePixel = 0
	Logo.Position = UDim2.new(0, 125, 0, 127)
	Logo.Size = UDim2.new(0, 10, 0, 10)
	Logo.Image = "rbxassetid://1352543873"
	Logo.ImageTransparency = 0
	Logo.ZIndex = 10

	Credits.Name = "Credits"
	Credits.Parent = Holder
	Credits.BackgroundTransparency = 1
	Credits.BorderSizePixel = 0
	Credits.Position = UDim2.new(0, 0, 0.9, 30)
	Credits.Size = UDim2.new(0, 250, 0, 20)
	Credits.Font = Enum.Font.SourceSansLight
	Credits.FontSize = Enum.FontSize.Size18
	Credits.Text = "Edge // Zwolf // Moon // Toon"
	Credits.TextColor3 = Color3.new(1, 1, 1)
	Credits.ZIndex = 10

	KeybindsFrame.Name = "KeybindsFrame"
	KeybindsFrame.Parent = Settings
	KeybindsFrame.Active = true
	KeybindsFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	KeybindsFrame.BorderSizePixel = 0
	KeybindsFrame.Position = UDim2.new(0, 0, 0, 175)
	KeybindsFrame.Size = UDim2.new(0, 250, 0, 175)
	KeybindsFrame.ZIndex = 10
	table.insert(shade1,KeybindsFrame)

	Close.Name = "Close"
	Close.Parent = KeybindsFrame
	Close.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(0, 205, 0, 150)
	Close.Size = UDim2.new(0, 40, 0, 20)
	Close.Font = Enum.Font.SourceSans
	Close.TextSize = 14
	Close.Text = "Close"
	Close.TextColor3 = Color3.new(1, 1, 1)
	Close.ZIndex = 10
	table.insert(shade2,Close)
	table.insert(text1,Close)

	Add.Name = "Add"
	Add.Parent = KeybindsFrame
	Add.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Add.BorderSizePixel = 0
	Add.Position = UDim2.new(0, 5, 0, 150)
	Add.Size = UDim2.new(0, 40, 0, 20)
	Add.Font = Enum.Font.SourceSans
	Add.TextSize = 14
	Add.Text = "Add"
	Add.TextColor3 = Color3.new(1, 1, 1)
	Add.ZIndex = 10
	table.insert(shade2,Add)
	table.insert(text1,Add)

	Delete.Name = "Delete"
	Delete.Parent = KeybindsFrame
	Delete.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Delete.BorderSizePixel = 0
	Delete.Position = UDim2.new(0, 50, 0, 150)
	Delete.Size = UDim2.new(0, 40, 0, 20)
	Delete.Font = Enum.Font.SourceSans
	Delete.TextSize = 14
	Delete.Text = "Clear"
	Delete.TextColor3 = Color3.new(1, 1, 1)
	Delete.ZIndex = 10
	table.insert(shade2,Delete)
	table.insert(text1,Delete)

	Holder_2.Name = "Holder"
	Holder_2.Parent = KeybindsFrame
	Holder_2.BackgroundTransparency = 1
	Holder_2.BorderSizePixel = 0
	Holder_2.Position = UDim2.new(0, 0, 0, 0)
	Holder_2.Size = UDim2.new(0, 250, 0, 145)
	Holder_2.ScrollBarImageColor3 = Color3.fromRGB(78,78,79)
	Holder_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_2.CanvasSize = UDim2.new(0, 0, 0, 0)
	Holder_2.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_2.ScrollBarThickness = 0
	Holder_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_2.VerticalScrollBarInset = 'Always'
	Holder_2.ZIndex = 10

	Example_2.Name = "Example"
	Example_2.Parent = KeybindsFrame
	Example_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Example_2.BorderSizePixel = 0
	Example_2.Size = UDim2.new(0, 10, 0, 20)
	Example_2.Visible = false
	Example_2.ZIndex = 10
	table.insert(shade2,Example_2)

	Text_3.Name = "Text"
	Text_3.Parent = Example_2
	Text_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Text_3.BorderSizePixel = 0
	Text_3.Position = UDim2.new(0, 10, 0, 0)
	Text_3.Size = UDim2.new(0, 240, 0, 20)
	Text_3.Font = Enum.Font.SourceSans
	Text_3.TextSize = 14
	Text_3.Text = "nom"
	Text_3.TextColor3 = Color3.new(1, 1, 1)
	Text_3.TextXAlignment = Enum.TextXAlignment.Left
	Text_3.ZIndex = 10
	table.insert(shade2,Text_3)
	table.insert(text1,Text_3)

	Delete_2.Name = "Delete"
	Delete_2.Parent = Text_3
	Delete_2.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	Delete_2.BorderSizePixel = 0
	Delete_2.Position = UDim2.new(0, 200, 0, 0)
	Delete_2.Size = UDim2.new(0, 40, 0, 20)
	Delete_2.Font = Enum.Font.SourceSans
	Delete_2.TextSize = 14
	Delete_2.Text = "Delete"
	Delete_2.TextColor3 = Color3.new(0, 0, 0)
	Delete_2.ZIndex = 10
	table.insert(shade3,Delete_2)
	table.insert(text2,Delete_2)

	KeybindEditor.Name = randomString()
	KeybindEditor.Parent = PARENT
	KeybindEditor.Active = true
	KeybindEditor.BackgroundTransparency = 1
	KeybindEditor.Position = UDim2.new(0.5, -180, 0, -500)
	KeybindEditor.Size = UDim2.new(0, 360, 0, 20)
	KeybindEditor.ZIndex = 10

	background_2.Name = "background"
	background_2.Parent = KeybindEditor
	background_2.Active = true
	background_2.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	background_2.BorderSizePixel = 0
	background_2.Position = UDim2.new(0, 0, 0, 20)
	background_2.Size = UDim2.new(0, 360, 0, 185)
	background_2.ZIndex = 10
	table.insert(shade1,background_2)

	Dark_3.Name = "Dark"
	Dark_3.Parent = background_2
	Dark_3.Active = true
	Dark_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Dark_3.BorderSizePixel = 0
	Dark_3.Position = UDim2.new(0, 135, 0, 0)
	Dark_3.Size = UDim2.new(0, 2, 0, 185)
	Dark_3.ZIndex = 10
	table.insert(shade2,Dark_3)

	Directions.Name = "Directions"
	Directions.Parent = background_2
	Directions.BackgroundTransparency = 1
	Directions.BorderSizePixel = 0
	Directions.Position = UDim2.new(0, 10, 0, 15)
	Directions.Size = UDim2.new(0, 115, 0, 90)
	Directions.ZIndex = 10
	Directions.Font = Enum.Font.SourceSans
	Directions.Text = "Click the button below and press a key/mouse button. Then select what you want to bind it to."
	Directions.TextColor3 = Color3.fromRGB(255, 255, 255)
	Directions.TextSize = 14.000
	Directions.TextWrapped = true
	Directions.TextYAlignment = Enum.TextYAlignment.Top
	table.insert(text1,Directions)

	BindTo.Name = "BindTo"
	BindTo.Parent = background_2
	BindTo.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	BindTo.BorderSizePixel = 0
	BindTo.Position = UDim2.new(0, 10, 0, 95)
	BindTo.Size = UDim2.new(0, 115, 0, 50)
	BindTo.ZIndex = 10
	BindTo.Font = Enum.Font.SourceSans
	BindTo.Text = "Click to bind"
	BindTo.TextColor3 = Color3.fromRGB(255, 255, 255)
	BindTo.TextSize = 16.000
	table.insert(shade2,BindTo)
	table.insert(text1,BindTo)

	TriggerLabel.Name = "TriggerLabel"
	TriggerLabel.Parent = background_2
	TriggerLabel.BackgroundTransparency = 1
	TriggerLabel.Position = UDim2.new(0, 10, 0, 155)
	TriggerLabel.Size = UDim2.new(0, 45, 0, 20)
	TriggerLabel.ZIndex = 10
	TriggerLabel.Font = Enum.Font.SourceSans
	TriggerLabel.Text = "Trigger:"
	TriggerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TriggerLabel.TextSize = 14.000
	TriggerLabel.TextXAlignment = Enum.TextXAlignment.Left
	table.insert(text1,TriggerLabel)

	BindTriggerSelect.Name = "BindTo"
	BindTriggerSelect.Parent = background_2
	BindTriggerSelect.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	BindTriggerSelect.BorderSizePixel = 0
	BindTriggerSelect.Position = UDim2.new(0, 60, 0, 155)
	BindTriggerSelect.Size = UDim2.new(0, 65, 0, 20)
	BindTriggerSelect.ZIndex = 10
	BindTriggerSelect.Font = Enum.Font.SourceSans
	BindTriggerSelect.Text = "KeyDown"
	BindTriggerSelect.TextColor3 = Color3.fromRGB(255, 255, 255)
	BindTriggerSelect.TextSize = 16.000
	table.insert(shade2,BindTriggerSelect)
	table.insert(text1,BindTriggerSelect)

	Add_2.Name = "Add"
	Add_2.Parent = background_2
	Add_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Add_2.BorderSizePixel = 0
	Add_2.Position = UDim2.new(0, 310, 0, 35)
	Add_2.Size = UDim2.new(0, 40, 0, 20)
	Add_2.ZIndex = 10
	Add_2.Font = Enum.Font.SourceSans
	Add_2.Text = "Add"
	Add_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Add_2.TextSize = 14.000
	table.insert(shade2,Add_2)
	table.insert(text1,Add_2)

	Toggles.Name = "Toggles"
	Toggles.Parent = background_2
	Toggles.BackgroundTransparency = 1
	Toggles.BorderSizePixel = 0
	Toggles.Position = UDim2.new(0, 150, 0, 125)
	Toggles.Size = UDim2.new(0, 200, 0, 50)
	Toggles.ZIndex = 10
	Toggles.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Toggles.CanvasSize = UDim2.new(0, 0, 0, 50)
	Toggles.ScrollBarThickness = 8
	Toggles.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Toggles.VerticalScrollBarInset = Enum.ScrollBarInset.Always
	table.insert(scroll,Toggles)

	ClickTP.Name = "Click TP (Hold Key & Click)"
	ClickTP.Parent = Toggles
	ClickTP.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	ClickTP.BorderSizePixel = 0
	ClickTP.Size = UDim2.new(0, 200, 0, 20)
	ClickTP.ZIndex = 10
	ClickTP.Font = Enum.Font.SourceSans
	ClickTP.Text = "    Click TP (Hold Key & Click)"
	ClickTP.TextColor3 = Color3.fromRGB(255, 255, 255)
	ClickTP.TextSize = 14.000
	ClickTP.TextXAlignment = Enum.TextXAlignment.Left
	table.insert(shade2,ClickTP)
	table.insert(text1,ClickTP)

	Select.Name = "Select"
	Select.Parent = ClickTP
	Select.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	Select.BorderSizePixel = 0
	Select.Position = UDim2.new(0, 160, 0, 0)
	Select.Size = UDim2.new(0, 40, 0, 20)
	Select.ZIndex = 10
	Select.Font = Enum.Font.SourceSans
	Select.Text = "Add"
	Select.TextColor3 = Color3.fromRGB(0, 0, 0)
	Select.TextSize = 14.000
	table.insert(shade3,Select)
	table.insert(text2,Select)

	ClickDelete.Name = "Click Delete (Hold Key & Click)"
	ClickDelete.Parent = Toggles
	ClickDelete.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	ClickDelete.BorderSizePixel = 0
	ClickDelete.Position = UDim2.new(0, 0, 0, 25)
	ClickDelete.Size = UDim2.new(0, 200, 0, 20)
	ClickDelete.ZIndex = 10
	ClickDelete.Font = Enum.Font.SourceSans
	ClickDelete.Text = "    Click Delete (Hold Key & Click)"
	ClickDelete.TextColor3 = Color3.fromRGB(255, 255, 255)
	ClickDelete.TextSize = 14.000
	ClickDelete.TextXAlignment = Enum.TextXAlignment.Left
	table.insert(shade2,ClickDelete)
	table.insert(text1,ClickDelete)

	Select_2.Name = "Select"
	Select_2.Parent = ClickDelete
	Select_2.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	Select_2.BorderSizePixel = 0
	Select_2.Position = UDim2.new(0, 160, 0, 0)
	Select_2.Size = UDim2.new(0, 40, 0, 20)
	Select_2.ZIndex = 10
	Select_2.Font = Enum.Font.SourceSans
	Select_2.Text = "Add"
	Select_2.TextColor3 = Color3.fromRGB(0, 0, 0)
	Select_2.TextSize = 14.000
	table.insert(shade3,Select_2)
	table.insert(text2,Select_2)

	Cmdbar_2.Name = "Cmdbar_2"
	Cmdbar_2.Parent = background_2
	Cmdbar_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Cmdbar_2.BorderSizePixel = 0
	Cmdbar_2.Position = UDim2.new(0, 150, 0, 35)
	Cmdbar_2.Size = UDim2.new(0, 150, 0, 20)
	Cmdbar_2.ZIndex = 10
	Cmdbar_2.Font = Enum.Font.SourceSans
	Cmdbar_2.PlaceholderText = "Command"
	Cmdbar_2.Text = ""
	Cmdbar_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Cmdbar_2.TextSize = 14.000
	Cmdbar_2.TextXAlignment = Enum.TextXAlignment.Left

	Cmdbar_3.Name = "Cmdbar_3"
	Cmdbar_3.Parent = background_2
	Cmdbar_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Cmdbar_3.BorderSizePixel = 0
	Cmdbar_3.Position = UDim2.new(0, 150, 0, 60)
	Cmdbar_3.Size = UDim2.new(0, 150, 0, 20)
	Cmdbar_3.ZIndex = 10
	Cmdbar_3.Font = Enum.Font.SourceSans
	Cmdbar_3.PlaceholderText = "Command 2"
	Cmdbar_3.Text = ""
	Cmdbar_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	Cmdbar_3.TextSize = 14.000
	Cmdbar_3.TextXAlignment = Enum.TextXAlignment.Left

	CreateToggle.Name = "CreateToggle"
	CreateToggle.Parent = background_2
	CreateToggle.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	CreateToggle.BackgroundTransparency = 1
	CreateToggle.BorderSizePixel = 0
	CreateToggle.Position = UDim2.new(0, 152, 0, 10)
	CreateToggle.Size = UDim2.new(0, 198, 0, 20)
	CreateToggle.ZIndex = 10
	CreateToggle.Font = Enum.Font.SourceSans
	CreateToggle.Text = "Create Toggle"
	CreateToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	CreateToggle.TextSize = 14.000
	CreateToggle.TextXAlignment = Enum.TextXAlignment.Left
	table.insert(text1,CreateToggle)

	Button_2.Name = "Button"
	Button_2.Parent = CreateToggle
	Button_2.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	Button_2.BorderSizePixel = 0
	Button_2.Position = UDim2.new(1, -20, 0, 0)
	Button_2.Size = UDim2.new(0, 20, 0, 20)
	Button_2.ZIndex = 10
	table.insert(shade3,Button_2)

	On_2.Name = "On"
	On_2.Parent = Button_2
	On_2.BackgroundColor3 = Color3.fromRGB(150, 150, 151)
	On_2.BackgroundTransparency = 1
	On_2.BorderSizePixel = 0
	On_2.Position = UDim2.new(0, 2, 0, 2)
	On_2.Size = UDim2.new(0, 16, 0, 16)
	On_2.ZIndex = 10
	On_2.Font = Enum.Font.SourceSans
	On_2.Text = ""
	On_2.TextColor3 = Color3.fromRGB(0, 0, 0)
	On_2.TextSize = 14.000

	shadow_2.Name = "shadow"
	shadow_2.Parent = KeybindEditor
	shadow_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	shadow_2.BorderSizePixel = 0
	shadow_2.Size = UDim2.new(0, 360, 0, 20)
	shadow_2.ZIndex = 10
	table.insert(shade2,shadow_2)

	PopupText_2.Name = "PopupText_2"
	PopupText_2.Parent = shadow_2
	PopupText_2.BackgroundTransparency = 1
	PopupText_2.Size = UDim2.new(1, 0, 0.949999988, 0)
	PopupText_2.ZIndex = 10
	PopupText_2.Font = Enum.Font.SourceSans
	PopupText_2.Text = "Set Keybinds"
	PopupText_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	PopupText_2.TextSize = 14.000
	PopupText_2.TextWrapped = true
	table.insert(text1,PopupText_2)

	Exit_2.Name = "Exit_2"
	Exit_2.Parent = shadow_2
	Exit_2.BackgroundTransparency = 1
	Exit_2.Position = UDim2.new(1, -20, 0, 0)
	Exit_2.Size = UDim2.new(0, 20, 0, 20)
	Exit_2.ZIndex = 10
	Exit_2.Text = ""

	ExitImage_2.Parent = Exit_2
	ExitImage_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExitImage_2.BackgroundTransparency = 1
	ExitImage_2.Position = UDim2.new(0, 5, 0, 5)
	ExitImage_2.Size = UDim2.new(0, 10, 0, 10)
	ExitImage_2.ZIndex = 10
	ExitImage_2.Image = "rbxassetid://5054663650"

	PositionsFrame.Name = "PositionsFrame"
	PositionsFrame.Parent = Settings
	PositionsFrame.Active = true
	PositionsFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	PositionsFrame.BorderSizePixel = 0
	PositionsFrame.Size = UDim2.new(0, 250, 0, 175)
	PositionsFrame.Position = UDim2.new(0, 0, 0, 175)
	PositionsFrame.ZIndex = 10
	table.insert(shade1,PositionsFrame)

	Close_3.Name = "Close"
	Close_3.Parent = PositionsFrame
	Close_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Close_3.BorderSizePixel = 0
	Close_3.Position = UDim2.new(0, 205, 0, 150)
	Close_3.Size = UDim2.new(0, 40, 0, 20)
	Close_3.Font = Enum.Font.SourceSans
	Close_3.TextSize = 14
	Close_3.Text = "Close"
	Close_3.TextColor3 = Color3.new(1, 1, 1)
	Close_3.ZIndex = 10
	table.insert(shade2,Close_3)
	table.insert(text1,Close_3)

	Delete_5.Name = "Delete"
	Delete_5.Parent = PositionsFrame
	Delete_5.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Delete_5.BorderSizePixel = 0
	Delete_5.Position = UDim2.new(0, 50, 0, 150)
	Delete_5.Size = UDim2.new(0, 40, 0, 20)
	Delete_5.Font = Enum.Font.SourceSans
	Delete_5.TextSize = 14
	Delete_5.Text = "Clear"
	Delete_5.TextColor3 = Color3.new(1, 1, 1)
	Delete_5.ZIndex = 10
	table.insert(shade2,Delete_5)
	table.insert(text1,Delete_5)

	Part.Name = "PartGoto"
	Part.Parent = PositionsFrame
	Part.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Part.BorderSizePixel = 0
	Part.Position = UDim2.new(0, 5, 0, 150)
	Part.Size = UDim2.new(0, 40, 0, 20)
	Part.Font = Enum.Font.SourceSans
	Part.TextSize = 14
	Part.Text = "Part"
	Part.TextColor3 = Color3.new(1, 1, 1)
	Part.ZIndex = 10
	table.insert(shade2,Part)
	table.insert(text1,Part)

	Holder_4.Name = "Holder"
	Holder_4.Parent = PositionsFrame
	Holder_4.BackgroundTransparency = 1
	Holder_4.BorderSizePixel = 0
	Holder_4.Position = UDim2.new(0, 0, 0, 0)
	Holder_4.Selectable = false
	Holder_4.Size = UDim2.new(0, 250, 0, 145)
	Holder_4.ScrollBarImageColor3 = Color3.fromRGB(78,78,79)
	Holder_4.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_4.CanvasSize = UDim2.new(0, 0, 0, 0)
	Holder_4.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_4.ScrollBarThickness = 0
	Holder_4.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_4.VerticalScrollBarInset = 'Always'
	Holder_4.ZIndex = 10

	Example_4.Name = "Example"
	Example_4.Parent = PositionsFrame
	Example_4.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Example_4.BorderSizePixel = 0
	Example_4.Size = UDim2.new(0, 10, 0, 20)
	Example_4.Visible = false
	Example_4.Position = UDim2.new(0, 0, 0, -5)
	Example_4.ZIndex = 10
	table.insert(shade2,Example_4)

	Text_5.Name = "Text"
	Text_5.Parent = Example_4
	Text_5.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Text_5.BorderSizePixel = 0
	Text_5.Position = UDim2.new(0, 10, 0, 0)
	Text_5.Size = UDim2.new(0, 240, 0, 20)
	Text_5.Font = Enum.Font.SourceSans
	Text_5.TextSize = 14
	Text_5.Text = "Position"
	Text_5.TextColor3 = Color3.new(1, 1, 1)
	Text_5.TextXAlignment = Enum.TextXAlignment.Left
	Text_5.ZIndex = 10
	table.insert(shade2,Text_5)
	table.insert(text1,Text_5)

	Delete_6.Name = "Delete"
	Delete_6.Parent = Text_5
	Delete_6.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	Delete_6.BorderSizePixel = 0
	Delete_6.Position = UDim2.new(0, 200, 0, 0)
	Delete_6.Size = UDim2.new(0, 40, 0, 20)
	Delete_6.Font = Enum.Font.SourceSans
	Delete_6.TextSize = 14
	Delete_6.Text = "Delete"
	Delete_6.TextColor3 = Color3.new(0, 0, 0)
	Delete_6.ZIndex = 10
	table.insert(shade3,Delete_6)
	table.insert(text2,Delete_6)

	TP.Name = "TP"
	TP.Parent = Text_5
	TP.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	TP.BorderSizePixel = 0
	TP.Position = UDim2.new(0, 155, 0, 0)
	TP.Size = UDim2.new(0, 40, 0, 20)
	TP.Font = Enum.Font.SourceSans
	TP.TextSize = 14
	TP.Text = "Goto"
	TP.TextColor3 = Color3.new(0, 0, 0)
	TP.ZIndex = 10
	table.insert(shade3,TP)
	table.insert(text2,TP)

	AliasesFrame.Name = "AliasesFrame"
	AliasesFrame.Parent = Settings
	AliasesFrame.Active = true
	AliasesFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	AliasesFrame.BorderSizePixel = 0
	AliasesFrame.Position = UDim2.new(0, 0, 0, 175)
	AliasesFrame.Size = UDim2.new(0, 250, 0, 175)
	AliasesFrame.ZIndex = 10
	table.insert(shade1,AliasesFrame)

	Close_2.Name = "Close"
	Close_2.Parent = AliasesFrame
	Close_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Close_2.BorderSizePixel = 0
	Close_2.Position = UDim2.new(0, 205, 0, 150)
	Close_2.Size = UDim2.new(0, 40, 0, 20)
	Close_2.Font = Enum.Font.SourceSans
	Close_2.TextSize = 14
	Close_2.Text = "Close"
	Close_2.TextColor3 = Color3.new(1, 1, 1)
	Close_2.ZIndex = 10
	table.insert(shade2,Close_2)
	table.insert(text1,Close_2)

	Delete_3.Name = "Delete"
	Delete_3.Parent = AliasesFrame
	Delete_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Delete_3.BorderSizePixel = 0
	Delete_3.Position = UDim2.new(0, 5, 0, 150)
	Delete_3.Size = UDim2.new(0, 40, 0, 20)
	Delete_3.Font = Enum.Font.SourceSans
	Delete_3.TextSize = 14
	Delete_3.Text = "Clear"
	Delete_3.TextColor3 = Color3.new(1, 1, 1)
	Delete_3.ZIndex = 10
	table.insert(shade2,Delete_3)
	table.insert(text1,Delete_3)

	Holder_3.Name = "Holder"
	Holder_3.Parent = AliasesFrame
	Holder_3.BackgroundTransparency = 1
	Holder_3.BorderSizePixel = 0
	Holder_3.Position = UDim2.new(0, 0, 0, 0)
	Holder_3.Size = UDim2.new(0, 250, 0, 145)
	Holder_3.ScrollBarImageColor3 = Color3.fromRGB(78,78,79)
	Holder_3.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_3.CanvasSize = UDim2.new(0, 0, 0, 0)
	Holder_3.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_3.ScrollBarThickness = 0
	Holder_3.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_3.VerticalScrollBarInset = 'Always'
	Holder_3.ZIndex = 10

	Example_3.Name = "Example"
	Example_3.Parent = AliasesFrame
	Example_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Example_3.BorderSizePixel = 0
	Example_3.Size = UDim2.new(0, 10, 0, 20)
	Example_3.Visible = false
	Example_3.ZIndex = 10
	table.insert(shade2,Example_3)

	Text_4.Name = "Text"
	Text_4.Parent = Example_3
	Text_4.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Text_4.BorderSizePixel = 0
	Text_4.Position = UDim2.new(0, 10, 0, 0)
	Text_4.Size = UDim2.new(0, 240, 0, 20)
	Text_4.Font = Enum.Font.SourceSans
	Text_4.TextSize = 14
	Text_4.Text = "honk"
	Text_4.TextColor3 = Color3.new(1, 1, 1)
	Text_4.TextXAlignment = Enum.TextXAlignment.Left
	Text_4.ZIndex = 10
	table.insert(shade2,Text_4)
	table.insert(text1,Text_4)

	Delete_4.Name = "Delete"
	Delete_4.Parent = Text_4
	Delete_4.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	Delete_4.BorderSizePixel = 0
	Delete_4.Position = UDim2.new(0, 200, 0, 0)
	Delete_4.Size = UDim2.new(0, 40, 0, 20)
	Delete_4.Font = Enum.Font.SourceSans
	Delete_4.TextSize = 14
	Delete_4.Text = "Delete"
	Delete_4.TextColor3 = Color3.new(0, 0, 0)
	Delete_4.ZIndex = 10
	table.insert(shade3,Delete_4)
	table.insert(text2,Delete_4)

	PluginsFrame.Name = "PluginsFrame"
	PluginsFrame.Parent = Settings
	PluginsFrame.Active = true
	PluginsFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	PluginsFrame.BorderSizePixel = 0
	PluginsFrame.Position = UDim2.new(0, 0, 0, 175)
	PluginsFrame.Size = UDim2.new(0, 250, 0, 175)
	PluginsFrame.ZIndex = 10
	table.insert(shade1,PluginsFrame)

	Close_4.Name = "Close"
	Close_4.Parent = PluginsFrame
	Close_4.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Close_4.BorderSizePixel = 0
	Close_4.Position = UDim2.new(0, 205, 0, 150)
	Close_4.Size = UDim2.new(0, 40, 0, 20)
	Close_4.Font = Enum.Font.SourceSans
	Close_4.TextSize = 14
	Close_4.Text = "Close"
	Close_4.TextColor3 = Color3.new(1, 1, 1)
	Close_4.ZIndex = 10
	table.insert(shade2,Close_4)
	table.insert(text1,Close_4)

	Add_3.Name = "Add"
	Add_3.Parent = PluginsFrame
	Add_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Add_3.BorderSizePixel = 0
	Add_3.Position = UDim2.new(0, 5, 0, 150)
	Add_3.Size = UDim2.new(0, 40, 0, 20)
	Add_3.Font = Enum.Font.SourceSans
	Add_3.TextSize = 14
	Add_3.Text = "Add"
	Add_3.TextColor3 = Color3.new(1, 1, 1)
	Add_3.ZIndex = 10
	table.insert(shade2,Add_3)
	table.insert(text1,Add_3)

	Holder_5.Name = "Holder"
	Holder_5.Parent = PluginsFrame
	Holder_5.BackgroundTransparency = 1
	Holder_5.BorderSizePixel = 0
	Holder_5.Position = UDim2.new(0, 0, 0, 0)
	Holder_5.Selectable = false
	Holder_5.Size = UDim2.new(0, 250, 0, 145)
	Holder_5.ScrollBarImageColor3 = Color3.fromRGB(78,78,79)
	Holder_5.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_5.CanvasSize = UDim2.new(0, 0, 0, 0)
	Holder_5.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_5.ScrollBarThickness = 0
	Holder_5.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Holder_5.VerticalScrollBarInset = 'Always'
	Holder_5.ZIndex = 10

	Example_5.Name = "Example"
	Example_5.Parent = PluginsFrame
	Example_5.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Example_5.BorderSizePixel = 0
	Example_5.Size = UDim2.new(0, 10, 0, 20)
	Example_5.Visible = false
	Example_5.ZIndex = 10
	table.insert(shade2,Example_5)

	Text_6.Name = "Text"
	Text_6.Parent = Example_5
	Text_6.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Text_6.BorderSizePixel = 0
	Text_6.Position = UDim2.new(0, 10, 0, 0)
	Text_6.Size = UDim2.new(0, 240, 0, 20)
	Text_6.Font = Enum.Font.SourceSans
	Text_6.TextSize = 14
	Text_6.Text = "F4 > Toggle Fly"
	Text_6.TextColor3 = Color3.new(1, 1, 1)
	Text_6.TextXAlignment = Enum.TextXAlignment.Left
	Text_6.ZIndex = 10
	table.insert(shade2,Text_6)
	table.insert(text1,Text_6)

	Delete_7.Name = "Delete"
	Delete_7.Parent = Text_6
	Delete_7.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	Delete_7.BorderSizePixel = 0
	Delete_7.Position = UDim2.new(0, 200, 0, 0)
	Delete_7.Size = UDim2.new(0, 40, 0, 20)
	Delete_7.Font = Enum.Font.SourceSans
	Delete_7.TextSize = 14
	Delete_7.Text = "Delete"
	Delete_7.TextColor3 = Color3.new(0, 0, 0)
	Delete_7.ZIndex = 10
	table.insert(shade3,Delete_7)
	table.insert(text2,Delete_7)

	PluginEditor.Name = randomString()
	PluginEditor.Parent = PARENT
	PluginEditor.BorderSizePixel = 0
	PluginEditor.Active = true
	PluginEditor.BackgroundTransparency = 1
	PluginEditor.Position = UDim2.new(0.5, -180, 0, -500)
	PluginEditor.Size = UDim2.new(0, 360, 0, 20)
	PluginEditor.ZIndex = 10

	background_3.Name = "background"
	background_3.Parent = PluginEditor
	background_3.Active = true
	background_3.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	background_3.BorderSizePixel = 0
	background_3.Position = UDim2.new(0, 0, 0, 20)
	background_3.Size = UDim2.new(0, 360, 0, 160)
	background_3.ZIndex = 10
	table.insert(shade1,background_3)

	Dark_2.Name = "Dark"
	Dark_2.Parent = background_3
	Dark_2.Active = true
	Dark_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	Dark_2.BorderSizePixel = 0
	Dark_2.Position = UDim2.new(0, 222, 0, 0)
	Dark_2.Size = UDim2.new(0, 2, 0, 160)
	Dark_2.ZIndex = 10
	table.insert(shade2,Dark_2)

	Img.Name = "Img"
	Img.Parent = background_3
	Img.BackgroundTransparency = 1
	Img.Position = UDim2.new(0, 242, 0, 3)
	Img.Size = UDim2.new(0, 100, 0, 95)
	Img.Image = "rbxassetid://4113050383"
	Img.ZIndex = 10

	AddPlugin.Name = "AddPlugin"
	AddPlugin.Parent = background_3
	AddPlugin.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	AddPlugin.BorderSizePixel = 0
	AddPlugin.Position = UDim2.new(0, 235, 0, 100)
	AddPlugin.Size = UDim2.new(0, 115, 0, 50)
	AddPlugin.Font = Enum.Font.SourceSans
	AddPlugin.TextSize = 14
	AddPlugin.Text = "Add Plugin"
	AddPlugin.TextColor3 = Color3.new(1, 1, 1)
	AddPlugin.ZIndex = 10
	table.insert(shade2,AddPlugin)
	table.insert(text1,AddPlugin)

	FileName.Name = "FileName"
	FileName.Parent = background_3
	FileName.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	FileName.BorderSizePixel = 0
	FileName.Position = UDim2.new(0.028, 0, 0.625, 0)
	FileName.Size = UDim2.new(0, 200, 0, 50)
	FileName.Font = Enum.Font.SourceSans
	FileName.TextSize = 14
	FileName.Text = "Plugin File Name"
	FileName.TextColor3 = Color3.new(1, 1, 1)
	FileName.ZIndex = 10
	table.insert(shade2,FileName)
	table.insert(text1,FileName)

	About.Name = "About"
	About.Parent = background_3
	About.BackgroundTransparency = 1
	About.BorderSizePixel = 0
	About.Position = UDim2.new(0, 17, 0, 10)
	About.Size = UDim2.new(0, 187, 0, 49)
	About.Font = Enum.Font.SourceSans
	About.TextSize = 14
	About.Text = "Plugins are .iy files and should be located in the 'workspace' folder of your exploit."
	About.TextColor3 = Color3.fromRGB(255, 255, 255)
	About.TextWrapped = true
	About.TextYAlignment = Enum.TextYAlignment.Top
	About.ZIndex = 10
	table.insert(text1,About)

	Directions_2.Name = "Directions"
	Directions_2.Parent = background_3
	Directions_2.BackgroundTransparency = 1
	Directions_2.BorderSizePixel = 0
	Directions_2.Position = UDim2.new(0, 17, 0, 60)
	Directions_2.Size = UDim2.new(0, 187, 0, 49)
	Directions_2.Font = Enum.Font.SourceSans
	Directions_2.TextSize = 14
	Directions_2.Text = "Type the name of the plugin file you want to add below."
	Directions_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Directions_2.TextWrapped = true
	Directions_2.TextYAlignment = Enum.TextYAlignment.Top
	Directions_2.ZIndex = 10
	table.insert(text1,Directions_2)

	shadow_3.Name = "shadow"
	shadow_3.Parent = PluginEditor
	shadow_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	shadow_3.BorderSizePixel = 0
	shadow_3.Size = UDim2.new(0, 360, 0, 20)
	shadow_3.ZIndex = 10
	table.insert(shade2,shadow_3)

	PopupText_3.Name = "PopupText"
	PopupText_3.Parent = shadow_3
	PopupText_3.BackgroundTransparency = 1
	PopupText_3.Size = UDim2.new(1, 0, 0.95, 0)
	PopupText_3.ZIndex = 10
	PopupText_3.Font = Enum.Font.SourceSans
	PopupText_3.TextSize = 14
	PopupText_3.Text = "Add Plugins"
	PopupText_3.TextColor3 = Color3.new(1, 1, 1)
	PopupText_3.TextWrapped = true
	table.insert(text1,PopupText_3)

	Exit_3.Name = "Exit"
	Exit_3.Parent = shadow_3
	Exit_3.BackgroundTransparency = 1
	Exit_3.Position = UDim2.new(1, -20, 0, 0)
	Exit_3.Size = UDim2.new(0, 20, 0, 20)
	Exit_3.Text = ""
	Exit_3.ZIndex = 10

	ExitImage_3.Parent = Exit_3
	ExitImage_3.BackgroundColor3 = Color3.new(1, 1, 1)
	ExitImage_3.BackgroundTransparency = 1
	ExitImage_3.Position = UDim2.new(0, 5, 0, 5)
	ExitImage_3.Size = UDim2.new(0, 10, 0, 10)
	ExitImage_3.Image = "rbxassetid://5054663650"
	ExitImage_3.ZIndex = 10

	AliasHint.Name = "AliasHint"
	AliasHint.Parent = AliasesFrame
	AliasHint.BackgroundTransparency = 1
	AliasHint.BorderSizePixel = 0
	AliasHint.Position = UDim2.new(0, 25, 0, 40)
	AliasHint.Size = UDim2.new(0, 200, 0, 50)
	AliasHint.Font = Enum.Font.SourceSansItalic
	AliasHint.TextSize = 16
	AliasHint.Text = "Add aliases by using the 'addalias' command"
	AliasHint.TextColor3 = Color3.new(1, 1, 1)
	AliasHint.TextStrokeColor3 = Color3.new(1, 1, 1)
	AliasHint.TextWrapped = true
	AliasHint.ZIndex = 10
	table.insert(text1,AliasHint)

	PluginsHint.Name = "PluginsHint"
	PluginsHint.Parent = PluginsFrame
	PluginsHint.BackgroundTransparency = 1
	PluginsHint.BorderSizePixel = 0
	PluginsHint.Position = UDim2.new(0, 25, 0, 40)
	PluginsHint.Size = UDim2.new(0, 200, 0, 50)
	PluginsHint.Font = Enum.Font.SourceSansItalic
	PluginsHint.TextSize = 16
	PluginsHint.Text = "Download plugins from the IY Discord (discord.gg/78ZuWSq)"
	PluginsHint.TextColor3 = Color3.new(1, 1, 1)
	PluginsHint.TextStrokeColor3 = Color3.new(1, 1, 1)
	PluginsHint.TextWrapped = true
	PluginsHint.ZIndex = 10
	table.insert(text1,PluginsHint)

	PositionsHint.Name = "PositionsHint"
	PositionsHint.Parent = PositionsFrame
	PositionsHint.BackgroundTransparency = 1
	PositionsHint.BorderSizePixel = 0
	PositionsHint.Position = UDim2.new(0, 25, 0, 40)
	PositionsHint.Size = UDim2.new(0, 200, 0, 70)
	PositionsHint.Font = Enum.Font.SourceSansItalic
	PositionsHint.TextSize = 16
	PositionsHint.Text = "Use the 'swp' or 'setwaypoint' command to add a position using your character (NOTE: Part teleports will not save)"
	PositionsHint.TextColor3 = Color3.new(1, 1, 1)
	PositionsHint.TextStrokeColor3 = Color3.new(1, 1, 1)
	PositionsHint.TextWrapped = true
	PositionsHint.ZIndex = 10
	table.insert(text1,PositionsHint)

	ToPartFrame.Name = randomString()
	ToPartFrame.Parent = PARENT
	ToPartFrame.Active = true
	ToPartFrame.BackgroundTransparency = 1
	ToPartFrame.Position = UDim2.new(0.5, -180, 0, -500)
	ToPartFrame.Size = UDim2.new(0, 360, 0, 20)
	ToPartFrame.ZIndex = 10

	background_4.Name = "background"
	background_4.Parent = ToPartFrame
	background_4.Active = true
	background_4.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
	background_4.BorderSizePixel = 0
	background_4.Position = UDim2.new(0, 0, 0, 20)
	background_4.Size = UDim2.new(0, 360, 0, 117)
	background_4.ZIndex = 10
	table.insert(shade1,background_4)

	ChoosePart.Name = "ChoosePart"
	ChoosePart.Parent = background_4
	ChoosePart.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	ChoosePart.BorderSizePixel = 0
	ChoosePart.Position = UDim2.new(0, 100, 0, 55)
	ChoosePart.Size = UDim2.new(0, 75, 0, 30)
	ChoosePart.Font = Enum.Font.SourceSans
	ChoosePart.TextSize = 14
	ChoosePart.Text = "Select Part"
	ChoosePart.TextColor3 = Color3.new(1, 1, 1)
	ChoosePart.ZIndex = 10
	table.insert(shade2,ChoosePart)
	table.insert(text1,ChoosePart)

	CopyPath.Name = "CopyPath"
	CopyPath.Parent = background_4
	CopyPath.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	CopyPath.BorderSizePixel = 0
	CopyPath.Position = UDim2.new(0, 185, 0, 55)
	CopyPath.Size = UDim2.new(0, 75, 0, 30)
	CopyPath.Font = Enum.Font.SourceSans
	CopyPath.TextSize = 14
	CopyPath.Text = "Copy Path"
	CopyPath.TextColor3 = Color3.new(1, 1, 1)
	CopyPath.ZIndex = 10
	table.insert(shade2,CopyPath)
	table.insert(text1,CopyPath)

	Directions_3.Name = "Directions"
	Directions_3.Parent = background_4
	Directions_3.BackgroundTransparency = 1
	Directions_3.BorderSizePixel = 0
	Directions_3.Position = UDim2.new(0, 51, 0, 17)
	Directions_3.Size = UDim2.new(0, 257, 0, 32)
	Directions_3.Font = Enum.Font.SourceSans
	Directions_3.TextSize = 14
	Directions_3.Text = 'Click on a part and then click the "Select Part" button below to set it as a teleport location'
	Directions_3.TextColor3 = Color3.new(1, 1, 1)
	Directions_3.TextWrapped = true
	Directions_3.TextYAlignment = Enum.TextYAlignment.Top
	Directions_3.ZIndex = 10
	table.insert(text1,Directions_3)

	Path.Name = "Path"
	Path.Parent = background_4
	Path.BackgroundTransparency = 1
	Path.BorderSizePixel = 0
	Path.Position = UDim2.new(0, 0, 0, 94)
	Path.Size = UDim2.new(0, 360, 0, 16)
	Path.Font = Enum.Font.SourceSansItalic
	Path.TextSize = 14
	Path.Text = ""
	Path.TextColor3 = Color3.new(1, 1, 1)
	Path.TextScaled = true
	Path.TextWrapped = true
	Path.TextYAlignment = Enum.TextYAlignment.Top
	Path.ZIndex = 10
	table.insert(text1,Path)

	shadow_4.Name = "shadow"
	shadow_4.Parent = ToPartFrame
	shadow_4.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	shadow_4.BorderSizePixel = 0
	shadow_4.Size = UDim2.new(0, 360, 0, 20)
	shadow_4.ZIndex = 10
	table.insert(shade2,shadow_4)

	PopupText_5.Name = "PopupText"
	PopupText_5.Parent = shadow_4
	PopupText_5.BackgroundTransparency = 1
	PopupText_5.Size = UDim2.new(1, 0, 0.95, 0)
	PopupText_5.ZIndex = 10
	PopupText_5.Font = Enum.Font.SourceSans
	PopupText_5.TextSize = 14
	PopupText_5.Text = "Teleport to Part"
	PopupText_5.TextColor3 = Color3.new(1, 1, 1)
	PopupText_5.TextWrapped = true
	table.insert(text1,PopupText_5)

	Exit_4.Name = "Exit"
	Exit_4.Parent = shadow_4
	Exit_4.BackgroundTransparency = 1
	Exit_4.Position = UDim2.new(1, -20, 0, 0)
	Exit_4.Size = UDim2.new(0, 20, 0, 20)
	Exit_4.Text = ""
	Exit_4.ZIndex = 10

	ExitImage_5.Parent = Exit_4
	ExitImage_5.BackgroundColor3 = Color3.new(1, 1, 1)
	ExitImage_5.BackgroundTransparency = 1
	ExitImage_5.Position = UDim2.new(0, 5, 0, 5)
	ExitImage_5.Size = UDim2.new(0, 10, 0, 10)
	ExitImage_5.Image = "rbxassetid://5054663650"
	ExitImage_5.ZIndex = 10

	logs.Name = randomString()
	logs.Parent = PARENT
	logs.Active = true
	logs.BackgroundTransparency = 1
	logs.Position = UDim2.new(0, 0, 1, 10)
	logs.Size = UDim2.new(0, 338, 0, 20)
	logs.ZIndex = 10

	shadow.Name = "shadow"
	shadow.Parent = logs
	shadow.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
	shadow.BorderSizePixel = 0
	shadow.Position = UDim2.new(0, 0, 0.00999999978, 0)
	shadow.Size = UDim2.new(0, 338, 0, 20)
	shadow.ZIndex = 10
	table.insert(shade2,shadow)

	Hide.Name = "Hide"
	Hide.Parent = shadow
	Hide.BackgroundTransparency = 1
	Hide.Position = UDim2.new(1, -40, 0, 0)
	Hide.Size = UDim2.new(0, 20, 0, 20)
	Hide.ZIndex = 10
	Hide.Text = ""

	ImageLabel.Parent = Hide
	ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.Position = UDim2.new(0, 3, 0, 3)
	ImageLabel.Size = UDim2.new(0, 14, 0, 14)
	ImageLabel.Image = "rbxassetid://2406617031"
	ImageLabel.ZIndex = 10

	PopupText.Name = "PopupText"
	PopupText.Parent = shadow
	PopupText.BackgroundTransparency = 1
	PopupText.Size = UDim2.new(1, 0, 0.949999988, 0)
	PopupText.ZIndex = 10
	PopupText.Font = Enum.Font.SourceSans
	PopupText.FontSize = Enum.FontSize.Size14
	PopupText.Text = "Logs"
	PopupText.TextColor3 = Color3.new(1, 1, 1)
	PopupText.TextWrapped = true
	table.insert(text1,PopupText)

	Exit.Name = "Exit"
	Exit.Parent = shadow
	Exit.BackgroundTransparency = 1
	Exit.Position = UDim2.new(1, -20, 0, 0)
	Exit.Size = UDim2.new(0, 20, 0, 20)
	Exit.ZIndex = 10
	Exit.Text = ""

	ImageLabel_2.Parent = Exit
	ImageLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
	ImageLabel_2.BackgroundTransparency = 1
	ImageLabel_2.Position = UDim2.new(0, 5, 0, 5)
	ImageLabel_2.Size = UDim2.new(0, 10, 0, 10)
	ImageLabel_2.Image = "rbxassetid://5054663650"
	ImageLabel_2.ZIndex = 10

	background.Name = "background"
	background.Parent = logs
	background.Active = true
	background.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.145098)
	background.BorderSizePixel = 0
	background.ClipsDescendants = true
	background.Position = UDim2.new(0, 0, 1, 0)
	background.Size = UDim2.new(0, 338, 0, 245)
	background.ZIndex = 10

	chat.Name = "chat"
	chat.Parent = background
	chat.Active = true
	chat.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.145098)
	chat.BorderSizePixel = 0
	chat.ClipsDescendants = true
	chat.Size = UDim2.new(0, 338, 0, 245)
	chat.ZIndex = 10
	table.insert(shade1,chat)

	Clear.Name = "Clear"
	Clear.Parent = chat
	Clear.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
	Clear.BorderSizePixel = 0
	Clear.Position = UDim2.new(0, 5, 0, 220)
	Clear.Size = UDim2.new(0, 50, 0, 20)
	Clear.ZIndex = 10
	Clear.Font = Enum.Font.SourceSans
	Clear.FontSize = Enum.FontSize.Size14
	Clear.Text = "Clear"
	Clear.TextColor3 = Color3.new(1, 1, 1)
	table.insert(shade2,Clear)
	table.insert(text1,Clear)

	SaveChatlogs.Name = "SaveChatlogs"
	SaveChatlogs.Parent = chat
	SaveChatlogs.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
	SaveChatlogs.BorderSizePixel = 0
	SaveChatlogs.Position = UDim2.new(0, 258, 0, 220)
	SaveChatlogs.Size = UDim2.new(0, 75, 0, 20)
	SaveChatlogs.ZIndex = 10
	SaveChatlogs.Font = Enum.Font.SourceSans
	SaveChatlogs.FontSize = Enum.FontSize.Size14
	SaveChatlogs.Text = "Save To .txt"
	SaveChatlogs.TextColor3 = Color3.new(1, 1, 1)
	table.insert(shade2,SaveChatlogs)
	table.insert(text1,SaveChatlogs)

	Toggle.Name = "Toggle"
	Toggle.Parent = chat
	Toggle.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
	Toggle.BorderSizePixel = 0
	Toggle.Position = UDim2.new(0, 60, 0, 220)
	Toggle.Size = UDim2.new(0, 66, 0, 20)
	Toggle.ZIndex = 10
	Toggle.Font = Enum.Font.SourceSans
	Toggle.FontSize = Enum.FontSize.Size14
	Toggle.Text = "Disabled"
	Toggle.TextColor3 = Color3.new(1, 1, 1)
	table.insert(shade2,Toggle)
	table.insert(text1,Toggle)

	scroll_2.Name = "scroll"
	scroll_2.Parent = chat
	scroll_2.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
	scroll_2.BorderSizePixel = 0
	scroll_2.Position = UDim2.new(0, 5, 0, 25)
	scroll_2.Size = UDim2.new(0, 328, 0, 190)
	scroll_2.ZIndex = 10
	scroll_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	scroll_2.CanvasSize = UDim2.new(0, 0, 0, 10)
	scroll_2.ScrollBarThickness = 8
	scroll_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	table.insert(scroll,scroll_2)
	table.insert(shade2,scroll_2)

	join.Name = "join"
	join.Parent = background
	join.Active = true
	join.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.145098)
	join.BorderSizePixel = 0
	join.ClipsDescendants = true
	join.Size = UDim2.new(0, 338, 0, 245)
	join.Visible = false
	join.ZIndex = 10
	table.insert(shade1,join)

	Toggle_2.Name = "Toggle"
	Toggle_2.Parent = join
	Toggle_2.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
	Toggle_2.BorderSizePixel = 0
	Toggle_2.Position = UDim2.new(0, 60, 0, 220)
	Toggle_2.Size = UDim2.new(0, 66, 0, 20)
	Toggle_2.ZIndex = 10
	Toggle_2.Font = Enum.Font.SourceSans
	Toggle_2.FontSize = Enum.FontSize.Size14
	Toggle_2.Text = "Disabled"
	Toggle_2.TextColor3 = Color3.new(1, 1, 1)
	table.insert(shade2,Toggle_2)
	table.insert(text1,Toggle_2)

	Clear_2.Name = "Clear"
	Clear_2.Parent = join
	Clear_2.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
	Clear_2.BorderSizePixel = 0
	Clear_2.Position = UDim2.new(0, 5, 0, 220)
	Clear_2.Size = UDim2.new(0, 50, 0, 20)
	Clear_2.ZIndex = 10
	Clear_2.Font = Enum.Font.SourceSans
	Clear_2.FontSize = Enum.FontSize.Size14
	Clear_2.Text = "Clear"
	Clear_2.TextColor3 = Color3.new(1, 1, 1)
	table.insert(shade2,Clear_2)
	table.insert(text1,Clear_2)

	scroll_3.Name = "scroll"
	scroll_3.Parent = join
	scroll_3.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
	scroll_3.BorderSizePixel = 0
	scroll_3.Position = UDim2.new(0, 5, 0, 25)
	scroll_3.Size = UDim2.new(0, 328, 0, 190)
	scroll_3.ZIndex = 10
	scroll_3.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	scroll_3.CanvasSize = UDim2.new(0, 0, 0, 10)
	scroll_3.ScrollBarThickness = 8
	scroll_3.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	table.insert(scroll,scroll_3)
	table.insert(shade2,scroll_3)

	selectChat.Name = "selectChat"
	selectChat.Parent = background
	selectChat.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
	selectChat.BorderSizePixel = 0
	selectChat.Position = UDim2.new(0, 5, 0, 5)
	selectChat.Size = UDim2.new(0, 164, 0, 20)
	selectChat.ZIndex = 10
	selectChat.Font = Enum.Font.SourceSans
	selectChat.FontSize = Enum.FontSize.Size14
	selectChat.Text = "Chat Logs"
	selectChat.TextColor3 = Color3.new(1, 1, 1)
	table.insert(shade2,selectChat)
	table.insert(text1,selectChat)

	selectJoin.Name = "selectJoin"
	selectJoin.Parent = background
	selectJoin.BackgroundColor3 = Color3.new(0.305882, 0.305882, 0.309804)
	selectJoin.BorderSizePixel = 0
	selectJoin.Position = UDim2.new(0, 169, 0, 5)
	selectJoin.Size = UDim2.new(0, 164, 0, 20)
	selectJoin.ZIndex = 10
	selectJoin.Font = Enum.Font.SourceSans
	selectJoin.FontSize = Enum.FontSize.Size14
	selectJoin.Text = "Join Logs"
	selectJoin.TextColor3 = Color3.new(1, 1, 1)
	table.insert(shade3,selectJoin)
	table.insert(text1,selectJoin)

	function create(data)
		local insts = {}
		for i,v in pairs(data) do insts[v[1]] = Instance.new(v[2]) end

		for _,v in pairs(data) do
			for prop,val in pairs(v[3]) do
				if type(val) == "table" then
					insts[v[1]][prop] = insts[val[1]]
				else
					insts[v[1]][prop] = val
				end
			end
		end

		return insts[1]
	end

	TextService = cloneref(game:GetService("TextService"))
	ViewportTextBox = (function()

		local funcs = {}
		funcs.Update = function(self)
			local cursorPos = self.TextBox.CursorPosition
			local text = self.TextBox.Text
			if text == "" then self.TextBox.Position = UDim2.new(0,2,0,0) return end
			if cursorPos == -1 then return end

			local cursorText = text:sub(1,cursorPos-1)
			local pos = nil
			local leftEnd = -self.TextBox.Position.X.Offset
			local rightEnd = leftEnd + self.View.AbsoluteSize.X

			local totalTextSize = TextService:GetTextSize(text,self.TextBox.TextSize,self.TextBox.Font,Vector2.new(999999999,100)).X
			local cursorTextSize = TextService:GetTextSize(cursorText,self.TextBox.TextSize,self.TextBox.Font,Vector2.new(999999999,100)).X

			if cursorTextSize > rightEnd then
				pos = math.max(-2,cursorTextSize - self.View.AbsoluteSize.X + 2)
			elseif cursorTextSize < leftEnd then
				pos = math.max(-2,cursorTextSize-2)
			elseif totalTextSize < rightEnd then
				pos = math.max(-2,totalTextSize - self.View.AbsoluteSize.X + 2)
			end

			if pos then
				self.TextBox.Position = UDim2.new(0,-pos,0,0)
				self.TextBox.Size = UDim2.new(1,pos,1,0)
			end
		end

		local mt = {}
		mt.__index = funcs

		local function convert(textbox)
			local obj = setmetatable({OffsetX = 0, TextBox = textbox},mt)

			local view = Instance.new("Frame")
			view.BackgroundTransparency = textbox.BackgroundTransparency
			view.BackgroundColor3 = textbox.BackgroundColor3
			view.BorderSizePixel = textbox.BorderSizePixel
			view.BorderColor3 = textbox.BorderColor3
			view.Position = textbox.Position
			view.Size = textbox.Size
			view.ClipsDescendants = true
			view.Name = textbox.Name
			view.ZIndex = 10
			textbox.BackgroundTransparency = 1
			textbox.Position = UDim2.new(0,4,0,0)
			textbox.Size = UDim2.new(1,-8,1,0)
			textbox.TextXAlignment = Enum.TextXAlignment.Left
			textbox.Name = "Input"
			table.insert(text1,textbox)
			table.insert(shade2,view)

			obj.View = view

			textbox.Changed:Connect(function(prop)
				if prop == "Text" or prop == "CursorPosition" or prop == "AbsoluteSize" then
					obj:Update()
				end
			end)

			obj:Update()

			view.Parent = textbox.Parent
			textbox.Parent = view

			return obj
		end

		return {convert = convert}
	end)()

	ViewportTextBox.convert(Cmdbar).View.ZIndex = 10
	ViewportTextBox.convert(Cmdbar_2).View.ZIndex = 10
	ViewportTextBox.convert(Cmdbar_3).View.ZIndex = 10

	IYMouse = Players.LocalPlayer:GetMouse()
	PlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
	UserInputService = cloneref(game:GetService("UserInputService"))
	TweenService = cloneref(game:GetService("TweenService"))
	HttpService = cloneref(game:GetService("HttpService"))
	MarketplaceService = cloneref(game:GetService("MarketplaceService"))
	RunService = cloneref(game:GetService("RunService"))
	TeleportService = cloneref(game:GetService("TeleportService"))
	StarterGui = cloneref(game:GetService("StarterGui"))
	GuiService = cloneref(game:GetService("GuiService"))
	Lighting = cloneref(game:GetService("Lighting"))
	ContextActionService = cloneref(game:GetService("ContextActionService"))
	NetworkClient = cloneref(game:GetService("NetworkClient"))
	ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
	GroupService = cloneref(game:GetService("GroupService"))
	PathService = cloneref(game:GetService("PathfindingService"))
	SoundService = cloneref(game:GetService("SoundService"))
	Teams = cloneref(game:GetService("Teams"))
	StarterPlayer = cloneref(game:GetService("StarterPlayer"))
	InsertService = cloneref(game:GetService("InsertService"))
	ChatService = cloneref(game:GetService("Chat"))
	ProximityPromptService = cloneref(game:GetService("ProximityPromptService"))
	StatsService = cloneref(game:GetService("Stats"))
	MaterialService = cloneref(game:GetService("MaterialService"))
	AvatarEditorService = cloneref(game:GetService("AvatarEditorService"))
	TextChatService = cloneref(game:GetService("TextChatService"))

	sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
	gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop
	queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
	httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
	PlaceId, JobId = game.PlaceId, game.JobId
	local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())
	everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

	local writefile = type(writefile) == "function" and function(file, data, safe)
		if safe == true then return pcall(writefile, file, data) end
		writefile(file, data)
	end

	local readfile = type(readfile) == "function" and function(file, safe)
		if safe == true then return pcall(readfile, file) end
		return readfile(file)
	end

	function writefileExploit()
		if writefile then
			return true
		end
	end

	function readfileExploit()
		if readfile then
			return true
		end
	end

	function isNumber(str)
		if tonumber(str) ~= nil or str == 'inf' then
			return true
		end
	end

	function getRoot(char)
		local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
		return rootPart
	end

	function tools(plr)
		if plr:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass('Tool') or plr.Character:FindFirstChildOfClass('Tool') then
			return true
		end
	end

	function r15(plr)
		if plr.Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15 then
			return true
		end
	end

	function rigType(player)
		return tostring(player.Character:FindFirstChildWhichIsA("Humanoid").RigType):split(".")[3]
	end

	function toClipboard(txt)
		if everyClipboard then
			everyClipboard(tostring(txt))
			notify("Clipboard", "Copied to clipboard")
		else
			notify("Clipboard", "Your exploit doesn't have the ability to use the clipboard")
		end
	end

	function chatMessage(str)
		str = tostring(str)
		if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
			TextChatService.TextChannels.RBXGeneral:SendAsync(str)
		else
			ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
		end
	end

	function getHierarchy(obj)
		local fullname
		local period

		if string.find(obj.Name,' ') then
			fullname = '["'..obj.Name..'"]'
			period = false
		else
			fullname = obj.Name
			period = true
		end

		local getS = obj
		local parent = obj
		local service = ''

		if getS.Parent ~= game then
			repeat
				getS = getS.Parent
				service = getS.ClassName
			until getS.Parent == game
		end

		if parent.Parent ~= getS then
			repeat
				parent = parent.Parent
				if string.find(tostring(parent),' ') then
					if period then
						fullname = '["'..parent.Name..'"].'..fullname
					else
						fullname = '["'..parent.Name..'"]'..fullname
					end
					period = false
				else
					if period then
						fullname = parent.Name..'.'..fullname
					else
						fullname = parent.Name..''..fullname
					end
					period = true
				end
			until parent.Parent == getS
		elseif string.find(tostring(parent),' ') then
			fullname = '["'..parent.Name..'"]'
			period = false
		end

		if period then
			return 'game:GetService("'..service..'").'..fullname
		else
			return 'game:GetService("'..service..'")'..fullname
		end
	end

	AllWaypoints = {}

	local cooldown = false
	function writefileCooldown(name,data)
		task.spawn(function()
			if not cooldown then
				cooldown = true
				writefile(name, data, true)
			else
				repeat wait() until cooldown == false
				writefileCooldown(name,data)
			end
			wait(3)
			cooldown = false
		end)
	end

	function dragGUI(gui)
		task.spawn(function()
			local dragging
			local dragInput
			local dragStart = Vector3.new(0,0,0)
			local startPos
			local function update(input)
				local delta = input.Position - dragStart
				local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				TweenService:Create(gui, TweenInfo.new(.20), {Position = Position}):Play()
			end
			gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)
			gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					update(input)
				end
			end)
		end)
	end

	dragGUI(logs)
	dragGUI(KeybindEditor)
	dragGUI(PluginEditor)
	dragGUI(ToPartFrame)

	eventEditor = (function()
		local events = {}

		local function registerEvent(name,sets)
			events[name] = {
				commands = {},
				sets = sets or {}
			}
		end

		local onEdited = nil

		local function fireEvent(name,...)
			local args = {...}
			local event = events[name]
			if event then
				for i,cmd in pairs(event.commands) do
					local metCondition = true
					for idx,set in pairs(event.sets) do
						local argVal = args[idx]
						local cmdSet = cmd[2][idx]
						local condType = set.Type
						if condType == "Player" then
							if cmdSet == 0 then
								metCondition = metCondition and (tostring(Players.LocalPlayer) == argVal)
							elseif cmdSet ~= 1 then
								metCondition = metCondition and table.find(getPlayer(cmdSet,Players.LocalPlayer),argVal)
							end
						elseif condType == "String" then
							if cmdSet ~= 0 then
								metCondition = metCondition and string.find(argVal:lower(),cmdSet:lower())
							end
						elseif condType == "Number" then
							if cmdSet ~= 0 then
								metCondition = metCondition and tonumber(argVal)<=tonumber(cmdSet)
							end
						end
						if not metCondition then break end
					end

					if metCondition then
						pcall(task.spawn(function()
							local cmdStr = cmd[1]
							for count,arg in pairs(args) do
								cmdStr = cmdStr:gsub("%$"..count,arg)
							end
							wait(cmd[3] or 0)
							execCmd(cmdStr)
						end))
					end
				end
			end
		end

		local main = create({
			{1,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),BackgroundTransparency=1,BorderSizePixel=0,Name="EventEditor",Position=UDim2.new(0.5,-175,0,-500),Size=UDim2.new(0,350,0,20),ZIndex=10,}},
			{2,"Frame",{BackgroundColor3=currentShade2,BorderSizePixel=0,Name="TopBar",Parent={1},Size=UDim2.new(1,0,0,20),ZIndex=10,}},
			{3,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={2},Position=UDim2.new(0,0,0,0),Size=UDim2.new(1,0,0.95,0),Text="Event Editor",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=10,}},
			{4,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Close",Parent={2},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,20),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,ZIndex=10,}},
			{5,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5054663650",Parent={4},Position=UDim2.new(0,5,0,5),Size=UDim2.new(0,10,0,10),ZIndex=10,}},
			{6,"Frame",{BackgroundColor3=currentShade1,BorderSizePixel=0,Name="Content",Parent={1},Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,0,202),ZIndex=10,}},
			{7,"ScrollingFrame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),BackgroundTransparency=1,BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png",CanvasSize=UDim2.new(0,0,0,100),Name="List",Parent={6},Position=UDim2.new(0,5,0,5),ScrollBarImageColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),ScrollBarThickness=8,Size=UDim2.new(1,-10,1,-10),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",ZIndex=10,}},
			{8,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Holder",Parent={7},Size=UDim2.new(1,0,1,0),ZIndex=10,}},
			{9,"UIListLayout",{Parent={8},SortOrder=2,}},
			{10,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),BackgroundTransparency=1,BorderColor3=Color3.new(0.3137255012989,0.3137255012989,0.3137255012989),BorderSizePixel=0,ClipsDescendants=true,Name="Settings",Parent={6},Position=UDim2.new(1,0,0,0),Size=UDim2.new(0,150,1,0),ZIndex=10,}},
			{11,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),Name="Slider",Parent={10},Position=UDim2.new(0,-150,0,0),Size=UDim2.new(1,0,1,0),ZIndex=10,}},
			{12,"Frame",{BackgroundColor3=Color3.new(0.23529413342476,0.23529413342476,0.23529413342476),BorderColor3=Color3.new(0.3137255012989,0.3137255012989,0.3137255012989),BorderSizePixel=0,Name="Line",Parent={11},Size=UDim2.new(0,1,1,0),ZIndex=10,}},
			{13,"ScrollingFrame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),BackgroundTransparency=1,BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png",CanvasSize=UDim2.new(0,0,0,100),Name="List",Parent={11},Position=UDim2.new(0,0,0,25),ScrollBarImageColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),ScrollBarThickness=8,Size=UDim2.new(1,0,1,-25),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",ZIndex=10,}},
			{14,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Holder",Parent={13},Size=UDim2.new(1,0,1,0),ZIndex=10,}},
			{15,"UIListLayout",{Parent={14},SortOrder=2,}},
			{16,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={11},Size=UDim2.new(1,0,0,20),Text="Event Settings",TextColor3=Color3.new(1,1,1),TextSize=14,ZIndex=10,}},
			{17,"TextButton",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),Font=3,Name="Close",BorderSizePixel=0,Parent={11},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,20),Text="<",TextColor3=Color3.new(1,1,1),TextSize=18,ZIndex=10,}},
			{18,"Folder",{Name="Templates",Parent={10},}},
			{19,"Frame",{BackgroundColor3=Color3.new(0.19607844948769,0.19607844948769,0.19607844948769),BackgroundTransparency=1,BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),Name="Players",Parent={18},Position=UDim2.new(0,0,0,25),Size=UDim2.new(1,0,0,86),Visible=false,ZIndex=10,}},
			{20,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={19},Size=UDim2.new(1,0,0,20),Text="Choose Players",TextColor3=Color3.new(1,1,1),TextSize=14,ZIndex=10,}},
			{21,"TextLabel",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Any",Parent={19},Position=UDim2.new(0,5,0,42),Size=UDim2.new(1,-10,0,20),Text="Any Player",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{22,"Frame",{BackgroundColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),BorderSizePixel=0,Name="Button",Parent={21},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,20),ZIndex=10,}},
			{23,"TextButton",{BackgroundColor3=Color3.new(0.58823531866074,0.58823531866074,0.59215688705444),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="On",Parent={22},Position=UDim2.new(0,2,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,ZIndex=10,}},
			{24,"TextLabel",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Me",Parent={19},Position=UDim2.new(0,5,0,20),Size=UDim2.new(1,-10,0,20),Text="Me Only",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{25,"Frame",{BackgroundColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),BorderSizePixel=0,Name="Button",Parent={24},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,20),ZIndex=10,}},
			{26,"TextButton",{BackgroundColor3=Color3.new(0.58823531866074,0.58823531866074,0.59215688705444),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="On",Parent={25},Position=UDim2.new(0,2,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,ZIndex=10,}},
			{27,"TextBox",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,ClearTextOnFocus=false,Font=3,Name="Custom",Parent={19},PlaceholderColor3=Color3.new(0.47058826684952,0.47058826684952,0.47058826684952),PlaceholderText="Custom Player Set",Position=UDim2.new(0,5,0,64),Size=UDim2.new(1,-35,0,20),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{28,"Frame",{BackgroundColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),BorderSizePixel=0,Name="CustomButton",Parent={19},Position=UDim2.new(1,-25,0,64),Size=UDim2.new(0,20,0,20),ZIndex=10,}},
			{29,"TextButton",{BackgroundColor3=Color3.new(0.58823531866074,0.58823531866074,0.59215688705444),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="On",Parent={28},Position=UDim2.new(0,2,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,ZIndex=10,}},
			{30,"Frame",{BackgroundColor3=Color3.new(0.19607844948769,0.19607844948769,0.19607844948769),BackgroundTransparency=1,BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),Name="Strings",Parent={18},Position=UDim2.new(0,0,0,25),Size=UDim2.new(1,0,0,64),Visible=false,ZIndex=10,}},
			{31,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={30},Size=UDim2.new(1,0,0,20),Text="Choose String",TextColor3=Color3.new(1,1,1),TextSize=14,ZIndex=10,}},
			{32,"TextLabel",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Any",Parent={30},Position=UDim2.new(0,5,0,20),Size=UDim2.new(1,-10,0,20),Text="Any String",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{33,"Frame",{BackgroundColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),BorderSizePixel=0,Name="Button",Parent={32},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,20),ZIndex=10,}},
			{34,"TextButton",{BackgroundColor3=Color3.new(0.58823531866074,0.58823531866074,0.59215688705444),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="On",Parent={33},Position=UDim2.new(0,2,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,ZIndex=10,}},
			{54,"Frame",{BackgroundColor3=Color3.new(0.19607844948769,0.19607844948769,0.19607844948769),BackgroundTransparency=1,BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),Name="Numbers",Parent={18},Position=UDim2.new(0,0,0,25),Size=UDim2.new(1,0,0,64),Visible=false,ZIndex=10,}},
			{55,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={54},Size=UDim2.new(1,0,0,20),Text="Choose String",TextColor3=Color3.new(1,1,1),TextSize=14,ZIndex=10,}},
			{56,"TextLabel",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Any",Parent={54},Position=UDim2.new(0,5,0,20),Size=UDim2.new(1,-10,0,20),Text="Any Number",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{57,"Frame",{BackgroundColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),BorderSizePixel=0,Name="Button",Parent={56},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,20),ZIndex=10,}},
			{58,"TextButton",{BackgroundColor3=Color3.new(0.58823531866074,0.58823531866074,0.59215688705444),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="On",Parent={57},Position=UDim2.new(0,2,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,ZIndex=10,}},
			{59,"TextBox",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,ClearTextOnFocus=false,Font=3,Name="Custom",Parent={54},PlaceholderColor3=Color3.new(0.47058826684952,0.47058826684952,0.47058826684952),PlaceholderText="Number",Position=UDim2.new(0,5,0,42),Size=UDim2.new(1,-35,0,20),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{60,"Frame",{BackgroundColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),BorderSizePixel=0,Name="CustomButton",Parent={54},Position=UDim2.new(1,-25,0,42),Size=UDim2.new(0,20,0,20),ZIndex=10,}},
			{61,"TextButton",{BackgroundColor3=Color3.new(0.58823531866074,0.58823531866074,0.59215688705444),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="On",Parent={60},Position=UDim2.new(0,2,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,ZIndex=10,}},
			{35,"TextBox",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,ClearTextOnFocus=false,Font=3,Name="Custom",Parent={30},PlaceholderColor3=Color3.new(0.47058826684952,0.47058826684952,0.47058826684952),PlaceholderText="Match String",Position=UDim2.new(0,5,0,42),Size=UDim2.new(1,-35,0,20),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{36,"Frame",{BackgroundColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),BorderSizePixel=0,Name="CustomButton",Parent={30},Position=UDim2.new(1,-25,0,42),Size=UDim2.new(0,20,0,20),ZIndex=10,}},
			{37,"TextButton",{BackgroundColor3=Color3.new(0.58823531866074,0.58823531866074,0.59215688705444),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="On",Parent={36},Position=UDim2.new(0,2,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,ZIndex=10,}},
			{38,"Frame",{BackgroundColor3=Color3.new(0.19607844948769,0.19607844948769,0.19607844948769),BackgroundTransparency=1,BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),Name="DelayEditor",Parent={18},Position=UDim2.new(0,0,0,25),Size=UDim2.new(1,0,0,24),Visible=false,ZIndex=10,}},
			{39,"TextBox",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,Font=3,Name="Secs",Parent={38},PlaceholderColor3=Color3.new(0.47058826684952,0.47058826684952,0.47058826684952),Position=UDim2.new(0,60,0,2),Size=UDim2.new(1,-65,0,20),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{40,"TextLabel",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Label",Parent={39},Position=UDim2.new(0,-55,0,0),Size=UDim2.new(1,0,1,0),Text="Delay (s):",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{41,"Frame",{BackgroundColor3=currentShade1,BorderSizePixel=0,ClipsDescendants=true,Name="EventTemplate",Parent={6},Size=UDim2.new(1,0,0,20),Visible=false,ZIndex=10,}},
			{42,"TextButton",{BackgroundColor3=currentText1,BackgroundTransparency=1,Font=3,Name="Expand",Parent={41},Size=UDim2.new(0,20,0,20),Text=">",TextColor3=Color3.new(1,1,1),TextSize=18,ZIndex=10,}},
			{43,"TextLabel",{BackgroundColor3=currentText1,BackgroundTransparency=1,Font=3,Name="EventName",Parent={41},Position=UDim2.new(0,25,0,0),Size=UDim2.new(1,-25,0,20),Text="OnSpawn",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{44,"Frame",{BackgroundColor3=Color3.new(0.19607844948769,0.19607844948769,0.19607844948769),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,Name="Cmds",Parent={41},Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,1,-20),ZIndex=10,}},
			{45,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),BorderColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),Name="Add",Parent={44},Position=UDim2.new(0,0,1,-20),Size=UDim2.new(1,0,0,20),ZIndex=10,}},
			{46,"TextBox",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClearTextOnFocus=false,Font=3,Parent={45},PlaceholderColor3=Color3.new(0.7843137383461,0.7843137383461,0.7843137383461),PlaceholderText="Add new command",Position=UDim2.new(0,5,0,0),Size=UDim2.new(1,-10,1,0),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{47,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Holder",Parent={44},Size=UDim2.new(1,0,1,-20),ZIndex=10,}},
			{48,"UIListLayout",{Parent={47},SortOrder=2,}},
			{49,"Frame",{currentShade1,BorderSizePixel=0,ClipsDescendants=true,Name="CmdTemplate",Parent={6},Size=UDim2.new(1,0,0,20),Visible=false,ZIndex=10,}},
			{50,"TextBox",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClearTextOnFocus=false,Font=3,Parent={49},PlaceholderColor3=Color3.new(1,1,1),Position=UDim2.new(0,5,0,0),Size=UDim2.new(1,-45,0,20),Text="a\\b\\c\\d",TextColor3=currentText1,TextSize=14,TextXAlignment=0,ZIndex=10,}},
			{51,"TextButton",{BackgroundColor3=currentShade1,BorderSizePixel=0,Font=3,Name="Delete",Parent={49},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,20),Text="X",TextColor3=Color3.new(1,1,1),TextSize=18,ZIndex=10,}},
			{52,"TextButton",{BackgroundColor3=currentShade1,BorderSizePixel=0,Font=3,Name="Settings",Parent={49},Position=UDim2.new(1,-40,0,0),Size=UDim2.new(0,20,0,20),Text="",TextColor3=Color3.new(1,1,1),TextSize=18,ZIndex=10,}},
			{53,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://1204397029",Parent={52},Position=UDim2.new(0,2,0,2),Size=UDim2.new(0,16,0,16),ZIndex=10,}},
		})
		main.Name = randomString()
		local mainFrame = main:WaitForChild("Content")
		local eventList = mainFrame:WaitForChild("List")
		local eventListHolder = eventList:WaitForChild("Holder")
		local cmdTemplate = mainFrame:WaitForChild("CmdTemplate")
		local eventTemplate = mainFrame:WaitForChild("EventTemplate")
		local settingsFrame = mainFrame:WaitForChild("Settings"):WaitForChild("Slider")
		local settingsTemplates = mainFrame.Settings:WaitForChild("Templates")
		local settingsList = settingsFrame:WaitForChild("List"):WaitForChild("Holder")
		table.insert(shade2,main.TopBar) table.insert(shade1,mainFrame) table.insert(shade2,eventTemplate)
		table.insert(text1,eventTemplate.EventName) table.insert(shade1,eventTemplate.Cmds.Add) table.insert(shade1,cmdTemplate)
		table.insert(text1,cmdTemplate.TextBox) table.insert(shade2,cmdTemplate.Delete) table.insert(shade2,cmdTemplate.Settings)
		table.insert(scroll,mainFrame.List) table.insert(shade1,settingsFrame) table.insert(shade2,settingsFrame.Line)
		table.insert(shade2,settingsFrame.Close) table.insert(scroll,settingsFrame.List) table.insert(shade2,settingsTemplates.DelayEditor.Secs)
		table.insert(text1,settingsTemplates.DelayEditor.Secs) table.insert(text1,settingsTemplates.DelayEditor.Secs.Label) table.insert(text1,settingsTemplates.Players.Title)
		table.insert(shade3,settingsTemplates.Players.CustomButton) table.insert(shade2,settingsTemplates.Players.Custom) table.insert(text1,settingsTemplates.Players.Custom)
		table.insert(shade3,settingsTemplates.Players.Any.Button) table.insert(shade3,settingsTemplates.Players.Me.Button) table.insert(text1,settingsTemplates.Players.Any)
		table.insert(text1,settingsTemplates.Players.Me) table.insert(text1,settingsTemplates.Strings.Title) table.insert(text1,settingsTemplates.Strings.Any)
		table.insert(shade3,settingsTemplates.Strings.Any.Button) table.insert(shade3,settingsTemplates.Strings.CustomButton) table.insert(text1,settingsTemplates.Strings.Custom)
		table.insert(shade2,settingsTemplates.Strings.Custom)
		table.insert(text1,settingsTemplates.Players.Me) table.insert(text1,settingsTemplates.Numbers.Title) table.insert(text1,settingsTemplates.Numbers.Any)
		table.insert(shade3,settingsTemplates.Numbers.Any.Button) table.insert(shade3,settingsTemplates.Numbers.CustomButton) table.insert(text1,settingsTemplates.Numbers.Custom)
		table.insert(shade2,settingsTemplates.Numbers.Custom)

		local tweenInf = TweenInfo.new(0.25,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)

		local currentlyEditingCmd = nil

		settingsFrame:WaitForChild("Close").MouseButton1Click:Connect(function()
			settingsFrame:TweenPosition(UDim2.new(0,-150,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
		end)

		local function resizeList()
			local size = 0

			for i,v in pairs(eventListHolder:GetChildren()) do
				if v.Name == "EventTemplate" then
					size = size + 20
					if v.Expand.Rotation == 90 then
						size = size + 20*(1+(#events[v.EventName:GetAttribute("RawName")].commands or 0))
					end
				end
			end

			TweenService:Create(eventList,tweenInf,{CanvasSize = UDim2.new(0,0,0,size)}):Play()

			if size > eventList.AbsoluteSize.Y then
				eventListHolder.Size = UDim2.new(1,-8,1,0)
			else
				eventListHolder.Size = UDim2.new(1,0,1,0)
			end
		end

		local function resizeSettingsList()
			local size = 0

			for i,v in pairs(settingsList:GetChildren()) do
				if v:IsA("Frame") then
					size = size + v.AbsoluteSize.Y
				end
			end

			settingsList.Parent.CanvasSize = UDim2.new(0,0,0,size)

			if size > settingsList.Parent.AbsoluteSize.Y then
				settingsList.Size = UDim2.new(1,-8,1,0)
			else
				settingsList.Size = UDim2.new(1,0,1,0)
			end
		end

		local function setupCheckbox(button,callback)
			local enabled = button.On.BackgroundTransparency == 0

			local function update()
				button.On.BackgroundTransparency = (enabled and 0 or 1)
			end

			button.On.MouseButton1Click:Connect(function()
				enabled = not enabled
				update()
				if callback then callback(enabled) end
			end)

			return {
				Toggle = function(nocall) enabled = not enabled update() if not nocall and callback then callback(enabled) end end,
				Enable = function(nocall) if enabled then return end enabled = true update()if not nocall and callback then callback(enabled) end end,
				Disable = function(nocall) if not enabled then return end enabled = false update()if not nocall and callback then callback(enabled) end end,
				IsEnabled = function() return enabled end
			}
		end

		local function openSettingsEditor(event,cmd)
			currentlyEditingCmd = cmd

			for i,v in pairs(settingsList:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end

			local delayEditor = settingsTemplates.DelayEditor:Clone()
			delayEditor.Secs.FocusLost:Connect(function()
				cmd[3] = tonumber(delayEditor.Secs.Text) or 0
				delayEditor.Secs.Text = cmd[3]
				if onEdited then onEdited() end
			end)
			delayEditor.Secs.Text = cmd[3]
			delayEditor.Visible = true
			table.insert(shade2,delayEditor.Secs)
			table.insert(text1,delayEditor.Secs)
			table.insert(text1,delayEditor.Secs.Label)
			delayEditor.Parent = settingsList

			for i,v in pairs(event.sets) do
				if v.Type == "Player" then
					local template = settingsTemplates.Players:Clone()
					template.Title.Text = v.Name or "Player"

					local me,any,custom

					me = setupCheckbox(template.Me.Button,function(on)
						if not on then return end
						any.Disable()
						custom.Disable()
						cmd[2][i] = 0
						if onEdited then onEdited() end
					end)

					any = setupCheckbox(template.Any.Button,function(on)
						if not on then return end
						me.Disable()
						custom.Disable()
						cmd[2][i] = 1
						if onEdited then onEdited() end
					end)

					local customTextBox = template.Custom
					custom = setupCheckbox(template.CustomButton,function(on)
						if not on then return end
						me.Disable()
						any.Disable()
						cmd[2][i] = customTextBox.Text
						if onEdited then onEdited() end
					end)

					ViewportTextBox.convert(customTextBox)
					customTextBox.FocusLost:Connect(function()
						if custom:IsEnabled() then
							cmd[2][i] = customTextBox.Text
							if onEdited then onEdited() end
						end
					end)

					local cVal = cmd[2][i]
					if cVal == 0 then
						me:Enable()
					elseif cVal == 1 then
						any:Enable()
					else
						custom:Enable()
						customTextBox.Text = cVal
					end

					template.Visible = true
					table.insert(text1,template.Title)
					table.insert(shade3,template.CustomButton)
					table.insert(shade3,template.Any.Button)
					table.insert(shade3,template.Me.Button)
					table.insert(text1,template.Any)
					table.insert(text1,template.Me)
					template.Parent = settingsList
				elseif v.Type == "String" then
					local template = settingsTemplates.Strings:Clone()
					template.Title.Text = v.Name or "String"

					local any,custom

					any = setupCheckbox(template.Any.Button,function(on)
						if not on then return end
						custom.Disable()
						cmd[2][i] = 0
						if onEdited then onEdited() end
					end)

					local customTextBox = template.Custom
					custom = setupCheckbox(template.CustomButton,function(on)
						if not on then return end
						any.Disable()
						cmd[2][i] = customTextBox.Text
						if onEdited then onEdited() end
					end)

					ViewportTextBox.convert(customTextBox)
					customTextBox.FocusLost:Connect(function()
						if custom:IsEnabled() then
							cmd[2][i] = customTextBox.Text
							if onEdited then onEdited() end
						end
					end)

					local cVal = cmd[2][i]
					if cVal == 0 then
						any:Enable()
					else
						custom:Enable()
						customTextBox.Text = cVal
					end

					template.Visible = true
					table.insert(text1,template.Title)
					table.insert(text1,template.Any)
					table.insert(shade3,template.Any.Button)
					table.insert(shade3,template.CustomButton)
					template.Parent = settingsList
				elseif v.Type == "Number" then
					local template = settingsTemplates.Numbers:Clone()
					template.Title.Text = v.Name or "Number"

					local any,custom

					any = setupCheckbox(template.Any.Button,function(on)
						if not on then return end
						custom.Disable()
						cmd[2][i] = 0
						if onEdited then onEdited() end
					end)

					local customTextBox = template.Custom
					custom = setupCheckbox(template.CustomButton,function(on)
						if not on then return end
						any.Disable()
						cmd[2][i] = customTextBox.Text
						if onEdited then onEdited() end
					end)

					ViewportTextBox.convert(customTextBox)
					customTextBox.FocusLost:Connect(function()
						cmd[2][i] = tonumber(customTextBox.Text) or 0
						customTextBox.Text = cmd[2][i]
						if custom:IsEnabled() then
							if onEdited then onEdited() end
						end
					end)

					local cVal = cmd[2][i]
					if cVal == 0 then
						any:Enable()
					else
						custom:Enable()
						customTextBox.Text = cVal
					end

					template.Visible = true
					table.insert(text1,template.Title)
					table.insert(text1,template.Any)
					table.insert(shade3,template.Any.Button)
					table.insert(shade3,template.CustomButton)
					template.Parent = settingsList
				end
			end
			resizeSettingsList()
			settingsFrame:TweenPosition(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
		end

		local function defaultSettings(ev)
			local res = {}

			for i,v in pairs(ev.sets) do
				if v.Type == "Player" then
					res[#res+1] = v.Default or 0
				elseif v.Type == "String" then
					res[#res+1] = v.Default or 0
				elseif v.Type == "Number" then
					res[#res+1] = v.Default or 0
				end
			end

			return res
		end

		local function refreshList()
			for i,v in pairs(eventListHolder:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end

			for name,event in pairs(events) do
				local eventF = eventTemplate:Clone()
				eventF.EventName.Text = name
				eventF.Visible = true
				eventF.EventName:SetAttribute("RawName", name)
				table.insert(shade2,eventF)
				table.insert(text1,eventF.EventName)
				table.insert(shade1,eventF.Cmds.Add)

				local expanded = false
				eventF.Expand.MouseButton1Down:Connect(function()
					expanded = not expanded
					eventF:TweenSize(UDim2.new(1,0,0,20 + (expanded and 20*#eventF.Cmds.Holder:GetChildren() or 0)),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
					eventF.Expand.Rotation = expanded and 90 or 0
					resizeList()
				end)

				local function refreshCommands()
					for i,v in pairs(eventF.Cmds.Holder:GetChildren()) do
						if v.Name == "CmdTemplate" then
							v:Destroy()
						end
					end

					eventF.EventName.Text = name..(#event.commands > 0 and " ("..#event.commands..")" or "")

					for i,cmd in pairs(event.commands) do
						local cmdF = cmdTemplate:Clone()
						local cmdTextBox = cmdF.TextBox
						ViewportTextBox.convert(cmdTextBox)
						cmdTextBox.Text = cmd[1]
						cmdF.Visible = true
						table.insert(shade1,cmdF)
						table.insert(shade2,cmdF.Delete)
						table.insert(shade2,cmdF.Settings)

						cmdTextBox.FocusLost:Connect(function()
							event.commands[i] = {cmdTextBox.Text,cmd[2],cmd[3]}
							if onEdited then onEdited() end
						end)

						cmdF.Settings.MouseButton1Click:Connect(function()
							openSettingsEditor(event,cmd)
						end)

						cmdF.Delete.MouseButton1Click:Connect(function()
							table.remove(event.commands,i)
							refreshCommands()
							resizeList()

							if currentlyEditingCmd == cmd then
								settingsFrame:TweenPosition(UDim2.new(0,-150,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
							end
							if onEdited then onEdited() end
						end)

						cmdF.Parent = eventF.Cmds.Holder
					end

					eventF:TweenSize(UDim2.new(1,0,0,20 + (expanded and 20*#eventF.Cmds.Holder:GetChildren() or 0)),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
				end

				local newBox = eventF.Cmds.Add.TextBox
				ViewportTextBox.convert(newBox)
				newBox.FocusLost:Connect(function(enter)
					if enter then
						event.commands[#event.commands+1] = {newBox.Text,defaultSettings(event),0}
						newBox.Text = ""

						refreshCommands()
						resizeList()
						if onEdited then onEdited() end
					end
				end)

				--eventF:GetPropertyChangedSignal("AbsoluteSize"):Connect(resizeList)

				eventF.Parent = eventListHolder

				refreshCommands()
			end

			resizeList()
		end

		local function saveData()
			local result = {}
			for i,v in pairs(events) do
				result[i] = v.commands
			end
			return HttpService:JSONEncode(result)
		end

		local function loadData(str)
			local data = HttpService:JSONDecode(str)
			for i,v in pairs(data) do
				if events[i] then
					events[i].commands = v
				end
			end
		end

		local function addCmd(event,data)
			table.insert(events[event].commands,data)
		end

		local function setOnEdited(f)
			if type(f) == "function" then
				onEdited = f
			end
		end

		main.TopBar.Close.MouseButton1Click:Connect(function()
			main:TweenPosition(UDim2.new(0.5,-175,0,-500), "InOut", "Quart", 0.5, true, nil)
		end)
		dragGUI(main)
		main.Parent = PARENT

		return {
			RegisterEvent = registerEvent,
			FireEvent = fireEvent,
			Refresh = refreshList,
			SaveData = saveData,
			LoadData = loadData,
			AddCmd = addCmd,
			Frame = main,
			SetOnEdited = setOnEdited
		}
	end)()

	reference = (function()
		local main = create({
			{1,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),BackgroundTransparency=1,BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,Name="Main",Position=UDim2.new(0.5,-250,0,-500),Size=UDim2.new(0,500,0,20),ZIndex=10,}},
			{2,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderSizePixel=0,Name="TopBar",Parent={1},Size=UDim2.new(1,0,0,20),ZIndex=10,}},
			{3,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={2},Size=UDim2.new(1,0,0.94999998807907,0),Text="Reference",TextColor3=Color3.new(1,1,1),TextSize=14,ZIndex=10,}},
			{4,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Close",Parent={2},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,20),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,ZIndex=10,}},
			{5,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5054663650",Parent={4},Position=UDim2.new(0,5,0,5),Size=UDim2.new(0,10,0,10),ZIndex=10,}},
			{6,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),BorderSizePixel=0,Name="Content",Parent={1},Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,0,300),ZIndex=10,}},
			{7,"ScrollingFrame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14509804546833),BackgroundTransparency=1,BorderColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png",CanvasSize=UDim2.new(0,0,0,1313),Name="List",Parent={6},ScrollBarImageColor3=Color3.new(0.30588236451149,0.30588236451149,0.3098039329052),ScrollBarThickness=8,Size=UDim2.new(1,0,1,0),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",VerticalScrollBarInset=2,ZIndex=10,}},
			{8,"UIListLayout",{Parent={7},SortOrder=2,}},
			{9,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Section",Parent={7},Size=UDim2.new(1,0,0,429),ZIndex=10,}},
			{10,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Header",Parent={9},Position=UDim2.new(0,8,0,5),Size=UDim2.new(1,-8,0,20),Text="Special Player Cases",TextColor3=Color3.new(1,1,1),TextSize=20,TextXAlignment=0,ZIndex=10,}},
			{11,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={9},Position=UDim2.new(0,8,0,25),Size=UDim2.new(1,-8,0,20),Text="These keywords can be used to quickly select groups of players in commands:",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{12,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderSizePixel=0,Name="Line",Parent={9},Position=UDim2.new(0,10,1,-1),Size=UDim2.new(1,-20,0,1),ZIndex=10,}},
			{13,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Cases",Parent={9},Position=UDim2.new(0,8,0,55),Size=UDim2.new(1,-16,0,342),ZIndex=10,}},
			{14,"UIListLayout",{Parent={13},SortOrder=2,}},
			{15,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=-4,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{16,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={15},Size=UDim2.new(1,0,1,0),Text="all",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{17,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={15},Position=UDim2.new(0,15,0,0),Size=UDim2.new(1,0,1,0),Text="- includes everyone",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{18,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=-3,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{19,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={18},Size=UDim2.new(1,0,1,0),Text="others",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{20,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={18},Position=UDim2.new(0,37,0,0),Size=UDim2.new(1,0,1,0),Text="- includes everyone except you",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{21,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=-2,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{22,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={21},Size=UDim2.new(1,0,1,0),Text="me",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{23,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={21},Position=UDim2.new(0,19,0,0),Size=UDim2.new(1,0,1,0),Text="- includes your player only",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{24,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{25,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={24},Size=UDim2.new(1,0,1,0),Text="#[number]",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{26,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={24},Position=UDim2.new(0,59,0,0),Size=UDim2.new(1,0,1,0),Text="- gets a specified amount of random players",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{27,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{28,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={27},Size=UDim2.new(1,0,1,0),Text="random",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{29,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={27},Position=UDim2.new(0,44,0,0),Size=UDim2.new(1,0,1,0),Text="- affects a random player",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{30,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{31,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={30},Size=UDim2.new(1,0,1,0),Text="%[team name]",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{32,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={30},Position=UDim2.new(0,78,0,0),Size=UDim2.new(1,0,1,0),Text="- includes everyone on a given team",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{33,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{34,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={33},Size=UDim2.new(1,0,1,0),Text="allies / team",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{35,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={33},Position=UDim2.new(0,63,0,0),Size=UDim2.new(1,0,1,0),Text="- players who are on your team",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{36,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{37,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={36},Size=UDim2.new(1,0,1,0),Text="enemies / nonteam",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{38,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={36},Position=UDim2.new(0,101,0,0),Size=UDim2.new(1,0,1,0),Text="- players who are not on your team",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{39,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{40,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={39},Size=UDim2.new(1,0,1,0),Text="friends",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{41,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={39},Position=UDim2.new(0,40,0,0),Size=UDim2.new(1,0,1,0),Text="- anyone who is friends with you",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{42,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{43,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={42},Size=UDim2.new(1,0,1,0),Text="nonfriends",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{44,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={42},Position=UDim2.new(0,61,0,0),Size=UDim2.new(1,0,1,0),Text="- anyone who is not friends with you",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{45,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{46,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={45},Size=UDim2.new(1,0,1,0),Text="guests",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{47,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={45},Position=UDim2.new(0,36,0,0),Size=UDim2.new(1,0,1,0),Text="- guest players (obsolete)",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{48,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{49,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={48},Size=UDim2.new(1,0,1,0),Text="bacons",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{50,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={48},Position=UDim2.new(0,40,0,0),Size=UDim2.new(1,0,1,0),Text="- anyone with the \"bacon\" or pal hair",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{51,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{52,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={51},Size=UDim2.new(1,0,1,0),Text="age[number]",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{53,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={51},Position=UDim2.new(0,71,0,0),Size=UDim2.new(1,0,1,0),Text="- includes anyone below or at the given age",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{54,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{55,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={54},Size=UDim2.new(1,0,1,0),Text="rad[number]",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{56,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={54},Position=UDim2.new(0,70,0,0),Size=UDim2.new(1,0,1,0),Text="- includes anyone within the given radius",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{57,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{58,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={57},Size=UDim2.new(1,0,1,0),Text="nearest",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{59,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={57},Position=UDim2.new(0,43,0,0),Size=UDim2.new(1,0,1,0),Text="- gets the closest player to you",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{60,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{61,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={60},Size=UDim2.new(1,0,1,0),Text="farthest",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{62,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={60},Position=UDim2.new(0,46,0,0),Size=UDim2.new(1,0,1,0),Text="- gets the farthest player from you",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{63,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{64,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={63},Size=UDim2.new(1,0,1,0),Text="group[ID]",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{65,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={63},Position=UDim2.new(0,55,0,0),Size=UDim2.new(1,0,1,0),Text="- gets players who are in a certain group",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{66,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{67,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={66},Size=UDim2.new(1,0,1,0),Text="alive",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{68,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={66},Position=UDim2.new(0,27,0,0),Size=UDim2.new(1,0,1,0),Text="- gets players who are alive",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{69,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{70,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={69},Size=UDim2.new(1,0,1,0),Text="dead",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{71,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={69},Position=UDim2.new(0,29,0,0),Size=UDim2.new(1,0,1,0),Text="- gets players who are dead",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{72,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=-1,Name="Case",Parent={13},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,0,0,18),ZIndex=10,}},
			{73,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="CaseName",Parent={72},Size=UDim2.new(1,0,1,0),Text="@username",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{74,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="CaseDesc",Parent={72},Position=UDim2.new(0,66,0,0),Size=UDim2.new(1,0,1,0),Text="- searches for players by username only (ignores displaynames)",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{75,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Section",Parent={7},Size=UDim2.new(1,0,0,180),ZIndex=10,}},
			{76,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Header",Parent={75},Position=UDim2.new(0,8,0,5),Size=UDim2.new(1,-8,0,20),Text="Various Operators",TextColor3=Color3.new(1,1,1),TextSize=20,TextXAlignment=0,ZIndex=10,}},
			{77,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderSizePixel=0,Name="Line",Parent={75},Position=UDim2.new(0,10,1,-1),Size=UDim2.new(1,-20,0,1),ZIndex=10,}},
			{78,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Text",Parent={75},Position=UDim2.new(0,8,0,30),Size=UDim2.new(1,-8,0,16),Text="Use commas to separate multiple expressions:",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{79,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Text",Parent={75},Position=UDim2.new(0,8,0,75),Size=UDim2.new(1,-8,0,16),Text="Use - to exclude, and + to include players in your expression:",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{80,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={75},Position=UDim2.new(0,8,0,91),Size=UDim2.new(1,-8,0,16),Text=";locate %blue-friends (gets players in blue team who aren't your friends)",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{81,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={75},Position=UDim2.new(0,8,0,46),Size=UDim2.new(1,-8,0,16),Text=";locate noob,noob2,bob",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{82,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Text",Parent={75},Position=UDim2.new(0,8,0,120),Size=UDim2.new(1,-8,0,16),Text="Put ! before a command to run it with the last arguments it was ran with:",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{83,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={75},Position=UDim2.new(0,8,0,136),Size=UDim2.new(1,-8,0,32),Text="After running ;offset 0 100 0,  you can run !offset anytime to repeat that command with the same arguments that were used to run it last time",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{84,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Section",Parent={7},Size=UDim2.new(1,0,0,154),ZIndex=10,}},
			{85,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Header",Parent={84},Position=UDim2.new(0,8,0,5),Size=UDim2.new(1,-8,0,20),Text="Command Looping",TextColor3=Color3.new(1,1,1),TextSize=20,TextXAlignment=0,ZIndex=10,}},
			{86,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Text",Parent={84},Position=UDim2.new(0,8,0,30),Size=UDim2.new(1,-8,0,20),Text="Form: [How many times it loops]^[delay (optional)]^[command]",TextColor3=Color3.new(1,1,1),TextSize=15,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{87,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderSizePixel=0,Name="Line",Parent={84},Position=UDim2.new(0,10,1,-1),Size=UDim2.new(1,-20,0,1),ZIndex=10,}},
			{88,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={84},Position=UDim2.new(0,8,0,50),Size=UDim2.new(1,-8,0,20),Text="Use the 'breakloops' command to stop all running loops.",TextColor3=Color3.new(1,1,1),TextSize=15,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{89,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Text",Parent={84},Position=UDim2.new(0,8,0,80),Size=UDim2.new(1,-8,0,16),Text="Examples:",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{90,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={84},Position=UDim2.new(0,8,0,98),Size=UDim2.new(1,-8,0,42),Text=";5^btools - gives you 5 sets of btools\n;10^3^drophats - drops your hats every 3 seconds 10 times\n;inf^0.1^animspeed 100 - infinitely loops your animation speed to 100",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{91,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Section",Parent={7},Size=UDim2.new(1,0,0,120),ZIndex=10,}},
			{92,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Header",Parent={91},Position=UDim2.new(0,8,0,5),Size=UDim2.new(1,-8,0,20),Text="Execute Multiple Commands at Once",TextColor3=Color3.new(1,1,1),TextSize=20,TextXAlignment=0,ZIndex=10,}},
			{93,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Text",Parent={91},Position=UDim2.new(0,8,0,30),Size=UDim2.new(1,-8,0,20),Text="You can execute multiple commands at once using \"\\\"",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{94,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderSizePixel=0,Name="Line",Parent={91},Position=UDim2.new(0,10,1,-1),Size=UDim2.new(1,-20,0,1),ZIndex=10,}},
			{95,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Text",Parent={91},Position=UDim2.new(0,8,0,60),Size=UDim2.new(1,-8,0,16),Text="Examples:",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{96,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={91},Position=UDim2.new(0,8,0,78),Size=UDim2.new(1,-8,0,32),Text=";drophats\\respawn - drops your hats and respawns you\n;enable inventory\\enable playerlist\\refresh - enables those coregui items and refreshes you",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{97,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Section",Parent={7},Size=UDim2.new(1,0,0,75),ZIndex=10,}},
			{98,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Header",Parent={97},Position=UDim2.new(0,8,0,5),Size=UDim2.new(1,-8,0,20),Text="Browse Command History",TextColor3=Color3.new(1,1,1),TextSize=20,TextXAlignment=0,ZIndex=10,}},
			{99,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={97},Position=UDim2.new(0,8,0,30),Size=UDim2.new(1,-8,0,32),Text="While focused on the command bar, you can use the up and down arrow keys to browse recently used commands",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{100,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderSizePixel=0,Name="Line",Parent={97},Position=UDim2.new(0,10,1,-1),Size=UDim2.new(1,-20,0,1),ZIndex=10,}},
			{101,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Section",Parent={7},Size=UDim2.new(1,0,0,75),ZIndex=10,}},
			{102,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Header",Parent={101},Position=UDim2.new(0,8,0,5),Size=UDim2.new(1,-8,0,20),Text="Autocomplete in the Command Bar",TextColor3=Color3.new(1,1,1),TextSize=20,TextXAlignment=0,ZIndex=10,}},
			{103,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={101},Position=UDim2.new(0,8,0,30),Size=UDim2.new(1,-8,0,32),Text="While focused on the command bar, you can use the tab key to insert the top suggested command into the command bar.",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{104,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderSizePixel=0,Name="Line",Parent={101},Position=UDim2.new(0,10,1,-1),Size=UDim2.new(1,-20,0,1),ZIndex=10,}},
			{105,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Section",Parent={7},Size=UDim2.new(1,0,0,175),ZIndex=10,}},
			{106,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Header",Parent={105},Position=UDim2.new(0,8,0,5),Size=UDim2.new(1,-8,0,20),Text="Using Event Binds",TextColor3=Color3.new(1,1,1),TextSize=20,TextXAlignment=0,ZIndex=10,}},
			{107,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={105},Position=UDim2.new(0,8,0,30),Size=UDim2.new(1,-8,0,32),Text="Use event binds to set up commands that get executed when certain events happen. You can edit the conditions for an event command to run (such as which player triggers it).",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{108,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderSizePixel=0,Name="Line",Parent={105},Position=UDim2.new(0,10,1,-1),Size=UDim2.new(1,-20,0,1),ZIndex=10,}},
			{109,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={105},Position=UDim2.new(0,8,0,70),Size=UDim2.new(1,-8,0,48),Text="Some events may send arguments; you can use them in your event command by using $ followed by the argument number ($1, $2, etc). You can find out the order and types of these arguments by looking at the settings of the event command.",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{110,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Text",Parent={105},Position=UDim2.new(0,8,0,130),Size=UDim2.new(1,-8,0,16),Text="Example:",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{111,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={105},Position=UDim2.new(0,8,0,148),Size=UDim2.new(1,-8,0,16),Text="Setting up 'goto $1' on the OnChatted event will teleport you to any player that chats.",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,TextYAlignment=0,ZIndex=10,}},
			{112,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Section",Parent={7},Size=UDim2.new(1,0,0,105),ZIndex=10,}},
			{113,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Header",Parent={112},Position=UDim2.new(0,8,0,5),Size=UDim2.new(1,-8,0,20),Text="Get Further Help",TextColor3=Color3.new(1,1,1),TextSize=20,TextXAlignment=0,ZIndex=10,}},
			{114,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Text",Parent={112},Position=UDim2.new(0,8,0,30),Size=UDim2.new(1,-8,0,32),Text="You can join the Discord server to get support with IY,  and read up on more documentation such as the Plugin API.",TextColor3=Color3.new(1,1,1),TextSize=14,TextWrapped=true,TextXAlignment=0,ZIndex=10,}},
			{115,"Frame",{BackgroundColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),BorderSizePixel=0,Name="Line",Parent={112},Position=UDim2.new(0,10,1,-1),Size=UDim2.new(1,-20,0,1),Visible=false,ZIndex=10,}},
			{116,"TextButton",{BackgroundColor3=Color3.new(0.48627451062202,0.61960786581039,0.85098040103912),BorderColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),Font=4,Name="InviteButton",Parent={112},Position=UDim2.new(0,5,0,75),Size=UDim2.new(1,-10,0,25),Text="Copy Discord Invite Link (https://discord.gg/78ZuWSq)",TextColor3=Color3.new(0.1803921610117,0.1803921610117,0.1843137294054),TextSize=16,ZIndex=10,}},
		})
		for i,v in pairs(main.Content.List:GetDescendants()) do
			if v:IsA("TextLabel") then
				table.insert(text1,v)
			end
		end
		table.insert(scroll,main.Content.List)
		table.insert(shade1,main.Content)
		table.insert(shade2,main.TopBar)
		main.Name = randomString()
		main.TopBar.Close.MouseButton1Click:Connect(function()
			main:TweenPosition(UDim2.new(0.5,-250,0,-500), "InOut", "Quart", 0.5, true, nil)
		end)
		local inviteButton = main:FindFirstChild("InviteButton",true)
		local lastPress = nil
		inviteButton.MouseButton1Click:Connect(function()
			if everyClipboard then
				toClipboard("https://discord.gg/78ZuWSq")
				inviteButton.Text = "Copied"
			else
				inviteButton.Text = "No Clipboard Function, type out the link"
			end
			local pressTime = tick()
			lastPress = pressTime
			wait(2)
			if lastPress ~= pressTime then return end
			inviteButton.Text = "Copy Discord Invite Link (https://discord.gg/78ZuWSq)"
		end)
		dragGUI(main)
		main.Parent = PARENT

		ReferenceButton.MouseButton1Click:Connect(function()
			main:TweenPosition(UDim2.new(0.5,-250,0.5,-150), "InOut", "Quart", 0.5, true, nil)
		end)
	end)()

	currentShade1 = Color3.fromRGB(36, 36, 37)
	currentShade2 = Color3.fromRGB(46, 46, 47)
	currentShade3 = Color3.fromRGB(78, 78, 79)
	currentText1 = Color3.new(1, 1, 1)
	currentText2 = Color3.new(0, 0, 0)
	currentScroll = Color3.fromRGB(78,78,79)

	defaultsettings = {
		prefix = ';';
		StayOpen = false;
		espTransparency = 0.3;
		keepIY = true;
		logsEnabled = false;
		jLogsEnabled = false;
		aliases = {};
		binds = {};
		WayPoints = {};
		PluginsTable = {};
		currentShade1 = {currentShade1.R,currentShade1.G,currentShade1.B};
		currentShade2 = {currentShade2.R,currentShade2.G,currentShade2.B};
		currentShade3 = {currentShade3.R,currentShade3.G,currentShade3.B};
		currentText1 = {currentText1.R,currentText1.G,currentText1.B};
		currentText2 = {currentText2.R,currentText2.G,currentText2.B};
		currentScroll = {currentScroll.R,currentScroll.G,currentScroll.B};
		eventBinds = eventEditor.SaveData()
	}

	defaults = HttpService:JSONEncode(defaultsettings)
	nosaves = false
	useFactorySettings = function()
		prefix = ';'
		StayOpen = false
		KeepInfYield = true
		espTransparency = 0.3
		logsEnabled = false
		jLogsEnabled = false
		aliases = {}
		binds = {}
		WayPoints = {}
		PluginsTable = {}
	end

	createPopup = function(text)
		local FileError = Instance.new("Frame")
		local background = Instance.new("Frame")
		local Directions = Instance.new("TextLabel")
		local shadow = Instance.new("Frame")
		local PopupText = Instance.new("TextLabel")
		local Exit = Instance.new("TextButton")
		local ExitImage = Instance.new("ImageLabel")

		FileError.Name = randomString()
		FileError.Parent = PARENT
		FileError.Active = true
		FileError.BackgroundTransparency = 1
		FileError.Position = UDim2.new(0.5, -180, 0, 290)
		FileError.Size = UDim2.new(0, 360, 0, 20)
		FileError.ZIndex = 10

		background.Name = "background"
		background.Parent = FileError
		background.Active = true
		background.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
		background.BorderSizePixel = 0
		background.Position = UDim2.new(0, 0, 0, 20)
		background.Size = UDim2.new(0, 360, 0, 205)
		background.ZIndex = 10

		Directions.Name = "Directions"
		Directions.Parent = background
		Directions.BackgroundTransparency = 1
		Directions.BorderSizePixel = 0
		Directions.Position = UDim2.new(0, 10, 0, 10)
		Directions.Size = UDim2.new(0, 340, 0, 185)
		Directions.Font = Enum.Font.SourceSans
		Directions.TextSize = 14
		Directions.Text = text
		Directions.TextColor3 = Color3.new(1, 1, 1)
		Directions.TextWrapped = true
		Directions.TextXAlignment = Enum.TextXAlignment.Left
		Directions.TextYAlignment = Enum.TextYAlignment.Top
		Directions.ZIndex = 10

		shadow.Name = "shadow"
		shadow.Parent = FileError
		shadow.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
		shadow.BorderSizePixel = 0
		shadow.Size = UDim2.new(0, 360, 0, 20)
		shadow.ZIndex = 10

		PopupText.Name = "PopupText"
		PopupText.Parent = shadow
		PopupText.BackgroundTransparency = 1
		PopupText.Size = UDim2.new(1, 0, 0.95, 0)
		PopupText.ZIndex = 10
		PopupText.Font = Enum.Font.SourceSans
		PopupText.TextSize = 14
		PopupText.Text = "File Error"
		PopupText.TextColor3 = Color3.new(1, 1, 1)
		PopupText.TextWrapped = true

		Exit.Name = "Exit"
		Exit.Parent = shadow
		Exit.BackgroundTransparency = 1
		Exit.Position = UDim2.new(1, -20, 0, 0)
		Exit.Size = UDim2.new(0, 20, 0, 20)
		Exit.Text = ""
		Exit.ZIndex = 10

		ExitImage.Parent = Exit
		ExitImage.BackgroundColor3 = Color3.new(1, 1, 1)
		ExitImage.BackgroundTransparency = 1
		ExitImage.Position = UDim2.new(0, 5, 0, 5)
		ExitImage.Size = UDim2.new(0, 10, 0, 10)
		ExitImage.Image = "rbxassetid://5054663650"
		ExitImage.ZIndex = 10

		Exit.MouseButton1Click:Connect(function()
			FileError:Destroy()
		end)
	end

	local loadedEventData = nil
	local jsonAttempts = 0
	function saves()
		if writefileExploit() and readfileExploit() and jsonAttempts < 10 then
			local readSuccess, out = readfile("IY_FE.iy", true)
			if readSuccess then
				if out ~= nil and tostring(out):gsub("%s", "") ~= "" then
					local success, response = pcall(function()
						local json = HttpService:JSONDecode(out)
						if json.prefix ~= nil then prefix = json.prefix else prefix = ';' end
						if json.StayOpen ~= nil then StayOpen = json.StayOpen else StayOpen = false end
						if json.keepIY ~= nil then KeepInfYield = json.keepIY else KeepInfYield = true end
						if json.espTransparency ~= nil then espTransparency = json.espTransparency else espTransparency = 0.3 end
						if json.logsEnabled ~= nil then logsEnabled = json.logsEnabled else logsEnabled = false end
						if json.jLogsEnabled ~= nil then jLogsEnabled = json.jLogsEnabled else jLogsEnabled = false end
						if json.aliases ~= nil then aliases = json.aliases else aliases = {} end
						if json.binds ~= nil then binds = (json.binds or {}) else binds = {} end
						if json.spawnCmds ~= nil then spawnCmds = json.spawnCmds end
						if json.WayPoints ~= nil then AllWaypoints = json.WayPoints else WayPoints = {} AllWaypoints = {} end
						if json.PluginsTable ~= nil then PluginsTable = json.PluginsTable else PluginsTable = {} end
						if json.currentShade1 ~= nil then currentShade1 = Color3.new(json.currentShade1[1],json.currentShade1[2],json.currentShade1[3]) end
						if json.currentShade2 ~= nil then currentShade2 = Color3.new(json.currentShade2[1],json.currentShade2[2],json.currentShade2[3]) end
						if json.currentShade3 ~= nil then currentShade3 = Color3.new(json.currentShade3[1],json.currentShade3[2],json.currentShade3[3]) end
						if json.currentText1 ~= nil then currentText1 = Color3.new(json.currentText1[1],json.currentText1[2],json.currentText1[3]) end
						if json.currentText2 ~= nil then currentText2 = Color3.new(json.currentText2[1],json.currentText2[2],json.currentText2[3]) end
						if json.currentScroll ~= nil then currentScroll = Color3.new(json.currentScroll[1],json.currentScroll[2],json.currentScroll[3]) end
						if json.eventBinds ~= nil then loadedEventData = json.eventBinds end
					end)
					if not success then
						jsonAttempts = jsonAttempts + 1
						warn("Save Json Error:", response)
						warn("Overwriting Save File")
						writefile("IY_FE.iy", defaults, true)
						wait()
						saves()
					end
				else
					writefile("IY_FE.iy", defaults, true)
					wait()
					local dReadSuccess, dOut = readfile("IY_FE.iy", true)
					if dReadSuccess and dOut ~= nil and tostring(dOut):gsub("%s", "") ~= "" then
						saves()
					else
						nosaves = true
						useFactorySettings()
						createPopup("There was a problem writing a save file to your PC.\n\nPlease contact the developer/support team for your exploit and tell them writefile/readfile is not working.\n\nYour settings, keybinds, waypoints, and aliases will not save if you continue.\n\nThings to try:\n> Make sure a 'workspace' folder is located in the same folder as your exploit\n> If your exploit is inside of a zip/rar file, extract it.\n> Rejoin the game and try again or restart your PC and try again.")
					end
				end
			else
				writefile("IY_FE.iy", defaults, true)
				wait()
				local dReadSuccess, dOut = readfile("IY_FE.iy", true)
				if dReadSuccess and dOut ~= nil and tostring(dOut):gsub("%s", "") ~= "" then
					saves()
				else
					nosaves = true
					useFactorySettings()
					createPopup("There was a problem writing a save file to your PC.\n\nPlease contact the developer/support team for your exploit and tell them writefile/readfile is not working.\n\nYour settings, keybinds, waypoints, and aliases will not save if you continue.\n\nThings to try:\n> Make sure a 'workspace' folder is located in the same folder as your exploit\n> If your exploit is inside of a zip/rar file, extract it.\n> Rejoin the game and try again or restart your PC and try again.")
				end
			end
		else
			if jsonAttempts >= 10 then
				nosaves = true
				useFactorySettings()
				createPopup("Sorry, we have attempted to parse your save file, but it is unreadable!\n\nInfinite Yield is now using factory settings until your exploit's file system works.\n\nYour save file has not been deleted.")
			else
				nosaves = true
				useFactorySettings()
			end
		end
	end

	saves()

	function updatesaves()
		if nosaves == false and writefileExploit() then
			local update = {
				prefix = prefix;
				StayOpen = StayOpen;
				keepIY = KeepInfYield;
				espTransparency = espTransparency;
				logsEnabled = logsEnabled;
				jLogsEnabled = jLogsEnabled;
				aliases = aliases;
				binds = binds or {};
				WayPoints = AllWaypoints;
				PluginsTable = PluginsTable;
				currentShade1 = {currentShade1.R,currentShade1.G,currentShade1.B};
				currentShade2 = {currentShade2.R,currentShade2.G,currentShade2.B};
				currentShade3 = {currentShade3.R,currentShade3.G,currentShade3.B};
				currentText1 = {currentText1.R,currentText1.G,currentText1.B};
				currentText2 = {currentText2.R,currentText2.G,currentText2.B};
				currentScroll = {currentScroll.R,currentScroll.G,currentScroll.B};
				eventBinds = eventEditor.SaveData()
			}
			writefileCooldown("IY_FE.iy", HttpService:JSONEncode(update))
		end
	end

	eventEditor.SetOnEdited(updatesaves)

	pWayPoints = {}
	WayPoints = {}

	if #AllWaypoints > 0 then
		for i = 1, #AllWaypoints do
			if not AllWaypoints[i].GAME or AllWaypoints[i].GAME == PlaceId then
				WayPoints[#WayPoints + 1] = {NAME = AllWaypoints[i].NAME, COORD = {AllWaypoints[i].COORD[1], AllWaypoints[i].COORD[2], AllWaypoints[i].COORD[3]}, GAME = AllWaypoints[i].GAME}
			end
		end
	end

	if type(binds) ~= "table" then binds = {} end

	function Time()
		local HOUR = math.floor((tick() % 86400) / 3600)
		local MINUTE = math.floor((tick() % 3600) / 60)
		local SECOND = math.floor(tick() % 60)
		local AP = HOUR > 11 and 'PM' or 'AM'
		HOUR = (HOUR % 12 == 0 and 12 or HOUR % 12)
		HOUR = HOUR < 10 and '0' .. HOUR or HOUR
		MINUTE = MINUTE < 10 and '0' .. MINUTE or MINUTE
		SECOND = SECOND < 10 and '0' .. SECOND or SECOND
		return HOUR .. ':' .. MINUTE .. ':' .. SECOND .. ' ' .. AP
	end

	PrefixBox.Text = prefix
	local SettingsOpen = false
	local isHidden = false

	if StayOpen == false then
		On.BackgroundTransparency = 1
	else
		On.BackgroundTransparency = 0
	end

	if logsEnabled then
		Toggle.Text = 'Enabled'
	else
		Toggle.Text = 'Disabled'
	end

	if jLogsEnabled then
		Toggle_2.Text = 'Enabled'
	else
		Toggle_2.Text = 'Disabled'
	end

	function maximizeHolder()
		if StayOpen == false then
			Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, -220), "InOut", "Quart", 0.2, true, nil)
		end
	end

	local minimizeNum = -20
	function minimizeHolder()
		if StayOpen == false then
			Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, minimizeNum), "InOut", "Quart", 0.5, true, nil)
		end
	end

	function cmdbarHolder()
		if StayOpen == false then
			Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, -45), "InOut", "Quart", 0.5, true, nil)
		end
	end

	pinNotification = nil
	local notifyCount = 0
	function notify(text,text2,length)
		task.spawn(function()
			local LnotifyCount = notifyCount+1
			local notificationPinned = false
			notifyCount = notifyCount+1
			if pinNotification then pinNotification:Disconnect() end
			pinNotification = PinButton.MouseButton1Click:Connect(function()
				task.spawn(function()
					pinNotification:Disconnect()
					notificationPinned = true
					Title_2.BackgroundTransparency = 1
					wait(0.5)
					Title_2.BackgroundTransparency = 0
				end)
			end)
			Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, 0), "InOut", "Quart", 0.5, true, nil)
			wait(0.6)
			local closepressed = false
			if text2 then
				Title_2.Text = text
				Text_2.Text = text2
			else
				Title_2.Text = 'Notification'
				Text_2.Text = text
			end
			Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, -100), "InOut", "Quart", 0.5, true, nil)
			CloseButton.MouseButton1Click:Connect(function()
				Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, 0), "InOut", "Quart", 0.5, true, nil)
				closepressed = true
				pinNotification:Disconnect()
			end)
			if length and isNumber(length) then
				wait(length)
			else
				wait(10)
			end
			if LnotifyCount == notifyCount then
				if closepressed == false and notificationPinned == false then
					pinNotification:Disconnect()
					Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, 0), "InOut", "Quart", 0.5, true, nil)
				end
				notifyCount = 0
			end
		end)
	end

	local lastMessage = nil
	local lastLabel = nil
	local dupeCount = 1
	function CreateLabel(Name, Text)
		if lastMessage == Name..Text then
			dupeCount = dupeCount+1
			lastLabel.Text = Time()..' - ['..Name..']: '..Text..' (x'..dupeCount..')'
		else
			if dupeCount > 1 then dupeCount = 1 end
			if #scroll_2:GetChildren() >= 2546 then
				scroll_2:ClearAllChildren()
			end
			local alls = 0
			for i,v in pairs(scroll_2:GetChildren()) do
				if v then
					alls = v.Size.Y.Offset + alls
				end
				if not v then
					alls = 0
				end
			end
			local tl = Instance.new('TextLabel')
			lastMessage = Name..Text
			lastLabel = tl
			tl.Name = Name
			tl.Parent = scroll_2
			tl.ZIndex = 10
			tl.Text = Time().." - ["..Name.."]: "..Text
			tl.Size = UDim2.new(0,322,0,84)
			tl.BackgroundTransparency = 1
			tl.BorderSizePixel = 0
			tl.Font = "SourceSans"
			tl.Position = UDim2.new(-1,0,0,alls)
			tl.TextTransparency = 1
			tl.TextScaled = false
			tl.TextSize = 14
			tl.TextWrapped = true
			tl.TextXAlignment = "Left"
			tl.TextYAlignment = "Top"
			tl.TextColor3 = currentText1
			tl.Size = UDim2.new(0,322,0,tl.TextBounds.Y)
			table.insert(text1,tl)
			scroll_2.CanvasSize = UDim2.new(0,0,0,alls+tl.TextBounds.Y)
			scroll_2.CanvasPosition = Vector2.new(0,scroll_2.CanvasPosition.Y+tl.TextBounds.Y)
			tl:TweenPosition(UDim2.new(0,3,0,alls), 'In', 'Quint', 0.5)
			TweenService:Create(tl, TweenInfo.new(1.25, Enum.EasingStyle.Linear), { TextTransparency = 0 }):Play()
		end
	end

	function CreateJoinLabel(plr,ID)
		if #scroll_3:GetChildren() >= 2546 then
			scroll_3:ClearAllChildren()
		end
		local infoFrame = Instance.new("Frame")
		local info1 = Instance.new("TextLabel")
		local info2 = Instance.new("TextLabel")
		local ImageLabel_3 = Instance.new("ImageLabel")
		infoFrame.Name = randomString()
		infoFrame.Parent = scroll_3
		infoFrame.BackgroundColor3 = Color3.new(1, 1, 1)
		infoFrame.BackgroundTransparency = 1
		infoFrame.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
		infoFrame.Size = UDim2.new(1, 0, 0, 50)
		info1.Name = randomString()
		info1.Parent = infoFrame
		info1.BackgroundTransparency = 1
		info1.BorderSizePixel = 0
		info1.Position = UDim2.new(0, 45, 0, 0)
		info1.Size = UDim2.new(0, 135, 1, 0)
		info1.ZIndex = 10
		info1.Font = Enum.Font.SourceSans
		info1.FontSize = Enum.FontSize.Size14
		info1.Text = "Username: "..plr.Name.."\nJoined Server: "..Time()
		info1.TextColor3 = Color3.new(1, 1, 1)
		info1.TextWrapped = true
		info1.TextXAlignment = Enum.TextXAlignment.Left
		info2.Name = randomString()
		info2.Parent = infoFrame
		info2.BackgroundTransparency = 1
		info2.BorderSizePixel = 0
		info2.Position = UDim2.new(0, 185, 0, 0)
		info2.Size = UDim2.new(0, 140, 1, -5)
		info2.ZIndex = 10
		info2.Font = Enum.Font.SourceSans
		info2.FontSize = Enum.FontSize.Size14
		info2.Text = "User ID: "..ID.."\nAccount Age: "..plr.AccountAge.."\nJoined Roblox: Loading..."
		info2.TextColor3 = Color3.new(1, 1, 1)
		info2.TextWrapped = true
		info2.TextXAlignment = Enum.TextXAlignment.Left
		info2.TextYAlignment = Enum.TextYAlignment.Center
		ImageLabel_3.Parent = infoFrame
		ImageLabel_3.BackgroundTransparency = 1
		ImageLabel_3.BorderSizePixel = 0
		ImageLabel_3.Size = UDim2.new(0, 45, 1, 0)
		ImageLabel_3.Image = Players:GetUserThumbnailAsync(ID, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size420x420)
		scroll_3.CanvasSize = UDim2.new(0, 0, 0, listlayout.AbsoluteContentSize.Y)
		scroll_3.CanvasPosition = Vector2.new(0,scroll_2.CanvasPosition.Y+infoFrame.AbsoluteSize.Y)
		wait()
		local user = game:HttpGet("https://users.roblox.com/v1/users/"..ID)
		local json = HttpService:JSONDecode(user)
		local date = json["created"]:sub(1,10)
		local splitDates = string.split(date,"-")
		info2.Text = string.gsub(info2.Text, "Loading...",splitDates[2].."/"..splitDates[3].."/"..splitDates[1])
	end

	IYMouse.KeyDown:Connect(function(Key)
		if (Key==prefix) then
			Cmdbar:CaptureFocus()
			spawn(function()
				repeat Cmdbar.Text = '' until Cmdbar.Text == ''
			end)
			maximizeHolder()
		end
	end)

	local lastMinimizeReq = 0
	Holder.MouseEnter:Connect(function()
		lastMinimizeReq = 0
		maximizeHolder()
	end)

	Holder.MouseLeave:Connect(function()
		if not Cmdbar:IsFocused() then
			local reqTime = tick()
			lastMinimizeReq = reqTime
			wait(1)
			if lastMinimizeReq ~= reqTime then return end
			if not Cmdbar:IsFocused() then
				minimizeHolder()
			end
		end
	end)

	function updateColors(color,ctype)
		if ctype == shade1 then
			for i,v in pairs(shade1) do
				v.BackgroundColor3 = color
			end
			currentShade1 = color
		elseif ctype == shade2 then
			for i,v in pairs(shade2) do
				v.BackgroundColor3 = color
			end
			currentShade2 = color
		elseif ctype == shade3 then
			for i,v in pairs(shade3) do
				v.BackgroundColor3 = color
			end
			currentShade3 = color
		elseif ctype == text1 then
			for i,v in pairs(text1) do
				v.TextColor3 = color
				if v:IsA("TextBox") then
					v.PlaceholderColor3 = color	
				end
			end
			currentText1 = color
		elseif ctype == text2 then
			for i,v in pairs(text2) do
				v.TextColor3 = color
			end
			currentText2 = color
		elseif ctype == scroll then
			for i,v in pairs(scroll) do
				v.ScrollBarImageColor3 = color
			end
			currentScroll = color
		end
	end

	local colorpickerOpen = false
	ColorsButton.MouseButton1Click:Connect(function()
		cache_currentShade1 = currentShade1
		cache_currentShade2 = currentShade2
		cache_currentShade3 = currentShade3
		cache_currentText1 = currentText1
		cache_currentText2 = currentText2
		cache_currentScroll = currentScroll
		if not colorpickerOpen then
			colorpickerOpen = true
			picker = game:GetObjects("rbxassetid://4908465318")[1]
			picker.Name = randomString()
			picker.Parent = PARENT

			local ColorPicker do
				ColorPicker = {}

				ColorPicker.new = function()
					local newMt = setmetatable({},{})

					local pickerGui = picker.ColorPicker
					local pickerTopBar = pickerGui.TopBar
					local pickerExit = pickerTopBar.Exit
					local pickerFrame = pickerGui.Content
					local colorSpace = pickerFrame.ColorSpaceFrame.ColorSpace
					local colorStrip = pickerFrame.ColorStrip
					local previewFrame = pickerFrame.Preview
					local basicColorsFrame = pickerFrame.BasicColors
					local customColorsFrame = pickerFrame.CustomColors
					local defaultButton = pickerFrame.Default
					local cancelButton = pickerFrame.Cancel
					local shade1Button = pickerFrame.Shade1
					local shade2Button = pickerFrame.Shade2
					local shade3Button = pickerFrame.Shade3
					local text1Button = pickerFrame.Text1
					local text2Button = pickerFrame.Text2
					local scrollButton = pickerFrame.Scroll

					local colorScope = colorSpace.Scope
					local colorArrow = pickerFrame.ArrowFrame.Arrow

					local hueInput = pickerFrame.Hue.Input
					local satInput = pickerFrame.Sat.Input
					local valInput = pickerFrame.Val.Input

					local redInput = pickerFrame.Red.Input
					local greenInput = pickerFrame.Green.Input
					local blueInput = pickerFrame.Blue.Input

					local mouse = IYMouse

					local hue,sat,val = 0,0,1
					local red,green,blue = 1,1,1
					local chosenColor = Color3.new(0,0,0)

					local basicColors = {Color3.new(0,0,0),Color3.new(0.66666668653488,0,0),Color3.new(0,0.33333334326744,0),Color3.new(0.66666668653488,0.33333334326744,0),Color3.new(0,0.66666668653488,0),Color3.new(0.66666668653488,0.66666668653488,0),Color3.new(0,1,0),Color3.new(0.66666668653488,1,0),Color3.new(0,0,0.49803924560547),Color3.new(0.66666668653488,0,0.49803924560547),Color3.new(0,0.33333334326744,0.49803924560547),Color3.new(0.66666668653488,0.33333334326744,0.49803924560547),Color3.new(0,0.66666668653488,0.49803924560547),Color3.new(0.66666668653488,0.66666668653488,0.49803924560547),Color3.new(0,1,0.49803924560547),Color3.new(0.66666668653488,1,0.49803924560547),Color3.new(0,0,1),Color3.new(0.66666668653488,0,1),Color3.new(0,0.33333334326744,1),Color3.new(0.66666668653488,0.33333334326744,1),Color3.new(0,0.66666668653488,1),Color3.new(0.66666668653488,0.66666668653488,1),Color3.new(0,1,1),Color3.new(0.66666668653488,1,1),Color3.new(0.33333334326744,0,0),Color3.new(1,0,0),Color3.new(0.33333334326744,0.33333334326744,0),Color3.new(1,0.33333334326744,0),Color3.new(0.33333334326744,0.66666668653488,0),Color3.new(1,0.66666668653488,0),Color3.new(0.33333334326744,1,0),Color3.new(1,1,0),Color3.new(0.33333334326744,0,0.49803924560547),Color3.new(1,0,0.49803924560547),Color3.new(0.33333334326744,0.33333334326744,0.49803924560547),Color3.new(1,0.33333334326744,0.49803924560547),Color3.new(0.33333334326744,0.66666668653488,0.49803924560547),Color3.new(1,0.66666668653488,0.49803924560547),Color3.new(0.33333334326744,1,0.49803924560547),Color3.new(1,1,0.49803924560547),Color3.new(0.33333334326744,0,1),Color3.new(1,0,1),Color3.new(0.33333334326744,0.33333334326744,1),Color3.new(1,0.33333334326744,1),Color3.new(0.33333334326744,0.66666668653488,1),Color3.new(1,0.66666668653488,1),Color3.new(0.33333334326744,1,1),Color3.new(1,1,1)}
					local customColors = {}

					dragGUI(picker)

					local function updateColor(noupdate)
						local relativeX,relativeY,relativeStripY = 219 - hue*219, 199 - sat*199, 199 - val*199
						local hsvColor = Color3.fromHSV(hue,sat,val)

						if noupdate == 2 or not noupdate then
							hueInput.Text = tostring(math.ceil(359*hue))
							satInput.Text = tostring(math.ceil(255*sat))
							valInput.Text = tostring(math.floor(255*val))
						end
						if noupdate == 1 or not noupdate then
							redInput.Text = tostring(math.floor(255*red))
							greenInput.Text = tostring(math.floor(255*green))
							blueInput.Text = tostring(math.floor(255*blue))
						end

						chosenColor = Color3.new(red,green,blue)

						colorScope.Position = UDim2.new(0,relativeX-9,0,relativeY-9)
						colorStrip.ImageColor3 = Color3.fromHSV(hue,sat,1)
						colorArrow.Position = UDim2.new(0,-2,0,relativeStripY-4)
						previewFrame.BackgroundColor3 = chosenColor

						newMt.Color = chosenColor
						if newMt.Changed then newMt:Changed(chosenColor) end
					end

					local function colorSpaceInput()
						local relativeX = mouse.X - colorSpace.AbsolutePosition.X
						local relativeY = mouse.Y - colorSpace.AbsolutePosition.Y

						if relativeX < 0 then relativeX = 0 elseif relativeX > 219 then relativeX = 219 end
						if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end

						hue = (219 - relativeX)/219
						sat = (199 - relativeY)/199

						local hsvColor = Color3.fromHSV(hue,sat,val)
						red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b

						updateColor()
					end

					local function colorStripInput()
						local relativeY = mouse.Y - colorStrip.AbsolutePosition.Y

						if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end	

						val = (199 - relativeY)/199

						local hsvColor = Color3.fromHSV(hue,sat,val)
						red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b

						updateColor()
					end

					local function hookButtons(frame,func)
						frame.ArrowFrame.Up.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement then
								frame.ArrowFrame.Up.BackgroundTransparency = 0.5
							elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
								local releaseEvent,runEvent

								local startTime = tick()
								local pressing = true
								local startNum = tonumber(frame.Text)

								if not startNum then return end

								releaseEvent = UserInputService.InputEnded:Connect(function(input)
									if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
									releaseEvent:Disconnect()
									pressing = false
								end)

								startNum = startNum + 1
								func(startNum)
								while pressing do
									if tick()-startTime > 0.3 then
										startNum = startNum + 1
										func(startNum)
									end
									wait(0.1)
								end
							end
						end)

						frame.ArrowFrame.Up.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement then
								frame.ArrowFrame.Up.BackgroundTransparency = 1
							end
						end)

						frame.ArrowFrame.Down.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement then
								frame.ArrowFrame.Down.BackgroundTransparency = 0.5
							elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
								local releaseEvent,runEvent

								local startTime = tick()
								local pressing = true
								local startNum = tonumber(frame.Text)

								if not startNum then return end

								releaseEvent = UserInputService.InputEnded:Connect(function(input)
									if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
									releaseEvent:Disconnect()
									pressing = false
								end)

								startNum = startNum - 1
								func(startNum)
								while pressing do
									if tick()-startTime > 0.3 then
										startNum = startNum - 1
										func(startNum)
									end
									wait(0.1)
								end
							end
						end)

						frame.ArrowFrame.Down.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement then
								frame.ArrowFrame.Down.BackgroundTransparency = 1
							end
						end)
					end

					colorSpace.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							local releaseEvent,mouseEvent

							releaseEvent = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
								releaseEvent:Disconnect()
								mouseEvent:Disconnect()
							end)

							mouseEvent = UserInputService.InputChanged:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseMovement then
									colorSpaceInput()
								end
							end)

							colorSpaceInput()
						end
					end)

					colorStrip.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							local releaseEvent,mouseEvent

							releaseEvent = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
								releaseEvent:Disconnect()
								mouseEvent:Disconnect()
							end)

							mouseEvent = UserInputService.InputChanged:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseMovement then
									colorStripInput()
								end
							end)

							colorStripInput()
						end
					end)

					local function updateHue(str)
						local num = tonumber(str)
						if num then
							hue = math.clamp(math.floor(num),0,359)/359
							local hsvColor = Color3.fromHSV(hue,sat,val)
							red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
							hueInput.Text = tostring(hue*359)
							updateColor(1)
						end
					end
					hueInput.FocusLost:Connect(function() updateHue(hueInput.Text) end) hookButtons(hueInput,updateHue)

					local function updateSat(str)
						local num = tonumber(str)
						if num then
							sat = math.clamp(math.floor(num),0,255)/255
							local hsvColor = Color3.fromHSV(hue,sat,val)
							red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
							satInput.Text = tostring(sat*255)
							updateColor(1)
						end
					end
					satInput.FocusLost:Connect(function() updateSat(satInput.Text) end) hookButtons(satInput,updateSat)

					local function updateVal(str)
						local num = tonumber(str)
						if num then
							val = math.clamp(math.floor(num),0,255)/255
							local hsvColor = Color3.fromHSV(hue,sat,val)
							red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
							valInput.Text = tostring(val*255)
							updateColor(1)
						end
					end
					valInput.FocusLost:Connect(function() updateVal(valInput.Text) end) hookButtons(valInput,updateVal)

					local function updateRed(str)
						local num = tonumber(str)
						if num then
							red = math.clamp(math.floor(num),0,255)/255
							local newColor = Color3.new(red,green,blue)
							hue,sat,val = Color3.toHSV(newColor)
							redInput.Text = tostring(red*255)
							updateColor(2)
						end
					end
					redInput.FocusLost:Connect(function() updateRed(redInput.Text) end) hookButtons(redInput,updateRed)

					local function updateGreen(str)
						local num = tonumber(str)
						if num then
							green = math.clamp(math.floor(num),0,255)/255
							local newColor = Color3.new(red,green,blue)
							hue,sat,val = Color3.toHSV(newColor)
							greenInput.Text = tostring(green*255)
							updateColor(2)
						end
					end
					greenInput.FocusLost:Connect(function() updateGreen(greenInput.Text) end) hookButtons(greenInput,updateGreen)

					local function updateBlue(str)
						local num = tonumber(str)
						if num then
							blue = math.clamp(math.floor(num),0,255)/255
							local newColor = Color3.new(red,green,blue)
							hue,sat,val = Color3.toHSV(newColor)
							blueInput.Text = tostring(blue*255)
							updateColor(2)
						end
					end
					blueInput.FocusLost:Connect(function() updateBlue(blueInput.Text) end) hookButtons(blueInput,updateBlue)

					local colorChoice = Instance.new("TextButton")
					colorChoice.Name = "Choice"
					colorChoice.Size = UDim2.new(0,25,0,18)
					colorChoice.BorderColor3 = Color3.new(96/255,96/255,96/255)
					colorChoice.Text = ""
					colorChoice.AutoButtonColor = false
					colorChoice.ZIndex = 10

					local row = 0
					local column = 0
					for i,v in pairs(basicColors) do
						local newColor = colorChoice:Clone()
						newColor.BackgroundColor3 = v
						newColor.Position = UDim2.new(0,1 + 30*column,0,21 + 23*row)

						newColor.MouseButton1Click:Connect(function()
							red,green,blue = v.r,v.g,v.b
							local newColor = Color3.new(red,green,blue)
							hue,sat,val = Color3.toHSV(newColor)
							updateColor()
						end)	

						newColor.Parent = basicColorsFrame
						column = column + 1
						if column == 6 then row = row + 1 column = 0 end
					end

					row = 0
					column = 0
					for i = 1,12 do
						local color = customColors[i] or Color3.new(0,0,0)
						local newColor = colorChoice:Clone()
						newColor.BackgroundColor3 = color
						newColor.Position = UDim2.new(0,1 + 30*column,0,20 + 23*row)

						newColor.MouseButton1Click:Connect(function()
							local curColor = customColors[i] or Color3.new(0,0,0)
							red,green,blue = curColor.r,curColor.g,curColor.b
							hue,sat,val = Color3.toHSV(curColor)
							updateColor()
						end)

						newColor.MouseButton2Click:Connect(function()
							customColors[i] = chosenColor
							newColor.BackgroundColor3 = chosenColor
						end)

						newColor.Parent = customColorsFrame
						column = column + 1
						if column == 6 then row = row + 1 column = 0 end
					end

					shade1Button.MouseButton1Click:Connect(function() if newMt.Confirm then newMt:Confirm(chosenColor,shade1) end end)
					shade1Button.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then shade1Button.BackgroundTransparency = 0.4 end end)
					shade1Button.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then shade1Button.BackgroundTransparency = 0 end end)

					shade2Button.MouseButton1Click:Connect(function() if newMt.Confirm then newMt:Confirm(chosenColor,shade2) end end)
					shade2Button.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then shade2Button.BackgroundTransparency = 0.4 end end)
					shade2Button.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then shade2Button.BackgroundTransparency = 0 end end)

					shade3Button.MouseButton1Click:Connect(function() if newMt.Confirm then newMt:Confirm(chosenColor,shade3) end end)
					shade3Button.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then shade3Button.BackgroundTransparency = 0.4 end end)
					shade3Button.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then shade3Button.BackgroundTransparency = 0 end end)

					text1Button.MouseButton1Click:Connect(function() if newMt.Confirm then newMt:Confirm(chosenColor,text1) end end)
					text1Button.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then text1Button.BackgroundTransparency = 0.4 end end)
					text1Button.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then text1Button.BackgroundTransparency = 0 end end)

					text2Button.MouseButton1Click:Connect(function() if newMt.Confirm then newMt:Confirm(chosenColor,text2) end end)
					text2Button.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then text2Button.BackgroundTransparency = 0.4 end end)
					text2Button.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then text2Button.BackgroundTransparency = 0 end end)

					scrollButton.MouseButton1Click:Connect(function() if newMt.Confirm then newMt:Confirm(chosenColor,scroll) end end)
					scrollButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then scrollButton.BackgroundTransparency = 0.4 end end)
					scrollButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then scrollButton.BackgroundTransparency = 0 end end)

					cancelButton.MouseButton1Click:Connect(function() if newMt.Cancel then newMt:Cancel() end end)
					cancelButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then cancelButton.BackgroundTransparency = 0.4 end end)
					cancelButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then cancelButton.BackgroundTransparency = 0 end end)

					defaultButton.MouseButton1Click:Connect(function() if newMt.Default then newMt:Default() end end)
					defaultButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then defaultButton.BackgroundTransparency = 0.4 end end)
					defaultButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then defaultButton.BackgroundTransparency = 0 end end)

					pickerExit.MouseButton1Click:Connect(function()
						picker:TweenPosition(UDim2.new(0.5, -219, 0, -500), "InOut", "Quart", 0.5, true, nil)
					end)

					updateColor()

					newMt.SetColor = function(self,color)
						red,green,blue = color.r,color.g,color.b
						hue,sat,val = Color3.toHSV(color)
						updateColor()
					end

					return newMt
				end
			end

			picker:TweenPosition(UDim2.new(0.5, -219, 0, 100), "InOut", "Quart", 0.5, true, nil)

			local Npicker = ColorPicker.new()
			Npicker.Confirm = function(self,color,ctype) updateColors(color,ctype) wait() updatesaves() end
			Npicker.Cancel = function(self)
				updateColors(cache_currentShade1,shade1)
				updateColors(cache_currentShade2,shade2)
				updateColors(cache_currentShade3,shade3)
				updateColors(cache_currentText1,text1)
				updateColors(cache_currentText2,text2)
				updateColors(cache_currentScroll,scroll)
				wait()
				updatesaves()
			end
			Npicker.Default = function(self)
				updateColors(Color3.fromRGB(36, 36, 37),shade1)
				updateColors(Color3.fromRGB(46, 46, 47),shade2)
				updateColors(Color3.fromRGB(78, 78, 79),shade3)
				updateColors(Color3.new(1, 1, 1),text1)
				updateColors(Color3.new(0, 0, 0),text2)
				updateColors(Color3.fromRGB(78,78,79),scroll)
				wait()
				updatesaves()
			end
		else
			picker:TweenPosition(UDim2.new(0.5, -219, 0, 100), "InOut", "Quart", 0.5, true, nil)
		end
	end)


	SettingsButton.MouseButton1Click:Connect(function()
		if SettingsOpen == false then SettingsOpen = true
			Settings:TweenPosition(UDim2.new(0, 0, 0, 45), "InOut", "Quart", 0.5, true, nil)
			CMDsF.Visible = false
		else SettingsOpen = false
			CMDsF.Visible = true
			Settings:TweenPosition(UDim2.new(0, 0, 0, 220), "InOut", "Quart", 0.5, true, nil)
		end
	end)

	On.MouseButton1Click:Connect(function()
		if isHidden == false then
			if StayOpen == false then
				StayOpen = true
				On.BackgroundTransparency = 0
			else
				StayOpen = false
				On.BackgroundTransparency = 1
			end
			updatesaves()
		end
	end)

	Clear.MouseButton1Down:Connect(function()
		for _, child in pairs(scroll_2:GetChildren()) do
			child:Destroy()
		end
		scroll_2.CanvasSize = UDim2.new(0, 0, 0, 10)
	end)

	Clear_2.MouseButton1Down:Connect(function()
		for _, child in pairs(scroll_3:GetChildren()) do
			child:Destroy()
		end
		scroll_3.CanvasSize = UDim2.new(0, 0, 0, 10)
	end)

	Toggle.MouseButton1Down:Connect(function()
		if logsEnabled then
			logsEnabled = false
			Toggle.Text = 'Disabled'
			updatesaves()
		else
			logsEnabled = true
			Toggle.Text = 'Enabled'
			updatesaves()
		end
	end)

	Toggle_2.MouseButton1Down:Connect(function()
		if jLogsEnabled then
			jLogsEnabled = false
			Toggle_2.Text = 'Disabled'
			updatesaves()
		else
			jLogsEnabled = true
			Toggle_2.Text = 'Enabled'
			updatesaves()
		end
	end)

	selectChat.MouseButton1Down:Connect(function()
		join.Visible = false
		chat.Visible = true
		table.remove(shade3,table.find(shade3,selectChat))
		table.remove(shade2,table.find(shade2,selectJoin))
		table.insert(shade2,selectChat)
		table.insert(shade3,selectJoin)
		selectJoin.BackgroundColor3 = currentShade3
		selectChat.BackgroundColor3 = currentShade2
	end)

	selectJoin.MouseButton1Down:Connect(function()
		chat.Visible = false
		join.Visible = true	
		table.remove(shade3,table.find(shade3,selectJoin))
		table.remove(shade2,table.find(shade2,selectChat))
		table.insert(shade2,selectJoin)
		table.insert(shade3,selectChat)
		selectChat.BackgroundColor3 = currentShade3
		selectJoin.BackgroundColor3 = currentShade2
	end)

	if not writefileExploit() then
		notify("Saves", "Your exploit does not support read/write file. Your settings will not save.")
	end

	ChatLog = function(plr)
		plr.Chatted:Connect(function(Message)
			if logsEnabled == true then
				CreateLabel(plr.Name,Message)
			end
		end)
	end

	JoinLog = function(plr)
		if jLogsEnabled == true then
			CreateJoinLabel(plr,plr.UserId)
		end
	end

	CleanFileName = function(name)
		return tostring(name):gsub("[*\\?:<>|]+", ""):sub(1, 175)
	end

	SaveChatlogs.MouseButton1Down:Connect(function()
		if writefileExploit() then
			if #scroll_2:GetChildren() > 0 then
				notify("Loading",'Hold on a sec')
				local placeName = CleanFileName(MarketplaceService:GetProductInfo(PlaceId).Name)
				local writelogs = '-- Infinite Yield Chat logs for "'..placeName..'"\n'
				for _, child in pairs(scroll_2:GetChildren()) do
					writelogs = writelogs..'\n'..child.Text
				end
				local writelogsFile = tostring(writelogs)
				local fileext = 0
				local function nameFile()
					local file
					pcall(function() file = readfile(placeName..' Chat Logs ('..fileext..').txt') end)
					if file then
						fileext = fileext+1
						nameFile()
					else
						writefileCooldown(placeName..' Chat Logs ('..fileext..').txt', writelogsFile)
					end
				end
				nameFile()
				notify('Chat Logs','Saved chat logs to the workspace folder within your exploit folder.')
			end
		else
			notify('Chat Logs','Your exploit does not support write file. You cannot save chat logs.')
		end
	end)

	for _, plr in pairs(Players:GetPlayers()) do
			ChatLog(plr)
	end

	Players.PlayerRemoving:Connect(function(player)
		if ESPenabled or CHMSenabled or COREGUI:FindFirstChild(player.Name..'_LC') then
			for i,v in pairs(COREGUI:GetChildren()) do
				if v.Name == player.Name..'_ESP' or v.Name == player.Name..'_LC' or v.Name == player.Name..'_CHMS' then
					v:Destroy()
				end
			end
		end
		if viewing ~= nil and player == viewing then
			workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character
			viewing = nil
			if viewDied then
				viewDied:Disconnect()
				viewChanged:Disconnect()
			end
			notify('Spectate','View turned off (player left)')
		end
		eventEditor.FireEvent("OnLeave", player.Name)
	end)

	Exit.MouseButton1Down:Connect(function()
		logs:TweenPosition(UDim2.new(0, 0, 1, 10), "InOut", "Quart", 0.3, true, nil)
	end)

	Hide.MouseButton1Down:Connect(function()
		if logs.Position ~= UDim2.new(0, 0, 1, -20) then
			logs:TweenPosition(UDim2.new(0, 0, 1, -20), "InOut", "Quart", 0.3, true, nil)
		else
			logs:TweenPosition(UDim2.new(0, 0, 1, -265), "InOut", "Quart", 0.3, true, nil)
		end
	end)

	EventBind.MouseButton1Click:Connect(function()
		eventEditor.Frame:TweenPosition(UDim2.new(0.5,-175,0.5,-101), "InOut", "Quart", 0.5, true, nil)
	end)

	Keybinds.MouseButton1Click:Connect(function()
		KeybindsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
	end)

	Close.MouseButton1Click:Connect(function()
		SettingsHolder.Visible = true
		KeybindsFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
	end)

	Keybinds.MouseButton1Click:Connect(function()
		KeybindsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
	end)

	Add.MouseButton1Click:Connect(function()
		KeybindEditor:TweenPosition(UDim2.new(0.5, -180, 0, 260), "InOut", "Quart", 0.5, true, nil)
	end)

	Delete.MouseButton1Click:Connect(function()
		binds = {}
		refreshbinds()
		updatesaves()
		notify('Keybinds Updated','Removed all keybinds')
	end)

	Close_2.MouseButton1Click:Connect(function()
		SettingsHolder.Visible = true
		AliasesFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
	end)

	Aliases.MouseButton1Click:Connect(function()
		AliasesFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
	end)

	Close_3.MouseButton1Click:Connect(function()
		SettingsHolder.Visible = true
		PositionsFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
	end)

	Positions.MouseButton1Click:Connect(function()
		PositionsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
	end)

	local selectionBox = Instance.new("SelectionBox")
	selectionBox.Name = randomString()
	selectionBox.Color3 = Color3.new(255,255,255)
	selectionBox.Adornee = nil
	selectionBox.Parent = PARENT

	local selected = Instance.new("SelectionBox")
	selected.Name = randomString()
	selected.Color3 = Color3.new(0,166,0)
	selected.Adornee = nil
	selected.Parent = PARENT

	local ActivateHighlight = nil
	local ClickSelect = nil
	function selectPart()
		ToPartFrame:TweenPosition(UDim2.new(0.5, -180, 0, 335), "InOut", "Quart", 0.5, true, nil)
		local function HighlightPart()
			if selected.Adornee ~= IYMouse.Target then
				selectionBox.Adornee = IYMouse.Target
			else
				selectionBox.Adornee = nil
			end
		end
		ActivateHighlight = IYMouse.Move:Connect(HighlightPart)
		local function SelectPart()
			if IYMouse.Target ~= nil then
				selected.Adornee = IYMouse.Target
				Path.Text = getHierarchy(IYMouse.Target)
			end
		end
		ClickSelect = IYMouse.Button1Down:Connect(SelectPart)
	end

	Part.MouseButton1Click:Connect(function()
		selectPart()
	end)
	Exit_4.MouseButton1Click:Connect(function()
		ToPartFrame:TweenPosition(UDim2.new(0.5, -180, 0, -500), "InOut", "Quart", 0.5, true, nil)
		if ActivateHighlight then
			ActivateHighlight:Disconnect()
		end
		if ClickSelect then
			ClickSelect:Disconnect()
		end
		selectionBox.Adornee = nil
		selected.Adornee = nil
		Path.Text = ""
	end)

	CopyPath.MouseButton1Click:Connect(function()
		if Path.Text ~= "" then
			toClipboard(Path.Text)
		else
			notify('Copy Path','Select a part to copy its path')
		end
	end)

	ChoosePart.MouseButton1Click:Connect(function()
		if Path.Text ~= "" then
			local tpNameExt = ''
			local function handleWpNames()
				local FoundDupe = false
				for i,v in pairs(pWayPoints) do
					if v.NAME:lower() == selected.Adornee.Name:lower()..tpNameExt then
						FoundDupe = true
					end
				end
				if not FoundDupe then
					notify('Modified Waypoints',"Created waypoint: "..selected.Adornee.Name..tpNameExt)
					pWayPoints[#pWayPoints + 1] = {NAME = selected.Adornee.Name..tpNameExt, COORD = {selected.Adornee}}
				else
					if isNumber(tpNameExt) then
						tpNameExt = tpNameExt+1
					else
						tpNameExt = 1
					end
					handleWpNames()
				end
			end
			handleWpNames()
			refreshwaypoints()
		else
			notify('Part Selection','Select a part first')
		end
	end)

	cmds={}
	customAlias = {}
	Delete_3.MouseButton1Click:Connect(function()
		customAlias = {}
		aliases = {}
		notify('Aliases Modified','Removed all aliases')
		updatesaves()
		refreshaliases()
	end)

	PrefixBox:GetPropertyChangedSignal("Text"):Connect(function()
		prefix = PrefixBox.Text
		Cmdbar.PlaceholderText = "Command Bar ("..prefix..")"
		updatesaves()
	end)

	function CamViewport()
		if workspace.CurrentCamera then
			return workspace.CurrentCamera.ViewportSize.X
		end
	end

	function UpdateToViewport()
		if Holder.Position.X.Offset < -CamViewport() then
			Holder:TweenPosition(UDim2.new(1, -CamViewport(), Holder.Position.Y.Scale, Holder.Position.Y.Offset), "InOut", "Quart", 0.04, true, nil)
			Notification:TweenPosition(UDim2.new(1, -CamViewport() + 250, Notification.Position.Y.Scale, Notification.Position.Y.Offset), "InOut", "Quart", 0.04, true, nil)
		end
	end
	CameraChanged = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateToViewport)

	function updateCamera(child, parent)
		if parent ~= workspace then
			CamMoved:Disconnect()
			CameraChanged:Disconnect()
			repeat wait() until workspace.CurrentCamera
			CameraChanged = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateToViewport)
			CamMoved = workspace.CurrentCamera.AncestryChanged:Connect(updateCamera)
		end
	end
	CamMoved = workspace.CurrentCamera.AncestryChanged:Connect(updateCamera)

	function dragMain(dragpoint,gui)
		task.spawn(function()
			local dragging
			local dragInput
			local dragStart = Vector3.new(0,0,0)
			local startPos
			local function update(input)
				local pos = -250
				local delta = input.Position - dragStart
				if startPos.X.Offset + delta.X <= -500 then
					local Position = UDim2.new(1, -250, Notification.Position.Y.Scale, Notification.Position.Y.Offset)
					TweenService:Create(Notification, TweenInfo.new(.20), {Position = Position}):Play()
					pos = 250
				else
					local Position = UDim2.new(1, -500, Notification.Position.Y.Scale, Notification.Position.Y.Offset)
					TweenService:Create(Notification, TweenInfo.new(.20), {Position = Position}):Play()
					pos = -250
				end
				if startPos.X.Offset + delta.X <= -250 and -CamViewport() <= startPos.X.Offset + delta.X then
					local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, gui.Position.Y.Scale, gui.Position.Y.Offset)
					TweenService:Create(gui, TweenInfo.new(.20), {Position = Position}):Play()
					local Position2 = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X + pos, Notification.Position.Y.Scale, Notification.Position.Y.Offset)
					TweenService:Create(Notification, TweenInfo.new(.20), {Position = Position2}):Play()
				elseif startPos.X.Offset + delta.X > -500 then
					local Position = UDim2.new(1, -250, gui.Position.Y.Scale, gui.Position.Y.Offset)
					TweenService:Create(gui, TweenInfo.new(.20), {Position = Position}):Play()
				elseif -CamViewport() > startPos.X.Offset + delta.X then
					gui:TweenPosition(UDim2.new(1, -CamViewport(), gui.Position.Y.Scale, gui.Position.Y.Offset), "InOut", "Quart", 0.04, true, nil)
					local Position = UDim2.new(1, -CamViewport(), gui.Position.Y.Scale, gui.Position.Y.Offset)
					TweenService:Create(gui, TweenInfo.new(.20), {Position = Position}):Play()
					local Position2 = UDim2.new(1, -CamViewport() + 250, Notification.Position.Y.Scale, Notification.Position.Y.Offset)
					TweenService:Create(Notification, TweenInfo.new(.20), {Position = Position2}):Play()
				end
			end
			dragpoint.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)
			dragpoint.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					update(input)
				end
			end)
		end)
	end

	dragMain(Title,Holder)

	Match = function(name,str)
		str = str:gsub("%W", "%%%1")
		return name:lower():find(str:lower()) and true
	end

	local canvasPos = Vector2.new(0,0)
	local topCommand = nil
	IndexContents = function(str,bool,cmdbar,Ianim)
		CMDsF.CanvasPosition = Vector2.new(0,0)
		local SizeY = 0
		local indexnum = 0
		local frame = CMDsF
		topCommand = nil
		local chunks = {}
		if str:sub(#str,#str) == "\\" then str = "" end
		for w in string.gmatch(str,"[^\\]+") do
			table.insert(chunks,w)
		end
		if #chunks > 0 then str = chunks[#chunks] end
		if str:sub(1,1) == "!" then str = str:sub(2) end
		for i,v in next, frame:GetChildren() do
			if v:IsA("TextButton") then
				if bool then
					if Match(v.Text,str) then
						indexnum = indexnum + 1
						v.Visible = true
						if topCommand == nil then
							topCommand = v.Text
						end
					else
						v.Visible = false
					end
				else
					v.Visible = true
					if topCommand == nil then
						topCommand = v.Text
					end
				end
			end
		end
		frame.CanvasSize = UDim2.new(0,0,0,cmdListLayout.AbsoluteContentSize.Y)
		if not Ianim then
			if indexnum == 0 or string.find(str, " ") then
				if not cmdbar then
					minimizeHolder()
				elseif cmdbar then
					cmdbarHolder()
				end
			else
				maximizeHolder()
			end
		else
			minimizeHolder()
		end
	end

	task.spawn(function()
		if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then return end
		local chatbox
		local success, result = pcall(function() chatbox = game.WaitForChild(PlayerGui, "Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar end)
		if success then
			local function chatboxFocused()
				canvasPos = CMDsF.CanvasPosition
			end
			local chatboxFocusedC = chatbox.Focused:Connect(chatboxFocused)

			local function Index()
				if chatbox.Text:lower():sub(1,1) == prefix then
					if SettingsOpen == true then
						wait(0.2)
						CMDsF.Visible = true
						Settings:TweenPosition(UDim2.new(0, 0, 0, 220), "InOut", "Quart", 0.2, true, nil)
					end
					IndexContents(PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar.Text:lower():sub(2),true)
				else
					minimizeHolder()
					if SettingsOpen == true then
						wait(0.2)
						Settings:TweenPosition(UDim2.new(0, 0, 0, 45), "InOut", "Quart", 0.2, true, nil)
						CMDsF.Visible = false
					end
				end
			end
			local chatboxFunc = chatbox:GetPropertyChangedSignal("Text"):Connect(Index)

			local function chatboxFocusLost(enterpressed)
				if not enterpressed or chatbox.Text:lower():sub(1,1) ~= prefix then
					IndexContents('',true)
				end
				CMDsF.CanvasPosition = canvasPos
				minimizeHolder()
			end
			local chatboxFocusLostC = chatbox.FocusLost:Connect(chatboxFocusLost)

			PlayerGui:WaitForChild("Chat").Frame.ChatBarParentFrame.ChildAdded:Connect(function(newbar)
				wait()
				if newbar:FindFirstChild('BoxFrame') then
					chatbox = PlayerGui:WaitForChild("Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
					if chatboxFocusedC then chatboxFocusedC:Disconnect() end
					chatboxFocusedC = chatbox.Focused:Connect(chatboxFocused)
					if chatboxFunc then chatboxFunc:Disconnect() end
					chatboxFunc = chatbox:GetPropertyChangedSignal("Text"):Connect(Index)
					if chatboxFocusLostC then chatboxFocusLostC:Disconnect() end
					chatboxFocusLostC = chatbox.FocusLost:Connect(chatboxFocusLost)
				end
			end)
			--else
			--print('Custom chat detected. Will not provide suggestions for commands typed in the chat.')
		end
	end)

	function autoComplete(str,curText)
		local endingChar = {"[", "/", "(", " "}
		local stop = 0
		for i=1,#str do
			local c = str:sub(i,i)
			if table.find(endingChar, c) then
				stop = i
				break
			end
		end
		curText = curText or Cmdbar.Text
		local subPos = 0
		local pos = 1
		local findRes = string.find(curText,"\\",pos)
		while findRes do
			subPos = findRes
			pos = findRes+1
			findRes = string.find(curText,"\\",pos)
		end
		if curText:sub(subPos+1,subPos+1) == "!" then subPos = subPos + 1 end
		Cmdbar.Text = curText:sub(1,subPos) .. str:sub(1, stop - 1)..' '
		wait()
		Cmdbar.Text = Cmdbar.Text:gsub( '\t', '' )
		Cmdbar.CursorPosition = #Cmdbar.Text+1--1020
	end

	CMDs = {}
	CMDs[#CMDs + 1] = {NAME = 'discord / support / help', DESC = 'Invite to the Infinite Yield support server.'}
	CMDs[#CMDs + 1] = {NAME = 'console', DESC = 'Loads old Roblox console'}
	CMDs[#CMDs + 1] = {NAME = 'explorer / dex', DESC = 'Opens DEX by Moon'}
	CMDs[#CMDs + 1] = {NAME = 'olddex / odex', DESC = 'Opens Old DEX by Moon'}
	CMDs[#CMDs + 1] = {NAME = 'remotespy / rspy', DESC = 'Opens Simple Spy V3'}
	CMDs[#CMDs + 1] = {NAME = 'audiologger / alogger', DESC = 'Opens Edges audio logger'}
	CMDs[#CMDs + 1] = {NAME = 'serverinfo / info', DESC = 'Gives you info about the server'}
	CMDs[#CMDs + 1] = {NAME = 'jobid', DESC = 'Copies the games JobId to your clipboard'}
	CMDs[#CMDs + 1] = {NAME = 'notifyjobid', DESC = 'Notifies you the games JobId'}
	CMDs[#CMDs + 1] = {NAME = 'rejoin / rj', DESC = 'Makes you rejoin the game'}
	CMDs[#CMDs + 1] = {NAME = 'autorejoin / autorj', DESC = 'Automatically rejoins the server if you get kicked/disconnected'}
	CMDs[#CMDs + 1] = {NAME = 'serverhop / shop', DESC = 'Teleports you to a different server'}
	CMDs[#CMDs + 1] = {NAME = 'joinplayer [username / ID] [place ID]', DESC = 'Joins a specific players server'}
	CMDs[#CMDs + 1] = {NAME = 'gameteleport / gametp [place ID]', DESC = 'Joins a game by ID'}
	CMDs[#CMDs + 1] = {NAME = 'antiidle / antiafk', DESC = 'Prevents the game from kicking you for being idle/afk'}
	CMDs[#CMDs + 1] = {NAME = 'datalimit [num]', DESC = 'Set outgoing KBPS limit'}
	CMDs[#CMDs + 1] = {NAME = 'replicationlag / backtrack [num]', DESC = 'Set IncomingReplicationLag'}
	CMDs[#CMDs + 1] = {NAME = 'creatorid / creator', DESC = 'Notifies you the creators ID'}
	CMDs[#CMDs + 1] = {NAME = 'copycreatorid / copycreator', DESC = 'Copies the creators ID to your clipboard'}
	CMDs[#CMDs + 1] = {NAME = 'setcreatorid / setcreator', DESC = 'Sets your userid to the creators ID'}
	CMDs[#CMDs + 1] = {NAME = 'noprompts', DESC = 'Prevents the game from showing you purchase/premium prompts'}
	CMDs[#CMDs + 1] = {NAME = 'showprompts', DESC = 'Allows the game to show purchase/premium prompts again'}
	CMDs[#CMDs + 1] = {NAME = 'enable [inventory/playerlist/chat/reset/emotes/all]', DESC = 'Toggles visibility of coregui items'}
	CMDs[#CMDs + 1] = {NAME = 'disable [inventory/playerlist/chat/reset/emotes/all]', DESC = 'Toggles visibility of coregui items'}
	CMDs[#CMDs + 1] = {NAME = 'showguis', DESC = 'Shows any invisible GUIs'}
	CMDs[#CMDs + 1] = {NAME = 'unshowguis', DESC = 'Undoes showguis'}
	CMDs[#CMDs + 1] = {NAME = 'hideguis', DESC = 'Hides any GUIs in PlayerGui'}
	CMDs[#CMDs + 1] = {NAME = 'unhideguis', DESC = 'Undoes hideguis'}
	CMDs[#CMDs + 1] = {NAME = 'guidelete', DESC = 'Enables backspace to delete GUI'}
	CMDs[#CMDs + 1] = {NAME = 'unguidelete / noguidelete', DESC = 'Disables guidelete'}
	CMDs[#CMDs + 1] = {NAME = 'hideiy', DESC = 'Hides the main IY GUI'}
	CMDs[#CMDs + 1] = {NAME = 'showiy / unhideiy', DESC = 'Shows IY again'}
	CMDs[#CMDs + 1] = {NAME = 'keepiy', DESC = 'Auto execute IY when you teleport through servers'}
	CMDs[#CMDs + 1] = {NAME = 'unkeepiy', DESC = 'Disable keepiy'}
	CMDs[#CMDs + 1] = {NAME = 'togglekeepiy', DESC = 'Toggle keepiy'}
	CMDs[#CMDs + 1] = {NAME = 'savegame / saveplace', DESC = 'Uses saveinstance to save the game'}
	CMDs[#CMDs + 1] = {NAME = 'clearerror', DESC = 'Clears the annoying box and blur when a game kicks you'}
	CMDs[#CMDs + 1] = {NAME = 'clientantikick / antikick (CLIENT)', DESC = 'Prevents localscripts from kicking you'}
	CMDs[#CMDs + 1] = {NAME = 'clientantiteleport / antiteleport (CLIENT)', DESC = 'Prevents localscripts from teleporting you'}
	CMDs[#CMDs + 1] = {NAME = 'allowrejoin / allowrj [true/false] (CLIENT)', DESC = 'Changes if antiteleport allows you to rejoin or not'}
	CMDs[#CMDs + 1] = {NAME = 'cancelteleport / canceltp', DESC = 'Cancels teleports in progress'}
	CMDs[#CMDs + 1] = {NAME = 'volume / vol [0-10]', DESC = 'Adjusts your game volume on a scale of 0 to 10'}
	CMDs[#CMDs + 1] = {NAME = 'antilag / boostfps / lowgraphics', DESC = 'Lowers game quality to boost FPS'}
	CMDs[#CMDs + 1] = {NAME = 'record / rec', DESC = 'Starts roblox recorder'}
	CMDs[#CMDs + 1] = {NAME = 'screenshot / scrnshot', DESC = 'Takes a screenshot'}
	CMDs[#CMDs + 1] = {NAME = 'togglefullscreen / togglefs', DESC = 'Toggles fullscreen'}
	CMDs[#CMDs + 1] = {NAME = 'notify [text]', DESC = 'Sends you a notification with the provided text'}
	CMDs[#CMDs + 1] = {NAME = 'lastcommand / lastcmd', DESC = 'Executes the previous command used'}
	CMDs[#CMDs + 1] = {NAME = 'exit', DESC = 'Kills roblox process'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'noclip', DESC = 'Go through objects'}
	CMDs[#CMDs + 1] = {NAME = 'unnoclip / clip', DESC = 'Disables noclip'}
	CMDs[#CMDs + 1] = {NAME = 'fly [speed]', DESC = 'Makes you fly'}
	CMDs[#CMDs + 1] = {NAME = 'unfly', DESC = 'Disables fly'}
	CMDs[#CMDs + 1] = {NAME = 'flyspeed [num]', DESC = 'Set fly speed (default is 20)'}
	CMDs[#CMDs + 1] = {NAME = 'vehiclefly / vfly [speed]', DESC = 'Makes you fly in a vehicle'}
	CMDs[#CMDs + 1] = {NAME = 'unvehiclefly / unvfly', DESC = 'Disables vehicle fly'}
	CMDs[#CMDs + 1] = {NAME = 'vehicleflyspeed  / vflyspeed [num]', DESC = 'Set vehicle fly speed'}
	CMDs[#CMDs + 1] = {NAME = 'cframefly / cfly [speed]', DESC = 'Makes you fly, bypassing some anti cheats (works on mobile)'}
	CMDs[#CMDs + 1] = {NAME = 'uncframefly / uncfly', DESC = 'Disables cfly'}
	CMDs[#CMDs + 1] = {NAME = 'cframeflyspeed  / cflyspeed [num]', DESC = 'Sets cfly speed'}
	CMDs[#CMDs + 1] = {NAME = 'qefly [true / false]', DESC = 'enables or disables the Q and E hotkeys for fly'}
	CMDs[#CMDs + 1] = {NAME = 'vehiclenoclip / vnoclip', DESC = 'Turns off vehicle collision'}
	CMDs[#CMDs + 1] = {NAME = 'vehicleclip / vclip / unvnoclip', DESC = 'Enables vehicle collision'}
	CMDs[#CMDs + 1] = {NAME = 'float /  platform', DESC = 'Spawns a platform beneath you causing you to float'}
	CMDs[#CMDs + 1] = {NAME = 'unfloat / noplatform', DESC = 'Removes the platform'}
	CMDs[#CMDs + 1] = {NAME = 'swim', DESC = 'Allows you to swim in the air'}
	CMDs[#CMDs + 1] = {NAME = 'unswim / noswim', DESC = 'Stops you from swimming everywhere'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'setwaypoint / swp [name]', DESC = 'Sets a waypoint at your position'}
	CMDs[#CMDs + 1] = {NAME = 'waypointpos / wpp [name] [X Y Z]', DESC = 'Sets a waypoint with specified coordinates'}
	CMDs[#CMDs + 1] = {NAME = 'waypoints', DESC = 'Shows a list of currently active waypoints'}
	CMDs[#CMDs + 1] = {NAME = 'showwaypoints / showwp', DESC = 'Shows all currently set waypoints'}
	CMDs[#CMDs + 1] = {NAME = 'hidewaypoints / hidewp', DESC = 'Hides shown waypoints'}
	CMDs[#CMDs + 1] = {NAME = 'waypoint / wp [name]', DESC = 'Teleports player to a waypoint'}
	CMDs[#CMDs + 1] = {NAME = 'tweenwaypoint / twp [name]', DESC = 'Tweens player to a waypoint'}
	CMDs[#CMDs + 1] = {NAME = 'walktowaypoint / wtwp [name]', DESC = 'Walks player to a waypoint'}
	CMDs[#CMDs + 1] = {NAME = 'deletewaypoint / dwp [name]', DESC = 'Deletes a waypoint'}
	CMDs[#CMDs + 1] = {NAME = 'clearwaypoints / cwp', DESC = 'Clears all waypoints'}
	CMDs[#CMDs + 1] = {NAME = 'cleargamewaypoints / cgamewp', DESC = 'Clears all waypoints for the game you are in'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'goto [player]', DESC = 'Go to a player'}
	CMDs[#CMDs + 1] = {NAME = 'tweengoto / tgoto [player]', DESC = 'Tween to a player (bypasses some anti cheats)'}
	CMDs[#CMDs + 1] = {NAME = 'tweenspeed / tspeed [num]', DESC = 'Sets how fast all tween commands go (default is 1)'}
	CMDs[#CMDs + 1] = {NAME = 'vehiclegoto / vgoto [player]', DESC = 'Go to a player while in a vehicle'}
	CMDs[#CMDs + 1] = {NAME = 'loopgoto [player] [distance] [delay]', DESC = 'Loop teleport to a player'}
	CMDs[#CMDs + 1] = {NAME = 'unloopgoto', DESC = 'Stops teleporting you to a player'}
	CMDs[#CMDs + 1] = {NAME = 'pulsetp / ptp [player] [seconds]', DESC = 'Teleports you to a player for a specified ammount of time'}
	CMDs[#CMDs + 1] = {NAME = 'clientbring / cbring [player] (CLIENT)', DESC = 'Bring a player'}
	CMDs[#CMDs + 1] = {NAME = 'loopbring [player] [distance] [delay] (CLIENT)', DESC = 'Loop brings a player to you (useful for killing)'}
	CMDs[#CMDs + 1] = {NAME = 'unloopbring [player]', DESC = 'Undoes loopbring'}
	CMDs[#CMDs + 1] = {NAME = 'freeze / fr [player] (CLIENT)', DESC = 'Freezes a player'}
	CMDs[#CMDs + 1] = {NAME = 'freezeanims', DESC = 'Freezes your animations / pauses your animations - Does not work on default animations'}
	CMDs[#CMDs + 1] = {NAME = 'unfreezeanims', DESC = 'Unfreezes your animations / plays your animations'}
	CMDs[#CMDs + 1] = {NAME = 'thaw / unfr [player] (CLIENT)', DESC = 'Unfreezes a player'}
	CMDs[#CMDs + 1] = {NAME = 'tpposition / tppos [X Y Z]', DESC = 'Teleports you to certain coordinates'}
	CMDs[#CMDs + 1] = {NAME = 'tweentpposition / ttppos [X Y Z]', DESC = 'Tween to coordinates (bypasses some anti cheats)'}
	CMDs[#CMDs + 1] = {NAME = 'offset [X Y Z]', DESC = 'Offsets you by certain coordinates'}
	CMDs[#CMDs + 1] = {NAME = 'tweenoffset / toffset [X Y Z]', DESC = 'Tween offset (bypasses some anti cheats)'}
	CMDs[#CMDs + 1] = {NAME = 'notifyposition / notifypos [player]', DESC = 'Notifies you the coordinates of a character'}
	CMDs[#CMDs + 1] = {NAME = 'copyposition / copypos [player]', DESC = 'Copies the coordinates of a character to your clipboard'}
	CMDs[#CMDs + 1] = {NAME = 'walktoposition / walktopos [X Y Z]', DESC = 'Makes you walk to a coordinate'}
	CMDs[#CMDs + 1] = {NAME = 'spawnpoint / spawn [delay]', DESC = 'Sets a position where you will spawn'}
	CMDs[#CMDs + 1] = {NAME = 'nospawnpoint / nospawn', DESC = 'Removes your custom spawn point'}
	CMDs[#CMDs + 1] = {NAME = 'flashback / diedtp', DESC = 'Teleports you to where you last died'}
	CMDs[#CMDs + 1] = {NAME = 'walltp', DESC = 'Teleports you above/over any wall you run into'}
	CMDs[#CMDs + 1] = {NAME = 'nowalltp / unwalltp', DESC = 'Disables walltp'}
	CMDs[#CMDs + 1] = {NAME = 'teleporttool / tptool', DESC = 'Gives you a teleport tool'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'logs', DESC = 'Opens the logs GUI'}
	CMDs[#CMDs + 1] = {NAME = 'chatlogs / clogs', DESC = 'Log what people say or whisper'}
	CMDs[#CMDs + 1] = {NAME = 'joinlogs / jlogs', DESC = 'Log when people join'}
	CMDs[#CMDs + 1] = {NAME = 'chat / say [text]', DESC = 'Makes you chat a string (possible mute bypass)'}
	CMDs[#CMDs + 1] = {NAME = 'spam [text]', DESC = 'Makes you spam the chat'}
	CMDs[#CMDs + 1] = {NAME = 'unspam', DESC = 'Turns off spam'}
	CMDs[#CMDs + 1] = {NAME = 'whisper / pm [player] [text]', DESC = 'Makes you whisper a string to someone (possible mute bypass)'}
	CMDs[#CMDs + 1] = {NAME = 'pmspam [player] [text]', DESC = 'Makes you spam a players whispers'}
	CMDs[#CMDs + 1] = {NAME = 'unpmspam [player]', DESC = 'Turns off pm spam'}
	CMDs[#CMDs + 1] = {NAME = 'spamspeed [num]', DESC = 'How quickly you spam (default is 1)'}
	CMDs[#CMDs + 1] = {NAME = 'bubblechat (CLIENT)', DESC = 'Enables bubble chat for your client'}
	CMDs[#CMDs + 1] = {NAME = 'unbubblechat / nobubblechat', DESC = 'Disables the bubblechat command'}
	CMDs[#CMDs + 1] = {NAME = 'safechat', DESC = 'Enables safe chat'}
	CMDs[#CMDs + 1] = {NAME = 'nosafechat / disablesafechat', DESC = 'Disables safechat'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'esp', DESC = 'View all players and their status'}
	CMDs[#CMDs + 1] = {NAME = 'noesp / unesp', DESC = 'Removes esp'}
	CMDs[#CMDs + 1] = {NAME = 'esptransparency [number]', DESC = 'Changes the transparency of esp related commands'}
	CMDs[#CMDs + 1] = {NAME = 'partesp [part name]', DESC = 'Highlights a part'}
	CMDs[#CMDs + 1] = {NAME = 'unpartesp / nopartesp [part name]', DESC = 'removes partesp'}
	CMDs[#CMDs + 1] = {NAME = 'chams', DESC = 'ESP but without text in the way'}
	CMDs[#CMDs + 1] = {NAME = 'nochams / unchams', DESC = 'Removes chams'}
	CMDs[#CMDs + 1] = {NAME = 'locate [player]', DESC = 'View a single player and their status'}
	CMDs[#CMDs + 1] = {NAME = 'unlocate / nolocate [player]', DESC = 'Removes locate'}
	CMDs[#CMDs + 1] = {NAME = 'xray', DESC = 'Makes all parts in workspace transparent'}
	CMDs[#CMDs + 1] = {NAME = 'unxray / noxray', DESC = 'Restores transparency'}
	CMDs[#CMDs + 1] = {NAME = 'loopxray', DESC = 'Makes all parts in workspace transparent but looped'}
	CMDs[#CMDs + 1] = {NAME = 'unloopunxray', DESC = 'Unloops xray'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'spectate / view [player]', DESC = 'View a player'}
	CMDs[#CMDs + 1] = {NAME = 'viewpart / viewp [part name]', DESC = 'View a part'}
	CMDs[#CMDs + 1] = {NAME = 'unspectate / unview', DESC = 'Stops viewing player'}
	CMDs[#CMDs + 1] = {NAME = 'freecam / fc', DESC = 'Allows you to freely move camera around the game'}
	CMDs[#CMDs + 1] = {NAME = 'freecampos / fcpos [X Y Z]', DESC = 'Moves / opens freecam in a certain position'}
	CMDs[#CMDs + 1] = {NAME = 'freecamwaypoint / fcwp [name]', DESC = 'Moves / opens freecam to a waypoint'}
	CMDs[#CMDs + 1] = {NAME = 'freecamgoto / fcgoto / fctp [player]', DESC = 'Moves / opens freecam to a player'}
	CMDs[#CMDs + 1] = {NAME = 'unfreecam / unfc', DESC = 'Disables freecam'}
	CMDs[#CMDs + 1] = {NAME = 'freecamspeed / fcspeed [num]', DESC = 'Adjusts freecam speed (default is 1)'}
	CMDs[#CMDs + 1] = {NAME = 'notifyfreecamposition / notifyfcpos', DESC = 'Noitifies you your freecam coordinates'}
	CMDs[#CMDs + 1] = {NAME = 'copyfreecamposition / copyfcpos', DESC = 'Copies your freecam coordinates to your clipboard'}
	CMDs[#CMDs + 1] = {NAME = 'gotocamera / gotocam', DESC = 'Teleports you to the location of your camera'}
	CMDs[#CMDs + 1] = {NAME = 'tweengotocam / tgotocam', DESC = 'Tweens you to the location of your camera'}
	CMDs[#CMDs + 1] = {NAME = 'firstp', DESC = 'Forces camera to go into first person'}
	CMDs[#CMDs + 1] = {NAME = 'thirdp', DESC = 'Allows camera to go into third person'}
	CMDs[#CMDs + 1] = {NAME = 'noclipcam / nccam', DESC = 'Allows camera to go through objects like walls'}
	CMDs[#CMDs + 1] = {NAME = 'maxzoom [num]', DESC = 'Maximum camera zoom'}
	CMDs[#CMDs + 1] = {NAME = 'minzoom [num]', DESC = 'Minimum camera zoom'}
	CMDs[#CMDs + 1] = {NAME = 'camdistance [num]', DESC = 'Changes camera distance from your player'}
	CMDs[#CMDs + 1] = {NAME = 'fov [num]', DESC = 'Adjusts field of view (default is 70)'}
	CMDs[#CMDs + 1] = {NAME = 'fixcam / restorecam', DESC = 'Fixes camera'}
	CMDs[#CMDs + 1] = {NAME = 'enableshiftlock / enablesl', DESC = 'Enables the shift lock option'}
	CMDs[#CMDs + 1] = {NAME = 'lookat [player]', DESC = 'Moves your camera view to a player'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'btools (CLIENT)', DESC = 'Gives you building tools (DOES NOT REPLICATE)'}
	CMDs[#CMDs + 1] = {NAME = 'f3x (CLIENT)', DESC = 'Gives you F3X building tools (DOES NOT REPLICATE)'}
	CMDs[#CMDs + 1] = {NAME = 'partname / partpath', DESC = 'Allows you to click a part to see its path & name'}
	CMDs[#CMDs + 1] = {NAME = 'delete [instance name] (CLIENT)', DESC = 'Removes any part with a certain name from the workspace (DOES NOT REPLICATE)'}
	CMDs[#CMDs + 1] = {NAME = 'deleteclass / dc [class name] (CLIENT)', DESC = 'Removes any part with a certain classname from the workspace (DOES NOT REPLICATE)'}
	CMDs[#CMDs + 1] = {NAME = 'lockworkspace / lockws', DESC = 'Locks the whole workspace'}
	CMDs[#CMDs + 1] = {NAME = 'unlockworkspace / unlockws', DESC = 'Unlocks the whole workspace'}
	CMDs[#CMDs + 1] = {NAME = 'invisibleparts / invisparts (CLIENT)', DESC = 'Shows invisible parts'}
	CMDs[#CMDs + 1] = {NAME = 'uninvisibleparts / uninvisparts (CLIENT)', DESC = 'Makes parts affected by invisparts return to normal'}
	CMDs[#CMDs + 1] = {NAME = 'deleteinvisparts / dip (CLIENT)', DESC = 'Deletes invisible parts'}
	CMDs[#CMDs + 1] = {NAME = 'gotopart [part name]', DESC = 'Moves your character to a part or multiple parts'}
	CMDs[#CMDs + 1] = {NAME = 'tweengotopart / tgotopart [part name]', DESC = 'Tweens your character to a part or multiple parts'}
	CMDs[#CMDs + 1] = {NAME = 'gotopartclass / gpc [class name]', DESC = 'Moves your character to a part or multiple parts based on classname'}
	CMDs[#CMDs + 1] = {NAME = 'tweengotopartclass / tgpc [class name]', DESC = 'Tweens your character to a part or multiple parts based on classname'}
	CMDs[#CMDs + 1] = {NAME = 'gotomodel [part name]', DESC = 'Moves your character to a model or multiple models'}
	CMDs[#CMDs + 1] = {NAME = 'tweengotomodel / tgotomodel [part name]', DESC = 'Tweens your character to a model or multiple models'}
	CMDs[#CMDs + 1] = {NAME = 'gotopartdelay / gotomodeldelay [num]', DESC = 'Adjusts how quickly you teleport to each part (default is 0.1)'}
	CMDs[#CMDs + 1] = {NAME = 'bringpart [part name] (CLIENT)', DESC = 'Moves a part or multiple parts to your character'}
	CMDs[#CMDs + 1] = {NAME = 'bringpartclass / bpc [class name] (CLIENT)', DESC = 'Moves a part or multiple parts to your character based on classname'}
	CMDs[#CMDs + 1] = {NAME = 'noclickdetectorlimits / nocdlimits', DESC = 'Sets all click detectors MaxActivationDistance to math.huge'}
	CMDs[#CMDs + 1] = {NAME = 'fireclickdetectors / firecd [name]', DESC = 'Uses all click detectors in a game or uses the optional name'}
	CMDs[#CMDs + 1] = {NAME = 'firetouchinterests / touchinterests [name]', DESC = 'Uses all touchinterests in a game or uses the optional name'}
	CMDs[#CMDs + 1] = {NAME = 'noproximitypromptlimits / nopplimits', DESC = 'Sets all proximity prompts MaxActivationDistance to math.huge'}
	CMDs[#CMDs + 1] = {NAME = 'fireproximityprompts / firepp [name]', DESC = 'Uses all proximity prompts in a game or uses the optional name'}
	CMDs[#CMDs + 1] = {NAME = 'instantproximityprompts / instantpp', DESC = 'Disable the cooldown for proximity prompts'}
	CMDs[#CMDs + 1] = {NAME = 'uninstantproximityprompts / uninstantpp', DESC = 'Undo the cooldown removal'}
	CMDs[#CMDs + 1] = {NAME = 'tpunanchored / tpua [player]', DESC = 'Teleports unanchored parts to a player'}
	CMDs[#CMDs + 1] = {NAME = 'animsunanchored / freezeua', DESC = 'Freezes unanchored parts'}
	CMDs[#CMDs + 1] = {NAME = 'thawunanchored / thawua / unfreezeua', DESC = 'Thaws unanchored parts'}
	CMDs[#CMDs + 1] = {NAME = 'removeterrain / rterrain / noterrain', DESC = 'Removes all terrain'}
	CMDs[#CMDs + 1] = {NAME = 'clearnilinstances / nonilinstances / cni', DESC = 'Removes nil instances'}
	CMDs[#CMDs + 1] = {NAME = 'destroyheight / dh [num]', DESC = 'Sets FallenPartsDestroyHeight'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'fullbright / fb (CLIENT)', DESC = 'Makes the map brighter / more visible'}
	CMDs[#CMDs + 1] = {NAME = 'loopfullbright / loopfb (CLIENT)', DESC = 'Makes the map brighter / more visible but looped'}
	CMDs[#CMDs + 1] = {NAME = 'unloopfullbright / unloopfb', DESC = 'Unloops fullbright'}
	CMDs[#CMDs + 1] = {NAME = 'ambient [num] [num] [num] (CLIENT)', DESC = 'Changes ambient'}
	CMDs[#CMDs + 1] = {NAME = 'day (CLIENT)', DESC = 'Changes the time to day for the client'}
	CMDs[#CMDs + 1] = {NAME = 'night (CLIENT)', DESC = 'Changes the time to night for the client'}
	CMDs[#CMDs + 1] = {NAME = 'nofog (CLIENT)', DESC = 'Removes fog'}
	CMDs[#CMDs + 1] = {NAME = 'brightness [num] (CLIENT)', DESC = 'Changes the brightness lighting property'}
	CMDs[#CMDs + 1] = {NAME = 'globalshadows / gshadows (CLIENT)', DESC = 'Enables global shadows'}
	CMDs[#CMDs + 1] = {NAME = 'noglobalshadows / nogshadows (CLIENT)', DESC = 'Disables global shadows'}
	CMDs[#CMDs + 1] = {NAME = 'restorelighting / rlighting', DESC = 'Restores Lighting properties'}
	CMDs[#CMDs + 1] = {NAME = 'light [radius] [brightness] (CLIENT)', DESC = 'Gives your player dynamic light'}
	CMDs[#CMDs + 1] = {NAME = 'nolight / unlight', DESC = 'Removes dynamic light from your player'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'inspect / examine [player]', DESC = 'Opens InspectMenu for a certain player'}
	CMDs[#CMDs + 1] = {NAME = 'age [player]', DESC = 'Tells you the age of a player'}
	CMDs[#CMDs + 1] = {NAME = 'chatage [player]', DESC = 'Chats the age of a player'}
	CMDs[#CMDs + 1] = {NAME = 'joindate / jd [player]', DESC = 'Tells you the date the player joined Roblox'}
	CMDs[#CMDs + 1] = {NAME = 'chatjoindate / cjd [player]', DESC = 'Chats the date the player joined Roblox'}
	CMDs[#CMDs + 1] = {NAME = 'copyname / copyuser [player]', DESC = 'Copies a players full username to your clipboard'}
	CMDs[#CMDs + 1] = {NAME = 'userid / id [player]', DESC = 'Notifies a players user ID'}
	CMDs[#CMDs + 1] = {NAME = 'copyuserid / copyid [player]', DESC = 'Copies a players user ID to your clipboard'}
	CMDs[#CMDs + 1] = {NAME = 'appearanceid / aid [player]', DESC = 'Notifies a players appearance ID'}
	CMDs[#CMDs + 1] = {NAME = 'copyappearanceid / caid [player]', DESC = 'Copies a players appearance ID to your clipboard'}
	CMDs[#CMDs + 1] = {NAME = 'bang [player] [speed]', DESC = 'owo'}
	CMDs[#CMDs + 1] = {NAME = 'unbang', DESC = 'uwu'}
	CMDs[#CMDs + 1] = {NAME = 'carpet [player]', DESC = 'Be someones carpet'}
	CMDs[#CMDs + 1] = {NAME = 'uncarpet', DESC = 'Undoes carpet'}
	CMDs[#CMDs + 1] = {NAME = 'friend [player]', DESC = 'Sends a friend request to certain players'}
	CMDs[#CMDs + 1] = {NAME = 'unfriend [player]', DESC = 'Unfriends certain players'}
	CMDs[#CMDs + 1] = {NAME = 'headsit [player]', DESC = 'Sit on a players head'}
	CMDs[#CMDs + 1] = {NAME = 'walkto / follow [player]', DESC = 'Follow a player'}
	CMDs[#CMDs + 1] = {NAME = 'pathfindwalkto / pathfindfollow [player]', DESC = 'Follow a player using pathfinding'}
	CMDs[#CMDs + 1] = {NAME = 'pathfindwalktowaypoint / pathfindwalktowp [waypoint]', DESC = 'Walk to a waypoint using pathfinding'}
	CMDs[#CMDs + 1] = {NAME = 'unwalkto / unfollow', DESC = 'Stops following a player'}
	CMDs[#CMDs + 1] = {NAME = 'orbit [player] [speed] [distance]', DESC = 'Makes your character orbit around a player with an optional speed and an optional distance'}
	CMDs[#CMDs + 1] = {NAME = 'unorbit', DESC = 'Disables orbit'}
	CMDs[#CMDs + 1] = {NAME = 'stareat / stare [player]', DESC = 'Stare / look at a player'}
	CMDs[#CMDs + 1] = {NAME = 'unstareat / unstare [player]', DESC = 'Disables stareat'}
	CMDs[#CMDs + 1] = {NAME = 'rolewatch [group id] [role name]', DESC = 'Notify if someone from a watched group joins the server'}
	CMDs[#CMDs + 1] = {NAME = 'rolewatchstop / unrolewatch', DESC = 'Disable Rolewatch'}
	CMDs[#CMDs + 1] = {NAME = 'rolewatchleave', DESC = 'Toggle if you should leave the game if someone from a watched group joins the server'}
	CMDs[#CMDs + 1] = {NAME = 'staffwatch', DESC = 'Notify if a staff member of the game joins the server'}
	CMDs[#CMDs + 1] = {NAME = 'unstaffwatch', DESC = 'Disable Staffwatch'}
	CMDs[#CMDs + 1] = {NAME = 'attach [player] (TOOL)', DESC = 'Attaches you to a player (YOU NEED A TOOL)'}
	CMDs[#CMDs + 1] = {NAME = 'kill [player] (TOOL)', DESC = 'Kills a player (YOU NEED A TOOL)'}
	CMDs[#CMDs + 1] = {NAME = 'fastkill [player] (TOOL)', DESC = 'Kills a player (less reliable) (YOU NEED A TOOL)'}
	CMDs[#CMDs + 1] = {NAME = 'handlekill / hkill [player] (TOOL)', DESC = 'Kills a player using tool damage (YOU NEED A TOOL)'}
	CMDs[#CMDs + 1] = {NAME = 'bring [player] (TOOL)', DESC = 'Brings a player (YOU NEED A TOOL)'}
	CMDs[#CMDs + 1] = {NAME = 'fastbring [player] (TOOL)', DESC = 'Brings a player (less reliable) (YOU NEED A TOOL)'}
	CMDs[#CMDs + 1] = {NAME = 'teleport / tp [player] [player] (TOOL)', DESC = 'Teleports a player to another player (YOU NEED A TOOL)'}
	CMDs[#CMDs + 1] = {NAME = 'fastteleport / fasttp [player] [player] (TOOL)', DESC = 'Teleports a player to another player (less reliable) (YOU NEED A TOOL)'}
	CMDs[#CMDs + 1] = {NAME = 'fling', DESC = 'Flings anyone you touch'}
	CMDs[#CMDs + 1] = {NAME = 'unfling', DESC = 'Disables the fling command'}
	CMDs[#CMDs + 1] = {NAME = 'flyfling', DESC = 'Basically the invisfling command but not invisible'}
	CMDs[#CMDs + 1] = {NAME = 'unflyfling', DESC = 'Disables the flyfling command'}
	CMDs[#CMDs + 1] = {NAME = 'walkfling', DESC = 'Basically fling but no spinning'}
	CMDs[#CMDs + 1] = {NAME = 'unwalkfling / nowalkfling', DESC = 'Disables walkfling'}
	CMDs[#CMDs + 1] = {NAME = 'invisfling', DESC = 'Enables invisible fling'}
	CMDs[#CMDs + 1] = {NAME = 'antifling', DESC = 'Disables player collisions to prevent you from being flung'}
	CMDs[#CMDs + 1] = {NAME = 'unantifling', DESC = 'Disables antifling'}
	CMDs[#CMDs + 1] = {NAME = 'loopoof', DESC = 'Loops everyones character sounds (everyone can hear)'}
	CMDs[#CMDs + 1] = {NAME = 'unloopoof', DESC = 'Stops the oof chaos'}
	CMDs[#CMDs + 1] = {NAME = 'muteboombox [player]', DESC = 'Mutes someones boombox'}
	CMDs[#CMDs + 1] = {NAME = 'unmuteboombox [player]', DESC = 'Unmutes someones boombox'}
	CMDs[#CMDs + 1] = {NAME = 'hitbox [player] [size]', DESC = 'Expands the hitbox for players HumanoidRootPart (default is 1)'}
	CMDs[#CMDs + 1] = {NAME = 'headsize [player] [size]', DESC = 'Expands the head size for players Head (default is 1)'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'reset', DESC = 'Resets your character normally'}
	CMDs[#CMDs + 1] = {NAME = 'respawn', DESC = 'Respawns you'}
	CMDs[#CMDs + 1] = {NAME = 'refresh / re', DESC = 'Respawns and brings you back to the same position'}
	CMDs[#CMDs + 1] = {NAME = 'god', DESC = 'Makes your character difficult to kill in most games'}
	CMDs[#CMDs + 1] = {NAME = 'invisible / invis', DESC = 'Makes you invisible to other players'}
	CMDs[#CMDs + 1] = {NAME = 'visible / vis', DESC = 'Makes you visible to other players'}
	CMDs[#CMDs + 1] = {NAME = 'toolinvisible / toolinvis / tinvis', DESC = 'Makes you invisible to other players and able to use tools'}
	CMDs[#CMDs + 1] = {NAME = 'speed / ws / walkspeed [num]', DESC = 'Change your walkspeed'}
	CMDs[#CMDs + 1] = {NAME = 'spoofspeed / spoofws [num]', DESC = 'Spoofs your WalkSpeed on the Client'}
	CMDs[#CMDs + 1] = {NAME = 'loopspeed / loopws [num]', DESC = 'Loops your walkspeed'}
	CMDs[#CMDs + 1] = {NAME = 'unloopspeed / unloopws', DESC = 'Turns off loopspeed'}
	CMDs[#CMDs + 1] = {NAME = 'hipheight / hheight [num]', DESC = 'Adjusts hip height'}
	CMDs[#CMDs + 1] = {NAME = 'jumppower / jpower / jp [num]', DESC = 'Change a players jump height'}
	CMDs[#CMDs + 1] = {NAME = 'spoofjumppower / spoofjp [num]', DESC = 'Spoofs your JumpPower on the Client'}
	CMDs[#CMDs + 1] = {NAME = 'loopjumppower / loopjp [num]', DESC = 'Loops your jump height'}
	CMDs[#CMDs + 1] = {NAME = 'unloopjumppower / unloopjp', DESC = 'Turns off loopjumppower'}
	CMDs[#CMDs + 1] = {NAME = 'maxslopeangle / msa [num]', DESC = 'Adjusts MaxSlopeAngle'}
	CMDs[#CMDs + 1] = {NAME = 'gravity / grav [num] (CLIENT)', DESC = 'Change your gravity'}
	CMDs[#CMDs + 1] = {NAME = 'sit', DESC = 'Makes your character sit'}
	CMDs[#CMDs + 1] = {NAME = 'lay / laydown', DESC = 'Makes your character lay down'}
	CMDs[#CMDs + 1] = {NAME = 'sitwalk', DESC = 'Makes your character sit while still being able to walk'}
	CMDs[#CMDs + 1] = {NAME = 'nosit', DESC = 'Prevents your character from sitting'}
	CMDs[#CMDs + 1] = {NAME = 'unnosit', DESC = 'Disables nosit'}
	CMDs[#CMDs + 1] = {NAME = 'jump', DESC = 'Makes your character jump'}
	CMDs[#CMDs + 1] = {NAME = 'infinitejump / infjump', DESC = 'Allows you to jump before hitting the ground'}
	CMDs[#CMDs + 1] = {NAME = 'uninfinitejump / uninfjump', DESC = 'Disables infjump'}
	CMDs[#CMDs + 1] = {NAME = 'flyjump', DESC = 'Allows you to hold space to fly up'}
	CMDs[#CMDs + 1] = {NAME = 'unflyjump', DESC = 'Disables flyjump'}
	CMDs[#CMDs + 1] = {NAME = 'autojump / ajump', DESC = 'Automatically jumps when you run into an object'}
	CMDs[#CMDs + 1] = {NAME = 'unautojump / unajump', DESC = 'Disables autojump'}
	CMDs[#CMDs + 1] = {NAME = 'edgejump / ejump', DESC = 'Automatically jumps when you get to the edge of an object'}
	CMDs[#CMDs + 1] = {NAME = 'unedgejump / unejump', DESC = 'Disables edgejump'}
	CMDs[#CMDs + 1] = {NAME = 'platformstand / stun', DESC = 'Enables PlatformStand'}
	CMDs[#CMDs + 1] = {NAME = 'unplatformstand / unstun', DESC = 'Disables PlatformStand'}
	CMDs[#CMDs + 1] = {NAME = 'norotate / noautorotate', DESC = 'Disables AutoRotate'}
	CMDs[#CMDs + 1] = {NAME = 'unnorotate / autorotate', DESC = 'Enables AutoRotate'}
	CMDs[#CMDs + 1] = {NAME = 'enablestate [StateType]', DESC = 'Enables a humanoid state type'}
	CMDs[#CMDs + 1] = {NAME = 'disablestate [StateType]', DESC = 'Disables a humanoid state type'}
	CMDs[#CMDs + 1] = {NAME = 'team [team name] (CLIENT)', DESC = 'Changes your team. Sometimes fools localscripts.'}
	CMDs[#CMDs + 1] = {NAME = 'nobillboardgui / nobgui / noname', DESC = 'Removes billboard and surface guis from your players (i.e. name guis at cafes)'}
	CMDs[#CMDs + 1] = {NAME = 'loopnobgui / loopnoname', DESC = 'Loop removes billboard and surface guis from your players (i.e. name guis at cafes)'}
	CMDs[#CMDs + 1] = {NAME = 'unloopnobgui / unloopnoname', DESC = 'Disables loopnobgui'}
	CMDs[#CMDs + 1] = {NAME = 'noarms', DESC = 'Removes your arms'}
	CMDs[#CMDs + 1] = {NAME = 'nolegs', DESC = 'Removes your legs'}
	CMDs[#CMDs + 1] = {NAME = 'nolimbs', DESC = 'Removes your limbs'}
	CMDs[#CMDs + 1] = {NAME = 'naked (CLIENT)', DESC = 'Removes your clothing'}
	CMDs[#CMDs + 1] = {NAME = 'noface / removeface', DESC = 'Removes your face'}
	CMDs[#CMDs + 1] = {NAME = 'blockhead', DESC = 'Turns your head into a block'}
	CMDs[#CMDs + 1] = {NAME = 'blockhats', DESC = 'Turns your hats into blocks'}
	CMDs[#CMDs + 1] = {NAME = 'blocktool', DESC = 'Turns the currently selected tool into a block'}
	CMDs[#CMDs + 1] = {NAME = 'creeper', DESC = 'Makes you look like a creeper'}
	CMDs[#CMDs + 1] = {NAME = 'drophats', DESC = 'Drops your hats'}
	CMDs[#CMDs + 1] = {NAME = 'nohats / deletehats / rhats', DESC = 'Deletes your hats'}
	CMDs[#CMDs + 1] = {NAME = 'hatspin / spinhats', DESC = 'Spins your characters accessories'}
	CMDs[#CMDs + 1] = {NAME = 'unhatspin / unspinhats', DESC = 'Undoes spinhats'}
	CMDs[#CMDs + 1] = {NAME = 'clearhats / cleanhats', DESC = 'Clears hats in the workspace'}
	CMDs[#CMDs + 1] = {NAME = 'chardelete / cd [instance name]', DESC = 'Removes any part with a certain name from your character'}
	CMDs[#CMDs + 1] = {NAME = 'chardeleteclass / cdc [class name]', DESC = 'Removes any part with a certain classname from your character'}
	CMDs[#CMDs + 1] = {NAME = 'deletevelocity / dv / removeforces', DESC = 'Removes any velocity / force instances in your character'}
	CMDs[#CMDs + 1] = {NAME = 'weaken [num]', DESC = 'Makes your character less dense'}
	CMDs[#CMDs + 1] = {NAME = 'unweaken', DESC = 'Sets your characters CustomPhysicalProperties to default'}
	CMDs[#CMDs + 1] = {NAME = 'strengthen [num]', DESC = 'Makes your character more dense (CustomPhysicalProperties)'}
	CMDs[#CMDs + 1] = {NAME = 'unstrengthen', DESC = 'Sets your characters CustomPhysicalProperties to default'}
	CMDs[#CMDs + 1] = {NAME = 'breakvelocity', DESC = 'Sets your characters velocity to 0'}
	CMDs[#CMDs + 1] = {NAME = 'spin [speed]', DESC = 'Spins your character'}
	CMDs[#CMDs + 1] = {NAME = 'unspin', DESC = 'Disables spin'}
	CMDs[#CMDs + 1] = {NAME = 'split', DESC = 'Splits your character in half'}
	CMDs[#CMDs + 1] = {NAME = 'nilchar', DESC = 'Sets your characters parent to nil'}
	CMDs[#CMDs + 1] = {NAME = 'unnilchar / nonilchar', DESC = 'Sets your characters parent to workspace'}
	CMDs[#CMDs + 1] = {NAME = 'noroot / removeroot / rroot', DESC = 'Removes your characters HumanoidRootPart'}
	CMDs[#CMDs + 1] = {NAME = 'replaceroot', DESC = 'Replaces your characters HumanoidRootPart'}
	CMDs[#CMDs + 1] = {NAME = 'clearcharappearance / clearchar / clrchar', DESC = 'Removes all accessory, shirt, pants, charactermesh, and bodycolors'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'animation / anim [ID] [speed]', DESC = 'Makes your character perform an animation (must be by roblox to replicate)'}
	CMDs[#CMDs + 1] = {NAME = 'dance', DESC = 'Makes you  d a n c e'}
	CMDs[#CMDs + 1] = {NAME = 'undance', DESC = 'Stops dance animations'}
	CMDs[#CMDs + 1] = {NAME = 'spasm', DESC = 'Makes you  c r a z y'}
	CMDs[#CMDs + 1] = {NAME = 'unspasm', DESC = 'Stops spasm'}
	CMDs[#CMDs + 1] = {NAME = 'headthrow', DESC = 'Simply makes you throw your head'}
	CMDs[#CMDs + 1] = {NAME = 'noanim', DESC = 'Disables your animations'}
	CMDs[#CMDs + 1] = {NAME = 'reanim', DESC = 'Restores your animations'}
	CMDs[#CMDs + 1] = {NAME = 'animspeed [num]', DESC = 'Changes the speed of your current animation'}
	CMDs[#CMDs + 1] = {NAME = 'copyanimation / copyanim / copyemote [player]', DESC = 'Copies someone elses animation'}
	CMDs[#CMDs + 1] = {NAME = 'copyanimationid / copyanimid / copyemoteid [player]', DESC = 'Copies your animation id or someone elses to your clipboard'}
	CMDs[#CMDs + 1] = {NAME = 'loopanimation / loopanim', DESC = 'Loops your current animation'}
	CMDs[#CMDs + 1] = {NAME = 'stopanimations / stopanims', DESC = 'Stops running animations'}
	CMDs[#CMDs + 1] = {NAME = 'refreshanimations / refreshanims', DESC = 'Refreshes animations'}
	CMDs[#CMDs + 1] = {NAME = 'allowcustomanim / allowcustomanimations', DESC = 'Lets you use custom animation packs instead'}
	CMDs[#CMDs + 1] = {NAME = 'unallowcustomanim / unallowcustomanimations', DESC = 'Doesn\'t let you use custom animation packs instead'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'autoclick [click delay] [release delay]', DESC = 'Automatically clicks your mouse with a set delay'}
	CMDs[#CMDs + 1] = {NAME = 'unautoclick / noautoclick', DESC = 'Turns off autoclick'}
	CMDs[#CMDs + 1] = {NAME = 'autokeypress [key] [down delay] [up delay]', DESC = 'Automatically presses a key with a set delay'}
	CMDs[#CMDs + 1] = {NAME = 'unautokeypress', DESC = 'Stops autokeypress'}
	CMDs[#CMDs + 1] = {NAME = 'hovername', DESC = 'Shows a players username when your mouse is hovered over them'}
	CMDs[#CMDs + 1] = {NAME = 'unhovername / nohovername', DESC = 'Turns off hovername'}
	CMDs[#CMDs + 1] = {NAME = 'mousesensitivity / ms [0-10]', DESC = 'Sets your mouse sensitivity (affects first person and right click drag) (default is 1)'}
	CMDs[#CMDs + 1] = {NAME = 'clickdelete', DESC = 'Go to settings>Keybinds>Add for clicktp'}
	CMDs[#CMDs + 1] = {NAME = 'clickteleport', DESC = 'Go to settings>Keybinds>Add for click tp'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'tools', DESC = 'Copies tools from ReplicatedStorage and Lighting'}
	CMDs[#CMDs + 1] = {NAME = 'notools / removetools / deletetools', DESC = 'Removes tools from character and backpack'}
	CMDs[#CMDs + 1] = {NAME = 'deleteselectedtool / dst', DESC = 'Removes any currently selected tools'}
	CMDs[#CMDs + 1] = {NAME = 'grabtools', DESC = 'Automatically get tools that are dropped'}
	CMDs[#CMDs + 1] = {NAME = 'ungrabtools / nograbtools', DESC = 'Disables grabtools'}
	CMDs[#CMDs + 1] = {NAME = 'copytools [player] (CLIENT)', DESC = 'Copies a players tools'}
	CMDs[#CMDs + 1] = {NAME = 'dupetools / clonetools [num]', DESC = 'Duplicates your inventory tools a set ammount of times'}
	CMDs[#CMDs + 1] = {NAME = 'givetool / givetools', DESC = 'Gives all the tools you\'re holding to [player] using the attach method.'}
	CMDs[#CMDs + 1] = {NAME = 'droptools', DESC = 'Drops your tools'}
	CMDs[#CMDs + 1] = {NAME = 'droppabletools', DESC = 'Makes your tools droppable'}
	CMDs[#CMDs + 1] = {NAME = 'equiptools', DESC = 'Equips every tool in your inventory at once'}
	CMDs[#CMDs + 1] = {NAME = 'unequiptools', DESC = 'Unequips every tool you are currently holding at once'}
	CMDs[#CMDs + 1] = {NAME = 'removespecifictool [name]', DESC = 'Automatically remove a specific tool from your inventory'}
	CMDs[#CMDs + 1] = {NAME = 'unremovespecifictool [name]', DESC = 'Stops removing a specific tool from your inventory'}
	CMDs[#CMDs + 1] = {NAME = 'clearremovespecifictool', DESC = 'Stop removing all specific tools from your inventory'}
	CMDs[#CMDs + 1] = {NAME = 'reach [num]', DESC = 'Increases the hitbox of your held tool'}
	CMDs[#CMDs + 1] = {NAME = 'unreach / noreach', DESC = 'Turns off reach'}
	CMDs[#CMDs + 1] = {NAME = 'grippos [X Y Z]', DESC = 'Changes your current tools grip position'}
	CMDs[#CMDs + 1] = {NAME = 'usetools [ammount] [delay]', DESC = 'Activates all tools in your backpack at the same time'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'addalias [cmd] [alias]', DESC = 'Adds an alias to a command'}
	CMDs[#CMDs + 1] = {NAME = 'removealias [alias]', DESC = 'Removes a custom alias'}
	CMDs[#CMDs + 1] = {NAME = 'clraliases', DESC = 'Removes all custom aliases'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'addplugin / plugin [name]', DESC = 'Add a plugin via command'}
	CMDs[#CMDs + 1] = {NAME = 'removeplugin / deleteplugin [name]', DESC = 'Remove a plugin via command'}
	CMDs[#CMDs + 1] = {NAME = 'reloadplugin [name]', DESC = 'Reloads a plugin'}
	CMDs[#CMDs + 1] = {NAME = '', DESC = ''}
	CMDs[#CMDs + 1] = {NAME = 'breakloops / break (cmd loops)', DESC = 'Stops any cmd loops (;100^1^cmd)'}
	CMDs[#CMDs + 1] = {NAME = 'removecmd / deletecmd', DESC = 'Removes a command until the admin is reloaded'}
	CMDs[#CMDs + 1] = {NAME = 'tpwalk / teleportwalk [num]', DESC = 'Teleports you to your move direction'}
	CMDs[#CMDs + 1] = {NAME = 'untpwalk / unteleportwalk', DESC = 'Undoes tpwalk / teleportwalk'}
	CMDs[#CMDs + 1] = {NAME = 'notifyping / ping', DESC = 'Notify yourself your ping'}
	CMDs[#CMDs + 1] = {NAME = 'trip', DESC = 'Makes your character fall over'}
	CMDs[#CMDs + 1] = {NAME = 'norender', DESC = 'Disable 3d Rendering to decrease the amount of CPU the client uses'}
	CMDs[#CMDs + 1] = {NAME = 'render', DESC = 'Enable 3d Rendering'}
	CMDs[#CMDs + 1] = {NAME = 'use2022materials / 2022materials', DESC = 'Enables 2022 material textures'}
	CMDs[#CMDs + 1] = {NAME = 'unuse2022materials / un2022materials', DESC = 'Disables 2022 material textures'}
	CMDs[#CMDs + 1] = {NAME = 'promptr6', DESC = 'Prompts the game to switch your rig type to R6'}
	CMDs[#CMDs + 1] = {NAME = 'promptr15', DESC = 'Prompts the game to switch your rig type to R15'}
	CMDs[#CMDs + 1] = {NAME = 'wallwalk / walkonwalls', DESC = 'Walk on walls'}
	wait()

	for i = 1, #CMDs do
		local newcmd = Example:Clone()
		newcmd.Parent = CMDsF
		newcmd.Visible = false
		newcmd.Text = CMDs[i].NAME
		newcmd.Name = "CMD"
		table.insert(text1, newcmd)
		if CMDs[i].DESC ~= "" then
			newcmd:SetAttribute("Title", CMDs[i].NAME)
			newcmd:SetAttribute("Desc", CMDs[i].DESC)
			newcmd.MouseButton1Down:Connect(function()
				if not IsOnMobile and newcmd.Visible and newcmd.TextTransparency == 0 then
					local currentText = Cmdbar.Text
					Cmdbar:CaptureFocus()
					autoComplete(newcmd.Text, currentText)
					maximizeHolder()
				end
			end)
		end
	end

	IndexContents("", true)

	function checkTT()
		local t
		local guisAtPosition = COREGUI:GetGuiObjectsAtPosition(IYMouse.X, IYMouse.Y)

		for _, gui in pairs(guisAtPosition) do
			if gui.Parent == CMDsF then
				t = gui
			end
		end

		if t ~= nil and t:GetAttribute("Title") ~= nil then
			local x = IYMouse.X
			local y = IYMouse.Y
			local xP
			local yP
			if IYMouse.X > 200 then
				xP = x - 201
			else
				xP = x + 21
			end
			if IYMouse.Y > (IYMouse.ViewSizeY-96) then
				yP = y - 97
			else
				yP = y
			end
			Tooltip.Position = UDim2.new(0, xP, 0, yP)
			Description.Text = t:GetAttribute("Desc")
			if t:GetAttribute("Title") ~= nil then
				Title_3.Text = t:GetAttribute("Title")
			else
				Title_3.Text = ''
			end
			Tooltip.Visible = true
		else
			Tooltip.Visible = false
		end
	end

	function FindInTable(tbl,val)
		if tbl == nil then return false end
		for _,v in pairs(tbl) do
			if v == val then return true end
		end 
		return false
	end

	function GetInTable(Table, Name)
		for i = 1, #Table do
			if Table[i] == Name then
				return i
			end
		end
		return false
	end

	function respawn(plr)
		if invisRunning then TurnVisible() end
		local char = plr.Character
		if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
		char:ClearAllChildren()
		local newChar = Instance.new("Model")
		newChar.Parent = workspace
		plr.Character = newChar
		wait()
		plr.Character = char
		newChar:Destroy()
	end

	local refreshCmd = false
	function refresh(plr)
		refreshCmd = true
		local Human = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid", true)
		local pos = Human and Human.RootPart and Human.RootPart.CFrame
		local pos1 = workspace.CurrentCamera.CFrame
		respawn(plr)
		task.spawn(function()
			plr.CharacterAdded:Wait():WaitForChild("Humanoid").RootPart.CFrame, workspace.CurrentCamera.CFrame = pos, wait() and pos1
			refreshCmd = false
		end)
	end

	local lastDeath

	function onDied()
		task.spawn(function()
			if pcall(function() Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') end) and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
					if getRoot(Players.LocalPlayer.Character) then
						lastDeath = getRoot(Players.LocalPlayer.Character).CFrame
					end
				end)
			else
				wait(2)
				onDied()
			end
		end)
	end

	Clip = true
	spDelay = 0.1
	Players.LocalPlayer.CharacterAdded:Connect(function()
		NOFLY()
		Floating = false

		if not Clip then
			execCmd('clip')
		end

		repeat wait() until getRoot(Players.LocalPlayer.Character)

		pcall(function()
			if spawnpoint and not refreshCmd and spawnpos ~= nil then
				wait(spDelay)
				getRoot(Players.LocalPlayer.Character).CFrame = spawnpos
			end
		end)

		onDied()
	end)

	onDied()

	function getstring(begin)
		local start = begin-1
		local AA = '' for i,v in pairs(cargs) do
			if i > start then
				if AA ~= '' then
					AA = AA .. ' ' .. v
				else
					AA = AA .. v
				end
			end
		end
		return AA
	end

	findCmd=function(cmd_name)
		for i,v in pairs(cmds)do
			if v.NAME:lower()==cmd_name:lower() or FindInTable(v.ALIAS,cmd_name:lower()) then
				return v
			end
		end
		return customAlias[cmd_name:lower()]
	end

	function splitString(str,delim)
		local broken = {}
		if delim == nil then delim = "," end
		for w in string.gmatch(str,"[^"..delim.."]+") do
			table.insert(broken,w)
		end
		return broken
	end

	cmdHistory = {}
	local lastCmds = {}
	local historyCount = 0
	local split=" "
	local lastBreakTime = 0
	function execCmd(cmdStr,speaker,store)
		cmdStr = cmdStr:gsub("%s+$","")
		task.spawn(function()
			local rawCmdStr = cmdStr
			cmdStr = string.gsub(cmdStr,"\\\\","%%BackSlash%%")
			local commandsToRun = splitString(cmdStr,"\\")
			for i,v in pairs(commandsToRun) do
				v = string.gsub(v,"%%BackSlash%%","\\")
				local x,y,num = v:find("^(%d+)%^")
				local cmdDelay = 0
				local infTimes = false
				if num then
					v = v:sub(y+1)
					local x,y,del = v:find("^([%d%.]+)%^")
					if del then
						v = v:sub(y+1)
						cmdDelay = tonumber(del) or 0
					end
				else
					local x,y = v:find("^inf%^")
					if x then
						infTimes = true
						v = v:sub(y+1)
						local x,y,del = v:find("^([%d%.]+)%^")
						if del then
							v = v:sub(y+1)
							del = tonumber(del) or 1
							cmdDelay = (del > 0 and del or 1)
						else
							cmdDelay = 1
						end
					end
				end
				num = tonumber(num or 1)

				if v:sub(1,1) == "!" then
					local chunks = splitString(v:sub(2),split)
					if chunks[1] and lastCmds[chunks[1]] then v = lastCmds[chunks[1]] end
				end

				local args = splitString(v,split)
				local cmdName = args[1]
				local cmd = findCmd(cmdName)
				if cmd then
					table.remove(args,1)
					cargs = args
					if not speaker then speaker = Players.LocalPlayer end
					if store then
						if speaker == Players.LocalPlayer then
							if cmdHistory[1] ~= rawCmdStr and rawCmdStr:sub(1,11) ~= 'lastcommand' and rawCmdStr:sub(1,7) ~= 'lastcmd' then
								table.insert(cmdHistory,1,rawCmdStr)
							end
						end
						if #cmdHistory > 30 then table.remove(cmdHistory) end

						lastCmds[cmdName] = v
					end
					local cmdStartTime = tick()
					if infTimes then
						while lastBreakTime < cmdStartTime do
							local success,err = pcall(cmd.FUNC,args, speaker)
							if not success and _G.IY_DEBUG then
								warn("Command Error:", cmdName, err)
							end
							wait(cmdDelay)
						end
					else
						for rep = 1,num do
							if lastBreakTime > cmdStartTime then break end
							local success,err = pcall(function()
								cmd.FUNC(args, speaker)
							end)
							if not success and _G.IY_DEBUG then
								warn("Command Error:", cmdName, err)
							end
							if cmdDelay ~= 0 then wait(cmdDelay) end
						end
					end
				end
			end
		end)
	end	

	function addcmd(name,alias,func,plgn)
		cmds[#cmds+1]=
			{
				NAME=name;
				ALIAS=alias or {};
				FUNC=func;
				PLUGIN=plgn;
			}
	end

	function removecmd(cmd)
		if cmd ~= " " then
			for i = #cmds,1,-1 do
				if cmds[i].NAME == cmd or FindInTable(cmds[i].ALIAS,cmd) then
					table.remove(cmds, i)
					for a,c in pairs(CMDsF:GetChildren()) do
						if string.find(c.Text, "^"..cmd.."$") or string.find(c.Text, "^"..cmd.." ") or string.find(c.Text, " "..cmd.."$") or string.find(c.Text, " "..cmd.." ") then
							c.TextTransparency = 0.7
							c.MouseButton1Click:Connect(function()
								notify(c.Text, "Command has been disabled by you or a plugin")
							end)
						end
					end
				end
			end
		end
	end

	function addbind(cmd,key,iskeyup,toggle)
		if toggle then
			binds[#binds+1]=
				{
					COMMAND=cmd;
					KEY=key;
					ISKEYUP=iskeyup;
					TOGGLE = toggle;
				}
		else
			binds[#binds+1]=
				{
					COMMAND=cmd;
					KEY=key;
					ISKEYUP=iskeyup;
				}
		end
	end

	function addcmdtext(text,name,desc)
		local newcmd = Example:Clone()
		local tooltipText = tostring(text)
		local tooltipDesc = tostring(desc)
		newcmd.Parent = CMDsF
		newcmd.Visible = false
		newcmd.Text = text
		newcmd.Name = 'PLUGIN_'..name
		table.insert(text1,newcmd)
		if desc and desc ~= '' then
			newcmd:SetAttribute("Title", tooltipText)
			newcmd:SetAttribute("Desc", tooltipDesc)
			newcmd.MouseButton1Down:Connect(function()
				if newcmd.Visible and newcmd.TextTransparency == 0 then
					Cmdbar:CaptureFocus()
					autoComplete(newcmd.Text)
					maximizeHolder()
				end
			end)
		end
	end

	local WorldToScreen = function(Object)
		local ObjectVector = workspace.CurrentCamera:WorldToScreenPoint(Object.Position)
		return Vector2.new(ObjectVector.X, ObjectVector.Y)
	end

	local MousePositionToVector2 = function()
		return Vector2.new(IYMouse.X, IYMouse.Y)
	end

	local GetClosestPlayerFromCursor = function()
		local found = nil
		local ClosestDistance = math.huge
		for i, v in pairs(Players:GetPlayers()) do
			if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
				for k, x in pairs(v.Character:GetChildren()) do
					if string.find(x.Name, "Torso") then
						local Distance = (WorldToScreen(x) - MousePositionToVector2()).Magnitude
						if Distance < ClosestDistance then
							ClosestDistance = Distance
							found = v
						end
					end
				end
			end
		end
		return found
	end

	SpecialPlayerCases = {
		["all"] = function(speaker) return Players:GetPlayers() end,
		["others"] = function(speaker)
			local plrs = {}
			for i,v in pairs(Players:GetPlayers()) do
				if v ~= speaker then
					table.insert(plrs,v)
				end
			end
			return plrs
		end,
		["me"] = function(speaker)return {speaker} end,
		["#(%d+)"] = function(speaker,args,currentList)
			local returns = {}
			local randAmount = tonumber(args[1])
			local players = {unpack(currentList)}
			for i = 1,randAmount do
				if #players == 0 then break end
				local randIndex = math.random(1,#players)
				table.insert(returns,players[randIndex])
				table.remove(players,randIndex)
			end
			return returns
		end,
		["random"] = function(speaker,args,currentList)
			local players = Players:GetPlayers()
			local localplayer = Players.LocalPlayer
			table.remove(players, table.find(players, localplayer))
			return {players[math.random(1,#players)]}
		end,
		["%%(.+)"] = function(speaker,args)
			local returns = {}
			local team = args[1]
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.Team and string.sub(string.lower(plr.Team.Name),1,#team) == string.lower(team) then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["allies"] = function(speaker)
			local returns = {}
			local team = speaker.Team
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.Team == team then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["enemies"] = function(speaker)
			local returns = {}
			local team = speaker.Team
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.Team ~= team then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["team"] = function(speaker)
			local returns = {}
			local team = speaker.Team
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.Team == team then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["nonteam"] = function(speaker)
			local returns = {}
			local team = speaker.Team
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.Team ~= team then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["friends"] = function(speaker,args)
			local returns = {}
			for _,plr in pairs(Players:GetPlayers()) do
				if plr:IsFriendsWith(speaker.UserId) and plr ~= speaker then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["nonfriends"] = function(speaker,args)
			local returns = {}
			for _,plr in pairs(Players:GetPlayers()) do
				if not plr:IsFriendsWith(speaker.UserId) and plr ~= speaker then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["guests"] = function(speaker,args)
			local returns = {}
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.Guest then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["bacons"] = function(speaker,args)
			local returns = {}
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.Character:FindFirstChild('Pal Hair') or plr.Character:FindFirstChild('Kate Hair') then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["age(%d+)"] = function(speaker,args)
			local returns = {}
			local age = tonumber(args[1])
			if not age == nil then return end
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.AccountAge <= age then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["nearest"] = function(speaker,args,currentList)
			local speakerChar = speaker.Character
			if not speakerChar or not getRoot(speakerChar) then return end
			local lowest = math.huge
			local NearestPlayer = nil
			for _,plr in pairs(currentList) do
				if plr ~= speaker and plr.Character then
					local distance = plr:DistanceFromCharacter(getRoot(speakerChar).Position)
					if distance < lowest then
						lowest = distance
						NearestPlayer = {plr}
					end
				end
			end
			return NearestPlayer
		end,
		["farthest"] = function(speaker,args,currentList)
			local speakerChar = speaker.Character
			if not speakerChar or not getRoot(speakerChar) then return end
			local highest = 0
			local Farthest = nil
			for _,plr in pairs(currentList) do
				if plr ~= speaker and plr.Character then
					local distance = plr:DistanceFromCharacter(getRoot(speakerChar).Position)
					if distance > highest then
						highest = distance
						Farthest = {plr}
					end
				end
			end
			return Farthest
		end,
		["group(%d+)"] = function(speaker,args)
			local returns = {}
			local groupID = tonumber(args[1])
			for _,plr in pairs(Players:GetPlayers()) do
				if plr:IsInGroup(groupID) then  
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["alive"] = function(speaker,args)
			local returns = {}
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["dead"] = function(speaker,args)
			local returns = {}
			for _,plr in pairs(Players:GetPlayers()) do
				if (not plr.Character or not plr.Character:FindFirstChildOfClass("Humanoid")) or plr.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
					table.insert(returns,plr)
				end
			end
			return returns
		end,
		["rad(%d+)"] = function(speaker,args)
			local returns = {}
			local radius = tonumber(args[1])
			local speakerChar = speaker.Character
			if not speakerChar or not getRoot(speakerChar) then return end
			for _,plr in pairs(Players:GetPlayers()) do
				if plr.Character and getRoot(plr.Character) then
					local magnitude = (getRoot(plr.Character).Position-getRoot(speakerChar).Position).magnitude
					if magnitude <= radius then table.insert(returns,plr) end
				end
			end
			return returns
		end,
		["cursor"] = function(speaker)
			local plrs = {}
			local v = GetClosestPlayerFromCursor()
			if v ~= nil then table.insert(plrs, v) end
			return plrs
		end,
		["npcs"] = function(speaker,args)
			local returns = {}
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") and getRoot(v) and v:FindFirstChildWhichIsA("Humanoid") and Players:GetPlayerFromCharacter(v) == nil then
					local clone = Instance.new("Player")
					clone.Name = v.Name .. " - " .. v:FindFirstChildWhichIsA("Humanoid").DisplayName
					clone.Character = v
					table.insert(returns, clone)
				end
			end
			return returns
		end,
	}

	function toTokens(str)
		local tokens = {}
		for op,name in string.gmatch(str,"([+-])([^+-]+)") do
			table.insert(tokens,{Operator = op,Name = name})
		end
		return tokens
	end

	function onlyIncludeInTable(tab,matches)
		local matchTable = {}
		local resultTable = {}
		for i,v in pairs(matches) do matchTable[v.Name] = true end
		for i,v in pairs(tab) do if matchTable[v.Name] then table.insert(resultTable,v) end end
		return resultTable
	end

	function removeTableMatches(tab,matches)
		local matchTable = {}
		local resultTable = {}
		for i,v in pairs(matches) do matchTable[v.Name] = true end
		for i,v in pairs(tab) do if not matchTable[v.Name] then table.insert(resultTable,v) end end
		return resultTable
	end

	function getPlayersByName(Name)
		local Name,Len,Found = string.lower(Name),#Name,{}
		for _,v in pairs(Players:GetPlayers()) do
			if Name:sub(0,1) == '@' then
				if string.sub(string.lower(v.Name),1,Len-1) == Name:sub(2) then
					table.insert(Found,v)
				end
			else
				if string.sub(string.lower(v.Name),1,Len) == Name or string.sub(string.lower(v.DisplayName),1,Len) == Name then
					table.insert(Found,v)
				end
			end
		end
		return Found
	end

	function getPlayer(list,speaker)
		if list == nil then return {speaker.Name} end
		local nameList = splitString(list,",")

		local foundList = {}

		for _,name in pairs(nameList) do
			if string.sub(name,1,1) ~= "+" and string.sub(name,1,1) ~= "-" then name = "+"..name end
			local tokens = toTokens(name)
			local initialPlayers = Players:GetPlayers()

			for i,v in pairs(tokens) do
				if v.Operator == "+" then
					local tokenContent = v.Name
					local foundCase = false
					for regex,case in pairs(SpecialPlayerCases) do
						local matches = {string.match(tokenContent,"^"..regex.."$")}
						if #matches > 0 then
							foundCase = true
							initialPlayers = onlyIncludeInTable(initialPlayers,case(speaker,matches,initialPlayers))
						end
					end
					if not foundCase then
						initialPlayers = onlyIncludeInTable(initialPlayers,getPlayersByName(tokenContent))
					end
				else
					local tokenContent = v.Name
					local foundCase = false
					for regex,case in pairs(SpecialPlayerCases) do
						local matches = {string.match(tokenContent,"^"..regex.."$")}
						if #matches > 0 then
							foundCase = true
							initialPlayers = removeTableMatches(initialPlayers,case(speaker,matches,initialPlayers))
						end
					end
					if not foundCase then
						initialPlayers = removeTableMatches(initialPlayers,getPlayersByName(tokenContent))
					end
				end
			end

			for i,v in pairs(initialPlayers) do table.insert(foundList,v) end
		end

		local foundNames = {}
		for i,v in pairs(foundList) do table.insert(foundNames,v.Name) end

		return foundNames
	end

	formatUsername = function(player)
		if player.DisplayName ~= player.Name then
			return string.format("%s (%s)", player.Name, player.DisplayName)
		end
		return player.Name
	end

	getprfx=function(strn)
		if strn:sub(1,string.len(prefix))==prefix then return{'cmd',string.len(prefix)+1}
		end return
	end

	function do_exec(str, plr)
		str = str:gsub('/e ', '')
		local t = getprfx(str)
		if not t then return end
		str = str:sub(t[2])
		if t[1]=='cmd' then
			execCmd(str, plr, true)
			IndexContents('',true,false,true)
			CMDsF.CanvasPosition = canvasPos
		end
	end

	lastTextBoxString,lastTextBoxCon,lastEnteredString = nil,nil,nil

	UserInputService.TextBoxFocused:Connect(function(obj)
		if lastTextBoxCon then lastTextBoxCon:Disconnect() end
		if obj == Cmdbar then lastTextBoxString = nil return end
		lastTextBoxString = obj.Text
		lastTextBoxCon = obj:GetPropertyChangedSignal("Text"):Connect(function()
			if not (UserInputService:IsKeyDown(Enum.KeyCode.Return) or UserInputService:IsKeyDown(Enum.KeyCode.KeypadEnter)) then
				lastTextBoxString = obj.Text
			end
		end)
	end)

	UserInputService.InputBegan:Connect(function(input,gameProcessed)
		if gameProcessed then
			if Cmdbar and Cmdbar:IsFocused() then
				if input.KeyCode == Enum.KeyCode.Up then
					historyCount = historyCount + 1
					if historyCount > #cmdHistory then historyCount = #cmdHistory end
					Cmdbar.Text = cmdHistory[historyCount] or ""
					Cmdbar.CursorPosition = 1020
				elseif input.KeyCode == Enum.KeyCode.Down then
					historyCount = historyCount - 1
					if historyCount < 0 then historyCount = 0 end
					Cmdbar.Text = cmdHistory[historyCount] or ""
					Cmdbar.CursorPosition = 1020
				end
			elseif input.KeyCode == Enum.KeyCode.Return or input.KeyCode == Enum.KeyCode.KeypadEnter then
				lastEnteredString = lastTextBoxString
			end
		end
	end)

	Players.LocalPlayer.Chatted:Connect(function()
		wait()
		if lastEnteredString then
			local message = lastEnteredString
			lastEnteredString = nil
			do_exec(message, Players.LocalPlayer)
		end
	end)

	Cmdbar.PlaceholderText = "Command Bar ("..prefix..")"
	Cmdbar:GetPropertyChangedSignal("Text"):Connect(function()
		if Cmdbar:IsFocused() then
			IndexContents(Cmdbar.Text,true,true)
		end
	end)

	local tabComplete = nil
	tabAllowed = true
	Cmdbar.FocusLost:Connect(function(enterpressed)
		if enterpressed then
			local cmdbarText = Cmdbar.Text:gsub("^"..prefix,"")
			execCmd(cmdbarText,Players.LocalPlayer,true)
		end
		if tabComplete then tabComplete:Disconnect() end
		wait()
		if not Cmdbar:IsFocused() then
			Cmdbar.Text = ""
			IndexContents('',true,false,true)
			if SettingsOpen == true then
				wait(0.2)
				Settings:TweenPosition(UDim2.new(0, 0, 0, 45), "InOut", "Quart", 0.2, true, nil)
				CMDsF.Visible = false
			end
		end
		CMDsF.CanvasPosition = canvasPos
	end)

	Cmdbar.Focused:Connect(function()
		historyCount = 0
		canvasPos = CMDsF.CanvasPosition
		if SettingsOpen == true then
			wait(0.2)
			CMDsF.Visible = true
			Settings:TweenPosition(UDim2.new(0, 0, 0, 220), "InOut", "Quart", 0.2, true, nil)
		end
		tabComplete = UserInputService.InputBegan:Connect(function(input,gameProcessed)
			if Cmdbar:IsFocused() then
				if tabAllowed == true and input.KeyCode == Enum.KeyCode.Tab and topCommand ~= nil then
					autoComplete(topCommand)
				end
			else
				tabComplete:Disconnect()
			end
		end)
	end)

	ESPenabled = false
	CHMSenabled = false

	function round(num, numDecimalPlaces)
		local mult = 10^(numDecimalPlaces or 0)
		return math.floor(num * mult + 0.5) / mult
	end

	function ESP(plr)
		task.spawn(function()
			for i,v in pairs(COREGUI:GetChildren()) do
				if v.Name == plr.Name..'_ESP' then
					v:Destroy()
				end
			end
			wait()
			if plr.Character and plr.Name ~= Players.LocalPlayer.Name and not COREGUI:FindFirstChild(plr.Name..'_ESP') then
				local ESPholder = Instance.new("Folder")
				ESPholder.Name = plr.Name..'_ESP'
				ESPholder.Parent = COREGUI
				repeat wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
				for b,n in pairs (plr.Character:GetChildren()) do
					if (n:IsA("BasePart")) then
						local a = Instance.new("BoxHandleAdornment")
						a.Name = plr.Name
						a.Parent = ESPholder
						a.Adornee = n
						a.AlwaysOnTop = true
						a.ZIndex = 10
						a.Size = n.Size
						a.Transparency = espTransparency
						a.Color = plr.TeamColor
					end
				end
				if plr.Character and plr.Character:FindFirstChild('Head') then
					local BillboardGui = Instance.new("BillboardGui")
					local TextLabel = Instance.new("TextLabel")
					BillboardGui.Adornee = plr.Character.Head
					BillboardGui.Name = plr.Name
					BillboardGui.Parent = ESPholder
					BillboardGui.Size = UDim2.new(0, 100, 0, 150)
					BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
					BillboardGui.AlwaysOnTop = true
					TextLabel.Parent = BillboardGui
					TextLabel.BackgroundTransparency = 1
					TextLabel.Position = UDim2.new(0, 0, 0, -50)
					TextLabel.Size = UDim2.new(0, 100, 0, 100)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.TextSize = 20
					TextLabel.TextColor3 = Color3.new(1, 1, 1)
					TextLabel.TextStrokeTransparency = 0
					TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
					TextLabel.Text = 'Name: '..plr.Name
					TextLabel.ZIndex = 10
					local espLoopFunc
					local teamChange
					local addedFunc
					addedFunc = plr.CharacterAdded:Connect(function()
						if ESPenabled then
							espLoopFunc:Disconnect()
							teamChange:Disconnect()
							ESPholder:Destroy()
							repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
							ESP(plr)
							addedFunc:Disconnect()
						else
							teamChange:Disconnect()
							addedFunc:Disconnect()
						end
					end)
					teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
						if ESPenabled then
							espLoopFunc:Disconnect()
							addedFunc:Disconnect()
							ESPholder:Destroy()
							repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
							ESP(plr)
							teamChange:Disconnect()
						else
							teamChange:Disconnect()
						end
					end)
					local function espLoop()
						if COREGUI:FindFirstChild(plr.Name..'_ESP') then
							if plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid") and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
								local pos = math.floor((getRoot(Players.LocalPlayer.Character).Position - getRoot(plr.Character).Position).magnitude)
								TextLabel.Text = 'Name: '..plr.Name..' | Health: '..round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos
							end
						else
							teamChange:Disconnect()
							addedFunc:Disconnect()
							espLoopFunc:Disconnect()
						end
					end
					espLoopFunc = RunService.RenderStepped:Connect(espLoop)
				end
			end
		end)
	end

	function CHMS(plr)
		task.spawn(function()
			for i,v in pairs(COREGUI:GetChildren()) do
				if v.Name == plr.Name..'_CHMS' then
					v:Destroy()
				end
			end
			wait()
			if plr.Character and plr.Name ~= Players.LocalPlayer.Name and not COREGUI:FindFirstChild(plr.Name..'_CHMS') then
				local ESPholder = Instance.new("Folder")
				ESPholder.Name = plr.Name..'_CHMS'
				ESPholder.Parent = COREGUI
				repeat wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
				for b,n in pairs (plr.Character:GetChildren()) do
					if (n:IsA("BasePart")) then
						local a = Instance.new("BoxHandleAdornment")
						a.Name = plr.Name
						a.Parent = ESPholder
						a.Adornee = n
						a.AlwaysOnTop = true
						a.ZIndex = 10
						a.Size = n.Size
						a.Transparency = espTransparency
						a.Color = plr.TeamColor
					end
				end
				local addedFunc
				local teamChange
				local CHMSremoved
				addedFunc = plr.CharacterAdded:Connect(function()
					if CHMSenabled then
						ESPholder:Destroy()
						teamChange:Disconnect()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
						CHMS(plr)
						addedFunc:Disconnect()
					else
						teamChange:Disconnect()
						addedFunc:Disconnect()
					end
				end)
				teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
					if CHMSenabled then
						ESPholder:Destroy()
						addedFunc:Disconnect()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
						CHMS(plr)
						teamChange:Disconnect()
					else
						teamChange:Disconnect()
					end
				end)
				CHMSremoved = ESPholder.AncestryChanged:Connect(function()
					teamChange:Disconnect()
					addedFunc:Disconnect()
					CHMSremoved:Disconnect()
				end)
			end
		end)
	end

	function Locate(plr)
		task.spawn(function()
			for i,v in pairs(COREGUI:GetChildren()) do
				if v.Name == plr.Name..'_LC' then
					v:Destroy()
				end
			end
			wait()
			if plr.Character and plr.Name ~= Players.LocalPlayer.Name and not COREGUI:FindFirstChild(plr.Name..'_LC') then
				local ESPholder = Instance.new("Folder")
				ESPholder.Name = plr.Name..'_LC'
				ESPholder.Parent = COREGUI
				repeat wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
				for b,n in pairs (plr.Character:GetChildren()) do
					if (n:IsA("BasePart")) then
						local a = Instance.new("BoxHandleAdornment")
						a.Name = plr.Name
						a.Parent = ESPholder
						a.Adornee = n
						a.AlwaysOnTop = true
						a.ZIndex = 10
						a.Size = n.Size
						a.Transparency = espTransparency
						a.Color = plr.TeamColor
					end
				end
				if plr.Character and plr.Character:FindFirstChild('Head') then
					local BillboardGui = Instance.new("BillboardGui")
					local TextLabel = Instance.new("TextLabel")
					BillboardGui.Adornee = plr.Character.Head
					BillboardGui.Name = plr.Name
					BillboardGui.Parent = ESPholder
					BillboardGui.Size = UDim2.new(0, 100, 0, 150)
					BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
					BillboardGui.AlwaysOnTop = true
					TextLabel.Parent = BillboardGui
					TextLabel.BackgroundTransparency = 1
					TextLabel.Position = UDim2.new(0, 0, 0, -50)
					TextLabel.Size = UDim2.new(0, 100, 0, 100)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.TextSize = 20
					TextLabel.TextColor3 = Color3.new(1, 1, 1)
					TextLabel.TextStrokeTransparency = 0
					TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
					TextLabel.Text = 'Name: '..plr.Name
					TextLabel.ZIndex = 10
					local lcLoopFunc
					local addedFunc
					local teamChange
					addedFunc = plr.CharacterAdded:Connect(function()
						if ESPholder ~= nil and ESPholder.Parent ~= nil then
							lcLoopFunc:Disconnect()
							teamChange:Disconnect()
							ESPholder:Destroy()
							repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
							Locate(plr)
							addedFunc:Disconnect()
						else
							teamChange:Disconnect()
							addedFunc:Disconnect()
						end
					end)
					teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
						if ESPholder ~= nil and ESPholder.Parent ~= nil then
							lcLoopFunc:Disconnect()
							addedFunc:Disconnect()
							ESPholder:Destroy()
							repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
							Locate(plr)
							teamChange:Disconnect()
						else
							teamChange:Disconnect()
						end
					end)
					local function lcLoop()
						if COREGUI:FindFirstChild(plr.Name..'_LC') then
							if plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid") and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
								local pos = math.floor((getRoot(Players.LocalPlayer.Character).Position - getRoot(plr.Character).Position).magnitude)
								TextLabel.Text = 'Name: '..plr.Name..' | Health: '..round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos
							end
						else
							teamChange:Disconnect()
							addedFunc:Disconnect()
							lcLoopFunc:Disconnect()
						end
					end
					lcLoopFunc = RunService.RenderStepped:Connect(lcLoop)
				end
			end
		end)
	end

	local bindsGUI = KeybindEditor
	local awaitingInput = false
	local keySelected = false

	function refreshbinds()
		if Holder_2 then
			Holder_2:ClearAllChildren()
			Holder_2.CanvasSize = UDim2.new(0, 0, 0, 10)
			for i = 1, #binds do
				local YSize = 25
				local Position = ((i * YSize) - YSize)
				local newbind = Example_2:Clone()
				newbind.Parent = Holder_2
				newbind.Visible = true
				newbind.Position = UDim2.new(0,0,0, Position + 5)
				table.insert(shade2,newbind)
				table.insert(shade2,newbind.Text)
				table.insert(text1,newbind.Text)
				table.insert(shade3,newbind.Text.Delete)
				table.insert(text2,newbind.Text.Delete)
				local input = tostring(binds[i].KEY)
				local key
				if input == 'RightClick' or input == 'LeftClick' then
					key = input
				else
					key = input:sub(14)
				end
				if binds[i].TOGGLE then
					newbind.Text.Text = key.." > "..binds[i].COMMAND.." / "..binds[i].TOGGLE
				else
					newbind.Text.Text = key.." > "..binds[i].COMMAND.."  "..(binds[i].ISKEYUP and "(keyup)" or "(keydown)")
				end
				Holder_2.CanvasSize = UDim2.new(0,0,0, Position + 30)
				newbind.Text.Delete.MouseButton1Click:Connect(function()
					unkeybind(binds[i].COMMAND,binds[i].KEY)
				end)
			end
		end
	end

	refreshbinds()

	toggleOn = {}

	function unkeybind(cmd,key)
		for i = #binds,1,-1 do
			if binds[i].COMMAND == cmd and binds[i].KEY == key then
				toggleOn[binds[i]] = nil
				table.remove(binds, i)
			end
		end
		refreshbinds()
		updatesaves()
		if key == 'RightClick' or key == 'LeftClick' then
			notify('Keybinds Updated','Unbinded '..key..' from '..cmd)
		else
			notify('Keybinds Updated','Unbinded '..key:sub(14)..' from '..cmd)
		end
	end

	PositionsFrame.Delete.MouseButton1Click:Connect(function()
		execCmd('cpos')
	end)

	function refreshwaypoints()
		if #WayPoints > 0 or #pWayPoints > 0 then
			PositionsHint:Destroy()
		end
		if Holder_4 then
			Holder_4:ClearAllChildren()
			Holder_4.CanvasSize = UDim2.new(0, 0, 0, 10)
			local YSize = 25
			local num = 1
			for i = 1, #WayPoints do
				local Position = ((num * YSize) - YSize)
				local newpoint = Example_4:Clone()
				newpoint.Parent = Holder_4
				newpoint.Visible = true
				newpoint.Position = UDim2.new(0,0,0, Position + 5)
				newpoint.Text.Text = WayPoints[i].NAME
				table.insert(shade2,newpoint)
				table.insert(shade2,newpoint.Text)
				table.insert(text1,newpoint.Text)
				table.insert(shade3,newpoint.Text.Delete)
				table.insert(text2,newpoint.Text.Delete)
				table.insert(shade3,newpoint.Text.TP)
				table.insert(text2,newpoint.Text.TP)
				Holder_4.CanvasSize = UDim2.new(0,0,0, Position + 30)
				newpoint.Text.Delete.MouseButton1Click:Connect(function()
					execCmd('dpos '..WayPoints[i].NAME)
				end)
				newpoint.Text.TP.MouseButton1Click:Connect(function()
					execCmd("loadpos "..WayPoints[i].NAME)
				end)
				num = num+1
			end
			for i = 1, #pWayPoints do
				local Position = ((num * YSize) - YSize)
				local newpoint = Example_4:Clone()
				newpoint.Parent = Holder_4
				newpoint.Visible = true
				newpoint.Position = UDim2.new(0,0,0, Position + 5)
				newpoint.Text.Text = pWayPoints[i].NAME
				table.insert(shade2,newpoint)
				table.insert(shade2,newpoint.Text)
				table.insert(text1,newpoint.Text)
				table.insert(shade3,newpoint.Text.Delete)
				table.insert(text2,newpoint.Text.Delete)
				table.insert(shade3,newpoint.Text.TP)
				table.insert(text2,newpoint.Text.TP)
				Holder_4.CanvasSize = UDim2.new(0,0,0, Position + 30)
				newpoint.Text.Delete.MouseButton1Click:Connect(function()
					execCmd('dpos '..pWayPoints[i].NAME)
				end)
				newpoint.Text.TP.MouseButton1Click:Connect(function()
					execCmd("loadpos "..pWayPoints[i].NAME)
				end)
				num = num+1
			end
		end
	end

	refreshwaypoints()

	function refreshaliases()
		if #aliases > 0 then
			AliasHint:Destroy()
		end
		if Holder_3 then
			Holder_3:ClearAllChildren()
			Holder_3.CanvasSize = UDim2.new(0, 0, 0, 10)
			for i = 1, #aliases do
				local YSize = 25
				local Position = ((i * YSize) - YSize)
				local newalias = Example_3:Clone()
				newalias.Parent = Holder_3
				newalias.Visible = true
				newalias.Position = UDim2.new(0,0,0, Position + 5)
				newalias.Text.Text = aliases[i].CMD.." > "..aliases[i].ALIAS
				table.insert(shade2,newalias)
				table.insert(shade2,newalias.Text)
				table.insert(text1,newalias.Text)
				table.insert(shade3,newalias.Text.Delete)
				table.insert(text2,newalias.Text.Delete)
				Holder_3.CanvasSize = UDim2.new(0,0,0, Position + 30)
				newalias.Text.Delete.MouseButton1Click:Connect(function()
					execCmd('removealias '..aliases[i].ALIAS)
				end)
			end
		end
	end

	local bindChosenKeyUp = false

	BindTo.MouseButton1Click:Connect(function()
		awaitingInput = true
		BindTo.Text = 'Press something'
	end)

	BindTriggerSelect.MouseButton1Click:Connect(function()
		bindChosenKeyUp = not bindChosenKeyUp
		BindTriggerSelect.Text = bindChosenKeyUp and "KeyUp" or "KeyDown"
	end)

	newToggle = false
	Cmdbar_3.Parent.Visible = false
	On_2.MouseButton1Click:Connect(function()
		if newToggle == false then newToggle = true
			On_2.BackgroundTransparency = 0
			Cmdbar_3.Parent.Visible = true
			BindTriggerSelect.Visible = false
		else newToggle = false
			On_2.BackgroundTransparency = 1
			Cmdbar_3.Parent.Visible = false
			BindTriggerSelect.Visible = true
		end
	end)

	Add_2.MouseButton1Click:Connect(function()
		if keySelected then
			if string.find(Cmdbar_2.Text, "\\\\") or string.find(Cmdbar_3.Text, "\\\\") then
				notify('Keybind Error','Only use one backslash to keybind multiple commands into one keybind or command')
			else
				if newToggle and Cmdbar_3.Text ~= '' and Cmdbar_2.text ~= '' then
					addbind(Cmdbar_2.Text,keyPressed,false,Cmdbar_3.Text)
				elseif not newToggle and Cmdbar_2.text ~= '' then
					addbind(Cmdbar_2.Text,keyPressed,bindChosenKeyUp)
				else
					return
				end
				refreshbinds()
				updatesaves()
				if keyPressed == 'RightClick' or keyPressed == 'LeftClick' then
					notify('Keybinds Updated','Binded '..keyPressed..' to '..Cmdbar_2.Text..(newToggle and " / "..Cmdbar_3.Text or ""))
				else
					notify('Keybinds Updated','Binded '..keyPressed:sub(14)..' to '..Cmdbar_2.Text..(newToggle and " / "..Cmdbar_3.Text or ""))
				end
			end
		end
	end)

	Exit_2.MouseButton1Click:Connect(function()
		Cmdbar_2.Text = 'Command'
		Cmdbar_3.Text = 'Command 2'
		BindTo.Text = 'Click to bind'
		bindChosenKeyUp = false
		BindTriggerSelect.Text = "KeyDown"
		keySelected = false
		KeybindEditor:TweenPosition(UDim2.new(0.5, -180, 0, -500), "InOut", "Quart", 0.5, true, nil)
	end)

	function onInputBegan(input,gameProcessed)
		if awaitingInput then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				keyPressed = tostring(input.KeyCode)
				BindTo.Text = keyPressed:sub(14)
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
				keyPressed = 'LeftClick'
				BindTo.Text = 'LeftClick'
			elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
				keyPressed = 'RightClick'
				BindTo.Text = 'RightClick'
			end
			awaitingInput = false
			keySelected = true
		end
		if not gameProcessed and #binds > 0 then
			for i,v in pairs(binds) do
				if not v.ISKEYUP then
					if (input.UserInputType == Enum.UserInputType.Keyboard and v.KEY:lower()==tostring(input.KeyCode):lower()) or (input.UserInputType == Enum.UserInputType.MouseButton1 and v.KEY:lower()=='leftclick') or (input.UserInputType == Enum.UserInputType.MouseButton2 and v.KEY:lower()=='rightclick') then
						if v.TOGGLE then
							local isOn = toggleOn[v] == true
							toggleOn[v] = not isOn
							if isOn then
								execCmd(v.TOGGLE,Players.LocalPlayer)
							else
								execCmd(v.COMMAND,Players.LocalPlayer)
							end
						else
							execCmd(v.COMMAND,Players.LocalPlayer)
						end
					end
				end
			end
		end
	end

	function onInputEnded(input,gameProcessed)
		if not gameProcessed and #binds > 0 then
			for i,v in pairs(binds) do
				if v.ISKEYUP then
					if (input.UserInputType == Enum.UserInputType.Keyboard and v.KEY:lower()==tostring(input.KeyCode):lower()) or (input.UserInputType == Enum.UserInputType.MouseButton1 and v.KEY:lower()=='leftclick') or (input.UserInputType == Enum.UserInputType.MouseButton2 and v.KEY:lower()=='rightclick') then
						execCmd(v.COMMAND,Players.LocalPlayer)
					end
				end
			end
		end
	end

	UserInputService.InputBegan:Connect(onInputBegan)
	UserInputService.InputEnded:Connect(onInputEnded)

	ClickTP.Select.MouseButton1Click:Connect(function()
		if keySelected then
			addbind('clicktp',keyPressed,bindChosenKeyUp)
			refreshbinds()
			updatesaves()
			if keyPressed == 'RightClick' or keyPressed == 'LeftClick' then
				notify('Keybinds Updated','Binded '..keyPressed..' to click tp')
			else
				notify('Keybinds Updated','Binded '..keyPressed:sub(14)..' to click tp')
			end
		end
	end)

	ClickDelete.Select.MouseButton1Click:Connect(function()
		if keySelected then
			addbind('clickdel',keyPressed,bindChosenKeyUp)
			refreshbinds()
			updatesaves()
			if keyPressed == 'RightClick' or keyPressed == 'LeftClick' then
				notify('Keybinds Updated','Binded '..keyPressed..' to click delete')
			else
				notify('Keybinds Updated','Binded '..keyPressed:sub(14)..' to click delete')
			end
		end
	end)

	local function clicktpFunc()
		pcall(function()
			local character = Players.LocalPlayer.Character
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid and humanoid.SeatPart then
				humanoid.Sit = false
				wait(0.1)
			end

			local hipHeight = humanoid and humanoid.HipHeight > 0 and (humanoid.HipHeight + 1)
			local rootPart = getRoot(character)
			local rootPartPosition = rootPart.Position
			local hitPosition = IYMouse.Hit.Position
			local newCFrame = CFrame.new(
				hitPosition, 
				Vector3.new(rootPartPosition.X, hitPosition.Y, rootPartPosition.Z)
			) * CFrame.Angles(0, math.pi, 0)

			rootPart.CFrame = newCFrame + Vector3.new(0, hipHeight or 4, 0)
		end)
	end

	IYMouse.Button1Down:Connect(function()
		for i,v in pairs(binds) do
			if v.COMMAND == 'clicktp' then
				local input = v.KEY
				if input == 'RightClick' and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and Players.LocalPlayer.Character then
					clicktpFunc()
				elseif input == 'LeftClick' and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and Players.LocalPlayer.Character then
					clicktpFunc()
				elseif UserInputService:IsKeyDown(Enum.KeyCode[input:sub(14)]) and Players.LocalPlayer.Character then
					clicktpFunc()
				end
			elseif v.COMMAND == 'clickdel' then
				local input = v.KEY
				if input == 'RightClick' and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
					pcall(function() IYMouse.Target:Destroy() end)
				elseif input == 'LeftClick' and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
					pcall(function() IYMouse.Target:Destroy() end)
				elseif UserInputService:IsKeyDown(Enum.KeyCode[input:sub(14)]) then
					pcall(function() IYMouse.Target:Destroy() end)
				end
			end
		end
	end)

	PluginsGUI = PluginEditor.background

	function addPlugin(name)
		if name:lower() == 'plugin file name' or name:lower() == 'iy_fe.iy' or name == 'iy_fe' then
			notify('Plugin Error','Please enter a valid plugin')
		else
			local file
			local fileName
			if name:sub(-3) == '.iy' then
				pcall(function() file = readfile(name) end)
				fileName = name
			else
				pcall(function() file = readfile(name..'.iy') end)
				fileName = name..'.iy'
			end
			if file then
				if not FindInTable(PluginsTable, fileName) then
					table.insert(PluginsTable, fileName)
					LoadPlugin(fileName)
					refreshplugins()
					pcall(eventEditor.Refresh)
				else
					notify('Plugin Error','This plugin is already added')
				end
			else
				notify('Plugin Error','Cannot locate file "'..fileName..'". Is the file in the correct folder?')
			end
		end
	end

	function deletePlugin(name)
		local pName = name..'.iy'
		if name:sub(-3) == '.iy' then
			pName = name
		end
		for i = #cmds,1,-1 do
			if cmds[i].PLUGIN == pName then
				table.remove(cmds, i)
			end
		end
		for i,v in pairs(CMDsF:GetChildren()) do
			if v.Name == 'PLUGIN_'..pName then
				v:Destroy()
			end
		end
		for i,v in pairs(PluginsTable) do
			if v == pName then
				table.remove(PluginsTable, i)
				notify('Removed Plugin',pName..' was removed')
			end
		end
		IndexContents('',true)
		refreshplugins()
	end

	function refreshplugins(dontSave)
		if #PluginsTable > 0 then
			PluginsHint:Destroy()
		end
		if Holder_5 then
			Holder_5:ClearAllChildren()
			Holder_5.CanvasSize = UDim2.new(0, 0, 0, 10)
			for i,v in pairs(PluginsTable) do
				local pName = v
				local YSize = 25
				local Position = ((i * YSize) - YSize)
				local newplugin = Example_5:Clone()
				newplugin.Parent = Holder_5
				newplugin.Visible = true
				newplugin.Position = UDim2.new(0,0,0, Position + 5)
				newplugin.Text.Text = pName
				table.insert(shade2,newplugin)
				table.insert(shade2,newplugin.Text)
				table.insert(text1,newplugin.Text)
				table.insert(shade3,newplugin.Text.Delete)
				table.insert(text2,newplugin.Text.Delete)
				Holder_5.CanvasSize = UDim2.new(0,0,0, Position + 30)
				newplugin.Text.Delete.MouseButton1Click:Connect(function()
					deletePlugin(pName)
				end)
			end
			if not dontSave then
				updatesaves()
			end
		end
	end

	local PluginCache
	function LoadPlugin(val,startup)
		local plugin

		function CatchedPluginLoad()
			plugin = loadfile(val)()
		end

		function handlePluginError(plerror)
			notify('Plugin Error','An error occurred with the plugin, "'..val..'" and it could not be loaded')
			if FindInTable(PluginsTable,val) then
				for i,v in pairs(PluginsTable) do
					if v == val then
						table.remove(PluginsTable,i)
					end
				end
			end
			updatesaves()

			print("Original Error: "..tostring(plerror))
			print("Plugin Error, stack traceback: "..tostring(debug.traceback()))

			plugin = nil

			return false
		end

		xpcall(CatchedPluginLoad, handlePluginError)

		if plugin ~= nil then
			if not startup then
				notify('Loaded Plugin',"Name: "..plugin["PluginName"].."\n".."Description: "..plugin["PluginDescription"])
			end
			addcmdtext('',val)
			addcmdtext(string.upper('--'..plugin["PluginName"]),val,plugin["PluginDescription"])
			if plugin["Commands"] then
				for i,v in pairs(plugin["Commands"]) do 
					local cmdExt = ''
					local cmdName = i
					local function handleNames()
						cmdName = i
						if findCmd(cmdName..cmdExt) then
							if isNumber(cmdExt) then
								cmdExt = cmdExt+1
							else
								cmdExt = 1
							end
							handleNames()
						else
							cmdName = cmdName..cmdExt
						end
					end
					handleNames()
					addcmd(cmdName, v["Aliases"], v["Function"], val)
					if v["ListName"] then
						local newName = v.ListName
						local cmdNames = {i,unpack(v.Aliases)}
						for i,v in pairs(cmdNames) do
							newName = newName:gsub(v,v..cmdExt)
						end
						addcmdtext(newName,val,v["Description"])
					else
						addcmdtext(cmdName,val,v["Description"])
					end
				end
			end
			IndexContents('',true)
		elseif plugin == nil then
			plugin = nil
		end
	end

	function FindPlugins()
		if PluginsTable ~= nil and type(PluginsTable) == "table" then
			for i,v in pairs(PluginsTable) do
				LoadPlugin(v,true)
			end
			refreshplugins(true)
		end
	end

	AddPlugin.MouseButton1Click:Connect(function()
		addPlugin(PluginsGUI.FileName.Text)
	end)

	Exit_3.MouseButton1Click:Connect(function()
		PluginEditor:TweenPosition(UDim2.new(0.5, -180, 0, -500), "InOut", "Quart", 0.5, true, nil)
		FileName.Text = 'Plugin File Name'
	end)

	Add_3.MouseButton1Click:Connect(function()
		PluginEditor:TweenPosition(UDim2.new(0.5, -180, 0, 310), "InOut", "Quart", 0.5, true, nil)
	end)

	Plugins.MouseButton1Click:Connect(function()
		if writefileExploit() then
			PluginsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
			wait(0.5)
			SettingsHolder.Visible = false
		else
			notify('Incompatible Exploit','Your exploit is unable to use plugins (missing read/writefile)')
		end
	end)

	Close_4.MouseButton1Click:Connect(function()
		SettingsHolder.Visible = true
		PluginsFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
	end)

	local TeleportCheck = false
	Players.LocalPlayer.OnTeleport:Connect(function(State)
		if KeepInfYield and (not TeleportCheck) and queueteleport then
			TeleportCheck = true
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/fgdergewrgegr/SVH/main/myiy'))()")
		end
	end)

	addcmd('addalias',{},function(args, speaker)
		if #args < 2 then return end
		local cmd = string.lower(args[1])
		local alias = string.lower(args[2])
		for i,v in pairs(cmds) do
			if v.NAME:lower()==cmd or FindInTable(v.ALIAS,cmd) then
				customAlias[alias] = v
				aliases[#aliases + 1] = {CMD = cmd, ALIAS = alias}
				notify('Aliases Modified',"Added "..alias.." as an alias to "..cmd)
				updatesaves()
				refreshaliases()
				break
			end
		end
	end)

	addcmd('removealias',{},function(args, speaker)
		if #args < 1 then return end
		local alias = string.lower(args[1])
		if customAlias[alias] then
			local cmd = customAlias[alias].NAME
			customAlias[alias] = nil
			for i = #aliases,1,-1 do
				if aliases[i].ALIAS == tostring(alias) then
					table.remove(aliases, i)
				end
			end
			notify('Aliases Modified',"Removed the alias "..alias.." from "..cmd)
			updatesaves()
			refreshaliases()
		end
	end)

	addcmd('clraliases',{},function(args, speaker)
		customAlias = {}
		aliases = {}
		notify('Aliases Modified','Removed all aliases')
		updatesaves()
		refreshaliases()
	end)

	addcmd('discord', {'support', 'help'}, function(args, speaker)
		if everyClipboard then
			toClipboard('https://discord.com/invite/dYHag43eeU')
			notify('Discord Invite', 'Copied to clipboard!\ndiscord.gg/dYHag43eeU')
		else
			notify('Discord Invite', 'discord.gg/dYHag43eeU')
		end
		if httprequest then
			httprequest({
				Url = 'http://127.0.0.1:6463/rpc?v=1',
				Method = 'POST',
				Headers = {
					['Content-Type'] = 'application/json',
					Origin = 'https://discord.com'
				},
				Body = HttpService:JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = HttpService:GenerateGUID(false),
					args = {code = 'dYHag43eeU'}
				})
			})
		end
	end)

	addcmd('keepiy', {}, function(args, speaker)
		if queueteleport then
			KeepInfYield = true
			updatesaves()
		else
			notify('Incompatible Exploit','Your exploit does not support this command (missing queue_on_teleport)')
		end
	end)

	addcmd('unkeepiy', {}, function(args, speaker)
		if queueteleport then
			KeepInfYield = false
			updatesaves()
		else
			notify('Incompatible Exploit','Your exploit does not support this command (missing queue_on_teleport)')
		end
	end)

	addcmd('togglekeepiy', {}, function(args, speaker)
		if queueteleport then
			KeepInfYield = not KeepInfYield
			updatesaves()
		else
			notify('Incompatible Exploit','Your exploit does not support this command (missing queue_on_teleport)')
		end
	end)

	local canOpenServerinfo = true
	addcmd('serverinfo',{'info','sinfo'},function(args, speaker)
		if not canOpenServerinfo then return end
		canOpenServerinfo = false
		task.spawn(function()
			local FRAME = Instance.new("Frame")
			local shadow = Instance.new("Frame")
			local PopupText = Instance.new("TextLabel")
			local Exit = Instance.new("TextButton")
			local ExitImage = Instance.new("ImageLabel")
			local background = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local TextLabel2 = Instance.new("TextLabel")
			local TextLabel3 = Instance.new("TextLabel")
			local Time = Instance.new("TextLabel")
			local appearance = Instance.new("TextLabel")
			local maxplayers = Instance.new("TextLabel")
			local name = Instance.new("TextLabel")
			local placeid = Instance.new("TextLabel")
			local playerid = Instance.new("TextLabel")
			local players = Instance.new("TextLabel")
			local CopyApp = Instance.new("TextButton")
			local CopyPlrID = Instance.new("TextButton")
			local CopyPlcID = Instance.new("TextButton")
			local CopyPlcName = Instance.new("TextButton")

			FRAME.Name = randomString()
			FRAME.Parent = PARENT
			FRAME.Active = true
			FRAME.BackgroundTransparency = 1
			FRAME.Position = UDim2.new(0.5, -130, 0, -500)
			FRAME.Size = UDim2.new(0, 250, 0, 20)
			FRAME.ZIndex = 10
			dragGUI(FRAME)

			shadow.Name = "shadow"
			shadow.Parent = FRAME
			shadow.BackgroundColor3 = currentShade2
			shadow.BorderSizePixel = 0
			shadow.Size = UDim2.new(0, 250, 0, 20)
			shadow.ZIndex = 10
			table.insert(shade2,shadow)

			PopupText.Name = "PopupText"
			PopupText.Parent = shadow
			PopupText.BackgroundTransparency = 1
			PopupText.Size = UDim2.new(1, 0, 0.95, 0)
			PopupText.ZIndex = 10
			PopupText.Font = Enum.Font.SourceSans
			PopupText.TextSize = 14
			PopupText.Text = "Server"
			PopupText.TextColor3 = currentText1
			PopupText.TextWrapped = true
			table.insert(text1,PopupText)

			Exit.Name = "Exit"
			Exit.Parent = shadow
			Exit.BackgroundTransparency = 1
			Exit.Position = UDim2.new(1, -20, 0, 0)
			Exit.Size = UDim2.new(0, 20, 0, 20)
			Exit.Text = ""
			Exit.ZIndex = 10

			ExitImage.Parent = Exit
			ExitImage.BackgroundColor3 = Color3.new(1, 1, 1)
			ExitImage.BackgroundTransparency = 1
			ExitImage.Position = UDim2.new(0, 5, 0, 5)
			ExitImage.Size = UDim2.new(0, 10, 0, 10)
			ExitImage.Image = "rbxassetid://5054663650"
			ExitImage.ZIndex = 10

			background.Name = "background"
			background.Parent = FRAME
			background.Active = true
			background.BackgroundColor3 = currentShade1
			background.BorderSizePixel = 0
			background.Position = UDim2.new(0, 0, 1, 0)
			background.Size = UDim2.new(0, 250, 0, 250)
			background.ZIndex = 10
			table.insert(shade1,background)

			TextLabel.Name = "Text Label"
			TextLabel.Parent = background
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 5, 0, 80)
			TextLabel.Size = UDim2.new(0, 100, 0, 20)
			TextLabel.ZIndex = 10
			TextLabel.Font = Enum.Font.SourceSansLight
			TextLabel.TextSize = 20
			TextLabel.Text = "Run Time:"
			TextLabel.TextColor3 = currentText1
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(text1,TextLabel)

			TextLabel2.Name = "Text Label2"
			TextLabel2.Parent = background
			TextLabel2.BackgroundTransparency = 1
			TextLabel2.BorderSizePixel = 0
			TextLabel2.Position = UDim2.new(0, 5, 0, 130)
			TextLabel2.Size = UDim2.new(0, 100, 0, 20)
			TextLabel2.ZIndex = 10
			TextLabel2.Font = Enum.Font.SourceSansLight
			TextLabel2.TextSize = 20
			TextLabel2.Text = "Statistics:"
			TextLabel2.TextColor3 = currentText1
			TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(text1,TextLabel2)

			TextLabel3.Name = "Text Label3"
			TextLabel3.Parent = background
			TextLabel3.BackgroundTransparency = 1
			TextLabel3.BorderSizePixel = 0
			TextLabel3.Position = UDim2.new(0, 5, 0, 10)
			TextLabel3.Size = UDim2.new(0, 100, 0, 20)
			TextLabel3.ZIndex = 10
			TextLabel3.Font = Enum.Font.SourceSansLight
			TextLabel3.TextSize = 20
			TextLabel3.Text = "Local Player:"
			TextLabel3.TextColor3 = currentText1
			TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(text1,TextLabel3)

			Time.Name = "Time"
			Time.Parent = background
			Time.BackgroundTransparency = 1
			Time.BorderSizePixel = 0
			Time.Position = UDim2.new(0, 5, 0, 105)
			Time.Size = UDim2.new(0, 100, 0, 20)
			Time.ZIndex = 10
			Time.Font = Enum.Font.SourceSans
			Time.FontSize = Enum.FontSize.Size14
			Time.Text = "LOADING"
			Time.TextColor3 = currentText1
			Time.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(text1,Time)

			appearance.Name = "appearance"
			appearance.Parent = background
			appearance.BackgroundTransparency = 1
			appearance.BorderSizePixel = 0
			appearance.Position = UDim2.new(0, 5, 0, 55)
			appearance.Size = UDim2.new(0, 100, 0, 20)
			appearance.ZIndex = 10
			appearance.Font = Enum.Font.SourceSans
			appearance.FontSize = Enum.FontSize.Size14
			appearance.Text = "Appearance: LOADING"
			appearance.TextColor3 = currentText1
			appearance.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(text1,appearance)

			maxplayers.Name = "maxplayers"
			maxplayers.Parent = background
			maxplayers.BackgroundTransparency = 1
			maxplayers.BorderSizePixel = 0
			maxplayers.Position = UDim2.new(0, 5, 0, 175)
			maxplayers.Size = UDim2.new(0, 100, 0, 20)
			maxplayers.ZIndex = 10
			maxplayers.Font = Enum.Font.SourceSans
			maxplayers.FontSize = Enum.FontSize.Size14
			maxplayers.Text = "LOADING"
			maxplayers.TextColor3 = currentText1
			maxplayers.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(text1,maxplayers)

			name.Name = "name"
			name.Parent = background
			name.BackgroundTransparency = 1
			name.BorderSizePixel = 0
			name.Position = UDim2.new(0, 5, 0, 215)
			name.Size = UDim2.new(0, 240, 0, 30)
			name.ZIndex = 10
			name.Font = Enum.Font.SourceSans
			name.FontSize = Enum.FontSize.Size14
			name.Text = "Place Name: LOADING"
			name.TextColor3 = currentText1
			name.TextWrapped = true
			name.TextXAlignment = Enum.TextXAlignment.Left
			name.TextYAlignment = Enum.TextYAlignment.Top
			table.insert(text1,name)

			placeid.Name = "placeid"
			placeid.Parent = background
			placeid.BackgroundTransparency = 1
			placeid.BorderSizePixel = 0
			placeid.Position = UDim2.new(0, 5, 0, 195)
			placeid.Size = UDim2.new(0, 100, 0, 20)
			placeid.ZIndex = 10
			placeid.Font = Enum.Font.SourceSans
			placeid.FontSize = Enum.FontSize.Size14
			placeid.Text = "Place ID: LOADING"
			placeid.TextColor3 = currentText1
			placeid.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(text1,placeid)

			playerid.Name = "playerid"
			playerid.Parent = background
			playerid.BackgroundTransparency = 1
			playerid.BorderSizePixel = 0
			playerid.Position = UDim2.new(0, 5, 0, 35)
			playerid.Size = UDim2.new(0, 100, 0, 20)
			playerid.ZIndex = 10
			playerid.Font = Enum.Font.SourceSans
			playerid.FontSize = Enum.FontSize.Size14
			playerid.Text = "Player ID: LOADING"
			playerid.TextColor3 = currentText1
			playerid.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(text1,playerid)

			players.Name = "players"
			players.Parent = background
			players.BackgroundTransparency = 1
			players.BorderSizePixel = 0
			players.Position = UDim2.new(0, 5, 0, 155)
			players.Size = UDim2.new(0, 100, 0, 20)
			players.ZIndex = 10
			players.Font = Enum.Font.SourceSans
			players.FontSize = Enum.FontSize.Size14
			players.Text = "LOADING"
			players.TextColor3 = currentText1
			players.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(text1,players)

			CopyApp.Name = "CopyApp"
			CopyApp.Parent = background
			CopyApp.BackgroundColor3 = currentShade2
			CopyApp.BorderSizePixel = 0
			CopyApp.Position = UDim2.new(0, 210, 0, 55)
			CopyApp.Size = UDim2.new(0, 35, 0, 20)
			CopyApp.Font = Enum.Font.SourceSans
			CopyApp.TextSize = 14
			CopyApp.Text = "Copy"
			CopyApp.TextColor3 = currentText1
			CopyApp.ZIndex = 10
			table.insert(shade2,CopyApp)
			table.insert(text1,CopyApp)

			CopyPlrID.Name = "CopyPlrID"
			CopyPlrID.Parent = background
			CopyPlrID.BackgroundColor3 = currentShade2
			CopyPlrID.BorderSizePixel = 0
			CopyPlrID.Position = UDim2.new(0, 210, 0, 35)
			CopyPlrID.Size = UDim2.new(0, 35, 0, 20)
			CopyPlrID.Font = Enum.Font.SourceSans
			CopyPlrID.TextSize = 14
			CopyPlrID.Text = "Copy"
			CopyPlrID.TextColor3 = currentText1
			CopyPlrID.ZIndex = 10
			table.insert(shade2,CopyPlrID)
			table.insert(text1,CopyPlrID)

			CopyPlcID.Name = "CopyPlcID"
			CopyPlcID.Parent = background
			CopyPlcID.BackgroundColor3 = currentShade2
			CopyPlcID.BorderSizePixel = 0
			CopyPlcID.Position = UDim2.new(0, 210, 0, 195)
			CopyPlcID.Size = UDim2.new(0, 35, 0, 20)
			CopyPlcID.Font = Enum.Font.SourceSans
			CopyPlcID.TextSize = 14
			CopyPlcID.Text = "Copy"
			CopyPlcID.TextColor3 = currentText1
			CopyPlcID.ZIndex = 10
			table.insert(shade2,CopyPlcID)
			table.insert(text1,CopyPlcID)

			CopyPlcName.Name = "CopyPlcName"
			CopyPlcName.Parent = background
			CopyPlcName.BackgroundColor3 = currentShade2
			CopyPlcName.BorderSizePixel = 0
			CopyPlcName.Position = UDim2.new(0, 210, 0, 215)
			CopyPlcName.Size = UDim2.new(0, 35, 0, 20)
			CopyPlcName.Font = Enum.Font.SourceSans
			CopyPlcName.TextSize = 14
			CopyPlcName.Text = "Copy"
			CopyPlcName.TextColor3 = currentText1
			CopyPlcName.ZIndex = 10
			table.insert(shade2,CopyPlcName)
			table.insert(text1,CopyPlcName)

			local SINFOGUI = background
			FRAME:TweenPosition(UDim2.new(0.5, -130, 0, 100), "InOut", "Quart", 0.5, true, nil) 
			wait(0.5)
			Exit.MouseButton1Click:Connect(function()
				FRAME:TweenPosition(UDim2.new(0.5, -130, 0, -500), "InOut", "Quart", 0.5, true, nil) 
				wait(0.6)
				FRAME:Destroy()
				canOpenServerinfo = true
			end)
			local Asset = MarketplaceService:GetProductInfo(PlaceId)
			SINFOGUI.name.Text = "Place Name: " .. Asset.Name
			SINFOGUI.playerid.Text = "Player ID: " ..speaker.UserId
			SINFOGUI.maxplayers.Text = Players.MaxPlayers.. " Players Max"
			SINFOGUI.placeid.Text = "Place ID: " ..PlaceId

			CopyApp.MouseButton1Click:Connect(function()
				toClipboard(speaker.CharacterAppearanceId)
			end)
			CopyPlrID.MouseButton1Click:Connect(function()
				toClipboard(speaker.UserId)
			end)
			CopyPlcID.MouseButton1Click:Connect(function()
				toClipboard(PlaceId)
			end)
			CopyPlcName.MouseButton1Click:Connect(function()
				toClipboard(Asset.Name)
			end)

			repeat
				players = Players:GetPlayers()
				SINFOGUI.players.Text = #players.. " Player(s)"
				SINFOGUI.appearance.Text = "Appearance: " ..speaker.CharacterAppearanceId
				local seconds = math.floor(workspace.DistributedGameTime)
				local minutes = math.floor(workspace.DistributedGameTime / 60)
				local hours = math.floor(workspace.DistributedGameTime / 60 / 60)
				local seconds = seconds - (minutes * 60)
				local minutes = minutes - (hours * 60)
				if hours < 1 then if minutes < 1 then
						SINFOGUI.Time.Text = seconds .. " Second(s)" else
						SINFOGUI.Time.Text = minutes .. " Minute(s), " .. seconds .. " Second(s)"
					end
				else
					SINFOGUI.Time.Text = hours .. " Hour(s), " .. minutes .. " Minute(s), " .. seconds .. " Second(s)"
				end
				wait(1)
			until SINFOGUI.Parent == nil
		end)
	end)

	addcmd('jobid',{},function(args, speaker)
		local jobId = 'Roblox.GameLauncher.joinGameInstance('..PlaceId..', "'..JobId..'")'
		toClipboard(jobId)
	end)

	addcmd('notifyjobid',{},function(args, speaker)
		notify('JobId / PlaceId',JobId..' / '..PlaceId)
	end)

	addcmd('breakloops',{'break'},function(args, speaker)
		lastBreakTime = tick()
	end)

	addcmd('gametp',{'gameteleport'},function(args, speaker)
		TeleportService:Teleport(args[1])
	end)

	addcmd("rejoin", {"rj"}, function(args, speaker)
		if #Players:GetPlayers() <= 1 then
			Players.LocalPlayer:Kick("\nRejoining...")
			wait()
			TeleportService:Teleport(PlaceId, Players.LocalPlayer)
		else
			TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
		end
	end)

	addcmd("autorejoin", {"autorj"}, function(args, speaker)
		GuiService.ErrorMessageChanged:Connect(function()
			execCmd("rejoin")
		end)
		notify("Auto Rejoin", "Auto rejoin enabled")
	end)

	addcmd("serverhop", {"shop"}, function(args, speaker)
		-- thanks to NoobSploit for fixing
		if httprequest then
			local servers = {}
			local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
			local body = HttpService:JSONDecode(req.Body)

			if body and body.data then
				for i, v in next, body.data do
					if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
						table.insert(servers, 1, v.id)
					end
				end
			end

			if #servers > 0 then
				TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
			else
				return notify("Serverhop", "Couldn't find a server.")
			end
		else
			notify("Incompatible Exploit", "Your exploit does not support this command (missing request)")
		end
	end)

	addcmd('joinplayer',{'joinp'},function(args, speaker)
		local retries = 0
		function ToServer(User,Place)	
			if args[2] == nil then Place = PlaceId end
			if not pcall(function()
					local FoundUser, UserId = pcall(function()
						if tonumber(User) then
							return tonumber(User)
						end

						return Players:GetUserIdFromNameAsync(User)
					end)
					if not FoundUser then
						notify('Join Error','Username/UserID does not exist')
					else
						notify('Join Player','Loading servers. Hold on a second.')
						local URL2 = ("https://games.roblox.com/v1/games/"..Place.."/servers/Public?sortOrder=Asc&limit=100")
						local Http = HttpService:JSONDecode(game:HttpGet(URL2))
						local GUID

						function tablelength(T)
							local count = 0
							for _ in pairs(T) do count = count + 1 end
							return count
						end

						for i=1,tonumber(tablelength(Http.data)) do
							for j,k in pairs(Http.data[i].playerIds) do
								if k == UserId then
									GUID = Http.data[i].id
								end
							end
						end

						if GUID ~= nil then
							notify('Join Player','Joining '..User)
							TeleportService:TeleportToPlaceInstance(Place,GUID,Players.LocalPlayer)
						else
							notify('Join Error','Unable to join user.')
						end
					end
				end)
			then
				if retries < 3 then
					retries = retries + 1
					print('ERROR retrying '..retries..'/3')
					notify('Join Error','Error while trying to join. Retrying '..retries..'/3.')
					ToServer(User,Place)
				else
					notify('Join Error','Error while trying to join.')
				end
			end
		end
		ToServer(args[1],args[2])
	end)

	addcmd("exit", {}, function(args, speaker)
		game:Shutdown()
	end)

	local Noclipping = nil
	addcmd('noclip',{},function(args, speaker)
		Clip = false
		wait(0.1)
		local function NoclipLoop()
			if Clip == false and speaker.Character ~= nil then
				for _, child in pairs(speaker.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
						child.CanCollide = false
					end
				end
			end
		end
		Noclipping = RunService.Stepped:Connect(NoclipLoop)
	end)

	addcmd('clip',{'unnoclip'},function(args, speaker)
		if Noclipping then
			Noclipping:Disconnect()
		end
		Clip = true
	end)

	addcmd('togglenoclip',{},function(args, speaker)
		if Clip then
			execCmd('noclip')
		else
			execCmd('clip')
		end
	end)

	FLYING = false
	QEfly = true
	iyflyspeed = 1
	vehicleflyspeed = 1
	function sFLY(vfly)
		repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		repeat wait() until IYMouse
		if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

		local T = getRoot(Players.LocalPlayer.Character)
		local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local SPEED = 0

		local function FLY()
			FLYING = true
			local BG = Instance.new('BodyGyro')
			local BV = Instance.new('BodyVelocity')
			BG.P = 9e4
			BG.Parent = T
			BV.Parent = T
			BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BG.cframe = T.CFrame
			BV.velocity = Vector3.new(0, 0, 0)
			BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
			task.spawn(function()
				repeat wait()
					if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
						Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
					end
					if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
						SPEED = 50
					elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
						SPEED = 0
					end
					if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
						lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
					elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					else
						BV.velocity = Vector3.new(0, 0, 0)
					end
					BG.cframe = workspace.CurrentCamera.CoordinateFrame
				until not FLYING
				CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				SPEED = 0
				BG:Destroy()
				BV:Destroy()
				if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
				end
			end)
		end
		flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
			elseif KEY:lower() == 's' then
				CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
			elseif KEY:lower() == 'a' then
				CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
			elseif KEY:lower() == 'd' then 
				CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
			elseif QEfly and KEY:lower() == 'e' then
				CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
			elseif QEfly and KEY:lower() == 'q' then
				CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
			end
			pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
		end)
		flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = 0
			elseif KEY:lower() == 's' then
				CONTROL.B = 0
			elseif KEY:lower() == 'a' then
				CONTROL.L = 0
			elseif KEY:lower() == 'd' then
				CONTROL.R = 0
			elseif KEY:lower() == 'e' then
				CONTROL.Q = 0
			elseif KEY:lower() == 'q' then
				CONTROL.E = 0
			end
		end)
		FLY()
	end

	function NOFLY()
		FLYING = false
		if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
		if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
			Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
	end

	local velocityHandlerName = randomString()
	local gyroHandlerName = randomString()
	local mfly1
	local mfly2

	local unmobilefly = function(speaker)
		pcall(function()
			FLYING = false
			local root = getRoot(speaker.Character)
			root:FindFirstChild(velocityHandlerName):Destroy()
			root:FindFirstChild(gyroHandlerName):Destroy()
			speaker.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
			mfly1:Disconnect()
			mfly2:Disconnect()
		end)
	end

	local mobilefly = function(speaker, vfly)
		unmobilefly(speaker)
		FLYING = true

		local root = getRoot(speaker.Character)
		local camera = workspace.CurrentCamera
		local v3none = Vector3.new()
		local v3zero = Vector3.new(0, 0, 0)
		local v3inf = Vector3.new(9e9, 9e9, 9e9)

		local controlModule = require(speaker.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
		local bv = Instance.new("BodyVelocity")
		bv.Name = velocityHandlerName
		bv.Parent = root
		bv.MaxForce = v3zero
		bv.Velocity = v3zero

		local bg = Instance.new("BodyGyro")
		bg.Name = gyroHandlerName
		bg.Parent = root
		bg.MaxTorque = v3inf
		bg.P = 1000
		bg.D = 50

		mfly1 = speaker.CharacterAdded:Connect(function()
			local bv = Instance.new("BodyVelocity")
			bv.Name = velocityHandlerName
			bv.Parent = root
			bv.MaxForce = v3zero
			bv.Velocity = v3zero

			local bg = Instance.new("BodyGyro")
			bg.Name = gyroHandlerName
			bg.Parent = root
			bg.MaxTorque = v3inf
			bg.P = 1000
			bg.D = 50
		end)

		mfly2 = RunService.RenderStepped:Connect(function()
			root = getRoot(speaker.Character)
			camera = workspace.CurrentCamera
			if speaker.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild(velocityHandlerName) and root:FindFirstChild(gyroHandlerName) then
				local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
				local VelocityHandler = root:FindFirstChild(velocityHandlerName)
				local GyroHandler = root:FindFirstChild(gyroHandlerName)

				VelocityHandler.MaxForce = v3inf
				GyroHandler.MaxTorque = v3inf
				if not vfly then humanoid.PlatformStand = true end
				GyroHandler.CFrame = camera.CoordinateFrame
				VelocityHandler.Velocity = v3none

				local direction = controlModule:GetMoveVector()
				if direction.X > 0 then
					VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * ((vfly and vehicleflyspeed or iyflyspeed) * 50))
				end
				if direction.X < 0 then
					VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * ((vfly and vehicleflyspeed or iyflyspeed) * 50))
				end
				if direction.Z > 0 then
					VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * ((vfly and vehicleflyspeed or iyflyspeed) * 50))
				end
				if direction.Z < 0 then
					VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * ((vfly and vehicleflyspeed or iyflyspeed) * 50))
				end
			end
		end)
	end

	addcmd('fly',{},function(args, speaker)
		if not IsOnMobile then
			NOFLY()
			wait()
			sFLY()
		else
			mobilefly(speaker)
		end
		if args[1] and isNumber(args[1]) then
			iyflyspeed = args[1]
		end
	end)

	addcmd('flyspeed',{'flysp'},function(args, speaker)
		local speed = args[1] or 1
		if isNumber(speed) then
			iyflyspeed = speed
		end
	end)

	addcmd('unfly',{'nofly','novfly','unvehiclefly','novehiclefly','unvfly'},function(args, speaker)
		if not IsOnMobile then NOFLY() else unmobilefly(speaker) end
	end)

	addcmd('vfly',{'vehiclefly'},function(args, speaker)
		if not IsOnMobile then
			NOFLY()
			wait()
			sFLY(true)
		else
			mobilefly(speaker, true)
		end
		if args[1] and isNumber(args[1]) then
			vehicleflyspeed = args[1]
		end
	end)

	addcmd('togglevfly',{},function(args, speaker)
		if FLYING then
			if not IsOnMobile then NOFLY() else unmobilefly(speaker) end
		else
			if not IsOnMobile then sFLY(true) else mobilefly(speaker, true) end
		end
	end)

	addcmd('vflyspeed',{'vflysp','vehicleflyspeed','vehicleflysp'},function(args, speaker)
		local speed = args[1] or 1
		if isNumber(speed) then
			vehicleflyspeed = speed
		end
	end)

	addcmd('qefly',{'flyqe'},function(args, speaker)
		if args[1] == 'false' then
			QEfly = false
		else
			QEfly = true
		end
	end)

	addcmd('togglefly',{},function(args, speaker)
		if FLYING then
			if not IsOnMobile then NOFLY() else unmobilefly(speaker) end
		else
			if not IsOnMobile then sFLY() else mobilefly(speaker) end
		end
	end)

	CFspeed = 50
	addcmd('cframefly', {'cfly'}, function(args, speaker)
		-- Full credit to peyton#9148 (apeyton)
		speaker.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
		local Head = speaker.Character:WaitForChild("Head")
		Head.Anchored = true
		if CFloop then CFloop:Disconnect() end
		CFloop = RunService.Heartbeat:Connect(function(deltaTime)
			local moveDirection = speaker.Character:FindFirstChildOfClass('Humanoid').MoveDirection * (CFspeed * deltaTime)
			local headCFrame = Head.CFrame
			local cameraCFrame = workspace.CurrentCamera.CFrame
			local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
			cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
			local cameraPosition = cameraCFrame.Position
			local headPosition = headCFrame.Position

			local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
			Head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
		end)
	end)

	addcmd('uncframefly',{'uncfly'},function(args, speaker)
		if CFloop then
			CFloop:Disconnect()
			speaker.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			local Head = speaker.Character:WaitForChild("Head")
			Head.Anchored = false
		end
	end)

	addcmd('cframeflyspeed',{'cflyspeed'},function(args, speaker)
		if isNumber(args[1]) then
			CFspeed = args[1]
		end
	end)

	Floating = false
	floatName = randomString()
	addcmd('float', {'platform'},function(args, speaker)
		Floating = true
		local pchar = speaker.Character
		if pchar and not pchar:FindFirstChild(floatName) then
			task.spawn(function()
				local Float = Instance.new('Part')
				Float.Name = floatName
				Float.Parent = pchar
				Float.Transparency = 1
				Float.Size = Vector3.new(2,0.2,1.5)
				Float.Anchored = true
				local FloatValue = -3.1
				Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0,FloatValue,0)
				notify('Float','Float Enabled (Q = down & E = up)')
				qUp = IYMouse.KeyUp:Connect(function(KEY)
					if KEY == 'q' then
						FloatValue = FloatValue + 0.5
					end
				end)
				eUp = IYMouse.KeyUp:Connect(function(KEY)
					if KEY == 'e' then
						FloatValue = FloatValue - 0.5
					end
				end)
				qDown = IYMouse.KeyDown:Connect(function(KEY)
					if KEY == 'q' then
						FloatValue = FloatValue - 0.5
					end
				end)
				eDown = IYMouse.KeyDown:Connect(function(KEY)
					if KEY == 'e' then
						FloatValue = FloatValue + 0.5
					end
				end)
				floatDied = speaker.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
					FloatingFunc:Disconnect()
					Float:Destroy()
					qUp:Disconnect()
					eUp:Disconnect()
					qDown:Disconnect()
					eDown:Disconnect()
					floatDied:Disconnect()
				end)
				local function FloatPadLoop()
					if pchar:FindFirstChild(floatName) and getRoot(pchar) then
						Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0,FloatValue,0)
					else
						FloatingFunc:Disconnect()
						Float:Destroy()
						qUp:Disconnect()
						eUp:Disconnect()
						qDown:Disconnect()
						eDown:Disconnect()
						floatDied:Disconnect()
					end
				end			
				FloatingFunc = RunService.Heartbeat:Connect(FloatPadLoop)
			end)
		end
	end)

	addcmd('unfloat',{'nofloat','unplatform','noplatform'},function(args, speaker)
		Floating = false
		local pchar = speaker.Character
		notify('Float','Float Disabled')
		if pchar:FindFirstChild(floatName) then
			pchar:FindFirstChild(floatName):Destroy()
		end
		if floatDied then
			FloatingFunc:Disconnect()
			qUp:Disconnect()
			eUp:Disconnect()
			qDown:Disconnect()
			eDown:Disconnect()
			floatDied:Disconnect()
		end
	end)

	addcmd('togglefloat',{},function(args, speaker)
		if Floating then
			execCmd('unfloat')
		else
			execCmd('float')
		end
	end)

	swimming = false
	local oldgrav = workspace.Gravity
	local swimbeat = nil
	addcmd('swim',{},function(args, speaker)
		if not swimming and speaker and speaker.Character and speaker.Character:FindFirstChildWhichIsA("Humanoid") then
			oldgrav = workspace.Gravity
			workspace.Gravity = 0
			local swimDied = function()
				workspace.Gravity = oldgrav
				swimming = false
			end
			local Humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
			gravReset = Humanoid.Died:Connect(swimDied)
			local enums = Enum.HumanoidStateType:GetEnumItems()
			table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
			for i, v in pairs(enums) do
				Humanoid:SetStateEnabled(v, false)
			end
			Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
			swimbeat = RunService.Heartbeat:Connect(function()
				pcall(function()
					speaker.Character.HumanoidRootPart.Velocity = ((Humanoid.MoveDirection ~= Vector3.new() or UserInputService:IsKeyDown(Enum.KeyCode.Space)) and speaker.Character.HumanoidRootPart.Velocity or Vector3.new())
				end)
			end)
			swimming = true
		end
	end)

	addcmd('unswim',{'noswim'},function(args, speaker)
		if speaker and speaker.Character and speaker.Character:FindFirstChildWhichIsA("Humanoid") then
			workspace.Gravity = oldgrav
			swimming = false
			if gravReset then
				gravReset:Disconnect()
			end
			if swimbeat ~= nil then
				swimbeat:Disconnect()
				swimbeat = nil
			end
			local Humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
			local enums = Enum.HumanoidStateType:GetEnumItems()
			table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
			for i, v in pairs(enums) do
				Humanoid:SetStateEnabled(v, true)
			end
		end
	end)

	addcmd('toggleswim',{},function(args, speaker)
		if swimming then
			execCmd('unswim')
		else
			execCmd('swim')
		end
	end)

	addcmd('setwaypoint',{'swp','setwp','spos','saveposition','savepos'},function(args, speaker)
		local WPName = tostring(getstring(1))
		if getRoot(speaker.Character) then
			notify('Modified Waypoints',"Created waypoint: "..getstring(1))
			local torso = getRoot(speaker.Character)
			WayPoints[#WayPoints + 1] = {NAME = WPName, COORD = {math.floor(torso.Position.X), math.floor(torso.Position.Y), math.floor(torso.Position.Z)}, GAME = PlaceId}
			if AllWaypoints ~= nil then
				AllWaypoints[#AllWaypoints + 1] = {NAME = WPName, COORD = {math.floor(torso.Position.X), math.floor(torso.Position.Y), math.floor(torso.Position.Z)}, GAME = PlaceId}
			end
		end	
		refreshwaypoints()
		updatesaves()
	end)

	addcmd('waypointpos',{'wpp','setwaypointposition','setpos','setwaypoint','setwaypointpos'},function(args, speaker)
		local WPName = tostring(getstring(1))
		if getRoot(speaker.Character) then
			notify('Modified Waypoints',"Created waypoint: "..getstring(1))
			WayPoints[#WayPoints + 1] = {NAME = WPName, COORD = {args[2], args[3], args[4]}, GAME = PlaceId}
			if AllWaypoints ~= nil then
				AllWaypoints[#AllWaypoints + 1] = {NAME = WPName, COORD = {args[2], args[3], args[4]}, GAME = PlaceId}
			end
		end	
		refreshwaypoints()
		updatesaves()
	end)

	addcmd('waypoints',{'positions'},function(args, speaker)
		if SettingsOpen == false then SettingsOpen = true
			Settings:TweenPosition(UDim2.new(0, 0, 0, 45), "InOut", "Quart", 0.5, true, nil)
			CMDsF.Visible = false
		end
		KeybindsFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
		AliasesFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
		PluginsFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
		PositionsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
		maximizeHolder()
	end)

	waypointParts = {}
	addcmd('showwaypoints',{'showwp','showwps'},function(args, speaker)
		execCmd('hidewaypoints')
		wait()
		for i,_ in pairs(WayPoints) do
			local x = WayPoints[i].COORD[1]
			local y = WayPoints[i].COORD[2]
			local z = WayPoints[i].COORD[3]
			local part = Instance.new("Part")
			part.Size = Vector3.new(5,5,5)
			part.CFrame = CFrame.new(x,y,z)
			part.Parent = workspace
			part.Anchored = true
			part.CanCollide = false
			table.insert(waypointParts,part)
			local view = Instance.new("BoxHandleAdornment")
			view.Adornee = part
			view.AlwaysOnTop = true
			view.ZIndex = 10
			view.Size = part.Size
			view.Parent = part
		end
		for i,v in pairs(pWayPoints) do
			local view = Instance.new("BoxHandleAdornment")
			view.Adornee = pWayPoints[i].COORD[1]
			view.AlwaysOnTop = true
			view.ZIndex = 10
			view.Size = pWayPoints[i].COORD[1].Size
			view.Parent = pWayPoints[i].COORD[1]
			table.insert(waypointParts,view)
		end
	end)

	addcmd('hidewaypoints',{'hidewp','hidewps'},function(args, speaker)
		for i,v in pairs(waypointParts) do
			v:Destroy()
		end
		waypointParts = {}
	end)

	addcmd('waypoint',{'wp','lpos','loadposition','loadpos'},function(args, speaker)
		local WPName = tostring(getstring(1))
		if speaker.Character then
			for i,_ in pairs(WayPoints) do
				if tostring(WayPoints[i].NAME):lower() == tostring(WPName):lower() then
					local x = WayPoints[i].COORD[1]
					local y = WayPoints[i].COORD[2]
					local z = WayPoints[i].COORD[3]
					getRoot(speaker.Character).CFrame = CFrame.new(x,y,z)
				end
			end
			for i,_ in pairs(pWayPoints) do
				if tostring(pWayPoints[i].NAME):lower() == tostring(WPName):lower() then
					getRoot(speaker.Character).CFrame = CFrame.new(pWayPoints[i].COORD[1].Position)
				end
			end
		end
	end)

	tweenSpeed = 1
	addcmd('tweenspeed',{'tspeed'},function(args, speaker)
		local newSpeed = args[1] or 1
		if tonumber(newSpeed) then
			tweenSpeed = tonumber(newSpeed)
		end
	end)

	addcmd('tweenwaypoint',{'twp'},function(args, speaker)
		local WPName = tostring(getstring(1))
		if speaker.Character then
			for i,_ in pairs(WayPoints) do
				local x = WayPoints[i].COORD[1]
				local y = WayPoints[i].COORD[2]
				local z = WayPoints[i].COORD[3]
				if tostring(WayPoints[i].NAME):lower() == tostring(WPName):lower() then
					TweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(x,y,z)}):Play()
				end
			end
			for i,_ in pairs(pWayPoints) do
				if tostring(pWayPoints[i].NAME):lower() == tostring(WPName):lower() then
					TweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(pWayPoints[i].COORD[1].Position)}):Play()
				end
			end
		end
	end)

	addcmd('walktowaypoint',{'wtwp'},function(args, speaker)
		local WPName = tostring(getstring(1))
		if speaker.Character then
			for i,_ in pairs(WayPoints) do
				local x = WayPoints[i].COORD[1]
				local y = WayPoints[i].COORD[2]
				local z = WayPoints[i].COORD[3]
				if tostring(WayPoints[i].NAME):lower() == tostring(WPName):lower() then
					if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
						speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
						wait(.1)
					end
					speaker.Character:FindFirstChildOfClass('Humanoid').WalkToPoint = Vector3.new(x,y,z)
				end
			end
			for i,_ in pairs(pWayPoints) do
				if tostring(pWayPoints[i].NAME):lower() == tostring(WPName):lower() then
					if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
						speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
						wait(.1)
					end
					speaker.Character:FindFirstChildOfClass('Humanoid').WalkToPoint = Vector3.new(pWayPoints[i].COORD[1].Position)
				end
			end
		end
	end)

	addcmd('deletewaypoint',{'dwp','dpos','deleteposition','deletepos'},function(args, speaker)
		for i,v in pairs(WayPoints) do
			if v.NAME:lower() == tostring(getstring(1)):lower() then
				notify('Modified Waypoints',"Deleted waypoint: " .. v.NAME)
				table.remove(WayPoints, i)
			end
		end
		if AllWaypoints ~= nil and #AllWaypoints > 0 then
			for i,v in pairs(AllWaypoints) do
				if v.NAME:lower() == tostring(getstring(1)):lower() then
					if not v.GAME or v.GAME == PlaceId then
						table.remove(AllWaypoints, i)
					end
				end
			end
		end
		for i,v in pairs(pWayPoints) do
			if v.NAME:lower() == tostring(getstring(1)):lower() then
				notify('Modified Waypoints',"Deleted waypoint: " .. v.NAME)
				table.remove(pWayPoints, i)
			end
		end
		refreshwaypoints()
		updatesaves()
	end)

	addcmd('clearwaypoints',{'cwp','clearpositions','cpos','clearpos'},function(args, speaker)
		WayPoints = {}
		pWayPoints = {}
		refreshwaypoints()
		updatesaves()
		AllWaypoints = {}
		notify('Modified Waypoints','Removed all waypoints')
	end)

	addcmd('cleargamewaypoints',{'cgamewp'},function(args, speaker)
		for i,v in pairs(WayPoints) do
			if v.GAME == PlaceId then
				table.remove(WayPoints, i)
			end
		end
		if AllWaypoints ~= nil and #AllWaypoints > 0 then
			for i,v in pairs(AllWaypoints) do
				if v.GAME == PlaceId then
					table.remove(AllWaypoints, i)
				end
			end
		end
		for i,v in pairs(pWayPoints) do
			if v.GAME == PlaceId then
				table.remove(pWayPoints, i)
			end
		end
		refreshwaypoints()
		updatesaves()
		notify('Modified Waypoints','Deleted game waypoints')
	end)


	local coreGuiTypeNames = {
		-- predefined aliases
		["inventory"] = Enum.CoreGuiType.Backpack,
		["leaderboard"] = Enum.CoreGuiType.PlayerList,
		["emotes"] = Enum.CoreGuiType.EmotesMenu
	}

	-- Load the full list of enums
	for _, enumItem in ipairs(Enum.CoreGuiType:GetEnumItems()) do
		coreGuiTypeNames[enumItem.Name:lower()] = enumItem
	end

	addcmd('enable',{},function(args, speaker)
		local input = args[1] and args[1]:lower()
		if input then
			if input == "reset" then
				StarterGui:SetCore("ResetButtonCallback", true)
			else
				local coreGuiType = coreGuiTypeNames[input]
				if coreGuiType then
					StarterGui:SetCoreGuiEnabled(coreGuiType, true)
				end
			end
		end
	end)

	addcmd('disable',{},function(args, speaker)
		local input = args[1] and args[1]:lower()
		if input then
			if input == "reset" then
				StarterGui:SetCore("ResetButtonCallback", false)
			else
				local coreGuiType = coreGuiTypeNames[input]
				if coreGuiType then
					StarterGui:SetCoreGuiEnabled(coreGuiType, false)
				end
			end
		end
	end)


	local invisGUIS = {}
	addcmd('showguis',{},function(args, speaker)
		for i,v in pairs(speaker:FindFirstChildWhichIsA("PlayerGui"):GetDescendants()) do
			if (v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ScrollingFrame")) and not v.Visible then
				v.Visible = true
				if not FindInTable(invisGUIS,v) then
					table.insert(invisGUIS,v)
				end
			end
		end
	end)

	addcmd('unshowguis',{},function(args, speaker)
		for i,v in pairs(invisGUIS) do
			v.Visible = false
		end
		invisGUIS = {}
	end)

	local hiddenGUIS = {}
	addcmd('hideguis',{},function(args, speaker)
		for i,v in pairs(speaker:FindFirstChildWhichIsA("PlayerGui"):GetDescendants()) do
			if (v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ScrollingFrame")) and v.Visible then
				v.Visible = false
				if not FindInTable(hiddenGUIS,v) then
					table.insert(hiddenGUIS,v)
				end
			end
		end
	end)

	addcmd('unhideguis',{},function(args, speaker)
		for i,v in pairs(hiddenGUIS) do
			v.Visible = true
		end
		hiddenGUIS = {}
	end)

	function deleteGuisAtPos()
		pcall(function()
			local guisAtPosition = Players.LocalPlayer.PlayerGui:GetGuiObjectsAtPosition(IYMouse.X, IYMouse.Y)
			for _, gui in pairs(guisAtPosition) do
				if gui.Visible == true then
					gui:Destroy()
				end
			end
		end)
	end

	local deleteGuiInput
	addcmd('guidelete',{},function(args, speaker)
		deleteGuiInput = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
			if not gameProcessedEvent then
				if input.KeyCode == Enum.KeyCode.Backspace then
					deleteGuisAtPos()
				end
			end
		end)
		notify('GUI Delete Enabled','Hover over a GUI and press backspace to delete it')
	end)

	addcmd('unguidelete',{'noguidelete'},function(args, speaker)
		if deleteGuiInput then deleteGuiInput:Disconnect() end
		notify('GUI Delete Disabled','GUI backspace delete has been disabled')
	end)

	local wasStayOpen = StayOpen
	addcmd('hideiy',{},function(args, speaker)
		isHidden = true
		wasStayOpen = StayOpen
		if StayOpen == true then
			StayOpen = false
			On.BackgroundTransparency = 1
		end
		minimizeNum = 0
		minimizeHolder()
		if not (args[1] and tostring(args[1]) == 'nonotify') then notify('IY Hidden','You can press the prefix key to access the command bar') end
	end)

	addcmd('showiy',{'unhideiy'},function(args, speaker)
		isHidden = false
		minimizeNum = -20
		if wasStayOpen then
			maximizeHolder()
			StayOpen = true
			On.BackgroundTransparency = 0
		else
			minimizeHolder()
		end
	end)

	addcmd('rec', {'record'}, function(args, speaker)
		return COREGUI:ToggleRecording()
	end)

	addcmd('screenshot', {'scrnshot'}, function(args, speaker)
		return COREGUI:TakeScreenshot()
	end)

	addcmd('togglefs', {'togglefullscreen'}, function(args, speaker)
		return GuiService:ToggleFullscreen()
	end)

	addcmd('inspect', {'examine'}, function(args, speaker)
		for _, v in ipairs(getPlayer(args[1], speaker)) do
			GuiService:CloseInspectMenu()
			GuiService:InspectPlayerFromUserId(Players[v].UserId)
		end
	end)

	addcmd("savegame", {"saveplace"}, function(args, speaker)
		if saveinstance then
			notify("Loading", "Downloading game. This will take a while")
			saveinstance()
			notify("Game Saved", "Saved place to the workspace folder within your exploit folder.")
		else
			notify("Incompatible Exploit", "Your exploit does not support this command (missing saveinstance)")
		end
	end)

	addcmd('clearerror',{'clearerrors'},function(args, speaker)
		GuiService:ClearError()
	end)

	addcmd('clientantikick',{'antikick'},function(args, speaker)
		if not hookmetamethod then 
			return notify('Incompatible Exploit','Your exploit does not support this command (missing hookmetamethod)')
		end
		local LocalPlayer = Players.LocalPlayer
		local oldhmmi
		local oldhmmnc
		oldhmmi = hookmetamethod(game, "__index", function(self, method)
			if self == LocalPlayer and method:lower() == "kick" then
				return error("Expected ':' not '.' calling member function Kick", 2)
			end
			return oldhmmi(self, method)
		end)
		oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
			if self == LocalPlayer and getnamecallmethod():lower() == "kick" then
				return
			end
			return oldhmmnc(self, ...)
		end)

		notify('Client Antikick','Client anti kick is now active (only effective on localscript kick)')
	end)

	allow_rj = true
	addcmd('clientantiteleport',{'antiteleport'},function(args, speaker)
		if not hookmetamethod then 
			return notify('Incompatible Exploit','Your exploit does not support this command (missing hookmetamethod)')
		end
		local TeleportService = TeleportService
		local oldhmmi
		local oldhmmnc
		oldhmmi = hookmetamethod(game, "__index", function(self, method)
			if self == TeleportService then
				if method:lower() == "teleport" then
					return error("Expected ':' not '.' calling member function Kick", 2)
				elseif method == "TeleportToPlaceInstance" then
					return error("Expected ':' not '.' calling member function TeleportToPlaceInstance", 2)
				end
			end
			return oldhmmi(self, method)
		end)
		oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
			if self == TeleportService and getnamecallmethod():lower() == "teleport" or getnamecallmethod() == "TeleportToPlaceInstance" then
				return
			end
			return oldhmmnc(self, ...)
		end)

		notify('Client AntiTP','Client anti teleport is now active (only effective on localscript teleport)')
	end)

	addcmd('allowrejoin',{'allowrj'},function(args, speaker)
		if args[1] and args[1] == 'false' then
			allow_rj = false
			notify('Client AntiTP','Allow rejoin set to false')
		else
			allow_rj = true
			notify('Client AntiTP','Allow rejoin set to true')
		end
	end)

	addcmd('cancelteleport',{'canceltp'},function(args, speaker)
		TeleportService:TeleportCancel()
	end)

	addcmd('volume',{'vol'},function(args, speaker)
		local level = args[1]/10
		UserSettings():GetService("UserGameSettings").MasterVolume = level
	end)

	addcmd('antilag',{'boostfps','lowgraphics'},function(args, speaker)
		local Terrain = workspace:FindFirstChildOfClass('Terrain')
		Terrain.WaterWaveSize = 0
		Terrain.WaterWaveSpeed = 0
		Terrain.WaterReflectance = 0
		Terrain.WaterTransparency = 0
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 9e9
		settings().Rendering.QualityLevel = 1
		for i,v in pairs(game:GetDescendants()) do
			if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
				v.Material = "Plastic"
				v.Reflectance = 0
			elseif v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA("Explosion") then
				v.BlastPressure = 1
				v.BlastRadius = 1
			end
		end
		for i,v in pairs(Lighting:GetDescendants()) do
			if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
				v.Enabled = false
			end
		end
		workspace.DescendantAdded:Connect(function(child)
			task.spawn(function()
				if child:IsA('ForceField') then
					RunService.Heartbeat:Wait()
					child:Destroy()
				elseif child:IsA('Sparkles') then
					RunService.Heartbeat:Wait()
					child:Destroy()
				elseif child:IsA('Smoke') or child:IsA('Fire') then
					RunService.Heartbeat:Wait()
					child:Destroy()
				end
			end)
		end)
	end)

	addcmd('setfpscap', {'fpscap', 'maxfps'}, function(args, speaker)
		if setfpscap and type(setfpscap) == "function" then
			local num = args[1] or 1e6
			if num == 'none' then
				return setfpscap(1e6)
			elseif num > 0 then
				return setfpscap(num)
			else
				return notify('Invalid argument', "Please provide a number above 0 or 'none'.")
			end
		else
			return notify('Incompatible Exploit', 'Your exploit does not support this command (missing setfpscap)')
		end
	end)

	addcmd('notify',{},function(args, speaker)
		notify(getstring(1))
	end)

	addcmd('lastcommand',{'lastcmd'},function(args, speaker)
		if cmdHistory[1]:sub(1,11) ~= 'lastcommand' and cmdHistory[1]:sub(1,7) ~= 'lastcmd' then
			execCmd(cmdHistory[1])
		end
	end)

	addcmd('esp',{},function(args, speaker)
		if not CHMSenabled then
			ESPenabled = true
			for i,v in pairs(Players:GetPlayers()) do
				if v.Name ~= speaker.Name then
					ESP(v)
				end
			end
		else
			notify('ESP','Disable chams (nochams) before using esp')
		end
	end)

	addcmd('noesp',{'unesp'},function(args, speaker)
		ESPenabled = false
		for i,c in pairs(COREGUI:GetChildren()) do
			if string.sub(c.Name, -4) == '_ESP' then
				c:Destroy()
			end
		end
	end)

	addcmd('esptransparency',{},function(args, speaker)
		espTransparency = (args[1] and isNumber(args[1]) and args[1]) or 0.3
		updatesaves()
	end)

	local espParts = {}
	local partEspTrigger = nil
	function partAdded(part)
		if #espParts > 0 then
			if FindInTable(espParts,part.Name:lower()) then
				local a = Instance.new("BoxHandleAdornment")
				a.Name = part.Name:lower().."_PESP"
				a.Parent = part
				a.Adornee = part
				a.AlwaysOnTop = true
				a.ZIndex = 0
				a.Size = part.Size
				a.Transparency = espTransparency
				a.Color = BrickColor.new("Lime green")
			end
		else
			partEspTrigger:Disconnect()
			partEspTrigger = nil
		end
	end

	addcmd('partesp',{},function(args, speaker)
		local partEspName = getstring(1):lower()
		if not FindInTable(espParts,partEspName) then
			table.insert(espParts,partEspName)
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("BasePart") and v.Name:lower() == partEspName then
					local a = Instance.new("BoxHandleAdornment")
					a.Name = partEspName.."_PESP"
					a.Parent = v
					a.Adornee = v
					a.AlwaysOnTop = true
					a.ZIndex = 0
					a.Size = v.Size
					a.Transparency = espTransparency
					a.Color = BrickColor.new("Lime green")
				end
			end
		end
		if partEspTrigger == nil then
			partEspTrigger = workspace.DescendantAdded:Connect(partAdded)
		end
	end)

	addcmd('unpartesp',{'nopartesp'},function(args, speaker)
		if args[1] then
			local partEspName = getstring(1):lower()
			if FindInTable(espParts,partEspName) then
				table.remove(espParts, GetInTable(espParts, partEspName))
			end
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("BoxHandleAdornment") and v.Name == partEspName..'_PESP' then
					v:Destroy()
				end
			end
		else
			partEspTrigger:Disconnect()
			partEspTrigger = nil
			espParts = {}
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("BoxHandleAdornment") and v.Name:sub(-5) == '_PESP' then
					v:Destroy()
				end
			end
		end
	end)

	addcmd('chams',{},function(args, speaker)
		if not ESPenabled then
			CHMSenabled = true
			for i,v in pairs(Players:GetPlayers()) do
				if v.Name ~= speaker.Name then
					CHMS(v)
				end
			end
		else
			notify('Chams','Disable ESP (noesp) before using chams')
		end
	end)

	addcmd('nochams',{'unchams'},function(args, speaker)
		CHMSenabled = false
		for i,v in pairs(Players:GetPlayers()) do
			local chmsplr = v
			for i,c in pairs(COREGUI:GetChildren()) do
				if c.Name == chmsplr.Name..'_CHMS' then
					c:Destroy()
				end
			end
		end
	end)

	addcmd('locate',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			Locate(Players[v])
		end
	end)

	addcmd('nolocate',{'unlocate'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		if args[1] then
			for i,v in pairs(players) do
				for i,c in pairs(COREGUI:GetChildren()) do
					if c.Name == Players[v].Name..'_LC' then
						c:Destroy()
					end
				end
			end
		else
			for i,c in pairs(COREGUI:GetChildren()) do
				if string.sub(c.Name, -3) == '_LC' then
					c:Destroy()
				end
			end
		end
	end)

	viewing = nil
	addcmd('view',{'spectate'},function(args, speaker)
		StopFreecam()
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			if viewDied then
				viewDied:Disconnect()
				viewChanged:Disconnect()
			end
			viewing = Players[v]
			workspace.CurrentCamera.CameraSubject = viewing.Character
			notify('Spectate','Viewing ' .. Players[v].Name)
			local function viewDiedFunc()
				repeat wait() until Players[v].Character ~= nil and getRoot(Players[v].Character)
				workspace.CurrentCamera.CameraSubject = viewing.Character
			end
			viewDied = Players[v].CharacterAdded:Connect(viewDiedFunc)
			local function viewChangedFunc()
				workspace.CurrentCamera.CameraSubject = viewing.Character
			end
			viewChanged = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(viewChangedFunc)
		end
	end)

	addcmd('viewpart',{'viewp'},function(args, speaker)
		StopFreecam()
		if args[1] then
			for i,v in pairs(workspace:GetDescendants()) do
				if v.Name:lower() == getstring(1):lower() and v:IsA("BasePart") then
					wait(0.1)
					workspace.CurrentCamera.CameraSubject = v
				end
			end
		end
	end)

	addcmd('unview',{'unspectate'},function(args, speaker)
		StopFreecam()
		if viewing ~= nil then
			viewing = nil
			notify('Spectate','View turned off')
		end
		if viewDied then
			viewDied:Disconnect()
			viewChanged:Disconnect()
		end
		workspace.CurrentCamera.CameraSubject = speaker.Character
	end)


	fcRunning = false
	local Camera = workspace.CurrentCamera
	workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		local newCamera = workspace.CurrentCamera
		if newCamera then
			Camera = newCamera
		end
	end)

	local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value

	Spring = {} do
		Spring.__index = Spring

		function Spring.new(freq, pos)
			local self = setmetatable({}, Spring)
			self.f = freq
			self.p = pos
			self.v = pos*0
			return self
		end

		function Spring:Update(dt, goal)
			local f = self.f*2*math.pi
			local p0 = self.p
			local v0 = self.v

			local offset = goal - p0
			local decay = math.exp(-f*dt)

			local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
			local v1 = (f*dt*(offset*f - v0) + v0)*decay

			self.p = p1
			self.v = v1

			return p1
		end

		function Spring:Reset(pos)
			self.p = pos
			self.v = pos*0
		end
	end

	local cameraPos = Vector3.new()
	local cameraRot = Vector2.new()

	local velSpring = Spring.new(5, Vector3.new())
	local panSpring = Spring.new(5, Vector2.new())

	Input = {} do

		keyboard = {
			W = 0,
			A = 0,
			S = 0,
			D = 0,
			E = 0,
			Q = 0,
			Up = 0,
			Down = 0,
			LeftShift = 0,
		}

		mouse = {
			Delta = Vector2.new(),
		}

		NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
		PAN_MOUSE_SPEED = Vector2.new(1, 1)*(math.pi/64)
		NAV_ADJ_SPEED = 0.75
		NAV_SHIFT_MUL = 0.25

		navSpeed = 1

		function Input.Vel(dt)
			navSpeed = math.clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

			local kKeyboard = Vector3.new(
				keyboard.D - keyboard.A,
				keyboard.E - keyboard.Q,
				keyboard.S - keyboard.W
			)*NAV_KEYBOARD_SPEED

			local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)

			return (kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
		end

		function Input.Pan(dt)
			local kMouse = mouse.Delta*PAN_MOUSE_SPEED
			mouse.Delta = Vector2.new()
			return kMouse
		end

		do
			function Keypress(action, state, input)
				keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
				return Enum.ContextActionResult.Sink
			end

			function MousePan(action, state, input)
				local delta = input.Delta
				mouse.Delta = Vector2.new(-delta.y, -delta.x)
				return Enum.ContextActionResult.Sink
			end

			function Zero(t)
				for k, v in pairs(t) do
					t[k] = v*0
				end
			end

			function Input.StartCapture()
				ContextActionService:BindActionAtPriority("FreecamKeyboard",Keypress,false,INPUT_PRIORITY,
					Enum.KeyCode.W,
					Enum.KeyCode.A,
					Enum.KeyCode.S,
					Enum.KeyCode.D,
					Enum.KeyCode.Up,
					Enum.KeyCode.Down
				)
				ContextActionService:BindActionAtPriority("FreecamMousePan",MousePan,false,INPUT_PRIORITY,Enum.UserInputType.MouseMovement)
			end

			function Input.StopCapture()
				navSpeed = 1
				Zero(keyboard)
				Zero(mouse)
				ContextActionService:UnbindAction("FreecamKeyboard")
				ContextActionService:UnbindAction("FreecamMousePan")
			end
		end
	end

	function GetFocusDistance(cameraFrame)
		local znear = 0.1
		local viewport = Camera.ViewportSize
		local projy = 2*math.tan(cameraFov/2)
		local projx = viewport.x/viewport.y*projy
		local fx = cameraFrame.rightVector
		local fy = cameraFrame.upVector
		local fz = cameraFrame.lookVector

		local minVect = Vector3.new()
		local minDist = 512

		for x = 0, 1, 0.5 do
			for y = 0, 1, 0.5 do
				local cx = (x - 0.5)*projx
				local cy = (y - 0.5)*projy
				local offset = fx*cx - fy*cy + fz
				local origin = cameraFrame.p + offset*znear
				local _, hit = workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
				local dist = (hit - origin).magnitude
				if minDist > dist then
					minDist = dist
					minVect = offset.unit
				end
			end
		end

		return fz:Dot(minVect)*minDist
	end

	local function StepFreecam(dt)
		local vel = velSpring:Update(dt, Input.Vel(dt))
		local pan = panSpring:Update(dt, Input.Pan(dt))

		local zoomFactor = math.sqrt(math.tan(math.rad(70/2))/math.tan(math.rad(cameraFov/2)))

		cameraRot = cameraRot + pan*Vector2.new(0.75, 1)*8*(dt/zoomFactor)
		cameraRot = Vector2.new(math.clamp(cameraRot.x, -math.rad(90), math.rad(90)), cameraRot.y%(2*math.pi))

		local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*Vector3.new(1, 1, 1)*64*dt)
		cameraPos = cameraCFrame.p

		Camera.CFrame = cameraCFrame
		Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
		Camera.FieldOfView = cameraFov
	end

	local PlayerState = {} do
		mouseBehavior = ""
		mouseIconEnabled = ""
		cameraType = ""
		cameraFocus = ""
		cameraCFrame = ""
		cameraFieldOfView = ""

		function PlayerState.Push()
			cameraFieldOfView = Camera.FieldOfView
			Camera.FieldOfView = 70

			cameraType = Camera.CameraType
			Camera.CameraType = Enum.CameraType.Custom

			cameraCFrame = Camera.CFrame
			cameraFocus = Camera.Focus

			mouseIconEnabled = UserInputService.MouseIconEnabled
			UserInputService.MouseIconEnabled = true

			mouseBehavior = UserInputService.MouseBehavior
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		end

		function PlayerState.Pop()
			Camera.FieldOfView = 70

			Camera.CameraType = cameraType
			cameraType = nil

			Camera.CFrame = cameraCFrame
			cameraCFrame = nil

			Camera.Focus = cameraFocus
			cameraFocus = nil

			UserInputService.MouseIconEnabled = mouseIconEnabled
			mouseIconEnabled = nil

			UserInputService.MouseBehavior = mouseBehavior
			mouseBehavior = nil
		end
	end

	function StartFreecam(pos)
		if fcRunning then
			StopFreecam()
		end
		local cameraCFrame = Camera.CFrame
		if pos then
			cameraCFrame = pos
		end
		cameraRot = Vector2.new()
		cameraPos = cameraCFrame.p
		cameraFov = Camera.FieldOfView

		velSpring:Reset(Vector3.new())
		panSpring:Reset(Vector2.new())

		PlayerState.Push()
		RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
		Input.StartCapture()
		fcRunning = true
		_G.fc = true
	end

	function StopFreecam()
		if not fcRunning then return end
		Input.StopCapture()
		RunService:UnbindFromRenderStep("Freecam")
		PlayerState.Pop()
		workspace.Camera.FieldOfView = 70
		fcRunning = false
		_G.fc = false
	end

	addcmd('freecam',{'fc'},function(args, speaker)
		StartFreecam()
	end)

	addcmd('freecampos',{'fcpos','fcp','freecamposition','fcposition'},function(args, speaker)
		if not args[1] then return end
		local freecamPos = CFrame.new(args[1],args[2],args[3])
		StartFreecam(freecamPos)
	end)

	addcmd('freecamwaypoint',{'fcwp'},function(args, speaker)
		local WPName = tostring(getstring(1))
		if speaker.Character then
			for i,_ in pairs(WayPoints) do
				local x = WayPoints[i].COORD[1]
				local y = WayPoints[i].COORD[2]
				local z = WayPoints[i].COORD[3]
				if tostring(WayPoints[i].NAME):lower() == tostring(WPName):lower() then
					StartFreecam(CFrame.new(x,y,z))
				end
			end
			for i,_ in pairs(pWayPoints) do
				if tostring(pWayPoints[i].NAME):lower() == tostring(WPName):lower() then
					StartFreecam(CFrame.new(pWayPoints[i].COORD[1].Position))
				end
			end
		end
	end)

	addcmd('freecamgoto',{'fcgoto','freecamtp','fctp'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			StartFreecam(getRoot(Players[v].Character).CFrame)
		end
	end)

	addcmd('unfreecam',{'nofreecam','unfc','nofc'},function(args, speaker)
		StopFreecam()
	end)

	addcmd('freecamspeed',{'fcspeed'},function(args, speaker)
		local FCspeed = args[1] or 1
		if isNumber(FCspeed) then
			NAV_KEYBOARD_SPEED = Vector3.new(FCspeed, FCspeed, FCspeed)
		end
	end)

	addcmd('notifyfreecamposition',{'notifyfcpos'},function(args, speaker)
		if fcRunning then
			local X,Y,Z = workspace.CurrentCamera.CFrame.Position.X,workspace.CurrentCamera.CFrame.Position.Y,workspace.CurrentCamera.CFrame.Position.Z
			local Format, Round = string.format, math.round
			notify("Current Position", Format("%s, %s, %s", Round(X), Round(Y), Round(Z)))
		end
	end)

	addcmd('copyfreecamposition',{'copyfcpos'},function(args, speaker)
		if fcRunning then
			local X,Y,Z = workspace.CurrentCamera.CFrame.Position.X,workspace.CurrentCamera.CFrame.Position.Y,workspace.CurrentCamera.CFrame.Position.Z
			local Format, Round = string.format, math.round
			toClipboard(Format("%s, %s, %s", Round(X), Round(Y), Round(Z)))
		end
	end)

	addcmd('gotocamera',{'gotocam','tocam'},function(args, speaker)
		getRoot(speaker.Character).CFrame = workspace.Camera.CFrame
	end)

	addcmd('tweengotocamera',{'tweengotocam','tgotocam','ttocam'},function(args, speaker)
		TweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = workspace.Camera.CFrame}):Play()
	end)

	addcmd('fov',{},function(args, speaker)
		local fov = args[1] or 70
		if isNumber(fov) then
			workspace.CurrentCamera.FieldOfView = fov
		end
	end)

	local preMaxZoom = Players.LocalPlayer.CameraMaxZoomDistance
	local preMinZoom = Players.LocalPlayer.CameraMinZoomDistance
	addcmd('lookat',{},function(args, speaker)
		if speaker.CameraMaxZoomDistance ~= 0.5 then
			preMaxZoom = speaker.CameraMaxZoomDistance
			preMinZoom = speaker.CameraMinZoomDistance
		end
		speaker.CameraMaxZoomDistance = 0.5
		speaker.CameraMinZoomDistance = 0.5
		wait()
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			local target = Players[v].Character
			if target and target:FindFirstChild('Head') then
				workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, target.Head.CFrame.p)
				wait(0.1)
			end
		end
		speaker.CameraMaxZoomDistance = preMaxZoom
		speaker.CameraMinZoomDistance = preMinZoom
	end)

	addcmd('fixcam',{'restorecam'},function(args, speaker)
		StopFreecam()
		execCmd('unview')
		workspace.CurrentCamera:remove()
		wait(.1)
		repeat wait() until speaker.Character ~= nil
		workspace.CurrentCamera.CameraSubject = speaker.Character:FindFirstChildWhichIsA('Humanoid')
		workspace.CurrentCamera.CameraType = "Custom"
		speaker.CameraMinZoomDistance = 0.5
		speaker.CameraMaxZoomDistance = 400
		speaker.CameraMode = "Classic"
		speaker.Character.Head.Anchored = false
	end)

	addcmd('enableshiftlock',{'enablesl','shiftlock'},function(args, speaker)
		speaker.DevEnableMouseLock = true
		notify('Shiftlock','Shift lock is now available')
	end)

	addcmd('firstp',{},function(args, speaker)
		speaker.CameraMode = "LockFirstPerson"
	end)

	addcmd('thirdp',{},function(args, speaker)
		speaker.CameraMode = "Classic"
	end)

	addcmd('noclipcam', {'nccam'}, function(args, speaker)
		local sc = (debug and debug.setconstant) or setconstant
		local gc = (debug and debug.getconstants) or getconstants
		if not sc or not getgc or not gc then
			return notify('Incompatible Exploit', 'Your exploit does not support this command (missing setconstant or getconstants or getgc)')
		end
		local pop = speaker.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
		for _, v in pairs(getgc()) do
			if type(v) == 'function' and getfenv(v).script == pop then
				for i, v1 in pairs(gc(v)) do
					if tonumber(v1) == .25 then
						sc(v, i, 0)
					elseif tonumber(v1) == 0 then
						sc(v, i, .25)
					end
				end
			end
		end
	end)

	addcmd('maxzoom',{},function(args, speaker)
		speaker.CameraMaxZoomDistance = args[1]
	end)

	addcmd('minzoom',{},function(args, speaker)
		speaker.CameraMinZoomDistance = args[1]
	end)

	addcmd('camdistance',{},function(args, speaker)
		local camMax = speaker.CameraMaxZoomDistance
		local camMin = speaker.CameraMinZoomDistance
		if camMax < tonumber(args[1]) then
			camMax = args[1]
		end
		speaker.CameraMaxZoomDistance = args[1]
		speaker.CameraMinZoomDistance = args[1]
		wait()
		speaker.CameraMaxZoomDistance = camMax
		speaker.CameraMinZoomDistance = camMin
	end)

	addcmd('unlockws',{'unlockworkspace'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Locked = false
			end
		end
	end)

	addcmd('lockws',{'lockworkspace'},function(args, speaker) 
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Locked = true
			end
		end
	end)

	addcmd('delete',{'remove'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name:lower() == getstring(1):lower() then
				v:Destroy()
			end
		end
		notify('Item(s) Deleted','Deleted ' ..getstring(1))
	end)

	addcmd('deleteclass',{'removeclass','deleteclassname','removeclassname','dc'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.ClassName:lower() == getstring(1):lower() then
				v:Destroy()
			end
		end
		notify('Item(s) Deleted','Deleted items with ClassName ' ..getstring(1))
	end)

	addcmd('chardelete',{'charremove','cd'},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v.Name:lower() == getstring(1):lower() then
				v:Destroy()
			end
		end
		notify('Item(s) Deleted','Deleted ' ..getstring(1))
	end)

	addcmd('chardeleteclass',{'charremoveclass','chardeleteclassname','charremoveclassname','cdc'},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v.ClassName:lower() == getstring(1):lower() then
				v:Destroy()
			end
		end
		notify('Item(s) Deleted','Deleted items with ClassName ' ..getstring(1))
	end)

	addcmd('deletevelocity',{'dv','removevelocity','removeforces'},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v:IsA("BodyVelocity") or v:IsA("BodyGyro") or v:IsA("RocketPropulsion") or v:IsA("BodyThrust") or v:IsA("BodyAngularVelocity") or v:IsA("AngularVelocity") or v:IsA("BodyForce") or v:IsA("VectorForce") or v:IsA("LineForce") then
				v:Destroy()
			end
		end
	end)

	addcmd('deleteinvisparts',{'deleteinvisibleparts','dip'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.Transparency == 1 and v.CanCollide then
				v:Destroy()
			end
		end
	end)

	local shownParts = {}
	addcmd('invisibleparts',{'invisparts'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.Transparency == 1 then
				if not table.find(shownParts,v) then
					table.insert(shownParts,v)
				end
				v.Transparency = 0
			end
		end
	end)

	addcmd('uninvisibleparts',{'uninvisparts'},function(args, speaker)
		for i,v in pairs(shownParts) do
			v.Transparency = 1
		end
		shownParts = {}
	end)

	addcmd('btools',{},function(args, speaker)
		for i = 1, 4 do
			local Tool = Instance.new("HopperBin")
			Tool.BinType = i
			Tool.Name = randomString()
			Tool.Parent = speaker:FindFirstChildOfClass("Backpack")
		end
	end)

	addcmd('f3x',{'fex'},function(args, speaker)
		loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
	end)

	addcmd('partpath',{'partname'},function(args, speaker)
		selectPart()
	end)

	addcmd('antiafk',{'antiidle'},function(args, speaker)
		local GC = getconnections or get_signal_cons
		if GC then
			for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
				if v["Disable"] then
					v["Disable"](v)
				elseif v["Disconnect"] then
					v["Disconnect"](v)
				end
			end
		else
			local VirtualUser = cloneref(game:GetService("VirtualUser"))
			Players.LocalPlayer.Idled:Connect(function()
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new())
			end)
		end
		if not (args[1] and tostring(args[1]) == 'nonotify') then notify('Anti Idle','Anti idle is enabled') end
	end)

	addcmd("datalimit", {}, function(args, speaker)
		if tonumber(args[1]) then
			NetworkClient:SetOutgoingKBPSLimit(args[1])
		end
	end)

	addcmd("replicationlag", {"backtrack"}, function(args, speaker)
		if tonumber(args[1]) then
			settings():GetService("NetworkSettings").IncomingReplicationLag = args[1]
		end
	end)

	addcmd("noprompts", {"nopurchaseprompts"}, function(args, speaker)
		COREGUI.PurchasePrompt.Enabled = false
	end)

	addcmd("showprompts", {"showpurchaseprompts"}, function(args, speaker)
		COREGUI.PurchasePrompt.Enabled = true
	end)

	promptNewRig = function(speaker, rig)
		local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			AvatarEditorService:PromptSaveAvatar(humanoid.HumanoidDescription, Enum.HumanoidRigType[rig])
			local result = AvatarEditorService.PromptSaveAvatarCompleted:Wait()
			if result == Enum.AvatarPromptResult.Success then
				execCmd("reset")
			end
		end
	end

	addcmd("promptr6", {}, function(args, speaker)
		promptNewRig(speaker, "R6")
	end)

	addcmd("promptr15", {}, function(args, speaker)
		promptNewRig(speaker, "R15")
	end)

	addcmd("wallwalk", {"walkonwalls"}, function(args, speaker)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/wallwalker.lua"))()
	end)

	addcmd('age',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		local ages = {}
		for i,v in pairs(players) do
			local p = Players[v]
			table.insert(ages, p.Name.."'s age is: "..p.AccountAge)
		end
		notify('Account Age',table.concat(ages, ',\n'))
	end)

	addcmd('chatage',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		local ages = {}
		for i,v in pairs(players) do
			local p = Players[v]
			table.insert(ages, p.Name.."'s age is: "..p.AccountAge)
		end
		local chatString = table.concat(ages, ', ')
		chatMessage(chatString)
	end)

	addcmd('joindate',{'jd'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		local dates = {}
		notify("Loading",'Hold on a sec')
		for i,v in pairs(players) do
			local user = game:HttpGet("https://users.roblox.com/v1/users/"..Players[v].UserId)
			local json = HttpService:JSONDecode(user)
			local date = json["created"]:sub(1,10)
			local splitDates = string.split(date,"-")
			table.insert(dates,Players[v].Name.." joined: "..splitDates[2].."/"..splitDates[3].."/"..splitDates[1])
		end
		notify('Join Date (Month/Day/Year)',table.concat(dates, ',\n'))
	end)

	addcmd('chatjoindate',{'cjd'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		local dates = {}
		notify("Loading",'Hold on a sec')
		for i,v in pairs(players) do
			local user = game:HttpGet("https://users.roblox.com/v1/users/"..Players[v].UserId)
			local json = HttpService:JSONDecode(user)
			local date = json["created"]:sub(1,10)
			local splitDates = string.split(date,"-")
			table.insert(dates,Players[v].Name.." joined: "..splitDates[2].."/"..splitDates[3].."/"..splitDates[1])
		end
		local chatString = table.concat(dates, ', ')
		chatMessage(chatString)
	end)

	addcmd('copyname',{'copyuser'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			local name = tostring(Players[v].Name)
			toClipboard(name)
		end
	end)

	addcmd('userid',{'id'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			local id = tostring(Players[v].UserId)
			notify('User ID',id)
		end
	end)

	addcmd('copyid',{'copyuserid'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			local id = tostring(Players[v].UserId)
			toClipboard(id)
		end
	end)

	addcmd('creatorid',{'creator'},function(args, speaker)
		if game.CreatorType == Enum.CreatorType.User then
			notify('Creator ID',game.CreatorId)
		elseif game.CreatorType == Enum.CreatorType.Group then
			local OwnerID = GroupService:GetGroupInfoAsync(game.CreatorId).Owner.Id
			speaker.UserId = OwnerID
			notify('Creator ID',OwnerID)
		end
	end)

	addcmd('copycreatorid',{'copycreator'},function(args, speaker)
		if game.CreatorType == Enum.CreatorType.User then
			toClipboard(game.CreatorId)
			notify('Copied ID','Copied creator ID to clipboard')
		elseif game.CreatorType == Enum.CreatorType.Group then
			local OwnerID = GroupService:GetGroupInfoAsync(game.CreatorId).Owner.Id
			toClipboard(OwnerID)
			notify('Copied ID','Copied creator ID to clipboard')
		end
	end)

	addcmd('setcreatorid',{'setcreator'},function(args, speaker)
		if game.CreatorType == Enum.CreatorType.User then
			speaker.UserId = game.CreatorId
			notify('Set ID','Set UserId to '..game.CreatorId)
		elseif game.CreatorType == Enum.CreatorType.Group then
			local OwnerID = GroupService:GetGroupInfoAsync(game.CreatorId).Owner.Id
			speaker.UserId = OwnerID
			notify('Set ID','Set UserId to '..OwnerID)
		end
	end)

	addcmd('appearanceid',{'aid'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			local aid = tostring(Players[v].CharacterAppearanceId)
			notify('Appearance ID',aid)
		end
	end)

	addcmd('copyappearanceid',{'caid'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			local aid = tostring(Players[v].CharacterAppearanceId)
			toClipboard(aid)
		end
	end)

	addcmd('norender',{},function(args, speaker)
		RunService:Set3dRenderingEnabled(false)
	end)

	addcmd('render',{},function(args, speaker)
		RunService:Set3dRenderingEnabled(true)
	end)

	addcmd('2022materials',{'use2022materials'},function(args, speaker)
		if sethidden then
			sethidden(MaterialService, "Use2022Materials", true)
		else
			notify('Incompatible Exploit','Your exploit does not support this command (missing sethiddenproperty)')
		end
	end)

	addcmd('un2022materials',{'unuse2022materials'},function(args, speaker)
		if sethidden then
			sethidden(MaterialService, "Use2022Materials", false)
		else
			notify('Incompatible Exploit','Your exploit does not support this command (missing sethiddenproperty)')
		end
	end)

	addcmd('goto',{'to'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			if Players[v].Character ~= nil then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				getRoot(speaker.Character).CFrame = getRoot(Players[v].Character).CFrame + Vector3.new(3,1,0)
			end
		end
		execCmd('breakvelocity')
	end)

	addcmd('tweengoto',{'tgoto','tto','tweento'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			if Players[v].Character ~= nil then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				TweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = getRoot(Players[v].Character).CFrame + Vector3.new(3,1,0)}):Play()
			end
		end
		execCmd('breakvelocity')
	end)

	addcmd('vehiclegoto',{'vgoto','vtp','vehicletp'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			if Players[v].Character ~= nil then
				local seat = speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart
				local vehicleModel = seat:FindFirstAncestorWhichIsA("Model")
				vehicleModel:MoveTo(getRoot(Players[v].Character).Position)
			end
		end
	end)

	addcmd('pulsetp',{'ptp'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			if Players[v].Character ~= nil then
				local startPos = getRoot(speaker.Character).CFrame
				local seconds = args[2] or 1
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				getRoot(speaker.Character).CFrame = getRoot(Players[v].Character).CFrame + Vector3.new(3,1,0)
				wait(seconds)
				getRoot(speaker.Character).CFrame = startPos
			end
		end
		execCmd('breakvelocity')
	end)

	local vnoclipParts = {}
	addcmd('vehiclenoclip',{'vnoclip'},function(args, speaker)
		vnoclipParts = {}
		local seat = speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart
		local vehicleModel = seat.Parent
		repeat
			if vehicleModel.ClassName ~= "Model" then
				vehicleModel = vehicleModel.Parent
			end
		until vehicleModel.ClassName == "Model"
		wait(0.1)
		execCmd('noclip')
		for i,v in pairs(vehicleModel:GetDescendants()) do
			if v:IsA("BasePart") and v.CanCollide then
				table.insert(vnoclipParts,v)
				v.CanCollide = false
			end
		end
	end)

	addcmd("vehicleclip", {"vclip", "unvnoclip", "unvehiclenoclip"}, function(args, speaker)
		execCmd("clip")
		for i, v in pairs(vnoclipParts) do
			v.CanCollide = true
		end
		vnoclipParts = {}
	end)

	addcmd("togglevnoclip", {}, function(args, speaker)
		execCmd(Clip and "vnoclip" or "vclip")
	end)

	addcmd('clientbring',{'cbring'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			if Players[v].Character ~= nil then
				if Players[v].Character:FindFirstChildOfClass('Humanoid') then
					Players[v].Character:FindFirstChildOfClass('Humanoid').Sit = false
				end
				wait()
				getRoot(Players[v].Character).CFrame = getRoot(speaker.Character).CFrame + Vector3.new(3,1,0)
			end
		end
	end)

	local bringT = {}
	addcmd('loopbring',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			task.spawn(function()
				if Players[v].Name ~= speaker.Name and not FindInTable(bringT, Players[v].Name) then
					table.insert(bringT, Players[v].Name)
					local plrName = Players[v].Name
					local pchar=Players[v].Character
					local distance = 3
					if args[2] and isNumber(args[2]) then
						distance = args[2]
					end
					local lDelay = 0
					if args[3] and isNumber(args[3]) then
						lDelay = args[3]
					end
					repeat
						for i,c in pairs(players) do
							if Players:FindFirstChild(v) then
								pchar = Players[v].Character
								if pchar~= nil and Players[v].Character ~= nil and getRoot(pchar) and speaker.Character ~= nil and getRoot(speaker.Character) then
									getRoot(pchar).CFrame = getRoot(speaker.Character).CFrame + Vector3.new(distance,1,0)
								end
								wait(lDelay)
							else 
								for a,b in pairs(bringT) do if b == plrName then table.remove(bringT, a) end end
							end
						end
					until not FindInTable(bringT, plrName)
				end
			end)
		end
	end)

	addcmd('unloopbring',{'noloopbring'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			task.spawn(function()
				for a,b in pairs(bringT) do if b == Players[v].Name then table.remove(bringT, a) end end
			end)
		end
	end)

	local walkto = false
	local waypointwalkto = false
	addcmd('walkto',{'follow'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			if Players[v].Character ~= nil then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				walkto = true
				repeat wait()
					speaker.Character:FindFirstChildOfClass('Humanoid'):MoveTo(getRoot(Players[v].Character).Position)
				until Players[v].Character == nil or not getRoot(Players[v].Character) or walkto == false
			end
		end
	end)

	addcmd('pathfindwalkto',{'pathfindfollow'},function(args, speaker)
		walkto = false
		wait()
		local players = getPlayer(args[1], speaker)
		local hum = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		local path = PathService:CreatePath()
		for i,v in pairs(players)do
			if Players[v].Character ~= nil then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				walkto = true
				repeat wait()
					local success, response = pcall(function()
						path:ComputeAsync(getRoot(speaker.Character).Position, getRoot(Players[v].Character).Position)
						local waypoints = path:GetWaypoints()
						local distance 
						for waypointIndex, waypoint in pairs(waypoints) do
							local waypointPosition = waypoint.Position
							hum:MoveTo(waypointPosition)
							repeat 
								distance = (waypointPosition - hum.Parent.PrimaryPart.Position).magnitude
								wait()
							until
							distance <= 5
						end	 
					end)
					if not success then
						speaker.Character:FindFirstChildOfClass('Humanoid'):MoveTo(getRoot(Players[v].Character).Position)
					end
				until Players[v].Character == nil or not getRoot(Players[v].Character) or walkto == false
			end
		end
	end)

	addcmd('pathfindwalktowaypoint',{'pathfindwalktowp'},function(args, speaker)
		waypointwalkto = false
		wait()
		local WPName = tostring(getstring(1))
		local hum = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		local path = PathService:CreatePath()
		if speaker.Character then
			for i,_ in pairs(WayPoints) do
				if tostring(WayPoints[i].NAME):lower() == tostring(WPName):lower() then
					if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
						speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
						wait(.1)
					end
					local TrueCoords = Vector3.new(WayPoints[i].COORD[1], WayPoints[i].COORD[2], WayPoints[i].COORD[3])
					waypointwalkto = true
					repeat wait()
						local success, response = pcall(function()
							path:ComputeAsync(getRoot(speaker.Character).Position, TrueCoords)
							local waypoints = path:GetWaypoints()
							local distance 
							for waypointIndex, waypoint in pairs(waypoints) do
								local waypointPosition = waypoint.Position
								hum:MoveTo(waypointPosition)
								repeat 
									distance = (waypointPosition - hum.Parent.PrimaryPart.Position).magnitude
									wait()
								until
								distance <= 5
							end
						end)
						if not success then
							speaker.Character:FindFirstChildOfClass('Humanoid'):MoveTo(TrueCoords)
						end
					until not speaker.Character or waypointwalkto == false
				end
			end
			for i,_ in pairs(pWayPoints) do
				if tostring(pWayPoints[i].NAME):lower() == tostring(WPName):lower() then
					if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
						speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
						wait(.1)
					end
					local TrueCoords = pWayPoints[i].COORD[1].Position
					waypointwalkto = true
					repeat wait()
						local success, response = pcall(function()
							path:ComputeAsync(getRoot(speaker.Character).Position, TrueCoords)
							local waypoints = path:GetWaypoints()
							local distance 
							for waypointIndex, waypoint in pairs(waypoints) do
								local waypointPosition = waypoint.Position
								hum:MoveTo(waypointPosition)
								repeat 
									distance = (waypointPosition - hum.Parent.PrimaryPart.Position).magnitude
									wait()
								until
								distance <= 5
							end
						end)
						if not success then
							speaker.Character:FindFirstChildOfClass('Humanoid'):MoveTo(TrueCoords)
						end
					until not speaker.Character or waypointwalkto == false
				end
			end
		end
	end)

	addcmd('unwalkto',{'nowalkto','unfollow','nofollow'},function(args, speaker)
		walkto = false
		waypointwalkto = false
	end)

	addcmd("orbit", {}, function(args, speaker)
		execCmd("unorbit nonotify")
		local target = Players:FindFirstChild(getPlayer(args[1], speaker)[1])
		local root = getRoot(speaker.Character)
		local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
		if target and target.Character and getRoot(target.Character) and root and humanoid then
			local rotation = 0
			local speed = tonumber(args[2]) or 0.2
			local distance = tonumber(args[3]) or 6
			orbit1 = RunService.Heartbeat:Connect(function()
				pcall(function()
					rotation = rotation + speed
					root.CFrame = CFrame.new(getRoot(target.Character).Position) * CFrame.Angles(0, math.rad(rotation), 0) * CFrame.new(distance, 0, 0)
				end)
			end)
			orbit2 = RunService.RenderStepped:Connect(function()
				pcall(function()
					root.CFrame = CFrame.new(root.Position, getRoot(target.Character).Position)
				end)
			end)
			orbit3 = humanoid.Died:Connect(function() execCmd("unorbit") end)
			orbit4 = humanoid.Seated:Connect(function(value) if value then execCmd("unorbit") end end)
			notify("Orbit", "Started orbiting " .. formatUsername(target))
		end
	end)

	addcmd("unorbit", {}, function(args, speaker)
		if orbit1 then orbit1:Disconnect() end
		if orbit2 then orbit2:Disconnect() end
		if orbit3 then orbit3:Disconnect() end
		if orbit4 then orbit4:Disconnect() end
		if args[1] ~= "nonotify" then notify("Orbit", "Stopped orbiting player") end
	end)

	addcmd('freeze',{'fr'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		if players ~= nil then
			for i,v in pairs(players) do
				task.spawn(function()
					for i, x in next, Players[v].Character:GetDescendants() do
						if x:IsA("BasePart") and not x.Anchored then
							x.Anchored = true
						end
					end
				end)
			end
		end
	end)


	addcmd('thaw',{'unfreeze','unfr'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		if players ~= nil then
			for i,v in pairs(players) do
				task.spawn(function()
					for i, x in next, Players[v].Character:GetDescendants() do
						if x.Name ~= floatName and x:IsA("BasePart") and x.Anchored then
							x.Anchored = false
						end
					end
				end)
			end
		end
	end)

	oofing = false
	addcmd('loopoof',{},function(args, speaker)
		oofing = true
		repeat wait(0.1)
			for i,v in pairs(Players:GetPlayers()) do
				if v.Character ~= nil and v.Character:FindFirstChild'Head' then
					for _,x in pairs(v.Character.Head:GetChildren()) do
						if x:IsA'Sound' then x.Playing = true end
					end
				end
			end
		until oofing == false
	end)

	addcmd('unloopoof',{},function(args, speaker)
		oofing = false
	end)

	local notifiedRespectFiltering = false
	addcmd('muteboombox',{},function(args, speaker)
		if not notifiedRespectFiltering and SoundService.RespectFilteringEnabled then notifiedRespectFiltering = true notify('RespectFilteringEnabled','RespectFilteringEnabled is set to true (the command will still work but may only be clientsided)') end
		local players = getPlayer(args[1], speaker)
		if players ~= nil then
			for i,v in pairs(players) do
				task.spawn(function()
					for i, x in next, Players[v].Character:GetDescendants() do
						if x:IsA("Sound") and x.Playing == true then
							x.Playing = false
						end
					end
					for i, x in next, Players[v]:FindFirstChildOfClass("Backpack"):GetDescendants() do
						if x:IsA("Sound") and x.Playing == true then
							x.Playing = false
						end
					end
				end)
			end
		end
	end)

	addcmd('unmuteboombox',{},function(args, speaker)
		if not notifiedRespectFiltering and SoundService.RespectFilteringEnabled then notifiedRespectFiltering = true notify('RespectFilteringEnabled','RespectFilteringEnabled is set to true (the command will still work but may only be clientsided)') end
		local players = getPlayer(args[1], speaker)
		if players ~= nil then
			for i,v in pairs(players) do
				task.spawn(function()
					for i, x in next, Players[v].Character:GetDescendants() do
						if x:IsA("Sound") and x.Playing == false then
							x.Playing = true
						end
					end
				end)
			end
		end
	end)

	addcmd('reset',{},function(args, speaker)
		speaker.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
	end)

	addcmd('freezeanims',{},function(args, speaker)
		local Humanoid = speaker.Character:FindFirstChildOfClass("Humanoid") or speaker.Character:FindFirstChildOfClass("AnimationController")
		local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
		for _, v in pairs(ActiveTracks) do
			v:AdjustSpeed(0)
		end
	end)

	addcmd('unfreezeanims',{},function(args, speaker)
		local Humanoid = speaker.Character:FindFirstChildOfClass("Humanoid") or speaker.Character:FindFirstChildOfClass("AnimationController")
		local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
		for _, v in pairs(ActiveTracks) do
			v:AdjustSpeed(1)
		end
	end)




	addcmd('respawn',{},function(args, speaker)
		respawn(speaker)
	end)

	addcmd('refresh',{'re'},function(args, speaker)
		refresh(speaker)
	end)

	addcmd('god',{},function(args, speaker)
		local Cam = workspace.CurrentCamera
		local Pos, Char = Cam.CFrame, speaker.Character
		local Human = Char and Char.FindFirstChildWhichIsA(Char, "Humanoid")
		local nHuman = Human.Clone(Human)
		nHuman.Parent, speaker.Character = Char, nil
		nHuman.SetStateEnabled(nHuman, 15, false)
		nHuman.SetStateEnabled(nHuman, 1, false)
		nHuman.SetStateEnabled(nHuman, 0, false)
		nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
		speaker.Character, Cam.CameraSubject, Cam.CFrame = Char, nHuman, wait() and Pos
		nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		local Script = Char.FindFirstChild(Char, "Animate")
		if Script then
			Script.Disabled = true
			wait()
			Script.Disabled = false
		end
		nHuman.Health = nHuman.MaxHealth
	end)

	invisRunning = false
	addcmd('invisible',{'invis'},function(args, speaker)
		if invisRunning then return end
		invisRunning = true
		-- Full credit to AmokahFox @V3rmillion
		local Player = speaker
		repeat wait(.1) until Player.Character
		local Character = Player.Character
		Character.Archivable = true
		local IsInvis = false
		local IsRunning = true
		local InvisibleCharacter = Character:Clone()
		InvisibleCharacter.Parent = Lighting
		local Void = workspace.FallenPartsDestroyHeight
		InvisibleCharacter.Name = ""
		local CF

		local invisFix = RunService.Stepped:Connect(function()
			pcall(function()
				local IsInteger
				if tostring(Void):find'-' then
					IsInteger = true
				else
					IsInteger = false
				end
				local Pos = Player.Character.HumanoidRootPart.Position
				local Pos_String = tostring(Pos)
				local Pos_Seperate = Pos_String:split(', ')
				local X = tonumber(Pos_Seperate[1])
				local Y = tonumber(Pos_Seperate[2])
				local Z = tonumber(Pos_Seperate[3])
				if IsInteger == true then
					if Y <= Void then
						Respawn()
					end
				elseif IsInteger == false then
					if Y >= Void then
						Respawn()
					end
				end
			end)
		end)

		for i,v in pairs(InvisibleCharacter:GetDescendants())do
			if v:IsA("BasePart") then
				if v.Name == "HumanoidRootPart" then
					v.Transparency = 1
				else
					v.Transparency = .5
				end
			end
		end

		function Respawn()
			IsRunning = false
			if IsInvis == true then
				pcall(function()
					Player.Character = Character
					wait()
					Character.Parent = workspace
					Character:FindFirstChildWhichIsA'Humanoid':Destroy()
					IsInvis = false
					InvisibleCharacter.Parent = nil
					invisRunning = false
				end)
			elseif IsInvis == false then
				pcall(function()
					Player.Character = Character
					wait()
					Character.Parent = workspace
					Character:FindFirstChildWhichIsA'Humanoid':Destroy()
					TurnVisible()
				end)
			end
		end

		local invisDied
		invisDied = InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
			Respawn()
			invisDied:Disconnect()
		end)

		if IsInvis == true then return end
		IsInvis = true
		CF = workspace.CurrentCamera.CFrame
		local CF_1 = Player.Character.HumanoidRootPart.CFrame
		Character:MoveTo(Vector3.new(0,math.pi*1000000,0))
		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
		wait(.2)
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		InvisibleCharacter = InvisibleCharacter
		Character.Parent = Lighting
		InvisibleCharacter.Parent = workspace
		InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
		Player.Character = InvisibleCharacter
		execCmd('fixcam')
		Player.Character.Animate.Disabled = true
		Player.Character.Animate.Disabled = false

		function TurnVisible()
			if IsInvis == false then return end
			invisFix:Disconnect()
			invisDied:Disconnect()
			CF = workspace.CurrentCamera.CFrame
			Character = Character
			local CF_1 = Player.Character.HumanoidRootPart.CFrame
			Character.HumanoidRootPart.CFrame = CF_1
			InvisibleCharacter:Destroy()
			Player.Character = Character
			Character.Parent = workspace
			IsInvis = false
			Player.Character.Animate.Disabled = true
			Player.Character.Animate.Disabled = false
			invisDied = Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
				Respawn()
				invisDied:Disconnect()
			end)
			invisRunning = false
		end
		notify('Invisible','You now appear invisible to other players')
	end)

	addcmd("visible", {"vis"}, function(args, speaker)
		TurnVisible()
	end)

	addcmd("toggleinvis", {}, function(args, speaker)
		execCmd(invisRunning and "visible" or "invisible")
	end)

	addcmd('toolinvisible',{'toolinvis','tinvis'},function(args, speaker)
		local Char  = Players.LocalPlayer.Character
		local touched = false
		local tpdback = false
		local box = Instance.new('Part')
		box.Anchored = true
		box.CanCollide = true
		box.Size = Vector3.new(10,1,10)
		box.Position = Vector3.new(0,10000,0)
		box.Parent = workspace
		local boxTouched = box.Touched:connect(function(part)
			if (part.Parent.Name == Players.LocalPlayer.Name) then
				if touched == false then
					touched = true
					local function apply()
						local no = Char.HumanoidRootPart:Clone()
						wait(.25)
						Char.HumanoidRootPart:Destroy()
						no.Parent = Char
						Char:MoveTo(loc)
						touched = false
					end
					if Char then
						apply()
					end
				end
			end
		end)
		repeat wait() until Char
		local cleanUp
		cleanUp = Players.LocalPlayer.CharacterAdded:connect(function(char)
			boxTouched:Disconnect()
			box:Destroy()
			cleanUp:Disconnect()
		end)
		loc = Char.HumanoidRootPart.Position
		Char:MoveTo(box.Position + Vector3.new(0,.5,0))
	end)

	addcmd("strengthen", {}, function(args, speaker)
		for _, child in pairs(speaker.Character:GetDescendants()) do
			if child.ClassName == "Part" then
				if args[1] then
					child.CustomPhysicalProperties = PhysicalProperties.new(args[1], 0.3, 0.5)
				else
					child.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
				end
			end
		end
	end)

	addcmd("weaken", {}, function(args, speaker)
		for _, child in pairs(speaker.Character:GetDescendants()) do
			if child.ClassName == "Part" then
				if args[1] then
					child.CustomPhysicalProperties = PhysicalProperties.new(-args[1], 0.3, 0.5)
				else
					child.CustomPhysicalProperties = PhysicalProperties.new(0, 0.3, 0.5)
				end
			end
		end
	end)

	addcmd("unweaken", {"unstrengthen"}, function(args, speaker)
		for _, child in pairs(speaker.Character:GetDescendants()) do
			if child.ClassName == "Part" then
				child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
			end
		end
	end)

	addcmd("breakvelocity", {}, function(args, speaker)
		local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
		delay(1, function()
			BeenASecond = true
		end)
		while not BeenASecond do
			for _, v in ipairs(speaker.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Velocity, v.RotVelocity = V3, V3
				end
			end
			wait()
		end
	end)

	addcmd('jpower',{'jumppower','jp'},function(args, speaker)
		local jpower = args[1] or 50
		if isNumber(jpower) then
			if speaker.Character:FindFirstChildOfClass('Humanoid').UseJumpPower then
				speaker.Character:FindFirstChildOfClass('Humanoid').JumpPower = jpower
			else
				speaker.Character:FindFirstChildOfClass('Humanoid').JumpHeight  = jpower
			end
		end
	end)

	addcmd("maxslopeangle", {"msa"}, function(args, speaker)
		local sangle = args[1] or 89
		if isNumber(sangle) then
			speaker.Character:FindFirstChildWhichIsA("Humanoid").MaxSlopeAngle = sangle
		end
	end)

	addcmd("gravity", {"grav"}, function(args, speaker)
		local grav = args[1] or 196.2
		if isNumber(grav) then
			workspace.Gravity = grav
		end
	end)

	addcmd("hipheight", {"hheight"}, function(args, speaker)
		speaker.Character:FindFirstChildWhichIsA("Humanoid").HipHeight = args[1] or (r15(speaker) and 2.1 or 0)
	end)

	addcmd("dance", {}, function(args, speaker)
		pcall(execCmd, "undance")
		local dances = {"27789359", "30196114", "248263260", "45834924", "33796059", "28488254", "52155728"}
		if r15(speaker) then
			dances = {"3333432454", "4555808220", "4049037604", "4555782893", "10214311282", "10714010337", "10713981723", "10714372526", "10714076981", "10714392151", "11444443576"}
		end
		local animation = Instance.new("Animation")
		animation.AnimationId = "rbxassetid://" .. dances[math.random(1, #dances)]
		danceTrack = speaker.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(animation)
		danceTrack.Looped = true
		danceTrack:Play()
	end)

	addcmd("undance", {"nodance"}, function(args, speaker)
		danceTrack:Stop()
		danceTrack:Destroy()
	end)

	addcmd('nolimbs',{'rlimbs'},function(args, speaker)
		if r15(speaker) then
			for i,v in pairs(speaker.Character:GetChildren()) do
				if v:IsA("BasePart") and
					v.Name == "RightUpperLeg" or
					v.Name == "LeftUpperLeg" or
					v.Name == "RightUpperArm" or
					v.Name == "LeftUpperArm" then
					v:Destroy()
				end
			end
		else
			for i,v in pairs(speaker.Character:GetChildren()) do
				if v:IsA("BasePart") and
					v.Name == "Right Leg" or
					v.Name == "Left Leg" or
					v.Name == "Right Arm" or
					v.Name == "Left Arm" then
					v:Destroy()
				end
			end
		end
	end)

	addcmd('noarms',{'rarms'},function(args, speaker)
		if r15(speaker) then
			for i,v in pairs(speaker.Character:GetChildren()) do
				if v:IsA("BasePart") and
					v.Name == "RightUpperArm" or
					v.Name == "LeftUpperArm" then
					v:Destroy()
				end
			end
		else
			for i,v in pairs(speaker.Character:GetChildren()) do
				if v:IsA("BasePart") and
					v.Name == "Right Arm" or
					v.Name == "Left Arm" then
					v:Destroy()
				end
			end
		end
	end)

	addcmd('nolegs',{'rlegs'},function(args, speaker)
		if r15(speaker) then
			for i,v in pairs(speaker.Character:GetChildren()) do
				if v:IsA("BasePart") and
					v.Name == "RightUpperLeg" or
					v.Name == "LeftUpperLeg" then
					v:Destroy()
				end
			end
		else
			for i,v in pairs(speaker.Character:GetChildren()) do
				if v:IsA("BasePart") and
					v.Name == "Right Leg" or
					v.Name == "Left Leg" then
					v:Destroy()
				end
			end
		end
	end)

	addcmd("sit", {}, function(args, speaker)
		speaker.Character:FindFirstChildWhichIsA("Humanoid").Sit = true
	end)

	addcmd("lay", {"laydown"}, function(args, speaker)
		local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
		humanoid.Sit = true
		task.wait(0.1)
		humanoid.RootPart.CFrame = humanoid.RootPart.CFrame * CFrame.Angles(math.pi * 0.5, 0, 0)
		for _, v in ipairs(humanoid:GetPlayingAnimationTracks()) do
			v:Stop()
		end
	end)

	addcmd("sitwalk", {}, function(args, speaker)
		local anims = speaker.Character.Animate
		local sit = anims.sit:FindFirstChildWhichIsA("Animation").AnimationId
		anims.idle:FindFirstChildWhichIsA("Animation").AnimationId = sit
		anims.walk:FindFirstChildWhichIsA("Animation").AnimationId = sit
		anims.run:FindFirstChildWhichIsA("Animation").AnimationId = sit
		anims.jump:FindFirstChildWhichIsA("Animation").AnimationId = sit
		speaker.Character:FindFirstChildWhichIsA("Humanoid").HipHeight = not r15(speaker) and -1.5 or 0.5
	end)

	function noSitFunc()
		wait()
		if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit then
			Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit = false
		end
	end
	addcmd("nosit", {}, function(args, speaker)
		if noSit then noSit:Disconnect() nositDied:Disconnect() end
		noSit = Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):GetPropertyChangedSignal("Sit"):Connect(noSitFunc)
		local function nositDiedFunc()
			repeat wait() until speaker.Character ~= nil and speaker.Character:FindFirstChildOfClass("Humanoid")
			noSit:Disconnect()
			noSit = Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):GetPropertyChangedSignal("Sit"):Connect(noSitFunc)
		end
		nositDied = speaker.CharacterAdded:Connect(nositDiedFunc)
	end)

	addcmd("unnosit", {}, function(args, speaker)
		if noSit then noSit:Disconnect() nositDied:Disconnect() end
	end)

	addcmd("jump", {}, function(args, speaker)
		speaker.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end)

	local infJump
	infJumpDebounce = false
	addcmd("infjump", {"infinitejump"}, function(args, speaker)
		if infJump then infJump:Disconnect() end
		infJumpDebounce = false
		infJump = UserInputService.JumpRequest:Connect(function()
			if not infJumpDebounce then
				infJumpDebounce = true
				speaker.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
				wait()
				infJumpDebounce = false
			end
		end)
	end)

	addcmd("uninfjump", {"uninfinitejump", "noinfjump", "noinfinitejump"}, function(args, speaker)
		if infJump then infJump:Disconnect() end
		infJumpDebounce = false
	end)

	local flyjump
	addcmd("flyjump", {}, function(args, speaker)
		if flyjump then flyjump:Disconnect() end
		flyjump = UserInputService.JumpRequest:Connect(function()
			speaker.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
		end)
	end)

	addcmd("unflyjump", {"noflyjump"}, function(args, speaker)
		if flyjump then flyjump:Disconnect() end
	end)

	local HumanModCons = {}
	addcmd('autojump',{'ajump'},function(args, speaker)
		local Char = speaker.Character
		local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
		local function autoJump()
			if Char and Human then
				local check1 = workspace:FindPartOnRay(Ray.new(Human.RootPart.Position-Vector3.new(0,1.5,0), Human.RootPart.CFrame.lookVector*3), Human.Parent)
				local check2 = workspace:FindPartOnRay(Ray.new(Human.RootPart.Position+Vector3.new(0,1.5,0), Human.RootPart.CFrame.lookVector*3), Human.Parent)
				if check1 or check2 then
					Human.Jump = true
				end
			end
		end
		autoJump()
		HumanModCons.ajLoop = (HumanModCons.ajLoop and HumanModCons.ajLoop:Disconnect() and false) or RunService.RenderStepped:Connect(autoJump)
		HumanModCons.ajCA = (HumanModCons.ajCA and HumanModCons.ajCA:Disconnect() and false) or speaker.CharacterAdded:Connect(function(nChar)
			Char, Human = nChar, nChar:WaitForChild("Humanoid")
			autoJump()
			HumanModCons.ajLoop = (HumanModCons.ajLoop and HumanModCons.ajLoop:Disconnect() and false) or RunService.RenderStepped:Connect(autoJump)
		end)
	end)

	addcmd('unautojump',{'noautojump', 'noajump', 'unajump'},function(args, speaker)
		HumanModCons.ajLoop = (HumanModCons.ajLoop and HumanModCons.ajLoop:Disconnect() and false) or nil
		HumanModCons.ajCA = (HumanModCons.ajCA and HumanModCons.ajCA:Disconnect() and false) or nil
	end)

	addcmd('edgejump',{'ejump'},function(args, speaker)
		local Char = speaker.Character
		local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
		-- Full credit to NoelGamer06 @V3rmillion
		local state
		local laststate
		local lastcf
		local function edgejump()
			if Char and Human then
				laststate = state
				state = Human:GetState()
				if laststate ~= state and state == Enum.HumanoidStateType.Freefall and laststate ~= Enum.HumanoidStateType.Jumping then
					Char.HumanoidRootPart.CFrame = lastcf
					Char.HumanoidRootPart.Velocity = Vector3.new(Char.HumanoidRootPart.Velocity.X, Human.JumpPower or Human.JumpHeight, Char.HumanoidRootPart.Velocity.Z)
				end
				lastcf = Char.HumanoidRootPart.CFrame
			end
		end
		edgejump()
		HumanModCons.ejLoop = (HumanModCons.ejLoop and HumanModCons.ejLoop:Disconnect() and false) or RunService.RenderStepped:Connect(edgejump)
		HumanModCons.ejCA = (HumanModCons.ejCA and HumanModCons.ejCA:Disconnect() and false) or speaker.CharacterAdded:Connect(function(nChar)
			Char, Human = nChar, nChar:WaitForChild("Humanoid")
			edgejump()
			HumanModCons.ejLoop = (HumanModCons.ejLoop and HumanModCons.ejLoop:Disconnect() and false) or RunService.RenderStepped:Connect(edgejump)
		end)
	end)

	addcmd('unedgejump',{'noedgejump', 'noejump', 'unejump'},function(args, speaker)
		HumanModCons.ejLoop = (HumanModCons.ejLoop and HumanModCons.ejLoop:Disconnect() and false) or nil
		HumanModCons.ejCA = (HumanModCons.ejCA and HumanModCons.ejCA:Disconnect() and false) or nil
	end)

	addcmd('team',{},function(args, speaker)
		local teamname = nil
		for a,b in pairs(Teams:GetChildren()) do
			local L_name = b.Name:lower()
			local F = L_name:find(getstring(1))
			if F == 1 then
				teamname = b 
			end
		end
		speaker.Team = teamname
	end)

	addcmd('nobgui',{'unbgui','nobillboardgui','unbillboardgui','noname','rohg'},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants())do
			if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
				v:Destroy()
			end
		end
	end)

	addcmd('loopnobgui',{'loopunbgui','loopnobillboardgui','loopunbillboardgui','loopnoname','looprohg'},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants())do
			if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
				v:Destroy()
			end
		end
		local function charPartAdded(part)
			if part:IsA("BillboardGui") or part:IsA("SurfaceGui") then
				wait()
				part:Destroy()
			end
		end
		charPartTrigger = speaker.Character.DescendantAdded:Connect(charPartAdded)
	end)

	addcmd('unloopnobgui',{'unloopunbgui','unloopnobillboardgui','unloopunbillboardgui','unloopnoname','unlooprohg'},function(args, speaker)
		if charPartTrigger then
			charPartTrigger:Disconnect()
		end
	end)

	addcmd('spasm',{},function(args, speaker)
		if not r15(speaker) then
			local pchar=speaker.Character
			local AnimationId = "33796059"
			SpasmAnim = Instance.new("Animation")
			SpasmAnim.AnimationId = "rbxassetid://"..AnimationId
			Spasm = pchar:FindFirstChildOfClass('Humanoid'):LoadAnimation(SpasmAnim)
			Spasm:Play()
			Spasm:AdjustSpeed(99)
		else
			notify('R6 Required','This command requires the r6 rig type')
		end
	end)

	addcmd('unspasm',{'nospasm'},function(args, speaker)
		Spasm:Stop()
		SpasmAnim:Destroy()
	end)

	addcmd('headthrow',{},function(args, speaker)
		if not r15(speaker) then
			local AnimationId = "35154961"
			local Anim = Instance.new("Animation")
			Anim.AnimationId = "rbxassetid://"..AnimationId
			local k = speaker.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
			k:Play(0)
			k:AdjustSpeed(1)
		else
			notify('R6 Required','This command requires the r6 rig type')
		end
	end)

	addcmd('animation',{'anim'},function(args, speaker)
		if not r15(speaker) then
			local pchar=speaker.Character
			local AnimationId = tostring(args[1])
			local Anim = Instance.new("Animation")
			Anim.AnimationId = "rbxassetid://"..AnimationId
			local k = pchar:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
			k:Play()
			if args[2] then
				k:AdjustSpeed(tostring(args[2]))
			end
		else
			notify('R6 Required','This command requires the r6 rig type')
		end
	end)

	addcmd('noanim',{},function(args, speaker)
		speaker.Character.Animate.Disabled = true
	end)

	addcmd('reanim',{},function(args, speaker)
		speaker.Character.Animate.Disabled = false
	end)

	addcmd('animspeed',{},function(args, speaker)
		local Char = speaker.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(tonumber(args[1] or 1))
		end
	end)

	addcmd('copyanimation',{'copyanim','copyemote'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for _,v in ipairs(players)do
			local char = Players[v].Character
			for _, v1 in pairs(speaker.Character:FindFirstChildOfClass('Humanoid'):GetPlayingAnimationTracks()) do
				v1:Stop()
			end
			for _, v1 in pairs(Players[v].Character:FindFirstChildOfClass('Humanoid'):GetPlayingAnimationTracks()) do
				if not string.find(v1.Animation.AnimationId, "507768375") then
					local ANIM = speaker.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(v1.Animation)
					ANIM:Play(.1, 1, v1.Speed)
					ANIM.TimePosition = v1.TimePosition
					task.spawn(function()
						v1.Stopped:Wait()
						ANIM:Stop()
						ANIM:Destroy()
					end)
				end
			end
		end
	end)

	addcmd("copyanimationid", {"copyanimid", "copyemoteid"}, function(args, speaker)
		local copyAnimId = function(player)
			local found = "Animations Copied"

			for _, v in pairs(player.Character:FindFirstChildWhichIsA("Humanoid"):GetPlayingAnimationTracks()) do
				local animationId = v.Animation.AnimationId
				local assetId = animationId:find("rbxassetid://") and animationId:match("%d+")

				if not string.find(animationId, "507768375") and not string.find(animationId, "180435571") then
					if assetId then
						local success, result = pcall(function()
							return MarketplaceService:GetProductInfo(tonumber(assetId)).Name
						end)
						local name = success and result or "Failed to get name"
						found = found .. "\n\nName: " .. name .. "\nAnimation Id: " .. animationId
					else
						found = found .. "\n\nAnimation Id: " .. animationId
					end
				end
			end

			if found ~= "Animations Copied" then
				toClipboard(found)
			else
				notify("Animations", "No animations to copy")
			end
		end

		if args[1] then
			copyAnimId(Players[getPlayer(args[1], speaker)[1]])
		else
			copyAnimId(speaker)
		end
	end)

	addcmd('stopanimations',{'stopanims','stopanim'},function(args, speaker)
		local Char = speaker.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:Stop()
		end
	end)

	addcmd('refreshanimations', {'refreshanimation', 'refreshanims', 'refreshanim'}, function(args, speaker)
		local Char = speaker.Character or speaker.CharacterAdded:Wait()
		local Human = Char and Char:WaitForChild('Humanoid', 15)
		local Animate = Char and Char:WaitForChild('Animate', 15)
		if not Human or not Animate then
			return notify('Refresh Animations', 'Failed to get Animate/Humanoid')
		end
		Animate.Disabled = true
		for _, v in ipairs(Human:GetPlayingAnimationTracks()) do
			v:Stop()
		end
		Animate.Disabled = false
	end)

	addcmd('allowcustomanim', {'allowcustomanimations'}, function(args, speaker)
		StarterPlayer.AllowCustomAnimations = true
		execCmd('refreshanimations')
	end)

	addcmd('unallowcustomanim', {'unallowcustomanimations'}, function(args, speaker)
		StarterPlayer.AllowCustomAnimations = false
		execCmd('refreshanimations')
	end)

	addcmd('loopanimation', {'loopanim'},function(args, speaker)
		local Char = speaker.Character
		local Human = Char and Char.FindFirstChildWhichIsA(Char, "Humanoid")
		for _, v in ipairs(Human.GetPlayingAnimationTracks(Human)) do
			v.Looped = true
		end
	end)

	addcmd('tpposition',{'tppos'},function(args, speaker)
		if #args < 3 then return end
		local tpX,tpY,tpZ = tonumber((args[1]:gsub(",", ""))),tonumber((args[2]:gsub(",", ""))),tonumber((args[3]:gsub(",", "")))
		local char = speaker.Character
		if char and getRoot(char) then
			getRoot(char).CFrame = CFrame.new(tpX,tpY,tpZ)
		end
	end)

	addcmd('tweentpposition',{'ttppos'},function(args, speaker)
		if #args < 3 then return end
		local tpX,tpY,tpZ = tonumber((args[1]:gsub(",", ""))),tonumber((args[2]:gsub(",", ""))),tonumber((args[3]:gsub(",", "")))
		local char = speaker.Character
		if char and getRoot(char) then
			TweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(tpX,tpY,tpZ)}):Play()
		end
	end)

	addcmd('offset',{},function(args, speaker)
		if #args < 3 then
			return 
		end
		if speaker.Character then
			speaker.Character:TranslateBy(Vector3.new(tonumber(args[1]) or 0, tonumber(args[2]) or 0, tonumber(args[3]) or 0))
		end
	end)

	addcmd('tweenoffset',{'toffset'},function(args, speaker)
		if #args < 3 then return end
		local tpX,tpY,tpZ = tonumber(args[1]),tonumber(args[2]),tonumber(args[3])
		local char = speaker.Character
		if char and getRoot(char) then
			TweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(tpX,tpY,tpZ)}):Play()
		end
	end)

	addcmd('clickteleport',{},function(args, speaker)
		if speaker == Players.LocalPlayer then
			notify('Click TP','Go to Settings>Keybinds>Add to set up click tp')
		end
	end)

	addcmd('tptool', {'teleporttool'}, function(args, speaker)
		local TpTool = Instance.new("Tool")
		TpTool.Name = "Teleport Tool"
		TpTool.RequiresHandle = false
		TpTool.Parent = speaker.Backpack
		TpTool.Activated:Connect(function()
			local Char = speaker.Character or workspace:FindFirstChild(speaker.Name)
			local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
			if not Char or not HRP then
				return warn("Failed to find HumanoidRootPart")
			end
			HRP.CFrame = CFrame.new(IYMouse.Hit.X, IYMouse.Hit.Y + 3, IYMouse.Hit.Z, select(4, HRP.CFrame:components()))
		end)
	end)

	addcmd('clickdelete',{},function(args, speaker)
		if speaker == Players.LocalPlayer then
			notify('Click Delete','Go to Settings>Keybinds>Add to set up click delete')
		end
	end)

	addcmd('getposition',{'getpos','notifypos','notifyposition'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			local char = Players[v].Character
			local pos = char and (getRoot(char) or char:FindFirstChildWhichIsA("BasePart"))
			pos = pos and pos.Position
			if not pos then
				return notify('Getposition Error','Missing character')
			end
			local roundedPos = math.round(pos.X) .. ", " .. math.round(pos.Y) .. ", " .. math.round(pos.Z)
			notify('Current Position',roundedPos)
		end
	end)

	addcmd('copyposition',{'copypos'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			local char = Players[v].Character
			local pos = char and (getRoot(char) or char:FindFirstChildWhichIsA("BasePart"))
			pos = pos and pos.Position
			if not pos then
				return notify('Getposition Error','Missing character')
			end
			local roundedPos = math.round(pos.X) .. ", " .. math.round(pos.Y) .. ", " .. math.round(pos.Z)
			toClipboard(roundedPos)
		end
	end)

	addcmd('walktopos',{'walktoposition'},function(args, speaker)
		if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
			speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
			wait(.1)
		end
		speaker.Character:FindFirstChildOfClass('Humanoid').WalkToPoint = Vector3.new(args[1],args[2],args[3])
	end)

	addcmd('speed',{'ws','walkspeed'},function(args, speaker)
		if args[2] then
			local speed = args[2] or 16
			if isNumber(speed) then
				speaker.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = speed
			end
		else
			local speed = args[1] or 16
			if isNumber(speed) then
				speaker.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = speed
			end
		end
	end)

	addcmd('spoofspeed',{'spoofws','spoofwalkspeed'},function(args, speaker)
		if args[1] and isNumber(args[1]) then
			if hookmetamethod then
				local char = speaker.Character
				local setspeed;
				local index; index = hookmetamethod(game, "__index", function(self, key)
					local keyclean = key:gsub("\0", "")
					if (keyclean == "WalkSpeed" or keyclean == "walkSpeed") and self:IsA("Humanoid") and self:IsDescendantOf(char) and not checkcaller() then
						return setspeed or args[1]
					end
					return index(self, key)
				end)
				local newindex; newindex = hookmetamethod(game, "__newindex", function(self, key, value)
					local keyclean = string.gsub(key, "\0", "")
					if (keyclean == "WalkSpeed" or keyclean == "walkSpeed") and self:IsA("Humanoid") and self:IsDescendantOf(char) and not checkcaller() then
						setspeed = tonumber(value)
						return setspeed
					end
					return newindex(self, key, value)
				end)
			else
				notify('Incompatible Exploit','Your exploit does not support this command (missing hookmetamethod)')
			end
		end
	end)

	addcmd('loopspeed',{'loopws'},function(args, speaker)
		local speed = args[1] or 16
		if args[2] then
			speed = args[2] or 16
		end
		if isNumber(speed) then
			local Char = speaker.Character or workspace:FindFirstChild(speaker.Name)
			local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
			local function WalkSpeedChange()
				if Char and Human then
					Human.WalkSpeed = speed
				end
			end
			WalkSpeedChange()
			HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
			HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or speaker.CharacterAdded:Connect(function(nChar)
				Char, Human = nChar, nChar:WaitForChild("Humanoid")
				WalkSpeedChange()
				HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
			end)
		end
	end)

	addcmd('unloopspeed',{'unloopws'},function(args, speaker)
		HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or nil
		HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or nil
	end)

	addcmd('spoofjumppower',{'spoofjp'},function(args, speaker)
		if args[1] and isNumber(args[1]) then
			if hookmetamethod then
				local char = speaker.Character
				local setpower;
				local index; index = hookmetamethod(game, "__index", function(self, key)
					local keyclean = key:gsub("\0", "")
					if (keyclean == "JumpPower" or keyclean == "jumpPower") and self:IsA("Humanoid") and self:IsDescendantOf(char) and not checkcaller() then
						return setpower or args[1]
					end
					return index(self, key)
				end)
				local newindex; newindex = hookmetamethod(game, "__newindex", function(self, key, value)
					local keyclean = string.gsub(key, "\0", "")
					if (keyclean == "JumpPower" or keyclean == "jumpPower") and self:IsA("Humanoid") and self:IsDescendantOf(char) and not checkcaller() then
						setpower = tonumber(value)
						return setpower
					end
					return newindex(self, key, value)
				end)
			else
				notify('Incompatible Exploit','Your exploit does not support this command (missing hookmetamethod)')
			end
		end
	end)

	addcmd('loopjumppower',{'loopjp','loopjpower'},function(args, speaker)
		local jpower = args[1] or 50
		if isNumber(jpower) then
			local Char = speaker.Character or workspace:FindFirstChild(speaker.Name)
			local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
			local function JumpPowerChange()
				if Char and Human then
					if speaker.Character:FindFirstChildOfClass('Humanoid').UseJumpPower then
						speaker.Character:FindFirstChildOfClass('Humanoid').JumpPower = jpower
					else
						speaker.Character:FindFirstChildOfClass('Humanoid').JumpHeight  = jpower
					end
				end
			end
			JumpPowerChange()
			HumanModCons.jpLoop = (HumanModCons.jpLoop and HumanModCons.jpLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("JumpPower"):Connect(JumpPowerChange)
			HumanModCons.jpCA = (HumanModCons.jpCA and HumanModCons.jpCA:Disconnect() and false) or speaker.CharacterAdded:Connect(function(nChar)
				Char, Human = nChar, nChar:WaitForChild("Humanoid")
				JumpPowerChange()
				HumanModCons.jpLoop = (HumanModCons.jpLoop and HumanModCons.jpLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("JumpPower"):Connect(JumpPowerChange)
			end)
		end
	end)

	addcmd('unloopjumppower',{'unloopjp','unloopjpower'},function(args, speaker)
		local Char = speaker.Character or workspace:FindFirstChild(speaker.Name)
		local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
		HumanModCons.jpLoop = (HumanModCons.jpLoop and HumanModCons.jpLoop:Disconnect() and false) or nil
		HumanModCons.jpCA = (HumanModCons.jpCA and HumanModCons.jpCA:Disconnect() and false) or nil
		if Char and Human then
			if speaker.Character:FindFirstChildOfClass('Humanoid').UseJumpPower then
				speaker.Character:FindFirstChildOfClass('Humanoid').JumpPower = 50
			else
				speaker.Character:FindFirstChildOfClass('Humanoid').JumpHeight  = 50
			end
		end
	end)

	addcmd('tools',{'gears'},function(args, speaker)
		local function copy(instance)
			for i,c in pairs(instance:GetChildren())do
				if c:IsA('Tool') or c:IsA('HopperBin') then
					c:Clone().Parent = speaker:FindFirstChildOfClass("Backpack")
				end
				copy(c)
			end
		end
		copy(Lighting)
		local function copy(instance)
			for i,c in pairs(instance:GetChildren())do
				if c:IsA('Tool') or c:IsA('HopperBin') then
					c:Clone().Parent = speaker:FindFirstChildOfClass("Backpack")
				end
				copy(c)
			end
		end
		copy(ReplicatedStorage)
		notify('Tools','Copied tools from ReplicatedStorage and Lighting')
	end)

	addcmd('notools',{'rtools','clrtools','removetools','deletetools','dtools'},function(args, speaker)
		for i,v in pairs(speaker:FindFirstChildOfClass("Backpack"):GetDescendants()) do
			if v:IsA('Tool') or v:IsA('HopperBin') then
				v:Destroy()
			end
		end
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v:IsA('Tool') or v:IsA('HopperBin') then
				v:Destroy()
			end
		end
	end)

	addcmd('deleteselectedtool',{'dst'},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v:IsA('Tool') or v:IsA('HopperBin') then
				v:Destroy()
			end
		end
	end)

	addcmd('console',{},function(args, speaker)
		-- Thanks wally!!
		notify("Loading",'Hold on a sec')
		local _, str = pcall(function()
			return game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/console.lua", true)
		end)

		local s, e = loadstring(str)
		if typeof(s) ~= "function" then
			return
		end

		local success, message = pcall(s)
		if (not success) then
			if printconsole then
				printconsole(message)
			elseif printoutput then
				printoutput(message)
			end
		end
		wait(1)
		notify('Console','Press F9 to open the console')
	end)

	addcmd('explorer', {'dex'}, function(args, speaker)
		notify('Loading', 'Hold on a sec')
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
	end)

	addcmd('olddex', {'odex'}, function(args, speaker)
		notify('Loading old explorer', 'Hold on a sec')

		local getobjects = function(a)
			local Objects = {}
			if a then
				local b = InsertService:LoadLocalAsset(a)
				if b then 
					table.insert(Objects, b) 
				end
			end
			return Objects
		end

		local Dex = getobjects("rbxassetid://10055842438")[1]
		Dex.Parent = PARENT

		local function Load(Obj, Url)
			local function GiveOwnGlobals(Func, Script)
				-- Fix for this edit of dex being poorly made
				-- I (Alex) would like to commemorate whoever added this dex in somehow finding the worst dex to ever exist
				local Fenv, RealFenv, FenvMt = {}, {
					script = Script,
					getupvalue = function(a, b)
						return nil -- force it to use globals
					end,
					getreg = function() -- It loops registry for some idiotic reason so stop it from doing that and just use a global
						return {} -- force it to use globals
					end,
					getprops = getprops or function(inst)
						if getproperties then
							local props = getproperties(inst)
							if props[1] and gethiddenproperty then
								local results = {}
								for _,name in pairs(props) do
									local success, res = pcall(gethiddenproperty, inst, name)
									if success then
										results[name] = res
									end
								end

								return results
							end

							return props
						end

						return {}
					end
				}, {}
				-- FenvMt.__index = function(a,b)
				-- 	return RealFenv[b] == nil and getgenv()[b] or RealFenv[b]
				-- end
				-- FenvMt.__newindex = function(a, b, c)
				-- 	if RealFenv[b] == nil then 
				-- 		getgenv()[b] = c 
				-- 	else 
				-- 		RealFenv[b] = c 
				-- 	end
				-- end
				-- setmetatable(Fenv, FenvMt)
				-- pcall(setfenv, Func, Fenv)
				return Func
			end

			local function LoadScripts(_, Script)
				if Script:IsA("LocalScript") then
					task.spawn(function()
						GiveOwnGlobals(loadstring(Script.Source,"="..Script:GetFullName()), Script)()
					end)
				end
				table.foreach(Script:GetChildren(), LoadScripts)
			end

			LoadScripts(nil, Obj)
		end

		Load(Dex)
	end)

	addcmd('remotespy',{'rspy'},function(args, speaker)
		notify("Loading",'Hold on a sec')
		-- Full credit to exx, creator of SimpleSpy
		-- also thanks to NoobSploit for fixing
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
	end)

	addcmd('audiologger',{'alogger'},function(args, speaker)
		notify("Loading",'Hold on a sec')
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/infyiff/backup/main/audiologger.lua'),true))()
	end)

	local loopgoto = nil
	addcmd('loopgoto',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			loopgoto = nil
			if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
				speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
				wait(.1)
			end
			loopgoto = Players[v]
			local distance = 3
			if args[2] and isNumber(args[2]) then
				distance = args[2]
			end
			local lDelay = 0
			if args[3] and isNumber(args[3]) then
				lDelay = args[3]
			end
			repeat
				if Players:FindFirstChild(v) then
					if Players[v].Character ~= nil then
						getRoot(speaker.Character).CFrame = getRoot(Players[v].Character).CFrame + Vector3.new(distance,1,0)
					end
					wait(lDelay)
				else
					loopgoto = nil
				end
			until loopgoto ~= Players[v]
		end
	end)

	addcmd('unloopgoto',{'noloopgoto'},function(args, speaker)
		loopgoto = nil
	end)

	addcmd('headsit',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		if headSit then headSit:Disconnect() end
		for i,v in pairs(players)do
			speaker.Character:FindFirstChildOfClass('Humanoid').Sit = true
			headSit = RunService.Heartbeat:Connect(function()
				if Players:FindFirstChild(Players[v].Name) and Players[v].Character ~= nil and getRoot(Players[v].Character) and getRoot(speaker.Character) and speaker.Character:FindFirstChildOfClass('Humanoid').Sit == true then
					getRoot(speaker.Character).CFrame = getRoot(Players[v].Character).CFrame * CFrame.Angles(0,math.rad(0),0)* CFrame.new(0,1.6,0.4)
				else
					headSit:Disconnect()
				end
			end)
		end
	end)

	addcmd('chat',{'say'},function(args, speaker)
		local cString = getstring(1)
		chatMessage(cString)
	end)


	spamming = false
	spamspeed = 1
	addcmd('spam',{},function(args, speaker)
		spamming = true
		local spamstring = getstring(1)
		repeat wait(spamspeed)
			chatMessage(spamstring)
		until spamming == false
	end)

	addcmd('nospam',{'unspam'},function(args, speaker)
		spamming = false
	end)

	addcmd('whisper',{'pm'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			task.spawn(function()
				local plrName = Players[v].Name
				local pmstring = getstring(2)
				chatMessage("/w "..plrName.." "..pmstring)
			end)
		end
	end)

	pmspamming = {}
	addcmd('pmspam',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			task.spawn(function()
				local plrName = Players[v].Name
				if FindInTable(pmspamming, plrName) then return end
				table.insert(pmspamming, plrName)
				local pmspamstring = getstring(2)
				repeat
					if Players:FindFirstChild(v) then
						wait(spamspeed)
						chatMessage("/w "..plrName.." "..pmspamstring)
					else
						for a,b in pairs(pmspamming) do if b == plrName then table.remove(pmspamming, a) end end
					end
				until not FindInTable(pmspamming, plrName)
			end)
		end
	end)

	addcmd('nopmspam',{'unpmspam'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			task.spawn(function()
				for a,b in pairs(pmspamming) do
					if b == Players[v].Name then
						table.remove(pmspamming, a)
					end
				end
			end)
		end
	end)

	addcmd('spamspeed',{},function(args, speaker)
		local speed = args[1] or 1
		if isNumber(speed) then
			spamspeed = speed
		end
	end)

	addcmd('bubblechat',{},function(args, speaker)
		ChatService.BubbleChatEnabled = true
	end)

	addcmd('unbubblechat',{'nobubblechat'},function(args, speaker)
		ChatService.BubbleChatEnabled = false
	end)

	addcmd('safechat',{},function(args, speaker)
		speaker:SetSuperSafeChat(true)
	end)

	addcmd('nosafechat',{'disablesafechat','unsafechat'},function(args, speaker)
		speaker:SetSuperSafeChat(false)
	end)

	addcmd('blockhead',{},function(args, speaker)
		speaker.Character.Head:FindFirstChildOfClass("SpecialMesh"):Destroy()
	end)

	addcmd('blockhats',{},function(args, speaker)
		for _,v in pairs(speaker.Character:FindFirstChildOfClass('Humanoid'):GetAccessories()) do
			for i,c in pairs(v:GetDescendants()) do
				if c:IsA("SpecialMesh") then
					c:Destroy()
				end
			end
		end
	end)

	addcmd('blocktool',{},function(args, speaker)
		for _,v in pairs(speaker.Character:GetChildren()) do
			if v:IsA("Tool") or v:IsA("HopperBin") then
				for i,c in pairs(v:GetDescendants()) do
					if c:IsA("SpecialMesh") then
						c:Destroy()
					end
				end
			end
		end
	end)

	addcmd('creeper',{},function(args, speaker)
		if r15(speaker) then
			speaker.Character.Head:FindFirstChildOfClass("SpecialMesh"):Destroy()
			speaker.Character.LeftUpperArm:Destroy()
			speaker.Character.RightUpperArm:Destroy()
			speaker.Character:FindFirstChildOfClass("Humanoid"):RemoveAccessories()
		else
			speaker.Character.Head:FindFirstChildOfClass("SpecialMesh"):Destroy()
			speaker.Character["Left Arm"]:Destroy()
			speaker.Character["Right Arm"]:Destroy()
			speaker.Character:FindFirstChildOfClass("Humanoid"):RemoveAccessories()
		end
	end)

	function getTorso(x)
		x = x or Players.LocalPlayer.Character
		return x:FindFirstChild("Torso") or x:FindFirstChild("UpperTorso") or x:FindFirstChild("LowerTorso") or x:FindFirstChild("HumanoidRootPart")
	end

	addcmd("bang", {"rape"}, function(args, speaker)
		execCmd("unbang")
		wait()
		local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
		bangAnim = Instance.new("Animation")
		bangAnim.AnimationId = not r15(speaker) and "rbxassetid://148840371" or "rbxassetid://5918726674"
		bang = humanoid:LoadAnimation(bangAnim)
		bang:Play(0.1, 1, 1)
		bang:AdjustSpeed(args[2] or 3)
		bangDied = humanoid.Died:Connect(function()
			bang:Stop()
			bangAnim:Destroy()
			bangDied:Disconnect()
			bangLoop:Disconnect()
		end)
		if args[1] then
			local players = getPlayer(args[1], speaker)
			for _, v in pairs(players) do
				local bangplr = Players[v].Name
				local bangOffet = CFrame.new(0, 0, 1.1)
				bangLoop = RunService.Stepped:Connect(function()
					pcall(function()
						local otherRoot = getTorso(Players[bangplr].Character)
						getRoot(speaker.Character).CFrame = otherRoot.CFrame * bangOffet
					end)
				end)
			end
		end
	end)

	addcmd("unbang", {"unrape"}, function(args, speaker)
		if bangDied then
			bangDied:Disconnect()
			bang:Stop()
			bangAnim:Destroy()
			bangLoop:Disconnect()
		end
	end)

	addcmd('carpet',{},function(args, speaker)
		if not r15(speaker) then
			execCmd('uncarpet')
			wait()
			local players = getPlayer(args[1], speaker)
			for i,v in pairs(players)do
				carpetAnim = Instance.new("Animation")
				carpetAnim.AnimationId = "rbxassetid://282574440"
				carpet = speaker.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(carpetAnim)
				carpet:Play(.1, 1, 1)
				local carpetplr = Players[v].Name
				carpetDied = speaker.Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
					carpetLoop:Disconnect()
					carpet:Stop()
					carpetAnim:Destroy()
					carpetDied:Disconnect()
				end)
				carpetLoop = RunService.Heartbeat:Connect(function()
					pcall(function()
						getRoot(Players.LocalPlayer.Character).CFrame = getRoot(Players[carpetplr].Character).CFrame
					end)
				end)
			end
		else
			notify('R6 Required','This command requires the r6 rig type')
		end
	end)

	addcmd('uncarpet',{'nocarpet'},function(args, speaker)
		if carpetLoop then
			carpetLoop:Disconnect()
			carpetDied:Disconnect()
			carpet:Stop()
			carpetAnim:Destroy()
		end
	end)

	addcmd('friend',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			speaker:RequestFriendship(v)
		end
	end)

	addcmd('unfriend',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			speaker:RevokeFriendship(v)
		end
	end)

	addcmd('bringpart',{},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name:lower() == getstring(1):lower() and v:IsA("BasePart") then
				v.CFrame = getRoot(speaker.Character).CFrame
			end
		end
	end)

	addcmd('bringpartclass',{'bpc'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.ClassName:lower() == getstring(1):lower() and v:IsA("BasePart") then
				v.CFrame = getRoot(speaker.Character).CFrame
			end
		end
	end)

	gotopartDelay = 0.1
	addcmd('gotopart',{'topart'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name:lower() == getstring(1):lower() and v:IsA("BasePart") then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				wait(gotopartDelay)
				getRoot(speaker.Character).CFrame = v.CFrame
			end
		end
	end)

	addcmd('tweengotopart',{'tgotopart','ttopart'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name:lower() == getstring(1):lower() and v:IsA("BasePart") then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				wait(gotopartDelay)
				TweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = v.CFrame}):Play()
			end
		end
	end)

	addcmd('gotopartclass',{'gpc'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.ClassName:lower() == getstring(1):lower() and v:IsA("BasePart") then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				wait(gotopartDelay)
				getRoot(speaker.Character).CFrame = v.CFrame
			end
		end
	end)

	addcmd('tweengotopartclass',{'tgpc'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.ClassName:lower() == getstring(1):lower() and v:IsA("BasePart") then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				wait(gotopartDelay)
				TweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = v.CFrame}):Play()
			end
		end
	end)

	addcmd('gotomodel',{'tomodel'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name:lower() == getstring(1):lower() and v:IsA("Model") then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				wait(gotopartDelay)
				getRoot(speaker.Character).CFrame = v:GetModelCFrame()
			end
		end
	end)

	addcmd('tweengotomodel',{'tgotomodel','ttomodel'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name:lower() == getstring(1):lower() and v:IsA("Model") then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				wait(gotopartDelay)
				TweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = v:GetModelCFrame()}):Play()
			end
		end
	end)

	addcmd('gotopartdelay',{},function(args, speaker)
		local gtpDelay = args[1] or 0.1
		if isNumber(gtpDelay) then
			gotopartDelay = gtpDelay
		end
	end)

	addcmd('noclickdetectorlimits',{'nocdlimits','removecdlimits'},function(args, speaker)
		for i,v in ipairs(workspace:GetDescendants()) do
			if v:IsA("ClickDetector") then
				v.MaxActivationDistance = math.huge
			end
		end
	end)

	addcmd('fireclickdetectors',{'firecd','firecds'}, function(args, speaker)
		if fireclickdetector then
			if args[1] then
				local name = getstring(1)
				for _, descendant in ipairs(workspace:GetDescendants()) do
					if descendant:IsA("ClickDetector") and descendant.Name == name or descandant.Parent.Name == name then
						fireclickdetector(descendant)
					end
				end
			else
				for _, descendant in ipairs(workspace:GetDescendants()) do
					if descendant:IsA("ClickDetector") then
						fireclickdetector(descendant)
					end
				end
			end
		else
			notify("Incompatible Exploit", "Your exploit does not support this command (missing fireclickdetector)")
		end
	end)

	addcmd('noproximitypromptlimits',{'nopplimits','removepplimits'},function(args, speaker)
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("ProximityPrompt") then
				v.MaxActivationDistance = math.huge
			end
		end
	end)

	addcmd('fireproximityprompts',{'firepp'},function(args, speaker)
		if fireclickdetector then
			if args[1] then
				local name = getstring(1)
				for _, descendant in ipairs(workspace:GetDescendants()) do
					if descendant:IsA("ProximityPrompt") and descendant.Name == name or descandant.Parent.Name == name then
						fireproximityprompt(descendant)
					end
				end
			else
				for _, descendant in ipairs(workspace:GetDescendants()) do
					if descendant:IsA("ProximityPrompt") then
						fireproximityprompt(descendant)
					end
				end
			end
		else
			notify("Incompatible Exploit", "Your exploit does not support this command (missing fireproximityprompt)")
		end
	end)

	local PromptButtonHoldBegan = nil
	addcmd('instantproximityprompts',{'instantpp'},function(args, speaker)
		if fireproximityprompt then
			execCmd("uninstantproximityprompts")
			wait(0.1)
			PromptButtonHoldBegan = ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
				fireproximityprompt(prompt)
			end)
		else
			notify('Incompatible Exploit','Your exploit does not support this command (missing fireproximityprompt)')
		end
	end)

	addcmd('uninstantproximityprompts',{'uninstantpp'},function(args, speaker)
		if PromptButtonHoldBegan ~= nil then
			PromptButtonHoldBegan:Disconnect()
			PromptButtonHoldBegan = nil
		end
	end)

	addcmd('notifyping',{'ping'},function(args, speaker)
		notify("Ping", math.round(speaker:GetNetworkPing() * 1000) .. "ms")
	end)

	addcmd('grabtools', {}, function(args, speaker)
		local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
		for _, child in ipairs(workspace:GetChildren()) do
			if speaker.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
				humanoid:EquipTool(child)
			end
		end

		if grabtoolsFunc then 
			grabtoolsFunc:Disconnect() 
		end

		grabtoolsFunc = workspace.ChildAdded:Connect(function(child)
			if speaker.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
				humanoid:EquipTool(child)
			end
		end)

		notify("Grabtools", "Picking up any dropped tools")
	end)

	addcmd('nograbtools',{'ungrabtools'},function(args, speaker)
		if grabtoolsFunc then 
			grabtoolsFunc:Disconnect() 
		end

		notify("Grabtools", "Grabtools has been disabled")
	end)

	local specifictoolremoval = {}
	addcmd('removespecifictool',{},function(args, speaker)
		if args[1] and speaker:FindFirstChildOfClass("Backpack") then
			local tool = string.lower(getstring(1))
			local RST = RunService.RenderStepped:Connect(function()
				if speaker:FindFirstChildOfClass("Backpack") then
					for i,v in pairs(speaker:FindFirstChildOfClass("Backpack"):GetChildren()) do
						if v.Name:lower() == tool then
							v:Remove()
						end
					end
				end
			end)
			specifictoolremoval[tool] = RST
		end
	end)

	addcmd('unremovespecifictool',{},function(args, speaker)
		if args[1] then
			local tool = string.lower(getstring(1))
			if specifictoolremoval[tool] ~= nil then
				specifictoolremoval[tool]:Disconnect()
				specifictoolremoval[tool] = nil
			end
		end
	end)

	addcmd('clearremovespecifictool',{},function(args, speaker)
		for obj in pairs(specifictoolremoval) do
			specifictoolremoval[obj]:Disconnect()
			specifictoolremoval[obj] = nil
		end
	end)

	addcmd('light',{},function(args, speaker)
		local light = Instance.new("PointLight")
		light.Parent = getRoot(speaker.Character)
		light.Range = 30
		if args[1] then
			light.Brightness = args[2]
			light.Range = args[1]
		else
			light.Brightness = 5
		end
	end)

	addcmd('unlight',{'nolight'},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v.ClassName == "PointLight" then
				v:Destroy()
			end
		end
	end)

	addcmd('copytools',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			task.spawn(function()
				for i,v in pairs(Players[v]:FindFirstChildOfClass("Backpack"):GetChildren()) do
					if v:IsA('Tool') or v:IsA('HopperBin') then
						v:Clone().Parent = speaker:FindFirstChildOfClass("Backpack")
					end
				end
			end)
		end
	end)

	addcmd('naked',{},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v:IsA("Clothing") or v:IsA("ShirtGraphic") then
				v:Destroy()
			end
		end
	end)

	addcmd('noface',{'removeface'},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v:IsA("Decal") and v.Name == 'face' then
				v:Destroy()
			end
		end
	end)

	addcmd('spawnpoint',{'spawn'},function(args, speaker)
		spawnpos = getRoot(speaker.Character).CFrame
		spawnpoint = true
		spDelay = tonumber(args[1]) or 0.1
		notify('Spawn Point','Spawn point created at '..tostring(spawnpos))
	end)

	addcmd('nospawnpoint',{'nospawn','removespawnpoint'},function(args, speaker)
		spawnpoint = false
		notify('Spawn Point','Removed spawn point')
	end)

	addcmd('flashback',{'diedtp'},function(args, speaker)
		if lastDeath ~= nil then
			if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
				speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
				wait(.1)
			end
			getRoot(speaker.Character).CFrame = lastDeath
		end
	end)

	addcmd('hatspin',{'spinhats'},function(args, speaker)
		execCmd('unhatspin')
		wait(.5)
		for _,v in pairs(speaker.Character:FindFirstChildOfClass('Humanoid'):GetAccessories()) do
			local keep = Instance.new("BodyPosition") keep.Name = randomString() keep.Parent = v.Handle
			local spin = Instance.new("BodyAngularVelocity") spin.Name = randomString() spin.Parent = v.Handle
			v.Handle:FindFirstChildOfClass("Weld"):Destroy()
			if args[1] then
				spin.AngularVelocity = Vector3.new(0, args[1], 0)
				spin.MaxTorque = Vector3.new(0, args[1] * 2, 0)
			else
				spin.AngularVelocity = Vector3.new(0, 100, 0)
				spin.MaxTorque = Vector3.new(0, 200, 0)
			end
			keep.P = 30000
			keep.D = 50
			spinhats = RunService.Stepped:Connect(function()
				pcall(function()
					keep.Position = Players.LocalPlayer.Character.Head.Position
				end)
			end)
		end
	end)

	addcmd('unhatspin',{'unspinhats'},function(args, speaker)
		if spinhats then
			spinhats:Disconnect()
		end
		for _,v in pairs(speaker.Character:FindFirstChildOfClass('Humanoid'):GetAccessories()) do
			v.Parent = workspace
			for i,c in pairs(v.Handle) do
				if c:IsA("BodyPosition") or c:IsA("BodyAngularVelocity") then
					c:Destroy()
				end
			end
			wait()
			v.Parent = speaker.Character
		end
	end)

	addcmd('clearhats',{'cleanhats'},function(args, speaker)
		if firetouchinterest then
			local Player = Players.LocalPlayer
			local Character = Player.Character
			local Old = Character:FindFirstChild("HumanoidRootPart").CFrame
			local Hats = {}

			for _, child in ipairs(workspace:GetChildren()) do
				if child:IsA("Accessory") then
					table.insert(Hats, child)
				end
			end

			for _, accessory in ipairs(Character:FindFirstChildOfClass("Humanoid"):GetAccessories()) do
				accessory:Destroy()
			end

			for i = 1, #Hats do
				repeat RunService.Heartbeat:wait() until Hats[i]
				firetouchinterest(Hats[i].Handle,Character:FindFirstChild("HumanoidRootPart"),0)
				repeat RunService.Heartbeat:wait() until Character:FindFirstChildOfClass("Accessory")
				Character:FindFirstChildOfClass("Accessory"):Destroy()
				repeat RunService.Heartbeat:wait() until not Character:FindFirstChildOfClass("Accessory")
			end

			execCmd("reset")

			Player.CharacterAdded:Wait()

			for i = 1,20 do 
				RunService.Heartbeat:Wait()
				if Player.Character:FindFirstChild("HumanoidRootPart") then
					Player.Character:FindFirstChild("HumanoidRootPart").CFrame = Old
				end
			end
		else
			notify("Incompatible Exploit","Your exploit does not support this command (missing firetouchinterest)")
		end
	end)

	addcmd('split',{},function(args, speaker)
		if r15(speaker) then
			speaker.Character.UpperTorso.Waist:Destroy()
		else
			notify('R15 Required','This command requires the r15 rig type')
		end
	end)

	addcmd('nilchar',{},function(args, speaker)
		if speaker.Character ~= nil then
			speaker.Character.Parent = nil
		end
	end)

	addcmd('unnilchar',{'nonilchar'},function(args, speaker)
		if speaker.Character ~= nil then
			speaker.Character.Parent = workspace
		end
	end)

	addcmd('noroot',{'removeroot','rroot'},function(args, speaker)
		if speaker.Character ~= nil then
			local char = Players.LocalPlayer.Character
			char.Parent = nil
			char.HumanoidRootPart:Destroy()
			char.Parent = workspace
		end
	end)

	addcmd('replaceroot',{'replacerootpart'},function(args, speaker)
		if speaker.Character ~= nil and speaker.Character:FindFirstChild("HumanoidRootPart") then
			local Char = speaker.Character
			local OldParent = Char.Parent
			local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
			local OldPos = HRP.CFrame
			Char.Parent = game
			local HRP1 = HRP:Clone()
			HRP1.Parent = Char
			HRP = HRP:Destroy()
			HRP1.CFrame = OldPos
			Char.Parent = OldParent
		end
	end)

	addcmd('clearcharappearance',{'clearchar','clrchar'},function(args, speaker)
		speaker:ClearCharacterAppearance()
	end)

	addcmd('equiptools',{},function(args, speaker)
		for i,v in pairs(speaker:FindFirstChildOfClass("Backpack"):GetChildren()) do
			if v:IsA("Tool") or v:IsA("HopperBin") then
				v.Parent = speaker.Character
			end
		end
	end)

	addcmd('unequiptools',{},function(args, speaker)
		speaker.Character:FindFirstChildOfClass('Humanoid'):UnequipTools()
	end)

	local function GetHandleTools(p)
		p = p or Players.LocalPlayer
		local r = {}
		for _, v in ipairs(p.Character and p.Character:GetChildren() or {}) do
			if v.IsA(v, "BackpackItem") and v.FindFirstChild(v, "Handle") then
				r[#r + 1] = v
			end
		end
		for _, v in ipairs(p.Backpack:GetChildren()) do
			if v.IsA(v, "BackpackItem") and v.FindFirstChild(v, "Handle") then
				r[#r + 1] = v
			end
		end
		return r
	end
	addcmd('dupetools', {'clonetools'}, function(args, speaker)
		local LOOP_NUM = tonumber(args[1]) or 1
		local OrigPos = speaker.Character.HumanoidRootPart.Position
		local Tools, TempPos = {}, Vector3.new(math.random(-2e5, 2e5), 2e5, math.random(-2e5, 2e5))
		for i = 1, LOOP_NUM do
			local Human = speaker.Character:WaitForChild("Humanoid")
			wait(.1, Human.Parent:MoveTo(TempPos))
			Human.RootPart.Anchored = speaker:ClearCharacterAppearance(wait(.1)) or true
			local t = GetHandleTools(speaker)
			while #t > 0 do
				for _, v in ipairs(t) do
					task.spawn(function()
						for _ = 1, 25 do
							v.Parent = speaker.Character
							v.Handle.Anchored = true
						end
						for _ = 1, 5 do
							v.Parent = workspace
						end
						table.insert(Tools, v.Handle)
					end)
				end
				t = GetHandleTools(speaker)
			end
			wait(.1)
			speaker.Character = speaker.Character:Destroy()
			speaker.CharacterAdded:Wait():WaitForChild("Humanoid").Parent:MoveTo(LOOP_NUM == i and OrigPos or TempPos, wait(.1))
			if i == LOOP_NUM or i % 5 == 0 then
				local HRP = speaker.Character.HumanoidRootPart
				if type(firetouchinterest) == "function" then
					for _, v in ipairs(Tools) do
						v.Anchored = not firetouchinterest(v, HRP, 1, firetouchinterest(v, HRP, 0)) and false or false
					end
				else
					for _, v in ipairs(Tools) do
						task.spawn(function()
							local x = v.CanCollide
							v.CanCollide = false
							v.Anchored = false
							for _ = 1, 10 do
								v.CFrame = HRP.CFrame
								wait()
							end
							v.CanCollide = x
						end)
					end
				end
				wait(.1)
				Tools = {}
			end
			TempPos = TempPos + Vector3.new(10, math.random(-5, 5), 0)
		end
	end)

	local RS = RunService.RenderStepped
	addcmd('givetool', {'givetools'}, function(args, speaker)
		local v = Players[getPlayer(args[1], speaker)[1]].Character
		workspace.CurrentCamera.CameraSubject = v
		local Char = speaker.Character or workspace:FindFirstChild(speaker.Name)
		local hum = Char and Char:FindFirstChildWhichIsA('Humanoid')
		local hrp = hum and hum.RootPart
		local hrppos = hrp.CFrame
		hum = hum:Destroy() or hum:Clone()
		hum.Parent = Char
		hum:ClearAllChildren()
		speaker:ClearCharacterAppearance()
		task.spawn(function()
			speaker.CharacterAdded:Wait():WaitForChild('Humanoid').RootPart.CFrame = wait() and hrppos
		end)
		local vHRP = getRoot(v)
		while Char and Char.Parent and vHRP and vHRP.Parent do
			local Tools = false
			for _, v in ipairs(Char:GetChildren()) do
				if v:IsA('BackpackItem') and v:FindFirstChild('Handle') then
					Tools = true
					firetouchinterest(v.Handle, vHRP, 0)
					firetouchinterest(v.Handle, vHRP, 1)
				end
			end
			if not Tools then
				break
			end
			hrp.CFrame = vHRP.CFrame
			RS:Wait()
		end
		execCmd('re')
	end)

	addcmd('touchinterests', {'touchinterest', 'firetouchinterests', 'firetouchinterest'}, function(args, speaker)
		if not firetouchinterest then
			notify("Incompatible Exploit", "Your exploit does not support this command (missing firetouchinterest)")
			return
		end

		local root = getRoot(speaker.Character) or speaker.Character:FindFirstChildWhichIsA("BasePart")

		local function touch(x)
			x = x:FindFirstAncestorWhichIsA("Part")
			if x then
				if firetouchinterest then
					task.spawn(function()
						firetouchinterest(x, root, 1)
						wait()
						firetouchinterest(x, root, 0)
					end)
				end
				x.CFrame = root.CFrame
			end
		end

		if args[1] then
			local name = getstring(1)
			for _, descendant in ipairs(workspace:GetDescendants()) do
				if descendant:IsA("TouchTransmitter") and descendant.Name == name or descandant.Parent.Name == name then
					touch(descendant)
				end
			end
		else
			for _, descendant in ipairs(workspace:GetDescendants()) do
				if descendant:IsA("TouchTransmitter") then
					touch(descendant)
				end
			end
		end
	end)

	addcmd('fullbright',{'fb','fullbrightness'},function(args, speaker)
		Lighting.Brightness = 2
		Lighting.ClockTime = 14
		Lighting.FogEnd = 100000
		Lighting.GlobalShadows = false
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end)

	addcmd('loopfullbright',{'loopfb'},function(args, speaker)
		if brightLoop then
			brightLoop:Disconnect()
		end
		local function brightFunc()
			Lighting.Brightness = 2
			Lighting.ClockTime = 14
			Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false
			Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end

		brightLoop = RunService.RenderStepped:Connect(brightFunc)
	end)

	addcmd('unloopfullbright',{'unloopfb'},function(args, speaker)
		if brightLoop then
			brightLoop:Disconnect()
		end
	end)

	addcmd('ambient',{},function(args, speaker)
		Lighting.Ambient = Color3.new(args[1],args[2],args[3])
		Lighting.OutdoorAmbient = Color3.new(args[1],args[2],args[3])
	end)

	addcmd('day',{},function(args, speaker)
		Lighting.ClockTime = 14
	end)

	addcmd('night',{},function(args, speaker)
		Lighting.ClockTime = 0
	end)

	addcmd('nofog',{},function(args, speaker)
		Lighting.FogEnd = 100000
		for i,v in pairs(Lighting:GetDescendants()) do
			if v:IsA("Atmosphere") then
				v:Destroy()
			end
		end
	end)

	addcmd('brightness',{},function(args, speaker)
		Lighting.Brightness = args[1]
	end)

	addcmd('globalshadows',{'gshadows'},function(args, speaker)
		Lighting.GlobalShadows = true
	end)

	addcmd('unglobalshadows',{'nogshadows','ungshadows','noglobalshadows'},function(args, speaker)
		Lighting.GlobalShadows = false
	end)

	origsettings = {abt = Lighting.Ambient, oabt = Lighting.OutdoorAmbient, brt = Lighting.Brightness, time = Lighting.ClockTime, fe = Lighting.FogEnd, fs = Lighting.FogStart, gs = Lighting.GlobalShadows}

	addcmd('restorelighting',{'rlighting'},function(args, speaker)
		Lighting.Ambient = origsettings.abt
		Lighting.OutdoorAmbient = origsettings.oabt
		Lighting.Brightness = origsettings.brt
		Lighting.ClockTime = origsettings.time
		Lighting.FogEnd = origsettings.fe
		Lighting.FogStart = origsettings.fs
		Lighting.GlobalShadows = origsettings.gs
	end)

	addcmd('stun',{'platformstand'},function(args, speaker)
		speaker.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
	end)

	addcmd('unstun',{'nostun','unplatformstand','noplatformstand'},function(args, speaker)
		speaker.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end)

	addcmd('norotate',{'noautorotate'},function(args, speaker)
		speaker.Character:FindFirstChildOfClass('Humanoid').AutoRotate  = false
	end)

	addcmd('unnorotate',{'autorotate'},function(args, speaker)
		speaker.Character:FindFirstChildOfClass('Humanoid').AutoRotate  = true
	end)

	addcmd('enablestate',{},function(args, speaker)
		local x = args[1]
		if not tonumber(x) then
			local x = Enum.HumanoidStateType[args[1]]
		end
		speaker.Character:FindFirstChildOfClass("Humanoid"):SetStateEnabled(x, true)
	end)

	addcmd('disablestate',{},function(args, speaker)
		local x = args[1]
		if not tonumber(x) then
			local x = Enum.HumanoidStateType[args[1]]
		end
		speaker.Character:FindFirstChildOfClass("Humanoid"):SetStateEnabled(x, false)
	end)

	addcmd('drophats',{'drophat'},function(args, speaker)
		if speaker.Character then
			for _,v in pairs(speaker.Character:FindFirstChildOfClass('Humanoid'):GetAccessories()) do
				v.Parent = workspace
			end
		end
	end)

	addcmd('deletehats',{'nohats','rhats'},function(args, speaker)
		for i,v in next, speaker.Character:GetDescendants() do
			if v:IsA("Accessory") then
				for i,p in next, v:GetDescendants() do
					if p:IsA("Weld") then
						p:Destroy()
					end
				end
			end
		end
	end)

	addcmd('droptools',{'droptool'},function(args, speaker)
		for i,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = Players.LocalPlayer.Character
			end
		end
		wait()
		for i,v in pairs(Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = workspace
			end
		end
	end)

	addcmd('droppabletools',{},function(args, speaker)
		if speaker.Character then
			for _,obj in pairs(speaker.Character:GetChildren()) do
				if obj:IsA("Tool") then
					obj.CanBeDropped = true
				end
			end
		end
		if speaker:FindFirstChildOfClass("Backpack") then
			for _,obj in pairs(speaker:FindFirstChildOfClass("Backpack"):GetChildren()) do
				if obj:IsA("Tool") then
					obj.CanBeDropped = true
				end
			end
		end
	end)

	local currentToolSize = ""
	local currentGripPos = ""
	addcmd('reach',{},function(args, speaker)
		execCmd('unreach')
		wait()
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v:IsA("Tool") then
				if args[1] then
					currentToolSize = v.Handle.Size
					currentGripPos = v.GripPos
					local a = Instance.new("SelectionBox")
					a.Name = "SelectionBoxCreated"
					a.Parent = v.Handle
					a.Adornee = v.Handle
					v.Handle.Massless = true
					v.Handle.Size = Vector3.new(0.5,0.5,args[1])
					v.GripPos = Vector3.new(0,0,0)
					speaker.Character:FindFirstChildOfClass('Humanoid'):UnequipTools()
				else
					currentToolSize = v.Handle.Size
					currentGripPos = v.GripPos
					local a = Instance.new("SelectionBox")
					a.Name = "SelectionBoxCreated"
					a.Parent = v.Handle
					a.Adornee = v.Handle
					v.Handle.Massless = true
					v.Handle.Size = Vector3.new(0.5,0.5,60)
					v.GripPos = Vector3.new(0,0,0)
					speaker.Character:FindFirstChildOfClass('Humanoid'):UnequipTools()
				end
			end
		end
	end)

	addcmd('unreach',{'noreach'},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v:IsA("Tool") then
				v.Handle.Size = currentToolSize
				v.GripPos = currentGripPos
				v.Handle.SelectionBoxCreated:Destroy()
			end
		end
	end)

	addcmd('grippos',{},function(args, speaker)
		for i,v in pairs(speaker.Character:GetDescendants()) do
			if v:IsA("Tool") then
				v.Parent = speaker:FindFirstChildOfClass("Backpack")
				v.GripPos = Vector3.new(args[1],args[2],args[3])
				v.Parent = speaker.Character
			end
		end
	end)

	addcmd('usetools', {}, function(args, speaker)
		local Backpack = speaker:FindFirstChildOfClass("Backpack")
		local ammount = tonumber(args[1]) or 1
		local delay_ = tonumber(args[2]) or false
		for _, v in ipairs(Backpack:GetChildren()) do
			v.Parent = speaker.Character
			task.spawn(function()
				for _ = 1, ammount do
					v:Activate()
					if delay_ then
						wait(delay_)
					end
				end
				v.Parent = Backpack
			end)
		end
	end)

	addcmd('logs',{},function(args, speaker)
		logs:TweenPosition(UDim2.new(0, 0, 1, -265), "InOut", "Quart", 0.3, true, nil)
	end)

	addcmd('chatlogs',{'clogs'},function(args, speaker)
		join.Visible = false
		chat.Visible = true
		table.remove(shade3,table.find(shade3,selectChat))
		table.remove(shade2,table.find(shade2,selectJoin))
		table.insert(shade2,selectChat)
		table.insert(shade3,selectJoin)
		selectJoin.BackgroundColor3 = currentShade3
		selectChat.BackgroundColor3 = currentShade2
		logs:TweenPosition(UDim2.new(0, 0, 1, -265), "InOut", "Quart", 0.3, true, nil)
	end)

	addcmd('joinlogs',{'jlogs'},function(args, speaker)
		chat.Visible = false
		join.Visible = true	
		table.remove(shade3,table.find(shade3,selectJoin))
		table.remove(shade2,table.find(shade2,selectChat))
		table.insert(shade2,selectJoin)
		table.insert(shade3,selectChat)
		selectChat.BackgroundColor3 = currentShade3
		selectJoin.BackgroundColor3 = currentShade2
		logs:TweenPosition(UDim2.new(0, 0, 1, -265), "InOut", "Quart", 0.3, true, nil)
	end)

	flinging = false
	addcmd('fling',{},function(args, speaker)
		flinging = false
		for _, child in pairs(speaker.Character:GetDescendants()) do
			if child:IsA("BasePart") then
				child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
			end
		end
		execCmd('noclip')
		wait(.1)
		local bambam = Instance.new("BodyAngularVelocity")
		bambam.Name = randomString()
		bambam.Parent = getRoot(speaker.Character)
		bambam.AngularVelocity = Vector3.new(0,99999,0)
		bambam.MaxTorque = Vector3.new(0,math.huge,0)
		bambam.P = math.huge
		local Char = speaker.Character:GetChildren()
		for i, v in next, Char do
			if v:IsA("BasePart") then
				v.CanCollide = false
				v.Massless = true
				v.Velocity = Vector3.new(0, 0, 0)
			end
		end
		flinging = true
		local function flingDiedF()
			execCmd('unfling')
		end
		flingDied = speaker.Character:FindFirstChildOfClass('Humanoid').Died:Connect(flingDiedF)
		repeat
			bambam.AngularVelocity = Vector3.new(0,99999,0)
			wait(.2)
			bambam.AngularVelocity = Vector3.new(0,0,0)
			wait(.1)
		until flinging == false
	end)

	addcmd('unfling',{'nofling'},function(args, speaker)
		execCmd('clip')
		if flingDied then
			flingDied:Disconnect()
		end
		flinging = false
		wait(.1)
		local speakerChar = speaker.Character
		if not speakerChar or not getRoot(speakerChar) then return end
		for i,v in pairs(getRoot(speakerChar):GetChildren()) do
			if v.ClassName == 'BodyAngularVelocity' then
				v:Destroy()
			end
		end
		for _, child in pairs(speakerChar:GetDescendants()) do
			if child.ClassName == "Part" or child.ClassName == "MeshPart" then
				child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
			end
		end
	end)

	addcmd('togglefling',{},function(args, speaker)
		if flinging then
			execCmd('unfling')
		else
			execCmd('fling')
		end
	end)

	addcmd("flyfling", {}, function(args, speaker)
		execCmd("unvehiclefly\\unfling\\unnoclip")
		wait()
		execCmd("vehiclefly\\fling\\noclip")
	end)

	addcmd("unflyfling", {}, function(args, speaker)
		execCmd("unvehiclefly\\unfling\\unnoclip\\breakvelocity")
	end)

	addcmd("toggleflyfling", {}, function(args, speaker)
		execCmd(flinging and "unflyfling" or "flyfling")
	end)

	walkflinging = false
	addcmd("walkfling", {}, function(args, speaker)
		execCmd("unwalkfling")
		local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			humanoid.Died:Connect(function()
				execCmd("unwalkfling")
			end)
		end

		execCmd("noclip")
		walkflinging = true
		repeat RunService.Heartbeat:Wait()
			local character = speaker.Character
			local root = getRoot(character)
			local vel, movel = nil, 0.1

			while not (character and character.Parent and root and root.Parent) do
				RunService.Heartbeat:Wait()
				character = speaker.Character
				root = getRoot(character)
			end

			vel = root.Velocity
			root.Velocity = vel * 1000000 + Vector3.new(0, 1000000, 0)

			RunService.RenderStepped:Wait()
			if character and character.Parent and root and root.Parent then
				root.Velocity = vel
			end

			RunService.Stepped:Wait()
			if character and character.Parent and root and root.Parent then
				root.Velocity = vel + Vector3.new(0, movel, 0)
				movel = movel * -1
			end
		until walkflinging == false
	end)

	addcmd("unwalkfling", {"nowalkfling"}, function(args, speaker)
		walkflinging = false
		execCmd("unnoclip")
	end)

	addcmd("togglewalkfling", {}, function(args, speaker)
		execCmd(walkflinging and "unwalkfling" or "walkfling")
	end)

	addcmd('invisfling',{},function(args, speaker)
		local ch = speaker.Character
		local prt=Instance.new("Model")
		prt.Parent = speaker.Character
		local z1 = Instance.new("Part")
		z1.Name="Torso"
		z1.CanCollide = false
		z1.Anchored = true
		local z2 = Instance.new("Part")
		z2.Name="Head"
		z2.Parent = prt
		z2.Anchored = true
		z2.CanCollide = false
		local z3 =Instance.new("Humanoid")
		z3.Name="Humanoid"
		z3.Parent = prt
		z1.Position = Vector3.new(0,9999,0)
		speaker.Character=prt
		wait(3)
		speaker.Character=ch
		wait(3)
		local Hum = Instance.new("Humanoid")
		z2:Clone()
		Hum.Parent = speaker.Character
		local root =  getRoot(speaker.Character)
		for i,v in pairs(speaker.Character:GetChildren()) do
			if v ~= root and  v.Name ~= "Humanoid" then
				v:Destroy()
			end
		end
		root.Transparency = 0
		root.Color = Color3.new(1, 1, 1)
		local invisflingStepped
		invisflingStepped = RunService.Stepped:Connect(function()
			if speaker.Character and getRoot(speaker.Character) then
				getRoot(speaker.Character).CanCollide = false
			else
				invisflingStepped:Disconnect()
			end
		end)
		sFLY()
		workspace.CurrentCamera.CameraSubject = root
		local bambam = Instance.new("BodyThrust")
		bambam.Parent = getRoot(speaker.Character)
		bambam.Force = Vector3.new(99999,99999*10,99999)
		bambam.Location = getRoot(speaker.Character).Position
	end)

	addcmd("antifling", {}, function(args, speaker)
		if antifling then
			antifling:Disconnect()
			antifling = nil
		end
		antifling = RunService.Stepped:Connect(function()
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= speaker and player.Character then
					for _, v in pairs(player.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end
				end
			end
		end)
	end)

	addcmd("unantifling", {}, function(args, speaker)
		if antifling then
			antifling:Disconnect()
			antifling = nil
		end
	end)

	addcmd("toggleantifling", {}, function(args, speaker)
		execCmd(antifling and "unantifling" or "antifling")
	end)

	function attach(speaker,target)
		if tools(speaker) then
			local char = speaker.Character
			local tchar = target.Character
			local hum = speaker.Character:FindFirstChildOfClass("Humanoid")
			local hrp = getRoot(speaker.Character)
			local hrp2 = getRoot(target.Character)
			hum.Name = "1"
			local newHum = hum:Clone()
			newHum.Parent = char
			newHum.Name = "Humanoid"
			wait()
			hum:Destroy()
			workspace.CurrentCamera.CameraSubject = char
			newHum.DisplayDistanceType = "None"
			local tool = speaker:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass("Tool") or speaker.Character:FindFirstChildOfClass("Tool")
			tool.Parent = char
			hrp.CFrame = hrp2.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-100, 100)/200,math.random(-100, 100)/200,math.random(-100, 100)/200)
			local n = 0
			repeat
				wait(.1)
				n = n + 1
				hrp.CFrame = hrp2.CFrame
			until (tool.Parent ~= char or not hrp or not hrp2 or not hrp.Parent or not hrp2.Parent or n > 250) and n > 2
		else
			notify('Tool Required','You need to have an item in your inventory to use this command')
		end
	end

	addcmd('attach',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			attach(speaker,Players[v])
		end
	end)

	function kill(speaker,target,fast)
		if tools(speaker) then
			if target ~= nil then
				local NormPos = getRoot(speaker.Character).CFrame
				if not fast then
					refresh(speaker)
					wait()
					repeat wait() until speaker.Character ~= nil and getRoot(speaker.Character)
					wait(0.3)
				end
				local hrp = getRoot(speaker.Character)
				attach(speaker,target)
				repeat
					wait()
					hrp.CFrame = CFrame.new(999999, workspace.FallenPartsDestroyHeight + 5,999999)
				until not getRoot(target.Character) or not getRoot(speaker.Character)
				speaker.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = NormPos
			end
		else
			notify('Tool Required','You need to have an item in your inventory to use this command')
		end
	end

	addcmd('kill',{'fekill'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			kill(speaker,Players[v])
		end
	end)

	addcmd('handlekill', {'hkill'}, function(args, speaker)
		if not firetouchinterest then
			return notify('Incompatible Exploit', 'Your exploit does not support this command (missing firetouchinterest)')
		end
		local RS = RunService.RenderStepped
		local Tool = speaker.Character.FindFirstChildWhichIsA(speaker.Character, "Tool")
		local Handle = Tool and Tool.FindFirstChild(Tool, "Handle")
		if not Tool or not Handle then
			return notify("Handle Kill", "You need to hold a \"Tool\" that does damage on touch. For example the default \"Sword\" tool.")
		end
		for _, v in ipairs(getPlayer(args[1], speaker)) do
			v = Players[v]
			task.spawn(function()
				while Tool and speaker.Character and v.Character and Tool.Parent == speaker.Character do
					local Human = v.Character.FindFirstChildWhichIsA(v.Character, "Humanoid")
					if not Human or Human.Health <= 0 then
						break
					end
					for _, v1 in ipairs(v.Character.GetChildren(v.Character)) do
						v1 = ((v1.IsA(v1, "BasePart") and firetouchinterest(Handle, v1, 1, (RS.Wait(RS) and nil) or firetouchinterest(Handle, v1, 0)) and nil) or v1) or v1
					end
				end
				notify("Handle Kill Stopped!", v.Name .. " died/left or you unequipped the tool!")
			end)
		end
	end)

	local hb = RunService.Heartbeat
	addcmd('tpwalk', {'teleportwalk'}, function(args, speaker)
		tpwalking = true
		local chr = speaker.Character
		local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
		while tpwalking and chr and hum and hum.Parent do
			local delta = hb:Wait()
			if hum.MoveDirection.Magnitude > 0 then
				if args[1] and isNumber(args[1]) then
					chr:TranslateBy(hum.MoveDirection * tonumber(args[1]) * delta * 10)
				else
					chr:TranslateBy(hum.MoveDirection * delta * 10)
				end
			end
		end
	end)
	addcmd('untpwalk', {'unteleportwalk'}, function(args, speaker)
		tpwalking = false
	end)

	addcmd('fastkill',{'fastfekill'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			kill(speaker,Players[v],true)
		end
	end)

	function bring(speaker,target,fast)
		if tools(speaker) then
			if target ~= nil then
				local NormPos = getRoot(speaker.Character).CFrame
				if not fast then
					refresh(speaker)
					wait()
					repeat wait() until speaker.Character ~= nil and getRoot(speaker.Character)
					wait(0.3)
				end
				local hrp = getRoot(speaker.Character)
				attach(speaker,target)
				repeat
					wait()
					hrp.CFrame = NormPos
				until not getRoot(target.Character) or not getRoot(speaker.Character)
				speaker.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = NormPos
			end
		else
			notify('Tool Required','You need to have an item in your inventory to use this command')
		end
	end

	addcmd('bring',{'febring'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			bring(speaker,Players[v])
		end
	end)

	addcmd('fastbring',{'fastfebring'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			bring(speaker,Players[v],true)
		end
	end)

	function teleport(speaker,target,target2,fast)
		if tools(speaker) then
			if target ~= nil then
				local NormPos = getRoot(speaker.Character).CFrame
				if not fast then
					refresh(speaker)
					wait()
					repeat wait() until speaker.Character ~= nil and getRoot(speaker.Character)
					wait(0.3)
				end
				local hrp = getRoot(speaker.Character)
				local hrp2 = getRoot(target2.Character)
				attach(speaker,target)
				repeat
					wait()
					hrp.CFrame = hrp2.CFrame
				until not getRoot(target.Character) or not getRoot(speaker.Character)
				wait(1)
				speaker.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = NormPos
			end
		else
			notify('Tool Required','You need to have an item in your inventory to use this command')
		end
	end

	addcmd('tp',{'teleport'},function(args, speaker)
		local players1=getPlayer(args[1], speaker)
		local players2=getPlayer(args[2], speaker)
		for i,v in pairs(players1)do
			if getRoot(Players[v].Character) and getRoot(Players[players2[1]].Character) then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				teleport(speaker,Players[v],Players[players2[1]])
			end
		end
	end)

	addcmd('fasttp',{'fastteleport'},function(args, speaker)
		local players1=getPlayer(args[1], speaker)
		local players2=getPlayer(args[2], speaker)
		for i,v in pairs(players1)do
			if getRoot(Players[v].Character) and getRoot(Players[players2[1]].Character) then
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
					wait(.1)
				end
				teleport(speaker,Players[v],Players[players2[1]],true)
			end
		end
	end)

	addcmd('spin',{},function(args, speaker)
		local spinSpeed = 20
		if args[1] and isNumber(args[1]) then
			spinSpeed = args[1]
		end
		for i,v in pairs(getRoot(speaker.Character):GetChildren()) do
			if v.Name == "Spinning" then
				v:Destroy()
			end
		end
		local Spin = Instance.new("BodyAngularVelocity")
		Spin.Name = "Spinning"
		Spin.Parent = getRoot(speaker.Character)
		Spin.MaxTorque = Vector3.new(0, math.huge, 0)
		Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
	end)

	addcmd('unspin',{},function(args, speaker)
		for i,v in pairs(getRoot(speaker.Character):GetChildren()) do
			if v.Name == "Spinning" then
				v:Destroy()
			end
		end
	end)

	xrayEnabled = false
	xray = function()
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent:FindFirstChildWhichIsA("Humanoid") and not v.Parent.Parent:FindFirstChildWhichIsA("Humanoid") then
				v.LocalTransparencyModifier = xrayEnabled and 0.5 or 0
			end
		end
	end

	addcmd("xray", {}, function(args, speaker)
		xrayEnabled = true
		xray()
	end)

	addcmd("unxray", {"noxray"}, function(args, speaker)
		xrayEnabled = false
		xray()
	end)

	addcmd("togglexray", {}, function(args, speaker)
		xrayEnabled = not xrayEnabled
		xray()
	end)

	addcmd("loopxray", {}, function(args, speaker)
		if xrayLoop then
			xrayLoop:Disconnect()
		end
		xrayLoop = RunService.RenderStepped:Connect(function()
			xrayEnabled = true
			xray()
		end)
	end)

	addcmd("unloopxray", {}, function(args, speaker)
		if xrayLoop then
			xrayLoop:Disconnect()
		end
	end)

	local walltpTouch = nil
	addcmd('walltp',{},function(args, speaker)
		local torso
		if r15(speaker) then
			torso = speaker.Character.UpperTorso
		else
			torso = speaker.Character.Torso
		end
		local function touchedFunc(hit)
			local Root = getRoot(speaker.Character)
			if hit:IsA("BasePart") and hit.Position.Y > Root.Position.Y - speaker.Character:FindFirstChildOfClass('Humanoid').HipHeight then
				local hitP = getRoot(hit.Parent)
				if hitP ~= nil then
					Root.CFrame = hit.CFrame * CFrame.new(Root.CFrame.lookVector.X,hitP.Size.Z/2 + speaker.Character:FindFirstChildOfClass('Humanoid').HipHeight,Root.CFrame.lookVector.Z)
				elseif hitP == nil then
					Root.CFrame = hit.CFrame * CFrame.new(Root.CFrame.lookVector.X,hit.Size.Y/2 + speaker.Character:FindFirstChildOfClass('Humanoid').HipHeight,Root.CFrame.lookVector.Z)
				end
			end
		end
		walltpTouch = torso.Touched:Connect(touchedFunc)
	end)

	addcmd('unwalltp',{'nowalltp'},function(args, speaker)
		if walltpTouch then
			walltpTouch:Disconnect()
		end
	end)

	autoclicking = false
	addcmd('autoclick',{},function(args, speaker)
		if mouse1press and mouse1release then
			execCmd('unautoclick')
			wait()
			local clickDelay = 0.1
			local releaseDelay = 0.1
			if args[1] and isNumber(args[1]) then clickDelay = args[1] end
			if args[2] and isNumber(args[2]) then releaseDelay = args[2] end
			autoclicking = true
			cancelAutoClick = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
				if not gameProcessedEvent then
					if (input.KeyCode == Enum.KeyCode.Backspace and UserInputService:IsKeyDown(Enum.KeyCode.Equals)) or (input.KeyCode == Enum.KeyCode.Equals and UserInputService:IsKeyDown(Enum.KeyCode.Backspace)) then
						autoclicking = false
						cancelAutoClick:Disconnect()
					end
				end
			end)
			notify('Auto Clicker',"Press [backspace] and [=] at the same time to stop")
			repeat wait(clickDelay)
				mouse1press()
				wait(releaseDelay)
				mouse1release()
			until autoclicking == false
		else
			notify('Auto Clicker',"Your exploit doesn't have the ability to use the autoclick")
		end
	end)

	addcmd('unautoclick',{'noautoclick'},function(args, speaker)
		autoclicking = false
		if cancelAutoClick then cancelAutoClick:Disconnect() end
	end)

	addcmd('mousesensitivity',{'ms'},function(args, speaker)
		UserInputService.MouseDeltaSensitivity = args[1]
	end)

	local nameBox = nil
	local nbSelection = nil
	addcmd('hovername',{},function(args, speaker)
		execCmd('unhovername')
		wait()
		nameBox = Instance.new("TextLabel")
		nameBox.Name = randomString()
		nameBox.Parent = PARENT
		nameBox.BackgroundTransparency = 1
		nameBox.Size = UDim2.new(0,200,0,30)
		nameBox.Font = Enum.Font.Code
		nameBox.TextSize = 16
		nameBox.Text = ""
		nameBox.TextColor3 = Color3.new(1, 1, 1)
		nameBox.TextStrokeTransparency = 0
		nameBox.TextXAlignment = Enum.TextXAlignment.Left
		nameBox.ZIndex = 10
		nbSelection = Instance.new('SelectionBox')
		nbSelection.Name = randomString()
		nbSelection.LineThickness = 0.03
		nbSelection.Color3 = Color3.new(1, 1, 1)
		local function updateNameBox()
			local t
			local target = IYMouse.Target

			if target then
				local humanoid = target.Parent:FindFirstChildOfClass("Humanoid") or target.Parent.Parent:FindFirstChildOfClass("Humanoid")
				if humanoid then
					t = humanoid.Parent
				end
			end

			if t ~= nil then
				local x = IYMouse.X
				local y = IYMouse.Y
				local xP
				local yP
				if IYMouse.X > 200 then
					xP = x - 205
					nameBox.TextXAlignment = Enum.TextXAlignment.Right
				else
					xP = x + 25
					nameBox.TextXAlignment = Enum.TextXAlignment.Left
				end
				nameBox.Position = UDim2.new(0, xP, 0, y)
				nameBox.Text = t.Name
				nameBox.Visible = true
				nbSelection.Parent = t
				nbSelection.Adornee = t
			else
				nameBox.Visible = false
				nbSelection.Parent = nil
				nbSelection.Adornee = nil
			end
		end
		nbUpdateFunc = IYMouse.Move:Connect(updateNameBox)
	end)

	addcmd('unhovername',{'nohovername'},function(args, speaker)
		if nbUpdateFunc then
			nbUpdateFunc:Disconnect()
			nameBox:Destroy()
			nbSelection:Destroy()
		end
	end)

	addcmd('headsize',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			if Players[v] ~= speaker and Players[v].Character:FindFirstChild('Head') then
				local sizeArg = tonumber(args[2])
				local Size = Vector3.new(sizeArg,sizeArg,sizeArg)
				local Head = Players[v].Character:FindFirstChild('Head')
				if Head:IsA("BasePart") then
					if not args[2] or sizeArg == 1 then
						Head.Size = Vector3.new(2,1,1)
					else
						Head.Size = Size
					end
				end
			end
		end
	end)
	addcmd('hitbox',{},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			if Players[v] ~= speaker and Players[v].Character:FindFirstChild('HumanoidRootPart') then
				local sizeArg = tonumber(args[2])
				local Size = Vector3.new(sizeArg,sizeArg,sizeArg)
				local Root = Players[v].Character:FindFirstChild('HumanoidRootPart')
				if Root:IsA("BasePart") then
					if not args[2] or sizeArg == 1 then
						Root.Size = Vector3.new(2,1,1)
						Root.Transparency = 0.4
					else
						Root.Size = Size
						Root.Transparency = 0.4
					end
				end
			end
		end
	end)

	addcmd('stareat',{'stare'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			if stareLoop then
				stareLoop:Disconnect()
			end
			if not Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Players[v].Character:FindFirstChild("HumanoidRootPart") then return end
			local function stareFunc()
				if Players.LocalPlayer.Character.PrimaryPart and Players:FindFirstChild(v) and Players[v].Character ~= nil and Players[v].Character:FindFirstChild("HumanoidRootPart") then
					local chrPos=Players.LocalPlayer.Character.PrimaryPart.Position
					local tPos=Players[v].Character:FindFirstChild("HumanoidRootPart").Position
					local modTPos=Vector3.new(tPos.X,chrPos.Y,tPos.Z)
					local newCF=CFrame.new(chrPos,modTPos)
					Players.LocalPlayer.Character:SetPrimaryPartCFrame(newCF)
				elseif not Players:FindFirstChild(v) then
					stareLoop:Disconnect()
				end
			end

			stareLoop = RunService.RenderStepped:Connect(stareFunc)
		end
	end)

	addcmd('unstareat',{'unstare','nostare','nostareat'},function(args, speaker)
		if stareLoop then
			stareLoop:Disconnect()
		end
	end)

	RolewatchData = {Group = 0, Role = "", Leave = false}
	RolewatchConnection = Players.PlayerAdded:Connect(function(player)
		if RolewatchData.Group == 0 then return end
		if player:IsInGroup(RolewatchData.Group) then
			if tostring(player:GetRoleInGroup(RolewatchData.Group)):lower() == RolewatchData.Role:lower() then
				if RolewatchData.Leave == true then
					Players.LocalPlayer:Kick("\n\nRolewatch\nPlayer \"" .. tostring(player.Name) .. "\" has joined with the Role \"" .. RolewatchData.Role .. "\"\n")
				else
					notify("Rolewatch", "Player \"" .. tostring(player.Name) .. "\" has joined with the Role \"" .. RolewatchData.Role .. "\"")
				end
			end
		end
	end)

	addcmd("rolewatch", {}, function(args, speaker)
		local groupId = tonumber(args[1] or 0)
		local roleName = args[2] and tostring(getstring(2))
		if groupId and roleName then
			RolewatchData.Group = groupId
			RolewatchData.Role = roleName
			notify("Rolewatch", "Watching Group ID \"" .. tostring(groupId) .. "\" for Role \"" .. roleName .. "\"")
		end
	end)

	addcmd("rolewatchstop", {}, function(args, speaker)
		RolewatchData.Group = 0
		RolewatchData.Role = ""
		RolewatchData.Leave = false
		notify("Rolewatch", "Disabled")
	end)

	addcmd("rolewatchleave", {"unrolewatch"}, function(args, speaker)
		RolewatchData.Leave = not RolewatchData.Leave
		notify("Rolewatch", RolewatchData.Leave and "Leave has been Enabled" or "Leave has been Disabled")
	end)

	staffRoles = {"mod", "admin", "staff", "dev", "founder", "owner", "supervis", "manager", "management", "executive", "president", "chairman", "chairwoman", "chairperson", "director"}

	getStaffRole = function(player)
		local playerRole = player:GetRoleInGroup(game.CreatorId)
		local result = {Role = playerRole, Staff = false}
		for _, role in pairs(staffRoles) do
			if string.find(string.lower(playerRole), role) then
				result.Staff = true
			end
		end
		return result
	end

	addcmd("staffwatch", {}, function(args, speaker)
		if staffwatchjoin then
			staffwatchjoin:Disconnect()
		end
		if game.CreatorType == Enum.CreatorType.Group then
			local found = {}
			staffwatchjoin = Players.PlayerAdded:Connect(function(player)
				local result = getStaffRole(player)
				if result.Staff then
					notify("Staffwatch", formatUsername(player) .. " is a " .. result.Role)
				end
			end)
			for _, player in pairs(Players:GetPlayers()) do
				local result = getStaffRole(player)
				if result.Staff then
					table.insert(found, formatUsername(player) .. " is a " .. result.Role)
				end
			end
			if #found > 0 then
				notify("Staffwatch", table.concat(found, ",\n"))
			else
				notify("Staffwatch", "Enabled")
			end
		else
			notify("Staffwatch", "Game is not owned by a Group")
		end
	end)

	addcmd("unstaffwatch", {}, function(args, speaker)
		if staffwatchjoin then
			staffwatchjoin:Disconnect()
		end
		notify("Staffwatch", "Disabled")
	end)

	addcmd('removeterrain',{'rterrain','noterrain'},function(args, speaker)
		workspace:FindFirstChildOfClass('Terrain'):Clear()
	end)

	addcmd('clearnilinstances',{'nonilinstances','cni'},function(args, speaker)
		if getnilinstances then
			for i,v in pairs(getnilinstances()) do
				v:Destroy()
			end
		else
			notify('Incompatible Exploit','Your exploit does not support this command (missing getnilinstances)')
		end
	end)

	addcmd('destroyheight',{'dh'},function(args, speaker)
		local dh = args[1] or -500
		if isNumber(dh) then
			workspace.FallenPartsDestroyHeight = dh
		end
	end)

	addcmd('trip',{},function(args, speaker)
		if speaker and speaker.Character and speaker.Character:FindFirstChildOfClass("Humanoid") and getRoot(speaker.Character) then
			local hum = speaker.Character:FindFirstChildOfClass("Humanoid")
			local root = getRoot(speaker.Character)
			hum:ChangeState(0)
			root.Velocity = root.CFrame.LookVector * 30
		end
	end)

	local freezingua = nil
	frozenParts = {}
	addcmd('freezeunanchored',{'freezeua'},function(args, speaker)
		local badnames = {
			"Head",
			"UpperTorso",
			"LowerTorso",
			"RightUpperArm",
			"LeftUpperArm",
			"RightLowerArm",
			"LeftLowerArm",
			"RightHand",
			"LeftHand",
			"RightUpperLeg",
			"LeftUpperLeg",
			"RightLowerLeg",
			"LeftLowerLeg",
			"RightFoot",
			"LeftFoot",
			"Torso",
			"Right Arm",
			"Left Arm",
			"Right Leg",
			"Left Leg",
			"HumanoidRootPart"
		}
		local function FREEZENOOB(v)
			if v:IsA("BasePart" or "UnionOperation") and v.Anchored == false then
				local BADD = false
				for i = 1,#badnames do
					if v.Name == badnames[i] then
						BADD = true
					end
				end
				if speaker.Character and v:IsDescendantOf(speaker.Character) then
					BADD = true
				end
				if BADD == false then
					for i,c in pairs(v:GetChildren()) do
						if c:IsA("BodyPosition") or c:IsA("BodyGyro") then
							c:Destroy()
						end
					end
					local bodypos = Instance.new("BodyPosition")
					bodypos.Parent = v
					bodypos.Position = v.Position
					bodypos.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
					local bodygyro = Instance.new("BodyGyro")
					bodygyro.Parent = v
					bodygyro.CFrame = v.CFrame
					bodygyro.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
					if not table.find(frozenParts,v) then
						table.insert(frozenParts,v)
					end
				end
			end
		end
		for i,v in pairs(workspace:GetDescendants()) do
			FREEZENOOB(v)
		end
		freezingua = workspace.DescendantAdded:Connect(FREEZENOOB)
	end)

	addcmd('thawunanchored',{'thawua','unfreezeunanchored','unfreezeua'},function(args, speaker)
		if freezingua then
			freezingua:Disconnect()
		end
		for i,v in pairs(frozenParts) do
			for i,c in pairs(v:GetChildren()) do
				if c:IsA("BodyPosition") or c:IsA("BodyGyro") then
					c:Destroy()
				end
			end
		end
		frozenParts = {}
	end)

	addcmd('tpunanchored',{'tpua'},function(args, speaker)
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players) do
			local Forces = {}
			for _,part in pairs(workspace:GetDescendants()) do
				if Players[v].Character:FindFirstChild('Head') and part:IsA("BasePart" or "UnionOperation" or "Model") and part.Anchored == false and not part:IsDescendantOf(speaker.Character) and part.Name == "Torso" == false and part.Name == "Head" == false and part.Name == "Right Arm" == false and part.Name == "Left Arm" == false and part.Name == "Right Leg" == false and part.Name == "Left Leg" == false and part.Name == "HumanoidRootPart" == false then
					for i,c in pairs(part:GetChildren()) do
						if c:IsA("BodyPosition") or c:IsA("BodyGyro") then
							c:Destroy()
						end
					end
					local ForceInstance = Instance.new("BodyPosition")
					ForceInstance.Parent = part
					ForceInstance.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					table.insert(Forces, ForceInstance)
					if not table.find(frozenParts,part) then
						table.insert(frozenParts,part)
					end
				end
			end
			for i,c in pairs(Forces) do
				c.Position = Players[v].Character.Head.Position
			end
		end
	end)

	keycodeMap = {
		["0"] = 0x30,
		["1"] = 0x31,
		["2"] = 0x32,
		["3"] = 0x33,
		["4"] = 0x34,
		["5"] = 0x35,
		["6"] = 0x36,
		["7"] = 0x37,
		["8"] = 0x38,
		["9"] = 0x39,
		["a"] = 0x41,
		["b"] = 0x42,
		["c"] = 0x43,
		["d"] = 0x44,
		["e"] = 0x45,
		["f"] = 0x46,
		["g"] = 0x47,
		["h"] = 0x48,
		["i"] = 0x49,
		["j"] = 0x4A,
		["k"] = 0x4B,
		["l"] = 0x4C,
		["m"] = 0x4D,
		["n"] = 0x4E,
		["o"] = 0x4F,
		["p"] = 0x50,
		["q"] = 0x51,
		["r"] = 0x52,
		["s"] = 0x53,
		["t"] = 0x54,
		["u"] = 0x55,
		["v"] = 0x56,
		["w"] = 0x57,
		["x"] = 0x58,
		["y"] = 0x59,
		["z"] = 0x5A,
		["enter"] = 0x0D,
		["shift"] = 0x10,
		["ctrl"] = 0x11,
		["alt"] = 0x12,
		["pause"] = 0x13,
		["capslock"] = 0x14,
		["spacebar"] = 0x20,
		["space"] = 0x20,
		["pageup"] = 0x21,
		["pagedown"] = 0x22,
		["end"] = 0x23,
		["home"] = 0x24,
		["left"] = 0x25,
		["up"] = 0x26,
		["right"] = 0x27,
		["down"] = 0x28,
		["insert"] = 0x2D,
		["delete"] = 0x2E,
		["f1"] = 0x70,
		["f2"] = 0x71,
		["f3"] = 0x72,
		["f4"] = 0x73,
		["f5"] = 0x74,
		["f6"] = 0x75,
		["f7"] = 0x76,
		["f8"] = 0x77,
		["f9"] = 0x78,
		["f10"] = 0x79,
		["f11"] = 0x7A,
		["f12"] = 0x7B,
	}
	autoKeyPressing = false
	cancelAutoKeyPress = nil

	addcmd('autokeypress',{'keypress'},function(args, speaker)
		if keypress and keyrelease and args[1] then
			local code = keycodeMap[args[1]:lower()]
			if not code then notify('Auto Key Press',"Invalid key") return end
			execCmd('unautokeypress')
			wait()
			local clickDelay = 0.1
			local releaseDelay = 0.1
			if args[2] and isNumber(args[2]) then clickDelay = args[2] end
			if args[3] and isNumber(args[3]) then releaseDelay = args[3] end
			autoKeyPressing = true
			cancelAutoKeyPress = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
				if not gameProcessedEvent then
					if (input.KeyCode == Enum.KeyCode.Backspace and UserInputService:IsKeyDown(Enum.KeyCode.Equals)) or (input.KeyCode == Enum.KeyCode.Equals and UserInputService:IsKeyDown(Enum.KeyCode.Backspace)) then
						autoKeyPressing = false
						cancelAutoKeyPress:Disconnect()
					end
				end
			end)
			notify('Auto Key Press',"Press [backspace] and [=] at the same time to stop")
			repeat wait(clickDelay)
				keypress(code)
				wait(releaseDelay)
				keyrelease(code)
			until autoKeyPressing == false
			if cancelAutoKeyPress then cancelAutoKeyPress:Disconnect() keyrelease(code) end
		else
			notify('Auto Key Press',"Your exploit doesn't have the ability to use auto key press")
		end
	end)

	addcmd('unautokeypress',{'noautokeypress','unkeypress','nokeypress'},function(args, speaker)
		autoKeyPressing = false
		if cancelAutoKeyPress then cancelAutoKeyPress:Disconnect() end
	end)

	addcmd('addplugin',{'plugin'},function(args, speaker)
		addPlugin(getstring(1))
	end)

	addcmd('removeplugin',{'deleteplugin'},function(args, speaker)
		deletePlugin(getstring(1))
	end)

	addcmd('reloadplugin',{},function(args, speaker)
		local pluginName = getstring(1)
		deletePlugin(pluginName)
		wait(1)
		addPlugin(pluginName)
	end)

	addcmd('removecmd',{'deletecmd'},function(args, speaker)
		removecmd(args[1])
	end)

	if IsOnMobile then
		local QuickCapture = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		QuickCapture.Name = randomString()
		QuickCapture.Parent = PARENT
		QuickCapture.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
		QuickCapture.BackgroundTransparency = 0.14
		QuickCapture.Position = UDim2.new(0.489, 0, 0, 0)
		QuickCapture.Size = UDim2.new(0, 32, 0, 33)
		QuickCapture.Font = Enum.Font.SourceSansBold
		QuickCapture.Text = "IY"
		QuickCapture.TextColor3 = Color3.fromRGB(255, 255, 255)
		QuickCapture.TextSize = 20.000
		QuickCapture.TextWrapped = true
		QuickCapture.Draggable = true
		UICorner.Name = randomString()
		UICorner.CornerRadius = UDim.new(0.5, 0)
		UICorner.Parent = QuickCapture
		QuickCapture.MouseButton1Click:Connect(function()
			Cmdbar:CaptureFocus()
			maximizeHolder()
		end)
		table.insert(shade1, QuickCapture)
		table.insert(text1, QuickCapture)
	end

	updateColors(currentShade1,shade1)
	updateColors(currentShade2,shade2)
	updateColors(currentShade3,shade3)
	updateColors(currentText1,text1)
	updateColors(currentText2,text2)
	updateColors(currentScroll,scroll)

	if PluginsTable ~= nil or PluginsTable ~= {} then
		FindPlugins(PluginsTable)
	end

	-- Events
	eventEditor.RegisterEvent("OnExecute")
	eventEditor.RegisterEvent("OnSpawn",{
		{Type="Player",Name="Player Filter ($1)"}
	})
	eventEditor.RegisterEvent("OnDied",{
		{Type="Player",Name="Player Filter ($1)"}
	})
	eventEditor.RegisterEvent("OnDamage",{
		{Type="Player",Name="Player Filter ($1)"},
		{Type="Number",Name="Below Health ($2)"}
	})
	eventEditor.RegisterEvent("OnKilled",{
		{Type="Player",Name="Victim Player ($1)"},
		{Type="Player",Name="Killer Player ($2)",Default = 1}
	})
	eventEditor.RegisterEvent("OnJoin",{
		{Type="Player",Name="Player Filter ($1)",Default = 1}
	})
	eventEditor.RegisterEvent("OnLeave",{
		{Type="Player",Name="Player Filter ($1)",Default = 1}
	})
	eventEditor.RegisterEvent("OnChatted",{
		{Type="Player",Name="Player Filter ($1)",Default = 1},
		{Type="String",Name="Message Filter ($2)"}
	})

	function hookCharEvents(plr,instant)
		task.spawn(function()
			local char = plr.Character
			if not char then return end

			local humanoid = char:WaitForChild("Humanoid",10)
			if not humanoid then return end

			local oldHealth = humanoid.Health
			humanoid.HealthChanged:Connect(function(health)
				local change = math.abs(oldHealth - health)
				if oldHealth > health then
					eventEditor.FireEvent("OnDamage",plr.Name,tonumber(health))
				end
				oldHealth = health
			end)

			humanoid.Died:Connect(function()
				eventEditor.FireEvent("OnDied",plr.Name)

				local killedBy = humanoid:FindFirstChild("creator")
				if killedBy and killedBy.Value and killedBy.Value.Parent then
					eventEditor.FireEvent("OnKilled",plr.Name,killedBy.Name)
				end
			end)
		end)
	end

	Players.PlayerAdded:Connect(function(plr)
		eventEditor.FireEvent("OnJoin",plr.Name)
		plr.Chatted:Connect(function(msg) eventEditor.FireEvent("OnChatted",tostring(plr),msg) end)
		plr.CharacterAdded:Connect(function() eventEditor.FireEvent("OnSpawn",tostring(plr)) hookCharEvents(plr) end)
		JoinLog(plr)
		ChatLog(plr)
		if ESPenabled then
			repeat wait(1) until plr.Character and getRoot(plr.Character)
			ESP(plr)
		end
		if CHMSenabled then
			repeat wait(1) until plr.Character and getRoot(plr.Character)
			CHMS(plr)
		end
	end)

	for _,plr in pairs(Players:GetPlayers()) do
		pcall(function()
			plr.CharacterAdded:Connect(function() eventEditor.FireEvent("OnSpawn",tostring(plr)) hookCharEvents(plr) end)
			hookCharEvents(plr)
		end)
	end

	if spawnCmds and #spawnCmds > 0 then
		for i,v in pairs(spawnCmds) do
			eventEditor.AddCmd("OnSpawn",{v.COMMAND or "",{0},v.DELAY or 0})
		end
		updatesaves()
	end

	if loadedEventData then eventEditor.LoadData(loadedEventData) end
	eventEditor.Refresh()

	eventEditor.FireEvent("OnExecute")

	if aliases and #aliases > 0 then
		local cmdMap = {}
		for i,v in pairs(cmds) do
			cmdMap[v.NAME:lower()] = v
			for _,alias in pairs(v.ALIAS) do
				cmdMap[alias:lower()] = v
			end
		end
		for i = 1, #aliases do
			local cmd = string.lower(aliases[i].CMD)
			local alias = string.lower(aliases[i].ALIAS)
			if cmdMap[cmd] then
				customAlias[alias] = cmdMap[cmd]
			end
		end
		refreshaliases()
	end

	IYMouse.Move:Connect(checkTT)

	task.spawn(function()
		local success, latestVersionInfo = pcall(function() 
			local versionJson = game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/version')
			return HttpService:JSONDecode(versionJson)
		end)

		if success then
			if currentVersion ~= latestVersionInfo.Version then
				notify('Outdated','Get the new version at infyiff.github.io')
			end

			if latestVersionInfo.Announcement and latestVersionInfo.Announcement ~= '' then
				local AnnGUI = Instance.new("Frame")
				local background = Instance.new("Frame")
				local TextBox = Instance.new("TextLabel")
				local shadow = Instance.new("Frame")
				local PopupText = Instance.new("TextLabel")
				local Exit = Instance.new("TextButton")
				local ExitImage = Instance.new("ImageLabel")

				AnnGUI.Name = randomString()
				AnnGUI.Parent = PARENT
				AnnGUI.Active = true
				AnnGUI.BackgroundTransparency = 1
				AnnGUI.Position = UDim2.new(0.5, -180, 0, -500)
				AnnGUI.Size = UDim2.new(0, 360, 0, 20)
				AnnGUI.ZIndex = 10

				background.Name = "background"
				background.Parent = AnnGUI
				background.Active = true
				background.BackgroundColor3 = currentShade1
				background.BorderSizePixel = 0
				background.Position = UDim2.new(0, 0, 0, 20)
				background.Size = UDim2.new(0, 360, 0, 150)
				background.ZIndex = 10

				TextBox.Parent = background
				TextBox.BackgroundTransparency = 1
				TextBox.Position = UDim2.new(0, 5, 0, 5)
				TextBox.Size = UDim2.new(0, 350, 0, 140)
				TextBox.Font = Enum.Font.SourceSans
				TextBox.TextSize = 18
				TextBox.TextWrapped = true
				TextBox.Text = Announcement
				TextBox.TextColor3 = currentText1
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				TextBox.TextYAlignment = Enum.TextYAlignment.Top
				TextBox.ZIndex = 10

				shadow.Name = "shadow"
				shadow.Parent = AnnGUI
				shadow.BackgroundColor3 = currentShade2
				shadow.BorderSizePixel = 0
				shadow.Size = UDim2.new(0, 360, 0, 20)
				shadow.ZIndex = 10

				PopupText.Name = "PopupText"
				PopupText.Parent = shadow
				PopupText.BackgroundTransparency = 1
				PopupText.Size = UDim2.new(1, 0, 0.95, 0)
				PopupText.ZIndex = 10
				PopupText.Font = Enum.Font.SourceSans
				PopupText.TextSize = 14
				PopupText.Text = "Server Announcement"
				PopupText.TextColor3 = currentText1
				PopupText.TextWrapped = true

				Exit.Name = "Exit"
				Exit.Parent = shadow
				Exit.BackgroundTransparency = 1
				Exit.Position = UDim2.new(1, -20, 0, 0)
				Exit.Size = UDim2.new(0, 20, 0, 20)
				Exit.Text = ""
				Exit.ZIndex = 10

				ExitImage.Parent = Exit
				ExitImage.BackgroundColor3 = Color3.new(1, 1, 1)
				ExitImage.BackgroundTransparency = 1
				ExitImage.Position = UDim2.new(0, 5, 0, 5)
				ExitImage.Size = UDim2.new(0, 10, 0, 10)
				ExitImage.Image = "rbxassetid://5054663650"
				ExitImage.ZIndex = 10

				wait(1)
				AnnGUI:TweenPosition(UDim2.new(0.5, -180, 0, 150), "InOut", "Quart", 0.5, true, nil)

				Exit.MouseButton1Click:Connect(function()
					AnnGUI:TweenPosition(UDim2.new(0.5, -180, 0, -500), "InOut", "Quart", 0.5, true, nil)
					wait(0.6)
					AnnGUI:Destroy()
				end)
			end
		end
	end)

	task.spawn(function()
		wait()
		Credits:TweenPosition(UDim2.new(0, 0, 0.9, 0), "Out", "Quart", 0.2)
		Logo:TweenSizeAndPosition(UDim2.new(0, 175, 0, 175), UDim2.new(0, 37, 0, 45), "Out", "Quart", 0.3)
		wait(1)
		local OutInfo = TweenInfo.new(1.6809, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		TweenService:Create(Logo, OutInfo, {ImageTransparency = 1}):Play()
		TweenService:Create(IntroBackground, OutInfo, {BackgroundTransparency = 1}):Play()
		Credits:TweenPosition(UDim2.new(0, 0, 0.9, 30), "Out", "Quart", 0.2)
		wait(0.2)
		Logo:Destroy()
		Credits:Destroy()
		IntroBackground:Destroy()
		minimizeHolder()
		if IsOnMobile then notify("Unstable Device", "On mobile, Infinite Yield may have issues or features that are not functioning correctly.") end
	end)
end); loadprogress("last")
--task.delay(1, function() datadssend() end); loadprogress("last")

task.spawn(function() rconsoledestroy() end)
Ld.field:LoadConfiguration()
