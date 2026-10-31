local configRegistry = {}

UncleBone = UncleBone or {}

local function Log(message)
  --DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00[UncleBoneConfig]|r " .. tostring(message))
end

function UncleBone.SetConfig(configName, configTable)
  if type(configName) ~= "string" then
    Log("Invalid configName passed to SetConfig")
    return
  end
  if type(configTable) ~= "table" then
    Log("Invalid configTable passed to SetConfig")
    return
  end
  configRegistry[configName] = configTable
  Log("Config '" .. configName .. "' registered.")
end

function UncleBone.GetConfig(configName)
  if type(configName) ~= "string" then
    Log("Invalid configName passed to GetConfig")
    return nil
  end
  return configRegistry[configName]
end

function UncleBone.HasConfig(configName)
  return configRegistry[configName] ~= nil
end
