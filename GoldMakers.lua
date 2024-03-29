local addon = GetAddOnMetadata(..., "Title")
local version = GetAddOnMetadata(..., "version")
local GoldMakers = LibStub("AceAddon-3.0"):NewAddon(addon, "AceConsole-3.0", "AceEvent-3.0")
local AceGUI = LibStub("AceGUI-3.0")

function GMSlashCmd(input)
	local cmd, args = strmatch(strtrim(input), "^([^ ]*) ?(.*)$")
	if cmd == "" then
		GoldMakers:ShowMainUI()
	else
		if cmd == "pets" then
			local pet = GoldMakers:GeneratePet()
			if pet ~= false then
				print("You have been chosen to farm " .. pet.name)
			else
				GoldMakers:Print("You need to select some pets on addon configurations.")
			end
		elseif cmd == "dungeon" then
			local dungeon = GoldMakers:GenerateDungeon()
			if dungeon ~= false then
				print("You have been chosen to farm |cffff9933" .. dungeon.name .. "|r")
			else
				GoldMakers:Print("You need to select some dungeons on addon configurations.")
			end
		elseif cmd == "material" then
			local material = GoldMakers:GenerateMaterial()
			if material ~= false then
				print("You have been chosen to farm " .. material.name)
			else
				GoldMakers:Print("You need to select some materials on addon configurations.")
			end
		elseif cmd == "world" then
			local world = GoldMakers:GenerateOpenWorld()
			if world ~= false then
				print("You have been chosen to farm |cffff9933" .. world.name .. "|r")
			else
				GoldMakers:Print("You need to select some open world farms on addon configurations.")
			end
		elseif cmd == "config" then
			InterfaceOptionsFrame_OpenToCategory(addon)
			InterfaceOptionsFrame_OpenToCategory(addon)	
		elseif cmd == "help" then
			print("|cff33ff99 /gm|r - Open main ui.")
			print("|cff33ff99 /gm config|r - Open configurations interface.")
			print("|cff33ff99 /gm pets|r - Select a random pet to farm.")
			print("|cff33ff99 /gm dungeon|r - Select a random dungeon to farm.")
			print("|cff33ff99 /gm material|r - Select a random material to farm.")
			print("|cff33ff99 /gm world|r - Select a random open world farm.")
		end
	end
end

function GoldMakers:OnInitialize()
	self.defaults = {
		profile = {
			dungeons = {
				['*'] = true,
			},
			openworld = {
				['*'] = true,
			},
			materials = {
				['*'] = true,
			},
			pets = {
				['*'] = true,
			},
			display = false,
			minimap = {
				hide = false,
				minimapPos = 220,
				radius = 80,
			},
			dungeonconfig = {
				hideBossToastLoot = false,
				hideBossBanner = false,
				minimizeObjectives = false,
			},
			tomtomwaypoints = {
				enabled = true,
			}
		}
	}
	self.db = LibStub("AceDB-3.0"):New("GoldMakersDB", self.defaults, true)
	profiledb = self.db.profile
	main = GoldMakers.mainUI()

	GoldMakers.icon = LibStub("LibDBIcon-1.0")
	GoldMakers.LibDataBroker = LibStub("LibDataBroker-1.1"):NewDataObject(addon, {
		type = "launcher",
		text = addon,
		icon = "Interface\\Icons\\inv_misc_bag_enchantedrunecloth",
		OnClick = function(self, button, down)
			if button == "LeftButton" then
				GoldMakers:ShowMainUI()
			elseif button == "RightButton" then
				InterfaceOptionsFrame_OpenToCategory(addon)
				InterfaceOptionsFrame_OpenToCategory(addon)
			end
		end,

		OnTooltipShow = function (tooltip)
			tooltip:AddLine(addon .. " " .. version, 1, 1, 1)
			tooltip:AddLine("|cFFFFFFCCLeft-Click|r to open the main window")
			tooltip:AddLine("|cFFFFFFCCRight-Click|r to open configurations window")
			tooltip:AddLine("|cFFFFFFCCDrag|r to move this button")
		end,
	})

	GoldMakers.icon:Register(addon, GoldMakers.LibDataBroker, profiledb.minimap)
	if profiledb.minimap.hide == true then
		GoldMakers.icon:Show(addon)
	else
		GoldMakers.icon:Hide(addon)
	end

	if profiledb.dungeonconfig.hideBossToastLoot == true then
		hooksecurefunc(AlertFrame, "RegisterEvent", function(self, event)
			AlertFrame:UnregisterEvent(event)
		end)
		AlertFrame:UnregisterAllEvents()
	end

	if profiledb.dungeonconfig.hideBossBanner == true then
		BossBanner:UnregisterEvent("ENCOUNTER_LOOT_RECEIVED")
		BossBanner:UnregisterEvent("BOSS_KILL")
	end

	if profiledb.dungeonconfig.minimizeObjectives == true then
		ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:Click()
	end
end

function GoldMakers:OnEnable()
	GoldMakers:Print("v" .. version .. " enabled.")
end

function GoldMakers:GeneratePet()
	local filterPets = {}
	local max = 0
	local aux = 1
	for index, value in pairs (GoldMakers.Pets) do
		if profiledb.pets[index] ~= false then
			filterPets[aux] = {
				["name"] = value.name,
				["code"] = value.code,
				["mapId"] = value.mapId,
				["markersCoord"] = value.markersCoord,
				["localCoord"] = value.localCoord,
			}
			max = max + 1
			aux = aux + 1
		end
	end
	if max > 0 then
		local randInt = fastrandom(1, max)
		local pet = filterPets[randInt]
		if pet.markersCoord ~= nil then
			GoldMakers.AddPinToMinimap(pet.markersCoord, pet.mapId)
		end
		if pet.localCoord ~= nil and profiledb.tomtomwaypoints.enabled == true then
			GoldMakers.addTomTomWaypoint(pet.name, pet.mapId, pet.localCoord.x / 100, pet.localCoord.y / 100)
		end
		return pet
	else
		return false
	end
end

function GoldMakers:GenerateDungeon()
	local filterDgs = {}
	local max = 0
	local aux = 1
	for index, value in pairs (GoldMakers.Dungeons) do
		if profiledb.dungeons[index] ~= false then
			filterDgs[aux] = {
				["name"] = value.name,
			}
			max = max + 1
			aux = aux + 1
		end
	end
	if max > 0 then
		return filterDgs[fastrandom(1, max)]
	else
		return false
	end
end

function GoldMakers:GenerateMaterial()
	local filterMaterials = {}
	local max = 0
	local aux = 1
	for index, value in pairs (GoldMakers.Materials) do
		if profiledb.materials[index] ~= false then
			filterMaterials[aux] = {
				["name"] = value.name,
				["code"] = value.code,
				["mapId"] = value.mapId,
				["markersCoord"] = value.markersCoord,
				["localCoord"] = value.localCoord,
			}
			max = max + 1
			aux = aux + 1
		end
	end

	if max > 0 then
		local randInt = fastrandom(1, max)
		local material = filterMaterials[randInt]
		if material.markersCoord ~= nil then
			GoldMakers.AddPinToMinimap(material.markersCoord, material.mapId)
		end
		if material.localCoord ~= nil and profiledb.tomtomwaypoints.enabled == true then
			GoldMakers.addTomTomWaypoint(material.name, material.mapId, material.localCoord.x / 100, material.localCoord.y / 100)
		end
		return material
	else
		return false
	end
end

function GoldMakers:GenerateOpenWorld()
	local filterOpenWorldFarms = {}
	local max = 0
	local aux = 1
	for index, value in pairs (GoldMakers.OpenWorldFarms) do
		if profiledb.openworld[index] ~= false then
			filterOpenWorldFarms[aux] = {
				["name"] = value.name,
				["mapId"] = value.mapId,
				["markersCoord"] = value.markersCoord,
				["localCoord"] = value.localCoord,
			}
			max = max + 1
			aux = aux + 1
		end
	end

	if max > 0 then
		local randInt = fastrandom(1, max)
		local world = filterOpenWorldFarms[randInt]
		if world.markersCoord ~= nil then
			GoldMakers.AddPinToMinimap(world.markersCoord, world.mapId)
		end
		if world.localCoord ~= nil and profiledb.tomtomwaypoints.enabled == true then
			GoldMakers.addTomTomWaypoint(world.name, world.mapId, world.localCoord.x / 100, world.localCoord.y / 100)
		end
		return world
	else
		return false
	end
end

function GoldMakers:ShowMainUI()
	if profiledb.display == false then
		GoldMakers.mainUIShow(main)
		profiledb.display = true
	else
		GoldMakers.mainUIHide(main)
		profiledb.display = false
	end
end

-- Slash commands --
SLASH_GM1 = "/gm"
SlashCmdList["GM"] = GMSlashCmd