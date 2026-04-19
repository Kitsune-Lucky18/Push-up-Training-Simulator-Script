local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer

-- status toggle
local trainEnabled = false

-- function
local function sendTrain()
    local args = {{"Train_Request"}}
    RemoteEvent:FireServer(unpack(args))
end

-- loop heartbeat
RunService.Heartbeat:Connect(function()
    if trainEnabled then
        sendTrain()
    end
end)

-- create UI
local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))

-- main panel
local Panel = Instance.new("Frame", ScreenGui)
Panel.Size = UDim2.new(0, 250, 0, 120)
Panel.Position = UDim2.new(0, 10, 0, 10)
Panel.BackgroundColor3 = Color3.fromRGB(0,0,0)
Panel.BorderSizePixel = 2
Panel.Active = true
Panel.Draggable = true

-- rounded corners
local corner = Instance.new("UICorner", Panel)
corner.CornerRadius = UDim.new(0,10)

-- collapse/expand button
local TogglePanel = Instance.new("TextButton", Panel)
TogglePanel.Size = UDim2.new(0, 250, 0, 25)
TogglePanel.Position = UDim2.new(0,0,0,0)
TogglePanel.Text = "▲ Close Panel"
TogglePanel.BackgroundColor3 = Color3.fromRGB(30,30,30)
TogglePanel.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", TogglePanel).CornerRadius = UDim.new(0,8)

-- auto train button
local TrainButton = Instance.new("TextButton", Panel)
TrainButton.Size = UDim2.new(0, 230, 0, 40)
TrainButton.Position = UDim2.new(0,10,0,35)
TrainButton.Text = "Train_Request: OFF"
TrainButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
TrainButton.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", TrainButton).CornerRadius = UDim.new(0,8)

-- youtube label
local Label = Instance.new("TextLabel", Panel)
Label.Size = UDim2.new(0, 230, 0, 30)
Label.Position = UDim2.new(0,10,0,80)
Label.BackgroundTransparency = 1
Label.TextColor3 = Color3.fromRGB(255,255,255)
Label.Text = "Youtube = Kitsune_Lucky18"
Label.TextScaled = true

-- toggle logic
TrainButton.MouseButton1Click:Connect(function()
    trainEnabled = not trainEnabled
    if trainEnabled then
        TrainButton.Text = "Train_Request: ON"
        TrainButton.BackgroundColor3 = Color3.fromRGB(0,100,0)
    else
        TrainButton.Text = "Train_Request: OFF"
        TrainButton.BackgroundColor3 = Color3.fromRGB(100,0,0)
    end
end)

-- collapse/expand logic
local panelOpen = true
TogglePanel.MouseButton1Click:Connect(function()
    panelOpen = not panelOpen
    if panelOpen then
        Panel.Size = UDim2.new(0, 250, 0, 120)
        TogglePanel.Text = "▲ Close Panel"
        TrainButton.Visible = true
        Label.Visible = true
    else
        Panel.Size = UDim2.new(0, 250, 0, 25)
        TogglePanel.Text = "▼ Open Panel"
        TrainButton.Visible = false
        Label.Visible = false
    end
end)
