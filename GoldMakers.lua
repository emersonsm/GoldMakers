GM = {}

function GMSlashCmd(arg)
	if arg ~= nil or arg ~= '' then
		local cmd = string.gsub(arg, "%s+", "")
		local max = 0
		if cmd == "pets" then
			for index, value in pairs (GM.RandomFarmPets) do
				max = max + 1
			end
			print(GM.RandomFarmPets[fastrandom(1, max)])
		elseif cmd == "dg" then
			for index, value in pairs (GM.RandomFarmDungeons) do
				max = max + 1
			end
			print(GM.RandomFarmDungeons[fastrandom(1, max)])
		elseif cmd == "mats" then
			for index, value in pairs (GM.RandomFarmMats) do
				max = max + 1
			end
			local randInt = fastrandom(1, max)
			print(GM.RandomFarmMats[randInt])
			if GM.MaterialsMarkers[randInt] ~= nil then
				GM.AddPinToMinimap(GM.MaterialsMarkers[randInt], GM.MaterialsMapId[randInt])
			end
		elseif cmd == "world" then
			for index, value in pairs (GM.RandomFarmOpenWorld) do
				max = max + 1
			end
			local randInt = fastrandom(1, max)
			print(GM.RandomFarmOpenWorld[randInt])
			if GM.OpenWorldMarkers[randInt] ~= nil then
				GM.AddPinToMinimap(GM.OpenWorldMarkers[randInt], GM.OpenWorldMapId[randInt])
			end
		else
			print("|cffffaa00 /gm pets|r - select a random pet to farm.")
			print("|cffffaa00 /gm dg|r - select a random dungeon to farm.")
			print("|cffffaa00 /gm mats|r - select a random mat to farm.")
			print("|cffffaa00 /gm world|r - select a random open world farm.")
		end
	else

		print("|cffffaa00 /gm pets|r - select a random pet to farm.")
		print("|cffffaa00 /gm dg|r - select a random dungeon to farm.")
		print("|cffffaa00 /gm mats|r - select a random mat to farm.")
		print("|cffffaa00 /gm world|r - select a random open world farm.")
	end
end

-- Slash commands --
SLASH_GM1 = "/gm"
SlashCmdList["GM"] = GMSlashCmd