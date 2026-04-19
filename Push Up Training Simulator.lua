local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

-- ambil remote train
local TrainRemote = ReplicatedStorage:WaitForChild("Packages")
    :WaitForChild("_Index")
    :WaitForChild("sleitnick_knit@1.5.1")
    :WaitForChild("knit")
    :WaitForChild("Services")
    :WaitForChild("TrainService")
    :WaitForChild("RE")
    :WaitForChild("Train")

-- ambil remote rebirth
local RebirthRemote = ReplicatedStorage:WaitForChild("Packages")
    :WaitForChild("_Index")
    :WaitForChild("sleitnick_knit@1.5.1")
    :WaitForChild("knit")
    :WaitForChild("Services")
    :WaitForChild("RebirthService")
    :WaitForChild("RF")
    :WaitForChild("Rebirth")

-- ambil remote equip best pets
local EquipBestPetsRemote = ReplicatedStorage:WaitForChild("Packages")
    :WaitForChild("_Index")
    :WaitForChild("sleitnick_knit@1.5.1")
    :WaitForChild("knit")
    :WaitForChild("Services")
    :WaitForChild("PetService")
    :WaitForChild("RE")
    :WaitForChild("EquipBestPets")

-- status toggle
local autoTrain = false
local autoRebirth = false
local autoEquipPets = false
local antiAFK = false

-- fungsi train
local function doTrain()
    TrainRemote:FireServer()
end

-- fungsi rebirth
local function doRebirth()
    RebirthRemote:InvokeServer()
end

-- fungsi equip pets
local function doEquipPets()
    EquipBestPetsRemote:FireServer()
end

-- loop heartbeat
RunService.Heartbeat:Connect(function()
    if autoTrain then
        doTrain()
    end
    if autoRebirth then
        doRebirth()
    end
    if autoEquipPets then
        doEquipPets()
    end
end)

-- anti afk handler
Player.Idled:Connect(function()
    if antiAFK then
        VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end
end)

-- buat UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoPanelUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Panel = Instance.new("Frame", ScreenGui)
Panel.Size = UDim2.new(0, 250, 0, 240)
Panel.Position = UDim2.new(0, 10, 0, 10)
Panel.BackgroundColor3 = Color3.fromRGB(0,0,0)
Panel.BorderSizePixel = 2
Panel.Active = true
Panel.Draggable = true
Instance.new("UICorner", Panel).CornerRadius = UDim.new(0,10)

local TogglePanel = Instance.new("TextButton", Panel)
TogglePanel.Size = UDim2.new(0, 250, 0, 25)
TogglePanel.Position = UDim2.new(0,0,0,0)
TogglePanel.Text = "▲ Close Panel"
TogglePanel.BackgroundColor3 = Color3.fromRGB(30,30,30)
TogglePanel.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", TogglePanel).CornerRadius = UDim.new(0,8)

-- tombol auto train
local TrainButton = Instance.new("TextButton", Panel)
TrainButton.Size = UDim2.new(0, 230, 0, 40)
TrainButton.Position = UDim2.new(0,10,0,35)
TrainButton.Text = "Auto Train: OFF"
TrainButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
TrainButton.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", TrainButton).CornerRadius = UDim.new(0,8)

-- tombol auto rebirth
local RebirthButton = Instance.new("TextButton", Panel)
RebirthButton.Size = UDim2.new(0, 230, 0, 40)
RebirthButton.Position = UDim2.new(0,10,0,80)
RebirthButton.Text = "Auto Rebirth: OFF"
RebirthButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
RebirthButton.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", RebirthButton).CornerRadius = UDim.new(0,8)

-- tombol auto equip pets
local EquipPetsButton = Instance.new("TextButton", Panel)
EquipPetsButton.Size = UDim2.new(0, 230, 0, 40)
EquipPetsButton.Position = UDim2.new(0,10,0,125)
EquipPetsButton.Text = "Auto Equip Pets: OFF"
EquipPetsButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
EquipPetsButton.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", EquipPetsButton).CornerRadius = UDim.new(0,8)

-- tombol anti afk
local AntiAFKButton = Instance.new("TextButton", Panel)
AntiAFKButton.Size = UDim2.new(0, 230, 0, 40)
AntiAFKButton.Position = UDim2.new(0,10,0,170)
AntiAFKButton.Text = "Anti AFK: OFF"
AntiAFKButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
AntiAFKButton.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", AntiAFKButton).CornerRadius = UDim.new(0,8)

-- label youtube
local Label = Instance.new("TextLabel", Panel)
Label.Size = UDim2.new(0, 230, 0, 30)
Label.Position = UDim2.new(0,10,0,210)
Label.BackgroundTransparency = 1
Label.TextColor3 = Color3.fromRGB(255,255,255)
Label.Text = "Youtube = Kitsune_Lucky18"
Label.TextScaled = true

-- logic tombol train
TrainButton.MouseButton1Click:Connect(function()
    autoTrain = not autoTrain
    TrainButton.Text = autoTrain and "Auto Train: ON" or "Auto Train: OFF"
    TrainButton.BackgroundColor3 = autoTrain and Color3.fromRGB(0,100,0) or Color3.fromRGB(100,0,0)
end)

-- logic tombol rebirth
RebirthButton.MouseButton1Click:Connect(function()
    autoRebirth = not autoRebirth
    RebirthButton.Text = autoRebirth and "Auto Rebirth: ON" or "Auto Rebirth: OFF"
    RebirthButton.BackgroundColor3 = autoRebirth and Color3.fromRGB(0,100,0) or Color3.fromRGB(100,0,0)
end)

-- logic tombol equip pets
EquipPetsButton.MouseButton1Click:Connect(function()
    autoEquipPets = not autoEquipPets
    EquipPetsButton.Text = autoEquipPets and "Auto Equip Pets: ON" or "Auto Equip Pets: OFF"
    EquipPetsButton.BackgroundColor3 = autoEquipPets and Color3.fromRGB(0,100,0) or Color3.fromRGB(100,0,0)
end)

-- logic tombol anti afk
AntiAFKButton.MouseButton1Click:Connect(function()
    antiAFK = not antiAFK
    AntiAFKButton.Text = antiAFK and "Anti AFK: ON" or "Anti AFK: OFF"
    AntiAFKButton.BackgroundColor3 = antiAFK and Color3.fromRGB(0,100,0) or Color3.fromRGB(100,0,0)
end)

-- collapse/expand panel
local panelOpen = true
TogglePanel.MouseButton1Click:Connect(function()
    panelOpen = not panelOpen
    if panelOpen then
        Panel.Size = UDim2.new(0, 250, 0, 240)
        TogglePanel.Text = "▲ Close Panel"
        TrainButton.Visible = true
        RebirthButton.Visible = true
        EquipPetsButton.Visible = true
        AntiAFKButton.Visible = true
        Label.Visible = true
    else
        Panel.Size = UDim2.new(0, 250, 0, 25)
        TogglePanel.Text = "▼ Open Panel"
        TrainButton.Visible = false
        RebirthButton.Visible = false
        EquipPetsButton.Visible = false
        AntiAFKButton.Visible = false
        Label.Visible = false
    end
end)
