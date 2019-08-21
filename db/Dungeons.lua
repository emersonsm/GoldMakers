local GoldMakers = LibStub("AceAddon-3.0"):GetAddon("GoldMakers")
GoldMakers.Dungeons = {
	[1] = {
		["name"] = "Blackfathom Deeps",
		["location"] = "World > Azeroth > Kalimdor > Ashenvale"
	},
	[2] = {
		["name"] = "Blackrock Depths",
		["location"] = "World > Azeroth > Eastern Kingdoms > Searing Gorge"
	},
	[3] = {
		["name"] = "Deadmines",
		["location"] = "World > Azeroth > Eastern Kingdoms > Westfall"
	},
	[4] = {
		["name"] = "Dire Maul",
		["location"] = "World > Azeroth > Kalimdor > Feralas"
	},
	[5] = {
		["name"] = "Gnomeregan",
		["location"] = "World > Azeroth > Eastern Kingdoms > Dun Morogh"
	},
	[6] = {
		["name"] = "Lower Blackrock Spire",
		["location"] = "World > Azeroth > Eastern Kingdoms > Burning Steppes"
	},
	[7] = {
		["name"] = "Maraudon",
		["location"] = "World > Azeroth > Kalimdor > Desolace"
	},
	[8] = {
		["name"] = "Ragefire Chasm",
		["location"] = "World > Azeroth > Kalimdor > Orgrimmar"
	},
	[9] = {
		["name"] = "Razorfen Downs",
		["location"] = "World > Azeroth > Kalimdor > Thousand Needles"
	},
	[10] = {
		["name"] = "Razorfen Kraul",
		["location"] = "World > Azeroth > Kalimdor > Southern Barrens"
	},
	[11] = {
		["name"] = "Scarlet Halls",
		["location"] = "World > Azeroth > Eastern Kingdoms > Tirisfal Glades"
	},
	[12] = {
		["name"] = "Scarlet Monastery",
		["location"] = "World > Azeroth > Eastern Kingdoms > Tirisfal Glades"
	},
	[13] = {
		["name"] = "Scholomance",
		["location"] = "World > Azeroth > Eastern Kingdoms > Western Plaguelands"
	},
	[14] = {
		["name"] = "Shadowfang Keep",
		["location"] = "World > Azeroth > Eastern Kingdoms > Silverpine Forest"
	},
	[15] = {
		["name"] = "Stratholme",
		["location"] = "World > Azeroth > Eastern Kingdoms > Eastern Plaguelands"
	},
	[16] = {
		["name"] = "The Stockade",
		["location"] = "World > Azeroth > Eastern Kingdoms > Stormwind City"
	},
	[17] = {
		["name"] = "The Temple of Atal'hakkar",
		["location"] = "World > Azeroth > Eastern Kingdoms > Swamp of Sorrows"
	},
	[18] = {
		["name"] = "Uldaman",
		["location"] = "World > Azeroth > Eastern Kingdoms > Badlands"
	},
	[19] = {
		["name"] = "Wailing Caverns",
		["location"] = "World > Azeroth > Kalimdor > Northern Barrens"
	},
	[20] = {
		["name"] = "Zul'Farrak",
		["location"] = "World > Azeroth > Kalimdor > Tanaris"
	},
	[21] = {
		["name"] = "Auchenai Crypts",
		["location"] = "World > Outland > Terokkar Forest"
	},
	[22] = {
		["name"] = "Hellfire Ramparts",
		["location"] = "World > Outland > Hellfire Peninsula"
	},
	[23] = {
		["name"] = "Magisters' Terrace",
		["location"] = "World > Azeroth > Eastern Kingdoms > Isle of Quel'Danas"
	},
	[24] = {
		["name"] = "Mana-Tombs",
		["location"] = "World > Outland > Terokkar Forest"
	},
	[25] = {
		["name"] = "Old Hillsbrad Foothills",
		["location"] = "World > Azeroth > Kalimdor > Tanaris > Caverns of Time"
	},
	[26] = {
		["name"] = "Setherekk Halls",
		["location"] = "World > Outland > Terokkar Forest"
	},
	[27] = {
		["name"] = "Shadow Labyrinth",
		["location"] = "World > Outland > Terokkar Forest"
	},
	[28] = {
		["name"] = "The Arcatraz",
		["location"] = "World > Outland > Netherstorm"
	},
	[29] = {
		["name"] = "The Black Morass",
		["location"] = "World > Azeroth > Kalimdor > Tanaris > Caverns of Time"
	},
	[30] = {
		["name"] = "The Blood Furnace",
		["location"] = "World > Outland > Hellfire Peninsula"
	},
	[31] = {
		["name"] = "The Botanica",
		["location"] = "World > Outland > Netherstorm"
	},
	[32] = {
		["name"] = "The Mechanar",
		["location"] = "World > Outland > Netherstorm"
	},
	[33] = {
		["name"] = "The Shattered Halls",
		["location"] = "World > Outland > Hellfire Peninsula"
	},
	[34] = {
		["name"] = "The Slave Pens",
		["location"] = "World > Outland > Zangarmarsh"
	},
	[35] = {
		["name"] = "The Steamvault",
		["location"] = "World > Outland > Zangarmarsh"
	},
	[36] = {
		["name"] = "The Underbog",
		["location"] = "World > Outland > Zangarmarsh"
	},
	[37] = {
		["name"] = "Ahn'kahet: The Old Kingdom",
		["location"] = "World > Azeroth > Northrend > Dragonblight"
	},
	[38] = {
		["name"] = "Azjol-Nerub",
		["location"] = "World > Azeroth > Northrend > Dragonblight"
	},
	[39] = {
		["name"] = "Drak'Tharon Keep",
		["location"] = "World > Azeroth > Northrend > Zul'Drak"
	},
	[40] = {
		["name"] = "Gundrak",
		["location"] = "World > Azeroth > Northrend > Zul'Drak"
	},
	[41] = {
		["name"] = "Halls of Lightning",
		["location"] = "World > Azeroth > Northrend > The Storm Peaks"
	},
	[42] = {
		["name"] = "Halls of Reflection",
		["location"] = "World > Azeroth > Northrend > Icecrown"
	},
	[43] = {
		["name"] = "Halls of Stone",
		["location"] = "World > Azeroth > Northrend > The Storm Peaks"
	},
	[44] = {
		["name"] = "Pit of Saron",
		["location"] = "World > Azeroth > Northrend > Icecrown"
	},
	[45] = {
		["name"] = "The Culling of Stratholme",
		["location"] = "World > Azeroth > Kalimdor > Tanaris > The Culling of Stratholme"
	},
	[46] = {
		["name"] = "The Forge of Souls",
		["location"] = "World > Azeroth > Northrend > Icecrown"
	},
	[47] = {
		["name"] = "The Nexus",
		["location"] = "World > Azeroth > Northrend > Borean Tundra"
	},
	[48] = {
		["name"] = "The Oculus",
		["location"] = "World > Azeroth > Northrend > Borean Tundra"
	},
	[49] = {
		["name"] = "The Violet Hold",
		["location"] = "World > Azeroth > Northrend > Crystalsong Forest > Dalaran"
	},
	[50] = {
		["name"] = "Trial of the Champion",
		["location"] = "World > Azeroth > Northrend > Icecrown"
	},
	[51] = {
		["name"] = "Utgarde Keep",
		["location"] = "World > Azeroth > Northrend > Howling Fjord"
	},
	[52] = {
		["name"] = "Utgarde Pinnacle",
		["location"] = "World > Azeroth > Northrend > Howling Fjord"
	},
	[53] = {
		["name"] = "Blackrock Caverns",
		["location"] = "World > Azeroth > Eastern Kingdoms > Burning Steppes"
	},
	[54] = {
		["name"] = "End Time",
		["location"] = "World > Azeroth > Kalimdor > Tanaris > End Time"
	},
	[55] = {
		["name"] = "Grim Batol",
		["location"] = "World > Azeroth > Eastern Kingdoms > Twilight Highlands"
	},
	[56] = {
		["name"] = "Halls of Origination",
		["location"] = "World > Azeroth > Kalimdor > Uldum"
	},
	[57] = {
		["name"] = "Hour of Twilight",
		["location"] = "World > Azeroth > Kalimdor > Tanaris"
	},
	[58] = {
		["name"] = "Lost City of the Tol'vir",
		["location"] = "World > Azeroth > Kalimdor > Uldum"
	},
	[59] = {
		["name"] = "The Stonecore",
		["location"] = "World > Azeroth > Deepholm"
	},
	[60] = {
		["name"] = "The Vortex Pinnacle",
		["location"] = "World > Azeroth > Kalimdor > Uldum"
	},
	[61] = {
		["name"] = "Throne of the Tides",
		["location"] = "World > Azeroth > Eastern Kingdoms > Vashj'ir > Abyssal Depths"
	},
	[62] = {
		["name"] = "Well of Eternity",
		["location"] = "World > Azeroth > Kalimdor > Tanaris"
	},
	[63] = {
		["name"] = "Zul'Aman",
		["location"] = "World > Azeroth > Eastern Kingdoms > Ghostlands"
	},
	[64] = {
		["name"] = "Zul'Gurub",
		["location"] = "World > Azeroth > Eastern Kingdoms > Stranglethorn Vale > Northern Stranglethorn"
	},
	[65] = {
		["name"] = "Gate of the Setting Sun",
		["location"] = "World > Azeroth > Pandaria > Vale of Eternal Blossoms"
	},
	[66] = {
		["name"] = "Mogu'shan Palace",
		["location"] = "World > Azeroth > Pandaria > Vale of Eternal Blossoms"
	},
	[67] = {
		["name"] = "Shado-Pan Monastery",
		["location"] = "World > Azeroth > Pandaria > Kun-Lai Summit"
	},
	[68] = {
		["name"] = "Siege of Niuzao Temple",
		["location"] = "World > Azeroth > Pandaria > Townlong Steppes > Siege of Niuzao Temple"
	},
	[69] = {
		["name"] = "Stormstout Brewery",
		["location"] = "World > Azeroth > Pandaria > Valley of the Four Winds"
	},
	[70] = {
		["name"] = "Temple of the Jade Serpent",
		["location"] = "World > Azeroth > Pandaria > The Jade Forest"
	},
	[71] = {
		["name"] = "Bloodmaul Slag Mines",
		["location"] = "World > Draenor > Frostfire Ridge"
	},
	[72] = {
		["name"] = "Grimrail Depot",
		["location"] = "World > Draenor > Gorgrond"
	},
	[73] = {
		["name"] = "Iron Docks",
		["location"] = "World > Draenor > Gorgrond"
	},
	[74] = {
		["name"] = "Shadowmoon Burial Grounds",
		["location"] = "World > Draenor > Shadowmoon Valley"
	},
	[75] = {
		["name"] = "Skyreach",
		["location"] = "World > Draenor > Spires of Arak"
	},
	[76] = {
		["name"] = "The Everbloom",
		["location"] = "World > Draenor > Gorgrond"
	},
	[77] = {
		["name"] = "Upper Blackrock Spire",
		["location"] = "World > Azeroth > Eastern Kingdoms > Burning Steppes"
	},
	[78] = {
		["name"] = "Assault on Violet Hold",
		["location"] = "World > Azeroth > Broken Isles > Dalaran"
	},
	[79] = {
		["name"] = "Black Rook Hold",
		["location"] = "World > Azeroth > Broken Isles > Val'sharah"
	},
	[80] = {
		["name"] = "Cathedral of Eternal Night",
		["location"] = "World > Azeroth > Broken Isles > Broken Shore"
	},
	[81] = {
		["name"] = "Court of Stars",
		["location"] = "World > Azeroth > Broken Isles > Suramar"
	},
	[82] = {
		["name"] = "Darkheart Thicket",
		["location"] = "World > Azeroth > Broken Isles > Val'sharah"
	},
	[83] = {
		["name"] = "Eye of Azshara",
		["location"] = "World > Azeroth > Broken Isles > Azsuna"
	},
	[84] = {
		["name"] = "Halls of Valor",
		["location"] = "World > Azeroth > Broken Isles > Stormheim > Halls of Valor"
	},
	[85] = {
		["name"] = "Helmouth Cliffs",
		["location"] = "World > Azeroth > Broken Isles > Stormheim"
	},
	[86] = {
		["name"] = "Neltharion's Lair",
		["location"] = "World > Azeroth > Broken Isles > Highmountain"
	},
	[87] = {
		["name"] = "Return to Karazhan",
		["location"] = "World > Azeroth > Eastern Kingdoms > Deadwind Pass"
	},
	[88] = {
		["name"] = "The Seat of the Triumvirate",
		["location"] = "World > Azeroth > Broken Isles > Argus > Mac'Aree"
	},
	[89] = {
		["name"] = "The Arcway",
		["location"] = "World > Azeroth > Broken Isles > Suramar"
	},
	[90] = {
		["name"] = "Vault of the Wardens",
		["location"] = "World > Azeroth > Broken Isles > Azsuna"
	},
	[91] = {
		["name"] = "Atal'Dazar",
		["location"] = "World > Azeroth > Zandalar > Zuldazar"
	},
	[92] = {
		["name"] = "Freehold",
		["location"] = "World > Azeroth > Kul Tiras > Tiragarde Sound"
	},
	[93] = {
		["name"] = "Kings' Rest",
		["location"] = "World > Azeroth > Zandalar > Zuldazar"
	},
	[94] = {
		["name"] = "Operation: Mechagon",
		["location"] = "World > Azeroth > Kul Tiras"
	},
	[95] = {
		["name"] = "Shrine of the Storm",
		["location"] = "World > Azeroth > Kul Tiras > Stormsong Valley"
	},
	[96] = {
		["name"] = "Siege of Boralus",
		["location"] = "World > Azeroth > Kul Tiras > Tiragarde Sound"
	},
	[97] = {
		["name"] = "Temple of Sethraliss",
		["location"] = "World > Azeroth > Zandalar > Vol'dun"
	},
	[98] = {
		["name"] = "The MOTHERLODE!!",
		["location"] = "World > Azeroth > The Maelstrom > Kezan"
	},
	[99] = {
		["name"] = "The Underrot",
		["location"] = "World > Azeroth > Zandalar > Nazmir"
	},
	[100] = {
		["name"] = "Tol Dagor",
		["location"] = "World > Azeroth > Kul Tiras > Tiragarde Sound"
	},
	[101] = {
		["name"] = "Waycrest Manor",
		["location"] = "World > Azeroth > Kul Tiras > Drustvar"
	},
};