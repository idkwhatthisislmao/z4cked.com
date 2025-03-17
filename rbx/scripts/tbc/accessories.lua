local event = game.ReplicatedStorage.Remotes.V2.PutOnAccessory

local function equip(table)
   for _, item in pairs(table) do
         event:FireServer(item)
    end
end

return equip
