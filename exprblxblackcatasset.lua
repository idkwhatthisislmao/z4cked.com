local Parent = game.CoreGui

if _G.exprblxasset then return end
_G.exprblxasset = true

local ShirtsTable, PantsTable, HatsTable, RandomTable, FaceTable = loadstring(game:HttpGet("https://raw.githubusercontent.com/zo0tzy/Accessorytable/refs/heads/main/Table.lua"))()

local CachedItems = {}

local HatRemote = game.ReplicatedStorage.Remotes.V2.PutOnAccessory
local FaceRemote = game.ReplicatedStorage.Remotes.V2.PutOnFace
local ClothingRemote = game.ReplicatedStorage.Remotes.V2.PutOnClothing
local TakeOffRemote = game.ReplicatedStorage.Remotes.V2.TakeOff

local exprblx = Instance.new("ScreenGui")
local NotificationFrame = Instance.new("Frame")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local NotificationTemplate = Instance.new("TextLabel")
local Panel = Instance.new("Frame")
local UITitle = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local UICorner = Instance.new("UICorner")
local Headerline = Instance.new("Frame")
local Frames = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local EquipperFrame = Instance.new("Frame")
local AssetIDBox = Instance.new("TextBox")
local UIStroke_2 = Instance.new("UIStroke")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local EquipButton = Instance.new("TextButton")
local UIPadding_2 = Instance.new("UIPadding")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local TakeoffButton = Instance.new("TextButton")
local UIPadding_3 = Instance.new("UIPadding")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local TakeoffAllButton = Instance.new("TextButton")
local UIPadding_4 = Instance.new("UIPadding")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local ListFrame = Instance.new("Frame")
local RandomizeButton = Instance.new("TextButton")
local UIPadding_5 = Instance.new("UIPadding")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
local AssetsScrolling = Instance.new("ScrollingFrame")
local UIStroke_3 = Instance.new("UIStroke")
local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
local UIGridLayout = Instance.new("UIGridLayout")
local AssetButtonTemp = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local UIPadding_6 = Instance.new("UIPadding")
local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
local Sidebar = Instance.new("Frame")
local UIStroke_4 = Instance.new("UIStroke")
local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
local UIListLayout = Instance.new("UIListLayout")
local ListButton = Instance.new("ImageButton")
local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
local EquipButton_2 = Instance.new("ImageButton")
local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
local UIStroke_5 = Instance.new("UIStroke")
local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
local Tip = Instance.new("TextLabel")
local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")

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

exprblx.Name = "exprblxasset"
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
Panel.Active = true
Panel.AnchorPoint = Vector2.new(0.5, 0.5)
Panel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Panel.BackgroundTransparency = 0.400
Panel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Panel.BorderSizePixel = 0
Panel.Position = UDim2.new(1.25530183, -701, 0.319815308, 1)
Panel.Size = UDim2.new(0,0,0,0)

UITitle.Name = "UITitle"
UITitle.Parent = Panel
UITitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UITitle.BackgroundTransparency = 1.000
UITitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
UITitle.BorderSizePixel = 0
UITitle.Position = UDim2.new(0.0391061567, 0, 0.0529100671, 0)
UITitle.Size = UDim2.new(0.708900392, 0, 0.111111104, 0)
UITitle.Font = Enum.Font.Gotham
UITitle.Text = "Black Cat Asset Equipper"
UITitle.TextColor3 = Color3.fromRGB(255, 255, 255)
UITitle.TextScaled = true
UITitle.TextSize = 14.000
UITitle.TextWrapped = true
UITitle.TextXAlignment = Enum.TextXAlignment.Left

UIPadding.Parent = UITitle

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

UIAspectRatioConstraint_2.Parent = Frames
UIAspectRatioConstraint_2.AspectRatio = 2.276

EquipperFrame.Name = "EquipperFrame"
EquipperFrame.Parent = Frames
EquipperFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EquipperFrame.BackgroundTransparency = 1.000
EquipperFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
EquipperFrame.BorderSizePixel = 0
EquipperFrame.Size = UDim2.new(1, 0, 1, 0)

AssetIDBox.Name = "AssetIDBox"
AssetIDBox.Parent = EquipperFrame
AssetIDBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AssetIDBox.BackgroundTransparency = 1.000
AssetIDBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
AssetIDBox.BorderSizePixel = 0
AssetIDBox.Position = UDim2.new(0.0331120342, 0, 0.0979718864, 0)
AssetIDBox.Size = UDim2.new(0.933759391, 0, 0.263770461, 0)
AssetIDBox.Font = Enum.Font.Gotham
AssetIDBox.PlaceholderText = "Asset ID"
AssetIDBox.Text = ""
AssetIDBox.TextColor3 = Color3.fromRGB(0, 0, 0)
AssetIDBox.TextSize = 23.000
AssetIDBox.TextWrapped = true
AssetIDBox.TextColor3 = Color3.new(255,255,255)

UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
UIStroke_2.Parent = AssetIDBox

UIAspectRatioConstraint_3.Parent = AssetIDBox
UIAspectRatioConstraint_3.AspectRatio = 8.057

EquipButton.Name = "EquipButton"
EquipButton.Parent = EquipperFrame
EquipButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EquipButton.BackgroundTransparency = 0.700
EquipButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
EquipButton.BorderSizePixel = 0
EquipButton.Position = UDim2.new(0.0298008304, 0, 0.42956996, 0)
EquipButton.Size = UDim2.new(0.456062883, 0, 0.209698007, 0)
EquipButton.Font = Enum.Font.Gotham
EquipButton.Text = "Equip"
EquipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EquipButton.TextScaled = true
EquipButton.TextSize = 14.000
EquipButton.TextWrapped = true

UIPadding_2.Parent = EquipButton
UIPadding_2.PaddingBottom = UDim.new(0.014825942, 0)
UIPadding_2.PaddingLeft = UDim.new(0.253146082, 0)
UIPadding_2.PaddingRight = UDim.new(0.253146082, 0)
UIPadding_2.PaddingTop = UDim.new(0.014825942, 0)

UIAspectRatioConstraint_4.Parent = EquipButton
UIAspectRatioConstraint_4.AspectRatio = 4.950

TakeoffButton.Name = "TakeoffButton"
TakeoffButton.Parent = EquipperFrame
TakeoffButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TakeoffButton.BackgroundTransparency = 0.700
TakeoffButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TakeoffButton.BorderSizePixel = 0
TakeoffButton.Position = UDim2.new(0.513236523, 0, 0.42956996, 0)
TakeoffButton.Size = UDim2.new(0.456062883, 0, 0.209698007, 0)
TakeoffButton.Font = Enum.Font.Gotham
TakeoffButton.Text = "Take Off"
TakeoffButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TakeoffButton.TextScaled = true
TakeoffButton.TextSize = 14.000
TakeoffButton.TextWrapped = true

UIPadding_3.Parent = TakeoffButton
UIPadding_3.PaddingBottom = UDim.new(0.014825942, 0)
UIPadding_3.PaddingLeft = UDim.new(0.15513055, 0)
UIPadding_3.PaddingRight = UDim.new(0.15513055, 0)
UIPadding_3.PaddingTop = UDim.new(0.014825942, 0)

UIAspectRatioConstraint_5.Parent = TakeoffButton
UIAspectRatioConstraint_5.AspectRatio = 4.950

TakeoffAllButton.Name = "TakeoffAllButton"
TakeoffAllButton.Parent = EquipperFrame
TakeoffAllButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TakeoffAllButton.BackgroundTransparency = 0.700
TakeoffAllButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TakeoffAllButton.BorderSizePixel = 0
TakeoffAllButton.Position = UDim2.new(0.0298008304, 0, 0.700876713, 0)
TakeoffAllButton.Size = UDim2.new(0.939498603, 0, 0.209698007, 0)
TakeoffAllButton.Font = Enum.Font.Gotham
TakeoffAllButton.Text = "Take Off All"
TakeoffAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TakeoffAllButton.TextScaled = true
TakeoffAllButton.TextSize = 14.000
TakeoffAllButton.TextWrapped = true

UIPadding_4.Parent = TakeoffAllButton
UIPadding_4.PaddingBottom = UDim.new(0.014825942, 0)
UIPadding_4.PaddingLeft = UDim.new(0.272673815, 0)
UIPadding_4.PaddingRight = UDim.new(0.272673815, 0)
UIPadding_4.PaddingTop = UDim.new(0.014825942, 0)

UIAspectRatioConstraint_6.Parent = TakeoffAllButton
UIAspectRatioConstraint_6.AspectRatio = 10.197

ListFrame.Name = "ListFrame"
ListFrame.Parent = Frames
ListFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ListFrame.BackgroundTransparency = 1.000
ListFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ListFrame.BorderSizePixel = 0
ListFrame.Size = UDim2.new(1, 0, 1, 0)
ListFrame.Visible = false

RandomizeButton.Name = "RandomizeButton"
RandomizeButton.Parent = ListFrame
RandomizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RandomizeButton.BackgroundTransparency = 0.700
RandomizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
RandomizeButton.BorderSizePixel = 0
RandomizeButton.Position = UDim2.new(0.027919488, 0, 0.049538061, 0)
RandomizeButton.Size = UDim2.new(0.94577992, 0, 0.146318108, 0)
RandomizeButton.Font = Enum.Font.Gotham
RandomizeButton.Text = "Randomize"
RandomizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RandomizeButton.TextScaled = true
RandomizeButton.TextSize = 14.000
RandomizeButton.TextWrapped = true

UIPadding_5.Parent = RandomizeButton
UIPadding_5.PaddingBottom = UDim.new(0.0385614522, 0)
UIPadding_5.PaddingLeft = UDim.new(0.343173444, 0)
UIPadding_5.PaddingRight = UDim.new(0.343173444, 0)
UIPadding_5.PaddingTop = UDim.new(0.0385614522, 0)

UIAspectRatioConstraint_7.Parent = RandomizeButton
UIAspectRatioConstraint_7.AspectRatio = 14.712

AssetsScrolling.Name = "AssetsScrolling"
AssetsScrolling.Parent = ListFrame
AssetsScrolling.Active = true
AssetsScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AssetsScrolling.BackgroundTransparency = 1.000
AssetsScrolling.BorderColor3 = Color3.fromRGB(0, 0, 0)
AssetsScrolling.BorderSizePixel = 0
AssetsScrolling.Position = UDim2.new(0.027919488, 0, 0.2462378, 0)
AssetsScrolling.Size = UDim2.new(0.94577992, 0, 0.691054463, 0)
AssetsScrolling.CanvasSize = UDim2.new(0, 0, 500, 0)
AssetsScrolling.ScrollBarThickness = 3

UIStroke_3.Color = Color3.fromRGB(255, 255, 255)
UIStroke_3.Parent = AssetsScrolling

UIAspectRatioConstraint_8.Parent = AssetsScrolling
UIAspectRatioConstraint_8.AspectRatio = 3.115

UIGridLayout.Parent = AssetsScrolling
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
UIGridLayout.CellSize = UDim2.new(0.25, 0, 0.00100000005, 0)

AssetButtonTemp.Name = "AssetButtonTemp"
AssetButtonTemp.Parent = ListFrame
AssetButtonTemp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AssetButtonTemp.BorderColor3 = Color3.fromRGB(0, 0, 0)
AssetButtonTemp.BorderSizePixel = 0
AssetButtonTemp.Position = UDim2.new(0, 0, -1.40310704e-06, 0)
AssetButtonTemp.Size = UDim2.new(0, 47, 0, 44)
AssetButtonTemp.Visible = false
AssetButtonTemp.BackgroundTransparency = 1
AssetButtonTemp.TextColor3 = Color3.new(255,255,255)
AssetButtonTemp.TextScaled = true

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

UIPadding_6.Parent = CloseButton
UIPadding_6.PaddingLeft = UDim.new(0.277777791, 0)
UIPadding_6.PaddingRight = UDim.new(0.277777791, 0)

UIAspectRatioConstraint_9.Parent = CloseButton
UIAspectRatioConstraint_9.AspectRatio = 1.286

Sidebar.Name = "Sidebar"
Sidebar.Parent = Panel
Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sidebar.BackgroundTransparency = 1.000
Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Sidebar.BorderSizePixel = 0
Sidebar.Position = UDim2.new(0.863128483, 0, 0.280423284, 0)
Sidebar.Size = UDim2.new(0.100558661, 0, 0.650793672, 0)

UIStroke_4.Color = Color3.fromRGB(255, 255, 255)
UIStroke_4.Parent = Sidebar

UIAspectRatioConstraint_10.Parent = Sidebar
UIAspectRatioConstraint_10.AspectRatio = 0.293

UIListLayout.Parent = Sidebar
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Padding = UDim.new(0.150000006, 0)
UIListLayout.Wraps = true

ListButton.Name = "ListButton"
ListButton.Parent = Sidebar
ListButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ListButton.BackgroundTransparency = 1.000
ListButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ListButton.BorderSizePixel = 0
ListButton.Position = UDim2.new(0.0594019778, 0, 0.167087972, 0)
ListButton.Size = UDim2.new(0.681999981, 0, 0.257999986, 0)
ListButton.Image = "rbxassetid://14843436332"

UIAspectRatioConstraint_11.Parent = ListButton

EquipButton_2.Name = "EquipButton"
EquipButton_2.Parent = Sidebar
EquipButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EquipButton_2.BackgroundTransparency = 1.000
EquipButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
EquipButton_2.BorderSizePixel = 0
EquipButton_2.Position = UDim2.new(0.0852773488, 0, 0.0415987074, 0)
EquipButton_2.Size = UDim2.new(0.880999982, 0, 0.257999986, 0)
EquipButton_2.Image = "rbxassetid://16352626198"

UIAspectRatioConstraint_12.Parent = EquipButton_2

UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_5.Color = Color3.fromRGB(255, 255, 255)
UIStroke_5.Parent = Panel

UIAspectRatioConstraint_13.Parent = Panel
UIAspectRatioConstraint_13.AspectRatio = 1.894

Tip.Name = "Tip"
Tip.Parent = exprblx
Tip.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tip.BackgroundTransparency = 9.000
Tip.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tip.BorderSizePixel = 0
Tip.Position = UDim2.new(0, 1690, 0, -27)
Tip.Size = UDim2.new(0.377316535, 0, 0.389839321, 0)
Tip.Visible = false
Tip.Font = Enum.Font.GothamBold
Tip.Text = ""
Tip.TextColor3 = Color3.fromRGB(243, 243, 243)
Tip.TextSize = 11.000
Tip.TextWrapped = true
Tip.TextXAlignment = Enum.TextXAlignment.Left
Tip.TextYAlignment = Enum.TextYAlignment.Top

UIAspectRatioConstraint_14.Parent = Tip
UIAspectRatioConstraint_14.AspectRatio = 1.833

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

local function Randomize()
	local Shirt = ShirtsTable[math.random(1,#ShirtsTable)]
	local Pants = PantsTable[math.random(1,#PantsTable)]
	local HatOrHair = HatsTable[math.random(1,#HatsTable)]
	local RandomAccessory = RandomTable[math.random(1,#RandomTable)]
	local RandomAccessory2
	local Face = FaceTable[math.random(1,#FaceTable)]

	if math.random(1,2) == 2 then
		RandomAccessory2 = RandomTable[math.random(1,#RandomTable)]
	end
	
	return Shirt, Pants, HatOrHair, Face, RandomAccessory, RandomAccessory2
end

CloseButton.MouseButton1Click:Connect(function()
	game.TweenService:Create(Panel, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)}):Play()
	CloseSound:Play()
	_G.exprblxasset = false
	task.wait(0.6)
	exprblx:Destroy()
end)

EquipButton_2.MouseButton1Click:Connect(function()
	EquipperFrame.Visible = true
	ListFrame.Visible = false

	ClickSound:Play()

	game.TweenService:Create(EquipButton_2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.782, 0,0.258, 0)}):Play()
	task.wait(0.1)
	game.TweenService:Create(EquipButton_2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.881, 0,0.258, 0)}):Play()
end)
EquipButton_2.MouseEnter:Connect(function()
	Tip.Text = "- Asset Equipper"
	Tip.Visible = true
end)
EquipButton_2.MouseLeave:Connect(function()
	Tip.Text = ""
	Tip.Visible = false
end)

ListButton.MouseButton1Click:Connect(function()
	EquipperFrame.Visible = false
	ListFrame.Visible = true

	ClickSound:Play()

	game.TweenService:Create(ListButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.571, 0,0.2, 0)}):Play()
	task.wait(0.1)
	game.TweenService:Create(ListButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0.682, 0,0.258, 0)}):Play()
end)
ListButton.MouseEnter:Connect(function()
	Tip.Text = "- Asset List"
	Tip.Visible = true
end)
ListButton.MouseLeave:Connect(function()
	Tip.Text = ""
	Tip.Visible = false
end)

game["Run Service"].Heartbeat:Connect(function()
	Tip.Position = UDim2.new(0, game.UserInputService:GetMouseLocation().X + 15, 0, game.UserInputService:GetMouseLocation().Y - 60)
end)

EquipButton.MouseButton1Click:Connect(function()
	local AssetID = tonumber(AssetIDBox.Text)
	
	ClothingRemote:FireServer("Pants", AssetID)
	ClothingRemote:FireServer("Shirt", AssetID)
	FaceRemote:FireServer(AssetID)
	HatRemote:FireServer(AssetID)
end)

RandomizeButton.MouseButton1Click:Connect(function()
	TakeOffRemote:FireServer()
	local Shirt, Pants, HatOrHair, Face, RandomAccessory, RandomAccessory2 = Randomize()
	
	if RandomAccessory then
		HatRemote:FireServer(RandomAccessory)
	end
	if RandomAccessory2 then
		HatRemote:FireServer(RandomAccessory2)
	end
	
	FaceRemote:FireServer(Face)
	ClothingRemote:FireServer("Shirt", Shirt)
	ClothingRemote:FireServer("Pants", Pants)
	HatRemote:FireServer(HatOrHair)
end)

Panel.Draggable = true
Panel.Active = true

TakeoffAllButton.MouseButton1Click:Connect(function()
	TakeOffRemote:FireServer()
end)
TakeoffButton.MouseButton1Click:Connect(function()
	TakeOffRemote:FireServer()
end)

for _, Item in pairs(ShirtsTable) do
	local Asset = game:GetService("MarketplaceService"):GetProductInfo(Item)
	local Button = AssetButtonTemp:Clone()
	Button.Parent = AssetsScrolling
	Button.Visible = true
	Button.Text = Asset.Name
	Button.MouseButton1Click:Connect(function()
		ClothingRemote:FireServer("Shirt", Item)
		ExecuteSound:Play()
	end)
end
for _, Item in pairs(PantsTable) do
	local Asset = game:GetService("MarketplaceService"):GetProductInfo(Item)
	local Button = AssetButtonTemp:Clone()
	Button.Parent = AssetsScrolling
	Button.Visible = true
	Button.Text = Asset.Name
	Button.MouseButton1Click:Connect(function()
		ClothingRemote:FireServer("Pants", Item)
		ExecuteSound:Play()
	end)
end
for _, Item in pairs(HatsTable) do
	local Asset = game:GetService("MarketplaceService"):GetProductInfo(Item)
	local Button = AssetButtonTemp:Clone()
	Button.Parent = AssetsScrolling
	Button.Visible = true
	Button.Text = Asset.Name
	Button.MouseButton1Click:Connect(function()
		HatRemote:FireServer(Item)
		ExecuteSound:Play()
	end)
end
for _, Item in pairs(RandomTable) do
	local Asset = game:GetService("MarketplaceService"):GetProductInfo(Item)
	local Button = AssetButtonTemp:Clone()
	Button.Parent = AssetsScrolling
	Button.Visible = true
	Button.Text = Asset.Name
	Button.MouseButton1Click:Connect(function()
		HatRemote:FireServer(Item)
		ExecuteSound:Play()
	end)
end
for _, Item in pairs(FaceTable) do
	local Asset = game:GetService("MarketplaceService"):GetProductInfo(Item)
	local Button = AssetButtonTemp:Clone()
	Button.Parent = AssetsScrolling
	Button.Visible = true
	Button.Text = Asset.Name
	Button.MouseButton1Click:Connect(function()
		FaceRemote:FireServer(Item)
		ExecuteSound:Play()
	end)
end

Notification("Loaded Black Cat Asset Equipper panel (v1.7)")
