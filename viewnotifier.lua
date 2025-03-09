--// view detector for tbc
--// written by z4cked

if _G.ViewNotifier then 
	warn("This script is already injected")
	return 
end

----////----

local Players = game:GetService("Players")
local Prefix = {":", "/e :", "!", "/e"}

local Viewers = {}

local Commands = {
	[1] = {
		Command = "view",
		Aliases = {"rv", "unview"},
		Function = function(parameters, sender)
			local Player = getPlayerFromSnippet(parameters[2])

			if Player == Players.LocalPlayer then
				if not table.find(Viewers, sender) then
					table.insert(Viewers, sender)
				end
				SendNotification(sender.Name, "is viewing you!", getPlayerIcon(sender.Name), 3)
			end

			if not Player then
				if table.find(Viewers, sender) then
					table.remove(Viewers, table.find(Viewers, sender))
					SendNotification(sender.Name, "stopped viewing you!", getPlayerIcon(sender.Name), 3)
				end
			end
		end,
	};

	[2] = {
		Command = "pban",
		Aliases = {"permban"},
		Function = function(parameters, sender)
			local Player = getPlayerFromSnippet(parameters[2])

			if Player == Players.LocalPlayer then
				SendNotification(sender.Name, "just banned you..", getPlayerIcon(sender.Name), 3)
			end
		end,
	};

	[3] = {
		Command = "warns",
		Aliases = {},
		Function = function(parameters, sender)
			local Player = getPlayerFromSnippet(parameters[2])

			if Player == Players.LocalPlayer then
				SendNotification(sender.Name, "is looking at your warnings", getPlayerIcon(sender.Name), 3)
			end
		end,
	};

	[4] = {
		Command = "handto",
		Aliases = {},
		Function = function(parameters, sender)
			local Player = getPlayerFromSnippet(parameters[2])

			if Player == Players.LocalPlayer then
				SendNotification(sender.Name, "handed you something", getPlayerIcon(sender.Name), 3)
			end
		end,
	};
}

----////----

function getPlayerIcon(username)
	local UserId = Players:GetUserIdFromNameAsync(username)
	return Players:GetUserThumbnailAsync(UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
end

function SendNotification(Title, Text, Icon, Duration)
	game.StarterGui:SetCore("SendNotification", {
		Title = Title,
		Text = Text,
		Icon = Icon,
		Duration = Duration
	})
end

function getPlayerFromSnippet(snippet)
	local playerInstance

	pcall(function()
		snippet = snippet:lower()
		for _, player: Player in ipairs(Players:GetChildren()) do
			local Name = player.Name:lower()
			if Name == snippet then
				playerInstance = player
			end
			if string.find(Name, snippet) then
				playerInstance = player
			end
			if string.find(player.DisplayName:lower(), snippet) then
				playerInstance = player
			end
		end
	end)

	return playerInstance
end

local function findCommand(message, prefix)
	local Split = message:split(" ")
	local Name
	local Command

	for _, segment in ipairs(Split) do
		if prefix == 4 then
			Name = string.sub(Split[2], 1, Split[2]:len())
		end
		if prefix == 3 then
			Name = string.sub(Split[1], 2, Split[1]:len())
		end
		if prefix == 2 then
			Name = string.sub(Split[2], 2, Split[2]:len())
		end
		if prefix == 1 then
			Name = string.sub(Split[1], 2, Split[1]:len())
		end
	end

	for _, command in pairs(Commands) do
		if command.Command == Name then
			Command = command
		end
		if table.find(command.Aliases, Name) then
			Command = command
		end
	end

	if Command then
		return true, Command
	else
		return false, Name
	end
end

local function checkForPrefix(message)
	for index, prefix in ipairs(Prefix) do
		if string.sub(message, 1, prefix:len()) == prefix then
			return true, index
		end
	end
end

local function getParams(command, index, message)
	local parameters = {}

	table.insert(parameters, command.Command)
	if index == 1 then
		for index, segment in ipairs(message:split(" ")) do
			if index < 2 then
				continue
			end

			table.insert(parameters, segment)
		end
	end
	if index == 2 then
		for index, segment in ipairs(message:split(" ")) do
			if index < 3 then
				continue
			end

			table.insert(parameters, segment)
		end
	end
	if index == 3 then
		for index, segment in ipairs(message:split(" ")) do
			if index < 2 then
				continue
			end

			table.insert(parameters, segment)
		end
	end
	if index == 4 then
		for index, segment in ipairs(message:split(" ")) do
			if index < 3 then
				continue
			end

			table.insert(parameters, segment)
		end
	end

	return parameters
end

local function waitForChats(player: Player)
	player.Chatted:Connect(function(message)
		print("["..player.Name.."] "..message)
		local hasPrefix, index = checkForPrefix(message)
		if not hasPrefix then return end

		local Success, Command = findCommand(message, index)
		if not Success then return end

		local parameters = getParams(Command, index, message)
		Command.Function(parameters, player)
	end)
end

----////----

for _, player: Player in pairs(game.Players:GetChildren()) do
	waitForChats(player)
end

Players.PlayerAdded:Connect(function(player)
	waitForChats(player)
end)

Players.PlayerRemoving:Connect(function(player)
	if table.find(Viewers, player) then
		table.remove(Viewers, table.find(Viewers, player))

		SendNotification(player.Name, "stopped viewing you!", getPlayerIcon(player.Name), 3)
	end
end)

SendNotification("View Notifier", "loaded view notifier v2.2", 0, 3)
_G.ViewNotifier = true
