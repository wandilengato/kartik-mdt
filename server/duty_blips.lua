local L0_1, L1_1, L2_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
if "kartik-mdt" ~= L0_1 then
  return
end
L0_1 = {}
blipPlayers = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetPlayerData
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = L1_2.citizenId
  L3_2 = blipPlayers
  L3_2 = L3_2[L2_2]
  if L3_2 then
    L3_2 = blipPlayers
    L3_2[L2_2] = nil
    L3_2 = Player
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L3_2 = L3_2.state
    L4_2 = L3_2
    L3_2 = L3_2.set
    L5_2 = "duty_blips"
    L6_2 = nil
    L7_2 = true
    L3_2(L4_2, L5_2, L6_2, L7_2)
    return L2_2
  end
  L3_2 = false
  return L3_2
end
removePlayerBlip = L0_1
L0_1 = RegisterNetEvent
L1_1 = "kartik-mdt:server:removePlayerBlip"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = source
  L1_2 = removePlayerBlip
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = TriggerClientEvent
  L2_2 = "kartik-mdt:client:changeTrackerStatus"
  L3_2 = L0_2
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = blipPlayers
  L4_2 = L4_2[A3_2]
  if L4_2 then
    L4_2 = blipPlayers
    L4_2[A3_2] = nil
    L4_2 = TriggerClientEvent
    L5_2 = "ox_lib:notify"
    L6_2 = A0_2
    L7_2 = {}
    L7_2.title = "Tracker Deactivated"
    L7_2.message = "Your tracker has been deactivated. You can no longer be tracked by your team."
    L7_2.type = "error"
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = TriggerClientEvent
    L5_2 = "kartik-mdt:client:changeTrackerStatus"
    L6_2 = A0_2
    L7_2 = false
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Player
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2.state
    L5_2 = L4_2
    L4_2 = L4_2.set
    L6_2 = "duty_blips"
    L7_2 = nil
    L8_2 = true
    L4_2(L5_2, L6_2, L7_2, L8_2)
    return A3_2
  else
    L4_2 = GetCallsign
    L5_2 = A3_2
    L4_2 = L4_2(L5_2)
    L5_2 = blipPlayers
    L6_2 = {}
    L6_2.identifier = A3_2
    L6_2.src = A0_2
    L7_2 = A1_2 or L7_2
    if not A1_2 then
      L7_2 = "Undefined"
    end
    L6_2.label = L7_2
    L7_2 = A2_2 or L7_2
    if not A2_2 then
      L7_2 = "unemployed"
    end
    L6_2.job = L7_2
    L6_2.callsign = L4_2
    L5_2[A3_2] = L6_2
    L5_2 = TriggerClientEvent
    L6_2 = "ox_lib:notify"
    L7_2 = A0_2
    L8_2 = {}
    L8_2.title = "Tracker Activated"
    L8_2.description = "Your tracker has been activated. You can now be tracked by your team."
    L8_2.type = "success"
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = TriggerClientEvent
    L6_2 = "kartik-mdt:client:changeTrackerStatus"
    L7_2 = A0_2
    L8_2 = true
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = blipPlayers
    L5_2 = L5_2[A3_2]
    return L5_2
  end
end
TogglePlayer = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetVehicleType
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = Config
  L2_2 = L2_2.Sprites
  L2_2 = L2_2.Vehicle
  L2_2 = L2_2[L1_2]
  if not L2_2 then
    L2_2 = Config
    L2_2 = L2_2.Sprites
    L2_2 = L2_2.Vehicle
    L2_2 = L2_2.other
  end
  return L2_2
end
GetBlipPerVehicle = L0_1
L0_1 = CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  while true do
    L0_2 = Wait
    L1_2 = Config
    L1_2 = L1_2.UpdateInterval
    L0_2(L1_2)
    L0_2 = blipPlayers
    if L0_2 then
      L0_2 = {}
      L1_2 = pairs
      L2_2 = blipPlayers
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L7_2 = GetPlayerPed
        L8_2 = L6_2.src
        L7_2 = L7_2(L8_2)
        L8_2 = GetVehiclePedIsIn
        L9_2 = L7_2
        L10_2 = false
        L8_2 = L8_2(L9_2, L10_2)
        if 0 ~= L8_2 then
          L9_2 = GetBlipPerVehicle
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          if L9_2 then
            goto lbl_29
          end
        end
        L9_2 = 1
        ::lbl_29::
        L10_2 = GetEntityCoords
        L11_2 = L7_2
        L10_2 = L10_2(L11_2)
        L11_2 = GetEntityHeading
        L12_2 = L7_2
        L11_2 = L11_2(L12_2)
        L12_2 = {}
        L13_2 = L6_2.src
        L12_2.src = L13_2
        L13_2 = L6_2.label
        L12_2.label = L13_2
        L13_2 = L6_2.job
        L12_2.job = L13_2
        L13_2 = L6_2.callsign
        L12_2.callsign = L13_2
        L13_2 = vec4
        L14_2 = L10_2.x
        L15_2 = L10_2.y
        L16_2 = L10_2.z
        L17_2 = L11_2
        L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
        L12_2.coords = L13_2
        L12_2.sprite = L9_2
        L13_2 = #L0_2
        L13_2 = L13_2 + 1
        L0_2[L13_2] = L12_2
      end
      L1_2 = TriggerClientEvent
      L2_2 = "kartik-mdt:client:updateBlips"
      L3_2 = -1
      L4_2 = L0_2
      L1_2(L2_2, L3_2, L4_2)
    end
  end
end
L0_1(L1_1)
