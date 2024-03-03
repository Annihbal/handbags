local objects = {

    { object = "mp004_p_cs_jessicapurse01x", item = "purse1" },
    { object = "s_penelopepurse01x", item = "purse2" },
    { object = "s_pursefancy01x", item = "purse3" },
    { object = "s_pursefancy02x", item = "purse4" },
    { object = "p_bag01x", item = "sactravail" },
    { object = "p_cs_bagstrauss01x", item = "sacclasse" },
    { object = "p_bag_leather_doctor", item = "doctorbag" },
    { object = "p_cane01x", item = "cannedevieux" },
}

local used = true
for index, value in ipairs(objects) do

    exports.vorp_inventory:registerUsableItem(value.item, function(data)
        used = not used
        if not used then
           TriggerClientEvent('prop:handbag', data.source,value.object)
        else
            TriggerClientEvent('prop:handbag:delete', data.source)
        end
    end)
end
