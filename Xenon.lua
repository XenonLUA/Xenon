-- Create a nametag above a player's head using a text label

local Players = game:GetService("Players")

local function CreateNametag(player)
  local textLabel = Instance.new("TextLabel")
  textLabel.Parent = player.Character.Head
  textLabel.Position = UDim2.new(0, 0, 0, 0)
  textLabel.Size = UDim2.new(1, 0, 1, 0)
  textLabel.Text = player.Name
  textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  textLabel.BackgroundTransparency = 1
  textLabel.ZIndex = 10
end

for _, player in ipairs(Players:GetPlayers()) do
  CreateNametag(player)
end

Players.PlayerAdded:Connect(function(player)
  CreateNametag(player)
end)
