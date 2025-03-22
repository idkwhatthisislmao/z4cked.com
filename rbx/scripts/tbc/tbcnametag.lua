local function tbcNametag(Rate, Table)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NamechangeEvent = ReplicatedStorage.Events.ChangeTagColor

local rand = Random.new()
local sequences = {}
local s_cache = {}

local function randomColor()
    return Color3.new(rand:NextNumber(), rand:NextNumber(), rand:NextNumber())
end

local function customSequence(SequenceName, Colors)
    if sequences[SequenceName] then
        local cacheNumber = s_cache[SequenceName]
        local sequenceColor = sequences[SequenceName][cacheNumber]
        local sequenceReset = false

        s_cache[SequenceName] += 1
        if not sequences[SequenceName][s_cache[SequenceName]] then
            s_cache[SequenceName] = 1
            sequenceReset = true
        end

        return sequences[SequenceName][s_cache[SequenceName]]
    else
        sequences[SequenceName] = {}
        s_cache[SequenceName] = 1

        for _, Color in pairs(Colors) do
            table.insert(sequences[SequenceName], Color)
        end

        s_cache[SequenceName] += 1
        return sequences[SequenceName][s_cache[SequenceName] - 1]
    end
end 

while task.wait(Rate) do
    for _, Stuff in pairs(Table) do
        if Stuff.Type = "Name" then
            NamechangeEvent:FireServer("Namey", Stuff.Sequence)
        end    
        if Stuff.Type = "Rank" then
            NamechangeEvent:FireServer("Rank", Stuff.Sequence)
        end   
        if Stuff.Type = "Afk" then
            NamechangeEvent:FireServer("AfkTimer", Stuff.Sequence)
        end   
    end    
end
end    

return tbcNametag
