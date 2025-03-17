--// terribly written script that lets you see chats when playing pool in tbc
--// z4cked

if _G.PoolChat then 
	warn("This script is already injected")
	return 
end

local Players = game:GetService('Players')
local StarterGui = game.StarterGui

local PlayerGui = Players.LocalPlayer.PlayerGui
local IsInPool = false

local function SendNotification(Title, Text, Icon, Duration)
	StarterGui:SetCore("SendNotification", {
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

local function WaitForChats(Player)
	if Player == Players.LocalPlayer then return end
	
	Player.Chatted:Connect(function(Message)
		if not IsInPool then return end

		local Character = Player.Character
		local LocalPlayerDistance = (Players.LocalPlayer.Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).Magnitude 

        local Radius = 30

		if LocalPlayerDistance < Radius then
			SendNotification(Player.DisplayName, Message, GetPlayerIcon(Player.Name), 5)
		end
	end)
end

--

Players.PlayerAdded:Connect(function(Player)
	WaitForChats(Player)
end)
for _, Player in ipairs(Players:GetChildren()) do 
	WaitForChats(Player)
end

PlayerGui.ChildAdded:Connect(function(UI)
	if UI.Name ~= "PoolUI" then return end
	IsInPool = true
	SendNotification("Entered Pool", "You will now see chat messages from those around you", 0, 5)
end)
PlayerGui.ChildRemoved:Connect(function(UI)
	if UI.Name ~= "PoolUI" then return end
	IsInPool = false
	SendNotification("Exiting Pool", "goodbye", 0, 5)
end)

SendNotification("Pool Chat", "loaded pool chat script v1", 0, 3)
_G.PoolChat = true
