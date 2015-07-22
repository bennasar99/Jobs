function HandleJobsCommand( Split, Player )
    if #Split < 2 then
        Player:SendMessage("Usage: /jobs <browse/join/leave>")
        return true
    elseif (Split[2] == "browse") then
        Player:SendMessage("Jobs: miner, farmer, hunter, treecutter")
        return true
    elseif (Split[2] == "join") then
        if #Split < 3 then
            Player:SendMessage('Usage:/jobs join [jobname]')
            return true
        elseif (Split[3] == "miner") or (Split[3] == "farmer") or (Split[3] == "hunter") or (Split[3] == "treecutter") then
            if (UsersIni:GetValue(Player:GetName(),   "Job") ~= "") then
                Player:SendMessage("You already have a job!, if you want to change your job, type /jobs leave before")
                return true
            else
                UsersIni:SetValue(Player:GetName(),   "Job",   Split[3])
                UsersIni:WriteFile("jobs.ini")
                Job[Player:GetName()] = Split[3]
                Player:SendMessage("You joined the job " ..Split[3])
                return true
            end
        else
            Player:SendMessage(cChatColor.Red .. "Invalid job name!")
            return true
        end
    elseif (Split[2] == "leave") then
        if (UsersIni:GetValue(Player:GetName(),   "Job") ~= "") then
            UsersIni:DeleteValue(Player:GetName(),   "Job")
            UsersIni:WriteFile("jobs.ini")
            Job[Player:GetName()] = nil
            Player:SendMessage("You left your job!")
            return true
        else
            Player:SendMessage("You don't have a job!, use /jobs join [jobname] and start working!")
            return true
        end    
     elseif (Split[2] == "info") then
        if (UsersIni:GetValue(Player:GetName(),   "Job") ~= "") then
            job = UsersIni:GetValue(Player:GetName(),   "Job")
            Player:SendMessage("You're are working as a " .. job)
            return true
        else
            Player:SendMessage("You don't have a job!, use /jobs join [jobname] and start working!")
            return true
        end    
    end
end
