
-- info.lua

g_PluginInfo = {
    Name = "CommandBook(BETA)",
    Description = "Plugin that includes a lot of commands for the regular use.",
    Version = 0.1,
    
    Commands = {
        ["/inventory"] =
        {
            Permission = "cb.inventory",
            HelpString = "Open the inventary of the other player.",
            Handler = HandleInventoryCommand,
            Alias = { "/invsee", "/inv" }
        },
    },
    
    Permissions =
    {
        ["cb.inventory"] =
        {
            Description = "Allows to open others users inventories and modify them.",
            RecommendedGroups = "Admins, mods"
        },
    }
}
