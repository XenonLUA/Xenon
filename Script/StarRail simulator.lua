local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local PlayerGui = localPlayer:WaitForChild("PlayerGui")

--Values
local selectedEgg = nill
local isHatch = false


local function isPlayerOnMobile()
    return UserInputService.TouchEnabled and not (UserInputService.KeyboardEnabled or UserInputService.GamepadEnabled)
end

local RayfieldURL = isPlayerOnMobile() and 
                    'https://raw.githubusercontent.com/XenonLUA/Xenon/main/Xenon.lua' or 
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


--function
local Eggs = {
    ["3K"] = Slot001,
    ["3M"] = Slot002,
    ["3B"] = Slot003,
    ["3T"] = Slot004,
}



--========================================== MAIN. =====================================================

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Main")

local Toggle = Tab:CreateToggle({
   Name = "Auto Power",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    a = Value 
	while a do task.wait()
	  pcall(function()
	    game:GetService("ReplicatedStorage").Events.Fight.ClickDamage:FireServer()
	    end)
	  end
	end,
})


local Toggle = Tab:CreateToggle({
   Name = "Auto Ability & Attack Pet",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    b = Value 
	while b do task.wait()
	  pcall(function()
	    game:GetService("ReplicatedStorage").Events.Hero.HeroAbility:FireServer(workspace.UserPets["1116656080"]["Pom-Pom"],"05-Emit")
	    
game:GetService("ReplicatedStorage").Events.Hero.HeroAttack:FireServer(workspace.UserPets["1116656080"]["Pom-Pom"])

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080"):FindFirstChild("Black Swan")
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAttack:FireServer(unpack(args))

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080"):FindFirstChild("Black Swan"),
    [2] = "Damage01"
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAbility:FireServer(unpack(args))

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080"):FindFirstChild("Black Swan"),
    [2] = "Damage02"
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAbility:FireServer(unpack(args))

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080"):FindFirstChild("Black Swan"),
    [2] = "Damage03"
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAbility:FireServer(unpack(args))

	    
	    end)
	  end
	end,
})

local Dropdown = Tab:CreateDropdown({
    Name = "Select",
    Options = {"3K","3M","3B","3T"},
    CurrentOption = {"150"},
    MultipleOptions = false,
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Option)
      selectedEgg = Eggs[Option]
      print(selectedEgg)
    end,
 })
 
 local Toggle = Tab:CreateToggle({
    Name = "Start Machine",
    CurrentValue = false,
    Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
      isHatch = Value
      while isHatch do
      if selectedEgg then
        local args = {
            [1] = selectedEgg
        }
        
        game:GetService("ReplicatedStorage").Events.Stats.ClaimSlot:InvokeServer(unpack(args))
      end
      wait()
      end
    end
 })
