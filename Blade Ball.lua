-- Configuration
local Debug = true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")

local shared = {
    mode = 'Always',
    deflect_type = 'Remote',
    adjustment = 2.45, -- Adjusted for faster parrying and better long-range detection
    notifications = true,
    keybind = Enum.KeyCode.E
}

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local Balls = Workspace.Balls

-- Constants
local RETRY_DELAY = 0.35 -- The highest delay
local CLOSE_COMBAT_DELAY = 0.01 -- Delay when in close combat but not very close
local VERY_CLOSE_COMBAT_DELAY = 0 -- No delay when very close
local CLOSE_COMBAT_DISTANCE = 7 -- Activate close combat if the player is within 7 studs
local VERY_CLOSE_COMBAT_DISTANCE = 4.75 -- Considered very close
local MIN_DELAY = 0 -- The minimum delay

-- Functions

local function print(...) -- Debug print.
    if Debug then
        warn(...)
    end
end

local function VerifyBall(Ball)
    -- Returns nil if the ball isn't a valid projectile; true if it's the right ball.
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end

local function IsTarget()
    -- Returns true if we are the current target.
    return (Player.Character and Player.Character:FindFirstChild("Highlight"))
end

local function Parry()
    -- Parries.
    Remotes:WaitForChild("ParryButtonPress"):Fire()
end

-- Function to check if the ball was parried
local function BallWasParried(Ball)
    -- Replace this condition with your logic to check if the ball was parried
    return Ball:FindFirstChild("Highlight") and Ball.Highlight.FillColor == Color3.new(1, 0, 0)
end

-- Function to delay and retry parrying
local function DelayedRetryParry(Ball, delay)
    wait(delay)
    if not BallWasParried(Ball) then
        DeflectBall()
    end
end

-- IsPlayerInCloseCombat function
local function IsPlayerInCloseCombat()
    local Ball = (Balls:GetDescendants() > 0 and Balls:GetChildren()[1])

    if Ball then
        local BallPosition = Ball.Position
        local PlayerPosition = Player.Character.HumanoidRootPart.Position
        local Distance = (BallPosition - PlayerPosition).Magnitude
        local Direction = (BallPosition - PlayerPosition).Unit

        return Distance <= CLOSE_COMBAT_DISTANCE and Direction.Y > 0
    end

    return false
end


local function IsBallFrozen(Ball)
    return Ball.Anchored
end

local function DeflectBall()
    if IsTarget() and DetectBall() then
        if shared.deflect_type == 'Key Press' then
            UserInputService.InputSimulator:KeyDown(shared.keybind)
            UserInputService.InputSimulator:KeyUp(shared.keybind)
        else
            Remotes.ParryButtonPress:Fire()
        end

        -- Check if the ball was parried and retry if necessary
        local delay = RETRY_DELAY

        if IsPlayerInCloseCombat() then
            local Ball = (Balls:GetDescendants() > 0 and Balls:GetDescendants()[1])

            if Ball then
                local BallPosition = Ball.Position
                local PlayerPosition = Player.Character.HumanoidRootPart.Position
                local Distance = (BallPosition - PlayerPosition).Magnitude

                if Distance <= VERY_CLOSE_COMBAT_DISTANCE then
                    delay = VERY_CLOSE_COMBAT_DELAY -- No delay when very close to the ball
                elseif Distance <= CLOSE_COMBAT_DISTANCE then
                    delay = CLOSE_COMBAT_DELAY -- Short delay when in close combat but not very close
                else
                    delay = MIN_DELAY -- Minimum delay when in close combat but not very close
                end

                -- Immediate parry attempt in close combat
                if delay == MIN_DELAY then
                    while IsPlayerInCloseCombat() and DetectBall() and IsTarget() do
                        DeflectBall()
                    end
                else
                    DelayedRetryParry(Balls, delay)
                end
            end
        end
    end
end

-- DetectBall function
local function DetectBall()
    local Ball = (Balls:GetDescendants() > 0 and Balls:GetChildren()[1]) or (Balls.ChildAdded:Wait() and Balls:GetChildren()[1])

    local BallVelocity = Ball.Velocity.Magnitude
    local BallPosition = Ball.Position

    local PlayerPosition = Player.Character.HumanoidRootPart.Position
    local PlayerVelocity = Player.Character.HumanoidRootPart.Velocity.Magnitude

    local Distance = (BallPosition - PlayerPosition).Magnitude
    local Adjustment = BallVelocity * (game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())

    Distance = Distance - Adjustment
    Distance = Distance - shared.adjustment

    local Hit = 0.15 -- More accurate ball detection

    -- Consider the ball's direction and velocity
    if Ball.Velocity.Y > 0 then
        Hit = Hit * 0.75
    end

    if PlayerVelocity.Y > 0 then
        Hit = Hit * 0.85
    end

    -- Consider the player's ping
    Hit = Hit * (1 - (game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000))

    return Hit <= Distance / BallVelocity
end

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

local function CheckDistance()
    local IsTargeted = false
    local CanHit = false

    while true do
        -- Continuously check for close combat
        if IsPlayerInCloseCombat() then
            -- Activate close combat mode with no delay
            DeflectBall()
        elseif not IsTargeted or not DetectBall() then
            RemoteSpamming = false
            print("Stopped remote spam")
        else
            DeflectBall()
        end
        wait(0) -- No change to the delay here
    end
end

-- Event handlers
UserInputService.InputBegan:Connect(function(Input, IsTyping)
    if IsTyping then return end
    if shared.mode == 'Toggle' and Input.KeyCode == shared.keybind then
        CanHit = not CanHit
        if shared.notifications then
            StarterGui:SetCore("SendNotification", {
                Title = "Blade Ball",
                Text = CanHit and 'Enabled Auto Parry.' or 'Disabled Auto Parry.',
            })
        end
    elseif shared.mode == 'Hold' and Input.KeyCode == shared.keybind and shared.notifications then
        StarterGui:SetCore("SendNotification", {
            Title = "Blade Ball",
            Text = 'Holding keybind!',
        })
    end
end)

UserInputService.InputEnded:Connect(function(Input, IsTyping)
    if IsTyping then return end
    if shared.mode == 'Hold' and Input.KeyCode == shared.keybind and shared.notifications then
        StarterGui:SetCore("SendNotification", {
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

    -- If the player is very close to the new ball when it spawns, immediately parry it
    if IsTarget() and DetectBall() and IsPlayerInCloseCombat() then
        DeflectBall()
    end

    local OldPosition = Ball.Position
    local OldTick = tick()

    Ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() then
            local Distance = (Ball.Position - Workspace.CurrentCamera.Focus.Position).Magnitude
            local Velocity = (OldPosition - Ball.Position).Magnitude

            print("Distance: " .. Distance)
            print("Velocity: " .. Velocity)
            print("Time: " .. Distance / Velocity)

            if (Distance / Velocity) <= 10 then
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
StarterGui:SetCore("SendNotification", {
    Title = "Blade Ball Auto Parry",
    Text = 'By "Xenon" on discord. Mobile Version.',
})

-- Start checking for distance
coroutine.wrap(CheckDistance)()
