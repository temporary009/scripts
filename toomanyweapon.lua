-- Create the main GUI container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the main frame (the window)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 400)  -- Adjust size to fit your needs
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)  -- Centered on screen
MainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)  -- Dark grey background
MainFrame.Parent = ScreenGui

-- Create the title label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.Text = "Too Many Weapons by master"
TitleLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)  -- Darker grey
TitleLabel.TextColor3 = Color3.new(1, 1, 1)  -- White text
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 24
TitleLabel.Parent = MainFrame

-- Create a button for "Kill All"
local KillAllButton = Instance.new("TextButton")
KillAllButton.Size = UDim2.new(0, 280, 0, 50)
KillAllButton.Position = UDim2.new(0, 10, 0, 60)
KillAllButton.Text = "Kill All"
KillAllButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)  -- Red button
KillAllButton.TextColor3 = Color3.new(1, 1, 1)
KillAllButton.Font = Enum.Font.SourceSans
KillAllButton.TextSize = 20
KillAllButton.Parent = MainFrame

-- Function for Kill All
local rs = game:GetService("ReplicatedStorage")
local hit = rs.EnemyGetHit
local damageAmount = 1000  -- Default damage

KillAllButton.MouseButton1Click:Connect(function()
    for _, enemy in ipairs(game.Workspace.Enemies.dungeon:GetChildren()) do
        hit:FireServer(enemy, damageAmount, true, "item6_rarity1")
    end
end)

-- Create a checkbox for "Loop Kill All"
local LoopKillAllButton = Instance.new("TextButton")
LoopKillAllButton.Size = UDim2.new(0, 280, 0, 50)
LoopKillAllButton.Position = UDim2.new(0, 10, 0, 120)
LoopKillAllButton.Text = "Loop Kill All"
LoopKillAllButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)  -- Green button
LoopKillAllButton.TextColor3 = Color3.new(1, 1, 1)
LoopKillAllButton.Font = Enum.Font.SourceSans
LoopKillAllButton.TextSize = 20
LoopKillAllButton.Parent = MainFrame

-- Loop kill toggle
local isLooping = false
LoopKillAllButton.MouseButton1Click:Connect(function()
    isLooping = not isLooping  -- Toggle on/off
    LoopKillAllButton.Text = isLooping and "Stop Loop Kill All" or "Loop Kill All"
    while isLooping do
        for _, enemy in ipairs(game.Workspace.Enemies.dungeon:GetChildren()) do
            hit:FireServer(enemy, damageAmount, true, "item6_rarity1")
        end
        wait(0.1)
    end
end)

-- Create a label for showing the current damage amount
local DamageLabel = Instance.new("TextLabel")
DamageLabel.Size = UDim2.new(1, 0, 0, 50)
DamageLabel.Position = UDim2.new(0, 0, 0, 180)
DamageLabel.Text = "Current Damage: 1000"
DamageLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
DamageLabel.TextColor3 = Color3.new(1, 1, 1)
DamageLabel.Font = Enum.Font.SourceSans
DamageLabel.TextSize = 20
DamageLabel.Parent = MainFrame

-- Create an "Increase Damage" button
local IncreaseDamageButton = Instance.new("TextButton")
IncreaseDamageButton.Size = UDim2.new(0, 140, 0, 50)
IncreaseDamageButton.Position = UDim2.new(0, 10, 0, 240)
IncreaseDamageButton.Text = "Increase Damage (+500)"
IncreaseDamageButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.8)  -- Blue button
IncreaseDamageButton.TextColor3 = Color3.new(1, 1, 1)
IncreaseDamageButton.Font = Enum.Font.SourceSans
IncreaseDamageButton.TextSize = 18
IncreaseDamageButton.Parent = MainFrame

-- Create a "Decrease Damage" button
local DecreaseDamageButton = Instance.new("TextButton")
DecreaseDamageButton.Size = UDim2.new(0, 140, 0, 50)
DecreaseDamageButton.Position = UDim2.new(0, 160, 0, 240)  -- Placed next to Increase button
DecreaseDamageButton.Text = "Decrease Damage (-500)"
DecreaseDamageButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)  -- Red button
DecreaseDamageButton.TextColor3 = Color3.new(1, 1, 1)
DecreaseDamageButton.Font = Enum.Font.SourceSans
DecreaseDamageButton.TextSize = 18
DecreaseDamageButton.Parent = MainFrame

-- Functionality for increasing and decreasing damage
IncreaseDamageButton.MouseButton1Click:Connect(function()
    damageAmount = math.min(damageAmount + 500, 5000)  -- Max 5000
    DamageLabel.Text = "Current Damage: " .. tostring(damageAmount)
end)

DecreaseDamageButton.MouseButton1Click:Connect(function()
    damageAmount = math.max(damageAmount - 500, 500)  -- Min 500
    DamageLabel.Text = "Current Damage: " .. tostring(damageAmount)
end)
