local WorkspacePlayers = game:GetService("Workspace").Game.Players
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local PlayerGui = localPlayer:WaitForChild("PlayerGui")

--Values
Config = {
Player = { InfJump = false, 
WalkSpeed = false },
}
_G.collect = false
getgenv().autowistle = false
getgenv().annoydowned = false

getgenv().Settings = {
    moneyfarm = false,
    afkfarm = false,
    NoCameraShake = false,
    Downedplayeresp = false,
    AutoRespawn = false,
    Speed = 1450,
    Jump = 3,
    reviveTime = 3,
    DownedColor = Color3.fromRGB(255,0,0),
    PlayerColor = Color3.fromRGB(255,170,0),

    stats = {
        TicketFarm = {
            earned = nil,
            duration = 0
        },

        TokenFarm = {
            earned = nil,
            duration = 0
        }

    }
}
local function isPlayerOnMobile()
    return UserInputService.TouchEnabled and not (UserInputService.KeyboardEnabled or UserInputService.GamepadEnabled)
end

local RayfieldURL = isPlayerOnMobile() and 
                    'https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AArrayfield%20Library' or 
                    'https://sirius.menu/rayfield'

local Rayfield = loadstring(game:HttpGet(RayfieldURL))()

local notifs =
    loadstring(
    game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true)
)()
local changelog = game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/misc/clogevade.lua")
local esp =
    loadstring(
    game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/SimpleHighlightESP.lua")
)()

if rconsoleprint then
	rconsoleprint(changelog)
end


local Window = Rayfield:CreateWindow({
   Name = "Xenon HUB",
   LoadingTitle = "Xenon",
   LoadingSubtitle = "by Xenon",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "Xenon",
      FileName = "Xenon"
   },
   Discord = {
      Enabled = true,
      Invite = "hNX8VxcjMF",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Xenon",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/hNX8VxcjMF)",
      FileName = "Xenon",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "Hello"
   }
})

-- [LOADING --
game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
repeat
	task.wait()
until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name)
repeat
	task.wait()
until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")

-- [[ VARS ]]

local eventTaunts = {
	"CursedFlashlight",
	"WerewolfHowl",
	"Tombstone",
	"Baghead",
	"DemonHorns",
	"Candlehead",
	"ImpaledHead",
	"WitchHat",
	"DualBoneSwords",
	"LavaLamp",
	"SpiderInfestation",
	"PumpItUp",
	"VampireOutfit",
	"OminousDemise",
	"BlueHallowedFace",
	"GreenHallowedFace",
	"OrangeHallowedFace",
	"GhostCatcher",
	"DemonWings",
	"CandleLamp",
	"FungalOvergrowth",
	"Reanimated",
	"ToxicInferno",
	"Monoculi",
	"WretchedWings",
	"PhantomBlades",
	"AmethystStaff",
	"GhostAbduction",
	"Telespell",
	"Thriller",
	"BluefirePortal",
	"HellfirePortal",
	"SeekingEye",
	"EyeCorruption",
	"Necromonicon",
	"FrightFunk",
	"BlueUFOAbduction",
	"PinkUFOAbduction",
	"Cauldronhead",
	"HellishGrip",
	"HauntedIredescence",
	"CobwebTrap",
	"MechanicalScythe",
	"DragonSkull",
	"GhostFriend",
	"SpilledCauldron",
	"WardingLantern",
	"RockinStride",
	"Rockin'Stride",
	"DarkTendrils",
	"AlchemistBelt",
	"Frankenstein",
	"ElectrifyingGuitar",
	"BatVision",
	"BananaSuit",
	"EyeIllusions",
	"BroomOfDoom",
	"BloodMoon"
}

--function

function autowistlefunction()
    while autowistle == true do
        local ohString1 = "Whistle"
        local ohBoolean2 = true
        game:GetService("Players").LocalPlayer.PlayerScripts.Events.KeybindUsed:Fire(ohString1, ohBoolean2)
        game:GetService("ReplicatedStorage").Events.Whistle:FireServer()
        wait(5)
    end
end

task.spawn(function()
    while task.wait() do
        if Settings.AutoRespawn then
             if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
             end
        end

        if Settings.NoCameraShake then
            localplayer.PlayerScripts.CameraShake.Value = CFrame.new(0,0,0) * CFrame.new(0,0,0)
        end
        if Settings.moneyfarm then
            TypeLabelC5:Set('Money Farm')
            DurationLabelC5:Set('Duration:'..convertToHMS(Settings.stats.TokenFarm.duration))
            EarnedLabelC5:Set('Earned:'.. formatNumber(Settings.stats.TokenFarm.earned))
            --TicketsLabelC5:Set('Total Tokens: '..formatNumber(localplayer:GetAttribute('Tokens')))
            
            if localplayer:GetAttribute("InMenu") and localplayer:GetAttribute("Dead") ~= true then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
            end
            if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
                task.wait(3)
            else
                revive()
                task.wait(1)
            end

        end
        if Settings.moneyfarm == false and Settings.afkfarm and localplayer.Character:FindFirstChild('HumanoidRootPart') ~= nil then
            localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(6007, 7005, 8005)
        end
    end
end)

function bb()
	while getgenv().breakbots do
		n = math.random(1, 10000000)
		z = math.random(200, 8000)
		x = math.random(1, 10000000)
		if not getgenv().breakbots then
			break
		end
		if game:GetService("Workspace").Game:WaitForChild('Map'):WaitForChild('Parts'):FindFirstChild("KillBricks") then
			game:GetService("Workspace").Game:WaitForChild('Map').KillBricks:Destroy()
		end
		task.wait()
		game.Workspace.Game.Players:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").CFrame =
            CFrame.new(0, z, 0)
	end
end

function annoydown()
    if annoydowned then
        makeNotification("warning", "Xenon HUB | ywserasdfas;fls", "this will most likely break without Auto Respawn")
    end

    local carriedPlayers = {} -- Table to track carried players
    local isTeleporting = false -- Flag to indicate teleport in progress

    while task.wait() do
        if not getgenv().annoydowned then
            break
        end

        pcall(function()
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

            for i, v in next, game:GetService("Workspace").Game.Players:GetDescendants() do
                if
                    v.IsA(v, "NumberValue") and
                    v.Name == "Downed" and
                    not v.Parent.Parent.Parent:FindFirstChild("CarriedBy") and
                    game.Players[v.Parent.Parent.Parent.Name].Settings.CanBeCarried.Value == true and
                    not carriedPlayers[v.Parent.Parent.Parent.Name] and
                    not isTeleporting  -- Check if teleport is already in progress
                then
                    local holder = v.Parent.Parent.Parent.Name
                    local hold = workspace.Game.Players[holder]

                    isTeleporting = true -- Set flag to prevent multiple teleports

                    task.spawn(function()
                        scrip = require(game:GetService("ReplicatedStorage").ModuleStorage.Interact.Interactions.Revive.Revive)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(hold.HumanoidRootPart.Position)
                        task.wait(0.3)
                        game:GetService("ReplicatedStorage").Events.Revive.CarryPlayer:FireServer(holder)
                        task.wait(0.3)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new
                        task.wait(0.2)
                        game:GetService("ReplicatedStorage").Events.Revive.CarryPlayer:FireServer(holder, true)
                        task.wait(0.5)

                        carriedPlayers[holder] = true -- Add player to carriedPlayers table
                        isTeleporting = false -- Reset flag after teleport completion
                    end)
                end
            end
        end)
    end
end


function makeNotification(type, head, body)
	notifs.new(type, head, body, true, 5)
end

function Simple_Create(base, name, trackername, studs)
	local bb = Instance.new("BillboardGui", game.CoreGui)
	bb.Adornee = base
	bb.ExtentsOffset = Vector3.new(0, 1, 0)
	bb.AlwaysOnTop = true
	bb.Size = UDim2.new(0, 6, 0, 6)
	bb.StudsOffset = Vector3.new(0, 1, 0)
	bb.Name = trackername
	local frame = Instance.new("Frame", bb)
	frame.ZIndex = 10
	frame.BackgroundTransparency = 0.3
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	local txtlbl = Instance.new("TextLabel", bb)
	txtlbl.ZIndex = 10
	txtlbl.BackgroundTransparency = 1
	txtlbl.Position = UDim2.new(0, 0, 0, -48)
	txtlbl.Size = UDim2.new(1, 0, 10, 0)
	txtlbl.Font = "ArialBold"
	txtlbl.FontSize = "Size12"
	txtlbl.Text = name
	txtlbl.TextStrokeTransparency = 0.5
	txtlbl.TextColor3 = Color3.fromRGB(255, 0, 0)
end

function ClearESP(espname)
	for _, v in pairs(game.CoreGui:GetChildren()) do
		if v.Name == espname and v:isA("BillboardGui") then
			v:Destroy()
		end
	end
end

function nowaterdmg(t)
	for i, v in next, t:GetChildren() do
		if v.IsA(v, 'BasePart') then
			v.CanTouch = false
		end
	end
end

game:GetService("UserInputService").JumpRequest:connect(function()
    if Config.Player.InfJump then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end
end)

local old
old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
    local Args = {...}
    local method = getnamecallmethod()
    if tostring(self) == 'Communicator' and method == "InvokeServer" and Args[1] == "update" then
        return Settings.Speed, Settings.Jump 
    end
    return old(self,...)
end))

local revive = function()
    local downedplr = GetDownedPlr()
    if downedplr ~= nil and downedplr:FindFirstChild('HumanoidRootPart') then
        task.spawn(function()
            while task.wait() do
                if localplayer.Character then
                    workspace.Game.Settings:SetAttribute("ReviveTime", 2.2)
                    localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(downedplr:FindFirstChild('HumanoidRootPart').Position.X, downedplr:FindFirstChild('HumanoidRootPart').Position.Y + 3, downedplr:FindFirstChild('HumanoidRootPart').Position.Z)
                    task.wait()
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), false)
                    task.wait(4.5)
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
                    break
                end
            end
        end)
    end
end

task.spawn(function()
    while task.wait() do
        if Settings.TicketFarm then
            TypeLabelC5:Set('Ticket Farm')
            DurationLabelC5:Set('Duration:'..convertToHMS(Settings.stats.TicketFarm.duration))
            EarnedLabelC5:Set('Earned:'.. formatNumber(Settings.stats.TicketFarm.earned))
            --TicketsLabelC5:Set('Total Tickets: '..localplayer:GetAttribute('Tickets'))

            if game.Players.LocalPlayer:GetAttribute('InMenu') ~= true and localplayer:GetAttribute('Dead') ~= true then
                for i,v in pairs(game:GetService("Workspace").Game.Effects.Tickets:GetChildren()) do
                    localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:WaitForChild('HumanoidRootPart').Position)
                end
            else
                task.wait(2)
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
            end
            if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
                task.wait(2)
            end
        end
    end
end)


--========================================== MAIN. =====================================================

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Main")

local Slider = Tab:CreateSlider({
   Name = "Walk Speed",
   Range = {1450, 10000},
   Increment = 5,
   Suffix = "WalkSpeed",
   CurrentValue = 1450,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        Settings.Speed = Value
    end,
})

local Toggle = Tab:CreateToggle({
   Name = "Aktif For Tp + Auto Carry",
   CurrentValue = false,
   Flag = "Toggle9", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(down)
		getgenv().annoydowned = down
		annoydown()
	end,
})

local Button = Tab:CreateButton({
   Name = "Button Tp + Auto Carry",
   CurrentValue = false,
   Callback = function()
		local gui, frame, button = Instance.new("ScreenGui", game.CoreGui), Instance.new("Frame"), Instance.new("TextButton")
gui.ResetOnSpawn = false
frame.Size, frame.Position, frame.BackgroundColor3, frame.BorderSizePixel, frame.Active, frame.Draggable, frame.Parent = UDim2.new(0, 150, 0, 75), UDim2.new(0, 10, 0, 10), Color3.new(0, 0, 0), 0, true, true, gui
button.Text, button.Size, button.Position, button.BackgroundColor3, button.BorderColor3, button.BorderSizePixel, button.Font, button.TextColor3, button.TextSize, button.Parent = "Tp + Auto Carry", UDim2.new(1, -20, 1, -20), UDim2.new(0, 10, 0, 10), Color3.new(0, 0, 0), Color3.new(), 2, Enum.Font.SourceSans, Color3.new(1, 1, 1), 16, frame

button.MouseButton1Click:Connect(function(down)
		annoydown()
end)
	end,
})


local Toggle = Tab:CreateToggle({
   Name = "Auto Wistle",
   CurrentValue = false,
   Flag = "Toggle8", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		getgenv().autowistle = Value
		autowistlefunction()
	end,
})

local Button = Tab:CreateToggle({
   Name = "Inf Jump",
   Callback = function(state)
   Config.Player.InfJump = state
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Camera No Shake",
   CurrentValue = false,
   Flag = "Toggle6", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(State)
		Settings.NoCameraShake = State
	end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Respawn",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(x)
		getgenv().respawning = x
		while task.wait(1) and respawning do
			if not getgenv().respawning then
				break
			end
			local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
			local stats = char:WaitForChild("StatChanges", 3)
			if stats == nil then
				return
			end
			if stats:FindFirstChild("Speed") and stats:FindFirstChild("Speed"):FindFirstChild("Downed") then
				game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
			end
		end
	end,
})

local Toggle = Tab:CreateToggle({
   Name = "Fast Revive",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(State)
		if State then
        workspace.Game.Settings:SetAttribute("ReviveTime", 2.2)
    else
        workspace.Game.Settings:SetAttribute("ReviveTime", Settings.reviveTime)
    end
	end,
})



local Button = Tab:CreateButton({
   Name = "Remove Barriers",
   Callback = function()
   workspace.Game.Map.InvisParts:ClearAllChildren()
   end,
})

local Button = Tab:CreateButton({
   Name = "Chat Spy",
   Callback = function()
   enabled = true
spyOnMyself = false
public = false
publicItalics = true
privateProperties = {
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance
 
local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,4)=="/spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end
 
for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
      end,
})


local Button = Tab:CreateButton({
   Name = "Full Bright",
   Callback = function()
   Game.Lighting.Brightness = 4
	Game.Lighting.FogEnd = 100000
	Game.Lighting.GlobalShadows = false
    Game.Lighting.ClockTime = 12
   end,
})



local Button = Tab:CreateButton({
   Name = "Round end times",
   Callback = function()
		makeNotification(
                "Info",
                "Xenon HUB | Map",
                'Round will end in ' .. game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD").Center.Vote.Info.Read.Timer.Text
            )
	end,
})

local Button = Tab:CreateButton({
   Name = "No Water Damage",
   Callback = function()
		if getgenv().nodmg then
			return
		end
		getgenv().nodmg = true
		nowaterdmg(game.Players.LocalPlayer.Character)
		game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
			repeat
				task.wait()
			until char:FindFirstChild('HumanoidRootPart')
			nowaterdmg(char)
		end)
	end,
})

local Button = Tab:CreateButton({
   Name = "Teleport to Objective",
   Callback = function()
		hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
		if workspace.Game.Map.Parts:FindFirstChild("Objectives") then
			for i, v in next, workspace.Game.Map.Parts.Objectives:GetChildren() do
				if v.IsA(v, "Model") then
					hrp.CFrame = CFrame.new(v:FindFirstChildWhichIsA("BasePart").Position)
				end
			end
		end
	end,
})

local Button = Tab:CreateButton({
   Name = "Teleport to Knock",
   Callback = function()
		for i, v in next, workspace.Game.Players:GetChildren() do
			if v:GetAttribute('Downed') then
				pcall(function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position)
				end)
			end
		end
	end,
})

local Button = Tab:CreateButton({
   Name = "Fps Boost",
   Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubfpsboost"))()
  end,
})

--========================================== AUTO FARM ==========================================

local Tab = Window:CreateTab("Auto Farm", 4483362458) -- Title, Image

local Toggle = Tab:CreateToggle({
   Name = "Auto Farm Win",
   CurrentValue = false,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(bbb)
		getgenv().breakbots = bbb
		bb()
	end,
})

local Toggle = Tab:CreateToggle({
   Name = "Event Farm",
   CurrentValue = false,
   Flag = "Toggle7", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(TF)
		getgenv().tf = TF
		if tf then
			makeNotification(
                        "warning",
                        "Xenon Hub | Farm",
                        'Please click on "Auto Respawn" in the GUI to avoid breaking'
                    )
			part = Instance.new("Part", workspace)
			part.Anchored = true
			
		end
		while task.wait(0.5) and getgenv().tf do
			if not tf then
				break
			end
			local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
			local tickets = workspace.Game.Effects.Tickets
			local hrp = char:WaitForChild("HumanoidRootPart", 3)
			if hrp == nil then
				return
			end
			
			for i, v in next, tickets:GetDescendants() do
				if v.IsA(v, "BasePart") and v.Name == "HumanoidRootPart" then
					hrp.CFrame = CFrame.new(v.Position)
				end
			end
		end
	end,
})



--========================================== ESP. ==========================================

local Tab = Window:CreateTab("ESP", 4483362458)

local Section = Tab:CreateSection("ESP")

local Button = Tab:CreateButton({
   Name = "Esp Name",
   Callback = function(value)
		local c = workspace.CurrentCamera
		local ps = game:GetService("Players")
		local lp = ps.LocalPlayer
		local rs = game:GetService("RunService")
		local function getdistancefc(part)
			return (part.Position - c.CFrame.Position).Magnitude
		end
		local function esp(p, cr)
			local h = cr:WaitForChild("Humanoid")
			local hrp = cr:WaitForChild("HumanoidRootPart")
			local text = Drawing.new("Text")
			text.Visible = false
			text.Center = true
			text.Outline = true
			text.Font = 2
			text.Color = Color3.fromRGB(255, 255, 255)
			text.Size = 17
			local c1
			local c2
			local c3
			local function dc()
				text.Visible = false
				text:Remove()
				if c1 then
					c1:Disconnect()
					c1 = nil
				end
				if c2 then
					c2:Disconnect()
					c2 = nil
				end
				if c3 then
					c3:Disconnect()
					c3 = nil
				end
			end
			c2 =
				cr.AncestryChanged:Connect(
				function(_, parent)
					if not parent then
						dc()
					end
				end
			)
			c3 =
				h.HealthChanged:Connect(
				function(v)
					if (v <= 0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
						dc()
					end
				end
			)
			c1 =
				rs.RenderStepped:Connect(
				function()
					local hrp_pos, hrp_os = c:WorldToViewportPoint(hrp.Position)
					if hrp_os then
						text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y)
						text.Text = p.Name .. " (" .. tostring(math.floor(getdistancefc(hrp))) .. " m)"
						text.Visible = true
					else
						text.Visible = false
					end
				end
			)
		end
		local function p_added(p)
			if p.Character then
				esp(p, p.Character)
			end
			p.CharacterAdded:Connect(
				function(cr)
					esp(p, cr)
				end
			)
		end
		for i, p in next, ps:GetPlayers() do
			if p ~= lp then
				p_added(p)
			end
		end
		ps.PlayerAdded:Connect(p_added)
 end,
})

local Button = Tab:CreateButton({
   Name = "Esp Skeleton",
   Callback = function()
		local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/UniversalSkeleton.lua"))()
local Skeletons = {}
for _, Player in next, game.Players:GetChildren() do
	table.insert(Skeletons, Library:NewSkeleton(Player, true));
end
game.Players.PlayerAdded:Connect(function(Player)
	table.insert(Skeletons, Library:NewSkeleton(Player, true));
end)
  end,
})

local Button = Tab:CreateButton({
   Name = "Esp Box",
   Callback = function(value)
		-- Settings
local Settings = {
    Box_Color = Color3.fromRGB(255, 0, 0),
    Box_Thickness = 2,
    Team_Check = false,
    Team_Color = false,
    Autothickness = true
}

--Locals
local Space = game:GetService("Workspace")
local Player = game:GetService("Players").LocalPlayer
local Camera = Space.CurrentCamera

-- Locals
local function NewLine(color, thickness)
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color
    line.Thickness = thickness
    line.Transparency = 1
    return line
end

local function Vis(lib, state)
    for i, v in pairs(lib) do
        v.Visible = state
    end
end

local function Colorize(lib, color)
    for i, v in pairs(lib) do
        v.Color = color
    end
end

local Black = Color3.fromRGB(0, 0, 0)

local function Rainbow(lib, delay)
    for hue = 0, 1, 1/30 do
        local color = Color3.fromHSV(hue, 0.6, 1)
        Colorize(lib, color)
        wait(delay)
    end
    Rainbow(lib)
end
--Main Draw Function
local function Main(plr)
    repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil
    local R15
    if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        R15 = true
    else 
        R15 = false
    end
    local Library = {
        TL1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        TL2 = NewLine(Settings.Box_Color, Settings.Box_Thickness),

        TR1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        TR2 = NewLine(Settings.Box_Color, Settings.Box_Thickness),

        BL1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        BL2 = NewLine(Settings.Box_Color, Settings.Box_Thickness),

        BR1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        BR2 = NewLine(Settings.Box_Color, Settings.Box_Thickness)
    }
    coroutine.wrap(Rainbow)(Library, 0.15)
    local oripart = Instance.new("Part")
    oripart.Parent = Space
    oripart.Transparency = 1
    oripart.CanCollide = false
    oripart.Size = Vector3.new(1, 1, 1)
    oripart.Position = Vector3.new(0, 0, 0)
    --Updater Loop
    local function Updater()
        local c 
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local Hum = plr.Character
                local HumPos, vis = Camera:WorldToViewportPoint(Hum.HumanoidRootPart.Position)
                if vis then
                    oripart.Size = Vector3.new(Hum.HumanoidRootPart.Size.X, Hum.HumanoidRootPart.Size.Y*1.5, Hum.HumanoidRootPart.Size.Z)
                    oripart.CFrame = CFrame.new(Hum.HumanoidRootPart.CFrame.Position, Camera.CFrame.Position)
                    local SizeX = oripart.Size.X
                    local SizeY = oripart.Size.Y
                    local TL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, SizeY, 0)).p)
                    local TR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, SizeY, 0)).p)
                    local BL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, -SizeY, 0)).p)
                    local BR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, -SizeY, 0)).p)

                    if Settings.Team_Check then
                        if plr.TeamColor == Player.TeamColor then
                            Colorize(Library, Color3.fromRGB(0, 255, 0))
                        else 
                            Colorize(Library, Color3.fromRGB(255, 0, 0))
                        end
                    end

                    if Settings.Team_Color then
                        Colorize(Library, plr.TeamColor.Color)
                    end

                    local ratio = (Camera.CFrame.p - Hum.HumanoidRootPart.Position).magnitude
                    local offset = math.clamp(1/ratio*750, 2, 300)

                    Library.TL1.From = Vector2.new(TL.X, TL.Y)
                    Library.TL1.To = Vector2.new(TL.X + offset, TL.Y)
                    Library.TL2.From = Vector2.new(TL.X, TL.Y)
                    Library.TL2.To = Vector2.new(TL.X, TL.Y + offset)

                    Library.TR1.From = Vector2.new(TR.X, TR.Y)
                    Library.TR1.To = Vector2.new(TR.X - offset, TR.Y)
                    Library.TR2.From = Vector2.new(TR.X, TR.Y)
                    Library.TR2.To = Vector2.new(TR.X, TR.Y + offset)

                    Library.BL1.From = Vector2.new(BL.X, BL.Y)
                    Library.BL1.To = Vector2.new(BL.X + offset, BL.Y)
                    Library.BL2.From = Vector2.new(BL.X, BL.Y)
                    Library.BL2.To = Vector2.new(BL.X, BL.Y - offset)

                    Library.BR1.From = Vector2.new(BR.X, BR.Y)
                    Library.BR1.To = Vector2.new(BR.X - offset, BR.Y)
                    Library.BR2.From = Vector2.new(BR.X, BR.Y)
                    Library.BR2.To = Vector2.new(BR.X, BR.Y - offset)

                    Vis(Library, true)

                    if Settings.Autothickness then
                        local distance = (Player.Character.HumanoidRootPart.Position - oripart.Position).magnitude
                        local value = math.clamp(1/distance*100, 1, 4) --0.1 is min thickness, 6 is max
                        for u, x in pairs(Library) do
                            x.Thickness = value
                        end
                    else 
                        for u, x in pairs(Library) do
                            x.Thickness = Settings.Box_Thickness
                        end
                    end
                else 
                    Vis(Library, false)
                end
            else 
                Vis(Library, false)
                if game:GetService("Players"):FindFirstChild(plr.Name) == nil then
                    for i, v in pairs(Library) do
                        v:Remove()
                        oripart:Destroy()
                    end
                    c:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

-- Draw Boxes
for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= Player.Name then
      coroutine.wrap(Main)(v)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(newplr)
    coroutine.wrap(Main)(newplr)
end)
 end,
})



local Toggle = Tab:CreateToggle({
   Name = "Esp Bot",
   CurrentValue = false,
   Flag = "Toggle4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(besp)
		getgenv().botesp = besp
		task.spawn(
                function()
			while task.wait() do
				ClearESP('AI_Tracker')
				if not getgenv().botesp then
					break
				end
				pcall(function()
					local GamePlayers = workspace.Game.Players
					for i, v in pairs(GamePlayers:GetChildren()) do
						if not game.Players:FindFirstChild(v.Name) then
							Simple_Create(v.HumanoidRootPart, v.Name, "AI_Tracker")
						end
					end
				end)
			end
		end
            )
	end,
})

local Toggle = Tab:CreateToggle({
   Name = "Esp Knock",
   CurrentValue = false,
   Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(desp)
		getgenv().downesp = desp
		task.spawn(
                function()
			while task.wait() do
				ClearESP('Downed_ESP')
				if not getgenv().downesp then
					break
				end
				pcall(function()
					local GamePlayers = workspace:WaitForChild("Game", 1337).Players
					for i, v in pairs(GamePlayers:GetChildren()) do
						if v:GetAttribute('Downed') then
							Simple_Create(v.HumanoidRootPart, 'Knock: ' .. v.Name, "Downed_ESP")
						end
					end
				end)
			end
		end
            )
	end,
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/100)
        end
    end)
end)


workspace.Game.ChildAdded:Connect(function(v)
	if v.Name == 'Map' and tspam then
		task.wait(32) -- waits for map to start
		while tspam and task.wait() do
			if not tspam then
				break
			end
			for i, v in next, workspace.Game.Players:GetChildren() do
				if v and v:FindFirstChild('Equip') then
					v:FindFirstChild('Equip'):InvokeServer(2)
				end
			end
		end
	end
end)