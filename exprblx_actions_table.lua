local ActionsTable = {
	[1] = {
		Name = "Server Hop",
		Desc = "Uses games api to join a different server in the game you are in",
		Func = function()
			if httprequest then
				local servers = {}
				local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
				local body = game.HttpService:JSONDecode(req.Body)

				if body and body.data then
					for i, v in next, body.data do
						if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
							table.insert(servers, 1, v.id)
						end
					end
				end

				if #servers > 0 then
					game["Teleport Service"]:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
				else
					return Notification("Couldn't find a server.")
				end
			else
				Notification("Incompatible Exploit", "Your exploit does not support this command (missing request)")
			end
		end,
	},
	[2] = {
		Name = "Rejoin",
		Desc = "Uses teleport service to rejoin the game",
		Func = function()
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
		end,
	}
};

return ActionsTable
