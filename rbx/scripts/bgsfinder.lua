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

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
	AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
	table.insert(AllIDs, actualHour)
	writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
	local Site;
	if foundAnything == "" then
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
	else
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0;
	for i,v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) then
			for _,Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
							delfile("NotSameServers.json")
							AllIDs = {}
							table.insert(AllIDs, actualHour)
						end)
					end
				end
				num = num + 1
			end
			if Possible == true then
				table.insert(AllIDs, ID)
				wait()
				pcall(function()
					writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
					wait()
					game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
				end)
				wait(4)
			end
		end
	end
end

function Teleport()
	while wait() do
		pcall(function()
			TPReturner()
			if foundAnything ~= "" then
				TPReturner()
			end
		end)
	end
end

local function Join()
	task.wait(3)

	for _, rift in pairs(Rifts:GetChildren()) do
		if rift.Name == "royal-chest" then
			local Timer = rift.Display.SurfaceGui.Timer.Text
			local newEmbedData = table.clone(embedData)

			newEmbedData.embeds[1].description = "A royal chest has been found!"
			newEmbedData["embeds"][1]["fields"][1]["value"] = string.format("https://fern.wtf/joiner?placeId=%s&gameInstanceId=%s", game.PlaceId, game.JobId)
			newEmbedData["embeds"][1]["fields"][1]["name"] = Timer

			foundAnything = "royal chest"
			req(newEmbedData)
		end
		if rift.Name == "man-egg" then
			local Timer = rift.Display.SurfaceGui.Timer.Text
			local newEmbedData = table.clone(embedData)

			newEmbedData.embeds[1].description = "A aura egg has been found!"
			newEmbedData["embeds"][1]["fields"][1]["value"] = string.format("https://fern.wtf/joiner?placeId=%s&gameInstanceId=%s", game.PlaceId, game.JobId)
			newEmbedData["embeds"][1]["fields"][1]["name"] = Timer

			foundAnything = "man egg"
			req(newEmbedData)
		end
	end

	if foundAnything ~= "" then
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://6152971423"
		s:Play()

		local m = Instance.new("Message")
		m.Text = foundAnything.." WAS FOUND!!!"

		task.wait(60)
	end

	task.wait(3)
	Teleport()
end

game.Players.LocalPlayer.OnTeleport:Connect(function(State)
	queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/idkwhatthisislmao/z4cked.com/refs/heads/main/rbx/scripts/bgsfinder.lua", true))()')
end)
Join()
