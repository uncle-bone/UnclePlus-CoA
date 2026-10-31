UncleBone.GetMyRole = function()
  return UncleBone.myRole or "UNKNOWN"
end

local SendRoleInfo = function(newRole)
  WeakAuras.ScanEvents("WA_UncleBone_BACKEND", "ROLE_CHANGE", newRole)
end

local SaveRoleInfo = function(newRole)
  UncleBone.myRole = newRole
end

local function CheckUnitRole(unitID)
  local roleName = UncleBone.libGT ~= nil and UncleBone.libGT:GetUnitRole(unitID)
  return roleName or UNKNOWNOBJECT
end

local function OnRoleChange(unitId, newRole)
  if UnitIsUnit(unitId, "player") then
    local myRole = CheckUnitRole("player")

    SaveRoleInfo(myRole)
    SendRoleInfo(myRole)
  end
end

local function LibGroupTalents_Init()
  UncleBone.libGT = LibStub:GetLibrary("LibGroupTalents-1.0", true)

  if not UncleBone.libGT then
    local loaded, reason = LoadAddOn("LibGroupTalents-1.0")
    UncleBone.libGT = LibStub:GetLibrary("LibGroupTalents-1.0", true)
  end

  if UncleBone.libGT then
    function UncleBone:LibGroupTalents_RoleChange(e, guid, unitID, newRole, oldRole)
      WeakAuras.timer:ScheduleTimer(OnRoleChange, 0.5, unitID, newRole)
    end

    UncleBone.libGT.RegisterCallback(UncleBone, "LibGroupTalents_RoleChange")

    return true
  else
    DEFAULT_CHAT_FRAME:AddMessage(
      "[UncleBone Core]: Couldn't find LibGroupTalents-1.0. Download the lib to display talent required cooldowns."
    )
  end
end

LibGroupTalents_Init()
