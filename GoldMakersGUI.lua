local AceGUI = LibStub("AceGUI-3.0")
local GoldMakers = LibStub("AceAddon-3.0"):GetAddon("GoldMakers")
local addon = GetAddOnMetadata(..., "Title")
local versionAddon = GetAddOnMetadata(..., "version")

function GoldMakers.mainUI()
    local window = AceGUI:Create("Window")
    window:SetLayout("Flow")
    window:SetTitle(addon .. " v" .. versionAddon .. " - Random Farm Generator")
    window:SetWidth(465)
    window:SetHeight(100)
    window:EnableResize(false)
    window:SetCallback("OnClose",
        function()
            profiledb.display = false
        end
    )

    local output = AceGUI:Create("SimpleGroup")
    output:SetLayout("flow")
    output:SetFullWidth(true)
    output:SetFullHeight(true)

    local buttonDungeon = AceGUI:Create("Button")
    buttonDungeon:SetText("Dungeon")
    buttonDungeon:SetWidth(110)
    buttonDungeon:SetCallback("OnClick",
        function()
            local container = output:GetUserData("container")
            if container then
                output:ReleaseChildren()

                local output = AceGUI:Create("SimpleGroup")
                output:SetLayout("flow")
                output:SetFullWidth(true)
            end

            local label = AceGUI:Create("Label")
            label:SetHeight(50)
            label:SetFullWidth(true)
            label:SetJustifyH("CENTER")
            local dungeon = GoldMakers:GenerateDungeon()
            if dungeon ~= false then
                local data = "You have been chosen to farm |cffff9933" .. dungeon.name .. "|r"
                label:SetText(data)
                output:SetUserData("container", data)
                output:AddChild(label)
            else
                local data = "You need to select some dungeons on addon configurations."
                label:SetText(data)
                output:SetUserData("container", data)
                output:AddChild(label)
            end
        end
    )

    local buttonOpenWorld = AceGUI:Create("Button")
    buttonOpenWorld:SetText("Open World")
    buttonOpenWorld:SetWidth(110)
    buttonOpenWorld:SetCallback("OnClick",
        function()
            local container = output:GetUserData("container")
            if container then
                output:ReleaseChildren()

                local output = AceGUI:Create("SimpleGroup")
                output:SetLayout("flow")
                output:SetFullWidth(true)
            end

            local label = AceGUI:Create("InteractiveLabel")
            label:SetHeight(50)
            label:SetFullWidth(true)
            label:SetJustifyH("CENTER")
            local world = GoldMakers:GenerateOpenWorld()
            if world ~= false then
                local data = "You have been chosen to farm |cffff9933" .. world.name .. "|r"
                label:SetText(data)
                output:SetUserData("container", data)
                output:AddChild(label)
            else
                local data = "You need to select some open world farms on addon configurations."
                label:SetText(data)
                output:SetUserData("container", data)
                output:AddChild(label)
            end
        end
    )

    local buttonMaterial = AceGUI:Create("Button")
    buttonMaterial:SetText("Material")
    buttonMaterial:SetWidth(110)
    buttonMaterial:SetCallback("OnClick",
        function()
            local container = output:GetUserData("container")
            if container then
                output:ReleaseChildren()

                local output = AceGUI:Create("SimpleGroup")
                output:SetLayout("flow")
                output:SetFullWidth(true)
            end

            local label = AceGUI:Create("InteractiveLabel")
            label:SetHeight(50)
            label:SetFullWidth(true)
            label:SetJustifyH("CENTER")
            local material = GoldMakers:GenerateMaterial()
            if material ~= false then
                local data = "You have been chosen to farm " .. material.name
                label:SetCallback("OnEnter",
                    function()
                        GameTooltip:SetOwner(label.frame, "ANCHOR_CURSOR")
                        GameTooltip:SetHyperlink(material.code)
                        GameTooltip:Show()
                    end
                
                )
                label:SetCallback("OnLeave", 
                    function()
                        GameTooltip:Hide()
                    end
                )
                label:SetText(data)
                output:SetUserData("container", data)
                output:AddChild(label)
            else
                local data = "You need to select some materials on addon configurations."
                label:SetText(data)
                output:SetUserData("container", data)
                output:AddChild(label)
            end
        end
    )

    local buttonPet = AceGUI:Create("Button")
    buttonPet:SetText("Pet")
    buttonPet:SetWidth(110)
    buttonPet:SetCallback("OnClick",
        function()
            local container = output:GetUserData("container")
            if container then
                output:ReleaseChildren()

                local output = AceGUI:Create("SimpleGroup")
                output:SetLayout("flow")
                output:SetFullWidth(true)
            end

            local label = AceGUI:Create("InteractiveLabel")
            label:SetHeight(50)
            label:SetFullWidth(true)
            label:SetJustifyH("CENTER")
            local pet = GoldMakers:GeneratePet()
            if pet ~= false then
                local data = "You have been chosen to farm " .. pet.name
                label:SetCallback("OnEnter",
                    function()
                        GameTooltip:SetOwner(label.frame, "ANCHOR_CURSOR")
                        local _, speciesID, level, breedQuality = strsplit(":", pet.code)
                        BattlePetToolTip_Show(tonumber(speciesID), tonumber(level), tonumber(breedQuality))
                    end
                )
                label:SetCallback("OnLeave",
                    function()
                        BattlePetTooltip:Hide()
                    end
                )
                label:SetText(data)
                output:SetUserData("container", data)
                output:AddChild(label)
            else
                local data = "You need to select some pets on addon configurations."
                label:SetText(data)
                output:SetUserData("container", data)
                output:AddChild(label)
            end
        end
    )

    window:AddChild(buttonDungeon)
    window:AddChild(buttonOpenWorld)
    window:AddChild(buttonMaterial)
    window:AddChild(buttonPet)
    window:AddChild(output)

    window:Hide()

    return window
end

function GoldMakers.mainUIHide(window)
    window:Hide()
end

function GoldMakers.mainUIShow(window)
    window:Show()
end