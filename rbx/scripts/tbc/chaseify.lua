local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")

local User = "Bl0ckSparkT0xic23"
local ID = Players:GetUserIdFromNameAsync(User)

local HumanoidDesc = Players:GetHumanoidDescriptionFromUserId(ID)

AvatarEditorService:PromptSaveAvatar(HumanoidDesc, Enum.HumanoidRigType.R6)
