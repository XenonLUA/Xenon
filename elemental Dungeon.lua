local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "XenonHUB", HidePremium = false, SaveConfig = true, ConfigFolder = "XenonHUB"})

-- VARIABLES
getgenv().win = nil
getgenv().punch = nil

function win()
while getgenv().win do
local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PushEvent"):FireServer(unpack(args))
wait()
end
end

function punch()
while getgenv().punch do
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DamageIncreaseOnClickEvent"):FireServer()
wait(.000000000)
end
end


--Tabs
local XenTab = Window:MakeTab({
	Name = "Menu",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

XenTab:AddToggle({
	Name = "Auto Win Nearest",
	Default = false,
	Callback = function(Value)
	getgenv().win = Value
	win()
	end    
})

XenTab:AddToggle({
	Name = "Auto Punch",
	Default = false,
	Callback = function(Value)
	getgenv().punch = Value
	punch()
	end    
})







OrionLib:Init()
