local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
	
	local PhantomForcesWindow = Library:NewWindow("NightLight")
	local x = PhantomForcesWindow:NewSection("ESP")

    --values
lp = Players.LocalPlayer
getgenv().TPPlace = "string"
    --function
    function Teleport(teleportPlace)
      local player = game.Players.LocalPlayer
      player.Character.HumanoidRootPart.CFrame = teleportPlace
  end
    --main
    
    local TweenService  = game:GetService("TweenService")
local noclipE       = false
local antifall      = false
 
local function noclip()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        end
    end
end
 
local function moveto(obj, speed)
    local info = TweenInfo.new(((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude)/ speed,Enum.EasingStyle.Linear)
    local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = obj})
 
    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
        antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        antifall.Velocity = Vector3.new(0,0,0)
        noclipE = game:GetService("RunService").Stepped:Connect(noclip)
        tween:Play()
    end
 
    tween.Completed:Connect(function()
        antifall:Destroy()
        noclipE:Disconnect()
    end)
end


    
x:CreateButton("ESP NOTE", function()
  -- loadstring
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/Xenon/main/Script/ESP%20XENON.lua"))()
 
-- config
ESP.Players = false
ESP.Boxes = false
ESP.Names = true
ESP:Toggle(true)

 
-- object
ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Note1", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Note 1", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Note2", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Note 2", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Note3", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Note 3", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Note4", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Note 4", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Note5", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Note 5", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Note6", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Note 6", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Note7", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Note 7", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Note8", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Note 8", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP.whatever = true
end)

x:CreateButton("ESP Matches", function()
  -- loadstring
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/Xenon/main/Script/ESP%20XENON.lua"))()
 
-- config
ESP.Players = false
ESP.Boxes = false
ESP.Names = true
ESP:Toggle(true)

 
-- object
ESP:AddObjectListener(Workspace.Matches, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Match", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Matches", -- Name you want to be displayed
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "match" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP.match = true
end)

x:CreateButton("ESP Coin", function()
  local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/Xenon/main/Script/ESP%20XENON.lua"))()
 
-- config
ESP.Players = false
ESP.Boxes = false
ESP.Names = true
ESP:Toggle(true)

 
-- object
ESP:AddObjectListener(Workspace.House.Coins, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Coin_2", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Matches", -- Name you want to be displayed
    Color = Color3.fromRGB(212, 166, 65), -- Color
    IsEnabled = "match" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace.House.Coins, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Coin_5", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Coins", -- Name you want to be displayed
    Color = Color3.fromRGB(212, 166, 65), -- Color
    IsEnabled = "c" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP.c = true
end)

x:CreateButton("ESP Bot", function()
  local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/Xenon/main/Script/ESP%20XENON.lua"))()
 
-- config
ESP.Players = false
ESP.Boxes = false
ESP.Names = true
ESP:Toggle(true)

 
-- object
ESP:AddObjectListener(Workspace, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Beta", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Beta", -- Name you want to be displayed
    Color = Color3.fromRGB(212, 0, 0), -- Color
    IsEnabled = "bot" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Midnight", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Midnight", -- Name you want to be displayed
    Color = Color3.fromRGB(212, 0, 0), -- Color
    IsEnabled = "bot" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace, { -- Object Path, For example: Workspace.ThisFolder
    Name = "GreenMan", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "GreenMan", -- Name you want to be displayed
    Color = Color3.fromRGB(212, 0, 0), -- Color
    IsEnabled = "bot" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Jumpscare1", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Jumpscare", -- Name you want to be displayed
    Color = Color3.fromRGB(212, 0, 0), -- Color
    IsEnabled = "bot" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})

ESP:AddObjectListener(Workspace, { -- Object Path, For example: Workspace.ThisFolder
    Name = "Lights", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "Lights", -- Name you want to be displayed
    Color = Color3.fromRGB(212, 0, 0), -- Color
    IsEnabled = "bot" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})


ESP.bot = true
end)

local x = PhantomForcesWindow:NewSection("Main")

x:CreateButton("Brighnes", function()
  Game.Lighting.Brightness = 1
	Game.Lighting.FogEnd = 100000
	Game.Lighting.GlobalShadows = false
    Game.Lighting.ClockTime = 12
end)

x:CreateButton("Matches", function()
  hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    			for i, v in next, workspace.Matches:GetChildren() do
    				if v.IsA(v, "Model") then
    					hrp.CFrame = CFrame.new(v:FindFirstChild("Part").Position)
    				end
    			end
end)

x:CreateButton("Exit Door", function()
    Teleport(game:GetService("Workspace").Spawn.CFrame)
end)

x:CreateDropdown("Notes", {"::NOTES::","Note 1", "Note 2", "Note 3" , "Note 4", "Note 5", "Note 6", "Note 7", "Note 8"}, 1, function(value)
  getgenv().TPPlace = value
end)

x:CreateToggle("Teleport", function()
  a = TPPlace
  while a do task.wait()
  if getgenv().TPPlace == "Note 1" then
    Teleport(game:GetService("Workspace").Notes.Note1.CFrame)
   elseif getgenv().TPPlace == "Note 2" then
    Teleport(game:GetService("Workspace").Notes.Note2.CFrame)
      elseif getgenv().TPPlace == "Note 3" then
        Teleport(game:GetService("Workspace").Notes.Note3.CFrame)
      elseif getgenv().TPPlace == "Note 4" then
        Teleport(game:GetService("Workspace").Notes.Note4.CFrame)
       elseif getgenv().TPPlace == "Note 5" then
        Teleport(game:GetService("Workspace").Notes.Note5.CFrame)
        elseif getgenv().TPPlace == "Note 6" then
          Teleport(game:GetService("Workspace").Notes.Note6.CFrame)
        elseif getgenv().TPPlace == "Note 7" then
          Teleport(game:GetService("Workspace").Notes.Note7.CFrame)
        elseif getgenv().TPPlace == "Note 8" then
          Teleport(game:GetService("Workspace").Notes.Note8.CFrame)
   end
  end
end)

local x = PhantomForcesWindow:NewSection("XENON HUB")
