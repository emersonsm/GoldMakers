local hbdp = LibStub("HereBeDragons-Pins-2.0")
local pinCount = 0
local Minimap = Minimap
local frameLevel = Minimap:GetFrameLevel() + 5
local frameStrata = Minimap:GetFrameStrata()

local iconP = {
	[1] = {
		["left"] = 0.25,
		["right"] = 0.5,
		["top"] = 0,
		["bottom"] = 0.25,
	},
	[2] = {
		["left"] = 0.5,
		["right"] = 0.75,
		["top"] = 0,
		["bottom"] = 0.25,
	},
	[3] = {
		["left"] = 0.75,
		["right"] = 1,
		["top"] = 0,
		["bottom"] = 0.25,
	},
	[4] = {
		["left"] = 0.25,
		["right"] = 0.5,
		["top"] = 0.25,
		["bottom"] = 0.5,
	},
	[5] = {
		["left"] = 0.5,
		["right"] = 0.75,
		["top"] = 0.25,
		["bottom"] = 0.5,
	},
}

function GM.NewPin()
	pinCount = pinCount + 1

	local pin = CreateFrame("Button", "GoldMakersPin"..pinCount, Minimap)
	pin:SetFrameLevel(5)
	pin:EnableMouse(true)
	pin:SetWidth(12)
	pin:SetHeight(12)
	pin:SetPoint("CENTER", Minimap, "CENTER")

	local texture = pin:CreateTexture(nil, "OVERLAY")
	pin.texture = texture
	texture:SetAllPoints(pin)
	texture:SetTexelSnappingBias(0)
	texture:SetSnapToPixelGrid(false)
	pin:RegisterForClicks("AnyUp", "AnyDown")
	pin:SetMovable(true)
	pin:Hide()

	return pin
end

function GM.AddPinToMinimap(coordinates, mapId)
	-- First clear all pins
	hbdp:RemoveAllMinimapIcons("GoldMakersGoldMakers")
	local max = 0
		for index, value in pairs (coordinates) do
		max = max + 1
	end
	for i = 1, max do
		local icon_path = "Interface\\TargetingFrame\\UI-RaidTargetingIcons"
		local icon = GM.NewPin()
		icon:SetParent(Minimap)
		icon:SetFrameStrata(frameStrata)
		icon:SetFrameLevel(frameLevel)
		icon:SetHeight(12)
		icon:SetWidth(12)
		icon:SetAlpha(1)

		local t = icon.texture
		t:SetTexture(icon_path)
		t:SetTexCoord(iconP[i].left, iconP[i].right, iconP[i].top, iconP[i].bottom)
		t:SetVertexColor(1, 1, 1, 1)

		hbdp:AddMinimapIconMap("GoldMakersGoldMakers", icon, mapId, coordinates[i].x, coordinates[i].y, true)
	end
end