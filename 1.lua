-- =====================================================================
-- RUINZ UI LIBRARY - ARCHITECTURAL SCHEMATIC EDITION
-- Designed by Senior Roblox UI Engineer & Expert UX Designer
-- =====================================================================

local RuinzUI = {}
RuinzUI.__index = RuinzUI

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

-- Theme: Architectural Schematic (Light Mode Only)
local THEME = {
    Background = Color3.fromRGB(249, 249, 249),
    Paper = Color3.fromRGB(252, 252, 252),
    Text = Color3.fromRGB(34, 34, 34),
    Accent = Color3.fromRGB(91, 155, 213),
    Blueprint = Color3.fromRGB(74, 144, 226),
    Grey = Color3.fromRGB(128, 128, 128),
    Border = Color3.fromRGB(200, 200, 200),
    BorderActive = Color3.fromRGB(74, 144, 226),
    Font = Enum.Font.Gotham,
    CornerRadius = 8,
    Padding = 12,
}

-- Utility Functions
local function Create(className, properties)
    local obj = Instance.new(className)
    for prop, value in pairs(properties or {}) do
        pcall(function() obj[prop] = value end)
    end
    return obj
end

local function Tween(obj, props, duration, easing, direction)
    duration = duration or 0.2
    easing = easing or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    local tween = TweenService:Create(obj, TweenInfo.new(duration, easing, direction), props)
    tween:Play()
    return tween
end

local function AddCorner(obj, radius)
    return Create("UICorner", {CornerRadius = UDim.new(0, radius or THEME.CornerRadius), Parent = obj})
end

local function AddStroke(obj, color, thickness)
    return Create("UIStroke", {Color = color or THEME.Border, Thickness = thickness or 1, Parent = obj})
end

local function MakeDraggable(frame, dragBar)
    local dragging = false
    local dragStart, startPos
    
    dragBar = dragBar or frame
    dragBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- =====================================================================
-- WINDOW CREATION
-- =====================================================================
function RuinzUI.new(config)
    config = config or {}
    local titleText = config.Title or "RUINZ // ARCHITECTURAL SCHEMATIC"
    
    if CoreGui:FindFirstChild("RuinzArchitecturalUI") then
        CoreGui.RuinzArchitecturalUI:Destroy()
    end
    
    local self = setmetatable({}, RuinzUI)
    
    self.SG = Create("ScreenGui", {
        Name = "RuinzArchitecturalUI",
        Parent = CoreGui,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })
    
    self.Main = Create("Frame", {
        Parent = self.SG,
        BackgroundColor3 = THEME.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -340, 0.5, -225),
        Size = UDim2.new(0, 680, 0, 450),
        ClipsDescendants = true,
    })
    AddCorner(self.Main, THEME.CornerRadius)
    AddStroke(self.Main, THEME.Border, 1)
    
    -- Blueprint Grid Pattern Effect Lines
    local blueprintLineH = Create("Frame", {
        Parent = self.Main,
        BackgroundColor3 = THEME.Blueprint,
        BackgroundTransparency = 0.9,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 45),
        Size = UDim2.new(1, 0, 0, 1),
    })
    
    -- Top Navigation Bar
    self.TopBar = Create("Frame", {
        Parent = self.Main,
        BackgroundColor3 = THEME.Paper,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 45),
    })
    AddCorner(self.TopBar, THEME.CornerRadius)
    
    local logo = Create("TextLabel", {
        Parent = self.TopBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(0, 30, 1, 0),
        Font = THEME.Font,
        Text = "[R]",
        TextColor3 = THEME.Blueprint,
        TextSize = 14,
        FontWeight = Enum.FontWeight.Bold,
    })
    
    local title = Create("TextLabel", {
        Parent = self.TopBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 45, 0, 0),
        Size = UDim2.new(0, 400, 1, 0),
        Font = THEME.Font,
        Text = titleText,
        TextColor3 = THEME.Text,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontWeight = Enum.FontWeight.Medium,
    })
    
    -- Close & Minimize Buttons
    local closeBtn = Create("TextButton", {
        Parent = self.TopBar,
        BackgroundColor3 = THEME.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -36, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = THEME.Font,
        Text = "×",
        TextColor3 = THEME.Text,
        TextSize = 14,
        AutoButtonColor = false,
    })
    AddCorner(closeBtn, 4)
    AddStroke(closeBtn, THEME.Border, 1)
    
    closeBtn.MouseButton1Click:Connect(function()
        self.SG:Destroy()
    end)
    
    closeBtn.MouseEnter:Connect(function() Tween(closeBtn, {BackgroundColor3 = THEME.Accent, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15) end)
    closeBtn.MouseLeave:Connect(function() Tween(closeBtn, {BackgroundColor3 = THEME.Background, TextColor3 = THEME.Text}, 0.15) end)

    local minimized = false
    local minBtn = Create("TextButton", {
        Parent = self.TopBar,
        BackgroundColor3 = THEME.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -68, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = THEME.Font,
        Text = "−",
        TextColor3 = THEME.Text,
        TextSize = 14,
        AutoButtonColor = false,
    })
    AddCorner(minBtn, 4)
    AddStroke(minBtn, THEME.Border, 1)
    
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        Tween(self.Main, {Size = minimized and UDim2.new(0, 680, 0, 45) or UDim2.new(0, 680, 0, 450)}, 0.25)
    end)
    
    minBtn.MouseEnter:Connect(function() Tween(minBtn, {BackgroundColor3 = THEME.Blueprint, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15) end)
    minBtn.MouseLeave:Connect(function() Tween(minBtn, {BackgroundColor3 = THEME.Background, TextColor3 = THEME.Text}, 0.15) end)

    MakeDraggable(self.Main, self.TopBar)

    -- Sidebar Navigation
    self.Sidebar = Create("ScrollingFrame", {
        Parent = self.Main,
        BackgroundColor3 = THEME.Paper,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 46),
        Size = UDim2.new(0, 150, 1, -46),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = THEME.Blueprint,
    })
    AddStroke(self.Sidebar, THEME.Border, 1)

    Create("UIListLayout", {
        Parent = self.Sidebar,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    })
    Create("UIPadding", {
        Parent = self.Sidebar,
        PaddingTop = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
    })

    -- Content Area
    self.ContentArea = Create("Frame", {
        Parent = self.Main,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 158, 0, 52),
        Size = UDim2.new(1, -166, 1, -58),
    })

    self.Tabs = {}
    self.Pages = {}
    self.FirstTab = true

    return self
end

-- =====================================================================
-- TAB SYSTEM
-- =====================================================================
function RuinzUI:CreateTab(name, icon)
    icon = icon or "◆"
    
    local tabBtn = Create("TextButton", {
        Parent = self.Sidebar,
        BackgroundColor3 = self.FirstTab and THEME.Accent or THEME.Background,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 32),
        Font = THEME.Font,
        Text = "  " .. icon .. "  " .. name,
        TextColor3 = self.FirstTab and Color3.fromRGB(255, 255, 255) or THEME.Text,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        AutoButtonColor = false,
    })
    AddCorner(tabBtn, 6)
    AddStroke(tabBtn, THEME.Border, 1)

    local page = Create("ScrollingFrame", {
        Parent = self.ContentArea,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = THEME.Grey,
        Visible = self.FirstTab,
    })

    Create("UIListLayout", {
        Parent = page,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 12),
    })
    Create("UIPadding", {
        Parent = page,
        PaddingRight = UDim.new(0, 12),
        PaddingBottom = UDim.new(0, 12),
    })

    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(self.Pages) do p.Visible = false end
        for _, t in pairs(self.Tabs) do
            Tween(t.Button, {BackgroundColor3 = THEME.Background, TextColor3 = THEME.Text}, 0.15)
        end
        page.Visible = true
        Tween(tabBtn, {BackgroundColor3 = THEME.Accent, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
    end)

    tabBtn.MouseEnter:Connect(function()
        if page.Visible == false then
            Tween(tabBtn, {BackgroundColor3 = THEME.Paper}, 0.15)
        end
    end)
    tabBtn.MouseLeave:Connect(function()
        if page.Visible == false then
            Tween(tabBtn, {BackgroundColor3 = THEME.Background}, 0.15)
        end
    end)

    if self.FirstTab then
        self.FirstTab = false
    end

    table.insert(self.Tabs, {Button = tabBtn, Page = page})
    table.insert(self.Pages, page)

    local tabAPI = {Page = page, Window = self}

    -- Component Adders
    function tabAPI:CreateSection(title)
        local sec = Create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, 32),
        })
        AddCorner(sec, THEME.CornerRadius)
        AddStroke(sec, THEME.Blueprint, 1)

        Create("TextLabel", {
            Parent = sec,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 1, 0),
            Font = THEME.Font,
            Text = "SCHEMATIC // " .. string.upper(title),
            TextColor3 = THEME.Blueprint,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Bold,
        })
        return sec
    end

    function tabAPI:CreateButton(config)
        config = config or {}
        local name = config.Name or "Execute Command"
        local callback = config.Callback or function() end

        local btn = Create("TextButton", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, 36),
            Font = THEME.Font,
            Text = name,
            TextColor3 = THEME.Text,
            TextSize = 12,
            AutoButtonColor = false,
        })
        AddCorner(btn, THEME.CornerRadius)
        AddStroke(btn, THEME.Border, 1)

        btn.MouseEnter:Connect(function() Tween(btn, {BackgroundColor3 = THEME.Accent, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15) end)
        btn.MouseLeave:Connect(function() Tween(btn, {BackgroundColor3 = THEME.Paper, TextColor3 = THEME.Text}, 0.15) end)
        
        btn.MouseButton1Click:Connect(function()
            Tween(btn, {Size = UDim2.new(0.98, 0, 0, 34)}, 0.05)
            task.wait(0.05)
            Tween(btn, {Size = UDim2.new(1, 0, 0, 36)}, 0.05)
            callback()
        end)
        return btn
    end

    function tabAPI:CreateToggle(config)
        config = config or {}
        local name = config.Name or "Toggle Feature"
        local default = config.Default or false
        local callback = config.Callback or function() end

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, 38),
        })
        AddCorner(frame, THEME.CornerRadius)
        AddStroke(frame, THEME.Border, 1)

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -60, 1, 0),
            Font = THEME.Font,
            Text = name,
            TextColor3 = THEME.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        local togBg = Create("Frame", {
            Parent = frame,
            BackgroundColor3 = default and THEME.Blueprint or THEME.Background,
            Position = UDim2.new(1, -44, 0.5, -10),
            Size = UDim2.new(0, 36, 0, 20),
        })
        AddCorner(togBg, 10)
        AddStroke(togBg, THEME.Border, 1)

        local togDot = Create("Frame", {
            Parent = togBg,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = default and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
            Size = UDim2.new(0, 14, 0, 14),
        })
        AddCorner(togDot, 7)

        local state = default
        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                state = not state
                Tween(togBg, {BackgroundColor3 = state and THEME.Blueprint or THEME.Background}, 0.15)
                Tween(togDot, {Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)}, 0.15)
                callback(state)
            end
        end)
        return {Value = state}
    end

    function tabAPI:CreateSlider(config)
        config = config or {}
        local name = config.Name or "Slider Metric"
        local min = config.Min or 0
        local max = config.Max or 100
        local default = config.Default or 50
        local callback = config.Callback or function() end

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, 52),
        })
        AddCorner(frame, THEME.CornerRadius)
        AddStroke(frame, THEME.Border, 1)

        local label = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 6),
            Size = UDim2.new(1, -24, 0, 16),
            Font = THEME.Font,
            Text = name .. ": " .. default,
            TextColor3 = THEME.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        local barBg = Create("Frame", {
            Parent = frame,
            BackgroundColor3 = THEME.Background,
            Position = UDim2.new(0, 12, 0, 30),
            Size = UDim2.new(1, -24, 0, 8),
        })
        AddCorner(barBg, 4)
        AddStroke(barBg, THEME.Border, 1)

        local barFill = Create("Frame", {
            Parent = barBg,
            BackgroundColor3 = THEME.Blueprint,
            Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        })
        AddCorner(barFill, 4)

        barBg.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local conn
                conn = RunService.RenderStepped:Connect(function()
                    local mouse = UserInputService:GetMouseLocation()
                    local perc = math.clamp((mouse.X - barBg.AbsolutePosition.X) / barBg.AbsoluteSize.X, 0, 1)
                    local val = math.floor(min + (max - min) * perc)
                    barFill.Size = UDim2.new(perc, 0, 1, 0)
                    label.Text = name .. ": " .. val
                    callback(val)
                end)
                UserInputService.InputEnded:Connect(function(endInput)
                    if endInput.UserInputType == Enum.UserInputType.MouseButton1 then
                        if conn then conn:Disconnect() end
                    end
                end)
            end
        end)
    end

    return tabAPI
end

return RuinzUI
