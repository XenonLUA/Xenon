-- Configuration
local Debug = true -- Set this to true if you want debug output.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

shared.config = {
   adjustment = 3, -- // Keep this between 3 to 4 \\ --
   hit_range = 0.5, -- // You can mess around with this \\ --

   mode = 'Hold', -- // Hold , Toggle , Always \\ --
   deflect_type = 'Remote', -- // Key Press , Remote \\ --
   notifications = true,
   keybind = Enum.KeyCode.E
}

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local Balls = game:GetService("Workspace").Balls

-- Functions

local function print(...) -- Debug print.
    if Debug then
        warn(...)
    end
end

local function VerifyBall(Ball) -- Returns nil if the ball isn't a valid projectile; true if it's the right ball.
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end

local function IsTarget() -- Returns true if we are the current target.
    return (Player.Character and Player.Character:FindFirstChild("Highlight"))
end

local function Parry() -- Parries.
    Remotes:WaitForChild("ParryButtonPress"):Fire()
end

-- Function to check if the ball was parried
local function BallWasParried(Ball)
    -- Replace this condition with your logic to check if the ball was parried
    return Ball:FindFirstChild("Highlight") and Ball.Highlight.BrickColor == BrickColor.new("Bright red")
end

-- Function to delay and retry parrying
local function DelayedRetryParry(Ball)
    wait(0.1) -- Wait for 0.75 seconds before retrying
    if not BallWasParried(Ball) then
        DeflectBall() -- Retry parrying
    end
end

-- The actual code

local IsTargeted = false
local CanHit = false

local function Target(Character)
    Character.ChildAdded:Connect(function(child)
        if child.Name == "Highlight" then
            IsTargeted = true
        end
    end)
    Character.ChildRemoved:Connect(function(child)
        if child.Name == "Highlight" then
            IsTargeted = false
        end
    end)
end

function DetectBall()
    local Ball = FindBall()
    
  	if Ball then
        local BallVelocity = Ball.Velocity.Magnitude
        local BallPosition = Ball.Position
  
        local PlayerPosition = LocalPlayer.Character.HumanoidRootPart.Position
  
        local Distance = (BallPosition - PlayerPosition).Magnitude
        local PingAccountability = BallVelocity * (game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000)
  
        Distance -= PingAccountability
        Distance -= shared.config.adjustment
  
        local Hit = Distance / BallVelocity
  
        if Hit <= shared.config.hit_range then
            return true
        end
    end
    return false
end

local function DeflectBall()
    if IsTargeted and DetectBall() then
        if shared.deflect_type == 'Key Press' then
            keypress(0x46)
        else
            Remotes.ParryButtonPress:Fire()
        end

        -- Check if the ball was parried and retry if necessary
        if not BallWasParried(Balls) then
            -- If the player gets into close combat, disable retrying until they move away
            if not IsPlayerInCloseCombat() then
                DelayedRetryParry(Balls)
            end
        end
    end
end

-- Modify the existing IsPlayerInCloseCombat function to suit your needs
local function IsPlayerInCloseCombat()
    -- Replace this with your logic to check if the player is in close combat.
    -- For example, you can check the distance between the player and the ball.
    local CloseCombatDistance = 5 -- You can adjust this distance as needed
    local Ball = (#Balls:GetChildren() > 0 and Balls:GetChildren()[1])
    
    if Ball then
        local BallPosition = Ball.Position
        local PlayerPosition = Player.Character.HumanoidRootPart.Position
        local Distance = (BallPosition - PlayerPosition).Magnitude

        return Distance <= CloseCombatDistance
    end
    
    return false
end

local RemoteSpamming = false

local function CheckDistance()
    while RemoteSpamming do
        if not IsTargeted or not DetectBall() then
            RemoteSpamming = false
            print("Stopped remote spam")
        else
            DeflectBall()
        end
        wait() -- No change to the delay here
    end
end

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(Input, IsTyping)
    if IsTyping then return end
    if shared.mode == 'Toggle' and Input.KeyCode == shared.keybind then
        CanHit = not CanHit
        if shared.notifications then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Blade Ball",
                Text = CanHit and 'Enabled!' or 'Disabled!',
            })
        end
    elseif shared.mode == 'Hold' and Input.KeyCode == shared.keybind and shared.notifications then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Blade Ball",
            Text = 'Holding keybind!',
        })
    end
end)

UserInputService.InputEnded:Connect(function(Input, IsTyping)
    if IsTyping then return end
    if shared.mode == 'Hold' and Input.KeyCode == shared.keybind and shared.notifications then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Blade Ball",
            Text = 'No longer holding keybind!',
        })
    end
end)

-- Initialize the character
local function Initialize()
    local character = Player.Character or Player.CharacterAdded:Wait()
    Target(character)
end

-- Initial setup when the script runs
Initialize()

-- Handle re-initialization if the character respawns
Player.CharacterAdded:Connect(Initialize)

-- The combined ChildAdded event
Balls.ChildAdded:Connect(function(Ball)
    if not VerifyBall(Ball) then
        return
    end

    print("Ball Spawned: " .. Ball.Name)

    local OldPosition = Ball.Position
    local OldTick = tick()

    Ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() then -- No need to do the math if we're not being attacked.
            local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
            local Velocity = (OldPosition - Ball.Position).Magnitude

            print("Distance: " .. Distance)
            print("Velocity: " .. Velocity)
            print("Time: " .. Distance / Velocity)

            if (Distance / Velocity) <= 20 then
                Parry()
            end
        end

        if (tick() - OldTick >= 1/60) then
            OldTick = tick()
            OldPosition = Ball.Position
        end
    end)
end)

-- The final notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Blade Ball Auto Parry V2",
    Text = 'By Xenon.',
})

coroutine.wrap(CheckDistance)()