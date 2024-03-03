local Prop = nil

local function HandBags(object)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    RequestModel(object,false)
    repeat Wait(0) until HasModelLoaded(object)
    local prop = CreateObject(GetHashKey(object), coords.x, coords.y, coords.z, 1, 0, 1)
    SetEntityAsMissionEntity(prop,true,true)
    attached = true

    local xPos, yPos, zPos, xRot, yRot, zRot
    if object == "s_pursefancy01x" then
        xPos, yPos, zPos, xRot, yRot, zRot = 0.3, -0.0, 0.1, 69.8, 188.2, 90.0
    elseif object == "mp004_p_cs_jessicapurse01x" then
        xPos, yPos, zPos, xRot, yRot, zRot = 0.43, 0.02, 0.19, 69.4, 176.5, 89.8
    elseif object == "s_pursefancy02x" then
        xPos, yPos, zPos, xRot, yRot, zRot = 0.4, 0.02, 0.11, 69.8, 188.2, 90.0
    elseif object == "s_penelopepurse01x" then
        xPos, yPos, zPos, xRot, yRot, zRot = 0.35, -0.0, 0.1, 80.0, 180.0, 90.0
    elseif object == "p_bag01x" then
        xPos, yPos, zPos, xRot, yRot, zRot = 0.39, -0.0, 0.2, 66.0, 185.0, 95.0
    elseif object == "p_cs_bagstrauss01x" then
        xPos, yPos, zPos, xRot, yRot, zRot = 0.40, -0.0, 0.2, 70.0, 178.0, 95.0
    elseif object == "p_cane01x" then
        xPos, yPos, zPos, xRot, yRot, zRot = 0.9, -0.0, 0.38, 66.0, 182.0, 92.0
    elseif objet == "p_bag_leather_doctor" then
        xPos, yPos, zPos, xRot, yRot, zRot = 0.28, 0.03, 0.12, 70.0, 178.0, 95.0
    end
    
    AttachEntityToEntity(prop, player, GetEntityBoneIndexByName(player,"Skel_L_Hand"), xPos, yPos, zPos, xRot, yRot, zRot, true, true, false, true, 1, true)

    Prop = prop
end

RegisterNetEvent('prop:handbag', function(object) 
  HandBags(object)                   
end)


RegisterNetEvent('prop:handbag:delete', function() 
    if DoesEntityExist(Prop) then
        DeleteObject(Prop)
    end
    ClearPedTasks(PlayerPedId(),true,true)
end)