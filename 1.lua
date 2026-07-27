-- ============================================================
-- [NAMA LIBRARY LU] v1.0
-- BUILT FROM SCRATCH
-- ============================================================

local MyUI = {}
MyUI.__index = MyUI

-- SERVICES YANG DIPERLUIN
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- ============================================================
-- 1. THEME / KONFIGURASI
-- ============================================================
local THEME = {
    Background = Color3.fromRGB(30, 30, 40),
    Surface = Color3.fromRGB(40, 40, 50),
    Primary = Color3.fromRGB(0, 188, 212),
    Secondary = Color3.fromRGB(255, 176, 0),
    Text = Color3.fromRGB(255, 255, 255),
    TextMuted = Color3.fromRGB(150, 150, 150),
    Danger = Color3.fromRGB(255, 70, 70),
    Success = Color3.fromRGB(70, 255, 70),
    Font = Enum.Font.Gotham,
    CornerRadius = 6,
}

-- ============================================================
-- 2. UTILITY FUNCTIONS
-- ============================================================
local function create(className, props)
    local obj = Instance.new(className)
    for k, v in pairs(props or {}) do
        pcall(function() obj[k] = v end)
    end
    return obj
end

local function tween(obj, props, duration)
    duration = duration or 0.2
    local t = TweenService:Create(obj, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
    t:Play()
    return t
end

local function corner(obj, radius)
    return create("UICorner", {
        CornerRadius = UDim.new(0, radius or THEME.CornerRadius),
        Parent = obj
    })
end

local function stroke(obj, color, thickness)
    return create("UIStroke", {
        Color = color or THEME.Primary,
        Thickness = thickness or 1,
        Parent = obj
    })
end

-- ============================================================
-- 3. DRAGGABLE SYSTEM
-- ============================================================
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
-- 4. WINDOW / MAIN FRAME
-- ============================================================
function MyUI.new(config)
    config = config or {}
    local title = config.Title or "My UI"
    
    -- Hapus window lama kalo ada
    if CoreGui:FindFirstChild("MyUI") then
        CoreGui.MyUI:Destroy()
    end
    
    local self = setmetatable({}, MyUI)
    
    -- ScreenGui
    self.SG = create("ScreenGui", {
        Name = "MyUI",
        Parent = CoreGui,
        ResetOnSpawn = false,
    })
    
    -- Main Frame
    self.Main = create("Frame", {
        Parent = self.SG,
        BackgroundColor3 = THEME.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -300, 0.5, -200),
        Size = UDim2.new(0, 600, 0, 400),
        ClipsDescendants = true,
    })
    corner(self.Main)
    stroke(self.Main, THEME.Primary, 2)
    
    -- Top Bar
    self.TopBar = create("Frame", {
        Parent = self.Main,
        BackgroundColor3 = THEME.Surface,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
    })
    
    -- Title
    create("TextLabel", {
        Parent = self.TopBar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(0, 300, 1, 0),
        Font = THEME.Font,
        Text = title,
        TextColor3 = THEME.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontWeight = Enum.FontWeight.Bold,
    })
    
    -- Close Button
    local closeBtn = create("TextButton", {
        Parent = self.TopBar,
        BackgroundColor3 = THEME.Surface,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -34, 0.5, -14),
        Size = UDim2.new(0, 28, 0, 28),
        Font = THEME.Font,
        Text = "✕",
        TextColor3 = THEME.Text,
        TextSize = 14,
        AutoButtonColor = false,
    })
    corner(closeBtn)
    closeBtn.MouseButton1Click:Connect(function()
        self.SG:Destroy()
    end)
    closeBtn.MouseEnter:Connect(function()
        tween(closeBtn, {BackgroundColor3 = THEME.Danger, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
    end)
    closeBtn.MouseLeave:Connect(function()
        tween(closeBtn, {BackgroundColor3 = THEME.Surface, TextColor3 = THEME.Text}, 0.15)
    end)
    
    -- Make draggable
    makeDraggable(self.Main, self.TopBar)
    
    -- Sidebar (buat tabs)
    self.Sidebar = create("ScrollingFrame", {
        Parent = self.Main,
        BackgroundColor3 = THEME.Surface,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(0, 120, 1, -40),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = THEME.Primary,
    })
    create("UIListLayout", {
        Parent = self.Sidebar,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    })
    create("UIPadding", {
        Parent = self.Sidebar,
        PaddingTop = UDim.new(0, 8),
        PaddingLeft = UDim.new(0, 6),
        PaddingRight = UDim.new(0, 6),
    })
    
    -- Content Area
    self.Content = create("Frame", {
        Parent = self.Main,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 128, 0, 48),
        Size = UDim2.new(1, -136, 1, -56),
    })
    
    self.Tabs = {}
    self.Pages = {}
    self.FirstTab = true
    
    return self
end

-- ============================================================
-- 5. TAB SYSTEM
-- ============================================================
function MyUI:CreateTab(name, icon)
    icon = icon or "◆"
    
    local tabBtn = create("TextButton", {
        Parent = self.Sidebar,
        BackgroundColor3 = self.FirstTab and THEME.Primary or THEME.Background,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 32),
        Font = THEME.Font,
        Text = icon .. " " .. name,
        TextColor3 = self.FirstTab and Color3.fromRGB(255, 255, 255) or THEME.TextMuted,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        AutoButtonColor = false,
    })
    corner(tabBtn, 4)
    
    local page = create("ScrollingFrame", {
        Parent = self.Content,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = THEME.TextMuted,
        Visible = self.FirstTab,
    })
    create("UIListLayout", {
        Parent = page,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8),
    })
    create("UIPadding", {
        Parent = page,
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 8),
        PaddingBottom = UDim.new(0, 8),
    })
    
    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(self.Pages) do p.Visible = false end
        for _, t in pairs(self.Tabs) do
            t.Button.BackgroundColor3 = THEME.Background
            t.Button.TextColor3 = THEME.TextMuted
        end
        page.Visible = true
        tabBtn.BackgroundColor3 = THEME.Primary
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    if self.FirstTab then self.FirstTab = false end
    table.insert(self.Tabs, {Button = tabBtn, Page = page})
    table.insert(self.Pages, page)
    
    local tabAPI = {Page = page}
    
    -- ============================================================
    -- 6. COMPONENTS
    -- ============================================================
    
    -- SECTION
    function tabAPI:CreateSection(title)
        local sec = create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Surface,
            Size = UDim2.new(1, 0, 0, 30),
        })
        corner(sec)
        
        create("TextLabel", {
            Parent = sec,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 10, 0, 0),
            Size = UDim2.new(1, -20, 1, 0),
            Font = THEME.Font,
            Text = string.upper(title),
            TextColor3 = THEME.Primary,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Bold,
        })
        
        local container = create("Frame", {
            Parent = sec,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 30),
            Size = UDim2.new(1, 0, 0, 0),
            ClipsDescendants = true,
        })
        create("UIListLayout", {
            Parent = container,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 6),
        })
        create("UIPadding", {
            Parent = container,
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 6),
            PaddingBottom = UDim.new(0, 6),
        })
        
        local function updateSize()
            container.Size = UDim2.new(1, 0, 0, container.AbsoluteSize.Y)
            sec.Size = UDim2.new(1, 0, 0, 30 + container.AbsoluteSize.Y)
        end
        container.ChildAdded:Connect(function()
            task.wait(0.05)
            updateSize()
        end)
        task.wait(0.1)
        updateSize()
        
        return {Container = container}
    end
    
    -- BUTTON
    function tabAPI:CreateButton(config)
        config = config or {}
        local name = config.Name or "Button"
        local callback = config.Callback or function() end
        
        local btn = create("TextButton", {
            Parent = page,
            BackgroundColor3 = THEME.Surface,
            Size = UDim2.new(1, 0, 0, 36),
            Font = THEME.Font,
            Text = name,
            TextColor3 = THEME.Text,
            TextSize = 13,
            AutoButtonColor = false,
        })
        corner(btn)
        stroke(btn, THEME.Primary, 1)
        
        btn.MouseEnter:Connect(function()
            tween(btn, {BackgroundColor3 = THEME.Primary, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
        end)
        btn.MouseLeave:Connect(function()
            tween(btn, {BackgroundColor3 = THEME.Surface, TextColor3 = THEME.Text}, 0.15)
        end)
        
        btn.MouseButton1Click:Connect(function()
            tween(btn, {Size = UDim2.new(0.98, 0, 0, 34)}, 0.05)
            task.wait(0.05)
            tween(btn, {Size = UDim2.new(1, 0, 0, 36)}, 0.05)
            pcall(callback)
        end)
        
        return btn
    end
    
    -- TOGGLE
    function tabAPI:CreateToggle(config)
        config = config or {}
        local name = config.Name or "Toggle"
        local default = config.Default or false
        local callback = config.Callback or function() end
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Surface,
            Size = UDim2.new(1, 0, 0, 36),
        })
        corner(frame)
        stroke(frame, THEME.Surface, 1)
        
        create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 10, 0, 0),
            Size = UDim2.new(1, -60, 1, 0),
            Font = THEME.Font,
            Text = name,
            TextColor3 = THEME.Text,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        
        local bg = create("Frame", {
            Parent = frame,
            BackgroundColor3 = default and THEME.Primary or THEME.Background,
            Position = UDim2.new(1, -42, 0.5, -10),
            Size = UDim2.new(0, 34, 0, 20),
        })
        corner(bg, 10)
        stroke(bg, THEME.Primary, 1)
        
        local dot = create("Frame", {
            Parent = bg,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = default and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
            Size = UDim2.new(0, 14, 0, 14),
        })
        corner(dot, 7)
        
        local state = default
        
        local function toggle()
            state = not state
            tween(bg, {BackgroundColor3 = state and THEME.Primary or THEME.Background}, 0.15)
            tween(dot, {Position = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)}, 0.15)
            pcall(callback, state)
        end
        
        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                toggle()
            end
        end)
        
        return {
            Value = state,
            Toggle = toggle,
            Set = function(self, newState)
                state = newState
                tween(bg, {BackgroundColor3 = state and THEME.Primary or THEME.Background}, 0.15)
                tween(dot, {Position = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)}, 0.15)
                pcall(callback, state)
            end
        }
    end
    
    -- TEXTBOX
    function tabAPI:CreateTextBox(config)
        config = config or {}
        local name = config.Name or "Input"
        local placeholder = config.Placeholder or ""
        local default = config.Default or ""
        local callback = config.Callback or function() end
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Surface,
            Size = UDim2.new(1, 0, 0, 50),
        })
        corner(frame)
        stroke(frame, THEME.Surface, 1)
        
        create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 10, 0, 2),
            Size = UDim2.new(1, -20, 0, 18),
            Font = THEME.Font,
            Text = name,
            TextColor3 = THEME.TextMuted,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        
        local box = create("TextBox", {
            Parent = frame,
            BackgroundColor3 = THEME.Background,
            Position = UDim2.new(0, 10, 0, 22),
            Size = UDim2.new(1, -20, 0, 22),
            Font = THEME.Font,
            Text = tostring(default),
            TextColor3 = THEME.Text,
            PlaceholderText = placeholder,
            PlaceholderColor3 = THEME.TextMuted,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            ClearTextOnFocus = false,
        })
        corner(box, 4)
        stroke(box, THEME.Surface, 1)
        
        box.FocusLost:Connect(function()
            pcall(callback, box.Text)
        end)
        
        return {
            Value = box,
            Set = function(self, val)
                box.Text = tostring(val)
            end
        }
    end
    
    -- LABEL
    function tabAPI:CreateLabel(config)
        config = config or {}
        local text = config.Text or "Label"
        local color = config.Color or THEME.Text
        local size = config.Size or 12
        
        local frame = create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Surface,
            Size = UDim2.new(1, 0, 0, 28),
        })
        corner(frame)
        
        local label = create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 10, 0, 0),
            Size = UDim2.new(1, -20, 1, 0),
            Font = THEME.Font,
            Text = text,
            TextColor3 = color,
            TextSize = size,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        
        return {
            Set = function(self, newText)
                label.Text = newText
            end
        }
    end
    
    return tabAPI
end

-- ============================================================
-- 7. NOTIFICATION SYSTEM
-- ============================================================
function MyUI:Notify(title, message, type)
    type = type or "info"
    
    local colors = {
        info = THEME.Primary,
        success = THEME.Success,
        error = THEME.Danger,
    }
    
    local notif = create("Frame", {
        Parent = self.SG,
        BackgroundColor3 = THEME.Surface,
        Position = UDim2.new(1, -300, 0, 10),
        Size = UDim2.new(0, 280, 0, 50),
        BorderSizePixel = 0,
    })
    corner(notif)
    stroke(notif, colors[type] or THEME.Primary, 2)
    
    create("TextLabel", {
        Parent = notif,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 4),
        Size = UDim2.new(1, -24, 0, 20),
        Font = THEME.Font,
        Text = title,
        TextColor3 = THEME.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontWeight = Enum.FontWeight.Bold,
    })
    
    create("TextLabel", {
        Parent = notif,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 26),
        Size = UDim2.new(1, -24, 0, 20),
        Font = THEME.Font,
        Text = message,
        TextColor3 = THEME.TextMuted,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
    })
    
    -- Slide in animation
    notif.Position = UDim2.new(1, 20, 0, 10)
    tween(notif, {Position = UDim2.new(1, -300, 0, 10)}, 0.3)
    
    -- Auto dismiss
    task.wait(3)
    if notif.Parent then
        tween(notif, {Position = UDim2.new(1, 20, 0, 10)}, 0.3)
        task.wait(0.3)
        notif:Destroy()
    end
end

-- ============================================================
-- 8. RETURN LIBRARY
-- ============================================================
return MyUI
