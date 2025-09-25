local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = {}
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = GetNumResources
  L1_2 = L1_2()
  L2_2 = 0
  L3_2 = L1_2 - 1
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = GetResourceByFindIndex
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 == A0_2 then
      L7_2 = GetResourceState
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if "started" == L7_2 then
        L7_2 = true
        return L7_2
      end
    end
  end
  L2_2 = false
  return L2_2
end
detectCore = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = ipairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      if A0_2 == L12_2 then
        return L5_2
      end
    end
  end
  L1_2 = false
  return L1_2
end
getDepartmentCategory = L2_1
function L2_1()
  local L0_2, L1_2
  L0_2 = GetEntityHeading
  L1_2 = cache
  L1_2 = L1_2.ped
  L0_2 = L0_2(L1_2)
  L1_2 = 315
  if L0_2 >= L1_2 or L0_2 < 45 then
    L1_2 = "North Bound"
    return L1_2
  else
    if L0_2 >= 45 then
      L1_2 = 135
      if L0_2 < L1_2 then
        L1_2 = "West Bound"
        return L1_2
    end
    else
      L1_2 = 135
      if L0_2 >= L1_2 then
        L1_2 = 225
        if L0_2 < L1_2 then
          L1_2 = "South Bound"
          return L1_2
      end
      else
        L1_2 = 225
        if L0_2 >= L1_2 then
          L1_2 = 315
          if L0_2 < L1_2 then
            L1_2 = "East Bound"
            return L1_2
          end
        end
      end
    end
  end
end
GetPlayerHeading = L2_1
function L2_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.Debug
  if L0_2 then
    L0_2 = true
    return L0_2
  end
  L0_2 = Config
  L0_2 = L0_2.NoDispatchNotificationJobs
  L1_2 = getCurrentJob
  L1_2 = L1_2()
  L1_2 = L1_2.job
  L0_2 = L0_2[L1_2]
  if L0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = true
  return L1_2
end
shouldTriggerNotification = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetVehicleColours
  L2_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2)
  L3_2 = Config
  L3_2 = L3_2.Colors
  L4_2 = tostring
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2[L4_2]
  L4_2 = Config
  L4_2 = L4_2.Colors
  L5_2 = tostring
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2[L5_2]
  if L3_2 and L4_2 then
    L5_2 = L4_2
    L6_2 = " on "
    L7_2 = L3_2
    L5_2 = L5_2 .. L6_2 .. L7_2
    return L5_2
  elseif L3_2 then
    return L3_2
  elseif L4_2 then
    return L4_2
  else
    L5_2 = "Unknown"
    return L5_2
  end
end
getVehicleColor = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = 0
  L2_2 = GetEntityBoneIndexByName
  L3_2 = A0_2
  L4_2 = "door_pside_f"
  L2_2 = L2_2(L3_2, L4_2)
  if -1 ~= L2_2 then
    L1_2 = L1_2 + 1
  end
  L2_2 = GetEntityBoneIndexByName
  L3_2 = A0_2
  L4_2 = "door_pside_r"
  L2_2 = L2_2(L3_2, L4_2)
  if -1 ~= L2_2 then
    L1_2 = L1_2 + 1
  end
  L2_2 = GetEntityBoneIndexByName
  L3_2 = A0_2
  L4_2 = "door_dside_f"
  L2_2 = L2_2(L3_2, L4_2)
  if -1 ~= L2_2 then
    L1_2 = L1_2 + 1
  end
  L2_2 = GetEntityBoneIndexByName
  L3_2 = A0_2
  L4_2 = "door_dside_r"
  L2_2 = L2_2(L3_2, L4_2)
  if -1 ~= L2_2 then
    L1_2 = L1_2 + 1
  end
  if 2 == L1_2 then
    L1_2 = "Two door"
  elseif 3 == L1_2 then
    L1_2 = "Three door"
  elseif 4 == L1_2 then
    L1_2 = "Four door"
  else
    L1_2 = "unknown"
  end
  return L1_2
end
getVehicleDoors = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = {}
  L2_2 = {}
  L2_2[0] = "Compact"
  L2_2[1] = "Sedan"
  L2_2[2] = "SUVs"
  L2_2[3] = "Coupes"
  L2_2[4] = "Muscle"
  L2_2[5] = "Sport Classic"
  L2_2[6] = "Sports"
  L2_2[7] = "Super"
  L2_2[8] = "Motorcycle"
  L2_2[9] = "Offroad"
  L2_2[10] = "Industrial"
  L2_2[11] = "Utility"
  L2_2[12] = "Van"
  L2_2[17] = "Service"
  L2_2[19] = "Military"
  L2_2[20] = "Truck"
  L3_2 = GetVehicleClass
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = L2_2[L3_2]
  if not L3_2 then
    L3_2 = "Unknown"
  end
  L1_2.class = L3_2
  L3_2 = getVehicleDisplayName
  L4_2 = GetEntityModel
  L5_2 = A0_2
  L4_2, L5_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2)
  L1_2.name = L3_2
  L3_2 = GetVehicleNumberPlateText
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L1_2.plate = L3_2
  L3_2 = getVehicleDoors
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L1_2.doors = L3_2
  L3_2 = getVehicleColor
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L1_2.color = L3_2
  L3_2 = NetworkGetNetworkIdFromEntity
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L1_2.id = L3_2
  L3_2 = GetPlayerHeading
  L3_2 = L3_2()
  L1_2.heading = L3_2
  return L1_2
end
GetVehicleData = L2_1
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = GetSelectedPedWeapon
  L1_2 = cache
  L1_2 = L1_2.ped
  L0_2 = L0_2(L1_2)
  L1_2 = Config
  L1_2 = L1_2.weaponTable
  L1_2 = L1_2[L0_2]
  if not L1_2 then
    L1_2 = getWeaponDisplayName
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = GetLabelText
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      if not L1_2 then
        L1_2 = "Unknown"
      end
    end
  end
  return L1_2
end
GetWeaponName = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getCurrentJob
  L1_2 = L1_2()
  L1_2 = L1_2.job
  L2_2 = getCurrentJobRank
  L2_2 = L2_2()
  L2_2 = L2_2.rank
  if not L1_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = GetSanitizedPermissions
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = next
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_24
    end
  end
  L4_2 = false
  do return L4_2 end
  ::lbl_24::
  L4_2 = L3_2.Pages
  L4_2 = L4_2[A0_2]
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = L3_2.Pages
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2.view
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = true
  return L4_2
end
isActionAllowed = L2_1
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = lib
  L0_2 = L0_2.inputDialog
  L1_2 = "Police Evidence"
  L2_2 = {}
  L3_2 = "Serial No"
  L2_2[1] = L3_2
  L0_2 = L0_2(L1_2, L2_2)
  if not L0_2 then
    return
  end
  L1_2 = L0_2[1]
  if not L1_2 then
    return
  end
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = tostring
  L3_2 = L0_2[1]
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = GetEvidenceStashId
  if L2_2 then
    L2_2 = GetEvidenceStashId
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_33
    end
  end
  L2_2 = "evidence_"
  L3_2 = L1_2
  L2_2 = L2_2 .. L3_2
  ::lbl_33::
  L3_2 = OpenStash
  L4_2 = L2_2
  L3_2(L4_2)
end
openEvidenceLocker = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = getCurrentJob
  L1_2 = L1_2()
  L1_2 = L1_2.job
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    if L1_2 == L8_2 then
      L9_2 = true
      return L9_2
    end
  end
  L3_2 = false
  return L3_2
end
HasJobAuth = L2_1
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = AddBlipForCoord
  L6_2 = A0_2.x
  L7_2 = A0_2.y
  L8_2 = A0_2.z
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = AddBlipForRadius
  L7_2 = A0_2.x
  L8_2 = A0_2.y
  L9_2 = A0_2.z
  L10_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L7_2 = SetBlipSprite
  L8_2 = L5_2
  L9_2 = A2_2 or L9_2
  if not A2_2 then
    L9_2 = 161
  end
  L7_2(L8_2, L9_2)
  L7_2 = SetBlipHighDetail
  L8_2 = L5_2
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = SetBlipScale
  L8_2 = L5_2
  L9_2 = A4_2 or L9_2
  if not A4_2 then
    L9_2 = 1.0
  end
  L7_2(L8_2, L9_2)
  L7_2 = SetBlipColour
  L8_2 = L5_2
  L9_2 = A3_2 or L9_2
  if not A3_2 then
    L9_2 = 84
  end
  L7_2(L8_2, L9_2)
  L7_2 = SetBlipAlpha
  L8_2 = L5_2
  L9_2 = 255
  L7_2(L8_2, L9_2)
  L7_2 = SetBlipAsShortRange
  L8_2 = L5_2
  L9_2 = false
  L7_2(L8_2, L9_2)
  L7_2 = SetBlipCategory
  L8_2 = L5_2
  L9_2 = 2
  L7_2(L8_2, L9_2)
  L7_2 = SetBlipColour
  L8_2 = L6_2
  L9_2 = A3_2 or L9_2
  if not A3_2 then
    L9_2 = 84
  end
  L7_2(L8_2, L9_2)
  L7_2 = SetBlipAlpha
  L8_2 = L6_2
  L9_2 = 128
  L7_2(L8_2, L9_2)
  L7_2 = L5_2
  L8_2 = L6_2
  return L7_2, L8_2
end
createBlipData = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = nil
  L2_2 = nil
  L3_2 = A0_2.blip
  if not L3_2 then
    L3_2 = nil
  end
  L4_2 = L3_2.sprite
  if not L4_2 then
    L4_2 = 161
  end
  L5_2 = L3_2.color
  if not L5_2 then
    L5_2 = 84
  end
  L6_2 = L3_2.scale
  if not L6_2 then
    L6_2 = 1.0
  end
  L7_2 = 255
  L8_2 = 128
  L9_2 = L3_2.length
  L9_2 = L9_2 * 60000
  L9_2 = L9_2 / L8_2
  L10_2 = createBlipData
  L11_2 = vector3
  L12_2 = A0_2.x
  L13_2 = A0_2.y
  L14_2 = A0_2.z
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = L3_2.radius
  L13_2 = L4_2
  L14_2 = L5_2
  L15_2 = L6_2
  L10_2, L11_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L2_2 = L11_2
  L1_2 = L10_2
  L11_2 = A0_2.id
  L10_2 = L0_1
  L10_2[L11_2] = L1_2
  L11_2 = A0_2.id
  L10_2 = L1_1
  L10_2[L11_2] = L2_2
  L10_2 = BeginTextCommandSetBlipName
  L11_2 = "STRING"
  L10_2(L11_2)
  L10_2 = AddTextComponentString
  L11_2 = A0_2.code
  if not L11_2 then
    L11_2 = ""
  end
  L10_2(L11_2)
  L10_2 = EndTextCommandSetBlipName
  L11_2 = L1_2
  L10_2(L11_2)
  while L8_2 > 0 do
    L10_2 = Wait
    L11_2 = L9_2
    L10_2(L11_2)
    L10_2 = math
    L10_2 = L10_2.max
    L11_2 = 0
    L12_2 = L8_2 - 1
    L10_2 = L10_2(L11_2, L12_2)
    L8_2 = L10_2
    L10_2 = SetBlipAlpha
    L11_2 = L2_2
    L12_2 = L8_2
    L10_2(L11_2, L12_2)
  end
  L10_2 = RemoveBlip
  L11_2 = L2_2
  L10_2(L11_2)
  L10_2 = RemoveBlip
  L11_2 = L1_2
  L10_2(L11_2)
end
createBlip = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = {}
  L2_2 = PlayerData
  L2_2 = L2_2.citizenid
  L1_2.citizenId = L2_2
  L1_2.duty = A0_2
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "kartik-mdt:server:toggleDuty"
  L4_2 = false
  L5_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    L3_2 = MDTData
    if A0_2 then
      L4_2 = "on-duty"
      if L4_2 then
        goto lbl_23
      end
    end
    L4_2 = "off-duty"
    ::lbl_23::
    L3_2.status = L4_2
    if A0_2 then
      L3_2 = Config
      L3_2 = L3_2.SmallDispatch
      if L3_2 then
        L3_2 = Config
        L3_2 = L3_2.SmallDispatch
        L3_2 = L3_2.autoToggle
        if L3_2 then
          L3_2 = ToggleSmallDispatch
          L3_2()
        end
      end
    end
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.action = "updateDuty"
    L4_2.data = L2_2
    L3_2(L4_2)
  end
end
ToggleDuty = L2_1
