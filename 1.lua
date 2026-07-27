-- ============================================================
-- NEXUS UI v1.0 - COMPLETE UI LIBRARY
-- BUILT FROM SCRATCH BY PANDORA
-- TOTAL LINES: 2500+
-- ============================================================

local NexusUI = {}
NexusUI.__index = NexusUI

-- ============================================================
-- SERVICES
-- ============================================================
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- ============================================================
-- THEME SYSTEM
-- ============================================================
local THEMES = {
    Dark = {
        Background = Color3.fromRGB(20, 20, 25),
        Surface = Color3.fromRGB(30, 30, 38),
        Surface2 = Color3.fromRGB(40, 40, 50),
        Primary = Color3.fromRGB(0, 188, 212),
        Secondary = Color3.fromRGB(255, 176, 0),
        Accent = Color3.fromRGB(156, 39, 176),
        Success = Color3.fromRGB(76, 175, 80),
        Danger = Color3.fromRGB(244, 67, 54),
        Warning = Color3.fromRGB(255, 193, 7),
        Info = Color3.fromRGB(33, 150, 243),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 180, 190),
        TextMuted = Color3.fromRGB(120, 120, 130),
        Border = Color3.fromRGB(50, 50, 60),
        Font = Enum.Font.Gotham,
        CornerRadius = 8,
        ShadowSize = 4,
        FontSize = 13,
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 245),
        Surface = Color3.fromRGB(255, 255, 255),
        Surface2 = Color3.fromRGB(245, 245, 250),
        Primary = Color3.fromRGB(0, 150, 200),
        Secondary = Color3.fromRGB(255, 160, 0),
        Accent = Color3.fromRGB(130, 30, 150),
        Success = Color3.fromRGB(76, 175, 80),
        Danger = Color3.fromRGB(244, 67, 54),
        Warning = Color3.fromRGB(255, 193, 7),
        Info = Color3.fromRGB(33, 150, 243),
        Text = Color3.fromRGB(30, 30, 35),
        TextSecondary = Color3.fromRGB(80, 80, 90),
        TextMuted = Color3.fromRGB(150, 150, 160),
        Border = Color3.fromRGB(210, 210, 220),
        Font = Enum.Font.Gotham,
        CornerRadius = 8,
        ShadowSize = 4,
        FontSize = 13,
    },
    Cyberpunk = {
        Background = Color3.fromRGB(10, 5, 20),
        Surface = Color3.fromRGB(20, 10, 35),
        Surface2 = Color3.fromRGB(30, 20, 45),
        Primary = Color3.fromRGB(0, 255, 200),
        Secondary = Color3.fromRGB(255, 0, 150),
        Accent = Color3.fromRGB(200, 0, 255),
        Success = Color3.fromRGB(0, 255, 100),
        Danger = Color3.fromRGB(255, 0, 50),
        Warning = Color3.fromRGB(255, 200, 0),
        Info = Color3.fromRGB(0, 150, 255),
        Text = Color3.fromRGB(0, 255, 200),
        TextSecondary = Color3.fromRGB(150, 255, 200),
        TextMuted = Color3.fromRGB(80, 150, 130),
        Border = Color3.fromRGB(0, 255, 200),
        Font = Enum.Font.Code,
        CornerRadius = 0,
        ShadowSize = 8,
        FontSize = 13,
    }
}

local currentTheme = THEMES.Dark
local activeThemeName = "Dark"

-- ============================================================
-- UTILITY FUNCTIONS
-- ============================================================
local function create(className, props)
    local obj = Instance.new(className)
    for k, v in pairs(props or {}) do
        pcall(function() obj[k] = v end)
    end
    return obj
end

local function tween(obj, props, duration, easing, direction, repeats)
    duration = duration or 0.2
    easing = easing or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    repeats = repeats or 0
    local tween = TweenService:Create(obj, TweenInfo.new(duration, easing, direction, repeats, false, 0), props)
    tween:Play()
    return tween
end

local function tweenPingPong(obj, props, duration, easing)
    duration = duration or 0.3
    easing = easing or Enum.EasingStyle.Quad
    local tween = TweenService:Create(obj, TweenInfo.new(duration, easing, Enum.EasingDirection.InOut, -1, true, 0), props)
    tween:Play()
    return tween
end

local function corner(obj, radius)
    return create("UICorner", {
        CornerRadius = UDim.new(0, radius or currentTheme.CornerRadius),
        Parent = obj
    })
end

local function stroke(obj, color, thickness, transparency)
    return create("UIStroke", {
        Color = color or currentTheme.Border,
        Thickness = thickness or 1,
        Transparency = transparency or 0,
        Parent = obj
    })
end

local function shadow(obj, size, color, transparency)
    size = size or currentTheme.ShadowSize
    return create("UIShadow", {
        Size = size,
        Color = color or Color3.fromRGB(0, 0, 0),
        Transparency = transparency or 0.25,
        Parent = obj
    })
end

local function makeDraggable(frame, dragBar)
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

-- ============================================================
-- NOTIFICATION SYSTEM
-- ============================================================
local Notifications = {}
local function createNotification(self, title, message, type, duration)
    duration = duration or 3
    type = type or "info"
    
    local colors = {
        info = currentTheme.Info,
        success = currentTheme.Success,
        error = currentTheme.Danger,
        warning = currentTheme.Warning,
    }
    
    local notifContainer = self.SG:FindFirstChild("NotificationContainer")
    if not notifContainer then
        notifContainer = create("Frame", {
            Name = "NotificationContainer",
            Parent = self.SG,
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 320, 0, 0),
            Position = UDim2.new(1, -330, 0, 10),
            AutomaticSize = Enum.AutomaticSize.Y,
        })
        create("UIListLayout", {
            Parent = notifContainer,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        })
    end
    
    local notif = create("Frame", {
        Parent = notifContainer,
        BackgroundColor3 = currentTheme.Surface,
        Size = UDim2.new(1, 0, 0, 0),
        ClipsDescendants = true,
        AutomaticSize = Enum.AutomaticSize.Y,
    })
    corner(notif)
    stroke(notif, colors[type] or currentTheme.Info, 2)
    shadow(notif, 6)
    
    -- Color bar
    create("Frame", {
        Parent = notif,
        BackgroundColor3 = colors[type] or currentTheme.Info,
        Size = UDim2.new(0, 4, 1, 0),
        BorderSizePixel = 0,
    })
    
    create("TextLabel", {
        Parent = notif,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 16, 0, 8),
        Size = UDim2.new(1, -40, 0, 20),
        Font = currentTheme.Font,
        Text = title,
        TextColor3 = currentTheme.Text,
        TextSize = currentTheme.FontSize,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontWeight = Enum.FontWeight.Bold,
    })
    
    create("TextLabel", {
        Parent = notif,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 16, 0, 30),
        Size = UDim2.new(1, -40, 0, 0),
        Font = currentTheme.Font,
        Text = message,
        TextColor3 = currentTheme.TextSecondary,
        TextSize = currentTheme.FontSize - 2,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        AutomaticSize = Enum.AutomaticSize.Y,
    })
    
    -- Update size
    notif.Size = UDim2.new(1, 0, 0, 20 + notif:FindFirstChildWhichIsA("TextLabel").Size.Y.Offset + 16)
    
    -- Close button
    local closeBtn = create("TextButton", {
        Parent = notif,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -28, 0, 4),
        Size = UDim2.new(0, 20, 0, 20),
        Font = currentTheme.Font,
        Text = "✕",
        TextColor3 = currentTheme.TextMuted,
        TextSize = 12,
        AutoButtonColor = false,
    })
    
    closeBtn.MouseButton1Click:Connect(function()
        tween(notif, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
        task.wait(0.2)
        notif:Destroy()
    end)
    
    -- Auto dismiss
    task.wait(duration)
    if notif.Parent then
        tween(notif, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
        task.wait(0.2)
        notif:Destroy()
    end
    
    return notif
end

-- ============================================================
-- TOOLTIP SYSTEM
-- ============================================================
local function createTooltip(target, text, position)
    position = position or "Top"
    
    local tooltip = create("Frame", {
        Parent = target:FindFirstAncestorOfClass("ScreenGui"),
        BackgroundColor3 = currentTheme.Surface,
        Size = UDim2.new(0, 0, 0, 28),
        Visible = false,
        ZIndex = 999,
        AutomaticSize = Enum.AutomaticSize.X,
    })
    corner(tooltip)
    stroke(tooltip, currentTheme.Border, 1)
    shadow(tooltip, 4)
    
    create("TextLabel", {
        Parent = tooltip,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 8, 0, 0),
        Size = UDim2.new(0, 0, 1, 0),
        Font = currentTheme.Font,
        Text = text,
        TextColor3 = currentTheme.Text,
        TextSize = currentTheme.FontSize - 2,
        TextXAlignment = Enum.TextXAlignment.Center,
        AutomaticSize = Enum.AutomaticSize.X,
    })
    
    tooltip.Size = UDim2.new(0, tooltip:FindFirstChildWhichIsA("TextLabel").Size.X.Offset + 16, 0, 28)
    
    target.MouseEnter:Connect(function()
        tooltip.Visible = true
        local pos = target.AbsolutePosition
        local size = target.AbsoluteSize
        
        if position == "Top" then
            tooltip.Position = UDim2.new(0, pos.X + size.X/2 - tooltip.AbsoluteSize.X/2, 0, pos.Y - tooltip.AbsoluteSize.Y - 6)
        elseif position == "Bottom" then
            tooltip.Position = UDim2.new(0, pos.X + size.X/2 - tooltip.AbsoluteSize.X/2, 0, pos.Y + size.Y + 6)
        elseif position == "Left" then
            tooltip.Position = UDim2.new(0, pos.X - tooltip.AbsoluteSize.X - 6, 0, pos.Y + size.Y/2 - tooltip.AbsoluteSize.Y/2)
        elseif position == "Right" then
            tooltip.Position = UDim2.new(0, pos.X + size.X + 6, 0, pos.Y + size.Y/2 - tooltip.AbsoluteSize.Y/2)
        end
    end)
    
    target.MouseLeave:Connect(function()
        tooltip.Visible = false
    end)
    
    return tooltip
end

-- ============================================================
-- WINDOW CREATION
-- ============================================================
function NexusUI.new(config)
    config = config or {}
    local titleText = config.Title or "NEXUS UI"
    local themeName = config.Theme or "Dark"
    local resizable = config.Resizable or false
    local sizeX = config.SizeX or 750
    local sizeY = config.SizeY or 550
    
    currentTheme = THEMES[themeName] or THEMES.Dark
    activeThemeName = themeName
    
    if CoreGui:FindFirstChild("NexusUI") then
        CoreGui.NexusUI:Destroy()
    end
    
    local self = setmetatable({}, NexusUI)
    self.Config = config
    self.ThemeName = themeName
    self.Resizable = resizable
    self.SizeX = sizeX
    self.SizeY = sizeY
    self.Notifications = {}
    self.Modals = {}
    
    self.SG = create("ScreenGui", {
        Name = "NexusUI",
        Parent = CoreGui,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })
    
    self.Main = create("Frame", {
        Parent = self.SG,
        BackgroundColor3 = currentTheme.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -sizeX/2, 0.5, -sizeY/2),
        Size = UDim2.new(0, sizeX, 0, sizeY),
        ClipsDescendants = true,
    })
    corner(self.Main)
    stroke(self.Main, currentTheme.Border, 1, 0.3)
    shadow(self.Main, 10)
    
    -- ============================================================
    -- TOP BAR
    -- ============================================================
    self.TopBar = create("Frame", {
        Parent = self.Main,
        BackgroundColor3 = currentTheme.Surface,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 44),
        ZIndex = 10,
    })
    corner(self.TopBar)
    stroke(self.TopBar, currentTheme.Border, 1, 0.5)
    
    -- Logo / Icon
    create("TextLabel", {
        Parent = self.TopBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(0, 30, 1, 0),
        Font = currentTheme.Font,
        Text = "◆",
        TextColor3 = currentTheme.Primary,
        TextSize = 20,
        FontWeight = Enum.FontWeight.Bold,
        ZIndex = 11,
    })
    
    -- Title
    create("TextLabel", {
        Parent = self.TopBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 48, 0, 0),
        Size = UDim2.new(0, 400, 1, 0),
        Font = currentTheme.Font,
        Text = titleText,
        TextColor3 = currentTheme.Text,
        TextSize = currentTheme.FontSize,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontWeight = Enum.FontWeight.Medium,
        ZIndex = 11,
    })
    
    -- Top Bar Controls
    local controls = create("Frame", {
        Parent = self.TopBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -180, 0, 0),
        Size = UDim2.new(0, 180, 1, 0),
        ZIndex = 11,
    })
    
    -- Theme Toggle Button
    local themeBtn = create("TextButton", {
        Parent = controls,
        BackgroundColor3 = currentTheme.Surface2,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 4, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = currentTheme.Font,
        Text = "🌙",
        TextColor3 = currentTheme.Text,
        TextSize = 14,
        AutoButtonColor = false,
        ZIndex = 12,
    })
    corner(themeBtn, 4)
    stroke(themeBtn, currentTheme.Border, 1)
    
    local themeCycle = {"Dark", "Light", "Cyberpunk"}
    local themeIndex = 1
    themeBtn.MouseButton1Click:Connect(function()
        themeIndex = themeIndex % 3 + 1
        local newTheme = themeCycle[themeIndex]
        self:SetTheme(newTheme)
        self:Notify("Theme Changed", "Switched to " .. newTheme .. " mode", "info")
    end)
    
    -- Minimize Button
    local minBtn = create("TextButton", {
        Parent = controls,
        BackgroundColor3 = currentTheme.Surface2,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 34, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = currentTheme.Font,
        Text = "−",
        TextColor3 = currentTheme.Text,
        TextSize = 16,
        AutoButtonColor = false,
        ZIndex = 12,
    })
    corner(minBtn, 4)
    stroke(minBtn, currentTheme.Border, 1)
    
    local minimized = false
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        tween(self.Main, {Size = minimized and UDim2.new(0, self.SizeX, 0, 44) or UDim2.new(0, self.SizeX, 0, self.SizeY)}, 0.3)
        if minimized then
            self.ContentArea.Visible = false
            self.Sidebar.Visible = false
        else
            self.ContentArea.Visible = true
            self.Sidebar.Visible = true
        end
    end)
    
    -- Close Button
    local closeBtn = create("TextButton", {
        Parent = controls,
        BackgroundColor3 = currentTheme.Surface2,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -34, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = currentTheme.Font,
        Text = "✕",
        TextColor3 = currentTheme.Text,
        TextSize = 14,
        AutoButtonColor = false,
        ZIndex = 12,
    })
    corner(closeBtn, 4)
    stroke(closeBtn, currentTheme.Border, 1)
    
    closeBtn.MouseButton1Click:Connect(function()
        self.SG:Destroy()
    end)
    closeBtn.MouseEnter:Connect(function()
        tween(closeBtn, {BackgroundColor3 = currentTheme.Danger, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
    end)
    closeBtn.MouseLeave:Connect(function()
        tween(closeBtn, {BackgroundColor3 = currentTheme.Surface2, TextColor3 = currentTheme.Text}, 0.15)
    end)
    
    makeDraggable(self.Main, self.TopBar)
    
    -- ============================================================
    -- RESIZE HANDLE
    -- ============================================================
    if resizable then
        self.ResizeHandle = create("Frame", {
            Parent = self.Main,
            BackgroundColor3 = currentTheme.Primary,
            BackgroundTransparency = 0.3,
            Position = UDim2.new(1, -10, 1, -10),
            Size = UDim2.new(0, 10, 0, 10),
            ZIndex = 100,
        })
        corner(self.ResizeHandle, 2)
        
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
                self.SizeX = newWidth
                self.SizeY = newHeight
            end
        end)
    end
    
    -- ============================================================
    -- SIDEBAR
    -- ============================================================
    self.Sidebar = create("ScrollingFrame", {
        Parent = self.Main,
        BackgroundColor3 = currentTheme.Surface,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 44),
        Size = UDim2.new(0, 160, 1, -44),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = currentTheme.Primary,
        ZIndex = 5,
    })
    stroke(self.Sidebar, currentTheme.Border, 1, 0.5)
    
    create("UIListLayout", {
        Parent = self.Sidebar,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    })
    create("UIPadding", {
        Parent = self.Sidebar,
        PaddingTop = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingBottom = UDim.new(0, 12),
    })
    
    -- ============================================================
    -- CONTENT AREA
    -- ============================================================
    self.ContentArea = create("Frame", {
        Parent = self.Main,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 168, 0, 52),
        Size = UDim2.new(1, -176, 1, -58),
        ZIndex = 5,
    })
    
    self.Tabs = {}
    self.Pages = {}
    self.FirstTab = true
    self.Components = {}
    
    return self
end

-- ============================================================
-- THEME MANAGEMENT
-- ============================================================
function NexusUI:SetTheme(themeName)
    if not THEMES[themeName] then return end
    
    currentTheme = THEMES[themeName]
    self.ThemeName = themeName
    activeThemeName = themeName
    
    -- Update main frame
    self.Main.BackgroundColor3 = currentTheme.Background
    self.TopBar.BackgroundColor3 = currentTheme.Surface
    self.Sidebar.BackgroundColor3 = currentTheme.Surface
    
    -- Update strokes
    for _, stroke in ipairs(self.Main:GetDescendants()) do
        if stroke:IsA("UIStroke") then
            stroke.Color = currentTheme.Border
        end
    end
    
    -- Update text colors
    for _, label in ipairs(self.Main:GetDescendants()) do
        if label:IsA("TextLabel") or label:IsA("TextButton") or label:IsA("TextBox") then
            if label.TextColor3 == THEMES.Dark.Text or label.TextColor3 == THEMES.Light.Text or label.TextColor3 == THEMES.Cyberpunk.Text then
                label.TextColor3 = currentTheme.Text
            elseif label.TextColor3 == THEMES.Dark.TextSecondary or label.TextColor3 == THEMES.Light.TextSecondary or label.TextColor3 == THEMES.Cyberpunk.TextSecondary then
                label.TextColor3 = currentTheme.TextSecondary
            elseif label.TextColor3 == THEMES.Dark.TextMuted or label.TextColor3 == THEMES.Light.TextMuted or label.TextColor3 == THEMES.Cyberpunk.TextMuted then
                label.TextColor3 = currentTheme.TextMuted
            end
        end
    end
end

-- ============================================================
-- TAB SYSTEM
-- ============================================================
function NexusUI:CreateTab(name, icon)
    icon = icon or "◆"
    
    local tabBtn = create("TextButton", {
        Parent = self.Sidebar,
        BackgroundColor3 = self.FirstTab and currentTheme.Primary or currentTheme.Background,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 34),
        Font = currentTheme.Font,
        Text = "  " .. icon .. "  " .. name,
        TextColor3 = self.FirstTab and Color3.fromRGB(255, 255, 255) or currentTheme.TextSecondary,
        TextSize = currentTheme.FontSize - 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        AutoButtonColor = false,
        ZIndex = 10,
    })
    corner(tabBtn, 6)
    stroke(tabBtn, currentTheme.Border, 1)
    
    local page = create("ScrollingFrame", {
        Parent = self.ContentArea,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = currentTheme.TextMuted,
        Visible = self.FirstTab,
        ZIndex = 10,
    })
    
    create("UIListLayout", {
        Parent = page,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10),
    })
    create("UIPadding", {
        Parent = page,
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 12),
        PaddingBottom = UDim.new(0, 12),
    })
    
    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(self.Pages) do p.Visible = false end
        for _, t in pairs(self.Tabs) do
            tween(t.Button, {BackgroundColor3 = currentTheme.Background, TextColor3 = currentTheme.TextSecondary}, 0.15)
        end
        page.Visible = true
        tween(tabBtn, {BackgroundColor3 = currentTheme.Primary, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
        page.CanvasPosition = Vector2.new(0, 0)
    end)
    
    tabBtn.MouseEnter:Connect(function()
        if page.Visible == false then
            tween(tabBtn, {BackgroundColor3 = currentTheme.Surface2}, 0.15)
        end
    end)
    tabBtn.MouseLeave:Connect(function()
        if page.Visible == false then
            tween(tabBtn, {BackgroundColor3 = currentTheme.Background}, 0.15)
        end
    end)
    
    if self.FirstTab then self.FirstTab = false end
    table.insert(self.Tabs, {Button = tabBtn, Page = page})
    table.insert(self.Pages, page)
    
    local tabAPI = {
        Page = page,
        Window = self,
        Name = name,
        Icon = icon,
    }
    tabAPI.Components = {}
    
    -- ============================================================
    -- COMPONENT: SECTION
    -- ============================================================
    function tabAPI:CreateSection(title, collapsible)
        collapsible = collapsible or false
        local expanded = true
        
        local sec = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface,
            Size = UDim2.new(1, 0, 0, 36),
            ClipsDescendants = true,
        })
        corner(sec)
        stroke(sec, currentTheme.Primary, 1, 0.2)
        
        local header = create("Frame", {
            Parent = sec,
            BackgroundColor3 = currentTheme.Surface,
            Size = UDim2.new(1, 0, 0, 36),
            ZIndex = 2,
        })
        
        create("TextLabel", {
            Parent = header,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 1, 0),
            Font = currentTheme.Font,
            Text = "▸ " .. string.upper(title),
            TextColor3 = currentTheme.Primary,
            TextSize = currentTheme.FontSize - 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Bold,
        })
        
        local sectionContent = create("Frame", {
            Parent = sec,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 36),
            Size = UDim2.new(1, 0, 0, 0),
            ClipsDescendants = true,
            ZIndex = 1,
        })
        
        create("UIListLayout", {
            Parent = sectionContent,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        })
        create("UIPadding", {
            Parent = sectionContent,
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8),
        })
        
        if collapsible then
            local collapseBtn = create("TextButton", {
                Parent = header,
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -28, 0, 0),
                Size = UDim2.new(0, 24, 1, 0),
                Font = currentTheme.Font,
                Text = "⌵",
                TextColor3 = currentTheme.TextMuted,
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
        
        sectionContent.Size = UDim2.new(1, 0, 0, sectionContent.AbsoluteSize.Y)
        
        sectionContent.ChildAdded:Connect(function()
            task.wait(0.05)
            if expanded then
                sectionContent.Size = UDim2.new(1, 0, 0, sectionContent.AbsoluteSize.Y)
                sec.Size = UDim2.new(1, 0, 0, 36 + sectionContent.AbsoluteSize.Y)
            end
        end)
        
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
    
    -- ============================================================
    -- COMPONENT: BUTTON
    -- ============================================================
    function tabAPI:CreateButton(config)
        config = config or {}
        local name = config.Name or "Button"
        local callback = config.Callback or function() end
        local icon = config.Icon or ""
        local color = config.Color or currentTheme.Primary
        local description = config.Description or ""
        local tooltip = config.Tooltip or ""
        
        local height = description ~= "" and 44 or 36
        
        local btn = create("TextButton", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, height),
            Font = currentTheme.Font,
            Text = icon ~= "" and icon .. " " .. name or name,
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize,
            AutoButtonColor = false,
        })
        corner(btn)
        stroke(btn, currentTheme.Border, 1)
        
        if description ~= "" then
            create("TextLabel", {
                Parent = btn,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 22),
                Size = UDim2.new(1, -24, 0, 18),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.TextMuted,
                TextSize = currentTheme.FontSize - 3,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end
        
        if tooltip ~= "" then
            createTooltip(btn, tooltip)
        end
        
        btn.MouseEnter:Connect(function()
            tween(btn, {BackgroundColor3 = color, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
        end)
        btn.MouseLeave:Connect(function()
            tween(btn, {BackgroundColor3 = currentTheme.Surface2, TextColor3 = currentTheme.Text}, 0.15)
        end)
        
        btn.MouseButton1Click:Connect(function()
            tween(btn, {Size = UDim2.new(0.98, 0, 0, height - 2)}, 0.05)
            task.wait(0.05)
            tween(btn, {Size = UDim2.new(1, 0, 0, height)}, 0.05)
            pcall(callback)
        end)
        
        table.insert(tabAPI.Components, btn)
        return btn
    end
    
    -- ============================================================
    -- COMPONENT: TOGGLE
    -- ============================================================
    function tabAPI:CreateToggle(config)
        config = config or {}
        local name = config.Name or "Toggle"
        local default = config.Default or false
        local callback = config.Callback or function() end
        local description = config.Description or ""
        local tooltip = config.Tooltip or ""
        local icon = config.Icon or ""
        
        local height = description ~= "" and 44 or 36
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, height),
        })
        corner(frame)
        stroke(frame, currentTheme.Border, 1)
        
        local iconLabel = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 8, 0, 0),
            Size = UDim2.new(0, 24, 1, 0),
            Font = currentTheme.Font,
            Text = icon,
            TextColor3 = currentTheme.TextMuted,
            TextSize = 16,
            TextXAlignment = Enum.TextXAlignment.Center,
        })
        
        create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, icon ~= "" and 36 or 12, 0, 0),
            Size = UDim2.new(1, -80, 0, description ~= "" and 22 or height),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
        })
        
        if description ~= "" then
            create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, icon ~= "" and 36 or 12, 0, 22),
                Size = UDim2.new(1, -80, 0, 18),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.TextMuted,
                TextSize = currentTheme.FontSize - 3,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end
        
        if tooltip ~= "" then
            createTooltip(frame, tooltip)
        end
        
        local togBg = create("Frame", {
            Parent = frame,
            BackgroundColor3 = default and currentTheme.Primary or currentTheme.Background,
            Position = UDim2.new(1, -48, 0.5, -12),
            Size = UDim2.new(0, 38, 0, 22),
        })
        corner(togBg, 11)
        stroke(togBg, currentTheme.Border, 1)
        
        local togDot = create("Frame", {
            Parent = togBg,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 4, 0.5, -8),
            Size = UDim2.new(0, 16, 0, 16),
        })
        corner(togDot, 8)
        
        local state = default
        
        local function toggleState()
            state = not state
            tween(togBg, {BackgroundColor3 = state and currentTheme.Primary or currentTheme.Background}, 0.15)
            tween(togDot, {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 4, 0.5, -8)}, 0.15)
            pcall(callback, state)
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
                tween(togBg, {BackgroundColor3 = state and currentTheme.Primary or currentTheme.Background}, 0.15)
                tween(togDot, {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 4, 0.5, -8)}, 0.15)
                pcall(callback, state)
            end,
            Toggle = toggleState,
        }
        
        table.insert(tabAPI.Components, toggleObject)
        return toggleObject
    end
    
    -- ============================================================
    -- COMPONENT: SLIDER
    -- ============================================================
    function tabAPI:CreateSlider(config)
        config = config or {}
        local name = config.Name or "Slider"
        local min = config.Min or 0
        local max = config.Max or 100
        local default = config.Default or 50
        local step = config.Step or 1
        local callback = config.Callback or function() end
        local suffix = config.Suffix or ""
        local description = config.Description or ""
        local tooltip = config.Tooltip or ""
        
        local height = description ~= "" and 66 or 54
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, height),
        })
        corner(frame)
        stroke(frame, currentTheme.Border, 1)
        
        local label = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 4),
            Size = UDim2.new(1, -80, 0, 18),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        local valueLabel = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -80, 0, 4),
            Size = UDim2.new(0, 70, 0, 18),
            Font = currentTheme.Font,
            Text = tostring(default) .. suffix,
            TextColor3 = currentTheme.Primary,
            TextSize = currentTheme.FontSize,
            TextXAlignment = Enum.TextXAlignment.Right,
            FontWeight = Enum.FontWeight.Bold,
        })
        
        if description ~= "" then
            create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.TextMuted,
                TextSize = currentTheme.FontSize - 3,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end
        
        if tooltip ~= "" then
            createTooltip(frame, tooltip)
        end
        
        local barBg = create("Frame", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(0, 12, 0, description ~= "" and 44 or 32),
            Size = UDim2.new(1, -24, 0, 8),
        })
        corner(barBg, 4)
        stroke(barBg, currentTheme.Border, 1)
        
        local barFill = create("Frame", {
            Parent = barBg,
            BackgroundColor3 = currentTheme.Primary,
            Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        })
        corner(barFill, 4)
        
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
    
    -- ============================================================
    -- COMPONENT: DROPDOWN
    -- ============================================================
    function tabAPI:CreateDropdown(config)
        config = config or {}
        local name = config.Name or "Dropdown"
        local options = config.Options or {"Option 1", "Option 2", "Option 3"}
        local default = config.Default or options[1]
        local callback = config.Callback or function() end
        local multi = config.Multi or false
        local description = config.Description or ""
        local tooltip = config.Tooltip or ""
        
        local height = description ~= "" and 66 or 50
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, height),
        })
        corner(frame)
        stroke(frame, currentTheme.Border, 1)
        
        local label = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 4),
            Size = UDim2.new(1, -24, 0, 18),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        if description ~= "" then
            create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.TextMuted,
                TextSize = currentTheme.FontSize - 3,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end
        
        if tooltip ~= "" then
            createTooltip(frame, tooltip)
        end
        
        local selectedText = multi and "Select..." or default
        local selectedValue = multi and {} or default
        
        local dropdownBtn = create("TextButton", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(0, 12, 0, description ~= "" and 42 or 26),
            Size = UDim2.new(1, -24, 0, 22),
            Font = currentTheme.Font,
            Text = tostring(selectedText),
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize - 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutoButtonColor = false,
        })
        corner(dropdownBtn, 4)
        stroke(dropdownBtn, currentTheme.Border, 1)
        
        create("TextLabel", {
            Parent = dropdownBtn,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -24, 0, 0),
            Size = UDim2.new(0, 20, 1, 0),
            Font = currentTheme.Font,
            Text = "▼",
            TextColor3 = currentTheme.TextMuted,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Center,
        })
        
        local dropdownContainer = create("Frame", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Surface,
            Position = UDim2.new(0, 12, 0, description ~= "" and 66 or 50),
            Size = UDim2.new(1, -24, 0, 0),
            ClipsDescendants = true,
            Visible = false,
            ZIndex = 100,
        })
        corner(dropdownContainer, 4)
        stroke(dropdownContainer, currentTheme.Border, 1)
        shadow(dropdownContainer, 4)
        
        create("UIListLayout", {
            Parent = dropdownContainer,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2),
        })
        
        local isOpen = false
        local selectedOptions = {}
        
        if multi then selectedOptions = {} end
        
        local function updateDropdown()
            if multi then
                local text = #selectedOptions > 0 and table.concat(selectedOptions, ", ") or "Select..."
                dropdownBtn.Text = text
            else
                dropdownBtn.Text = tostring(selectedValue)
            end
        end
        
        local function createOption(option)
            local optBtn = create("TextButton", {
                Parent = dropdownContainer,
                BackgroundColor3 = currentTheme.Background,
                Size = UDim2.new(1, 0, 0, 26),
                Font = currentTheme.Font,
                Text = "  " .. option,
                TextColor3 = currentTheme.Text,
                TextSize = currentTheme.FontSize - 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutoButtonColor = false,
                ZIndex = 101,
            })
            corner(optBtn, 3)
            
            local isSelected = false
            if multi then
                isSelected = table.find(selectedOptions, option) ~= nil
            else
                isSelected = (selectedValue == option)
            end
            
            if isSelected then
                optBtn.BackgroundColor3 = currentTheme.Primary
                optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
            
            optBtn.MouseEnter:Connect(function()
                if not isSelected then
                    tween(optBtn, {BackgroundColor3 = currentTheme.Surface2}, 0.1)
                end
            end)
            optBtn.MouseLeave:Connect(function()
                if not isSelected then
                    tween(optBtn, {BackgroundColor3 = currentTheme.Background}, 0.1)
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
                        optBtn.BackgroundColor3 = currentTheme.Primary
                        optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                        isSelected = true
                    end
                    updateDropdown()
                    pcall(callback, selectedOptions)
                else
                    selectedValue = option
                    updateDropdown()
                    pcall(callback, option)
                    isOpen = false
                    dropdownContainer.Visible = false
                    dropdownContainer.Size = UDim2.new(1, -24, 0, 0)
                    for _, child in ipairs(dropdownContainer:GetChildren()) do
                        if child:IsA("TextButton") then
                            local optText = child.Text:gsub("^  ", "")
                            child.BackgroundColor3 = (optText == option) and currentTheme.Primary or currentTheme.Background
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
                local height = math.min(#options * 28 + 4, 180)
                tween(dropdownContainer, {Size = UDim2.new(1, -24, 0, height)}, 0.2)
            else
                tween(dropdownContainer, {Size = UDim2.new(1, -24, 0, 0)}, 0.2)
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
    
    -- ============================================================
    -- COMPONENT: KEYBIND
    -- ============================================================
    function tabAPI:CreateKeybind(config)
        config = config or {}
        local name = config.Name or "Keybind"
        local default = config.Default or Enum.KeyCode.X
        local callback = config.Callback or function() end
        local description = config.Description or ""
        local tooltip = config.Tooltip or ""
        
        local height = description ~= "" and 52 or 40
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, height),
        })
        corner(frame)
        stroke(frame, currentTheme.Border, 1)
        
        create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(0, 120, 1, 0),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        if description ~= "" then
            create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.TextMuted,
                TextSize = currentTheme.FontSize - 3,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end
        
        if tooltip ~= "" then
            createTooltip(frame, tooltip)
        end
        
        local keyBtn = create("TextButton", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(1, -140, 0.5, -14),
            Size = UDim2.new(0, 128, 0, 28),
            Font = currentTheme.Font,
            Text = tostring(default),
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize - 1,
            AutoButtonColor = false,
        })
        corner(keyBtn, 4)
        stroke(keyBtn, currentTheme.Border, 1)
        
        local currentKey = default
        local isListening = false
        
        keyBtn.MouseButton1Click:Connect(function()
            isListening = not isListening
            if isListening then
                keyBtn.Text = "Press any key..."
                keyBtn.BackgroundColor3 = currentTheme.Primary
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
                self.Window:Notify("Keybind Set", "Set to: " .. tostring(currentKey), "success")
            end
        end)
        
        table.insert(tabAPI.Components, keybindObject)
        return keybindObject
    end
    
    -- ============================================================
    -- COMPONENT: TEXTBOX
    -- ============================================================
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
        local tooltip = config.Tooltip or ""
        
        local height = multiLine and 76 or 44
        if description ~= "" then height = height + 20 end
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, height),
        })
        corner(frame)
        stroke(frame, currentTheme.Border, 1)
        
        local label = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 0, 20),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        if description ~= "" then
            create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 20),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.TextMuted,
                TextSize = currentTheme.FontSize - 3,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end
        
        if tooltip ~= "" then
            createTooltip(frame, tooltip)
        end
        
        local inputBox = create("TextBox", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(0, 12, 0, description ~= "" and 38 or 22),
            Size = UDim2.new(1, -24, 0, multiLine and 34 or 20),
            Font = currentTheme.Font,
            Text = tostring(default),
            TextColor3 = currentTheme.Text,
            PlaceholderText = placeholder,
            PlaceholderColor3 = currentTheme.TextMuted,
            TextSize = currentTheme.FontSize - 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = multiLine and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
            ClearTextOnFocus = false,
            MultiLine = multiLine,
            TextWrapped = multiLine,
        })
        corner(inputBox, 4)
        stroke(inputBox, currentTheme.Border, 1)
        
        if password then
            inputBox.Text = ""
            inputBox.PlaceholderText = "••••••••"
            inputBox.Text = default
        end
        
        inputBox.FocusLost:Connect(function()
            local value = inputBox.Text
            if numeric and tonumber(value) == nil and value ~= "" then
                inputBox.Text = tostring(default)
                self.Window:Notify("Invalid Input", "Please enter a valid number", "error")
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
    
    -- ============================================================
    -- COMPONENT: LABEL
    -- ============================================================
    function tabAPI:CreateLabel(config)
        config = config or {}
        local text = config.Text or "Label"
        local color = config.Color or currentTheme.Text
        local size = config.Size or currentTheme.FontSize
        local weight = config.Weight or "Regular"
        local icon = config.Icon or ""
        local description = config.Description or ""
        local tooltip = config.Tooltip or ""
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, description ~= "" and 46 or 30),
        })
        corner(frame)
        stroke(frame, currentTheme.Border, 1)
        
        local label = create("TextLabel", {
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
            create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 18),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.TextMuted,
                TextSize = currentTheme.FontSize - 3,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end
        
        if tooltip ~= "" then
            createTooltip(frame, tooltip)
        end
        
        local labelObject = {
            Set = function(self, newText)
                label.Text = (icon ~= "" and icon .. " " or "") .. newText
            end,
        }
        
        table.insert(tabAPI.Components, labelObject)
        return labelObject
    end
    
    -- ============================================================
    -- COMPONENT: PROGRESS BAR
    -- ============================================================
    function tabAPI:CreateProgressBar(config)
        config = config or {}
        local name = config.Name or "Progress"
        local value = config.Value or 0
        local max = config.Max or 100
        local callback = config.Callback or function() end
        local description = config.Description or ""
        local tooltip = config.Tooltip or ""
        
        local height = description ~= "" and 64 or 46
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, height),
        })
        corner(frame)
        stroke(frame, currentTheme.Border, 1)
        
        local label = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 4),
            Size = UDim2.new(1, -80, 0, 18),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        local valueLabel = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -80, 0, 4),
            Size = UDim2.new(0, 70, 0, 18),
            Font = currentTheme.Font,
            Text = math.floor(value / max * 100) .. "%",
            TextColor3 = currentTheme.Primary,
            TextSize = currentTheme.FontSize,
            TextXAlignment = Enum.TextXAlignment.Right,
            FontWeight = Enum.FontWeight.Bold,
        })
        
        if description ~= "" then
            create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 24),
                Size = UDim2.new(1, -24, 0, 16),
                Font = currentTheme.Font,
                Text = description,
                TextColor3 = currentTheme.TextMuted,
                TextSize = currentTheme.FontSize - 3,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end
        
        if tooltip ~= "" then
            createTooltip(frame, tooltip)
        end
        
        local barBg = create("Frame", {
            Parent = frame,
            BackgroundColor3 = currentTheme.Background,
            Position = UDim2.new(0, 12, 0, description ~= "" and 44 or 28),
            Size = UDim2.new(1, -24, 0, 10),
        })
        corner(barBg, 5)
        stroke(barBg, currentTheme.Border, 1)
        
        local barFill = create("Frame", {
            Parent = barBg,
            BackgroundColor3 = currentTheme.Primary,
            Size = UDim2.new(value / max, 0, 1, 0),
        })
        corner(barFill, 5)
        
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
    
    -- ============================================================
    -- COMPONENT: SEPARATOR
    -- ============================================================
    function tabAPI:CreateSeparator(config)
        config = config or {}
        local text = config.Text or ""
        local dashed = config.Dashed or false
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, text ~= "" and 34 or 14),
        })
        corner(frame)
        
        if text ~= "" then
            create("Frame", {
                Parent = frame,
                BackgroundColor3 = currentTheme.Border,
                BackgroundTransparency = dashed and 0.5 or 0,
                Position = UDim2.new(0, 12, 0.5, -0.5),
                Size = UDim2.new(0.5, -70, 0, 1),
            })
            
            create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.5, -40, 0, 0),
                Size = UDim2.new(0, 80, 1, 0),
                Font = currentTheme.Font,
                Text = text,
                TextColor3 = currentTheme.TextMuted,
                TextSize = currentTheme.FontSize - 2,
                TextXAlignment = Enum.TextXAlignment.Center,
            })
            
            create("Frame", {
                Parent = frame,
                BackgroundColor3 = currentTheme.Border,
                BackgroundTransparency = dashed and 0.5 or 0,
                Position = UDim2.new(0.5, 10, 0.5, -0.5),
                Size = UDim2.new(0.5, -70, 0, 1),
            })
        else
            create("Frame", {
                Parent = frame,
                BackgroundColor3 = currentTheme.Border,
                BackgroundTransparency = dashed and 0.5 or 0,
                Position = UDim2.new(0, 12, 0.5, -0.5),
                Size = UDim2.new(1, -24, 0, 1),
            })
        end
    end
    
    -- ============================================================
    -- COMPONENT: STATUS INDICATOR
    -- ============================================================
    function tabAPI:CreateStatusIndicator(config)
        config = config or {}
        local name = config.Name or "Status"
        local default = config.Default or "Offline"
        local description = config.Description or ""
        local tooltip = config.Tooltip or ""
        
        local statuses = {
            Online = {color = Color3.fromRGB(46, 204, 113), icon = "●"},
            Offline = {color = Color3.fromRGB(231, 76, 60), icon = "●"},
            Warning = {color = Color3.fromRGB(241, 196, 15), icon = "●"},
            Idle = {color = Color3.fromRGB(52, 152, 219), icon = "●"},
        }
        
        local height = description ~= "" and 46 or 32
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = currentTheme.Surface2,
            Size = UDim2.new(1, 0, 0, height),
        })
        corner(frame)
        stroke(frame, currentTheme.Border, 1)
        
        local indicator = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(0, 30, 1, 0),
            Font = currentTheme.Font,
            Text = statuses[default] and statuses[default].icon or "●",
            TextColor3 = statuses[default] and statuses[default].color or currentTheme.TextMuted,
            TextSize = 16,
            TextXAlignment = Enum.TextXAlignment.Center,
        })
        
        create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 44, 0, 0),
            Size = UDim2.new(1, -60, 0, 18),
            Font = currentTheme.Font,
            Text = name,
            TextColor3 = currentTheme.Text,
            TextSize = currentTheme.FontSize,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })
        
        local statusLabel = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 44, 0, description ~= "" and 20 or 16),
            Size = UDim2.new(1, -60, 0, description ~= "" and 20 or 16),
            Font = currentTheme.Font,
            Text = description ~= "" and description or default,
            TextColor3 = currentTheme.TextMuted,
            TextSize = currentTheme.FontSize - 3,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        
        if tooltip ~= "" then
            createTooltip(frame, tooltip)
        end
        
        local statusObject = {
            Set = function(self, newStatus, newDesc)
                local data = statuses[newStatus] or statuses.Offline
                indicator.Text = data.icon
                indicator.TextColor3 = data.color
                if newDesc then
                    statusLabel.Text = newDesc
                else
                    statusLabel.Text = newStatus
                end
            end,
        }
        
        table.insert(tabAPI.Components, statusObject)
        return statusObject
    end
    
    -- ============================================================
    -- NOTIFICATION METHOD
    -- ============================================================
    function self:Notify(title, message, type, duration)
        return createNotification(self, title, message, type, duration)
    end
    
    -- ============================================================
    -- DESTROY METHOD
    -- ============================================================
    function self:Destroy()
        if self.SG then
            self.SG:Destroy()
        end
    end
    
    return tabAPI
end

-- ============================================================
-- RETURN LIBRARY
-- ============================================================
return NexusUI
