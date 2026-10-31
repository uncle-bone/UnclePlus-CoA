local _, UnclePlus = ...
UnclePlus = LibStub("AceAddon-3.0"):NewAddon(UnclePlus, "UnclePlus", "AceEvent-3.0")

UnclePlus.BuildInfo = select(4, GetBuildInfo())

function UnclePlus:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("UnclePlusSaved", UnclePlus.defaults, true)
  self:RegisterCustomFonts()
  self:RegisterCustomBars()
  self:RegisterMediaAliasesFromCallback()
  self:RegisterFonts()
  self:RegisterBars()
  self:SetupOptions()
end

function UnclePlus:OnEnable() end

UncleBone = UncleBone or {}

UncleBone.L = GetLocale()
UncleBone.ForcedSoundLoc = false

local supportedLoc = {
  ["ruRU"] = true,
  ["enUS"] = true,
  ["zhCN"] = true,
}

UncleBone.GetLocale = function()
  if UncleBone.ForcedSoundLoc then
    return UncleBone.ForcedSoundLoc
  elseif not supportedLoc[UncleBone.L] then
    return "enUS"
  else
    return UncleBone.L
  end
end
