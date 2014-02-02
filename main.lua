function Initialize(Plugin)
	Plugin:SetName("Jobs")
	Plugin:SetVersion(1)
		
	cPluginManager.BindCommand("/jobs",                    "jobs.jobs",                  HandleJobsCommand,                        " - Join, browse or leave jobs.");
	
	cPluginManager.AddHook(cPluginManager.HOOK_BLOCK_TO_PICKUPS, OnBlockToPickups)
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_PLACED_BLOCK, OnPlayerPlacedBlock)
	cPluginManager.AddHook(cPluginManager.HOOK_KILLING, OnKilling)
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_BROKEN_BLOCK, OnPlayerBrokenBlock)
		
	Coiny = cRoot:Get():GetPluginManager():GetPlugin("Coiny")
	
	UsersIni = cIniFile()	
	
	LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end
