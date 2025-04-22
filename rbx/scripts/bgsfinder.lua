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
        Url = WebhookURL
        Method = "POST",
        Headers = {
            ['Content-Type'] = 'application/json'
        },
        Body = game:GetService("HttpService"):JSONEncode(Data)
    })
end

local function serverhop()
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
    end
end)    

local function Join()
    task.wait(3)

    for _, rift in pairs(Rifts:GetChildren()) do
        if rift.Name == "royal-chest" then
            local Timer = rift.Display.SurfaceGui.Timer.Text
            local newEmbedData = embedData

            newEmbedData.embeds.description = "A royal chest has been found!"
            newEmbedData.embeds.fields[1].value = "https://fern.wtf/joiner?placeId="..game.PlaceId.."&gameInstanceId="..game.JobId
            newEmbedData.embeds.fields[1].name = Timer

            req(newEmbedData)
        end
       if rift.Name == "golden-chest" then
            local Timer = rift.Display.SurfaceGui.Timer.Text
            local newEmbedData = embedData

            newEmbedData.embeds.description = "A golden chest has been found this test"
            newEmbedData.embeds.fields[1].value = "https://fern.wtf/joiner?placeId="..game.PlaceId.."&gameInstanceId="..game.JobId
            newEmbedData.embeds.fields[1].name = Timer

            req(newEmbedData)
        end
        if rift.Name == "man-egg" then
            local Timer = rift.Display.SurfaceGui.Timer.Text
            local newEmbedData = embedData

            newEmbedData.embeds.description = "Holy shit im boutta nut theres a man egg"
            newEmbedData.embeds.fields[1].value = "https://fern.wtf/joiner?placeId="..game.PlaceId.."&gameInstanceId="..game.JobId
            newEmbedData.embeds.fields[1].name = Timer

            req(newEmbedData)
        end
    end

    task.wait(3)
    serverhop()
end)

Join()
