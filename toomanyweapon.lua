local rs = game:GetService("ReplicatedStorage")
local hit = rs.EnemyGetHit
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/temporary009/scripts/refs/heads/main/guilib.lua", true))()
local Flags = Library.Flags
local Window = Library:Window({
    Text = "❤",
    Size = UDim2.new(0, 250, 0, 150)
})
local Tab = Window:Tab({
    Text = "Too Many Weapons by master"
})
local Section = Tab:Section({
    Text = "Exploit"
})

Section:Button({
    Text = "Kill All",
    Callback = function()
        for _, enemy in ipairs(game.Workspace.Enemies.dungeon:GetChildren()) do
            hit:FireServer(enemy, _G.damageAmount or 100, true, "item6_rarity1")
        end
    end
})

Section:Check({
    Text = "Loop Kill All",
    Callback = function(bool)
        _G.kill = bool
        while _G.kill do
            for _, enemy in ipairs(game.Workspace.Enemies.dungeon:GetChildren()) do
                hit:FireServer(enemy, _G.damageAmount or 100, true, "item6_rarity1")
            end
            wait(0.1)
        end
    end
})

Section:Slider({
    Text = "Damage Amount",
    Minimum = 500,
    Maximum = 5000,
    Default = 1000,
    Callback = function(value)
        _G.damageAmount = value
    end
})

Tab:Select()
