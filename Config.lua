local GoldMakers = LibStub("AceAddon-3.0"):GetAddon("GoldMakers")
local Config = GoldMakers:NewModule("Config","AceEvent-3.0")
local acr = LibStub("AceConfigRegistry-3.0")
local acd = LibStub("AceConfigDialog-3.0")
local addon = GetAddOnMetadata(..., "Title")

optionsTable = {
	type = "group",
	order = 0,
	args = {
		dungeons = {
			order = 0,
			name = "Dungeons",
			type = "group",
			args = {
				heading = {
					order = 0,
					type = "description",
					name = "Keep selected those who will be in random dungeon draw feature.",
					width = "full",
				},
			},
		},
		openworld = {
			order = 1,
			name = "Open World",
			type = "group",
			args = {
				heading = {
					order = 0,
					type = "description",
					name = "Keep selected those who will be in random open world farm draw feature.",
					width = "full",
				},
			},
		},
		materials = {
			order = 2,
			name = "Materials",
			type = "group",
			args = {
				heading = {
					order = 0,
					type = "description",
					name = "Keep selected those who will be in random material farm draw feature.",
					width = "full",
				},
			},
		},
		pets = {
			order = 3,
			name = "Pets",
			type = "group",
			args = {
				heading = {
					order = 0,
					type = "description",
					name = "Keep selected those who will be in random pet farm draw feature.",
					width = "full",
				},
			},
		},
		settings = {
			order = 4,
			name = "Settings",
			type = "group",
			args = {
				minimap = {
					arg = "minimap",
					name = "Hide icon on minimap",
					type = "toggle",
					width = "full",
					order = 0,
					set = function(info, val)
						profiledb[info.arg].hide = val
						if profiledb[info.arg].hide == true then
							GoldMakers.icon:Hide(addon)
						else
							GoldMakers.icon:Show(addon)
						end
					end,
					get = function(info) return profiledb[info.arg].hide end
				},
				hide_boss_toast_loot = {
					arg = "hideBossToastLoot",
					name = "Hide Boss Toast Loot*",
					type = "toggle",
					width = "full",
					order = 1,
					set = function(info, val)
						if profiledb.dungeonconfig[info.arg] ~= val then
							optionsTable.args.settings.args.reload_ui.disabled = false
						else
							optionsTable.args.settings.args.reload_ui.disabled = true
						end
						profiledb.dungeonconfig[info.arg] = val
					end,
					get = function(info) return profiledb.dungeonconfig[info.arg] end
				},
				hide_boss_banner = {
					arg = "hideBossBanner",
					name = "Hide Boss Banner*",
					type = "toggle",
					width = "full",
					order = 2,
					set = function(info, val)
						if profiledb.dungeonconfig[info.arg] ~= val then
							optionsTable.args.settings.args.reload_ui.disabled = false
						else
							optionsTable.args.settings.args.reload_ui.disabled = true
						end
						profiledb.dungeonconfig[info.arg] = val
					end,
					get = function(info) return profiledb.dungeonconfig[info.arg] end
				},
				minimize_objectives = {
					arg = "minimizeObjectives",
					name = "Automatic minimize quests and dungeon objectives*",
					type = "toggle",
					width = "full",
					order = 3,
					set = function(info, val)
						if profiledb.dungeonconfig[info.arg] ~= val then
							optionsTable.args.settings.args.reload_ui.disabled = false
						else
							optionsTable.args.settings.args.reload_ui.disabled = true
						end
						profiledb.dungeonconfig[info.arg] = val
					end,
					get = function(info) return profiledb.dungeonconfig[info.arg] end
				},
				reload_ui = {
					order = 4,
					name = "Reload UI",
					desc = "Reload UI",
					descStyle = "inline",
					disabled = true,
					type = "execute",
					func = function() ReloadUI() end,
				},
				reload_ui_desc = {
					order = 5,
					name = "*Reload your UI to apply these configurations.",
					descStyle = "inline",
					type = "description",
				},
			},
		}
	}
}

function Config:OnInitialize()
	local db = profiledb
	for k, v in pairs(GoldMakers.Dungeons) do
		local dungeonOptions = {
			arg = k,
			name = v.name,
			type = "toggle",
			descStyle = "inline",
			order = k,
			set = function(info, val)
				db.dungeons[info.arg] = val
			end,
      		get = function(info) return db.dungeons[info.arg] end
		}
		dungeonOptions.disabled = false
		optionsTable.args.dungeons.args["dungeon" .. k] = dungeonOptions
	end
	for k, v in pairs(GoldMakers.OpenWorldFarms) do
		local openworldOptions = {
			arg = k,
			name = v.name,
			type = "toggle",
			descStyle = "inline",
			order = k,
			set = function(info, val)
				db.openworld[info.arg] = val
			end,
      		get = function(info) return db.openworld[info.arg] end
		}
		openworldOptions.disabled = false
		optionsTable.args.openworld.args["open world" .. k] = openworldOptions
	end
	for k, v in pairs(GoldMakers.Materials) do
		local materialOptions = {
			arg = k,
			name = v.name,
			type = "toggle",
			descStyle = "inline",
			order = k,
			set = function(info, val)
				db.materials[info.arg] = val
			end,
      		get = function(info) return db.materials[info.arg] end
		}
		materialOptions.disabled = false
		optionsTable.args.materials.args["materials" .. k] = materialOptions
	end
	for k, v in pairs(GoldMakers.Pets) do
		local petOptions = {
			arg = k,
			name = v.name,
			type = "toggle",
			descStyle = "inline",
			order = k,
			set = function(info, val)
				db.pets[info.arg] = val
			end,
      		get = function(info) return db.pets[info.arg] end
		}
		petOptions.disabled = false
		optionsTable.args.pets.args["pets" .. k] = petOptions
	end
	acr:RegisterOptionsTable("GoldMakers", optionsTable)
	acd:AddToBlizOptions("GoldMakers", "GoldMakers")
end