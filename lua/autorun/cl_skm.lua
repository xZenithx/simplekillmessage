if not CLIENT then return end

gameevent.Listen("entity_killed")
hook.Add("entity_killed", "skm_entitykilled", function(data)
    timer.Simple(0, function()
        local attacker = Entity(data.entindex_attacker)
        local victim = Entity(data.entindex_killed)

        if attacker ~= LocalPlayer() then return end

        if attacker == LocalPlayer() and victim ~= LocalPlayer() then
            local victimName = ""
            if victim:IsPlayer() then
                attackerName = victim:Name()
            elseif victim:IsNPC() then
                attackerName = "[NPC] " .. victim:GetNWString("Name", "Error: no name found")
            else
                attackerName = "Unknown attacker type"
            end
            chat.AddText(Color(154,172,184), "[SKM] You killed " .. attackerName)
        end
    end)
end)


print("[SKM] Loaded")