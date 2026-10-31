UncleBone.GetIconCropped = function(iconId, iconSize)
  if not iconId or iconId == "" then
    return ""
  end

  iconSize = iconSize or 14

  return ("|T%s:%d:%d:0:0:64:64:4:60:4:60|t"):format(iconId, iconSize, iconSize)
end
