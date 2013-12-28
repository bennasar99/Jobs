-- TODO: Give money --

function OnBlockToPickups(World, Digger, BlockX, BlockY, BlockZ, BlockType, BlockMeta, Pickups)
    -- TODO: if player is miner --
        if (BlockType == E_BLOCK_COAL_ORE) then

        elseif (BlockType == E_BLOCK_DIAMOND_ORE) or (BlockType == E_BLOCK_EMERALD_ORE) then

        elseif (BlockType == E_BLOCK_LAPIS_ORE) then

        elseif (BlockType == E_BLOCK_NETHER_QUARTZ_ORE) then

        elseif (BlockType == E_BLOCK_REDSTONE_ORE) or (BlockType == E_BLOCK_REDSTONE_ORE_GLOWING) then
    
        end
    -- TODO: if player is farmer --
        if (BlockType == E_BLOCK_CROPS) then
            item1 = Pickups:Get(0)
            item2 = Pickups:Get(1)
            if (BlockType == E_BLOCK_CROPS) and (BlockMeta == 7) then
            
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
                if Victim:IsMob() then
                        if (Victim:IsA("cChicken")) or (Victim:IsA("cCow")) or (Victim:IsA("cHorse")) or (Victim:IsA("cMooshroom")) or (Victim:IsA("cCow")) or (Victim:IsA("cOcelot")) or (Victim:IsA("cPig")) or (Victim:IsA("cSheep")) or (Victim:IsA("cSquid")) or (Victim:IsA("cWolf")) then
                        
                        elseif (Victim:IsA("cSlime")) or (Victim:IsA("cMagmaCube")) then
                                
                        elseif (Victim:IsA("cBlaze")) then
                                
                        elseif (Victim:IsA("cEnderDragon")) then
                                
                        elseif (Victim:IsA("cWither")) then
                                
                        else
                                
                        end
                end
                return false
        end
end

function OnPlayerPlacedBlock(Player, BlockX, BlockY, BlockZ, BlockFace, CursorX, CursorY, CursorZ, BlockType, BlockMeta)
    if (BlockType == E_BLOCK_IRON_ORE) or (BlockType == E_BLOCK_GOLD_ORE) then
    
    end
end
