function OnBlockToPickups(World, Digger, BlockX, BlockY, BlockZ, BlockType, BlockMeta, Pickups)
    if (Digger == nil) then
        return false
    elseif (Digger:IsPlayer()) then
        PlayerDigger = tolua.cast(Digger,"cPlayer")
        job = UsersIni:GetValue(PlayerDigger:GetName(),   "Job")
        if (job == "farmer") then
            if (BlockType == E_BLOCK_CROPS) or (BlockType == E_BLOCK_POTATOES) or (BlockType == E_BLOCK_CARROTS) then
                item1 = Pickups:Get(0).m_ItemType
                amount1 = Pickups:Get(0).m_ItemCount
                if (item1 == E_ITEM_WHEAT) then
                    Coiny:Call("GiveMoney", PlayerDigger:GetName(), 4)
                    return false   
                elseif (item1 == E_ITEM_POTATO) then
                    if (amount1 > 1) then
                        result = amount1 * 2
                        Coiny:Call("GiveMoney", PlayerDigger:GetName(), result)
                        return false       
                    end     
                elseif (item1 == E_ITEM_CARROT) then
                    if (amount1 > 1) then
                        result = amount1 * 2
                        Coiny:Call("GiveMoney", PlayerDigger:GetName(), result)
                        return false       
                    end     
                end
            end
        end
    end
end

function OnPlayerBrokenBlock(Player, BlockX, BlockY, BlockZ, BlockFace, BlockType, BlockMeta)
    World = Player:GetWorld()
    job = UsersIni:GetValue(Player:GetName(),   "Job")
    if (job == "miner") then
        if (BlockType == E_BLOCK_COAL_ORE) then
            Coiny:Call("GiveMoney", Player:GetName(), 10)
        elseif (BlockType == E_BLOCK_DIAMOND_ORE) or (BlockType == E_BLOCK_EMERALD_ORE) then
            Coiny:Call("GiveMoney", Player:GetName(), 200)
        elseif (BlockType == E_BLOCK_LAPIS_ORE) then
            Coiny:Call("GiveMoney", Player:GetName(), 50)
        elseif (BlockType == E_BLOCK_NETHER_QUARTZ_ORE) then
            Coiny:Call("GiveMoney", Player:GetName(), 5)
        elseif (BlockType == E_BLOCK_REDSTONE_ORE) or (BlockType == E_BLOCK_REDSTONE_ORE_GLOWING) then
            Coiny:Call("GiveMoney", Player:GetName(), 20)
        elseif (BlockType == E_BLOCK_IRON_ORE) or (BlockType == E_BLOCK_GOLD_ORE) then
            Coiny:Call("GiveMoney", Player:GetName(), 30) 
        end
    elseif (job == "treecutter") then
        if (BlockType == E_BLOCK_LOG) or (BlockType == E_BLOCK_NEW_LOG) then
            Coiny:Call("GiveMoney", Player:GetName(), 2)   
        end
    elseif (job == "farmer") then
        if (BlockType == E_BLOCK_PUMPKIN) or (BlockType == E_BLOCK_MELON) then
            Coiny:Call("GiveMoney", Player:GetName(), 10)
        elseif (BlockType == E_BLOCK_SUGARCANE) then
            if (World:GetBlock(BlockX, BlockY + 1, BlockZ) == E_BLOCK_SUGARCANE) and (World:GetBlock(BlockX, BlockY + 2, BlockZ) == E_BLOCK_SUGARCANE) then
                Coiny:Call("GiveMoney", Player:GetName(), 6)
            elseif (World:GetBlock(BlockX, BlockY + 1, BlockZ) == E_BLOCK_SUGARCANE) then
                Coiny:Call("GiveMoney", Player:GetName(), 4)
            else
                Coiny:Call("GiveMoney", Player:GetName(), 2)
            end
        end   
    end 
end  

function OnKilling(Victim, Killer)
    if Killer == nil then
            return false
    end
    if Killer:IsPlayer() then
        Player = tolua.cast(Killer,"cPlayer")
        job = UsersIni:GetValue(Player:GetName(),   "Job")
            if (job == "hunter") then
                if Victim:IsMob() then
                    if (Victim:IsA("cChicken")) or (Victim:IsA("cCow")) or (Victim:IsA("cHorse")) or (Victim:IsA("cMooshroom")) or (Victim:IsA("cCow")) or (Victim:IsA("cOcelot")) or (Victim:IsA("cPig")) or (Victim:IsA("cSheep")) or (Victim:IsA("cSquid")) or (Victim:IsA("cWolf")) then
                        Coiny:Call("GiveMoney", Player:GetName(), 10)
                    elseif (Victim:IsA("cSlime")) or (Victim:IsA("cMagmaCube")) then
                        Coiny:Call("GiveMoney", Player:GetName(), 20)
                    elseif (Victim:IsA("cBlaze")) then
                        Coiny:Call("GiveMoney", Player:GetName(), 100)          
                    elseif (Victim:IsA("cEnderDragon")) then
                        Coiny:Call("GiveMoney", Player:GetName(), 500)       
                    elseif (Victim:IsA("cWither")) then
                        Coiny:Call("GiveMoney", Player:GetName(), 200)    
                    else
                        Coiny:Call("GiveMoney", Player:GetName(), 10)       
                    end
                end
            end
        return false
    end
end

function OnPlayerPlacedBlock(Player, BlockX, BlockY, BlockZ, BlockFace, CursorX, CursorY, CursorZ, BlockType, BlockMeta)
    job = UsersIni:GetValue(Player:GetName(),   "Job")
    if (job == "miner") then
        if (BlockType == E_BLOCK_IRON_ORE) or (BlockType == E_BLOCK_GOLD_ORE) then
            Coiny:Call("TakeMoney", Player:GetName(), 30) 
        end
    elseif (job == "farmer") then
        if (BlockType == E_BLOCK_PUMPKIN) or (BlockType == E_BLOCK_MELON) then
            Coiny:Call("TakeMoney", Player:GetName(), 10)
        elseif (BlockType == E_BLOCK_SUGARCANE) then
            Coiny:Call("TakeMoney", Player:GetName(), 4)
        end   
    elseif (job == "treecutter") then
        if (BlockType == E_BLOCK_LOG) or (BlockType == E_BLOCK_NEW_LOG) then
            Coiny:Call("TakeMoney", Player:GetName(), 2)
        end   
    end 
end
