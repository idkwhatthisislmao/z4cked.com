local Scripts = {
	[1] = {
		Name = "Slippery (toggle - h)",
		Src = game:HttpGet('https://raw.githubusercontent.com/idkwhatthisislmao/roblo/refs/heads/main/slip.lua', true),
	},
	[2] = {
		Name = "Jerk Off Tool (R6)",
		Src = game:HttpGet("https://raw.githubusercontent.com/idkwhatthisislmao/roblo/refs/heads/main/jerkoff.lua")
	},
	[3] = {
		Name = "Infinite Yield",
		Src = game:HttpGet("https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source")
	},
	[4] = {
		Name = "Jailbreak Carspeed Spoofer",
		Src = game:HttpGet("https://raw.githubusercontent.com/idkwhatthisislmao/roblo/refs/heads/main/jailbreakcarspeedspoofer")
	},
	[5] = {
		Name = "Roblox Freecam (Shift P)",
		Src = game:HttpGet("https://raw.githubusercontent.com/idkwhatthisislmao/roblo/refs/heads/main/freecam.lua")
	},
	[6] = {
		Name = "Usercreation",
		Src = game:HttpGet("https://raw.githubusercontent.com/1price/usercreation/main/UserCreation.lua", true)
	},
}

if game.CoreGui:FindFirstChild("z4hub") then return end

local z4hub = Instance.new("ScreenGui")
local Mainframe = Instance.new("Frame")
local title = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local tab = Instance.new("Frame")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local scripts = Instance.new("ScrollingFrame")
local UICorner_2 = Instance.new("UICorner")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local Script = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local UIListLayout = Instance.new("UIListLayout")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local close = Instance.new("TextButton")
local UIPadding_3 = Instance.new("UIPadding")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")

z4hub.Name = "z4hub"
z4hub.Parent = game.CoreGui --// change
z4hub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Mainframe.Name = "Mainframe"
Mainframe.Parent = z4hub
Mainframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Mainframe.BackgroundTransparency = 0.550
Mainframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
Mainframe.BorderSizePixel = 0
Mainframe.Position = UDim2.new(0.530068696, 0, 0.366720527, 0)
Mainframe.Size = UDim2.new(0.208, 0,0.238, 0)

title.Name = "title"
title.Parent = Mainframe
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.010
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Position = UDim2.new(-0.0452571139, 0, 0.0241935849, 0)
title.Size = UDim2.new(0.438805968, 0, 0.144927531, 0)
title.Font = Enum.Font.SourceSansBold
title.Text = "exprblx"
title.TextColor3 = Color3.fromRGB(222, 222, 222)
title.TextScaled = true
title.TextSize = 14.000
title.TextTransparency = 0.470
title.TextWrapped = true

UIPadding.Parent = title
UIPadding.PaddingBottom = UDim.new(0.0166666359, 0)
UIPadding.PaddingLeft = UDim.new(0.258503407, 0)
UIPadding.PaddingRight = UDim.new(0.258503407, 0)
UIPadding.PaddingTop = UDim.new(0.0166666359, 0)

UIAspectRatioConstraint.Parent = title
UIAspectRatioConstraint.AspectRatio = 4.900

UICorner.CornerRadius = UDim.new(0.100000001, 0)
UICorner.Parent = Mainframe

tab.Name = "tab"
tab.Parent = Mainframe
tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tab.BackgroundTransparency = 0.800
tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
tab.BorderSizePixel = 0
tab.Position = UDim2.new(-1.82194498e-07, 0, 0.202372521, 0)
tab.Size = UDim2.new(1, 0, 0.0144927539, 0)

UIAspectRatioConstraint_2.Parent = tab
UIAspectRatioConstraint_2.AspectRatio = 111.667

scripts.Name = "scripts"
scripts.Parent = Mainframe
scripts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scripts.BackgroundTransparency = 0.950
scripts.BorderColor3 = Color3.fromRGB(0, 0, 0)
scripts.BorderSizePixel = 0
scripts.Position = UDim2.new(0.0567164198, 0, 0.280193239, 0)
scripts.Selectable = false
scripts.Size = UDim2.new(0.892537296, 0, 0.642512083, 0)
scripts.ScrollBarThickness = 3

UICorner_2.CornerRadius = UDim.new(0.100000001, 0)
UICorner_2.Parent = scripts

UIAspectRatioConstraint_3.Parent = scripts
UIAspectRatioConstraint_3.AspectRatio = 2.248

Script.Name = "Script"
Script.Parent = scripts
Script.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Script.BackgroundTransparency = 0.850
Script.BorderColor3 = Color3.fromRGB(0, 0, 0)
Script.BorderSizePixel = 0
Script.Size = UDim2.new(1, 0, 0.0700483099, 0)
Script.Visible = false
Script.Font = Enum.Font.SourceSansBold
Script.Text = "Template"
Script.TextColor3 = Color3.fromRGB(255, 255, 255)
Script.TextScaled = true
Script.TextSize = 25.000
Script.TextTransparency = 0.470
Script.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0.300000012, 0)
UICorner_3.Parent = Script

UIAspectRatioConstraint_4.Parent = Script
UIAspectRatioConstraint_4.AspectRatio = 10.310

UIListLayout.Parent = scripts
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.00999999978, 0)

UIAspectRatioConstraint_5.Parent = Mainframe
UIAspectRatioConstraint_5.AspectRatio = 1.618

close.Name = "close"
close.Parent = Mainframe
close.Active = false
close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundTransparency = 1.000
close.BorderColor3 = Color3.fromRGB(0, 0, 0)
close.BorderSizePixel = 0
close.Position = UDim2.new(0.718922019, 0, 0.0241935849, 0)
close.Selectable = false
close.Size = UDim2.new(0.438805968, 0, 0.144927531, 0)
close.Font = Enum.Font.SourceSansBold
close.Text = "X"
close.TextColor3 = Color3.fromRGB(222, 222, 222)
close.TextScaled = true
close.TextSize = 1.000
close.TextTransparency = 0.580
close.TextWrapped = true

UIPadding_3.Parent = close
UIPadding_3.PaddingBottom = UDim.new(0.0166666359, 0)
UIPadding_3.PaddingLeft = UDim.new(0.452380955, 0)
UIPadding_3.PaddingRight = UDim.new(0.452380955, 0)
UIPadding_3.PaddingTop = UDim.new(0.0166666359, 0)

UIAspectRatioConstraint_6.Parent = close
UIAspectRatioConstraint_6.AspectRatio = 4.900

for _, ScriptB in pairs(Scripts) do
	local NewButton = Script:Clone()
	NewButton.Parent = scripts
	NewButton.Visible = true
	NewButton.Text = ScriptB.Name
	NewButton.MouseButton1Click:Connect(function()
		print("Executed "..ScriptB.Name.."!")
		loadstring(ScriptB.Src)()
	end)
end

Mainframe.Draggable = true
Mainframe.Active = true

close.MouseButton1Click:Connect(function()
	z4hub:Destroy()
end)

print("Loaded exploding roblox ui")
