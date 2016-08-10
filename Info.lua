
-- info.lua

g_PluginInfo = {
    Name = "InventorySpy",
    Description = "Plugin for see the inventory of other player and modify it.",
    Version = 0.1,
    
    Commands = {
        ["/inventory"] =
        {
            Permission = "invspy.inventory",
            HelpString = "Open the inventary of the other player.",
            Handler = HandleInventoryCommand,
            Alias = { "/invsee", "/inv" }
        },
    },
    
    Permissions =
    {
        ["invspy.inventory"] =
        {
            Description = "Allows to open others users inventories and modify them.",
            RecommendedGroups = "Admins, mods"
        },
    }
}
