
-- main.lua

function Initialize(Plugin)
    -- Use the InfoReg shared library to process the Info.lua file:
    dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")

    -- Registering plugin
    Plugin:SetName(g_PluginInfo.Name)
    Plugin:SetVersion(g_PluginInfo.Version)
    
    -- Adding hooks
    --cPluginManager:AddHook(cPluginManager.HOOK_TICK, f_MobHealth)
    
    -- Load only if the .lua file is placed in the directory.
    RegisterPluginInfoCommands()
    --RegisterPluginInfoConsoleCommands()
    
    -- Initializing in console
    LOG("Initialized: " .. g_PluginInfo.Name .. " v." .. g_PluginInfo.Version)

    -- Ending plugin
    return true
end


function OnDisable()
    LOG("Disabled " .. g_PluginInfo.Name .. " v." .. g_PluginInfo.Version)
end



