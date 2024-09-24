-- Buat GUI Utama
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoaderGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Buat Frame Utama
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

local gameImage = Instance.new("ImageLabel")
gameImage.Size = UDim2.new(0.3, 0, 0.3, 0)
gameImage.Position = UDim2.new(0.05, 0, 0.1, 0)
gameImage.BackgroundTransparency = 1
gameImage.Parent = mainFrame

local gameName = Instance.new("TextLabel")
gameName.Font = Enum.Font.SourceSansBold
gameName.TextSize = 30
gameName.TextColor3 = Color3.fromRGB(255, 255, 255)
gameName.BackgroundTransparency = 1
gameName.Position = UDim2.new(0.4, 0, 0.15, 0)
gameName.Size = UDim2.new(0.5, 0, 0.1, 0)
gameName.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Text = "Status: Waiting for action"
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextSize = 20
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.BackgroundTransparency = 1
statusLabel.Position = UDim2.new(0.4, 0, 0.3, 0)
statusLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
statusLabel.Parent = mainFrame

local updateDescriptionLabel = Instance.new("TextLabel")
updateDescriptionLabel.Font = Enum.Font.SourceSans
updateDescriptionLabel.TextSize = 18
updateDescriptionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
updateDescriptionLabel.BackgroundTransparency = 1
updateDescriptionLabel.Position = UDim2.new(0.4, 0, 0.5, 0)
updateDescriptionLabel.Size = UDim2.new(0.5, 0, 0.2, 0)
updateDescriptionLabel.Parent = mainFrame

local lastUpdateLabel = Instance.new("TextLabel")
lastUpdateLabel.Font = Enum.Font.SourceSans
lastUpdateLabel.TextSize = 20
lastUpdateLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
lastUpdateLabel.BackgroundTransparency = 1
lastUpdateLabel.Position = UDim2.new(0.4, 0, 0.4, 0)
lastUpdateLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
lastUpdateLabel.Parent = mainFrame

local loaderTitle = Instance.new("TextLabel")
loaderTitle.Text = "Xenon Loader"
loaderTitle.Font = Enum.Font.SourceSansBold
loaderTitle.TextSize = 25
loaderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
loaderTitle.BackgroundTransparency = 1
loaderTitle.Position = UDim2.new(0.35, 0, 0.05, 0)
loaderTitle.Size = UDim2.new(0.5, 0, 0.1, 0)
loaderTitle.Parent = mainFrame

local loadButton = Instance.new("TextButton")
loadButton.Text = "Load the script"
loadButton.Font = Enum.Font.SourceSansBold
loadButton.TextSize = 22
loadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
loadButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
loadButton.Size = UDim2.new(0.8, 0, 0.1, 0)
loadButton.Position = UDim2.new(0.1, 0, 0.8, 0)
loadButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)  
buttonCorner.Parent = loadButton

local function detectGameAndSetImage()
    local placeId = game.PlaceId

    if placeId == 11177482306 then
        print("Game Detected: Streetz War 2")
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Streetz War 2"
        lastUpdateLabel.Text = "Last Update: 04/09/2024"
        updateDescriptionLabel.Text = "Wait For Update.\n[+] Godmode!"
        getgenv().whscript = "Streetz War 2 Chat Bypass"
    elseif placeId == 205224386 then
        print("Game Detected: Hide and Seek Extreme")
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Hide and Seek Extreme"
        lastUpdateLabel.Text = "Last Update: 07/09/2024"
        updateDescriptionLabel.Text = "Updated.\n[+] Auto Collect Credit"
        getgenv().whscript = "Hide and Seek Extreme Chat Bypass"
    elseif placeId == 11276071411 then
        print("Game Detected: Be NPC or DIE!")
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Be NPC or DIE!"
        lastUpdateLabel.Text = "Last Update: 07/09/2024"
        updateDescriptionLabel.Text = "Wait For Update.\n"
        getgenv().whscript = "Be NPC or DIE! Chat Bypass"
    elseif placeId == 18768679013 then
        print("Game Detected: Every Click +1 Speed")
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Every Click +1 Speed"
        lastUpdateLabel.Text = "Last Update: 08/09/2024"
        updateDescriptionLabel.Text = "Wait for update"
        getgenv().whscript = "Every Click +1 Speed Chat Bypass"
    elseif placeId == 16981421605 then
        print("Game Detected: Reborn As Swordsman")
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Reborn As Swordsman"
        lastUpdateLabel.Text = "Last Update: 08/09/2024"
        updateDescriptionLabel.Text = "Updated.\n [+] Auto Join \n [+] Add Train 9-14 \n [+] Add Toggle Button For Mobile"
        getgenv().whscript = "Reborn As Swordsman Chat Bypass"
    elseif placeId == 9872472334 then
        print("Game Detected: Evade")
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Evade"
        lastUpdateLabel.Text = "Last Update: 08/09/2024"
        updateDescriptionLabel.Text = "Updated\n[+] Buy cola and use cola"
        getgenv().whscript = "Evade Chat Bypass"
    elseif placeId == 18619441869 then
        print("Game Detected: Pizzeria Tycoon 2")
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Pizzeria Tycoon 2"
        lastUpdateLabel.Text = "Last Update: 14/09/2024"
        updateDescriptionLabel.Text = "Wait for update"
        getgenv().whscript = "Pizzeria Tycoon 2 Chat Bypass"
    elseif placeId == 13926416231 then
        print("Game Detected: Ducky Army!")
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Ducky Army!"
        lastUpdateLabel.Text = "Last Update: 22/09/2024"
        updateDescriptionLabel.Text = "Wait for update"
        getgenv().whscript = "Ducky Army! Chat Bypass"
    elseif placeId == 1234567890 then
        print("Game Detected: Streetz war 2")
        gameImage.Image = "rbxassetid://YOUR_ASSET_ID_FOR_STREETZ_WAR_2"
        gameName.Text = "Streetz war 2"
        lastUpdateLabel.Text = "Last Update: 19/08/2024"
        updateDescriptionLabel.Text = "Wait for update"
        getgenv().whscript = "Streetz War 2 Chat Bypass"
    else
        print("Unknown Game ID or Unsupported Game!", placeId)
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Unknown Game"
        lastUpdateLabel.Text = "Last Update: N/A"
        updateDescriptionLabel.Text = "N/A"
        getgenv().whscript = "Unknown Game Chat Bypass"
    end
end

detectGameAndSetImage()

local function showLoadingScreen()
    -- Tampilkan GUI Loading
    local loadingScreenGui = Instance.new("ScreenGui")
    loadingScreenGui.Name = "LoadingGui"
    loadingScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local loadingBackground = Instance.new("ImageLabel")
    loadingBackground.Size = UDim2.new(0.3, 0, 0.3, 0)  -- Mengurangi ukuran background menjadi 30% dari layar
    loadingBackground.Position = UDim2.new(0.35, 0, 0.2, 0)  -- Posisikan agak di atas layar tengah
    loadingBackground.Image = "rbxassetid://101547663996049" -- Background dengan aset yang diberikan
    loadingBackground.BackgroundTransparency = 1
    loadingBackground.Parent = loadingScreenGui

    -- Teks "Loading" di bawah gambar
    local loadingLabel = Instance.new("TextLabel")
    loadingLabel.Text = "Loading"
    loadingLabel.Font = Enum.Font.SourceSansBold
    loadingLabel.TextSize = 30
    loadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    loadingLabel.BackgroundTransparency = 1
    loadingLabel.Position = UDim2.new(0.5, 0, 0.55, 0)
    loadingLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    loadingLabel.Size = UDim2.new(0.3, 0, 0.1, 0) 
    loadingLabel.Parent = loadingScreenGui

    local function animateLoadingText()
        local dotCount = 0
        while loadingScreenGui.Parent do
            loadingLabel.Text = "Loading" .. string.rep(".", dotCount)
            dotCount = (dotCount + 1) % 4 
            wait(0.5)
        end
    end

    spawn(animateLoadingText)
    return loadingScreenGui
end

loadButton.MouseButton1Click:Connect(function()
    statusLabel.Text = "Loading the script..."
    
    screenGui:Destroy()

    local loadingScreenGui = showLoadingScreen()

    wait(5)

    local placeId = game.PlaceId
    
    if placeId == 11177482306 then
        print("Loading script for Streetz War 2")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/XenonHUB/main/Script/streetz%20war%202.lua"))()
    elseif placeId == 205224386 then
        print("Loading script for Hide and Seek Extreme")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/XenonHUB/main/Script/Hide%20and%20seek%20Extreme.lua"))()
    elseif placeId == 11276071411 then
        print("Loading script for Be NPC or DIE!")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/XenonHUB/main/Script/be%20npc%20or%20die.lua"))()
    elseif placeId == 18768679013 then
        print("Loading script for Every Click +1 Speed")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/XenonHUB/main/Script/Every%20Click%20%2B1%20Speed.lua"))()
    elseif placeId == 16981421605 then
        print("Loading script for Reborn As Swordsman")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/XenonHUB/main/Script/Reborn%20a%20swordman.lua"))()
    elseif placeId == 9872472334 then
        print("Loading script for Evade")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/XenonHUB/main/Script/Evade.lua"))()
    elseif placeId == 18619441869 then
        print("Loading script for Pizzeria Tycoon 2")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/XenonHUB/main/Script/Pizzeria%20Tycoon%202.lua"))()
    elseif placeId == 13926416231 then
        print("Loading script for Ducky Army!")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/XenonHUB/refs/heads/main/Script/DuckArmy.lua"))()
    elseif placeId == 1234567890 then
        print("Loading script for Streetz war 2")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLoader/Loaders/main/Loader.lua"))()
    else
        print("Unknown Game ID or Unsupported Game!", placeId)
        gameImage.Image = "rbxassetid://101547663996049"
        gameName.Text = "Unknown Game"
        lastUpdateLabel.Text = "Last Update: N/A"
    end

    statusLabel.Text = "Script Loaded!"
    loadingScreenGui:Destroy()
end)

-- Removed the global assignment of whscript
-- getgenv().whscript = "Chat Bypass"

getgenv().webhookexecUrl = "https://discord.com/api/webhooks/1214531415568293959/PfBG06D8Z4U8PDPuDvWWwHAhcNfokKt3Z-DL025IZrrCcIzSPlyHbmejD9H_JSLgtpyz"
getgenv().ExecLogSecret = true
getgenv().idsss = "fdd3bbdc9554f43c65140baa02e1baf562b006"

local ui = gethui()
local folderName = "screen"
local folder = Instance.new("Folder")
folder.Name = folderName
folder.Parent = ui

local player = game:GetService("Players").LocalPlayer
local players = game:GetService("Players")
local userid = player.UserId
local gameid = game.PlaceId
local jobid = tostring(game.JobId)
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local deviceType = game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows and "PC 💻" or "Mobile 📱"
local snipePlay = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. gameid .. ", '" .. jobid .. "', player)"
local completeTime = os.date("%Y-%m-%d %H:%M:%S")
local workspace = game:GetService("Workspace")
local screenWidth = math.floor(workspace.CurrentCamera.ViewportSize.X)
local screenHeight = math.floor(workspace.CurrentCamera.ViewportSize.Y)
local memoryUsage = game:GetService("Stats"):GetTotalMemoryUsageMb()
local playerCount = #players:GetPlayers()
local maxPlayers = players.MaxPlayers
local health = player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or "N/A"
local maxHealth = player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.MaxHealth or "N/A"
local position = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position or "N/A"
local gameVersion = game.PlaceVersion
local pingValue = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("(%d+)")) or "N/A"

local function checkPremium()
    local success, response = pcall(function() return player.MembershipType end)
    return success and (response == Enum.MembershipType.None and "false" or "true") or "Failed to retrieve Membership:"
end

local url = getgenv().webhookexecUrl
local webhookids = getgenv().idsss
local data = {
    ["content"] = "@everyone",
    ['webhookid'] = webhookids, --ask playvora_1 to generate it
    ["embeds"] = {{
        ["title"] = "MADE BY Xennn EDITED BY XenonHUB | 🚀 **Script Execution Detected | Exec Log**",
        ["description"] = "*✅ One of the Script's has been Executed.(🍪COOKIE LOGGER IS PATCHED FOR NOW!):*",
        ["type"] = "rich",
        ["color"] = tonumber(0xe67e22),
        ["fields"] = {
            {["name"] = "🔍 **Script Info**", ["value"] = "```💻 Script Name: " .. (getgenv().whscript or "N/A") .. "\n⏰ Executed At: " .. completeTime .. "```", ["inline"] = false},
            {["name"] = "👤 **Player Details**", ["value"] = "```🧸 Username: " .. player.Name .. "\n📝 Display Name: " .. player.DisplayName .. "\n🆔 UserID: " .. userid .. "\n❤️ Health: " .. health .. " / " .. maxHealth .. "\n🔗 Profile: View Profile (https://www.roblox.com/users/" .. userid .. "/profile)```", ["inline"] = false},
            {["name"] = "📅 **Account Information**", ["value"] = "```🗓️ Account Age: " .. player.AccountAge .. " days\n💎 Premium Status: " .. checkPremium() .. "\n📅 Account Created: " .. os.date("%Y-%m-%d", os.time() - (player.AccountAge * 86400)) .. "```", ["inline"] = false},
            {["name"] = "🎮 **Game Details**", ["value"] = "```🏷️ Game Name: " .. gameName .. "\n🆔 Game ID: " .. gameid .. "\n🔗 Game Link (https://www.roblox.com/games/" .. gameid .. ")\n🔢 Game Version: " .. gameVersion .. "```", ["inline"] = false},
            {["name"] = "🕹️ **Server Info**", ["value"] = "```👥 Players in Server: " .. playerCount .. " / " .. maxPlayers .. "\n🕒 Server Time: " .. os.date("%H:%M:%S") .. "```", ["inline"] = true},
            {["name"] = "📡 **Network Info**", ["value"] = "```📶 Ping: " .. pingValue .. " ms```", ["inline"] = true},
            {["name"] = "🖥️ **System Info**", ["value"] = "```📺 Resolution: " .. screenWidth .. "x" .. screenHeight .. "\n🔍 Memory Usage: " .. memoryUsage .. " MB\n⚙️ Executor: " .. (identifyexecutor and identifyexecutor() or "Unknown") .. "```", ["inline"] = true},
            {["name"] = "📍 **Character Position Script**", ["value"] = "```game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(" .. tostring(position) .. "))```\n", ["inline"] = true},
            {["name"] = "🪧 **Join Script**", ["value"] = "```lua\n" .. snipePlay .. "```", ["inline"] = false}
        },
        ["thumbnail"] = {["url"] = "https://media.discordapp.net/attachments/1086950661016535172/1287118927142453330/xenon.jpg?ex=66f06269&is=66ef10e9&hm=a5c19f820d20d7c5adcf2516cc2cd192abc460adebdda5f237deeed2696c02b3&=&format=webp&width=1165&height=655"},
        ["footer"] = {["text"] = "Made by Xenon with ❤️ | " .. os.date("%Y-%m-%d %H:%M:%S"), ["icon_url"] = "https://media.discordapp.net/attachments/1086950661016535172/1287118927142453330/xenon.jpg?ex=66f06269&is=66ef10e9&hm=a5c19f820d20d7c5adcf2516cc2cd192abc460adebdda5f237deeed2696c02b3&=&format=webp&width=1165&height=655"}
    }}
}

local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}
local request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)
local success, response = pcall(function()
    return request({Url = url, Body = newdata, Method = "POST", Headers = headers})
end)

if not success then
    warn("HTTP request failed: " .. tostring(response))
end
