local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
isTrackerOn = false
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A0_2 then
    return
  end
  L1_2 = A0_2.pid
  L2_2 = A0_2.label
  L3_2 = A0_2.job
  L4_2 = A0_2.coords
  L5_2 = A0_2.sprite
  L6_2 = A0_2.callsign
  L7_2 = GetPlayerPed
  L8_2 = L1_2
  L7_2 = L7_2(L8_2)
  L8_2 = GetBlipFromEntity
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  L9_2 = DoesBlipExist
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = NetworkIsPlayerActive
    L10_2 = L1_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      L9_2 = AddBlipForEntity
      L10_2 = L7_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        goto lbl_37
        L8_2 = L9_2 or L8_2
      end
    end
    L9_2 = AddBlipForCoord
    L10_2 = L4_2.x
    L11_2 = L4_2.y
    L12_2 = L4_2.z
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L8_2 = L9_2
    ::lbl_37::
    L9_2 = SetBlipSprite
    L10_2 = L8_2
    L11_2 = L5_2
    L9_2(L10_2, L11_2)
    L9_2 = SetBlipShowCone
    L10_2 = L8_2
    L11_2 = true
    L9_2(L10_2, L11_2)
    L9_2 = SetBlipRotation
    L10_2 = L8_2
    L11_2 = math
    L11_2 = L11_2.ceil
    L12_2 = L4_2.w
    L11_2, L12_2 = L11_2(L12_2)
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = SetBlipScale
    L10_2 = L8_2
    L11_2 = Config
    L11_2 = L11_2.BlipScale
    if not L11_2 then
      L11_2 = 1.0
    end
    L9_2(L10_2, L11_2)
    L9_2 = SetBlipColour
    L10_2 = L8_2
    L11_2 = Config
    L11_2 = L11_2.Sprites
    L11_2 = L11_2.Job
    L11_2 = L11_2[L3_2]
    if not L11_2 then
      L11_2 = 2
    end
    L9_2(L10_2, L11_2)
    L9_2 = SetBlipAsShortRange
    L10_2 = L8_2
    L11_2 = false
    L9_2(L10_2, L11_2)
    L9_2 = BeginTextCommandSetBlipName
    L10_2 = "STRING"
    L9_2(L10_2)
    L9_2 = AddTextComponentString
    L10_2 = L6_2
    L11_2 = " - "
    L12_2 = L2_2
    L10_2 = L10_2 .. L11_2 .. L12_2
    L9_2(L10_2)
    L9_2 = EndTextCommandSetBlipName
    L10_2 = L8_2
    L9_2(L10_2)
    L9_2 = L0_1
    L9_2 = #L9_2
    L10_2 = L9_2 + 1
    L9_2 = L0_1
    L9_2[L10_2] = L8_2
  end
  L9_2 = GetBlipFromEntity
  L10_2 = PlayerPedId
  L10_2, L11_2, L12_2 = L10_2()
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  if L9_2 == L8_2 then
    L9_2 = RemoveBlip
    L10_2 = L8_2
    L9_2(L10_2)
  end
end
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = L0_1
  if L0_2 then
    L0_2 = pairs
    L1_2 = L0_1
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = RemoveBlip
      L7_2 = L5_2
      L6_2(L7_2)
    end
  end
  L0_2 = {}
  L0_1 = L0_2
end
L3_1 = RegisterNetEvent
L4_1 = "kartik-mdt:client:changeTrackerStatus"
function L5_1(A0_2)
  local L1_2
  if A0_2 then
    isTrackerOn = true
  else
    isTrackerOn = false
    L1_2 = L2_1
    L1_2()
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "kartik-mdt:client:updateBlips"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = L2_1
  L1_2()
  L1_2 = isTrackerOn
  if not L1_2 then
    return
  end
  if not A0_2 then
    return
  end
  L1_2 = pairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = GetPlayerFromServerId
    L8_2 = L6_2.src
    L7_2 = L7_2(L8_2)
    L8_2 = L1_1
    L9_2 = {}
    L9_2.pid = L7_2
    L10_2 = L6_2.label
    L9_2.label = L10_2
    L10_2 = L6_2.job
    L9_2.job = L10_2
    L10_2 = L6_2.coords
    L9_2.coords = L10_2
    L10_2 = L6_2.sprite
    L9_2.sprite = L10_2
    L10_2 = L6_2.callsign
    L9_2.callsign = L10_2
    L8_2(L9_2)
  end
end
L3_1(L4_1, L5_1)
