-- =====================================================================
-- RUINZ UI LIBRARY v2.0 - COMPLETE EDITION
-- ARCHITECTURAL SCHEMATIC THEME
-- Designed by Senior Roblox UI Engineer & Expert UX Designer
-- Total Lines: 3200+ (with all components)
-- =====================================================================

local RuinzUI = {}
RuinzUI.__index = RuinzUI

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local ClipboardService = game:GetService("ClipboardService")
local ContextActionService = game:GetService("ContextActionService")

-- Theme: Architectural Schematic (Light Mode Only) with Dark Mode support
local THEME = {
    -- Light Mode (Default)
    Background = Color3.fromRGB(249, 249, 249),
    Paper = Color3.fromRGB(252, 252, 252),
    Text = Color3.fromRGB(34, 34, 34),
    Accent = Color3.fromRGB(91, 155, 213),
    Blueprint = Color3.fromRGB(74, 144, 226),
    Grey = Color3.fromRGB(128, 128, 128),
    Border = Color3.fromRGB(200, 200, 200),
    BorderActive = Color3.fromRGB(74, 144, 226),
    Success = Color3.fromRGB(46, 204, 113),
    Danger = Color3.fromRGB(231, 76, 60),
    Warning = Color3.fromRGB(241, 196, 15),
    Info = Color3.fromRGB(52, 152, 219),
    Font = Enum.Font.Gotham,
    CornerRadius = 8,
    Padding = 12,
    ShadowSize = 4,
}

-- Dark Mode Theme
local DARK_THEME = {
    Background = Color3.fromRGB(30, 30, 30),
    Paper = Color3.fromRGB(40, 40, 40),
    Text = Color3.fromRGB(220, 220, 220),
    Accent = Color3.fromRGB(0, 188, 212),
    Blueprint = Color3.fromRGB(0, 150, 200),
    Grey = Color3.fromRGB(150, 150, 150),
    Border = Color3.fromRGB(60, 60, 60),
    BorderActive = Color3.fromRGB(0, 188, 212),
    Success = Color3.fromRGB(46, 204, 113),
    Danger = Color3.fromRGB(231, 76, 60),
    Warning = Color3.fromRGB(241, 196, 15),
    Info = Color3.fromRGB(52, 152, 219),
    Font = Enum.Font.Gotham,
    CornerRadius = 8,
    Padding = 12,
    ShadowSize = 4,
}

local currentTheme = THEME

-- Utility Functions
local function Create(className, properties)
    local obj = Instance.new(className)
    for prop, value in pairs(properties or {}) do
        pcall(function() obj[prop] = value end)
    end
    return obj
end

local function Tween(obj, props, duration, easing, direction, repeats)
    duration = duration or 0.2
    easing = easing or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    repeats = repeats or 0
    local tween = TweenService:Create(obj, TweenInfo.new(duration, easing, direction, repeats, false, 0), props)
    tween:Play()
    return tween
end

local function AddCorner(obj, radius)
    return Create("UICorner", {CornerRadius = UDim.new(0, radius or currentTheme.CornerRadius), Parent = obj})
end

local function AddStroke(obj, color, thickness, transparency)
    return Create("UIStroke", {
        Color = color or currentTheme.Border,
        Thickness = thickness or 1,
        Transparency = transparency or 0,
        Parent = obj
    })
end

local function AddShadow(obj, size, color, transparency)
    size = size or currentTheme.ShadowSize
    color = color or Color3.fromRGB(0, 0, 0)
    transparency = transparency or 0.3
    return Create("UIShadow", {
        Size = size,
        Color = color,
        Transparency = transparency,
        Parent = obj
    })
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

-- Notification System
local Notifications = {}
local function CreateNotification(title, message, type, duration)
    duration = duration or 3
    
    local notifContainer = CoreGui:FindFirstChild("RuinzNotifications")
    if not notifContainer then
        notifContainer = Create("ScreenGui", {
            Name = "RuinzNotifications",
            Parent = CoreGui,
            ResetOnSpawn = false,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        })
    end
    
    local notif = Create("Frame", {
        Parent = notifContainer,
        BackgroundColor3 = currentTheme.Paper,
        Position = UDim2.new(1, -300, 0, 10 + (#Notifications * 70)),
        Size = UDim2.new(0, 280, 0, 60),
        BorderSizePixel = 0,
        ClipsDescendants = true,
    })
    AddCorner(notif, 6)
    AddStroke(notif, type == "success" and currentTheme.Success or 
                     type == "error" and currentTheme.Danger or 
                     type == "warning" and currentTheme.Warning or 
                     currentTheme.Border, 1)
    
    local colorIndicator = Create("Frame", {
        Parent = notif,
        BackgroundColor3 = type == "success" and currentTheme.Success or 
                          type == "error" and currentTheme.Danger or 
                          type == "warning" and currentTheme.Warning or 
                          currentTheme.Accent,
        Size = UDim2.new(0, 4, 1, 0),
        BorderSizePixel = 0,
    })
    
    local titleLabel = Create("TextLabel", {
        Parent = notif,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 16, 0, 6),
        Size = UDim2.new(1, -24, 0, 20),
        Font = currentTheme.Font,
        Text = title,
        TextColor3 = currentTheme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontWeight = Enum.FontWeight.Bold,
    })
    
    local msgLabel = Create("TextLabel", {
        Parent = notif,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 16, 0, 28),
        Size = UDim2.new(1, -24, 0, 26),
        Font = currentTheme.Font,
        Text = message,
        TextColor3 = currentTheme.Grey,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
    })
    
    local closeNotif = Create("TextButton", {
        Parent = notif,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -24, 0, 4),
        Size = UDim2.new(0, 18, 0, 18),
        Font = currentTheme.Font,
        Text = "✕",
        TextColor3 = currentTheme.Grey,
        TextSize = 10,
        AutoButtonColor = false,
    })
    
    closeNotif.MouseButton1Click:Connect(function()
        Tween(notif, {Position = UDim2.new(1, 20, 0, 10 + (#Notifications * 70))}, 0.3)
        task.wait(0.3)
        notif:Destroy()
        table.remove(Notifications, table.find(Notifications, notif))
    end)
    
    table.insert(Notifications, notif)
    
    -- Animate In
    notif.Position = UDim2.new(1, 20, 0, 10 + (#Notifications * 70))
    Tween(notif, {Position = UDim2.new(1, -300, 0, 10 + (#Notifications * 70))}, 0.3)
    
    -- Auto Dismiss
    task.wait(duration)
    if notif.Parent then
        Tween(notif, {Position = UDim2.new(1, 20, 0, 10 + (#Notifications * 70))}, 0.3)
        task.wait(0.3)
        notif:Destroy()
        table.remove(Notifications, table.find(Notifications, notif))
    end
    
    return notif
end

-- =====================================================================
-- WINDOW CREATION
-- =====================================================================
function RuinzUI.new(config)
    config = config or {}
    local titleText = config.Title or "RUINZ // ARCHITECTURAL SCHEMATIC"
    local darkMode = config.DarkMode or false
    local resizable = config.Resizable or false
    
    if darkMode then
        currentTheme = DARK_THEME
    else
        currentTheme = THEME
    end
    
    if CoreGui:FindFirstChild("RuinzArchitecturalUI") then
        CoreGui.RuinzArchitecturalUI:Destroy()
    end
    
    local self = setmetatable({}, RuinzUI)
    self.Config = config
    self.DarkMode = darkMode
    self.Resizable = resizable
    self.Notifications = {}
    self.Modals = {}
    self.ContextMenus = {}
    self.Tooltips = {}
    
    self.SG = Create("ScreenGui", {
        Name = "RuinzArchitecturalUI",
        Parent = CoreGui,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })
    
    self.Main = Create("Frame", {
        Parent = self.SG,
        BackgroundColor3 = currentTheme.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -400, 0.5, -300),
        Size = UDim2.new(0, 800, 0, 600),
        ClipsDescendants = true,
    })
    AddCorner(self.Main, currentTheme.CornerRadius)
    AddStroke(self.Main, currentTheme.Border, 1)
    AddShadow(self.Main, 8, Color3.fromRGB(0, 0, 0), 0.15)
    
    -- Blueprint Grid Pattern
    local gridContainer = Create("Frame", {
        Parent = self.Main,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 0,
    })
    
    for i = 0, 20 do
        Create("Frame", {
            Parent = gridContainer,
            BackgroundColor3 = currentTheme.Blueprint,
            BackgroundTransparency = 0.92,
            BorderSizePixel = 0,
            Position = UDim2.new(0, i * 40, 0, 0),
            Size = UDim2.new(0, 1, 1, 0),
            ZIndex = 0,
        })
        Create("Frame", {
            Parent = gridContainer,
            BackgroundColor3 = currentTheme.Blueprint,
            BackgroundTransparency = 0.92,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 0, i * 40),
            Size = UDim2.new(1, 0, 0, 1),
            ZIndex = 0,
        })
    end
    
    -- Top Navigation Bar
    self.TopBar = Create("Frame", {
        Parent = self.Main,
        BackgroundColor3 = currentTheme.Paper,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 48),
        ZIndex = 10,
    })
    AddCorner(self.TopBar, currentTheme.CornerRadius)
    AddStroke(self.TopBar, currentTheme.Border, 1, 0.5)
    
    -- Logo
    local logo = Create("TextLabel", {
        Parent = self.TopBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(0, 40, 1, 0),
        Font = currentTheme.Font,
        Text = "[R]",
        TextColor3 = currentTheme.Blueprint,
        TextSize = 16,
        FontWeight = Enum.FontWeight.Bold,
        ZIndex = 11,
    })
    
    local title = Create("TextLabel", {
        Parent = self.TopBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 50, 0, 0),
        Size = UDim2.new(0, 500, 1, 0),
        Font = currentTheme.Font,
        Text = titleText,
        TextColor3 = currentTheme.Text,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontWeight = Enum.FontWeight.Medium,
        ZIndex = 11,
    })
    
    -- Top Bar Controls
    local controlContainer = Create("Frame", {
        Parent = self.TopBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -160, 0, 0),
        Size = UDim2.new(0, 160, 1, 0),
        ZIndex = 11,
    })
    
    -- Dark Mode Toggle
    local darkToggle = Create("TextButton", {
        Parent = controlContainer,
        BackgroundColor3 = currentTheme.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 4, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = currentTheme.Font,
        Text = darkMode and "☽" or "☀",
        TextColor3 = currentTheme.Text,
        TextSize = 14,
        AutoButtonColor = false,
        ZIndex = 12,
    })
    AddCorner(darkToggle, 4)
    AddStroke(darkToggle, currentTheme.Border, 1)
    
    darkToggle.MouseButton1Click:Connect(function()
        self.DarkMode = not self.DarkMode
        self:SetTheme(self.DarkMode)
        darkToggle.Text = self.DarkMode and "☽" or "☀"
        CreateNotification("Theme Changed", self.DarkMode and "Dark Mode Enabled" or "Light Mode Enabled", "info")
    end)
    
    -- Settings Button
    local settingsBtn = Create("TextButton", {
        Parent = controlContainer,
        BackgroundColor3 = currentTheme.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 34, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = currentTheme.Font,
        Text = "⚙",
        TextColor3 = currentTheme.Text,
        TextSize = 14,
        AutoButtonColor = false,
        ZIndex = 12,
    })
    AddCorner(settingsBtn, 4)
    AddStroke(settingsBtn, currentTheme.Border, 1)
    
    settingsBtn.MouseButton1Click:Connect(function()
        self:CreateModal("Settings", {
            {Type = "toggle", Name = "Dark Mode", Default = self.DarkMode},
            {Type = "toggle", Name = "Resizable", Default = self.Resizable},
            {Type = "slider", Name = "Opacity", Min = 50, Max = 100, Default = 100},
            {Type = "dropdown", Name = "Theme", Options = {"Light", "Dark", "Auto"}, Default = "Light"},
        })
    end)
    
    -- Close & Minimize Buttons
    local closeBtn = Create("TextButton", {
        Parent = controlContainer,
        BackgroundColor3 = currentTheme.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -34, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = currentTheme.Font,
        Text = "×",
        TextColor3 = currentTheme.Text,
        TextSize = 16,
        AutoButtonColor = false,
        ZIndex = 12,
    })
    AddCorner(closeBtn, 4)
    AddStroke(closeBtn, currentTheme.Border, 1)
    
    closeBtn.MouseButton1Click:Connect(function()
        self.SG:Destroy()
        CreateNotification("Window Closed", "Ruinz UI has been terminated", "info")
    end)
    
    closeBtn.MouseEnter:Connect(function() 
        Tween(closeBtn, {BackgroundColor3 = currentTheme.Danger, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15) 
    end)
    closeBtn.MouseLeave:Connect(function() 
        Tween(closeBtn, {BackgroundColor3 = currentTheme.Background, TextColor3 = currentTheme.Text}, 0.15) 
    end)

    local minimized = false
    local minBtn = Create("TextButton", {
        Parent = controlContainer,
        BackgroundColor3 = currentTheme.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -66, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = currentTheme.Font,
        Text = "−",
        TextColor3 = currentTheme.Text,
        TextSize = 16,
        AutoButtonColor = false,
        ZIndex = 12,
    })
    AddCorner(minBtn, 4)
    AddStroke(minBtn, currentTheme.Border, 1)
    
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        Tween(self.Main, {Size = minimized and UDim2.new(0, 800, 0, 48) or UDim2.new(0, 800, 0, 600)}, 0.3)
        if minimized then
            self.ContentArea.Visible = false
            self.Sidebar.Visible = false
        else
            self.ContentArea.Visible = true
            self.Sidebar.Visible = true
        end
    end)
    
    minBtn.MouseEnter:Connect(function() 
        Tween(minBtn, {BackgroundColor3 = currentTheme.Blueprint, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15) 
    end)
    minBtn.MouseLeave:Connect(function() 
        Tween(minBtn, {BackgroundColor3 = currentTheme.Background, TextColor3 = currentTheme.Text}, 0.15) 
    end)

    MakeDraggable(self.Main, self.TopBar)
    
    -- Resize Handle
    if resizable then
        self.ResizeHandle = Create("Frame", {
            Parent = self.Main,
            BackgroundColor3 = currentTheme.Border,
            BackgroundTransparency = 0.5,
            Position = UDim2.new(1, -8, 1, -8),
            Size = UDim2.new(0, 8, 0, 8),
            ZIndex = 100,
        })
        AddCorner(self.ResizeHandle, 2)
        
        local resizing = false
        local startSize, startPos
        
        self.ResizeHandle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                resizing = true
                startSize = self.Main.Size
                startPos = input.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        resizing = false
                    end
                end)
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and resizing then
                local delta = input.Position - startPos
                local newWidth = math.max(400, startSize.X.Offset + delta.X)
                local newHeight = math.max(300, startSize.Y.Offset + delta.Y)
                self.Main.Size = UDim2.new(0, newWidth, 0, newHeight)
                
                -- Update content area size
                if self.ContentArea then
                    self.ContentArea.Size = UDim2.new(1, -166, 1, -58)
                end
            end
        end)
    end

    -- Sidebar Navigation
    self.Sidebar = Create("ScrollingFrame", {
        Parent = self.Main,
        BackgroundColor3 = currentTheme.Paper,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 49),
        Size = UDim2.new(0, 160, 1, -49),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = currentTheme.Blueprint,
        ZIndex = 5,
    })
    AddStroke(self.Sidebar, currentTheme.Border, 1, 0.5)

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
        PaddingBottom = UDim.new(0, 12),
    })

    -- Content Area
    self.ContentArea = Create("Frame", {
        Parent = self.Main,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 168, 0, 56),
        Size = UDim2.new(1, -176, 1, -62),
        ZIndex = 5,
    })

    self.Tabs = {}
    self.Pages = {}
    self.FirstTab = true
    self.Components = {}
    self.SearchBar = nil

    return self
end

-- =====================================================================
-- THEME MANAGEMENT
-- =====================================================================
function RuinzUI:SetTheme(darkMode)
    self.DarkMode = darkMode
    currentTheme = darkMode and DARK_THEME or THEME
    
    -- Update all UI elements recursively
    local function updateTheme(obj)
        if obj:IsA("Frame") or obj:IsA("TextButton") or obj:IsA("TextLabel") or obj:IsA("TextBox") or obj:IsA("ScrollingFrame") then
            if obj.Name ~= "RuinzArchitecturalUI" and obj.Name ~= "Main" and obj.Name ~= "TopBar" and obj.Name ~= "Sidebar" then
                if obj.BackgroundColor3 == THEME.Background or obj.BackgroundColor3 == DARK_THEME.Background then
                    obj.BackgroundColor3 = currentTheme.Background
                elseif obj.BackgroundColor3 == THEME.Paper or obj.BackgroundColor3 == DARK_THEME.Paper then
                    obj.BackgroundColor3 = currentTheme.Paper
                elseif obj.BackgroundColor3 == THEME.Accent or obj.BackgroundColor3 == DARK_THEME.Accent then
                    obj.BackgroundColor3 = currentTheme.Accent
                elseif obj.BackgroundColor3 == THEME.Blueprint or obj.BackgroundColor3 == DARK_THEME.Blueprint then
                    obj.BackgroundColor3 = currentTheme.Blueprint
                end
                
                if obj.TextColor3 == THEME.Text or obj.TextColor3 == DARK_THEME.Text then
                    obj.TextColor3 = currentTheme.Text
                elseif obj.TextColor3 == THEME.Grey or obj.TextColor3 == DARK_THEME.Grey then
                    obj.TextColor3 = currentTheme.Grey
                end
            end
        end
        
        for _, child in ipairs(obj:GetChildren()) do
            updateTheme(child)
        end
    end
    
    updateTheme(self.Main)
    self.Main.BackgroundColor3 = currentTheme.Background
    self.TopBar.BackgroundColor3 = currentTheme.Paper
    self.Sidebar.BackgroundColor3 = currentTheme.Paper
    
    -- Update strokes
    for _, stroke in ipairs(self.Main:GetDescendants()) do
        if stroke:IsA("UIStroke") then
            stroke.Color = currentTheme.Border
        end
    end
end

-- =====================================================================
-- SEARCH BAR
-- =====================================================================
function RuinzUI:AddSearchBar(placeholder)
    placeholder = placeholder or "Search components..."
    
    if self.SearchBar then
        self.SearchBar:Destroy()
    end
    
    self.SearchBar = Create("TextBox", {
        Parent = self.Sidebar,
        BackgroundColor3 = currentTheme.Background,
        PlaceholderText = placeholder,
        PlaceholderColor3 = currentTheme.Grey,
        Text = "",
        TextColor3 = currentTheme.Text,
        TextSize = 11,
        Font = currentTheme.Font,
        Size = UDim2.new(1, 0, 0, 28),
        BorderSizePixel = 0,
        ClearTextOnFocus = false,
        ZIndex = 10,
    })
    AddCorner(self.SearchBar, 6)
    AddStroke(self.SearchBar, currentTheme.Border, 1)
    
    local searchIcon = Create("TextLabel", {
        Parent = self.SearchBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -24, 0, 0),
        Size = UDim2.new(0, 20, 1, 0),
        Font = currentTheme.Font,
        Text = "🔍",
        TextColor3 = currentTheme.Grey,
        TextSize = 12,
        ZIndex = 11,
    })
    
    self.SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = self.SearchBar.Text:lower()
        for _, tab in ipairs(self.Tabs) do
            local tabName = tab.Button.Text:lower()
            local visible = tabName:find(searchText) ~= nil or searchText == ""
            tab.Button.Visible = visible
        end
    end)
    
    return self.SearchBar
end

-- =====================================================================
-- TAB SYSTEM
-- =====================================================================
function RuinzUI:CreateTab(name, icon)
    icon = icon or "◆"
    
    local tabBtn = Create("TextButton", {
        Parent = self.Sidebar,
        BackgroundColor3 = self.FirstTab and currentTheme.Accent or currentTheme.Background,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 34),
        Font = currentTheme.Font,
        Text = "  " .. icon .. "  " .. name,
        TextColor3 = self.FirstTab and Color3.fromRGB(255, 255, 255) or currentTheme.Text,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        AutoButtonColor = false,
        ZIndex = 10,
    })
    AddCorner(tabBtn, 6)
    AddStroke(tabBtn, currentTheme.Border, 1)

    local page = Create("ScrollingFrame", {
        Parent = self.ContentArea,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = currentTheme.Grey,
        Visible = self.FirstTab,
        ZIndex = 10,
    })

    Create("UIListLayout", {
        Parent = page,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10),
    })
    Create("UIPadding", {
        Parent = page,
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 12),
        PaddingBottom = UDim.new(0, 12),
    })

    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(self.Pages) do p.Visible = false end
        for _, t in pairs(self.Tabs) do
            Tween(t.Button, {BackgroundColor3 = currentTheme.Background, TextColor3 = currentTheme.Text}, 0.15)
        end
        page.Visible = true
        Tween(tabBtn, {BackgroundColor3 = currentTheme.Accent, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
        
        -- Scroll to top
        page.CanvasPosition = Vector2.new(0, 0)
    end)

    tabBtn.MouseEnter:Connect(function()
        if page.Visible == false then
            Tween(tabBtn, {BackgroundColor3 = currentTheme.Paper}, 0.15)
        end
    end)
    tabBtn.MouseLeave:Connect(function()
        if page.Visible == false then
            Tween(tabBtn, {BackgroundColor3 = currentTheme.Background}, 0.15)
        end
    end)

    if self.FirstTab then
        self.FirstTab = false
    end

    table.insert(self.Tabs, {Button = tabBtn, Page = page})
    table.insert(self.Pages, page)

    local tabAPI = {
        Page = page,
        Window = self,
        Name = name,
        Icon = icon,
    }
    
    -- Store components for search
    tabAPI.Components = {}

    -- =====================================================================
    -- COMPONENT: SECTION
    -- =====================================================================
    function tabAPI:CreateSection(title, collapsible)
        collapsible = collapsible or false
        local expanded = true
        
        local sec = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, 36),
            ClipsDescendants = true,
        })
        AddCorner(sec, currentTheme.CornerRadius)
        AddStroke(sec, currentTheme.Blueprint, 1, 0.3)
        
        local header = Create("Frame", {
            Parent = sec,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, 36),
            ZIndex = 2,
        })
        
        local titleLabel = Create("TextLabel", {
            Parent = header,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 1, 0),
            Font = currentTheme.Font,
            Text = "SCHEMATIC // " .. string.upper(title),
            TextColor3 = currentTheme.Blueprint,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Bold,
        })
        
        local sectionContent = Create("Frame", {
            Parent = sec,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 36),
            Size = UDim2.new(1, 0, 0, 0),
            ClipsDescendants = true,
            ZIndex = 1,
        })
        
        Create("UIListLayout", {
            Parent = sectionContent,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        })
        Create("UIPadding", {
            Parent = sectionContent,
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8),
        })
        
        if collapsible then
            local collapseBtn = Create("TextButton", {
                Parent = header,
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -28, 0, 0),
                Size = UDim2.new(0, 24, 1, 0),
                Font = currentTheme.Font,
                Text = "⌵",
                TextColor3 = currentTheme.Grey,
                TextSize = 16,
                AutoButtonColor = false,
                ZIndex = 3,
            })
            
            collapseBtn.MouseButton1Click:Connect(function()
                expanded = not expanded
                if expanded then
                    sectionContent.Size = UDim2.new(1, 0, 0, sectionContent.AbsoluteSize.Y)
                    collapseBtn.Text = "⌵"
                else
                    sectionContent.Size = UDim2.new(1, 0, 0, 0)
                    collapseBtn.Text = "⌃"
                end
            end)
        end
        
        -- Auto size content
        sectionContent.Size = UDim2.new(1, 0, 0, sectionContent.AbsoluteSize.Y)
        
        -- Recalculate when children change
        sectionContent.ChildAdded:Connect(function()
            task.wait(0.1)
            if expanded then
                sectionContent.Size = UDim2.new(1, 0, 0, sectionContent.AbsoluteSize.Y)
                sec.Size = UDim2.new(1, 0, 0, 36 + sectionContent.AbsoluteSize.Y)
            end
        end)
        
        -- Return content container for adding components
        return {
            Container = sectionContent,
            Header = header,
            Section = sec,
            AddComponent = function(self, comp)
                comp.Parent = sectionContent
                return comp
            end
        }
    end

    -- =====================================================================
    -- COMPONENT: BUTTON
    -- =====================================================================
    function tabAPI:CreateButton(config)
        config = config or {}
        local name = config.Name or "Execute Command"
        local callback = config.Callback or function() end
        local icon = config.Icon or ""
        local color = config.Color or currentTheme.Accent
        local description = config.Description or ""

        local btn = Create("TextButton", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, 40),
            Font = currentTheme.Font,
            Text = icon ~= "" and icon .. " " .. name or name,
            TextColor3 = currentTheme.Text,
            TextSize = 12,
            AutoButtonColor = false,
        })
        AddCorner(btn, currentTheme.CornerRadius)
        AddStroke(btn, currentTheme.Border, 1)
        
        if description ~= "" then
            local descLabel = Create("TextLabel", {
                Parent = btn,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 22),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
            btn.Size = UDim2.new(1, 0, 0, 44)
        end

        btn.MouseEnter:Connect(function() 
            Tween(btn, {BackgroundColor3 = color, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15) 
        end)
        btn.MouseLeave:Connect(function() 
            Tween(btn, {BackgroundColor3 = currentTheme.Paper, TextColor3 = currentTheme.Text}, 0.15) 
        end)
        
        btn.MouseButton1Click:Connect(function()
            Tween(btn, {Size = UDim2.new(0.98, 0, 0, btn.Size.Y.Offset - 2)}, 0.05)
            task.wait(0.05)
            Tween(btn, {Size = UDim2.new(1, 0, 0, btn.Size.Y.Offset + 2)}, 0.05)
            
            local success, err = pcall(callback)
            if not success then
                CreateNotification("Button Error", "Error executing: " .. tostring(err), "error")
            end
        end)
        
        table.insert(tabAPI.Components, btn)
        return btn
    end

    -- =====================================================================
    -- COMPONENT: TOGGLE
    -- =====================================================================
    function tabAPI:CreateToggle(config)
        config = config or {}
        local name = config.Name or "Toggle Feature"
        local default = config.Default or false
        local callback = config.Callback or function() end
        local description = config.Description or ""
        local icon = config.Icon or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, description ~= "" and 48 or 40),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        local iconLabel = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 8, 0, 0),
            Size = UDim2.new(0, 24, 1, 0),
            Font = currentTheme.Font,
            Text = icon,
            TextColor3 = currentTheme.Grey,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Center,
        })

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, icon ~= "" and 36 or 12, description ~= "" and 0 or 0, 0),
            Size = UDim2.new(1, -80, 0, description ~= "" and 24 or 40),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
        })
        
        if description ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, icon ~= "" and 36 or 12, 0, 24),
                Size = UDim2.new(1, -80, 0, 20),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local togBg = Create("Frame", {
            Parent = frame,
            BackgroundColor3 = default and currentTheme.Blueprint or currentTheme.Background,
            Position = UDim2.new(1, -48, 0.5, -12),
            Size = UDim2.new(0, 38, 0, 22),
        })
        AddCorner(togBg, 11)
        AddStroke(togBg, currentTheme.Border, 1)

        local togDot = Create("Frame", {
            Parent = togBg,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 4, 0.5, -8),
            Size = UDim2.new(0, 16, 0, 16),
        })
        AddCorner(togDot, 8)

        local state = default
        
        local function toggleState()
            state = not state
            Tween(togBg, {BackgroundColor3 = state and currentTheme.Blueprint or currentTheme.Background}, 0.15)
            Tween(togDot, {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 4, 0.5, -8)}, 0.15)
            
            local success, err = pcall(callback, state)
            if not success then
                CreateNotification("Toggle Error", "Error: " .. tostring(err), "error")
            end
        end
        
        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                toggleState()
            end
        end)
        
        local toggleObject = {
            Value = state,
            Set = function(self, newState)
                state = newState
                Tween(togBg, {BackgroundColor3 = state and currentTheme.Blueprint or currentTheme.Background}, 0.15)
                Tween(togDot, {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 4, 0.5, -8)}, 0.15)
                pcall(callback, state)
            end,
            Toggle = toggleState,
        }
        
        table.insert(tabAPI.Components, toggleObject)
        return toggleObject
    end

    -- =====================================================================
    -- COMPONENT: SLIDER
    -- =====================================================================
    function tabAPI:CreateSlider(config)
        config = config or {}
        local name = config.Name or "Slider Metric"
        local min = config.Min or 0
        local max = config.Max or 100
        local default = config.Default or 50
        local step = config.Step or 1
        local callback = config.Callback or function() end
        local suffix = config.Suffix or ""
        local description = config.Description or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, description ~= "" and 70 or 58),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        local label = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 6),
            Size = UDim2.new(1, -24, 0, 18),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })

        local valueLabel = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -80, 0, 6),
            Size = UDim2.new(0, 70, 0, 18),
            Font = currentTheme.Font,
            Text = tostring(default) .. suffix,
            TextColor3 = currentTheme.Blueprint,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Right,
            FontWeight = Enum.FontWeight.Bold,
        })
        
        if description ~= "" then
            local descLabel = Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 26),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local barBg = Create("Frame", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(0, 12, 0, description ~= "" and 48 or 36),
            Size = UDim2.new(1, -24, 0, 8),
        })
        AddCorner(barBg, 4)
        AddStroke(barBg, currentTheme.Border, 1)

        local barFill = Create("Frame", {
            Parent = barBg,
            BackgroundColor3 = currentTheme.Blueprint,
            Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        })
        AddCorner(barFill, 4)

        local currentValue = default
        
        local function updateSlider(value)
            currentValue = math.max(min, math.min(max, value))
            local perc = (currentValue - min) / (max - min)
            barFill.Size = UDim2.new(perc, 0, 1, 0)
            valueLabel.Text = tostring(currentValue) .. suffix
            pcall(callback, currentValue)
        end

        barBg.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local conn
                conn = RunService.RenderStepped:Connect(function()
                    local mouse = UserInputService:GetMouseLocation()
                    local perc = math.clamp((mouse.X - barBg.AbsolutePosition.X) / barBg.AbsoluteSize.X, 0, 1)
                    local val = min + (max - min) * perc
                    local rounded = math.round(val / step) * step
                    updateSlider(rounded)
                end)
                UserInputService.InputEnded:Connect(function(endInput)
                    if endInput.UserInputType == Enum.UserInputType.MouseButton1 then
                        if conn then conn:Disconnect() end
                    end
                end)
            end
        end)
        
        local sliderObject = {
            Value = currentValue,
            Set = function(self, value)
                updateSlider(value)
            end,
        }
        
        table.insert(tabAPI.Components, sliderObject)
        return sliderObject
    end

    -- =====================================================================
    -- COMPONENT: DROPDOWN
    -- =====================================================================
    function tabAPI:CreateDropdown(config)
        config = config or {}
        local name = config.Name or "Select Option"
        local options = config.Options or {"Option 1", "Option 2", "Option 3"}
        local default = config.Default or options[1]
        local callback = config.Callback or function() end
        local multi = config.Multi or false
        local searchable = config.Searchable or false
        local description = config.Description or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, description ~= "" and 70 or 54),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        local label = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 4),
            Size = UDim2.new(1, -24, 0, 18),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        if description ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local selectedText = multi and "Select..." or default
        local selectedValue = multi and {} or default

        local dropdownBtn = Create("TextButton", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(0, 12, 0, description ~= "" and 44 or 28),
            Size = UDim2.new(1, -24, 0, 22),
            Font = currentTheme.Font,
            Text = tostring(selectedText),
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutoButtonColor = false,
        })
        AddCorner(dropdownBtn, 4)
        AddStroke(dropdownBtn, currentTheme.Border, 1)

        local arrow = Create("TextLabel", {
            Parent = dropdownBtn,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -24, 0, 0),
            Size = UDim2.new(0, 20, 1, 0),
            Font = currentTheme.Font,
            Text = "▼",
            TextColor3 = currentTheme.Grey,
            TextSize = 10,
        })

        local dropdownContainer = Create("Frame", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Paper,
            Position = UDim2.new(0, 12, 0, description ~= "" and 70 or 54),
            Size = UDim2.new(1, -24, 0, 0),
            ClipsDescendants = true,
            Visible = false,
            ZIndex = 100,
        })
        AddCorner(dropdownContainer, 4)
        AddStroke(dropdownContainer, currentTheme.Border, 1)
        AddShadow(dropdownContainer, 4, Color3.fromRGB(0, 0, 0), 0.2)

        Create("UIListLayout", {
            Parent = dropdownContainer,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2),
        })

        local isOpen = false
        local selectedOptions = {}
        
        if multi then
            selectedOptions = {}
        end
        
        local function updateDropdown()
            if multi then
                local text = #selectedOptions > 0 and table.concat(selectedOptions, ", ") or "Select..."
                dropdownBtn.Text = text
            else
                dropdownBtn.Text = tostring(selectedValue)
            end
        end
        
        local function createOption(option)
            local optBtn = Create("TextButton", {
                Parent = dropdownContainer,
                BackgroundColor3 = currentTheme.Background,
                Size = UDim2.new(1, 0, 0, 26),
                Font = currentTheme.Font,
                Text = "  " .. option,
                TextColor3 = currentTheme.Text,
                TextSize = 11,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutoButtonColor = false,
                ZIndex = 101,
            })
            AddCorner(optBtn, 3)
            
            local isSelected = false
            if multi then
                isSelected = table.find(selectedOptions, option) ~= nil
            else
                isSelected = (selectedValue == option)
            end
            
            if isSelected then
                optBtn.BackgroundColor3 = currentTheme.Blueprint
                optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
            
            optBtn.MouseEnter:Connect(function()
                if not isSelected then
                    Tween(optBtn, {BackgroundColor3 = currentTheme.Paper}, 0.1)
                end
            end)
            optBtn.MouseLeave:Connect(function()
                if not isSelected then
                    Tween(optBtn, {BackgroundColor3 = currentTheme.Background}, 0.1)
                end
            end)
            
            optBtn.MouseButton1Click:Connect(function()
                if multi then
                    local index = table.find(selectedOptions, option)
                    if index then
                        table.remove(selectedOptions, index)
                        optBtn.BackgroundColor3 = currentTheme.Background
                        optBtn.TextColor3 = currentTheme.Text
                        isSelected = false
                    else
                        table.insert(selectedOptions, option)
                        optBtn.BackgroundColor3 = currentTheme.Blueprint
                        optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                        isSelected = true
                    end
                    updateDropdown()
                    pcall(callback, selectedOptions)
                else
                    selectedValue = option
                    updateDropdown()
                    pcall(callback, option)
                    
                    -- Close dropdown
                    isOpen = false
                    dropdownContainer.Visible = false
                    dropdownContainer.Size = UDim2.new(1, -24, 0, 0)
                    arrow.Text = "▼"
                    
                    -- Update selection state
                    for _, child in ipairs(dropdownContainer:GetChildren()) do
                        if child:IsA("TextButton") then
                            local optText = child.Text:gsub("^  ", "")
                            child.BackgroundColor3 = (optText == option) and currentTheme.Blueprint or currentTheme.Background
                            child.TextColor3 = (optText == option) and Color3.fromRGB(255, 255, 255) or currentTheme.Text
                        end
                    end
                end
            end)
            
            return optBtn
        end
        
        for _, option in ipairs(options) do
            createOption(option)
        end
        
        dropdownBtn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            dropdownContainer.Visible = isOpen
            
            if isOpen then
                arrow.Text = "▲"
                local height = math.min(#options * 28 + 4, 200)
                Tween(dropdownContainer, {Size = UDim2.new(1, -24, 0, height)}, 0.2)
            else
                arrow.Text = "▼"
                Tween(dropdownContainer, {Size = UDim2.new(1, -24, 0, 0)}, 0.2)
                task.wait(0.2)
                dropdownContainer.Visible = false
            end
        end)
        
        local dropdownObject = {
            Value = selectedValue,
            Options = options,
            Set = function(self, newValue)
                if multi then
                    selectedOptions = newValue
                else
                    selectedValue = newValue
                end
                updateDropdown()
                pcall(callback, newValue)
            end,
        }
        
        table.insert(tabAPI.Components, dropdownObject)
        return dropdownObject
    end

    -- =====================================================================
    -- COMPONENT: KEYBIND PICKER
    -- =====================================================================
    function tabAPI:CreateKeybind(config)
        config = config or {}
        local name = config.Name or "Keybind"
        local default = config.Default or Enum.KeyCode.X
        local callback = config.Callback or function() end
        local description = config.Description or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, description ~= "" and 56 or 44),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(0, 120, 1, 0),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        if description ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 28),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local keyBtn = Create("TextButton", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(1, -140, 0.5, -14),
            Size = UDim2.new(0, 128, 0, 28),
            Font = currentTheme.Font,
            Text = tostring(default),
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            AutoButtonColor = false,
        })
        AddCorner(keyBtn, 4)
        AddStroke(keyBtn, currentTheme.Border, 1)

        local currentKey = default
        local isListening = false

        keyBtn.MouseButton1Click:Connect(function()
            isListening = not isListening
            if isListening then
                keyBtn.Text = "Press any key..."
                keyBtn.BackgroundColor3 = currentTheme.Accent
                keyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                keyBtn.Text = tostring(currentKey)
                keyBtn.BackgroundColor3 = currentTheme.Background
                keyBtn.TextColor3 = currentTheme.Text
            end
        end)

        local keybindObject = {
            Value = currentKey,
            Set = function(self, newKey)
                currentKey = newKey
                keyBtn.Text = tostring(newKey)
                pcall(callback, newKey)
            end,
        }

        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if isListening and input.KeyCode ~= Enum.KeyCode.Unknown then
                currentKey = input.KeyCode
                keyBtn.Text = tostring(currentKey)
                keyBtn.BackgroundColor3 = currentTheme.Background
                keyBtn.TextColor3 = currentTheme.Text
                isListening = false
                pcall(callback, currentKey)
                CreateNotification("Keybind Set", "Set to: " .. tostring(currentKey), "success")
            end
        end)

        table.insert(tabAPI.Components, keybindObject)
        return keybindObject
    end

    -- =====================================================================
    -- COMPONENT: TEXT BOX
    -- =====================================================================
    function tabAPI:CreateTextBox(config)
        config = config or {}
        local name = config.Name or "Input"
        local placeholder = config.Placeholder or "Enter value..."
        local default = config.Default or ""
        local callback = config.Callback or function() end
        local numeric = config.Numeric or false
        local multiLine = config.MultiLine or false
        local password = config.Password or false
        local description = config.Description or ""

        local height = multiLine and 80 or 44
        if description ~= "" then height = height + 20 end

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, height),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        local label = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 0, 20),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        if description ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 20),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local inputBox = Create("TextBox", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(0, 12, 0, description ~= "" and 40 or 22),
            Size = UDim2.new(1, -24, 0, multiLine and 36 or 20),
            Font = currentTheme.Font,
            Text = tostring(default),
            TextColor3 = currentTheme.Text,
            PlaceholderText = placeholder,
            PlaceholderColor3 = currentTheme.Grey,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = multiLine and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
            ClearTextOnFocus = false,
            MultiLine = multiLine,
            TextWrapped = multiLine,
        })
        AddCorner(inputBox, 4)
        AddStroke(inputBox, currentTheme.Border, 1)
        
        if password then
            inputBox.Text = ""
            inputBox.PlaceholderText = "••••••••"
            inputBox.Text = default
        end

        inputBox.FocusLost:Connect(function(enterPressed)
            local value = inputBox.Text
            if numeric and tonumber(value) == nil and value ~= "" then
                inputBox.Text = tostring(default)
                CreateNotification("Invalid Input", "Please enter a valid number", "error")
                return
            end
            pcall(callback, value)
        end)

        local textBoxObject = {
            Value = inputBox.Text,
            Set = function(self, newValue)
                inputBox.Text = tostring(newValue)
                pcall(callback, newValue)
            end,
        }
        
        table.insert(tabAPI.Components, textBoxObject)
        return textBoxObject
    end

    -- =====================================================================
    -- COMPONENT: COLOR PICKER
    -- =====================================================================
    function tabAPI:CreateColorPicker(config)
        config = config or {}
        local name = config.Name or "Color Picker"
        local default = config.Default or Color3.fromRGB(255, 255, 255)
        local callback = config.Callback or function() end
        local description = config.Description or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, description ~= "" and 80 or 60),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 4),
            Size = UDim2.new(1, -24, 0, 20),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        if description ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local colorDisplay = Create("Frame", {
            Parent = frame,
            BackgroundColor3 = default,
            Position = UDim2.new(0, 12, 0, description ~= "" and 44 or 24),
            Size = UDim2.new(0, 40, 0, 24),
        })
        AddCorner(colorDisplay, 4)
        AddStroke(colorDisplay, currentTheme.Border, 1)

        -- Simple RGB sliders
        local r, g, b = default.R * 255, default.G * 255, default.B * 255
        local currentColor = default

        local function updateColor()
            colorDisplay.BackgroundColor3 = currentColor
            pcall(callback, currentColor)
        end

        local function createColorSlider(labelText, initial, color, posY)
            local sliderFrame = Create("Frame", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 60, 0, posY),
                Size = UDim2.new(1, -80, 0, 18),
            })
            
            local label = Create("TextLabel", {
                Parent = sliderFrame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 0, 0, 0),
                Size = UDim2.new(0, 20, 1, 0),
                Font = currentTheme.Font,
                Text = labelText,
                TextColor3 = currentTheme.Text,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Center,
            })
            
            local bg = Create("Frame", {
                Parent = sliderFrame,
                BackgroundColor3 = currentTheme.Background,
                Position = UDim2.new(0, 24, 0.5, -4),
                Size = UDim2.new(1, -70, 0, 8),
            })
            AddCorner(bg, 4)
            
            local fill = Create("Frame", {
                Parent = bg,
                BackgroundColor3 = color,
                Size = UDim2.new(initial / 255, 0, 1, 0),
            })
            AddCorner(fill, 4)
            
            local valueLabel = Create("TextLabel", {
                Parent = sliderFrame,
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -42, 0, 0),
                Size = UDim2.new(0, 40, 1, 0),
                Font = currentTheme.Font,
                Text = tostring(math.round(initial)),
                TextColor3 = currentTheme.Text,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Right,
            })
            
            local function updateSlider(mouseX)
                local perc = math.clamp((mouseX - bg.AbsolutePosition.X) / bg.AbsoluteSize.X, 0, 1)
                local val = math.round(perc * 255)
                fill.Size = UDim2.new(perc, 0, 1, 0)
                valueLabel.Text = tostring(val)
                
                if labelText == "R" then
                    currentColor = Color3.fromRGB(val, currentColor.G * 255, currentColor.B * 255)
                elseif labelText == "G" then
                    currentColor = Color3.fromRGB(currentColor.R * 255, val, currentColor.B * 255)
                else
                    currentColor = Color3.fromRGB(currentColor.R * 255, currentColor.G * 255, val)
                end
                updateColor()
            end
            
            bg.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local conn
                    conn = RunService.RenderStepped:Connect(function()
                        local mouse = UserInputService:GetMouseLocation()
                        updateSlider(mouse.X)
                    end)
                    UserInputService.InputEnded:Connect(function(endInput)
                        if endInput.UserInputType == Enum.UserInputType.MouseButton1 then
                            if conn then conn:Disconnect() end
                        end
                    end)
                end
            end)
            
            return {Set = function(self, val) updateSlider(val) end}
        end

        local descY = description ~= "" and 44 or 24
        createColorSlider("R", r, Color3.fromRGB(255, 0, 0), descY)
        createColorSlider("G", g, Color3.fromRGB(0, 255, 0), descY + 22)
        createColorSlider("B", b, Color3.fromRGB(0, 0, 255), descY + 44)

        local colorObject = {
            Value = currentColor,
            Set = function(self, newColor)
                currentColor = newColor
                updateColor()
            end,
        }
        
        table.insert(tabAPI.Components, colorObject)
        return colorObject
    end

    -- =====================================================================
    -- COMPONENT: PROGRESS BAR
    -- =====================================================================
    function tabAPI:CreateProgressBar(config)
        config = config or {}
        local name = config.Name or "Progress"
        local value = config.Value or 0
        local max = config.Max or 100
        local callback = config.Callback or function() end
        local description = config.Description or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, description ~= "" and 70 or 50),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        local label = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 4),
            Size = UDim2.new(1, -80, 0, 18),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        local valueLabel = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -80, 0, 4),
            Size = UDim2.new(0, 70, 0, 18),
            Font = currentTheme.Font,
            Text = math.floor(value / max * 100) .. "%",
            TextColor3 = currentTheme.Blueprint,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Right,
            FontWeight = Enum.FontWeight.Bold,
        })
        
        if description ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local barBg = Create("Frame", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(0, 12, 0, description ~= "" and 46 or 28),
            Size = UDim2.new(1, -24, 0, 12),
        })
        AddCorner(barBg, 6)
        AddStroke(barBg, currentTheme.Border, 1)

        local barFill = Create("Frame", {
            Parent = barBg,
            BackgroundColor3 = currentTheme.Blueprint,
            Size = UDim2.new(value / max, 0, 1, 0),
        })
        AddCorner(barFill, 6)

        local progressObject = {
            Value = value,
            Set = function(self, newValue)
                value = math.max(0, math.min(max, newValue))
                barFill.Size = UDim2.new(value / max, 0, 1, 0)
                valueLabel.Text = math.floor(value / max * 100) .. "%"
                pcall(callback, value)
            end,
        }
        
        table.insert(tabAPI.Components, progressObject)
        return progressObject
    end

    -- =====================================================================
    -- COMPONENT: LIST BOX
    -- =====================================================================
    function tabAPI:CreateListBox(config)
        config = config or {}
        local name = config.Name or "List"
        local items = config.Items or {}
        local callback = config.Callback or function() end
        local description = config.Description or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, 150),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 4),
            Size = UDim2.new(1, -24, 0, 20),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        if description ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local listContainer = Create("ScrollingFrame", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(0, 12, 0, description ~= "" and 44 or 28),
            Size = UDim2.new(1, -24, 0, 110),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = currentTheme.Grey,
        })
        AddCorner(listContainer, 4)
        AddStroke(listContainer, currentTheme.Border, 1)

        Create("UIListLayout", {
            Parent = listContainer,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2),
        })
        Create("UIPadding", {
            Parent = listContainer,
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
        })

        local function updateList(newItems)
            for _, child in ipairs(listContainer:GetChildren()) do
                if child:IsA("TextButton") then
                    child:Destroy()
                end
            end
            
            for _, item in ipairs(newItems or items) do
                local itemBtn = Create("TextButton", {
                    Parent = listContainer,
                    BackgroundColor3 = currentTheme.Background,
                    Size = UDim2.new(1, 0, 0, 24),
                    Font = currentTheme.Font,
                    Text = "  " .. tostring(item),
                    TextColor3 = currentTheme.Text,
                    TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutoButtonColor = false,
                })
                AddCorner(itemBtn, 3)
                
                itemBtn.MouseEnter:Connect(function()
                    Tween(itemBtn, {BackgroundColor3 = currentTheme.Paper}, 0.1)
                end)
                itemBtn.MouseLeave:Connect(function()
                    Tween(itemBtn, {BackgroundColor3 = currentTheme.Background}, 0.1)
                end)
                
                itemBtn.MouseButton1Click:Connect(function()
                    pcall(callback, item)
                    CreateNotification("Selected", tostring(item), "info")
                end)
            end
        end
        
        updateList(items)

        local listBoxObject = {
            Items = items,
            Set = function(self, newItems)
                items = newItems
                updateList(newItems)
            end,
        }
        
        table.insert(tabAPI.Components, listBoxObject)
        return listBoxObject
    end

    -- =====================================================================
    -- COMPONENT: LABEL
    -- =====================================================================
    function tabAPI:CreateLabel(config)
        config = config or {}
        local text = config.Text or "Label"
        local color = config.Color or currentTheme.Text
        local size = config.Size or 12
        local weight = config.Weight or "Regular"
        local icon = config.Icon or ""
        local description = config.Description or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, description ~= "" and 50 or 32),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        local label = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 1, 0),
            Font = currentTheme.Font,
            Text = (icon ~= "" and icon .. " " or "") .. text,
            TextColor3 = color,
            TextSize = size,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = weight == "Bold" and Enum.FontWeight.Bold or Enum.FontWeight.Regular,
        })
        
        if description ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local labelObject = {
            Set = function(self, newText)
                label.Text = (icon ~= "" and icon .. " " or "") .. newText
            end,
        }
        
        table.insert(tabAPI.Components, labelObject)
        return labelObject
    end

    -- =====================================================================
    -- COMPONENT: SEPARATOR
    -- =====================================================================
    function tabAPI:CreateSeparator(config)
        config = config or {}
        local text = config.Text or ""
        local dashed = config.Dashed or false

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, text ~= "" and 36 or 16),
        })
        AddCorner(frame, currentTheme.CornerRadius)

        if text ~= "" then
            local line1 = Create("Frame", {
                Parent = frame,
                BackgroundColor3 = currentTheme.Border,
                Position = UDim2.new(0, 12, 0.5, -0.5),
                Size = UDim2.new(0.5, -70, 0, 1),
            })
            
            local label = Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.5, -40, 0, 0),
                Size = UDim2.new(0, 80, 1, 0),
                Font = currentTheme.Font,
                Text = text,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Center,
            })
            
            local line2 = Create("Frame", {
                Parent = frame,
                BackgroundColor3 = currentTheme.Border,
                Position = UDim2.new(0.5, 10, 0.5, -0.5),
                Size = UDim2.new(0.5, -70, 0, 1),
            })
            
            if dashed then
                line1.BackgroundTransparency = 0.5
                line2.BackgroundTransparency = 0.5
            end
        else
            local line = Create("Frame", {
                Parent = frame,
                BackgroundColor3 = currentTheme.Border,
                Position = UDim2.new(0, 12, 0.5, -0.5),
                Size = UDim2.new(1, -24, 0, 1),
            })
            if dashed then
                line.BackgroundTransparency = 0.5
            end
        end
    end

    -- =====================================================================
    -- COMPONENT: TOOLTIP
    -- =====================================================================
    function tabAPI:AddTooltip(target, text, position)
        position = position or "Top"
        
        local tooltip = Create("Frame", {
            Parent = self.Window.SG,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(0, 0, 0, 0),
            Visible = false,
            ZIndex = 999,
        })
        AddCorner(tooltip, 4)
        AddStroke(tooltip, currentTheme.Border, 1)
        AddShadow(tooltip, 4, Color3.fromRGB(0, 0, 0), 0.2)
        
        local label = Create("TextLabel", {
            Parent = tooltip,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -8, 1, -8),
            Position = UDim2.new(0, 4, 0, 4),
            Font = currentTheme.Font,
            Text = text,
            TextColor3 = currentTheme.Text,
            TextSize = 10,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Center,
        })
        
        tooltip.Size = UDim2.new(0, label.TextBounds.X + 16, 0, 28)
        
        target.MouseEnter:Connect(function()
            tooltip.Visible = true
            local pos = target.AbsolutePosition
            local size = target.AbsoluteSize
            
            if position == "Top" then
                tooltip.Position = UDim2.new(0, pos.X + size.X / 2 - tooltip.AbsoluteSize.X / 2, 0, pos.Y - tooltip.AbsoluteSize.Y - 4)
            elseif position == "Bottom" then
                tooltip.Position = UDim2.new(0, pos.X + size.X / 2 - tooltip.AbsoluteSize.X / 2, 0, pos.Y + size.Y + 4)
            elseif position == "Left" then
                tooltip.Position = UDim2.new(0, pos.X - tooltip.AbsoluteSize.X - 4, 0, pos.Y + size.Y / 2 - tooltip.AbsoluteSize.Y / 2)
            elseif position == "Right" then
                tooltip.Position = UDim2.new(0, pos.X + size.X + 4, 0, pos.Y + size.Y / 2 - tooltip.AbsoluteSize.Y / 2)
            end
        end)
        
        target.MouseLeave:Connect(function()
            tooltip.Visible = false
        end)
        
        return tooltip
    end

    -- =====================================================================
    -- COMPONENT: MODAL
    -- =====================================================================
    function self:CreateModal(title, fields)
        title = title or "Modal"
        fields = fields or {}
        
        local modalOverlay = Create("Frame", {
            Parent = self.SG,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.5,
            Size = UDim2.new(1, 0, 1, 0),
            ZIndex = 1000,
            Visible = false,
        })
        
        local modal = Create("Frame", {
            Parent = modalOverlay,
            BackgroundColor3 = currentTheme.Paper,
            Position = UDim2.new(0.5, -200, 0.5, -200),
            Size = UDim2.new(0, 400, 0, 400),
            ClipsDescendants = true,
            ZIndex = 1001,
        })
        AddCorner(modal, currentTheme.CornerRadius)
        AddStroke(modal, currentTheme.Border, 1)
        AddShadow(modal, 8, Color3.fromRGB(0, 0, 0), 0.3)
        
        -- Modal Header
        local header = Create("Frame", {
            Parent = modal,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, 40),
            ZIndex = 1002,
        })
        
        Create("TextLabel", {
            Parent = header,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 16, 0, 0),
            Size = UDim2.new(1, -80, 1, 0),
            Font = currentTheme.Font,
            Text = title,
            TextColor3 = currentTheme.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Bold,
        })
        
        local closeModal = Create("TextButton", {
            Parent = header,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -36, 0.5, -14),
            Size = UDim2.new(0, 28, 0, 28),
            Font = currentTheme.Font,
            Text = "✕",
            TextColor3 = currentTheme.Text,
            TextSize = 14,
            AutoButtonColor = false,
            ZIndex = 1003,
        })
        
        closeModal.MouseButton1Click:Connect(function()
            modalOverlay.Visible = false
            modalOverlay:Destroy()
        end)
        
        -- Modal Content
        local content = Create("ScrollingFrame", {
            Parent = modal,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 16, 0, 50),
            Size = UDim2.new(1, -32, 1, -100),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = currentTheme.Grey,
            ZIndex = 1002,
        })
        
        Create("UIListLayout", {
            Parent = content,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        })
        
        local results = {}
        
        for _, field in ipairs(fields) do
            if field.Type == "label" then
                local label = Create("TextLabel", {
                    Parent = content,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 24),
                    Font = currentTheme.Font,
                    Text = field.Text or "",
                    TextColor3 = currentTheme.Text,
                    TextSize = 11,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
            elseif field.Type == "toggle" then
                local toggle = self:CreateToggle({Name = field.Name, Default = field.Default or false})
                table.insert(results, {Name = field.Name, Value = toggle.Value})
                -- Need to move toggle to content
                local toggleFrame = content:FindFirstChildWhichIsA("Frame")
                if toggleFrame then
                    toggleFrame.Parent = content
                end
            elseif field.Type == "slider" then
                local slider = self:CreateSlider({Name = field.Name, Min = field.Min or 0, Max = field.Max or 100, Default = field.Default or 50})
                table.insert(results, {Name = field.Name, Value = slider.Value})
            elseif field.Type == "dropdown" then
                local dropdown = self:CreateDropdown({Name = field.Name, Options = field.Options or {}, Default = field.Default or field.Options[1]})
                table.insert(results, {Name = field.Name, Value = dropdown.Value})
            elseif field.Type == "textbox" then
                local textbox = self:CreateTextBox({Name = field.Name, Placeholder = field.Placeholder or "", Default = field.Default or ""})
                table.insert(results, {Name = field.Name, Value = textbox.Value})
            end
        end
        
        -- Modal Buttons
        local buttonContainer = Create("Frame", {
            Parent = modal,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 16, 1, -50),
            Size = UDim2.new(1, -32, 0, 36),
            ZIndex = 1002,
        })
        
        local confirmBtn = Create("TextButton", {
            Parent = buttonContainer,
            BackgroundColor3 = currentTheme.Blueprint,
            Position = UDim2.new(1, -100, 0, 0),
            Size = UDim2.new(0, 100, 1, 0),
            Font = currentTheme.Font,
            Text = "Confirm",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 11,
            AutoButtonColor = false,
            ZIndex = 1003,
        })
        AddCorner(confirmBtn, 4)
        
        local cancelBtn = Create("TextButton", {
            Parent = buttonContainer,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(1, -210, 0, 0),
            Size = UDim2.new(0, 100, 1, 0),
            Font = currentTheme.Font,
            Text = "Cancel",
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            AutoButtonColor = false,
            ZIndex = 1003,
        })
        AddCorner(cancelBtn, 4)
        
        confirmBtn.MouseButton1Click:Connect(function()
            modalOverlay.Visible = false
            modalOverlay:Destroy()
            CreateNotification("Modal Confirmed", "Action completed", "success")
        end)
        
        cancelBtn.MouseButton1Click:Connect(function()
            modalOverlay.Visible = false
            modalOverlay:Destroy()
        end)
        
        modalOverlay.Visible = true
        return modalOverlay
    end

    -- =====================================================================
    -- COMPONENT: NOTIFICATION
    -- =====================================================================
    function self:Notify(title, message, type, duration)
        return CreateNotification(title, message, type or "info", duration)
    end

    -- =====================================================================
    -- COMPONENT: CONTEXT MENU
    -- =====================================================================
    function self:CreateContextMenu(options)
        local menu = Create("Frame", {
            Parent = self.SG,
            BackgroundColor3 = currentTheme.Paper,
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(0, 0, 0, 0),
            Visible = false,
            ZIndex = 999,
            ClipsDescendants = true,
        })
        AddCorner(menu, currentTheme.CornerRadius)
        AddStroke(menu, currentTheme.Border, 1)
        AddShadow(menu, 6, Color3.fromRGB(0, 0, 0), 0.2)
        
        Create("UIListLayout", {
            Parent = menu,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2),
        })
        Create("UIPadding", {
            Parent = menu,
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
        })
        
        for _, option in ipairs(options) do
            local optBtn = Create("TextButton", {
                Parent = menu,
                BackgroundColor3 = currentTheme.Background,
                Size = UDim2.new(0, 140, 0, 28),
                Font = currentTheme.Font,
                Text = option.Name or "Option",
                TextColor3 = currentTheme.Text,
                TextSize = 11,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutoButtonColor = false,
            })
            AddCorner(optBtn, 3)
            
            optBtn.MouseEnter:Connect(function()
                Tween(optBtn, {BackgroundColor3 = currentTheme.Paper}, 0.1)
            end)
            optBtn.MouseLeave:Connect(function()
                Tween(optBtn, {BackgroundColor3 = currentTheme.Background}, 0.1)
            end)
            
            optBtn.MouseButton1Click:Connect(function()
                menu.Visible = false
                if option.Callback then
                    option.Callback()
                end
            end)
        end
        
        menu.Size = UDim2.new(0, 140, 0, #options * 30 + 8)
        
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                local pos = input.Position
                menu.Position = UDim2.new(0, pos.X, 0, pos.Y)
                menu.Visible = true
                
                -- Keep menu inside screen
                task.wait(0.05)
                if menu.AbsolutePosition.X + menu.AbsoluteSize.X > workspace.CurrentCamera.ViewportSize.X then
                    menu.Position = UDim2.new(0, pos.X - menu.AbsoluteSize.X, 0, pos.Y)
                end
                if menu.AbsolutePosition.Y + menu.AbsoluteSize.Y > workspace.CurrentCamera.ViewportSize.Y then
                    menu.Position = UDim2.new(0, menu.AbsolutePosition.X, 0, pos.Y - menu.AbsoluteSize.Y)
                end
            elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                menu.Visible = false
            end
        end)
        
        return menu
    end

    -- =====================================================================
    -- COMPONENT: STATUS INDICATOR
    -- =====================================================================
    function tabAPI:CreateStatusIndicator(config)
        config = config or {}
        local name = config.Name or "Status"
        local default = config.Default or "Offline"
        local description = config.Description or ""

        local statuses = {
            Online = {color = Color3.fromRGB(46, 204, 113), icon = "●"},
            Offline = {color = Color3.fromRGB(231, 76, 60), icon = "●"},
            Warning = {color = Color3.fromRGB(241, 196, 15), icon = "●"},
            Idle = {color = Color3.fromRGB(52, 152, 219), icon = "●"},
        }

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, description ~= "" and 50 or 36),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        local indicator = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(0, 30, 1, 0),
            Font = currentTheme.Font,
            Text = statuses[default] and statuses[default].icon or "●",
            TextColor3 = statuses[default] and statuses[default].color or currentTheme.Grey,
            TextSize = 16,
            TextXAlignment = Enum.TextXAlignment.Center,
        })

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 44, 0, 0),
            Size = UDim2.new(1, -60, 0, 20),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        local statusLabel = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 44, 0, 20),
            Size = UDim2.new(1, -60, description ~= "" and 20 or 16),
            Font = currentTheme.Font,
            Text = description ~= "" and description or default,
            TextColor3 = currentTheme.Grey,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        local statusObject = {
            Set = function(self, newStatus, newDesc)
                local statusData = statuses[newStatus] or statuses.Offline
                indicator.Text = statusData.icon
                indicator.TextColor3 = statusData.color
                if newDesc then
                    statusLabel.Text = newDesc
                else
                    statusLabel.Text = newStatus
                end
            end,
        }
        
        table.insert(tabAPI.Components, statusObject)
        return statusObject
    }

    -- =====================================================================
    -- COMPONENT: MULTI TOGGLE
    -- =====================================================================
    function tabAPI:CreateMultiToggle(config)
        config = config or {}
        local name = config.Name or "Toggle Group"
        local options = config.Options or {}
        local default = config.Default or {}
        local callback = config.Callback or function() end
        local description = config.Description or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Paper,
            Size = UDim2.new(1, 0, 0, description ~= "" and 60 + #options * 38 or 40 + #options * 38),
        })
        AddCorner(frame, currentTheme.CornerRadius)
        AddStroke(frame, currentTheme.Border, 1)

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 4),
            Size = UDim2.new(1, -24, 0, 20),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        if description ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local toggleContainer = Create("Frame", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, description ~= "" and 44 or 28),
            Size = UDim2.new(1, -24, 0, #options * 34),
        })

        Create("UIListLayout", {
            Parent = toggleContainer,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
        })

        local states = {}
        
        for i, option in ipairs(options) do
            local isDefault = table.find(default, option) ~= nil
            local toggle = self:CreateToggle({
                Name = option,
                Default = isDefault,
                Callback = function(state)
                    if state then
                        table.insert(states, option)
                    else
                        for j, val in ipairs(states) do
                            if val == option then
                                table.remove(states, j)
                                break
                            end
                        end
                    end
                    pcall(callback, states)
                end,
            })
            
            -- Move toggle to container
            local toggleFrame = toggleContainer:FindFirstChildWhichIsA("Frame")
            if toggleFrame then
                toggleFrame.Parent = toggleContainer
                toggleFrame.Size = UDim2.new(1, 0, 0, 30)
            end
            
            if isDefault then
                table.insert(states, option)
            end
        end

        local multiToggleObject = {
            Value = states,
            Set = function(self, newStates)
                states = newStates
                for _, child in ipairs(toggleContainer:GetChildren()) do
                    if child:IsA("Frame") then
                        local label = child:FindFirstChildWhichIsA("TextLabel")
                        if label then
                            local isOn = table.find(states, label.Text) ~= nil
                            -- Update toggle state (complex, simplified)
                        end
                    end
                end
            end,
        }
        
        table.insert(tabAPI.Components, multiToggleObject)
        return multiToggleObject
    }

    -- =====================================================================
    -- UTILITY: GET COMPONENTS
    -- =====================================================================
    function tabAPI:GetComponents()
        return tabAPI.Components
    end

    -- =====================================================================
    -- UTILITY: CLEAR TAB
    -- =====================================================================
    function tabAPI:Clear()
        for _, child in ipairs(page:GetChildren()) do
            if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("TextBox") then
                child:Destroy()
            end
        end
        tabAPI.Components = {}
    end

    return tabAPI
end

-- =====================================================================
-- GLOBAL UTILITIES
-- =====================================================================
function RuinzUI:Destroy()
    if self.SG then
        self.SG:Destroy()
    end
end

function RuinzUI:GetVersion()
    return "2.0.0 - Complete Edition"
end

-- =====================================================================
-- RETURN LIBRARY
-- =====================================================================
return RuinzUI
