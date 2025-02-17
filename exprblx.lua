--// EXPRBLX HUB

--// CHANGES MADE TO GUI

--- Default panel size 0,0,0,0
--- List wrap sidebar

local Parent = game.CoreGui
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local ScriptsTable = {
	[1] = {
		Name = "Slippery",
		Desc = "Makes it so when you press H, every part becomes slippery (toggle)",
		Src = game:HttpGet('https://raw.githubusercontent.com/idkwhatthisislmao/roblo/refs/heads/main/slip.lua', true),
	},
	[2] = {
		Name = "Jerk Tool (R6)",
		Desc = "Funny little tool, its in the name",
		Src = game:HttpGet("https://raw.githubusercontent.com/idkwhatthisislmao/roblo/refs/heads/main/jerkoff.lua")
	},
	[3] = {
		Name = "Infinite Yield",
		Desc = "A popular admin command script",
		Src = game:HttpGet("https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source")
	},
	[5] = {
		Name = "Freecam",
		Desc = "Official roblox freecam script (press shift + p)",
		Src = game:HttpGet("https://raw.githubusercontent.com/idkwhatthisislmao/roblo/refs/heads/main/freecam.lua")
	},
	[6] = {
		Name = "Synergy Networks Bypasser",
		Desc = "A popular chat bypass script",
		Src = game:HttpGetAsync("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua")
	},
};

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
			game.TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
		end,
	}
};

if game.CoreGui:FindFirstChild("exprblx") then return end

local exprblx = Instance.new("ScreenGui")
local NotificationFrame = Instance.new("Frame")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local NotificationTemplate = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local Panel = Instance.new("Frame")
local UITitle = Instance.new("TextLabel")
local UIPadding_2 = Instance.new("UIPadding")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local Headerline = Instance.new("Frame")
local Frames = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local Scripts = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Actions = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local ScrollbarButtonTemp = Instance.new("TextButton")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local UIPadding_3 = Instance.new("UIPadding")
local CloseButton = Instance.new("TextButton")
local UIPadding_4 = Instance.new("UIPadding")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local Sidebar = Instance.new("Frame")
local UIStroke_2 = Instance.new("UIStroke")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local UIListLayout_3 = Instance.new("UIListLayout")
local ScriptsButton = Instance.new("ImageButton")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
local ActionsButton = Instance.new("ImageButton")
local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
local UIStroke_3 = Instance.new("UIStroke")
local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
local Tip = Instance.new("TextLabel")
local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")

local OpenSound = Instance.new("Sound", exprblx)
local CloseSound = Instance.new("Sound", exprblx)
local ClickSound = Instance.new("Sound", exprblx)
local ExecuteSound = Instance.new("Sound", exprblx)

-- Properties:

OpenSound.SoundId = "rbxassetid://140419294351439"
CloseSound.SoundId = "rbxassetid://82400841452026"
ClickSound.SoundId = "rbxassetid://10128760939"
ExecuteSound.SoundId = "rbxassetid://10066921516"

OpenSound.Volume = 10
CloseSound.Volume = 10
ClickSound.Volume = 10
ExecuteSound.Volume = 10

exprblx.Name = "exprblx"
exprblx.Parent = Parent
exprblx.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Parent = exprblx
NotificationFrame.AnchorPoint = Vector2.new(0.5, 1)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationFrame.BackgroundTransparency = 1.000
NotificationFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Position = UDim2.new(0.5, 0, 1, 0)
NotificationFrame.Size = UDim2.new(0.599497497, 0, 0.124087594, 0)

UIAspectRatioConstraint.Parent = NotificationFrame
UIAspectRatioConstraint.AspectRatio = 8.097

NotificationTemplate.Name = "NotificationTemplate"
NotificationTemplate.Parent = NotificationFrame
NotificationTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationTemplate.BackgroundTransparency = 1.000
NotificationTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
NotificationTemplate.BorderSizePixel = 0
NotificationTemplate.Position = UDim2.new(-0.000265168521, 0, 0.218377322, 0)
NotificationTemplate.Size = UDim2.new(0.999675751, 0, 0.200000003, 0)
NotificationTemplate.Visible = false
NotificationTemplate.Font = Enum.Font.GothamBold
NotificationTemplate.Text = "Notification"
NotificationTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationTemplate.TextScaled = true
NotificationTemplate.TextSize = 14.000
NotificationTemplate.TextWrapped = true

Panel.Name = "Panel"
Panel.Parent = exprblx
Panel.AnchorPoint = Vector2.new(0.5, 0.5)
Panel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Panel.BackgroundTransparency = 0.400
Panel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Panel.BorderSizePixel = 0
Panel.Position = UDim2.new(0.782608688, 0, 0.523357689, 0)
Panel.Size = UDim2.new(0, 0, 0, 0)
Panel.Visible = false
Panel.Active = true
Panel.Draggable = true

UITitle.Name = "UITitle"
UITitle.Parent = Panel
UITitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UITitle.BackgroundTransparency = 1.000
UITitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
UITitle.BorderSizePixel = 0
UITitle.Position = UDim2.new(0.0391061455, 0, 0.0529100522, 0)
UITitle.Size = UDim2.new(0.530726254, 0, 0.111111112, 0)
UITitle.Font = Enum.Font.Gotham
UITitle.Text = "exprblx"
UITitle.TextColor3 = Color3.fromRGB(255, 255, 255)
UITitle.TextScaled = true
UITitle.TextSize = 14.000
UITitle.TextWrapped = true
UITitle.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_2.Parent = UITitle

UIAspectRatioConstraint_2.Parent = UITitle
UIAspectRatioConstraint_2.AspectRatio = 9.048

UICorner.CornerRadius = UDim.new(0.0500000007, 0)
UICorner.Parent = Panel

Headerline.Name = "Headerline"
Headerline.Parent = Panel
Headerline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Headerline.BorderColor3 = Color3.fromRGB(0, 0, 0)
Headerline.BorderSizePixel = 0
Headerline.Position = UDim2.new(0, 0, 0.222000003, 0)
Headerline.Size = UDim2.new(1, 0, -0.00529100513, 0)

Frames.Name = "Frames"
Frames.Parent = Panel
Frames.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frames.BackgroundTransparency = 1.000
Frames.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frames.BorderSizePixel = 0
Frames.Position = UDim2.new(0.0391061455, 0, 0.280423284, 0)
Frames.Size = UDim2.new(0.78212291, 0, 0.650793672, 0)

UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Parent = Frames

UIAspectRatioConstraint_3.Parent = Frames
UIAspectRatioConstraint_3.AspectRatio = 2.276

Scripts.Name = "Scripts"
Scripts.Parent = Frames
Scripts.Active = true
Scripts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Scripts.BackgroundTransparency = 1.000
Scripts.BorderColor3 = Color3.fromRGB(0, 0, 0)
Scripts.BorderSizePixel = 0
Scripts.Position = UDim2.new(0.0332285948, 0, 0.067237623, 0)
Scripts.Size = UDim2.new(0.963159561, 0, 0.932762384, 0)
Scripts.ScrollBarThickness = 3

UIListLayout.Parent = Scripts
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.0199999996, 0)

Actions.Name = "Actions"
Actions.Parent = Frames
Actions.Active = true
Actions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Actions.BackgroundTransparency = 1.000
Actions.BorderColor3 = Color3.fromRGB(0, 0, 0)
Actions.BorderSizePixel = 0
Actions.Position = UDim2.new(0.0332285948, 0, 0.067237623, 0)
Actions.Size = UDim2.new(0.963159561, 0, 0.932762384, 0)
Actions.Visible = false
Actions.ScrollBarThickness = 3

UIListLayout_2.Parent = Actions
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0.0199999996, 0)

ScrollbarButtonTemp.Name = "ScrollbarButtonTemp"
ScrollbarButtonTemp.Parent = Frames
ScrollbarButtonTemp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollbarButtonTemp.BackgroundTransparency = 0.700
ScrollbarButtonTemp.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollbarButtonTemp.BorderSizePixel = 0
ScrollbarButtonTemp.Size = UDim2.new(0.965988219, 0, 0.0966540948, 0)
ScrollbarButtonTemp.Visible = false
ScrollbarButtonTemp.Font = Enum.Font.Gotham
ScrollbarButtonTemp.Text = "Example"
ScrollbarButtonTemp.TextColor3 = Color3.fromRGB(255, 255, 255)
ScrollbarButtonTemp.TextScaled = true
ScrollbarButtonTemp.TextSize = 14.000
ScrollbarButtonTemp.TextWrapped = true

UIAspectRatioConstraint_4.Parent = ScrollbarButtonTemp
UIAspectRatioConstraint_4.AspectRatio = 10.957

CloseButton.Name = "CloseButton"
CloseButton.Parent = Panel
CloseButton.Active = false
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.000
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.907821238, 0, 0.0529100522, 0)
CloseButton.Selectable = false
CloseButton.Size = UDim2.new(0.0754189938, 0, 0.111111112, 0)
CloseButton.Font = Enum.Font.Gotham
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.TextSize = 14.000
CloseButton.TextWrapped = true

UIPadding_4.Parent = CloseButton
UIPadding_4.PaddingLeft = UDim.new(0.277777791, 0)
UIPadding_4.PaddingRight = UDim.new(0.277777791, 0)

UIAspectRatioConstraint_5.Parent = CloseButton
UIAspectRatioConstraint_5.AspectRatio = 1.286

Sidebar.Name = "Sidebar"
Sidebar.Parent = Panel
Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sidebar.BackgroundTransparency = 1.000
Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Sidebar.BorderSizePixel = 0
Sidebar.Position = UDim2.new(0.863128483, 0, 0.280423284, 0)
Sidebar.Size = UDim2.new(0.100558661, 0, 0.650793672, 0)

UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
UIStroke_2.Parent = Sidebar

UIAspectRatioConstraint_6.Parent = Sidebar
UIAspectRatioConstraint_6.AspectRatio = 0.293

UIListLayout_3.Parent = Sidebar
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_3.Padding = UDim.new(0.150000006, 0)
UIListLayout_3.Wraps = true

ScriptsButton.Name = "ScriptsButton"
ScriptsButton.Parent = Sidebar
ScriptsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptsButton.BackgroundTransparency = 1.000
ScriptsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptsButton.BorderSizePixel = 0
ScriptsButton.Position = UDim2.new(0.0594019778, 0, 0.167087972, 0)
ScriptsButton.Size = UDim2.new(0.68221879, 0, 0.25791198, 0)
ScriptsButton.Image = "rbxassetid://9405930424"

UIAspectRatioConstraint_7.Parent = ScriptsButton

ActionsButton.Name = "ActionsButton"
ActionsButton.Parent = Sidebar
ActionsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActionsButton.BackgroundTransparency = 1.000
ActionsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActionsButton.BorderSizePixel = 0
ActionsButton.Position = UDim2.new(0.0852773488, 0, 0.0415987074, 0)
ActionsButton.Size = UDim2.new(0.8811993, 0, 0.25791198, 0)
ActionsButton.Image = "rbxassetid://13160015062"

UIAspectRatioConstraint_8.Parent = ActionsButton

UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_3.Color = Color3.fromRGB(255, 255, 255)
UIStroke_3.Parent = Panel

UIAspectRatioConstraint_9.Parent = Panel
UIAspectRatioConstraint_9.AspectRatio = 1.894

Tip.Name = "Tip"
Tip.Parent = exprblx
Tip.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tip.BackgroundTransparency = 09.000
Tip.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tip.BorderSizePixel = 0
Tip.Position = UDim2.new(1.04047906, 0, 0.72553426, 0)
Tip.Size = UDim2.new(0.377316535, 0, 0.389839321, 0)
Tip.Visible = false
Tip.Font = Enum.Font.GothamBold
Tip.Text = "Scripts"
Tip.TextColor3 = Color3.fromRGB(243, 243, 243)
Tip.TextSize = 11.000
Tip.TextWrapped = true
Tip.TextXAlignment = Enum.TextXAlignment.Left
Tip.TextYAlignment = Enum.TextYAlignment.Top

UIAspectRatioConstraint_10.Parent = Tip
UIAspectRatioConstraint_10.AspectRatio = 1.833

Panel.Visible = true
game.TweenService:Create(Panel, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0.23, 0,0.225, 0)}):Play()

OpenSound:Play()

function Notification(name)
	pcall(function()
		task.spawn(function()
			local NewNoti = NotificationTemplate:Clone()
			NewNoti.Text = name
			NewNoti.Position = UDim2.new(0,0,1,0)
			NewNoti.TextTransparency = 1
			NewNoti.Visible = true
			NewNoti.Parent = NotificationFrame

			game.TweenService:Create(NewNoti, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 0, Position = UDim2.new(-0, 0,0.258, 0)}):Play()
			task.wait(3)
			game.TweenService:Create(NewNoti, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
			task.wait(0.5)
			NewNoti:Destroy()
		end)
	end)
end

-----------

CloseButton.MouseButton1Click:Connect(function()
	game.TweenService:Create(Panel, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)}):Play()
	CloseSound:Play()
	task.wait(0.6)
	exprblx:Destroy()
end)

--

ActionsButton.MouseButton1Click:Connect(function()
	Actions.Visible = true
	Scripts.Visible = false
	
	ClickSound:Play()
	
	game.TweenService:Create(ActionsButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.782, 0,0.258, 0)}):Play()
	task.wait(0.1)
	game.TweenService:Create(ActionsButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.881, 0,0.258, 0)}):Play()
end)
ActionsButton.MouseEnter:Connect(function()
	Tip.Text = "- Actions"
	Tip.Visible = true
end)
ActionsButton.MouseLeave:Connect(function()
	Tip.Text = ""
	Tip.Visible = false
end)

--

ScriptsButton.MouseButton1Click:Connect(function()
	Actions.Visible = false
	Scripts.Visible = true
	
	ClickSound:Play()
	
	game.TweenService:Create(ScriptsButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.571, 0,0.2, 0)}):Play()
	task.wait(0.1)
	game.TweenService:Create(ScriptsButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.682, 0,0.258, 0)}):Play()
end)
ScriptsButton.MouseEnter:Connect(function()
	Tip.Text = "- Scripts"
	Tip.Visible = true
end)
ScriptsButton.MouseLeave:Connect(function()
	Tip.Text = ""
	Tip.Visible = false
end)

game["Run Service"].Heartbeat:Connect(function()
	Tip.Position = UDim2.new(0, game.UserInputService:GetMouseLocation().X + 15, 0, game.UserInputService:GetMouseLocation().Y - 60)
end)

--

for _, Script in pairs(ScriptsTable) do
	local ScriptButton = ScrollbarButtonTemp:Clone()
	ScriptButton.Parent = Scripts
	ScriptButton.Visible = true
	ScriptButton.Text = Script.Name
	
	ScriptButton.MouseButton1Click:Connect(function()
		Notification("Executed "..Script.Name)
		
		task.spawn(function()
			loadstring(Script.Src)()
		end)
		
		ExecuteSound:Play()
		game.TweenService:Create(ScriptButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.936, 0,0.207, 0)}):Play()
		task.wait(0.1)
		game.TweenService:Create(ScriptButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.966, 0,0.097, 0)}):Play()
	end)
	ScriptButton.MouseEnter:Connect(function()
		Tip.Text = Script.Desc
		Tip.Visible = true
	end)
	ScriptButton.MouseLeave:Connect(function()
		Tip.Text = ""
		Tip.Visible = false
	end)
end

for _, Script in pairs(ActionsTable) do
	local ScriptButton = ScrollbarButtonTemp:Clone()
	ScriptButton.Parent = Actions
	ScriptButton.Visible = true
	ScriptButton.Text = Script.Name

	ScriptButton.MouseButton1Click:Connect(function()
		task.spawn(function()
			Script.Func()
		end)
		
		ExecuteSound:Play()
		game.TweenService:Create(ScriptButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.936, 0,0.207, 0)}):Play()
		task.wait(0.1)
		game.TweenService:Create(ScriptButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.966, 0,0.097, 0)}):Play()
	end)
	ScriptButton.MouseEnter:Connect(function()
		Tip.Text = Script.Desc
		Tip.Visible = true
	end)
	ScriptButton.MouseLeave:Connect(function()
		Tip.Text = ""
		Tip.Visible = false
	end)
end

game.Players.LocalPlayer.OnTeleport:Connect(function(State)
	queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/idkwhatthisislmao/roblo/refs/heads/main/exprblx.lua", true))()')
end)

Notification("Loaded exprblx panel (v2.11)")
