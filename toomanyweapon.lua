local rs = game:GetService("ReplicatedStorage")
local hit = rs.EnemyGetHit
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/agreed69-scripts/scripts/refs/heads/main/pphud%20fix.lua", true))() -- Not made by me but I fixed it and added size option
local Flags = Library.Flags
local Window = Library:Window({
    Text = "❤",
    Size = UDim2.new(0, 250, 0, 250),
    Scrollable = true  -- Enable scrolling
})
local Tab = Window:Tab({
    Text = "Too Many Weapons by master"
})
local Section = Tab:Section({
    Text = "Exploit - Current Damage: 1000"  -- Initial text for damage amount
})

local damageAmount = 1000  -- Default damage amount

-- Function to update damage display (this will update the section text instead of adding new labels)
local function updateDamageDisplay()
    Section:SetText("Exploit - Current Damage: " .. damageAmount)  -- Update the section text
end

Section:Button({
    Text = "Kill All",
    Callback = function()
        for _, enemy in ipairs(game.Workspace.Enemies.dungeon:GetChildren()) do
            hit:FireServer(enemy, damageAmount, true, "item6_rarity1")
        end
    end
})

Section:Check({
    Text = "Loop Kill All",
    Callback = function(bool)
        while bool do
            for _, enemy in ipairs(game.Workspace.Enemies.dungeon:GetChildren()) do
                hit:FireServer(enemy, damageAmount, true, "item6_rarity1")
            end
            wait(0.1)
        end
    end
})

-- Manual positioning for side-by-side buttons
-- Increase Damage Button
Section:Button({
    Text = "Increase Damage (+500)",
    Size = UDim2.new(0, 110, 0, 30),  -- Set size of the button
    Position = UDim2.new(0, 0, 0, 100),  -- Adjust positioning
    Callback = function()
        damageAmount = math.min(damageAmount + 500, 5000)  -- Max is 5000
        updateDamageDisplay()
    end
})

-- Decrease Damage Button
Section:Button({
    Text = "Decrease Damage (-500)",
    Size = UDim2.new(0, 110, 0, 30),  -- Set size of the button
    Position = UDim2.new(0, 120, 0, 100),  -- Position it next to the Increase button
    Callback = function()
        damageAmount = math.max(damageAmount - 500, 500)  -- Min is 500
        updateDamageDisplay()
    end
})

-- Display the initial damage amount
updateDamageDisplay()

Tab:Select()
