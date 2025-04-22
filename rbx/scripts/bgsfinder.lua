local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local Rifts = workspace:WaitForChild("Rendered"):WaitForChild("Rifts")
local WebhookURL = "https://discord.com/api/webhooks/1364064594036785293/U5--U50CPC_YIORi5y6Najnze9fJXrrfx4qb7XRBbJGWJzIx0amgTR0QnREBhxQOIplA"

local embedData = {
	["embeds"] = {{
		["title"] = "BGSI",
		["description"] = "",
		["color"] = 65280,
		["fields"] = {
			{
				["name"] = "time",
				["value"] = "link"
			}
		}
	}}
}

local function req(Data)
	httprequest({
		Url = WebhookURL,
		Method = "POST",
		Headers = {
			['Content-Type'] = 'application/json'
		},
		Body = game:GetService("HttpService"):JSONEncode(Data)
	})
end

local function serverhop()
	pcall(function()
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
		end
	end
	end)
end    

local function Join()
	task.wait(2)

	for _, rift in pairs(Rifts:GetChildren()) do
		if rift.Name == "royal-chest" then
			local Timer = rift.Display.SurfaceGui.Timer.Text
			local newEmbedData = table.clone(embedData)

			newEmbedData.embeds[1].description = "A royal chest has been found!"
			newEmbedData["embeds"][1]["fields"][1]["value"] = string.format("https://fern.wtf/joiner?placeId=%s&gameInstanceId=%s", game.PlaceId, game.JobId)
			newEmbedData["embeds"][1]["fields"][1]["name"] = Timer

			req(newEmbedData)
		end
		if rift.Name == "man-egg" then
			local Timer = rift.Display.SurfaceGui.Timer.Text
			local newEmbedData = table.clone(embedData)

			newEmbedData.embeds[1].description = "A man face thing has been found!"
			newEmbedData["embeds"][1]["fields"][1]["value"] = string.format("https://fern.wtf/joiner?placeId=%s&gameInstanceId=%s", game.PlaceId, game.JobId)
			newEmbedData["embeds"][1]["fields"][1]["name"] = Timer

			req(newEmbedData)
		end
	end

	task.wait(1)
	task.spawn(serverhop)
	task.wait(3)
	warn("teleport attempt failed!")
	while true do
	    print("retrying teleport..")
	    task.spawn(serverhop)
	    task.wait(2)
	end
end

game.Players.LocalPlayer.OnTeleport:Connect(function(State)
	queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/idkwhatthisislmao/z4cked.com/refs/heads/main/rbx/scripts/bgsfinder.lua", true))()')
end)
Join()
