Job = {}

function Initialize(Plugin)
	Plugin:SetName("Jobs")
	Plugin:SetVersion(1)
		
	cPluginManager.BindCommand("/jobs",                    "jobs.jobs",                  HandleJobsCommand,                        " - Join, browse or leave jobs.");
	
	cPluginManager.AddHook(cPluginManager.HOOK_BLOCK_TO_PICKUPS, OnBlockToPickups)
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_PLACING_BLOCK, OnPlayerPlacingBlock)
	cPluginManager.AddHook(cPluginManager.HOOK_KILLING, OnKilling)
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_BROKEN_BLOCK, OnPlayerBrokenBlock)
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_JOINED, OnPlayerJoined)
	
	PM = cPluginManager
		
	UsersIni = cIniFile()	
	UsersIni:ReadFile("jobs.ini")	

	
	LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end
