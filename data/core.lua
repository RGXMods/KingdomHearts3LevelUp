--=====================================================================================
-- KH3LU | KingdomHearts3LevelUp - core.lua
-- Version: 2.0.0
-- Author: DonnieDice
-- RGX Mods Collection - RealmGX Community Project
--=====================================================================================

local RGX = assert(_G.RGXFramework, "KH3LU: RGX-Framework not loaded")

KH3LU = KH3LU or {}

local ADDON_VERSION = "2.0.4"
local ADDON_NAME = "KingdomHearts3LevelUp"
local PREFIX = "|Tinterface/addons/KingdomHearts3LevelUp/media/icon:16:16|t - |cffffffff[|r|cffb2c8ffKH3LU|r|cffffffff]|r "
local TITLE = "|Tinterface/addons/KingdomHearts3LevelUp/media/icon:18:18|t [|cffb2c8ffK|r|cffffffffingdom Hearts 3|r |cffb2c8ffL|r|cffffffffevel|r |cffb2c8ffU|r|cffb2c8ffp|r|cffb2c8ff!|r]"

KH3LU.version = ADDON_VERSION
KH3LU.addonName = ADDON_NAME

local Sound = RGX:GetSound()

local handle = Sound:Register(ADDON_NAME, {
sounds = {
high = "Interface\\Addons\\KingdomHearts3LevelUp\\sounds\\kingdom_hearts_3_high.ogg",
medium = "Interface\\Addons\\KingdomHearts3LevelUp\\sounds\\kingdom_hearts_3_med.ogg",
low = "Interface\\Addons\\KingdomHearts3LevelUp\\sounds\\kingdom_hearts_3_low.ogg",
},
defaultSoundId = 569593,
savedVar = "KH3LUSettings",
defaults = {
enabled = true,
soundVariant = "medium",
muteDefault = true,
showWelcome = true,
volume = "Master",
firstRun = true,
},
triggerEvent = "PLAYER_LEVEL_UP",
addonVersion = ADDON_VERSION,
})

KH3LU.handle = handle

local L = KH3LU.L or {}
local initialized = false

local function ShowHelp()
print(PREFIX .. " " .. (L["HELP_HEADER"] or ""))
print(PREFIX .. " " .. (L["HELP_TEST"] or ""))
print(PREFIX .. " " .. (L["HELP_ENABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_DISABLE"] or ""))
print(PREFIX .. " |cffffffff/kh3lu high|r - Use high quality sound")
print(PREFIX .. " |cffffffff/kh3lu med|r - Use medium quality sound")
print(PREFIX .. " |cffffffff/kh3lu low|r - Use low quality sound")
end

local function HandleSlashCommand(args)
local command = string.lower(args or "")
if command == "" or command == "help" then
ShowHelp()
elseif command == "test" then
print(PREFIX .. " " .. (L["PLAYING_TEST"] or ""))
handle:Test()
elseif command == "enable" then
handle:Enable()
print(PREFIX .. " " .. (L["ADDON_ENABLED"] or ""))
elseif command == "disable" then
handle:Disable()
print(PREFIX .. " " .. (L["ADDON_DISABLED"] or ""))
elseif command == "high" then
handle:SetVariant("high")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "high"))
elseif command == "med" or command == "medium" then
handle:SetVariant("medium")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "medium"))
elseif command == "low" then
handle:SetVariant("low")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "low"))
else
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. (L["ERROR_UNKNOWN_COMMAND"] or ""))
end
end

RGX:RegisterEvent("ADDON_LOADED", function(event, addonName)
if addonName ~= ADDON_NAME then return end
handle:SetLocale(KH3LU.L)
L = KH3LU.L or {}
handle:Init()
initialized = true
end, "KH3LU_ADDON_LOADED")

RGX:RegisterEvent("PLAYER_LEVEL_UP", function()
if initialized then
handle:Play()
end
end, "KH3LU_PLAYER_LEVEL_UP")

RGX:RegisterEvent("PLAYER_LOGIN", function()
if not initialized then
handle:SetLocale(KH3LU.L)
L = KH3LU.L or {}
handle:Init()
initialized = true
end
handle:ShowWelcome(PREFIX, TITLE)
end, "KH3LU_PLAYER_LOGIN")

RGX:RegisterEvent("PLAYER_LOGOUT", function()
handle:Logout()
end, "KH3LU_PLAYER_LOGOUT")

RGX:RegisterSlashCommand("kh3lu", function(msg)
local ok, err = pcall(HandleSlashCommand, msg)
if not ok then
print(PREFIX .. " |cffff0000KH3LU Error:|r " .. tostring(err))
end
end, "KH3LU_SLASH")
