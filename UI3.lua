local Nathub = {};
local TweenService = game:GetService("TweenService")
-- StarterGui.NathubLibrary
Nathub["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
Nathub["1"]["Name"] = [[NathubLibrary]];
Nathub["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
Nathub["1"]["ResetOnSpawn"] = false

-- StarterGui.NathubLibrary.Holder
Nathub["2"] = Instance.new("Frame", Nathub["1"]);
Nathub["2"]["BorderSizePixel"] = 0;
Nathub["2"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
Nathub["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["2"]["Size"] = UDim2.new(0, 400, 0, 270);
Nathub["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
Nathub["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["2"]["Name"] = [[Holder]];
Nathub["2"]["BackgroundTransparency"] = 0.01;


-- StarterGui.NathubLibrary.Holder.Shadow
Nathub["3"] = Instance.new("Frame", Nathub["2"]);
Nathub["3"]["ZIndex"] = 0;
Nathub["3"]["Size"] = UDim2.new(1, 0, 1, 0);
Nathub["3"]["Name"] = [[Shadow]];
Nathub["3"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Holder.Shadow.umbraShadow
Nathub["4"] = Instance.new("ImageLabel", Nathub["3"]);
Nathub["4"]["ZIndex"] = 0;
Nathub["4"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
Nathub["4"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["4"]["ImageTransparency"] = 0.86;
Nathub["4"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["4"]["Image"] = [[rbxassetid://1316045217]];
Nathub["4"]["Size"] = UDim2.new(1, 10, 1, 10);
Nathub["4"]["BackgroundTransparency"] = 1;
Nathub["4"]["Name"] = [[umbraShadow]];
Nathub["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 8);


-- StarterGui.NathubLibrary.Holder.Shadow.penumbraShadow
Nathub["5"] = Instance.new("ImageLabel", Nathub["3"]);
Nathub["5"]["ZIndex"] = 0;
Nathub["5"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
Nathub["5"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["5"]["ImageTransparency"] = 0.88;
Nathub["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["5"]["Image"] = [[rbxassetid://1316045217]];
Nathub["5"]["Size"] = UDim2.new(1, 10, 1, 10);
Nathub["5"]["BackgroundTransparency"] = 1;
Nathub["5"]["Name"] = [[penumbraShadow]];
Nathub["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 8);


-- StarterGui.NathubLibrary.Holder.Shadow.ambientShadow
Nathub["6"] = Instance.new("ImageLabel", Nathub["3"]);
Nathub["6"]["ZIndex"] = 0;
Nathub["6"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
Nathub["6"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["6"]["ImageTransparency"] = 0.88;
Nathub["6"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["6"]["Image"] = [[rbxassetid://1316045217]];
Nathub["6"]["Size"] = UDim2.new(1, 10, 1, 10);
Nathub["6"]["BackgroundTransparency"] = 1;
Nathub["6"]["Name"] = [[ambientShadow]];
Nathub["6"]["Position"] = UDim2.new(0.5, 0, 0.5, 8);


-- StarterGui.NathubLibrary.Holder.Shadow.UICorner
Nathub["7"] = Instance.new("UICorner", Nathub["3"]);
Nathub["7"]["CornerRadius"] = UDim.new(0, 6);


-- StarterGui.NathubLibrary.Holder.Topbar
Nathub["8"] = Instance.new("Frame", Nathub["2"]);
Nathub["8"]["BorderSizePixel"] = 0;
Nathub["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["8"]["Size"] = UDim2.new(0, 400, 0, 31);
Nathub["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["8"]["Name"] = [[Topbar]];
Nathub["8"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Holder.Topbar.UICorner
Nathub["9"] = Instance.new("UICorner", Nathub["8"]);
Nathub["9"]["CornerRadius"] = UDim.new(0, 6);


-- StarterGui.NathubLibrary.Holder.Topbar.Minimize
Nathub["a"] = Instance.new("ImageButton", Nathub["8"]);
Nathub["a"]["BorderSizePixel"] = 0;
Nathub["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["a"]["Image"] = [[rbxassetid://10734895530]];
Nathub["a"]["Size"] = UDim2.new(0, 20, 0, 20);
Nathub["a"]["BackgroundTransparency"] = 1;
Nathub["a"]["Name"] = [[Minimize]];
Nathub["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["a"]["Position"] = UDim2.new(0.935, 0, 0.09677, 0);


-- StarterGui.NathubLibrary.Holder.Topbar.Minimize.LocalScript
Nathub["b"] = Instance.new("LocalScript", Nathub["a"]);



-- StarterGui.NathubLibrary.Holder.Topbar.LocalScript
Nathub["c"] = Instance.new("LocalScript", Nathub["8"]);



-- StarterGui.NathubLibrary.Holder.Topbar.Hub
Nathub["d"] = Instance.new("TextLabel", Nathub["8"]);
Nathub["d"]["BorderSizePixel"] = 0;
Nathub["d"]["TextSize"] = 18;
Nathub["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Nathub["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["d"]["BackgroundTransparency"] = 1;
Nathub["d"]["Size"] = UDim2.new(0, 400, 0, 31);
Nathub["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["d"]["Text"] = [[Pukimak Library]];
Nathub["d"]["Name"] = [[Hub]];
Nathub["d"]["Position"] = UDim2.new(0, 0, 0.09677, 0);


-- StarterGui.NathubLibrary.Holder.Topbar.IconHub
Nathub["e"] = Instance.new("ImageLabel", Nathub["8"]);
Nathub["e"]["BorderSizePixel"] = 0;
Nathub["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["e"]["Image"] = [[rbxassetid://10734973645]];
Nathub["e"]["Size"] = UDim2.new(0, 30, 0, 30);
Nathub["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["e"]["BackgroundTransparency"] = 1;
Nathub["e"]["Name"] = [[IconHub]];
Nathub["e"]["Position"] = UDim2.new(0.0225, 0, 0, 0);


-- StarterGui.NathubLibrary.Holder.UICorner
Nathub["f"] = Instance.new("UICorner", Nathub["2"]);
Nathub["f"]["CornerRadius"] = UDim.new(0, 6);


-- StarterGui.NathubLibrary.Holder.One
Nathub["10"] = Instance.new("ScrollingFrame", Nathub["2"]);
Nathub["10"]["Active"] = true;
Nathub["10"]["BorderSizePixel"] = 0;
Nathub["10"]["CanvasSize"] = UDim2.new(0, 0, 20, 0);
Nathub["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["10"]["Name"] = [[One]];
Nathub["10"]["Size"] = UDim2.new(0, 400, 0, 233);
Nathub["10"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["10"]["Position"] = UDim2.new(0, 0, 0.13333, 0);
Nathub["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["10"]["ScrollBarThickness"] = 0;
Nathub["10"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Holder.One.Container
Nathub["11"] = Instance.new("Frame", Nathub["10"]);
Nathub["11"]["BorderSizePixel"] = 0;
Nathub["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["11"]["Size"] = UDim2.new(0, 400, 0, 233);
Nathub["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["11"]["Name"] = [[Container]];
Nathub["11"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Holder.One.Container.UIListLayout
Nathub["12"] = Instance.new("UIListLayout", Nathub["11"]);
Nathub["12"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.NathubLibrary.Holder.One.Container.Section
Nathub["13"] = Instance.new("TextLabel", Nathub["11"]);
Nathub["13"]["BorderSizePixel"] = 0;
Nathub["13"]["TextSize"] = 18;
Nathub["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["13"]["TextColor3"] = Color3.fromRGB(4, 235, 255);
Nathub["13"]["BackgroundTransparency"] = 1;
Nathub["13"]["Size"] = UDim2.new(0, 400, 0, 30);
Nathub["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["13"]["Text"] = [[━━━━━━━━━ UI Settings ━━━━━━━━━]];
Nathub["13"]["Name"] = [[Section]];


-- StarterGui.NathubLibrary.Holder.One.Container.Section.UIGradient
Nathub["14"] = Instance.new("UIGradient", Nathub["13"]);
Nathub["14"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.420, Color3.fromRGB(31, 207, 255)),ColorSequenceKeypoint.new(0.721, Color3.fromRGB(4, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};


-- StarterGui.NathubLibrary.Holder.One.Container.Checkbox
Nathub["15"] = Instance.new("Frame", Nathub["11"]);
Nathub["15"]["BorderSizePixel"] = 0;
Nathub["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["15"]["Size"] = UDim2.new(0, 400, 0, 30);
Nathub["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["15"]["Name"] = [[Checkbox]];
Nathub["15"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Holder.One.Container.Checkbox.Title
Nathub["16"] = Instance.new("TextLabel", Nathub["15"]);
Nathub["16"]["BorderSizePixel"] = 0;
Nathub["16"]["TextSize"] = 14;
Nathub["16"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Nathub["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["16"]["BackgroundTransparency"] = 1;
Nathub["16"]["Size"] = UDim2.new(0, 186, 0, 30);
Nathub["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["16"]["Text"] = [[Checkbox]];
Nathub["16"]["Name"] = [[Title]];
Nathub["16"]["Position"] = UDim2.new(0.16, 0, 0, 0);


-- StarterGui.NathubLibrary.Holder.One.Container.Checkbox.Checkbox
Nathub["17"] = Instance.new("Frame", Nathub["15"]);
Nathub["17"]["BorderSizePixel"] = 0;
Nathub["17"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
Nathub["17"]["Size"] = UDim2.new(0, 20, 0, 20);
Nathub["17"]["Position"] = UDim2.new(0.805, 0, 0.16667, 0);
Nathub["17"]["BorderColor3"] = Color3.fromRGB(71, 71, 71);
Nathub["17"]["Name"] = [[Checkbox]];


-- StarterGui.NathubLibrary.Holder.One.Container.Checkbox.Checkbox.Trigger
Nathub["18"] = Instance.new("ImageButton", Nathub["17"]);
Nathub["18"]["BorderSizePixel"] = 0;
Nathub["18"]["ImageTransparency"] = 1;
Nathub["18"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Nathub["18"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
Nathub["18"]["Size"] = UDim2.new(0, 20, 0, 20);
Nathub["18"]["BackgroundTransparency"] = 1;
Nathub["18"]["Name"] = [[Trigger]];
Nathub["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.NathubLibrary.Holder.One.Container.Checkbox.Checkbox.Check
Nathub["19"] = Instance.new("ImageLabel", Nathub["17"]);
Nathub["19"]["BorderSizePixel"] = 0;
Nathub["19"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Nathub["19"]["Image"] = [[rbxassetid://10709790644]];
Nathub["19"]["Visible"] = false;
Nathub["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["19"]["BackgroundTransparency"] = 1;
Nathub["19"]["Name"] = [[Check]];


-- StarterGui.NathubLibrary.Holder.One.Container.Checkbox.Checkbox.Check.UICorner
Nathub["1a"] = Instance.new("UICorner", Nathub["19"]);
Nathub["1a"]["CornerRadius"] = UDim.new(0, 3);


-- StarterGui.NathubLibrary.Holder.One.Container.Checkbox.Checkbox.UICorner
Nathub["1b"] = Instance.new("UICorner", Nathub["17"]);
Nathub["1b"]["CornerRadius"] = UDim.new(0, 3);


-- StarterGui.NathubLibrary.Holder.One.Container.Button
Nathub["1c"] = Instance.new("Frame", Nathub["11"]);
Nathub["1c"]["BorderSizePixel"] = 0;
Nathub["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["1c"]["Size"] = UDim2.new(0, 400, 0, 30);
Nathub["1c"]["Position"] = UDim2.new(0, 0, 0.51502, 0);
Nathub["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["1c"]["Name"] = [[Button]];
Nathub["1c"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Holder.One.Container.Button.Title
Nathub["1d"] = Instance.new("TextLabel", Nathub["1c"]);
Nathub["1d"]["BorderSizePixel"] = 0;
Nathub["1d"]["TextSize"] = 14;
Nathub["1d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Nathub["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["1d"]["BackgroundTransparency"] = 1;
Nathub["1d"]["Size"] = UDim2.new(0, 186, 0, 30);
Nathub["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["1d"]["Text"] = [[Button]];
Nathub["1d"]["Name"] = [[Title]];
Nathub["1d"]["Position"] = UDim2.new(0.16, 0, 0, 0);


-- StarterGui.NathubLibrary.Holder.One.Container.Button.Button
Nathub["1e"] = Instance.new("ImageButton", Nathub["1c"]);
Nathub["1e"]["BorderSizePixel"] = 0;
Nathub["1e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
Nathub["1e"]["Image"] = [[rbxassetid://10734898355]];
Nathub["1e"]["Size"] = UDim2.new(0, 20, 0, 20);
Nathub["1e"]["BackgroundTransparency"] = 1;
Nathub["1e"]["Name"] = [[Button]];
Nathub["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["1e"]["Position"] = UDim2.new(0.805, 0, 0.13367, 0);


-- StarterGui.NathubLibrary.Holder.One.Container.Paragraph
Nathub["1f"] = Instance.new("Frame", Nathub["11"]);
Nathub["1f"]["BorderSizePixel"] = 0;
Nathub["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["1f"]["Size"] = UDim2.new(0, 400, 0, 45);
Nathub["1f"]["Position"] = UDim2.new(0, 0, 0.38627, 0);
Nathub["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["1f"]["Name"] = [[Paragraph]];
Nathub["1f"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Holder.One.Container.Paragraph.Title
Nathub["20"] = Instance.new("TextLabel", Nathub["1f"]);
Nathub["20"]["BorderSizePixel"] = 0;
Nathub["20"]["TextSize"] = 14;
Nathub["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Nathub["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["20"]["BackgroundTransparency"] = 1;
Nathub["20"]["Size"] = UDim2.new(0, 186, 0, 30);
Nathub["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["20"]["Text"] = [[Paragraph]];
Nathub["20"]["Name"] = [[Title]];
Nathub["20"]["Position"] = UDim2.new(0.16, 0, 0, 0);


-- StarterGui.NathubLibrary.Holder.One.Container.Paragraph.Desc
Nathub["21"] = Instance.new("TextLabel", Nathub["1f"]);
Nathub["21"]["TextWrapped"] = true;
Nathub["21"]["BorderSizePixel"] = 0;
Nathub["21"]["TextSize"] = 12;
Nathub["21"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Nathub["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["21"]["TextColor3"] = Color3.fromRGB(86, 86, 86);
Nathub["21"]["BackgroundTransparency"] = 1;
Nathub["21"]["RichText"] = true;
Nathub["21"]["Size"] = UDim2.new(0, 278, 0, 20);
Nathub["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["21"]["Text"] = [[Description]];
Nathub["21"]["Name"] = [[Desc]];
Nathub["21"]["Position"] = UDim2.new(0.16, 0, 0.55, 0);


-- StarterGui.NathubLibrary.Holder.One.Container.Paragraph.Desc.UIPadding
Nathub["22"] = Instance.new("UIPadding", Nathub["21"]);
Nathub["22"]["PaddingBottom"] = UDim.new(0, 12);


-- StarterGui.NathubLibrary.Holder.One.Container.Toggle
Nathub["23"] = Instance.new("Frame", Nathub["11"]);
Nathub["23"]["BorderSizePixel"] = 0;
Nathub["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["23"]["Size"] = UDim2.new(0, 400, 0, 30);
Nathub["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["23"]["Name"] = [[Toggle]];
Nathub["23"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Holder.One.Container.Toggle.Title
Nathub["24"] = Instance.new("TextLabel", Nathub["23"]);
Nathub["24"]["BorderSizePixel"] = 0;
Nathub["24"]["TextSize"] = 14;
Nathub["24"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Nathub["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["24"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["24"]["BackgroundTransparency"] = 1;
Nathub["24"]["Size"] = UDim2.new(0, 186, 0, 30);
Nathub["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["24"]["Text"] = [[Toggle]];
Nathub["24"]["Name"] = [[Title]];
Nathub["24"]["Position"] = UDim2.new(0.16, 0, 0, 0);


-- StarterGui.NathubLibrary.Holder.One.Container.Toggle.Element
Nathub["25"] = Instance.new("ImageButton", Nathub["23"]);
Nathub["25"]["SliceCenter"] = Rect.new(18, 18, 18, 18);
Nathub["25"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["25"]["ImageTransparency"] = 0.3;
Nathub["25"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["25"]["Image"] = [[rbxasset://textures/ui/ImageSet/InGameMenu/img_set_1x_1.png]];
Nathub["25"]["ImageRectSize"] = Vector2.new(36, 36);
Nathub["25"]["Size"] = UDim2.new(0, 30, 0, 14);
Nathub["25"]["BackgroundTransparency"] = 1;
Nathub["25"]["Name"] = [[Element]];
Nathub["25"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
Nathub["25"]["ImageRectOffset"] = Vector2.new(287, 0);
Nathub["25"]["Position"] = UDim2.new(0.805, 0, 0.5, 0);
-- Attributes
Nathub["25"]:SetAttribute([[state]], false);


-- StarterGui.NathubLibrary.Holder.One.Container.Toggle.Element.Knob
Nathub["26"] = Instance.new("ImageLabel", Nathub["25"]);
Nathub["26"]["ZIndex"] = 2;
Nathub["26"]["AnchorPoint"] = Vector2.new(0, 0.5);
Nathub["26"]["Image"] = [[rbxasset://textures/ui/ImageSet/InGameMenu/img_set_1x_1.png]];
Nathub["26"]["ImageRectSize"] = Vector2.new(42, 42);
Nathub["26"]["Size"] = UDim2.new(0, 20, 0, 20);
Nathub["26"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
Nathub["26"]["BackgroundTransparency"] = 1;
Nathub["26"]["ImageRectOffset"] = Vector2.new(0, 208);
Nathub["26"]["Name"] = [[Knob]];
Nathub["26"]["Position"] = UDim2.new(1.77949, -39, 0.5, 0);


-- StarterGui.NathubLibrary.Holder.One.Container.Toggle.Element.Fill
Nathub["27"] = Instance.new("ImageLabel", Nathub["25"]);
Nathub["27"]["SliceCenter"] = Rect.new(18, 18, 18, 18);
Nathub["27"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["27"]["ImageColor3"] = Color3.fromRGB(0, 214, 218);
Nathub["27"]["Image"] = [[rbxasset://textures/ui/ImageSet/InGameMenu/img_set_1x_1.png]];
Nathub["27"]["ImageRectSize"] = Vector2.new(36, 36);
Nathub["27"]["Size"] = UDim2.new(1, 0, 1, 0);
Nathub["27"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
Nathub["27"]["BackgroundTransparency"] = 1;
Nathub["27"]["ImageRectOffset"] = Vector2.new(324, 0);
Nathub["27"]["Name"] = [[Fill]];


-- StarterGui.NathubLibrary.Holder.One.Container.Toggle.Element.LocalScript
Nathub["28"] = Instance.new("LocalScript", Nathub["25"]);



-- StarterGui.NathubLibrary.Holder.UIAspectRatioConstraint
Nathub["29"] = Instance.new("UIAspectRatioConstraint", Nathub["2"]);
Nathub["29"]["AspectRatio"] = 1.48148;


-- StarterGui.NathubLibrary.OpenButton
Nathub["2a"] = Instance.new("Frame", Nathub["1"]);
Nathub["2a"]["Visible"] = false;
Nathub["2a"]["BorderSizePixel"] = 0;
Nathub["2a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
Nathub["2a"]["Position"] = UDim2.new(0.0927, 0, 0.63306, 0);
Nathub["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["2a"]["Name"] = [[OpenButton]];


-- StarterGui.NathubLibrary.OpenButton.shadowHolder
Nathub["2b"] = Instance.new("Frame", Nathub["2a"]);
Nathub["2b"]["ZIndex"] = 0;
Nathub["2b"]["Size"] = UDim2.new(1, 0, 1, 0);
Nathub["2b"]["Name"] = [[shadowHolder]];
Nathub["2b"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.OpenButton.shadowHolder.umbraShadow
Nathub["2c"] = Instance.new("ImageLabel", Nathub["2b"]);
Nathub["2c"]["ZIndex"] = 0;
Nathub["2c"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
Nathub["2c"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["2c"]["ImageTransparency"] = 0.86;
Nathub["2c"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["2c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["2c"]["Image"] = [[rbxassetid://1316045217]];
Nathub["2c"]["Size"] = UDim2.new(1, 3, 1, 3);
Nathub["2c"]["BackgroundTransparency"] = 1;
Nathub["2c"]["Name"] = [[umbraShadow]];
Nathub["2c"]["Position"] = UDim2.new(0.5, 0, 0.5, 3);


-- StarterGui.NathubLibrary.OpenButton.shadowHolder.penumbraShadow
Nathub["2d"] = Instance.new("ImageLabel", Nathub["2b"]);
Nathub["2d"]["ZIndex"] = 0;
Nathub["2d"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
Nathub["2d"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["2d"]["ImageTransparency"] = 0.88;
Nathub["2d"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["2d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["2d"]["Image"] = [[rbxassetid://1316045217]];
Nathub["2d"]["Size"] = UDim2.new(1, 3, 1, 3);
Nathub["2d"]["BackgroundTransparency"] = 1;
Nathub["2d"]["Name"] = [[penumbraShadow]];
Nathub["2d"]["Position"] = UDim2.new(0.5, 0, 0.5, 3);


-- StarterGui.NathubLibrary.OpenButton.shadowHolder.ambientShadow
Nathub["2e"] = Instance.new("ImageLabel", Nathub["2b"]);
Nathub["2e"]["ZIndex"] = 0;
Nathub["2e"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
Nathub["2e"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["2e"]["ImageTransparency"] = 0.88;
Nathub["2e"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["2e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["2e"]["Image"] = [[rbxassetid://1316045217]];
Nathub["2e"]["Size"] = UDim2.new(1, 3, 1, 3);
Nathub["2e"]["BackgroundTransparency"] = 1;
Nathub["2e"]["Name"] = [[ambientShadow]];
Nathub["2e"]["Position"] = UDim2.new(0.5, 0, 0.5, 3);


-- StarterGui.NathubLibrary.OpenButton.UICorner
Nathub["2f"] = Instance.new("UICorner", Nathub["2a"]);
Nathub["2f"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.NathubLibrary.OpenButton.Logo
Nathub["30"] = Instance.new("ImageLabel", Nathub["2a"]);
Nathub["30"]["BorderSizePixel"] = 0;
Nathub["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["30"]["Image"] = [[rbxassetid://99764942615873]];
Nathub["30"]["Size"] = UDim2.new(0, 40, 0, 40);
Nathub["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["30"]["BackgroundTransparency"] = 1;
Nathub["30"]["Name"] = [[Logo]];
Nathub["30"]["Position"] = UDim2.new(0, 0, 0.025, 0);


-- StarterGui.NathubLibrary.OpenButton.Title
Nathub["31"] = Instance.new("TextLabel", Nathub["2a"]);
Nathub["31"]["BorderSizePixel"] = 0;
Nathub["31"]["TextSize"] = 14;
Nathub["31"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Nathub["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["31"]["BackgroundTransparency"] = 1;
Nathub["31"]["Size"] = UDim2.new(0, 86, 0, 40);
Nathub["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["31"]["Text"] = [[Nathub]];
Nathub["31"]["Name"] = [[Title]];
Nathub["31"]["Position"] = UDim2.new(0.28571, 0, 0.025, 0);


-- StarterGui.NathubLibrary.OpenButton.Icon
Nathub["32"] = Instance.new("ImageLabel", Nathub["2a"]);
Nathub["32"]["BorderSizePixel"] = 0;
Nathub["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["32"]["Image"] = [[rbxassetid://10734895698]];
Nathub["32"]["Size"] = UDim2.new(0, 20, 0, 20);
Nathub["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["32"]["BackgroundTransparency"] = 1;
Nathub["32"]["Name"] = [[Icon]];
Nathub["32"]["Position"] = UDim2.new(0.80714, 0, 0.275, 0);


-- StarterGui.NathubLibrary.OpenButton.Trigger
Nathub["33"] = Instance.new("TextButton", Nathub["2a"]);
Nathub["33"]["BorderSizePixel"] = 0;
Nathub["33"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["33"]["TextSize"] = 14;
Nathub["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Nathub["33"]["Size"] = UDim2.new(0, 27, 0, 40);
Nathub["33"]["BackgroundTransparency"] = 1;
Nathub["33"]["Name"] = [[Trigger]];
Nathub["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["33"]["Text"] = [[]];
Nathub["33"]["Position"] = UDim2.new(0.80714, 0, 0, 0);


-- StarterGui.NathubLibrary.OpenButton.Trigger.LocalScript
Nathub["34"] = Instance.new("LocalScript", Nathub["33"]);



-- StarterGui.NathubLibrary.OpenButton.LocalScript
Nathub["35"] = Instance.new("LocalScript", Nathub["2a"]);



-- StarterGui.NathubLibrary.Dialog
Nathub["36"] = Instance.new("Frame", Nathub["1"]);
Nathub["36"]["Visible"] = false;
Nathub["36"]["BorderSizePixel"] = 0;
Nathub["36"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Nathub["36"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["36"]["Size"] = UDim2.new(0, 300, 0, 150);
Nathub["36"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
Nathub["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["36"]["Name"] = [[Dialog]];


-- StarterGui.NathubLibrary.Dialog.shadowHolder
Nathub["37"] = Instance.new("Frame", Nathub["36"]);
Nathub["37"]["ZIndex"] = 0;
Nathub["37"]["Size"] = UDim2.new(1, 0, 1, 0);
Nathub["37"]["Name"] = [[shadowHolder]];
Nathub["37"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Dialog.shadowHolder.umbraShadow
Nathub["38"] = Instance.new("ImageLabel", Nathub["37"]);
Nathub["38"]["ZIndex"] = 0;
Nathub["38"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
Nathub["38"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["38"]["ImageTransparency"] = 0.86;
Nathub["38"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["38"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["38"]["Image"] = [[rbxassetid://1316045217]];
Nathub["38"]["Size"] = UDim2.new(1, 24, 1, 24);
Nathub["38"]["BackgroundTransparency"] = 1;
Nathub["38"]["Name"] = [[umbraShadow]];
Nathub["38"]["Position"] = UDim2.new(0.5, 0, 0.4, 16);


-- StarterGui.NathubLibrary.Dialog.shadowHolder.penumbraShadow
Nathub["39"] = Instance.new("ImageLabel", Nathub["37"]);
Nathub["39"]["ZIndex"] = 0;
Nathub["39"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
Nathub["39"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["39"]["ImageTransparency"] = 0.88;
Nathub["39"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["39"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["39"]["Image"] = [[rbxassetid://1316045217]];
Nathub["39"]["Size"] = UDim2.new(1, 24, 1, 24);
Nathub["39"]["BackgroundTransparency"] = 1;
Nathub["39"]["Name"] = [[penumbraShadow]];
Nathub["39"]["Position"] = UDim2.new(0.5, 0, 0.39333, 16);


-- StarterGui.NathubLibrary.Dialog.shadowHolder.ambientShadow
Nathub["3a"] = Instance.new("ImageLabel", Nathub["37"]);
Nathub["3a"]["ZIndex"] = 0;
Nathub["3a"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
Nathub["3a"]["ScaleType"] = Enum.ScaleType.Slice;
Nathub["3a"]["ImageTransparency"] = 0.88;
Nathub["3a"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["3a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["3a"]["Image"] = [[rbxassetid://1316045217]];
Nathub["3a"]["Size"] = UDim2.new(1, 24, 1, 24);
Nathub["3a"]["BackgroundTransparency"] = 1;
Nathub["3a"]["Name"] = [[ambientShadow]];
Nathub["3a"]["Position"] = UDim2.new(0.5, 0, 0.32, 16);


-- StarterGui.NathubLibrary.Dialog.Title
Nathub["3b"] = Instance.new("TextLabel", Nathub["36"]);
Nathub["3b"]["BorderSizePixel"] = 0;
Nathub["3b"]["TextSize"] = 17;
Nathub["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["3b"]["TextColor3"] = Color3.fromRGB(251, 251, 251);
Nathub["3b"]["BackgroundTransparency"] = 1;
Nathub["3b"]["Size"] = UDim2.new(0, 200, 0, 25);
Nathub["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["3b"]["Text"] = [[Are You Sure?]];
Nathub["3b"]["Name"] = [[Title]];
Nathub["3b"]["Position"] = UDim2.new(0.16667, 0, 0, 0);


-- StarterGui.NathubLibrary.Dialog.UICorner
Nathub["3c"] = Instance.new("UICorner", Nathub["36"]);



-- StarterGui.NathubLibrary.Dialog.Desc
Nathub["3d"] = Instance.new("TextLabel", Nathub["36"]);
Nathub["3d"]["TextWrapped"] = true;
Nathub["3d"]["BorderSizePixel"] = 0;
Nathub["3d"]["TextSize"] = 12;
Nathub["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["3d"]["TextColor3"] = Color3.fromRGB(71, 71, 71);
Nathub["3d"]["BackgroundTransparency"] = 1;
Nathub["3d"]["RichText"] = true;
Nathub["3d"]["Size"] = UDim2.new(0, 200, 0, 25);
Nathub["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["3d"]["Text"] = [[If you press Yes, then the GUI will disappear]];
Nathub["3d"]["Name"] = [[Desc]];
Nathub["3d"]["Position"] = UDim2.new(0.16667, 0, 0.16667, 0);


-- StarterGui.NathubLibrary.Dialog.No
Nathub["3e"] = Instance.new("TextButton", Nathub["36"]);
Nathub["3e"]["BorderSizePixel"] = 0;
Nathub["3e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["3e"]["TextSize"] = 14;
Nathub["3e"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Nathub["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["3e"]["Size"] = UDim2.new(0, 50, 0, 50);
Nathub["3e"]["BackgroundTransparency"] = 1;
Nathub["3e"]["Name"] = [[No]];
Nathub["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["3e"]["Text"] = [[NO]];
Nathub["3e"]["Position"] = UDim2.new(0.66667, 0, 0.56, 0);


-- StarterGui.NathubLibrary.Dialog.No.LocalScript
Nathub["3f"] = Instance.new("LocalScript", Nathub["3e"]);



-- StarterGui.NathubLibrary.Dialog.Yes
Nathub["40"] = Instance.new("TextButton", Nathub["36"]);
Nathub["40"]["BorderSizePixel"] = 0;
Nathub["40"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["40"]["TextSize"] = 14;
Nathub["40"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Nathub["40"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["40"]["Size"] = UDim2.new(0, 50, 0, 50);
Nathub["40"]["BackgroundTransparency"] = 1;
Nathub["40"]["Name"] = [[Yes]];
Nathub["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["40"]["Text"] = [[YES]];
Nathub["40"]["Position"] = UDim2.new(0.16667, 0, 0.56, 0);


-- StarterGui.NathubLibrary.Dialog.Yes.LocalScript
Nathub["41"] = Instance.new("LocalScript", Nathub["40"]);



-- StarterGui.NathubLibrary.Notification
Nathub["42"] = Instance.new("CanvasGroup", Nathub["1"]);
Nathub["42"]["BorderSizePixel"] = 0;
Nathub["42"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
Nathub["42"]["AutomaticSize"] = Enum.AutomaticSize.Y;
Nathub["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["42"]["Name"] = [[Notification]];


-- StarterGui.NathubLibrary.Notification.Frame
Nathub["43"] = Instance.new("Frame", Nathub["42"]);
Nathub["43"]["ZIndex"] = 2;
Nathub["43"]["BorderSizePixel"] = 0;
Nathub["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["43"]["AutomaticSize"] = Enum.AutomaticSize.Y;
Nathub["43"]["Size"] = UDim2.new(1, -25, 1, 0);
Nathub["43"]["Position"] = UDim2.new(0, 15, 0, 0);
Nathub["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["43"]["BackgroundTransparency"] = 1;


-- StarterGui.NathubLibrary.Notification.Frame.UIListLayout
Nathub["44"] = Instance.new("UIListLayout", Nathub["43"]);
Nathub["44"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
Nathub["44"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.NathubLibrary.Notification.Frame.UIPadding
Nathub["45"] = Instance.new("UIPadding", Nathub["43"]);
Nathub["45"]["PaddingTop"] = UDim.new(0, 16);
Nathub["45"]["PaddingBottom"] = UDim.new(0, 16);


-- StarterGui.NathubLibrary.Notification.Frame.Title
Nathub["46"] = Instance.new("TextLabel", Nathub["43"]);
Nathub["46"]["TextWrapped"] = true;
Nathub["46"]["ZIndex"] = 2;
Nathub["46"]["BorderSizePixel"] = 0;
Nathub["46"]["TextSize"] = 16;
Nathub["46"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Nathub["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["46"]["FontFace"] = Font.new([[rbxassetid://12187365364]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Nathub["46"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["46"]["BackgroundTransparency"] = 1;
Nathub["46"]["RichText"] = true;
Nathub["46"]["AnchorPoint"] = Vector2.new(0.5, 0);
Nathub["46"]["Size"] = UDim2.new(1, 0, 0, 10);
Nathub["46"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
Nathub["46"]["Text"] = [[Title]];
Nathub["46"]["AutomaticSize"] = Enum.AutomaticSize.Y;
Nathub["46"]["Name"] = [[Title]];
Nathub["46"]["Position"] = UDim2.new(0.13793, 0, -1.19565, 15);


-- StarterGui.NathubLibrary.Notification.Frame.Description
Nathub["47"] = Instance.new("TextLabel", Nathub["43"]);
Nathub["47"]["TextWrapped"] = true;
Nathub["47"]["ZIndex"] = 2;
Nathub["47"]["BorderSizePixel"] = 0;
Nathub["47"]["TextSize"] = 14;
Nathub["47"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Nathub["47"]["TextTransparency"] = 0.15;
Nathub["47"]["TextYAlignment"] = Enum.TextYAlignment.Top;
Nathub["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["47"]["FontFace"] = Font.new([[rbxassetid://12187365364]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
Nathub["47"]["TextColor3"] = Color3.fromRGB(121, 121, 121);
Nathub["47"]["BackgroundTransparency"] = 1;
Nathub["47"]["RichText"] = true;
Nathub["47"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["47"]["Size"] = UDim2.new(1, 0, 0, 5);
Nathub["47"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
Nathub["47"]["Text"] = [[Description]];
Nathub["47"]["AutomaticSize"] = Enum.AutomaticSize.Y;
Nathub["47"]["Name"] = [[Description]];
Nathub["47"]["Position"] = UDim2.new(0.55172, 0, -0.34783, 7);


-- StarterGui.NathubLibrary.Notification.Interact
Nathub["48"] = Instance.new("TextButton", Nathub["42"]);
Nathub["48"]["BorderSizePixel"] = 0;
Nathub["48"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["48"]["TextSize"] = 14;
Nathub["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Nathub["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Nathub["48"]["ZIndex"] = 5;
Nathub["48"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Nathub["48"]["Size"] = UDim2.new(1, 0, 1, 0);
Nathub["48"]["BackgroundTransparency"] = 1;
Nathub["48"]["Name"] = [[Interact]];
Nathub["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["48"]["Text"] = [[]];
Nathub["48"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.NathubLibrary.Notification.Shadow
Nathub["49"] = Instance.new("UIStroke", Nathub["42"]);
Nathub["49"]["Transparency"] = 1;
Nathub["49"]["Name"] = [[Shadow]];
Nathub["49"]["Thickness"] = 1.2;
Nathub["49"]["Color"] = Color3.fromRGB(86, 86, 86);


-- StarterGui.NathubLibrary.Notification.UICorner
Nathub["4a"] = Instance.new("UICorner", Nathub["42"]);
Nathub["4a"]["CornerRadius"] = UDim.new(0, 12);


-- StarterGui.NathubLibrary.Notification.Timer
Nathub["4b"] = Instance.new("Frame", Nathub["42"]);
Nathub["4b"]["ZIndex"] = 2;
Nathub["4b"]["BorderSizePixel"] = 0;
Nathub["4b"]["BackgroundColor3"] = Color3.fromRGB(111, 159, 247);
Nathub["4b"]["Size"] = UDim2.new(1, 0, 0, 2);
Nathub["4b"]["Position"] = UDim2.new(0, 0, 1, -2);
Nathub["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Nathub["4b"]["Name"] = [[Timer]];


-- StarterGui.NathubLibrary.Notification.Timer.Outline
Nathub["4c"] = Instance.new("UIStroke", Nathub["4b"]);
Nathub["4c"]["Name"] = [[Outline]];
Nathub["4c"]["Thickness"] = 2;
Nathub["4c"]["Color"] = Color3.fromRGB(171, 219, 357);


-- StarterGui.NathubLibrary.Notification.Timer.UICorner
Nathub["4d"] = Instance.new("UICorner", Nathub["4b"]);



-- StarterGui.NathubLibrary.Notification.AspectRatio
Nathub["4e"] = Instance.new("UIAspectRatioConstraint", Nathub["42"]);
Nathub["4e"]["AspectRatio"] = 2.55128;
Nathub["4e"]["Name"] = [[AspectRatio]];


-- StarterGui.NathubLibrary.Holder.Topbar.Minimize.LocalScript
local function C_b()
local script = Nathub["b"];
	local holder = script.Parent.Parent.Parent.Parent.Holder
	local ms = script.Parent
	local openbutton = script.Parent.Parent.Parent.Parent.OpenButton
	local TweenService = game:GetService("TweenService")
	local UIS = game:GetService("UserInputService")
	
	ms.MouseButton1Click:Connect(function()
		local dropTween = TweenService:Create(openbutton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 140,0, 40
			)
		})
	
		local grownTween = TweenService:Create(holder, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0
			)
		})
	
		grownTween:Play()
		dropTween:Play()
		holder.Visible = false
		openbutton.Visible = true
	end)
end;
task.spawn(C_b);
-- StarterGui.NathubLibrary.Holder.Topbar.LocalScript
local function C_c()
local script = Nathub["c"];
	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent.Parent.Parent.Holder
	local topbar = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	topbar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	topbar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end;
task.spawn(C_c);
-- StarterGui.NathubLibrary.OpenButton.Trigger.LocalScript
local function C_34()
local script = Nathub["34"];
	local holder = script.Parent.Parent.Parent.Holder
	local ms = script.Parent
	local openbutton = script.Parent.Parent
	local TweenService = game:GetService("TweenService")
	local UIS = game:GetService("UserInputService")
	
	ms.MouseButton1Click:Connect(function()
		local dropTween = TweenService:Create(openbutton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 0, 0, 0
			)
		})
		
		local grownTween = TweenService:Create(holder, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 400,0, 270
			)
		})
		
		grownTween:Play()
			dropTween:Play()
			holder.Visible = true
			openbutton.Visible = false
		end)
end;
task.spawn(C_34);
-- StarterGui.NathubLibrary.OpenButton.LocalScript
local function C_35()
local script = Nathub["35"];
	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end;
task.spawn(C_35);

local function TweenCustom(obj, Tweeninfo , Prop)
	local TweenService = game:GetService("TweenService")
	local Tween = TweenService:Create(
		obj,
		Tweeninfo,
		Prop
	)
	Tween:Play()
	return Tween
end


local LIB = {};
local GUI = script.Parent
local sulf = {}
GUI.Enabled = true 
GUI.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))

function LIB:Notify(tbl)
	local Title = tbl.Title
	local Desc = tbl.Desc
	local Duration = tbl.Duration
	
	local Notification = GUI.NathubLibrary.Notification
	
	Notification.Name = Title
	Notification.Frame.Title = Title
	Notification.Frame.Description = Desc
	
	Notification.Visible = true
	
	local ror = TweenService:Create(Notification, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 199,0, 77
		)
	})
	ror:Play()
	
	wait(Duration)
	local uror = TweenService:Create(Notification["37"], TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(0
		)
	})
	uror:Play()
	Notification.Visible = false
end

function LIB:CreateWindow(tbl)
	local self = {}
	local Title = tbl.Title
	local Icon = tbl.Icon
	
	local newGui = GUI:Clone()
	local guiparent = newGui.NathubLibrary
	local Holder = guiparent.Holder
	local Func = Holder.One.Container
	local Topbar = Holder.Topbar
	
	newGui.Name = Title
	newGui.Enabled = true
	
	Topbar.Hub.Text = Title
	Topbar.IconHub = Icon
	
function sulf:AddSection(tbl)
	Title = tbl.Title
	local newSection = Func.Section:Clone()
	
	newSection.Name = Title	
	newSection.Text = Title
	newSection.Visible = true
end

function sulf:AddParagraph(tbl)
	Title = tbl.Title
local Description = tbl.Description

local newParagraph = Func.Paragraph:Clone()
	newParagraph.Name = Title
	newParagraph.Text = Title
	newParagraph.Desc = Description
	newParagraph.Visible = true
end
function sulf:AddToggle(tbl)
	Title = tbl.Title
	local Callback = tbl.Callback
	if not Callback then
		Callback = function() end
	end
	
	local newToggle = Func.Toggle:Clone()
	newToggle.Name = Title
	newToggle.Title.Text = Title
	newToggle.Visible = true
		local ts,ti = game.TweenService,TweenInfo.new(.5,Enum.EasingStyle.Quint)

		local on1,on2,off1,off2 = ts:Create(newToggle.Element.Fill,ti,{ImageTransparency=0}), ts:Create(newToggle.Element.Knob,ti,{Position=UDim2.new(1.779, -39,0.5, 0)}),ts:Create(newToggle.Element.Fill,ti,{ImageTransparency=1}), ts:Create(newToggle.Element.Knob,ti,{Position=UDim2.new(1.113, -39,0.5, 0)})

		local state = script.Parent:GetAttribute("state")

		if state then
			on1:Play()
			on2:Play()
		else
			off1:Play()
			off2:Play()
		end
	newToggle.Element.MouseButton1Click:Connect(function()
				state = script.Parent:GetAttribute("state")

					if state then
						script.Parent:SetAttribute("state",false)
						off1:Play()
						off2:Play()
						pcall(Callback)
					else
						script.Parent:SetAttribute("state",true)
						on1:Play()
						on2:Play()
						pcall(Callback)
					end
	end)
end

function sulf:AddButtton(tbl)
Title = tbl.Title 
local Callback = tbl.Callback

local newButton = Func.Button:Clone()
newButton.Name = Title
newButton.Title.Text = Title
newButton.Visible = true

newButton.Button.MouseButton1Click:Connect(function()
	pcall(Callback)
end)
end	
return LIB
end

local assets = {
	["accessibility"] = "rbxassetid://10709751939",
	["activity"] = "rbxassetid://10709752035",
	["air-vent"] = "rbxassetid://10709752131",
	["airplay"] = "rbxassetid://10709752254",
	["alarm-check"] = "rbxassetid://10709752405",
	["alarm-clock"] = "rbxassetid://10709752630",
	["alarm-clock-off"] = "rbxassetid://10709752508",
	["alarm-minus"] = "rbxassetid://10709752732",
	["alarm-plus"] = "rbxassetid://10709752825",
	["album"] = "rbxassetid://10709752906",
	["alert-circle"] = "rbxassetid://10709752996",
	["alert-octagon"] = "rbxassetid://10709753064",
	["alert-triangle"] = "rbxassetid://10709753149",
	["align-center"] = "rbxassetid://10709753570",
	["align-center-horizontal"] = "rbxassetid://10709753272",
	["align-center-vertical"] = "rbxassetid://10709753421",
	["align-end-horizontal"] = "rbxassetid://10709753692",
	["align-end-vertical"] = "rbxassetid://10709753808",
	["align-horizontal-distribute-center"] = "rbxassetid://10747779791",
	["align-horizontal-distribute-end"] = "rbxassetid://10747784534",
	["align-horizontal-distribute-start"] = "rbxassetid://10709754118",
	["align-horizontal-justify-center"] = "rbxassetid://10709754204",
	["align-horizontal-justify-end"] = "rbxassetid://10709754317",
	["align-horizontal-justify-start"] = "rbxassetid://10709754436",
	["align-horizontal-space-around"] = "rbxassetid://10709754590",
	["align-horizontal-space-between"] = "rbxassetid://10709754749",
	["align-justify"] = "rbxassetid://10709759610",
	["align-left"] = "rbxassetid://10709759764",
	["align-right"] = "rbxassetid://10709759895",
	["align-start-horizontal"] = "rbxassetid://10709760051",
	["align-start-vertical"] = "rbxassetid://10709760244",
	["align-vertical-distribute-center"] = "rbxassetid://10709760351",
	["align-vertical-distribute-end"] = "rbxassetid://10709760434",
	["align-vertical-distribute-start"] = "rbxassetid://10709760612",
	["align-vertical-justify-center"] = "rbxassetid://10709760814",
	["align-vertical-justify-end"] = "rbxassetid://10709761003",
	["align-vertical-justify-start"] = "rbxassetid://10709761176",
	["align-vertical-space-around"] = "rbxassetid://10709761324",
	["align-vertical-space-between"] = "rbxassetid://10709761434",
	["anchor"] = "rbxassetid://10709761530",
	["angry"] = "rbxassetid://10709761629",
	["annoyed"] = "rbxassetid://10709761722",
	["aperture"] = "rbxassetid://10709761813",
	["apple"] = "rbxassetid://10709761889",
	["archive"] = "rbxassetid://10709762233",
	["archive-restore"] = "rbxassetid://10709762058",
	["armchair"] = "rbxassetid://10709762327",
	["arrow-big-down"] = "rbxassetid://10747796644",
	["arrow-big-left"] = "rbxassetid://10709762574",
	["arrow-big-right"] = "rbxassetid://10709762727",
	["arrow-big-up"] = "rbxassetid://10709762879",
	["arrow-down"] = "rbxassetid://10709767827",
	["arrow-down-circle"] = "rbxassetid://10709763034",
	["arrow-down-left"] = "rbxassetid://10709767656",
	["arrow-down-right"] = "rbxassetid://10709767750",
	["arrow-left"] = "rbxassetid://10709768114",
	["arrow-left-circle"] = "rbxassetid://10709767936",
	["arrow-left-right"] = "rbxassetid://10709768019",
	["arrow-right"] = "rbxassetid://10709768347",
	["arrow-right-circle"] = "rbxassetid://10709768226",
	["arrow-up"] = "rbxassetid://10709768939",
	["arrow-up-circle"] = "rbxassetid://10709768432",
	["arrow-up-down"] = "rbxassetid://10709768538",
	["arrow-up-left"] = "rbxassetid://10709768661",
	["arrow-up-right"] = "rbxassetid://10709768787",
	["asterisk"] = "rbxassetid://10709769095",
	["at-sign"] = "rbxassetid://10709769286",
	["award"] = "rbxassetid://10709769406",
	["axe"] = "rbxassetid://10709769508",
	["axis-3d"] = "rbxassetid://10709769598",
	["baby"] = "rbxassetid://10709769732",
	["backpack"] = "rbxassetid://10709769841",
	["baggage-claim"] = "rbxassetid://10709769935",
	["banana"] = "rbxassetid://10709770005",
	["banknote"] = "rbxassetid://10709770178",
	["bar-chart"] = "rbxassetid://10709773755",
	["bar-chart-2"] = "rbxassetid://10709770317",
	["bar-chart-3"] = "rbxassetid://10709770431",
	["bar-chart-4"] = "rbxassetid://10709770560",
	["bar-chart-horizontal"] = "rbxassetid://10709773669",
	["barcode"] = "rbxassetid://10747360675",
	["baseline"] = "rbxassetid://10709773863",
	["bath"] = "rbxassetid://10709773963",
	["battery"] = "rbxassetid://10709774640",
	["battery-charging"] = "rbxassetid://10709774068",
	["battery-full"] = "rbxassetid://10709774206",
	["battery-low"] = "rbxassetid://10709774370",
	["battery-medium"] = "rbxassetid://10709774513",
	["beaker"] = "rbxassetid://10709774756",
	["bed"] = "rbxassetid://10709775036",
	["bed-double"] = "rbxassetid://10709774864",
	["bed-single"] = "rbxassetid://10709774968",
	["beer"] = "rbxassetid://10709775167",
	["bell"] = "rbxassetid://10709775704",
	["bell-minus"] = "rbxassetid://10709775241",
	["bell-off"] = "rbxassetid://10709775320",
	["bell-plus"] = "rbxassetid://10709775448",
	["bell-ring"] = "rbxassetid://10709775560",
	["bike"] = "rbxassetid://10709775894",
	["binary"] = "rbxassetid://10709776050",
	["bitcoin"] = "rbxassetid://10709776126",
	["bluetooth"] = "rbxassetid://10709776655",
	["bluetooth-connected"] = "rbxassetid://10709776240",
	["bluetooth-off"] = "rbxassetid://10709776344",
	["bluetooth-searching"] = "rbxassetid://10709776501",
	["bold"] = "rbxassetid://10747813908",
	["bomb"] = "rbxassetid://10709781460",
	["bone"] = "rbxassetid://10709781605",
	["book"] = "rbxassetid://10709781824",
	["book-open"] = "rbxassetid://10709781717",
	["bookmark"] = "rbxassetid://10709782154",
	["bookmark-minus"] = "rbxassetid://10709781919",
	["bookmark-plus"] = "rbxassetid://10709782044",
	["bot"] = "rbxassetid://10709782230",
	["box"] = "rbxassetid://10709782497",
	["box-select"] = "rbxassetid://10709782342",
	["boxes"] = "rbxassetid://10709782582",
	["briefcase"] = "rbxassetid://10709782662",
	["brush"] = "rbxassetid://10709782758",
	["bug"] = "rbxassetid://10709782845",
	["building"] = "rbxassetid://10709783051",
	["building-2"] = "rbxassetid://10709782939",
	["bus"] = "rbxassetid://10709783137",
	["cake"] = "rbxassetid://10709783217",
	["calculator"] = "rbxassetid://10709783311",
	["calendar"] = "rbxassetid://10709789505",
	["calendar-check"] = "rbxassetid://10709783474",
	["calendar-check-2"] = "rbxassetid://10709783392",
	["calendar-clock"] = "rbxassetid://10709783577",
	["calendar-days"] = "rbxassetid://10709783673",
	["calendar-heart"] = "rbxassetid://10709783835",
	["calendar-minus"] = "rbxassetid://10709783959",
	["calendar-off"] = "rbxassetid://10709788784",
	["calendar-plus"] = "rbxassetid://10709788937",
	["calendar-range"] = "rbxassetid://10709789053",
	["calendar-search"] = "rbxassetid://10709789200",
	["calendar-x"] = "rbxassetid://10709789407",
	["calendar-x-2"] = "rbxassetid://10709789329",
	["camera"] = "rbxassetid://10709789686",
	["camera-off"] = "rbxassetid://10747822677",
	["car"] = "rbxassetid://10709789810",
	["carrot"] = "rbxassetid://10709789960",
	["cast"] = "rbxassetid://10709790097",
	["charge"] = "rbxassetid://10709790202",
	["check"] = "rbxassetid://10709790644",
	["check-circle"] = "rbxassetid://10709790387",
	["check-circle-2"] = "rbxassetid://10709790298",
	["check-square"] = "rbxassetid://10709790537",
	["chef-hat"] = "rbxassetid://10709790757",
	["cherry"] = "rbxassetid://10709790875",
	["chevron-down"] = "rbxassetid://10709790948",
	["chevron-first"] = "rbxassetid://10709791015",
	["chevron-last"] = "rbxassetid://10709791130",
	["chevron-left"] = "rbxassetid://10709791281",
	["chevron-right"] = "rbxassetid://10709791437",
	["chevron-up"] = "rbxassetid://10709791523",
	["chevrons-down"] = "rbxassetid://10709796864",
	["chevrons-down-up"] = "rbxassetid://10709791632",
	["chevrons-left"] = "rbxassetid://10709797151",
	["chevrons-left-right"] = "rbxassetid://10709797006",
	["chevrons-right"] = "rbxassetid://10709797382",
	["chevrons-right-left"] = "rbxassetid://10709797274",
	["chevrons-up"] = "rbxassetid://10709797622",
	["chevrons-up-down"] = "rbxassetid://10709797508",
	["chrome"] = "rbxassetid://10709797725",
	["circle"] = "rbxassetid://10709798174",
	["circle-dot"] = "rbxassetid://10709797837",
	["circle-ellipsis"] = "rbxassetid://10709797985",
	["circle-slashed"] = "rbxassetid://10709798100",
	["citrus"] = "rbxassetid://10709798276",
	["clapperboard"] = "rbxassetid://10709798350",
	["clipboard"] = "rbxassetid://10709799288",
	["clipboard-check"] = "rbxassetid://10709798443",
	["clipboard-copy"] = "rbxassetid://10709798574",
	["clipboard-edit"] = "rbxassetid://10709798682",
	["clipboard-list"] = "rbxassetid://10709798792",
	["clipboard-signature"] = "rbxassetid://10709798890",
	["clipboard-type"] = "rbxassetid://10709798999",
	["clipboard-x"] = "rbxassetid://10709799124",
	["clock"] = "rbxassetid://10709805144",
	["clock-1"] = "rbxassetid://10709799535",
	["clock-10"] = "rbxassetid://10709799718",
	["clock-11"] = "rbxassetid://10709799818",
	["clock-12"] = "rbxassetid://10709799962",
	["clock-2"] = "rbxassetid://10709803876",
	["clock-3"] = "rbxassetid://10709803989",
	["clock-4"] = "rbxassetid://10709804164",
	["clock-5"] = "rbxassetid://10709804291",
	["clock-6"] = "rbxassetid://10709804435",
	["clock-7"] = "rbxassetid://10709804599",
	["clock-8"] = "rbxassetid://10709804784",
	["clock-9"] = "rbxassetid://10709804996",
	["cloud"] = "rbxassetid://10709806740",
	["cloud-cog"] = "rbxassetid://10709805262",
	["cloud-drizzle"] = "rbxassetid://10709805371",
	["cloud-fog"] = "rbxassetid://10709805477",
	["cloud-hail"] = "rbxassetid://10709805596",
	["cloud-lightning"] = "rbxassetid://10709805727",
	["cloud-moon"] = "rbxassetid://10709805942",
	["cloud-moon-rain"] = "rbxassetid://10709805838",
	["cloud-off"] = "rbxassetid://10709806060",
	["cloud-rain"] = "rbxassetid://10709806277",
	["cloud-rain-wind"] = "rbxassetid://10709806166",
	["cloud-snow"] = "rbxassetid://10709806374",
	["cloud-sun"] = "rbxassetid://10709806631",
	["cloud-sun-rain"] = "rbxassetid://10709806475",
	["cloudy"] = "rbxassetid://10709806859",
	["clover"] = "rbxassetid://10709806995",
	["code"] = "rbxassetid://10709810463",
	["code-2"] = "rbxassetid://10709807111",
	["codepen"] = "rbxassetid://10709810534",
	["codesandbox"] = "rbxassetid://10709810676",
	["coffee"] = "rbxassetid://10709810814",
	["cog"] = "rbxassetid://10709810948",
	["coins"] = "rbxassetid://10709811110",
	["columns"] = "rbxassetid://10709811261",
	["command"] = "rbxassetid://10709811365",
	["compass"] = "rbxassetid://10709811445",
	["component"] = "rbxassetid://10709811595",
	["concierge-bell"] = "rbxassetid://10709811706",
	["connection"] = "rbxassetid://10747361219",
	["contact"] = "rbxassetid://10709811834",
	["contrast"] = "rbxassetid://10709811939",
	["cookie"] = "rbxassetid://10709812067",
	["copy"] = "rbxassetid://10709812159",
	["copyleft"] = "rbxassetid://10709812251",
	["copyright"] = "rbxassetid://10709812311",
	["corner-down-left"] = "rbxassetid://10709812396",
	["corner-down-right"] = "rbxassetid://10709812485",
	["corner-left-down"] = "rbxassetid://10709812632",
	["corner-left-up"] = "rbxassetid://10709812784",
	["corner-right-down"] = "rbxassetid://10709812939",
	["corner-right-up"] = "rbxassetid://10709813094",
	["corner-up-left"] = "rbxassetid://10709813185",
	["corner-up-right"] = "rbxassetid://10709813281",
	["cpu"] = "rbxassetid://10709813383",
	["croissant"] = "rbxassetid://10709818125",
	["crop"] = "rbxassetid://10709818245",
	["cross"] = "rbxassetid://10709818399",
	["crosshair"] = "rbxassetid://10709818534",
	["crown"] = "rbxassetid://10709818626",
	["cup-soda"] = "rbxassetid://10709818763",
	["curly-braces"] = "rbxassetid://10709818847",
	["currency"] = "rbxassetid://10709818931",
	["database"] = "rbxassetid://10709818996",
	["delete"] = "rbxassetid://10709819059",
	["diamond"] = "rbxassetid://10709819149",
	["dice-1"] = "rbxassetid://10709819266",
	["dice-2"] = "rbxassetid://10709819361",
	["dice-3"] = "rbxassetid://10709819508",
	["dice-4"] = "rbxassetid://10709819670",
	["dice-5"] = "rbxassetid://10709819801",
	["dice-6"] = "rbxassetid://10709819896",
	["dices"] = "rbxassetid://10723343321",
	["diff"] = "rbxassetid://10723343416",
	["disc"] = "rbxassetid://10723343537",
	["divide"] = "rbxassetid://10723343805",
	["divide-circle"] = "rbxassetid://10723343636",
	["divide-square"] = "rbxassetid://10723343737",
	["dollar-sign"] = "rbxassetid://10723343958",
	["download"] = "rbxassetid://10723344270",
	["download-cloud"] = "rbxassetid://10723344088",
	["droplet"] = "rbxassetid://10723344432",
	["droplets"] = "rbxassetid://10734883356",
	["drumstick"] = "rbxassetid://10723344737",
	["edit"] = "rbxassetid://10734883598",
	["edit-2"] = "rbxassetid://10723344885",
	["edit-3"] = "rbxassetid://10723345088",
	["egg"] = "rbxassetid://10723345518",
	["egg-fried"] = "rbxassetid://10723345347",
	["electricity"] = "rbxassetid://10723345749",
	["electricity-off"] = "rbxassetid://10723345643",
	["equal"] = "rbxassetid://10723345990",
	["equal-not"] = "rbxassetid://10723345866",
	["eraser"] = "rbxassetid://10723346158",
	["euro"] = "rbxassetid://10723346372",
	["expand"] = "rbxassetid://10723346553",
	["external-link"] = "rbxassetid://10723346684",
	["eye"] = "rbxassetid://10723346959",
	["eye-off"] = "rbxassetid://10723346871",
	["factory"] = "rbxassetid://10723347051",
	["fan"] = "rbxassetid://10723354359",
	["fast-forward"] = "rbxassetid://10723354521",
	["feather"] = "rbxassetid://10723354671",
	["figma"] = "rbxassetid://10723354801",
	["file"] = "rbxassetid://10723374641",
	["file-archive"] = "rbxassetid://10723354921",
	["file-audio"] = "rbxassetid://10723355148",
	["file-audio-2"] = "rbxassetid://10723355026",
	["file-axis-3d"] = "rbxassetid://10723355272",
	["file-badge"] = "rbxassetid://10723355622",
	["file-badge-2"] = "rbxassetid://10723355451",
	["file-bar-chart"] = "rbxassetid://10723355887",
	["file-bar-chart-2"] = "rbxassetid://10723355746",
	["file-box"] = "rbxassetid://10723355989",
	["file-check"] = "rbxassetid://10723356210",
	["file-check-2"] = "rbxassetid://10723356100",
	["file-clock"] = "rbxassetid://10723356329",
	["file-code"] = "rbxassetid://10723356507",
	["file-cog"] = "rbxassetid://10723356830",
	["file-cog-2"] = "rbxassetid://10723356676",
	["file-diff"] = "rbxassetid://10723357039",
	["file-digit"] = "rbxassetid://10723357151",
	["file-down"] = "rbxassetid://10723357322",
	["file-edit"] = "rbxassetid://10723357495",
	["file-heart"] = "rbxassetid://10723357637",
	["file-image"] = "rbxassetid://10723357790",
	["file-input"] = "rbxassetid://10723357933",
	["file-json"] = "rbxassetid://10723364435",
	["file-json-2"] = "rbxassetid://10723364361",
	["file-key"] = "rbxassetid://10723364605",
	["file-key-2"] = "rbxassetid://10723364515",
	["file-line-chart"] = "rbxassetid://10723364725",
	["file-lock"] = "rbxassetid://10723364957",
	["file-lock-2"] = "rbxassetid://10723364861",
	["file-minus"] = "rbxassetid://10723365254",
	["file-minus-2"] = "rbxassetid://10723365086",
	["file-output"] = "rbxassetid://10723365457",
	["file-pie-chart"] = "rbxassetid://10723365598",
	["file-plus"] = "rbxassetid://10723365877",
	["file-plus-2"] = "rbxassetid://10723365766",
	["file-question"] = "rbxassetid://10723365987",
	["file-scan"] = "rbxassetid://10723366167",
	["file-search"] = "rbxassetid://10723366550",
	["file-search-2"] = "rbxassetid://10723366340",
	["file-signature"] = "rbxassetid://10723366741",
	["file-spreadsheet"] = "rbxassetid://10723366962",
	["file-symlink"] = "rbxassetid://10723367098",
	["file-terminal"] = "rbxassetid://10723367244",
	["file-text"] = "rbxassetid://10723367380",
	["file-type"] = "rbxassetid://10723367606",
	["file-type-2"] = "rbxassetid://10723367509",
	["file-up"] = "rbxassetid://10723367734",
	["file-video"] = "rbxassetid://10723373884",
	["file-video-2"] = "rbxassetid://10723367834",
	["file-volume"] = "rbxassetid://10723374172",
	["file-volume-2"] = "rbxassetid://10723374030",
	["file-warning"] = "rbxassetid://10723374276",
	["file-x"] = "rbxassetid://10723374544",
	["file-x-2"] = "rbxassetid://10723374378",
	["files"] = "rbxassetid://10723374759",
	["film"] = "rbxassetid://10723374981",
	["filter"] = "rbxassetid://10723375128",
	["fingerprint"] = "rbxassetid://10723375250",
	["flag"] = "rbxassetid://10723375890",
	["flag-off"] = "rbxassetid://10723375443",
	["flag-triangle-left"] = "rbxassetid://10723375608",
	["flag-triangle-right"] = "rbxassetid://10723375727",
	["flame"] = "rbxassetid://10723376114",
	["flashlight"] = "rbxassetid://10723376471",
	["flashlight-off"] = "rbxassetid://10723376365",
	["flask-conical"] = "rbxassetid://10734883986",
	["flask-round"] = "rbxassetid://10723376614",
	["flip-horizontal"] = "rbxassetid://10723376884",
	["flip-horizontal-2"] = "rbxassetid://10723376745",
	["flip-vertical"] = "rbxassetid://10723377138",
	["flip-vertical-2"] = "rbxassetid://10723377026",
	["flower"] = "rbxassetid://10747830374",
	["flower-2"] = "rbxassetid://10723377305",
	["focus"] = "rbxassetid://10723377537",
	["folder"] = "rbxassetid://10723387563",
	["folder-archive"] = "rbxassetid://10723384478",
	["folder-check"] = "rbxassetid://10723384605",
	["folder-clock"] = "rbxassetid://10723384731",
	["folder-closed"] = "rbxassetid://10723384893",
	["folder-cog"] = "rbxassetid://10723385213",
	["folder-cog-2"] = "rbxassetid://10723385036",
	["folder-down"] = "rbxassetid://10723385338",
	["folder-edit"] = "rbxassetid://10723385445",
	["folder-heart"] = "rbxassetid://10723385545",
	["folder-input"] = "rbxassetid://10723385721",
	["folder-key"] = "rbxassetid://10723385848",
	["folder-lock"] = "rbxassetid://10723386005",
	["folder-minus"] = "rbxassetid://10723386127",
	["folder-open"] = "rbxassetid://10723386277",
	["folder-output"] = "rbxassetid://10723386386",
	["folder-plus"] = "rbxassetid://10723386531",
	["folder-search"] = "rbxassetid://10723386787",
	["folder-search-2"] = "rbxassetid://10723386674",
	["folder-symlink"] = "rbxassetid://10723386930",
	["folder-tree"] = "rbxassetid://10723387085",
	["folder-up"] = "rbxassetid://10723387265",
	["folder-x"] = "rbxassetid://10723387448",
	["folders"] = "rbxassetid://10723387721",
	["form-input"] = "rbxassetid://10723387841",
	["forward"] = "rbxassetid://10723388016",
	["frame"] = "rbxassetid://10723394389",
	["framer"] = "rbxassetid://10723394565",
	["frown"] = "rbxassetid://10723394681",
	["fuel"] = "rbxassetid://10723394846",
	["function-square"] = "rbxassetid://10723395041",
	["gamepad"] = "rbxassetid://10723395457",
	["gamepad-2"] = "rbxassetid://10723395215",
	["gauge"] = "rbxassetid://10723395708",
	["gavel"] = "rbxassetid://10723395896",
	["gem"] = "rbxassetid://10723396000",
	["ghost"] = "rbxassetid://10723396107",
	["gift"] = "rbxassetid://10723396402",
	["gift-card"] = "rbxassetid://10723396225",
	["git-branch"] = "rbxassetid://10723396676",
	["git-branch-plus"] = "rbxassetid://10723396542",
	["git-commit"] = "rbxassetid://10723396812",
	["git-compare"] = "rbxassetid://10723396954",
	["git-fork"] = "rbxassetid://10723397049",
	["git-merge"] = "rbxassetid://10723397165",
	["git-pull-request"] = "rbxassetid://10723397431",
	["git-pull-request-closed"] = "rbxassetid://10723397268",
	["git-pull-request-draft"] = "rbxassetid://10734884302",
	["glass"] = "rbxassetid://10723397788",
	["glass-2"] = "rbxassetid://10723397529",
	["glass-water"] = "rbxassetid://10723397678",
	["glasses"] = "rbxassetid://10723397895",
	["globe"] = "rbxassetid://10723404337",
	["globe-2"] = "rbxassetid://10723398002",
	["grab"] = "rbxassetid://10723404472",
	["graduation-cap"] = "rbxassetid://10723404691",
	["grape"] = "rbxassetid://10723404822",
	["grid"] = "rbxassetid://10723404936",
	["grip-horizontal"] = "rbxassetid://10723405089",
	["grip-vertical"] = "rbxassetid://10723405236",
	["hammer"] = "rbxassetid://10723405360",
	["hand"] = "rbxassetid://10723405649",
	["hand-metal"] = "rbxassetid://10723405508",
	["hard-drive"] = "rbxassetid://10723405749",
	["hard-hat"] = "rbxassetid://10723405859",
	["hash"] = "rbxassetid://10723405975",
	["haze"] = "rbxassetid://10723406078",
	["headphones"] = "rbxassetid://10723406165",
	["heart"] = "rbxassetid://10723406885",
	["heart-crack"] = "rbxassetid://10723406299",
	["heart-handshake"] = "rbxassetid://10723406480",
	["heart-off"] = "rbxassetid://10723406662",
	["heart-pulse"] = "rbxassetid://10723406795",
	["help-circle"] = "rbxassetid://10723406988",
	["hexagon"] = "rbxassetid://10723407092",
	["highlighter"] = "rbxassetid://10723407192",
	["history"] = "rbxassetid://10723407335",
	["home"] = "rbxassetid://10723407389",
	["hourglass"] = "rbxassetid://10723407498",
	["ice-cream"] = "rbxassetid://10723414308",
	["image"] = "rbxassetid://10723415040",
	["image-minus"] = "rbxassetid://10723414487",
	["image-off"] = "rbxassetid://10723414677",
	["image-plus"] = "rbxassetid://10723414827",
	["import"] = "rbxassetid://10723415205",
	["inbox"] = "rbxassetid://10723415335",
	["indent"] = "rbxassetid://10723415494",
	["indian-rupee"] = "rbxassetid://10723415642",
	["infinity"] = "rbxassetid://10723415766",
	["info"] = "rbxassetid://10723415903",
	["inspect"] = "rbxassetid://10723416057",
	["italic"] = "rbxassetid://10723416195",
	["japanese-yen"] = "rbxassetid://10723416363",
	["joystick"] = "rbxassetid://10723416527",
	["key"] = "rbxassetid://10723416652",
	["keyboard"] = "rbxassetid://10723416765",
	["lamp"] = "rbxassetid://10723417513",
	["lamp-ceiling"] = "rbxassetid://10723416922",
	["lamp-desk"] = "rbxassetid://10723417016",
	["lamp-floor"] = "rbxassetid://10723417131",
	["lamp-wall-down"] = "rbxassetid://10723417240",
	["lamp-wall-up"] = "rbxassetid://10723417356",
	["landmark"] = "rbxassetid://10723417608",
	["languages"] = "rbxassetid://10723417703",
	["laptop"] = "rbxassetid://10723423881",
	["laptop-2"] = "rbxassetid://10723417797",
	["lasso"] = "rbxassetid://10723424235",
	["lasso-select"] = "rbxassetid://10723424058",
	["laugh"] = "rbxassetid://10723424372",
	["layers"] = "rbxassetid://10723424505",
	["layout"] = "rbxassetid://10723425376",
	["layout-dashboard"] = "rbxassetid://10723424646",
	["layout-grid"] = "rbxassetid://10723424838",
	["layout-list"] = "rbxassetid://10723424963",
	["layout-template"] = "rbxassetid://10723425187",
	["leaf"] = "rbxassetid://10723425539",
	["library"] = "rbxassetid://10723425615",
	["life-buoy"] = "rbxassetid://10723425685",
	["lightbulb"] = "rbxassetid://10723425852",
	["lightbulb-off"] = "rbxassetid://10723425762",
	["line-chart"] = "rbxassetid://10723426393",
	["link"] = "rbxassetid://10723426722",
	["link-2"] = "rbxassetid://10723426595",
	["link-2-off"] = "rbxassetid://10723426513",
	["list"] = "rbxassetid://10723433811",
	["list-checks"] = "rbxassetid://10734884548",
	["list-end"] = "rbxassetid://10723426886",
	["list-minus"] = "rbxassetid://10723426986",
	["list-music"] = "rbxassetid://10723427081",
	["list-ordered"] = "rbxassetid://10723427199",
	["list-plus"] = "rbxassetid://10723427334",
	["list-start"] = "rbxassetid://10723427494",
	["list-video"] = "rbxassetid://10723427619",
	["list-x"] = "rbxassetid://10723433655",
	["loader"] = "rbxassetid://10723434070",
	["loader-2"] = "rbxassetid://10723433935",
	["locate"] = "rbxassetid://10723434557",
	["locate-fixed"] = "rbxassetid://10723434236",
	["locate-off"] = "rbxassetid://10723434379",
	["lock"] = "rbxassetid://10723434711",
	["log-in"] = "rbxassetid://10723434830",
	["log-out"] = "rbxassetid://10723434906",
	["luggage"] = "rbxassetid://10723434993",
	["magnet"] = "rbxassetid://10723435069",
	["mail"] = "rbxassetid://10734885430",
	["mail-check"] = "rbxassetid://10723435182",
	["mail-minus"] = "rbxassetid://10723435261",
	["mail-open"] = "rbxassetid://10723435342",
	["mail-plus"] = "rbxassetid://10723435443",
	["mail-question"] = "rbxassetid://10723435515",
	["mail-search"] = "rbxassetid://10734884739",
	["mail-warning"] = "rbxassetid://10734885015",
	["mail-x"] = "rbxassetid://10734885247",
	["mails"] = "rbxassetid://10734885614",
	["map"] = "rbxassetid://10734886202",
	["map-pin"] = "rbxassetid://10734886004",
	["map-pin-off"] = "rbxassetid://10734885803",
	["maximize"] = "rbxassetid://10734886735",
	["maximize-2"] = "rbxassetid://10734886496",
	["medal"] = "rbxassetid://10734887072",
	["megaphone"] = "rbxassetid://10734887454",
	["megaphone-off"] = "rbxassetid://10734887311",
	["meh"] = "rbxassetid://10734887603",
	["menu"] = "rbxassetid://10734887784",
	["message-circle"] = "rbxassetid://10734888000",
	["message-square"] = "rbxassetid://10734888228",
	["mic"] = "rbxassetid://10734888864",
	["mic-2"] = "rbxassetid://10734888430",
	["mic-off"] = "rbxassetid://10734888646",
	["microscope"] = "rbxassetid://10734889106",
	["microwave"] = "rbxassetid://10734895076",
	["milestone"] = "rbxassetid://10734895310",
	["minimize"] = "rbxassetid://10734895698",
	["minimize-2"] = "rbxassetid://10734895530",
	["minus"] = "rbxassetid://10734896206",
	["minus-circle"] = "rbxassetid://10734895856",
	["minus-square"] = "rbxassetid://10734896029",
	["monitor"] = "rbxassetid://10734896881",
	["monitor-off"] = "rbxassetid://10734896360",
	["monitor-speaker"] = "rbxassetid://10734896512",
	["moon"] = "rbxassetid://10734897102",
	["more-horizontal"] = "rbxassetid://10734897250",
	["more-vertical"] = "rbxassetid://10734897387",
	["mountain"] = "rbxassetid://10734897956",
	["mountain-snow"] = "rbxassetid://10734897665",
	["mouse"] = "rbxassetid://10734898592",
	["mouse-pointer"] = "rbxassetid://10734898476",
	["mouse-pointer-2"] = "rbxassetid://10734898194",
	["mouse-pointer-click"] = "rbxassetid://10734898355",
	["move"] = "rbxassetid://10734900011",
	["move-3d"] = "rbxassetid://10734898756",
	["move-diagonal"] = "rbxassetid://10734899164",
	["move-diagonal-2"] = "rbxassetid://10734898934",
	["move-horizontal"] = "rbxassetid://10734899414",
	["move-vertical"] = "rbxassetid://10734899821",
	["music"] = "rbxassetid://10734905958",
	["music-2"] = "rbxassetid://10734900215",
	["music-3"] = "rbxassetid://10734905665",
	["music-4"] = "rbxassetid://10734905823",
	["navigation"] = "rbxassetid://10734906744",
	["navigation-2"] = "rbxassetid://10734906332",
	["navigation-2-off"] = "rbxassetid://10734906144",
	["navigation-off"] = "rbxassetid://10734906580",
	["network"] = "rbxassetid://10734906975",
	["newspaper"] = "rbxassetid://10734907168",
	["octagon"] = "rbxassetid://10734907361",
	["option"] = "rbxassetid://10734907649",
	["outdent"] = "rbxassetid://10734907933",
	["package"] = "rbxassetid://10734909540",
	["package-2"] = "rbxassetid://10734908151",
	["package-check"] = "rbxassetid://10734908384",
	["package-minus"] = "rbxassetid://10734908626",
	["package-open"] = "rbxassetid://10734908793",
	["package-plus"] = "rbxassetid://10734909016",
	["package-search"] = "rbxassetid://10734909196",
	["package-x"] = "rbxassetid://10734909375",
	["paint-bucket"] = "rbxassetid://10734909847",
	["paintbrush"] = "rbxassetid://10734910187",
	["paintbrush-2"] = "rbxassetid://10734910030",
	["palette"] = "rbxassetid://10734910430",
	["palmtree"] = "rbxassetid://10734910680",
	["paperclip"] = "rbxassetid://10734910927",
	["party-popper"] = "rbxassetid://10734918735",
	["pause"] = "rbxassetid://10734919336",
	["pause-circle"] = "rbxassetid://10735024209",
	["pause-octagon"] = "rbxassetid://10734919143",
	["pen-tool"] = "rbxassetid://10734919503",
	["pencil"] = "rbxassetid://10734919691",
	["percent"] = "rbxassetid://10734919919",
	["person-standing"] = "rbxassetid://10734920149",
	["phone"] = "rbxassetid://10734921524",
	["phone-call"] = "rbxassetid://10734920305",
	["phone-forwarded"] = "rbxassetid://10734920508",
	["phone-incoming"] = "rbxassetid://10734920694",
	["phone-missed"] = "rbxassetid://10734920845",
	["phone-off"] = "rbxassetid://10734921077",
	["phone-outgoing"] = "rbxassetid://10734921288",
	["pie-chart"] = "rbxassetid://10734921727",
	["piggy-bank"] = "rbxassetid://10734921935",
	["pin"] = "rbxassetid://10734922324",
	["pin-off"] = "rbxassetid://10734922180",
	["pipette"] = "rbxassetid://10734922497",
	["pizza"] = "rbxassetid://10734922774",
	["plane"] = "rbxassetid://10734922971",
	["play"] = "rbxassetid://10734923549",
	["play-circle"] = "rbxassetid://10734923214",
	["plus"] = "rbxassetid://10734924532",
	["plus-circle"] = "rbxassetid://10734923868",
	["plus-square"] = "rbxassetid://10734924219",
	["podcast"] = "rbxassetid://10734929553",
	["pointer"] = "rbxassetid://10734929723",
	["pound-sterling"] = "rbxassetid://10734929981",
	["power"] = "rbxassetid://10734930466",
	["power-off"] = "rbxassetid://10734930257",
	["printer"] = "rbxassetid://10734930632",
	["puzzle"] = "rbxassetid://10734930886",
	["quote"] = "rbxassetid://10734931234",
	["radio"] = "rbxassetid://10734931596",
	["radio-receiver"] = "rbxassetid://10734931402",
	["rectangle-horizontal"] = "rbxassetid://10734931777",
	["rectangle-vertical"] = "rbxassetid://10734932081",
	["recycle"] = "rbxassetid://10734932295",
	["redo"] = "rbxassetid://10734932822",
	["redo-2"] = "rbxassetid://10734932586",
	["refresh-ccw"] = "rbxassetid://10734933056",
	["refresh-cw"] = "rbxassetid://10734933222",
	["refrigerator"] = "rbxassetid://10734933465",
	["regex"] = "rbxassetid://10734933655",
	["repeat"] = "rbxassetid://10734933966",
	["repeat-1"] = "rbxassetid://10734933826",
	["reply"] = "rbxassetid://10734934252",
	["reply-all"] = "rbxassetid://10734934132",
	["rewind"] = "rbxassetid://10734934347",
	["rocket"] = "rbxassetid://10734934585",
	["rocking-chair"] = "rbxassetid://10734939942",
	["rotate-3d"] = "rbxassetid://10734940107",
	["rotate-ccw"] = "rbxassetid://10734940376",
	["rotate-cw"] = "rbxassetid://10734940654",
	["rss"] = "rbxassetid://10734940825",
	["ruler"] = "rbxassetid://10734941018",
	["russian-ruble"] = "rbxassetid://10734941199",
	["sailboat"] = "rbxassetid://10734941354",
	["save"] = "rbxassetid://10734941499",
	["scale"] = "rbxassetid://10734941912",
	["scale-3d"] = "rbxassetid://10734941739",
	["scaling"] = "rbxassetid://10734942072",
	["scan"] = "rbxassetid://10734942565",
	["scan-face"] = "rbxassetid://10734942198",
	["scan-line"] = "rbxassetid://10734942351",
	["scissors"] = "rbxassetid://10734942778",
	["screen-share"] = "rbxassetid://10734943193",
	["screen-share-off"] = "rbxassetid://10734942967",
	["scroll"] = "rbxassetid://10734943448",
	["search"] = "rbxassetid://10734943674",
	["send"] = "rbxassetid://10734943902",
	["separator-horizontal"] = "rbxassetid://10734944115",
	["separator-vertical"] = "rbxassetid://10734944326",
	["server"] = "rbxassetid://10734949856",
	["server-cog"] = "rbxassetid://10734944444",
	["server-crash"] = "rbxassetid://10734944554",
	["server-off"] = "rbxassetid://10734944668",
	["settings"] = "rbxassetid://10734950309",
	["settings-2"] = "rbxassetid://10734950020",
	["share"] = "rbxassetid://10734950813",
	["share-2"] = "rbxassetid://10734950553",
	["sheet"] = "rbxassetid://10734951038",
	["shield"] = "rbxassetid://10734951847",
	["shield-alert"] = "rbxassetid://10734951173",
	["shield-check"] = "rbxassetid://10734951367",
	["shield-close"] = "rbxassetid://10734951535",
	["shield-off"] = "rbxassetid://10734951684",
	["shirt"] = "rbxassetid://10734952036",
	["shopping-bag"] = "rbxassetid://10734952273",
	["shopping-cart"] = "rbxassetid://10734952479",
	["shovel"] = "rbxassetid://10734952773",
	["shower-head"] = "rbxassetid://10734952942",
	["shrink"] = "rbxassetid://10734953073",
	["shrub"] = "rbxassetid://10734953241",
	["shuffle"] = "rbxassetid://10734953451",
	["sidebar"] = "rbxassetid://10734954301",
	["sidebar-close"] = "rbxassetid://10734953715",
	["sidebar-open"] = "rbxassetid://10734954000",
	["sigma"] = "rbxassetid://10734954538",
	["signal"] = "rbxassetid://10734961133",
	["signal-high"] = "rbxassetid://10734954807",
	["signal-low"] = "rbxassetid://10734955080",
	["signal-medium"] = "rbxassetid://10734955336",
	["signal-zero"] = "rbxassetid://10734960878",
	["siren"] = "rbxassetid://10734961284",
	["skip-back"] = "rbxassetid://10734961526",
	["skip-forward"] = "rbxassetid://10734961809",
	["skull"] = "rbxassetid://10734962068",
	["slack"] = "rbxassetid://10734962339",
	["slash"] = "rbxassetid://10734962600",
	["slice"] = "rbxassetid://10734963024",
	["sliders"] = "rbxassetid://10734963400",
	["sliders-horizontal"] = "rbxassetid://10734963191",
	["smartphone"] = "rbxassetid://10734963940",
	["smartphone-charging"] = "rbxassetid://10734963671",
	["smile"] = "rbxassetid://10734964441",
	["smile-plus"] = "rbxassetid://10734964188",
	["snowflake"] = "rbxassetid://10734964600",
	["sofa"] = "rbxassetid://10734964852",
	["sort-asc"] = "rbxassetid://10734965115",
	["sort-desc"] = "rbxassetid://10734965287",
	["speaker"] = "rbxassetid://10734965419",
	["sprout"] = "rbxassetid://10734965572",
	["square"] = "rbxassetid://10734965702",
	["star"] = "rbxassetid://10734966248",
	["star-half"] = "rbxassetid://10734965897",
	["star-off"] = "rbxassetid://10734966097",
	["stethoscope"] = "rbxassetid://10734966384",
	["sticker"] = "rbxassetid://10734972234",
	["sticky-note"] = "rbxassetid://10734972463",
	["stop-circle"] = "rbxassetid://10734972621",
	["stretch-horizontal"] = "rbxassetid://10734972862",
	["stretch-vertical"] = "rbxassetid://10734973130",
	["strikethrough"] = "rbxassetid://10734973290",
	["subscript"] = "rbxassetid://10734973457",
	["sun"] = "rbxassetid://10734974297",
	["sun-dim"] = "rbxassetid://10734973645",
	["sun-medium"] = "rbxassetid://10734973778",
	["sun-moon"] = "rbxassetid://10734973999",
	["sun-snow"] = "rbxassetid://10734974130",
	["sunrise"] = "rbxassetid://10734974522",
	["sunset"] = "rbxassetid://10734974689",
	["superscript"] = "rbxassetid://10734974850",
	["swiss-franc"] = "rbxassetid://10734975024",
	["switch-camera"] = "rbxassetid://10734975214",
	["sword"] = "rbxassetid://10734975486",
	["swords"] = "rbxassetid://10734975692",
	["syringe"] = "rbxassetid://10734975932",
	["table"] = "rbxassetid://10734976230",
	["table-2"] = "rbxassetid://10734976097",
	["tablet"] = "rbxassetid://10734976394",
	["tag"] = "rbxassetid://10734976528",
	["tags"] = "rbxassetid://10734976739",
	["target"] = "rbxassetid://10734977012",
	["tent"] = "rbxassetid://10734981750",
	["terminal"] = "rbxassetid://10734982144",
	["terminal-square"] = "rbxassetid://10734981995",
	["text-cursor"] = "rbxassetid://10734982395",
	["text-cursor-input"] = "rbxassetid://10734982297",
	["thermometer"] = "rbxassetid://10734983134",
	["thermometer-snowflake"] = "rbxassetid://10734982571",
	["thermometer-sun"] = "rbxassetid://10734982771",
	["thumbs-down"] = "rbxassetid://10734983359",
	["thumbs-up"] = "rbxassetid://10734983629",
	["ticket"] = "rbxassetid://10734983868",
	["timer"] = "rbxassetid://10734984606",
	["timer-off"] = "rbxassetid://10734984138",
	["timer-reset"] = "rbxassetid://10734984355",
	["toggle-left"] = "rbxassetid://10734984834",
	["toggle-right"] = "rbxassetid://10734985040",
	["tornado"] = "rbxassetid://10734985247",
	["toy-brick"] = "rbxassetid://10747361919",
	["train"] = "rbxassetid://10747362105",
	["trash"] = "rbxassetid://10747362393",
	["trash-2"] = "rbxassetid://10747362241",
	["tree-deciduous"] = "rbxassetid://10747362534",
	["tree-pine"] = "rbxassetid://10747362748",
	["trees"] = "rbxassetid://10747363016",
	["trending-down"] = "rbxassetid://10747363205",
	["trending-up"] = "rbxassetid://10747363465",
	["triangle"] = "rbxassetid://10747363621",
	["trophy"] = "rbxassetid://10747363809",
	["truck"] = "rbxassetid://10747364031",
	["tv"] = "rbxassetid://10747364593",
	["tv-2"] = "rbxassetid://10747364302",
	["type"] = "rbxassetid://10747364761",
	["umbrella"] = "rbxassetid://10747364971",
	["underline"] = "rbxassetid://10747365191",
	["undo"] = "rbxassetid://10747365484",
	["undo-2"] = "rbxassetid://10747365359",
	["unlink"] = "rbxassetid://10747365771",
	["unlink-2"] = "rbxassetid://10747397871",
	["unlock"] = "rbxassetid://10747366027",
	["upload"] = "rbxassetid://10747366434",
	["upload-cloud"] = "rbxassetid://10747366266",
	["usb"] = "rbxassetid://10747366606",
	["user"] = "rbxassetid://10747373176",
	["user-check"] = "rbxassetid://10747371901",
	["user-cog"] = "rbxassetid://10747372167",
	["user-minus"] = "rbxassetid://10747372346",
	["user-plus"] = "rbxassetid://10747372702",
	["user-x"] = "rbxassetid://10747372992",
	["users"] = "rbxassetid://10747373426",
	["utensils"] = "rbxassetid://10747373821",
	["utensils-crossed"] = "rbxassetid://10747373629",
	["venetian-mask"] = "rbxassetid://10747374003",
	["verified"] = "rbxassetid://10747374131",
	["vibrate"] = "rbxassetid://10747374489",
	["vibrate-off"] = "rbxassetid://10747374269",
	["video"] = "rbxassetid://10747374938",
	["video-off"] = "rbxassetid://10747374721",
	["view"] = "rbxassetid://10747375132",
	["voicemail"] = "rbxassetid://10747375281",
	["volume"] = "rbxassetid://10747376008",
	["volume-1"] = "rbxassetid://10747375450",
	["volume-2"] = "rbxassetid://10747375679",
	["volume-x"] = "rbxassetid://10747375880",
	["wallet"] = "rbxassetid://10747376205",
	["wand"] = "rbxassetid://10747376565",
	["wand-2"] = "rbxassetid://10747376349",
	["watch"] = "rbxassetid://10747376722",
	["waves"] = "rbxassetid://10747376931",
	["webcam"] = "rbxassetid://10747381992",
	["wifi"] = "rbxassetid://10747382504",
	["wifi-off"] = "rbxassetid://10747382268",
	["wind"] = "rbxassetid://10747382750",
	["wrap-text"] = "rbxassetid://10747383065",
	["wrench"] = "rbxassetid://10747383470",
	["x"] = "rbxassetid://10747384394",
	["x-circle"] = "rbxassetid://10747383819",
	["x-octagon"] = "rbxassetid://10747384037",
	["x-square"] = "rbxassetid://10747384217",
	["zoom-in"] = "rbxassetid://10747384552",
	["zoom-out"] = "rbxassetid://10747384679",
}

return Nathub["1"], require;
