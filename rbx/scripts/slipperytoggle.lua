local function makeSlippery(part)
    if part:IsA("BasePart") then
        local properties = PhysicalProperties.new(0.7, 0, 0.5, 100, 1) -- Low friction
        part.CustomPhysicalProperties = properties
    end
end

local function makeUnslippery(part)
    if part:IsA("BasePart") then
        local properties = PhysicalProperties.new(0.7, 0, 0.5, 0, 1) -- Low friction
        part.CustomPhysicalProperties = properties
    end
end

local debounce = false

game.UserInputService.InputBegan:Connect(function(Input, GPE)
    if Input.KeyCode == Enum.KeyCode.H and not GPE then
        if debounce then
            debounce = false
            
            for _, part in ipairs(workspace:GetDescendants()) do
               makeUnslippery(part)
            end
        else
            debounce = true
            
            for _, part in ipairs(workspace:GetDescendants()) do
               makeSlippery(part)
            end 
        end
    end
end)
