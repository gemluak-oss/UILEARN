-- ============================================================
-- RUINZ UI v2.0 - COMPLETE EDITION
-- Full library with all components
-- ============================================================

local RuinzUI = {}
RuinzUI.__index = RuinzUI

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local THEME = {
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
}

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

function RuinzUI.new(config)
    config = config or {}
    local titleText = config.Title or "RUINZ UI"
    
    if CoreGui:FindFirstChild("RuinzUI") then
        CoreGui.RuinzUI:Destroy()
    end
    
    local self = setmetatable({}, RuinzUI)
    
    self.SG = Create("ScreenGui", {
        Name = "RuinzUI",
        Parent = CoreGui,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })
    
    self.Main = Create("Frame", {
        Parent = self.SG,
        BackgroundColor3 = THEME.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -350, 0.5, -250),
        Size = UDim2.new(0, 700, 0, 500),
        ClipsDescendants = true,
    })
    AddCorner(self.Main, THEME.CornerRadius)
    AddStroke(self.Main, THEME.Border, 1)
    
    self.TopBar = Create("Frame", {
        Parent = self.Main,
        BackgroundColor3 = THEME.Paper,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 42),
    })
    AddCorner(self.TopBar, THEME.CornerRadius)
    
    Create("TextLabel", {
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
    
    Create("TextLabel", {
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
    
    local closeBtn = Create("TextButton", {
        Parent = self.TopBar,
        BackgroundColor3 = THEME.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -34, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = THEME.Font,
        Text = "×",
        TextColor3 = THEME.Text,
        TextSize = 14,
        AutoButtonColor = false,
    })
    AddCorner(closeBtn, 4)
    AddStroke(closeBtn, THEME.Border, 1)
    closeBtn.MouseButton1Click:Connect(function() self.SG:Destroy() end)
    closeBtn.MouseEnter:Connect(function() Tween(closeBtn, {BackgroundColor3 = THEME.Danger, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15) end)
    closeBtn.MouseLeave:Connect(function() Tween(closeBtn, {BackgroundColor3 = THEME.Background, TextColor3 = THEME.Text}, 0.15) end)

    local minBtn = Create("TextButton", {
        Parent = self.TopBar,
        BackgroundColor3 = THEME.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -66, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = THEME.Font,
        Text = "−",
        TextColor3 = THEME.Text,
        TextSize = 14,
        AutoButtonColor = false,
    })
    AddCorner(minBtn, 4)
    AddStroke(minBtn, THEME.Border, 1)
    local minimized = false
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        Tween(self.Main, {Size = minimized and UDim2.new(0, 700, 0, 42) or UDim2.new(0, 700, 0, 500)}, 0.3)
        if self.Sidebar then self.Sidebar.Visible = not minimized end
        if self.ContentArea then self.ContentArea.Visible = not minimized end
    end)
    minBtn.MouseEnter:Connect(function() Tween(minBtn, {BackgroundColor3 = THEME.Blueprint, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15) end)
    minBtn.MouseLeave:Connect(function() Tween(minBtn, {BackgroundColor3 = THEME.Background, TextColor3 = THEME.Text}, 0.15) end)

    MakeDraggable(self.Main, self.TopBar)

    self.Sidebar = Create("ScrollingFrame", {
        Parent = self.Main,
        BackgroundColor3 = THEME.Paper,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 43),
        Size = UDim2.new(0, 140, 1, -43),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = THEME.Blueprint,
    })
    AddStroke(self.Sidebar, THEME.Border, 1)
    Create("UIListLayout", {Parent = self.Sidebar, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)})
    Create("UIPadding", {Parent = self.Sidebar, PaddingTop = UDim.new(0, 10), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6)})

    self.ContentArea = Create("Frame", {
        Parent = self.Main,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 148, 0, 50),
        Size = UDim2.new(1, -156, 1, -56),
    })

    self.Tabs = {}
    self.Pages = {}
    self.FirstTab = true
    self.Notifications = {}
    
    return self
end

function RuinzUI:CreateTab(name, icon)
    icon = icon or "◆"
    
    local tabBtn = Create("TextButton", {
        Parent = self.Sidebar,
        BackgroundColor3 = self.FirstTab and THEME.Accent or THEME.Background,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 30),
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
    Create("UIListLayout", {Parent = page, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)})
    Create("UIPadding", {Parent = page, PaddingRight = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10)})

    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(self.Pages) do p.Visible = false end
        for _, t in pairs(self.Tabs) do
            Tween(t.Button, {BackgroundColor3 = THEME.Background, TextColor3 = THEME.Text}, 0.15)
        end
        page.Visible = true
        Tween(tabBtn, {BackgroundColor3 = THEME.Accent, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
    end)

    if self.FirstTab then self.FirstTab = false end
    table.insert(self.Tabs, {Button = tabBtn, Page = page})
    table.insert(self.Pages, page)

    local tabAPI = {Page = page, Window = self}
    
    function tabAPI:CreateSection(title)
        local sec = Create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, 30),
        })
        AddCorner(sec, THEME.CornerRadius)
        AddStroke(sec, THEME.Blueprint, 1)
        Create("TextLabel", {
            Parent = sec,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 1, 0),
            Font = THEME.Font,
            Text = "// " .. string.upper(title),
            TextColor3 = THEME.Blueprint,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Bold,
        })
        local container = Create("Frame", {
            Parent = sec,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 30),
            Size = UDim2.new(1, 0, 0, 0),
            ClipsDescendants = true,
        })
        Create("UIListLayout", {Parent = container, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)})
        Create("UIPadding", {Parent = container, PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4), PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6)})
        local function updateSize()
            container.Size = UDim2.new(1, 0, 0, container.AbsoluteSize.Y)
            sec.Size = UDim2.new(1, 0, 0, 30 + container.AbsoluteSize.Y)
        end
        container.ChildAdded:Connect(function() task.wait(0.05) updateSize() end)
        task.wait(0.1) updateSize()
        return {Container = container, Section = sec}
    end

    function tabAPI:CreateButton(config)
        config = config or {}
        local name = config.Name or "Button"
        local callback = config.Callback or function() end
        local btn = Create("TextButton", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, 34),
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
            Tween(btn, {Size = UDim2.new(0.98, 0, 0, 32)}, 0.05)
            task.wait(0.05)
            Tween(btn, {Size = UDim2.new(1, 0, 0, 34)}, 0.05)
            pcall(callback)
        end)
        return btn
    end

    function tabAPI:CreateToggle(config)
        config = config or {}
        local name = config.Name or "Toggle"
        local default = config.Default or false
        local callback = config.Callback or function() end
        local desc = config.Description or ""

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, desc ~= "" and 44 or 36),
        })
        AddCorner(frame, THEME.CornerRadius)
        AddStroke(frame, THEME.Border, 1)

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, desc ~= "" and 0 or 0),
            Size = UDim2.new(1, -60, 0, desc ~= "" and 22 or 36),
            Font = THEME.Font,
            Text = name,
            TextColor3 = THEME.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        if desc ~= "" then
            Create("TextLabel", {
                Parent = frame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 22),
                Size = UDim2.new(1, -60, 0, 18),
                Font = THEME.Font,
                Text = desc,
                TextColor3 = THEME.Grey,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        end

        local togBg = Create("Frame", {
            Parent = frame,
            BackgroundColor3 = default and THEME.Blueprint or THEME.Background,
            Position = UDim2.new(1, -42, 0.5, -10),
            Size = UDim2.new(0, 34, 0, 20),
        })
        AddCorner(togBg, 10)
        AddStroke(togBg, THEME.Border, 1)

        local togDot = Create("Frame", {
            Parent = togBg,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = default and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
            Size = UDim2.new(0, 14, 0, 14),
        })
        AddCorner(togDot, 7)

        local state = default
        local function toggle()
            state = not state
            Tween(togBg, {BackgroundColor3 = state and THEME.Blueprint or THEME.Background}, 0.15)
            Tween(togDot, {Position = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)}, 0.15)
            pcall(callback, state)
        end
        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then toggle() end
        end)
        return {Value = state, Toggle = toggle}
    end

    function tabAPI:CreateTextBox(config)
        config = config or {}
        local name = config.Name or "Input"
        local placeholder = config.Placeholder or ""
        local default = config.Default or ""
        local callback = config.Callback or function() end

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, 50),
        })
        AddCorner(frame, THEME.CornerRadius)
        AddStroke(frame, THEME.Border, 1)

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 2),
            Size = UDim2.new(1, -24, 0, 20),
            Font = THEME.Font,
            Text = name,
            TextColor3 = THEME.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })

        local box = Create("TextBox", {
            Parent = frame,
            BackgroundColor3 = THEME.Background,
            Position = UDim2.new(0, 12, 0, 24),
            Size = UDim2.new(1, -24, 0, 20),
            Font = THEME.Font,
            Text = tostring(default),
            TextColor3 = THEME.Text,
            PlaceholderText = placeholder,
            PlaceholderColor3 = THEME.Grey,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            ClearTextOnFocus = false,
        })
        AddCorner(box, 4)
        AddStroke(box, THEME.Border, 1)

        box.FocusLost:Connect(function() pcall(callback, box.Text) end)
        return {Value = box, Set = function(self, v) box.Text = tostring(v) end}
    end

    function tabAPI:CreateKeybind(config)
        config = config or {}
        local name = config.Name or "Keybind"
        local default = config.Default or Enum.KeyCode.X
        local callback = config.Callback or function() end

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, 40),
        })
        AddCorner(frame, THEME.CornerRadius)
        AddStroke(frame, THEME.Border, 1)

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(0, 120, 1, 0),
            Font = THEME.Font,
            Text = name,
            TextColor3 = THEME.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })

        local keyBtn = Create("TextButton", {
            Parent = frame,
            BackgroundColor3 = THEME.Background,
            Position = UDim2.new(1, -130, 0.5, -14),
            Size = UDim2.new(0, 120, 0, 28),
            Font = THEME.Font,
            Text = tostring(default),
            TextColor3 = THEME.Text,
            TextSize = 11,
            AutoButtonColor = false,
        })
        AddCorner(keyBtn, 4)
        AddStroke(keyBtn, THEME.Border, 1)

        local currentKey = default
        local listening = false
        keyBtn.MouseButton1Click:Connect(function()
            listening = not listening
            if listening then
                keyBtn.Text = "Press any key..."
                keyBtn.BackgroundColor3 = THEME.Accent
                keyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                keyBtn.Text = tostring(currentKey)
                keyBtn.BackgroundColor3 = THEME.Background
                keyBtn.TextColor3 = THEME.Text
            end
        end)

        UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if listening and input.KeyCode ~= Enum.KeyCode.Unknown then
                currentKey = input.KeyCode
                keyBtn.Text = tostring(currentKey)
                keyBtn.BackgroundColor3 = THEME.Background
                keyBtn.TextColor3 = THEME.Text
                listening = false
                pcall(callback, currentKey)
            end
        end)
        return {Value = currentKey}
    end

    function tabAPI:CreateStatusIndicator(config)
        config = config or {}
        local name = config.Name or "Status"
        local default = config.Default or "Offline"
        local desc = config.Description or ""
        
        local statuses = {
            Online = {color = Color3.fromRGB(46, 204, 113), icon = "●"},
            Offline = {color = Color3.fromRGB(231, 76, 60), icon = "●"},
            Warning = {color = Color3.fromRGB(241, 196, 15), icon = "●"},
            Idle = {color = Color3.fromRGB(52, 152, 219), icon = "●"},
        }

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, desc ~= "" and 44 or 34),
        })
        AddCorner(frame, THEME.CornerRadius)
        AddStroke(frame, THEME.Border, 1)

        local indicator = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(0, 30, 1, 0),
            Font = THEME.Font,
            Text = statuses[default] and statuses[default].icon or "●",
            TextColor3 = statuses[default] and statuses[default].color or THEME.Grey,
            TextSize = 16,
            TextXAlignment = Enum.TextXAlignment.Center,
        })

        Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 44, 0, 0),
            Size = UDim2.new(1, -60, 0, 20),
            Font = THEME.Font,
            Text = name,
            TextColor3 = THEME.Text,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontWeight = Enum.FontWeight.Medium,
        })

        local statusLabel = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 44, 0, 20),
            Size = UDim2.new(1, -60, 0, desc ~= "" and 20 or 14),
            Font = THEME.Font,
            Text = desc ~= "" and desc or default,
            TextColor3 = THEME.Grey,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        return {
            Set = function(self, newStatus, newDesc)
                local data = statuses[newStatus] or statuses.Offline
                indicator.Text = data.icon
                indicator.TextColor3 = data.color
                if newDesc then statusLabel.Text = newDesc else statusLabel.Text = newStatus end
            end
        }
    end

    function tabAPI:CreateLabel(config)
        config = config or {}
        local text = config.Text or "Label"
        local color = config.Color or THEME.Text
        local size = config.Size or 12

        local frame = Create("Frame", {
            Parent = page,
            BackgroundColor3 = THEME.Paper,
            Size = UDim2.new(1, 0, 0, 30),
        })
        AddCorner(frame, THEME.CornerRadius)
        AddStroke(frame, THEME.Border, 1)

        local label = Create("TextLabel", {
            Parent = frame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 1, 0),
            Font = THEME.Font,
            Text = text,
            TextColor3 = color,
            TextSize = size,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        return {Set = function(self, t) label.Text = t end}
    end

    function self:Notify(title, message, type)
        type = type or "info"
        local notif = Create("Frame", {
            Parent = self.SG,
            BackgroundColor3 = THEME.Paper,
            Position = UDim2.new(1, -300, 0, 10 + (#self.Notifications * 60)),
            Size = UDim2.new(0, 280, 0, 50),
            BorderSizePixel = 0,
        })
        AddCorner(notif, 6)
        AddStroke(notif, type == "success" and THEME.Success or type == "error" and THEME.Danger or THEME.Border, 1)

        Create("TextLabel", {
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
        Create("TextLabel", {
            Parent = notif,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 26),
            Size = UDim2.new(1, -24, 0, 20),
            Font = THEME.Font,
            Text = message,
            TextColor3 = THEME.Grey,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
        })

        notif.Position = UDim2.new(1, 20, 0, 10 + (#self.Notifications * 60))
        Tween(notif, {Position = UDim2.new(1, -300, 0, 10 + (#self.Notifications * 60))}, 0.3)
        table.insert(self.Notifications, notif)

        task.wait(3)
        if notif.Parent then
            Tween(notif, {Position = UDim2.new(1, 20, 0, 10 + (#self.Notifications * 60))}, 0.3)
            task.wait(0.3)
            notif:Destroy()
            table.remove(self.Notifications, table.find(self.Notifications, notif))
        end
    end

    return RuinzUI
end

return RuinzUI
