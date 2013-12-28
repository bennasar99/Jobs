function Initialize(Plugin)
	Plugin:SetName("Jobs")
	Plugin:SetVersion(0)
		
	cPluginManager.BindCommand("/jobs",                    "jobs.jobs",                  HandleJobsCommand,                        " - Join, browse or leave jobs.");
	
	cPluginManager.AddHook(cPluginManager.HOOK_BLOCK_TO_PICKUPS, OnDigged);
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_PLACED_BLOCK, OnPlacedBlock)
	cPluginManager.AddHook(cPluginManager.HOOK_KILLING, OnKilling)
		
	Coiny = cRoot:Get():GetPluginManager():GetPlugin("Coiny")
	
	LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end
