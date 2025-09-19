-- RedPulse Tool Giver UI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")

ScreenGui.Name = "RedPulseToolGiver"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.0610425249, 0, 0.0939490423, 0)
Frame.Size = UDim2.new(0, 218, 0, 225)
Frame.ClipsDescendants = true

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Frame

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ScrollingFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
ScrollingFrame.BorderSizePixel = 1
ScrollingFrame.Position = UDim2.new(0.0871559605, 0, 0.155555561, 0)
ScrollingFrame.Size = UDim2.new(0, 187, 0, 136)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 35, 0)
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 3)

TextButton.Parent = ScrollingFrame
TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Size = UDim2.new(0, 155, 0, 39)
TextButton.Visible = false
TextButton.Font = Enum.Font.GothamBold
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000
TextButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
TextButton.TextStrokeTransparency = 0.800
TextButton.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = TextButton

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.00129664713, 0, -0.000140406293, 0)
TextLabel.Size = UDim2.new(0, 218, 0, 25)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "REDPULSE TOOL GIVER"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextStrokeTransparency = 0.000

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.0825688094, 0, 0.804444432, 0)
TextButton_2.Size = UDim2.new(0, 180, 0, 30)
TextButton_2.Font = Enum.Font.GothamBold
TextButton_2.Text = "UPDATE TOOL LIST"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextSize = 14.000
TextButton_2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextStrokeTransparency = 0.000

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = TextButton_2

local function FNDR_fake_script()
    local script = Instance.new('LocalScript', Frame)

    local button = script.Parent.ScrollingFrame.TextButton
    button.Parent = nil
    button.Name = "slaves"
    
    local function updatelist()
        for i, v in script.Parent.ScrollingFrame:GetDescendants() do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end
    
        local function cloneToBackpack(toolName)
            local clonedTool = toolName:Clone()
            clonedTool.Parent = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
        end
        
        for i, v in pairs(game:GetDescendants()) do
            if v:IsA("Tool") and v.Parent.Parent ~= game:GetService("Players").LocalPlayer then
                local clonebutton = button:Clone()
                clonebutton.Parent = script.Parent.ScrollingFrame
                clonebutton.Visible = true
                clonebutton.Text = v.Name
                clonebutton.MouseButton1Click:Connect(function()
                    cloneToBackpack(v)
                end)
            end
        end
    end
    
    script.Parent.TextButton.MouseButton1Click:Connect(updatelist)
end
coroutine.wrap(FNDR_fake_script)()

local function SGRWUDK_fake_script()
    local script = Instance.new('LocalScript', Frame)

    local UIS = game:GetService('UserInputService')
    local frame = script.Parent
    local dragToggle = nil
    local dragSpeed = 0.25
    local dragStart = nil
    local startPos = nil
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {
            Position = position
        }):Play()
    end
    
    frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragToggle then
                updateInput(input)
            end
        end
    end)
end
coroutine.wrap(SGRWUDK_fake_script)()
