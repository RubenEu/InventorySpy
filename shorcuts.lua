
-- shorcuts.lua

function broadcast(message)
    -- Shorcut for send broadcasts
    cRoot:Get():BroadcastChat(message)
    return true
end
