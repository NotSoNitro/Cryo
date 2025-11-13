local imageFrame = script.Parent

local playerService = game:GetService("Players")
local uid = playerService.LocalPlayer.UserId

local thumbSize = Enum.ThumbnailSize.Size420x420
local thumbType = Enum.ThumbnailType.HeadShot
local content = playerService:GetUserThumbnailAsync(uid,thumbType,thumbSize)

imageFrame.Image = content