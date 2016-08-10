
-- main.lua

function Initialize(Plugin)
    -- Use the InfoReg shared library to process the Info.lua file:
    dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")
    
    -- Registering plugin
    Plugin:SetName(g_PluginInfo.Name)
    Plugin:SetVersion(g_PluginInfo.Version)

    -- Register commands handlers from Info.lua
    RegisterPluginInfoCommands()
    --RegisterPluginInfoConsoleCommands()

    -- Initializing in console
    LOG("Initialized: " .. g_PluginInfo.Name .. " v." .. g_PluginInfo.Version)

    return true
end


function OnDisable()
    LOG("Disabled " .. g_PluginInfo.Name .. " v." .. g_PluginInfo.Version)
end
