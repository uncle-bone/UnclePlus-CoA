-- UnclePlus Options & Media Registration
-- Comments in English as requested.

local _, UnclePlus = ...

local AceDBOptions = LibStub("AceDBOptions-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConsole = LibStub("AceConsole-3.0")
local LSM = LibStub("LibSharedMedia-3.0")
local Locale = GetLocale()
local L = UnclePlus.L

UnclePlus.GetDefaultFont = function(type)
  local toc = select(4, GetBuildInfo())
  return (Locale == "zhTW" or Locale == "zhCN" or toc == 38000) and "CN Merged (SF-Yahee)"
    or (type == "bold" and "SFUIDisplayCondensed-Bold" or "SFUIDisplayCondensed-Semibold")
end

UnclePlus.GetDefaultRaidFont = function(type)
  local toc = select(4, GetBuildInfo())
  return (Locale == "zhTW" or Locale == "zhCN" or toc == 38000) and "CN Merged (SF-Yahee)"
    or (type == "bold" and "PT Sans Narrow Bold" or "PT Sans Narrow")
end

UncleBone.GetDefaultFont = UnclePlus.GetDefaultFont
UncleBone.GetDefaultRaidFont = UnclePlus.GetDefaultRaidFont

UnclePlus.defaults = {
  profile = {
    pullStartTime = 0,
    pullExpTime = 0,
    pullTotalTime = 0,
    pullSenderName = "Unknown",
    breakStartTime = 0,
    breakExpTime = 0,
    breakTotalTime = 0,
    breakSenderName = "Unknown",
    lfgStartTimer = 0,
    lfgExpTimer = 0,

    font1 = UnclePlus.GetDefaultFont(),
    font2 = UnclePlus.GetDefaultFont("bold"),
    font3 = UnclePlus.GetDefaultRaidFont(),
    font4 = UnclePlus.GetDefaultRaidFont("bold"),
    bar1 = "UncleBoneMainDark",
    bar2 = "UncleBoneMain",
    bar3 = "UncleBoneMainDark",
  },
}

-- Helper to access the active profile table safely
function UnclePlus:GetDB()
  return (self.db and self.db.profile) or UnclePlus.defaults.profile
end

-- Build and register all options (Blizzard panels + standalone window + slash commands)
function UnclePlus:SetupOptions()
  local version = GetAddOnMetadata("UnclePlus", "Version") or "?"

  -- ==== Media lists (LSM) ====
  local function GetFontList()
    local fonts = {}
    local excluded = {
      ["UncleBone Font 1"] = true,
      ["UncleBone Font 2"] = true,
      ["UncleBone Raid Font"] = true,
      ["UncleBone Raid Font (Bold)"] = true,
    }
    for name in pairs(LSM:HashTable("font")) do
      if not excluded[name] then
        fonts[name] = name
      end
    end
    return fonts
  end

  local function GetStatusBarList()
    local bars = {}
    local excluded = {
      ["UncleBone Status Bar 1"] = true,
      ["UncleBone Status Bar 2"] = true,
      ["UncleBone Raid Status Bar"] = true,
    }
    for name in pairs(LSM:HashTable("statusbar")) do
      if not excluded[name] then
        bars[name] = name
      end
    end
    return bars
  end

  -- ==== UI reload popup ====
  local function ConfirmReload()
    StaticPopupDialogs["UnclePlus_RELOAD_UI"] = {
      text = L["A reload of the interface is required for this change to take effect.\n\nReload now?"],
      button1 = YES,
      button2 = NO,
      OnAccept = function()
        ReloadUI()
      end,
      timeout = 0,
      whileDead = true,
      hideOnEscape = true,
      preferredIndex = 3,
    }
    StaticPopup_Show("UnclePlus_RELOAD_UI")
  end

  -- ==== Root (Blizzard top-level) ====
  local mainOptions = {
    type = "group",
    name = "UnclePlus v" .. version,
    args = {
      version = {
        type = "description",
        name = "|cff00ccff" .. L["Version:"] .. "|r" .. version,
        fontSize = "medium",
        order = 1,
      },
      author = {
        type = "description",
        name = L["Author: "] .. "UncleBone",
        fontSize = "medium",
        order = 2,
      },
      spacer = { type = "description", name = " ", order = 3 },
      description = {
        type = "description",
        name = L["UnclePlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other UncleBone UI components."],
        fontSize = "large",
        order = 4,
      },
      spacer2 = { type = "description", name = " ", order = 5 },
    },
  }

  -- ==== Media ====
  local mediaOptions = {
    type = "group",
    name = L["Media"],
    args = {
      description = {
        type = "description",
        name = L["Change primary fonts and status bar textures used by UncleBone features. A UI reload is required."],
        fontSize = "medium",
        order = 0,
      },
    },
  }

  local fontNames = { "UncleBone Font 1", "UncleBone Font 2", "UncleBone Raid Font", "UncleBone Raid Font (Bold)" }
  local barNames = { "UncleBone Status Bar 1", "UncleBone Status Bar 2", "UncleBone Raid Status Bar" }

  for i = 1, #fontNames do
    mediaOptions.args["font" .. i] = {
      type = "select",
      name = fontNames[i],
      desc = L["Select font for element "] .. i,
      values = GetFontList,
      get = function()
        return self.db.profile["font" .. i]
      end,
      set = function(_, v)
        self.db.profile["font" .. i] = v
        ConfirmReload()
      end,
      dialogControl = "LSM30_Font",
      order = i + 1,
    }
  end
  for i = 1, #barNames do
    mediaOptions.args["bar" .. i] = {
      type = "select",
      name = barNames[i],
      desc = L["Select status bar texture for element "] .. i,
      values = GetStatusBarList,
      get = function()
        return self.db.profile["bar" .. i]
      end,
      set = function(_, v)
        self.db.profile["bar" .. i] = v
        ConfirmReload()
      end,
      dialogControl = "LSM30_Statusbar",
      order = i + 10,
    }
  end

  -- ==== Profiles (AceDB) ====
  local profilesOptions = AceDBOptions:GetOptionsTable(self.db)
  profilesOptions.name = L["Profiles"] or "Profiles" -- ensure the node has a name

  -- ==== Register Blizzard panels (left AddOns pane) ====
  AceConfigRegistry:RegisterOptionsTable("UnclePlus", mainOptions)
  self.optionsFrame = AceConfigDialog:AddToBlizOptions("UnclePlus", "UnclePlus v" .. version)

  AceConfigRegistry:RegisterOptionsTable("UnclePlus_Media", mediaOptions)
  AceConfigDialog:AddToBlizOptions("UnclePlus_Media", "Media", "UnclePlus v" .. version)

  AceConfigRegistry:RegisterOptionsTable("UnclePlus_Profiles", profilesOptions)
  AceConfigDialog:AddToBlizOptions("UnclePlus_Profiles", "Profiles", "UnclePlus v" .. version)

  -- ==== Standalone window (own AceConfigDialog frame) ====
  -- IMPORTANT: include whole profilesOptions object, not just .args, to keep its handler intact.
  local standaloneOptions = {
    type = "group",
    name = "UnclePlus v" .. version,
    childGroups = "tree",
    args = {
      media = (function()
        mediaOptions.order = 10
        mediaOptions.childGroups = nil
        return mediaOptions
      end)(),
      profiles = (function()
        profilesOptions.order = 100
        return profilesOptions
      end)(),
    },
  }

  AceConfigRegistry:RegisterOptionsTable("UnclePlus_Standalone", standaloneOptions)
  AceConfigDialog:SetDefaultSize("UnclePlus_Standalone", 700, 500)

  -- Toggle standalone and optionally preselect section/subtab
  function UnclePlus:ToggleStandalone(which, sub)
    local ACD = AceConfigDialog
    if ACD.OpenFrames and ACD.OpenFrames["UnclePlus_Standalone"] then
      ACD:Close("UnclePlus_Standalone")
    else
      ACD:Open("UnclePlus_Standalone")
    end
    if which == "media" or which == "raid" or which == "profiles" then
      if which == "raid" and sub then
        ACD:SelectGroup("UnclePlus_Standalone", "raid", sub)
      else
        ACD:SelectGroup("UnclePlus_Standalone", which)
      end
    end

    if which == "media" or which == "profiles" then
      ACD:SelectGroup("UnclePlus_Standalone", which)
    end
  end

  -- ==== Slash commands ====
  local function _norm(msg)
    return strlower(strtrim(msg or ""))
  end

  -- /UnclePlus [media|profiles]
  AceConsole:RegisterChatCommand("UnclePlus", function(msg)
    msg = _norm(msg)
    local which, sub = strmatch(msg, "^(%S+)%s+(%S+)$")
    which = which or msg
    if which == "media" or which == "profiles" then
      UnclePlus:ToggleStandalone(which)
    else
      UnclePlus:ToggleStandalone(nil)
    end
  end)

  AceConsole:RegisterChatCommand("mp", function(msg)
    msg = _norm(msg)
    local which, sub = strmatch(msg, "^(%S+)%s+(%S+)$")
    which = which or msg
    if which == "media" or which == "profiles" then
      UnclePlus:ToggleStandalone(which)
    else
      UnclePlus:ToggleStandalone(nil)
    end
  end)
end

-- ==== Media registration ====
function UnclePlus:RegisterCustomFonts()
  local db = self:GetDB()
  local fonts = {
    { key = "font1", name = "UncleBone Font 1" },
    { key = "font2", name = "UncleBone Font 2" },
    { key = "font3", name = "UncleBone Raid Font" },
    { key = "font4", name = "UncleBone Raid Font (Bold)" },
  }
  for _, f in ipairs(fonts) do
    local path = LSM:Fetch("font", db[f.key], true)
    if path then
      LSM:Register(
        "font",
        f.name,
        path,
        LSM.LOCALE_BIT_western + LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_koKR + LSM.LOCALE_BIT_zhCN + LSM.LOCALE_BIT_zhTW
      )
    else
      -- print(string.format("|cffff0000[UnclePlus]|r Failed to register %s - invalid font path", f.name))
    end
  end
end

function UnclePlus:RegisterCustomBars()
  local db = self:GetDB()
  local bars = {
    { key = "bar1", name = "UncleBone Status Bar 1" },
    { key = "bar2", name = "UncleBone Status Bar 2" },
    { key = "bar3", name = "UncleBone Raid Status Bar" },
  }
  for _, b in ipairs(bars) do
    local path = LSM:Fetch("statusbar", db[b.key], true)
    if path then
      LSM:Register("statusbar", b.name, path)
    else
      -- print(string.format("|cffff0000[UnclePlus]|r Failed to register %s - invalid status bar path", b.name))
    end
  end
end

-- Mirror current selection under alias names for other addons/WA to consume
function UnclePlus:RegisterMediaAliasesFromCallback()
  local db = self:GetDB()

  local fontMap = {
    { key = db.font1, alias = "UncleBone Font 1" },
    { key = db.font2, alias = "UncleBone Font 2" },
    { key = db.font3, alias = "UncleBone Raid Font" },
    { key = db.font4, alias = "UncleBone Raid Font (Bold)" },
  }
  local barMap = {
    { key = db.bar1, alias = "UncleBone Status Bar 1" },
    { key = db.bar2, alias = "UncleBone Status Bar 2" },
    { key = db.bar3, alias = "UncleBone Raid Status Bar" },
  }

  LSM.RegisterCallback(self, "LibSharedMedia_Registered", function(_, mediatype, key)
    if mediatype == "font" then
      for _, e in ipairs(fontMap) do
        if e.key == key then
          local path = LSM:Fetch("font", e.key)
          if path then
            LSM:Register(
              "font",
              e.alias,
              path,
              LSM.LOCALE_BIT_western
                + LSM.LOCALE_BIT_ruRU
                + LSM.LOCALE_BIT_koKR
                + LSM.LOCALE_BIT_zhCN
                + LSM.LOCALE_BIT_zhTW
            )
          end
        end
      end
    elseif mediatype == "statusbar" or mediatype == "statusbar_atlas" then
      for _, e in ipairs(barMap) do
        if e.key == key then
          local path = LSM:Fetch("statusbar", e.key)
          if path then
            LSM:Register("statusbar", e.alias, path)
          end
        end
      end
    end
  end)
end
