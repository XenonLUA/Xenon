local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
	
	local PhantomForcesWindow = Library:NewWindow("NightLight")
	local x = PhantomForcesWindow:NewSection("Main")

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
  RunService.RenderStepped:Connect(function()
    for i,v in pairs(game:GetService("Workspace").Notes:GetChildren()) do
        if not v:FindFirstChild("ESP") then
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")


    BillboardGui.Parent = v
    BillboardGui.Active = true
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(5, 0, 5, 0)
    BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
    BillboardGui.Name = "ESP"

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.ZIndex = 10
    TextLabel.Font = Enum.Font.Arial
    TextLabel.Text = v.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 20.000
    TextLabel.TextWrapped = true
    TextLabel.Name = "Text"
        end
    end
end)
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

local x = PhantomForcesWindow:NewSection("XENON HUB")
