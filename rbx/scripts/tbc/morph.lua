return function(USERNAME)
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players           = game:GetService("Players")

local Player = Players.LocalPlayer
local RemotesFolder = ReplicatedStorage.Remotes.V2

local Remotes = {
    RemotesFolder.PutOnAccessory,
    RemotesFolder.PutOnFace,
    RemotesFolder.PutOnClothing,
    RemotesFolder.TakeOff
};

--

local function EquipAsset(ID)
    Remotes[1]:FireServer(ID)
    Remotes[2]:FireServer(ID)
    Remotes[3]:FireServer("Shirt", ID)
    Remotes[3]:FireServer("Pants", ID)
end

local function UpdateAvatar()
    for _, Asset in ipairs(_G.Cache) do
        EquipAsset(Asset)
    end
end

local function UpdateCache(Username)
    local UserID = Players:GetUserIdFromNameAsync(Username)
    if not UserID then return end

    local HumanoidDescription = Players:GetHumanoidDescriptionFromUserId(UserID)

    local Accessories = HumanoidDescription:GetAccessories(true)
    local Face        = HumanoidDescription.Face
    local Shirt       = HumanoidDescription.Shirt
    local Pants       = HumanoidDescription.Pants

    _G.Cache = {}
    Remotes[4]:FireServer()

    table.insert(_G.Cache, Face)
    table.insert(_G.Cache, Shirt)
    table.insert(_G.Cache, Pants)

    for _, Accessory in pairs(Accessories) do
        table.insert(_G.Cache, Accessory.AssetId)
    end
end

--

UpdateCache(USERNAME)
UpdateAvatar()

if not _G.AppearanceSpoofer then
    _G.AppearanceSpoofer = true
    
    Player.CharacterAppearanceLoaded:Connect(UpdateAvatar)
end
end
