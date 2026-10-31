local WeakAuras = WeakAuras

local GetTime = GetTime
local select = select
local GetSpellInfo = GetSpellInfo
local UnitCastingInfo = UnitCastingInfo
local UnitChannelInfo = UnitChannelInfo
local UnitAura = UnitAura

local myClass = select(2, UnitClass("player"))
local reso = ({ GetScreenResolutions() })[GetCurrentResolution()]
local w, h = strsplit("x", reso)
local screenWidth, screenHeight = tonumber(w), tonumber(h)
local resolution = screenWidth >= 2560 and "QUAD_HD" or "FULL_HD"

UncleBone.myClass = myClass

local WA_GetUnitAura = function(unit, spell, filter)
  if filter and not filter:upper():find("FUL") then
    filter = filter .. "|HELPFUL"
  end
  for i = 1, 255 do
    local name, _, _, _, _, _, _, _, _, _, spellId = UnitAura(unit, i, filter)
    if not name then
      return
    end
    if spell == spellId or spell == name then
      return UnitAura(unit, i, filter)
    end
  end
end

local WA_GetUnitBuff = function(unit, spell, filter)
  filter = filter and filter .. "|HELPFUL" or "HELPFUL"
  return WA_GetUnitAura(unit, spell, filter)
end

local WA_GetUnitDebuff = function(unit, spell, filter)
  filter = filter and filter .. "|HARMFUL" or "HARMFUL"
  return WA_GetUnitAura(unit, spell, filter)
end

local function GetProfileResolution()
  return resolution
end

UncleBone.Round = function(number, decimals)
  return (("%%.%df"):format(decimals)):format(number)
end

UncleBone.GetIconCropped = function(iconPath, iconSize, fullIconPath)
  local cropped
  if fullIconPath then
    cropped = "|T" .. fullIconPath .. ":" .. iconSize .. ":" .. iconSize .. ":0:0:64:64:4:60:4:60|t"
  else
    cropped = "|TInterface\\Icons\\" .. iconPath .. ":" .. iconSize .. ":" .. iconSize .. ":0:0:64:64:4:60:4:60|t"
  end
  return cropped
end

UncleBone.GetShortColoredName = function(name, class, len)
  local shortName = string.sub(name, 1, len)
  local classColor = RAID_CLASS_COLORS[class]
  if not classColor then
    return shortName
  end
  return string.format("|cff%02x%02x%02x%s|r", classColor.r * 255, classColor.g * 255, classColor.b * 255, shortName)
end

-- Clickable Reminder
UncleBone.SetButtonTemplate = function(aura_env, buttonName, type, context)
  if WeakAuras.IsOptionsOpen() then
    return
  end
  if not aura_env then
    return
  end
  if UnitAffectingCombat("player") then
    return
  end

  local r = WeakAuras.GetRegion(aura_env.id)
  if not aura_env.button then
    aura_env.button = CreateFrame("Button", buttonName, r, "SecureActionButtonTemplate")
  end

  aura_env.button:SetParent(r)
  aura_env.button:SetAllPoints()
  aura_env.button:RegisterForClicks("AnyUp")
  aura_env.button:SetAttribute("type", type)
  if type == "macro" then
    aura_env.button:SetAttribute("macrotext1", context)
  elseif type == "item" then
    aura_env.button:SetAttribute("item", "item:" .. context)
  elseif type == "spell" then
    local spell = GetSpellInfo(context)
    aura_env.button:SetAttribute("spell", spell)
  end
  aura_env.button:Show()
end

UncleBone.DropdownMenuState = function(aura_env, buttonEvent, a, e)
  local curTime = GetTime()
  if e == "DROPDOWN_MENU_INITIALIZED" then
    aura_env.optionsClosed = curTime
  elseif aura_env.optionsClosed and (curTime - aura_env.optionsClosed > 0.1) then
    if e == buttonEvent then
      if curTime - aura_env.last < 0.5 then
        return
      end
      aura_env.last = curTime
      if a[""] then
        a[""].show = false
        a[""].changed = true
      else
        a[""] = {
          show = true,
          changed = true,
          progressType = "timed",
          duration = 10,
          expirationTime = 10 + GetTime(),
          autoHide = true,
        }
      end
      return true
    end
  end
end

UncleBone.CenteredHorizontal = function(newPositions, activeRegions, spacing, sizes, maxIcons)
  local totalIcons = #activeRegions

  if WeakAuras.IsOptionsOpen() and maxIcons then
    totalIcons = math.min(totalIcons, maxIcons)
  end

  local iconWidth = sizes.w
  local iconHeight = sizes.h
  local totalWidth = totalIcons * iconWidth + (totalIcons - 1) * spacing
  local startX = -totalWidth / 2 + iconWidth / 2

  for i = 1, totalIcons do
    local region = activeRegions[i]
    local xPos = startX + (i - 1) * (iconWidth + spacing)

    region.region:SetRegionWidth(iconWidth)
    region.region:SetRegionHeight(iconHeight)

    newPositions[i] = { xPos, 0 }
  end
end

UncleBone.GridDown = function(newPositions, activeRegions, spacing, sizes, maxIconsPerRow, maxIcons)
  local iconHeightFirstRow = sizes[1].h
  local iconWidthFirstRow = sizes[1].w
  local iconHeightSecondRow = sizes[2].h
  local iconWidthSecondRow = sizes[2].w

  local totalIcons = math.min(#activeRegions, maxIcons)
  local iconsInFirstRow = math.min(maxIconsPerRow, totalIcons)
  local iconsInSecondRow = math.min(maxIconsPerRow, totalIcons - iconsInFirstRow)

  local offsetFirstRow = (iconsInFirstRow * (iconWidthFirstRow + spacing)) / 2 - (iconWidthFirstRow + spacing) / 2
  local offsetSecondRow = (iconsInSecondRow * (iconWidthSecondRow + spacing)) / 2 - (iconWidthSecondRow + spacing) / 2

  for i, region in ipairs(activeRegions) do
    if i > maxIcons then
      break
    end

    local row = math.floor((i - 1) / maxIconsPerRow)
    local col = (i - 1) % maxIconsPerRow

    if row == 0 then
      region.region:SetRegionWidth(iconWidthFirstRow)
      region.region:SetRegionHeight(iconHeightFirstRow)
      newPositions[i] = { col * (iconWidthFirstRow + spacing) - offsetFirstRow, 0 }
    else
      region.region:SetRegionWidth(iconWidthSecondRow)
      region.region:SetRegionHeight(iconHeightSecondRow)
      newPositions[i] = { col * (iconWidthSecondRow + spacing) - offsetSecondRow, -(iconHeightFirstRow + spacing) }
    end
  end
end

UncleBone.GridUp = function(newPositions, activeRegions, spacing, maxIconsPerRow, iconSize, maxIcons)
  local iconSize = (GetProfileResolution() == "QUAD_HD" and iconSize[2]) or iconSize[1]

  local totalIcons = math.min(#activeRegions, maxIcons)

  for i, region in ipairs(activeRegions) do
    if i > maxIcons then
      break
    end

    -- Determine row and column for each icon
    local row = math.floor((i - 1) / maxIconsPerRow)
    local col = (i - 1) % maxIconsPerRow

    -- Calculate the number of icons in the current row
    local iconsInRow = math.min(maxIconsPerRow, totalIcons - row * maxIconsPerRow)

    -- Horizontal offset to center the current row
    local horizontalOffset = (iconsInRow * (iconSize + spacing)) / 2 - (iconSize + spacing) / 2

    -- Calculate positions
    local x = col * (iconSize + spacing) - horizontalOffset
    local y = row * (iconSize + spacing) -- Rows grow upwards without vertical centering

    region.region:SetRegionWidth(iconSize)
    region.region:SetRegionHeight(iconSize)
    newPositions[i] = { x, y }
  end
end

--- Anticlip Check
local channelMain = {
  ["WARLOCK"] = select(1, GetSpellInfo(47855)),
  ["PRIEST"] = select(1, GetSpellInfo(48156)),
}

local channelSpell = channelMain[myClass]

local IsSafeToCast = function(unitId, debuffs, isCast)
  if not UnitExists(unitId) then
    return
  end

  local debuffName, dur, expTime
  for _, spellId in ipairs(debuffs) do
    local spellName = GetSpellInfo(spellId)
    debuffName, _, _, _, _, dur, expTime = WA_GetUnitDebuff(unitId, spellName, "PLAYER|HARMFUL")
    if debuffName then
      break
    end
  end

  if not debuffName then
    return true
  end

  local remDebuffTime = expTime - GetTime()

  -- Cast Time of given Spell if is Cast
  local castTime = isCast and select(7, GetSpellInfo(debuffName)) / 1000 or 0

  local isCasting, _, _, _, _, endTimeMS = UnitCastingInfo("player")

  if isCasting then
    -- Cast Time Remaining
    local remCastTime = (endTimeMS / 1000) - GetTime()
    return (castTime + remCastTime) > remDebuffTime
  end

  isCasting, _, _, _, startTimeMS, endTimeMS = UnitChannelInfo("player")

  if isCasting then
    local remCastTime = (endTimeMS / 1000) - GetTime()

    -- We prefer to calculate the time til next Drain Soul tick on Warlocks
    if isCasting == channelSpell and myClass == "WARLOCK" then
      local totalChannelTime = (endTimeMS - startTimeMS) / 1000
      local tilNextTick = remCastTime % (totalChannelTime / 5)
      return (tilNextTick + castTime) > remDebuffTime
    end

    return (castTime + remCastTime) > remDebuffTime
  end

  -- GCD check
  local s, d = GetSpellCooldown(61304)
  if s == 0 then
    return castTime > remDebuffTime
  end
  return (castTime + s + d - GetTime()) > remDebuffTime
end

UncleBone.AnticlipCheck = function(a, unitId, debuffs, isCast)
  if IsSafeToCast(unitId, debuffs, isCast) then
    if not a[""] then
      a[""] = {
        show = true,
        changed = true,
      }
      return true
    end
  elseif a[""] then
    a[""].show = false
    a[""].changed = true
    return true
  end
end
