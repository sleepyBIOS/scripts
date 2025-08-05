-- made by whiz
-- :)

-- hi site 19
local Players : Players = game:GetService("Players");
local localPlayer : Player = Players.LocalPlayer;
local scp_group: number = 3895837;

local function createHighlight(plr : Player)
	if localPlayer.Team == plr.Team then
		return;
	end
	if plr.Character:FindFirstChildOfClass("Highlight") then
		return;
	end
	if plr == localPlayer then
		return;
	end
	local highlight = Instance.new("Highlight");
	highlight.FillColor = plr.TeamColor.Color;
	highlight.Parent = plr.Character;
	if plr:IsInGroup(scp_group) and plr:GetRankInGroup(scp_group) > 8  then
		local BillboardGui = Instance.new("BillboardGui")
		local ImageLabel = Instance.new("ImageLabel")

		BillboardGui.Parent = plr.Character.HumanoidRootPart
		BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		BillboardGui.Active = true
		BillboardGui.AlwaysOnTop = true
		BillboardGui.LightInfluence = 1.000
		BillboardGui.Size = UDim2.new(2.5, 0, 2.5, 0)

		ImageLabel.Parent = BillboardGui
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel.Image = "http://www.roblox.com/asset/?id=6035078889"
	end
end

local function resetHighlights()
	for _, plr : Player? in Players:GetChildren() do
		if plr:IsA("Player") then
			if plr.Character then
				if plr.Character:FindFirstChildOfClass("Highlight") then
					plr.Character:FindFirstChildOfClass("Highlight"):Destroy();
				end
			end
		end
	end
end

game.Players.LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function()
	resetHighlights()
	for _,v in pairs(Players:GetChildren()) do
		if v ~= localPlayer then
			createHighlight(v);
		end
	end
end)

for _,v in pairs(Players:GetChildren()) do
	if v ~= localPlayer then
        createHighlight(v);
		v.CharacterAdded:Connect(function()
			createHighlight(v);
		end)
	end
end

Players.ChildAdded:Connect(function(plr)
	if plr:IsA("Player") then
		plr.CharacterAdded:Connect(function()
			createHighlight(plr);
		end)
	end
end)
