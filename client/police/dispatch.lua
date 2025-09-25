local L0_1, L1_1, L2_1
dispatchSilent = false
L0_1 = RegisterNUICallback
L1_1 = "fetchActiveUnits"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:fetchActiveUnitsHere"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "getRadioChannels"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:getRadioChannels"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "createRadioChannels"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:createRadioChannels"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "joinLeaveRadio"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:joinLeaveRadio"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "assignRadioNumber"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:assignRadioNumber"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "renameChannelName"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:renameChannelName"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "deleteRadioChannel"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:deleteRadioChannel"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "getActiveIncidents"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:getActiveIncidents"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = pairs
      L4_2 = L2_2.incidents
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
        L9_2 = L8_2.location
        if not L9_2 then
          L9_2 = GetStreetNameAtCoord
          L10_2 = L8_2.x
          L11_2 = L8_2.y
          L12_2 = L8_2.z
          L9_2, L10_2 = L9_2(L10_2, L11_2, L12_2)
          L11_2 = GetStreetNameFromHashKey
          L12_2 = L9_2
          L11_2 = L11_2(L12_2)
          L8_2.location = L11_2
        end
      end
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "attachUnitToIncident"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:attachUnitToIncident"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "detachUnit"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:detachUnit"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "deleteDispatchIncident"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:deleteDispatchIncident"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "setWaypoint"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A0_2 then
    L2_2 = A0_2.x
    if L2_2 then
      L2_2 = A0_2.y
      if L2_2 then
        L2_2 = SetNewWaypoint
        L3_2 = A0_2.x
        L4_2 = A0_2.y
        L2_2(L3_2, L4_2)
        L2_2 = A1_2
        L3_2 = {}
        L3_2.success = true
        L2_2(L3_2)
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "kartik-mdt:client:sendDispatchNotification"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = IsPauseMenuActive
  L1_2 = L1_2()
  if L1_2 then
    return
  end
  L1_2 = dispatchSilent
  if L1_2 then
    return
  end
  if A0_2 then
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.action = "addDispatchCall"
    L2_2.data = A0_2
    L1_2(L2_2)
    L1_2 = A0_2.sound
    if L1_2 then
      L1_2 = PlaySound
      if L1_2 then
        L1_2 = PlaySound
        L2_2 = A0_2.sound
        L1_2(L2_2)
      end
    end
    L1_2 = A0_2.blip
    if L1_2 then
      L1_2 = createBlip
      L2_2 = A0_2
      L1_2(L2_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "kartik-mdt:client:sendReplyDispatchNotification"
function L2_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.action = "showDispatchCall"
    L2_2.data = A0_2
    L1_2(L2_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "attachUnitToUnit"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:attachUnitToUnit"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "detachUnitFromUnit"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:detachUnitFromUnit"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "getUnitAttachments"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "kartik-mdt:server:GetUnitAttachments"
  L4_2 = false
  L5_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    L3_2 = A1_2
    L4_2 = L2_2
    L3_2(L4_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "fetchDispatchSilentMode"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = dispatchSilent
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "setDispatchSilentMode"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  if A0_2 then
    L2_2 = A0_2.isSilent
    dispatchSilent = L2_2
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
end
L0_1(L1_1, L2_1)
