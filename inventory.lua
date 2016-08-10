
-- inventory.lua

-- /inventory <player> open a window with the inventory of that player.
-- i = inventory slot
-- b = bar slot
-- a = armor slot
-- s = shield slot

-- Inventory representation:
-- i i i i i i i i i
-- i i i i i i i i i
-- i i i i i i i i i
--     a a a a
-- b b b b b b b b b

function HandleInventoryCommand(Split, a_Player)
    if Split[2] == nil then
        a_Player:SendMessageFailure("You have to select a user /inventory <user>")
        return true
    end

    -- Local variables
    local Window = {}
    local Player_inv = {}
    local OnSlotChanged
    local exception

    -- Local functions
    local getInventory = function(Player)
        if Player:GetName() == a_Player:GetName() then
            exception = true
            a_Player:SendMessageFailure("You can't inspect yourself.")
            return false
        end
        -- Defining Window.
        Window = cLuaWindow(cWindow.wtChest, 9, 5, Player:GetName() .. "'s inventory")

        -- Get inventory
        Player_inv = Player:GetInventory()

        -- Set inventory in window
        for i=0, 26, 1 do
            Window:SetSlot(a_Player, i, Player_inv:GetSlot(i+4))
        end
        -- Inventory bar
        for i=27, 35, 1 do
            Window:SetSlot(a_Player, i+9, Player_inv:GetSlot(i+4))
        end
        -- Armor bar
        for i=0, 3, 1 do
            Window:SetSlot(a_Player, i+29, Player_inv:GetSlot(i))
        end

        -- On slot changed.
        OnSlotChanged = function(a_Window, a_SlotNum)
            -- Modify inventory (Slot 4 to 26)
            if a_SlotNum >= 0 and a_SlotNum <= 26 then
                Player_inv:SetSlot(a_SlotNum+4, a_Window:GetSlot(a_Player, a_SlotNum))
            end
            -- Modify armor (Slot 0 to 4)
            if a_SlotNum >= 29 and a_SlotNum <= 32 then
                Player_inv:SetSlot(a_SlotNum-29, a_Window:GetSlot(a_Player, a_SlotNum))
            end
            -- Modify inventory bar (Slot 36 to 44)
            if a_SlotNum >= 36 and a_SlotNum <= 44 then
                Player_inv:SetSlot(a_SlotNum-5, a_Window:GetSlot(a_Player, a_SlotNum))
            end
        end

        return true
    end


    -- Find player and check if he is online/exists.
    Player_inspected = cRoot:Get():FindAndDoWithPlayer(Split[2], getInventory)
    if not Player_inspected then
        a_Player:SendMessageFailure("The selected user is offline or not exist.")
        return true
    end

    -- Catch if the user selected if yourself.
    -- There is a problem with the api and this and you can't change your inventory by your own at the same time that you use /inventory.
    if exception then
        return true
    end

    -- Finally, open the window
    Window:SetOnSlotChanged(OnSlotChanged)
    a_Player:OpenWindow(Window)
    return true
end
