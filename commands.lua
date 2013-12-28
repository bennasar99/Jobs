function HandleJobsCommand( Split, Player )
  if (Split[2] == nil) then
    Player:SendMessage("Usage: /jobs <browse/join/leave>
  elseif (Split[2] == "browse") then
    Player:SendMessage("Jobs: Miner, Farmer, Hunter, TreeCutter")
  elseif (Split[2] == "join") then
    -- TODO --
  elseif (Split[2] == "leave") then
    -- TODO --
  end
