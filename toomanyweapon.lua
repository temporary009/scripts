local rs = game:GetService("ReplicatedStorage")
local hit = rs.EnemyGetHit
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/agreed69-scripts/scripts/refs/heads/main/pphud%20fix.lua", true))() -- Not made by me but I fixed it and added size option
local Flags = Library.Flags
local Window = Library:Window({
    Text = "❤",
    Size = UDim2.new(0, 250, 0, 150)
})
local Tab = Window:Tab({
    Text = "Too Many Weapons by Agreed69"
})
local Section = Tab:Section({
    Text = "Exploit"
})

local damageAmount = 1000  -- Default damage amount

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

Section:Slider({
    Text = "Damage Amount",
    Min = 500,
    Max = 5000,
    Default = 1000,
    Callback = function(value)
        damageAmount = value
    end
})

Tab:Select()
