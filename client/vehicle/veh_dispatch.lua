local L0_1, L1_1, L2_1, L3_1, L4_1
vehicleDispatch = false
onFootDispatch = false
L0_1 = "closed"
function L1_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    while true do
      L0_3 = cache
      L0_3 = L0_3.vehicle
      if not L0_3 then
        break
      end
      L0_3 = vehicleDispatch
      if not L0_3 then
        break
      end
      L0_3 = GetVehiclePedIsIn
      L1_3 = cache
      L1_3 = L1_3.ped
      L2_3 = false
      L0_3 = L0_3(L1_3, L2_3)
      L1_3 = GetOffsetFromEntityInWorldCoords
      L2_3 = L0_3
      L3_3 = 0.0
      L4_3 = 1.0
      L5_3 = 1.0
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
      L2_3 = GetOffsetFromEntityInWorldCoords
      L3_3 = L0_3
      L4_3 = 0.0
      L5_3 = 105.0
      L6_3 = 0.0
      L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
      L3_3 = StartShapeTestCapsule
      L4_3 = L1_3
      L5_3 = L2_3
      L6_3 = 6.0
      L7_3 = 10
      L8_3 = L0_3
      L9_3 = 7
      L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
      L4_3 = GetShapeTestResult
      L5_3 = L3_3
      L4_3, L5_3, L6_3, L7_3, L8_3 = L4_3(L5_3)
      L9_3 = IsEntityAVehicle
      L10_3 = L8_3
      L9_3 = L9_3(L10_3)
      if L9_3 then
        L9_3 = SendNUIMessage
        L10_3 = {}
        L10_3.action = "updateFrontCar"
        L11_3 = {}
        L12_3 = GetVehicleNumberPlateText
        L13_3 = L8_3
        L12_3 = L12_3(L13_3)
        L11_3.plate = L12_3
        L12_3 = GlobalState
        L12_3 = L12_3.wanted_vehicles
        L13_3 = GetVehicleNumberPlateText
        L14_3 = L8_3
        L13_3 = L13_3(L14_3)
        L12_3 = L12_3[L13_3]
        if not L12_3 then
          L12_3 = false
        end
        L11_3.wanted = L12_3
        L10_3.data = L11_3
        L9_3(L10_3)
      end
      L9_3 = GetOffsetFromEntityInWorldCoords
      L10_3 = L0_3
      L11_3 = 0.0
      L12_3 = -105.0
      L13_3 = 0.0
      L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3)
      L10_3 = StartShapeTestCapsule
      L11_3 = L1_3
      L12_3 = L9_3
      L13_3 = 3.0
      L14_3 = 10
      L15_3 = L0_3
      L16_3 = 7
      L10_3 = L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
      L11_3 = GetShapeTestResult
      L12_3 = L10_3
      L11_3, L12_3, L13_3, L14_3, L15_3 = L11_3(L12_3)
      L16_3 = IsEntityAVehicle
      L17_3 = L15_3
      L16_3 = L16_3(L17_3)
      if L16_3 then
        L16_3 = SendNUIMessage
        L17_3 = {}
        L17_3.action = "updateRearCar"
        L18_3 = {}
        L19_3 = GetVehicleNumberPlateText
        L20_3 = L15_3
        L19_3 = L19_3(L20_3)
        L18_3.plate = L19_3
        L19_3 = GlobalState
        L19_3 = L19_3.wanted_vehicles
        L20_3 = GetVehicleNumberPlateText
        L21_3 = L15_3
        L20_3 = L20_3(L21_3)
        L19_3 = L19_3[L20_3]
        if not L19_3 then
          L19_3 = false
        end
        L18_3.wanted = L19_3
        L17_3.data = L18_3
        L16_3(L17_3)
      end
      L16_3 = Wait
      L17_3 = 500
      L16_3(L17_3)
    end
  end
  L0_2(L1_2)
end
L2_1 = lib
L2_1 = L2_1.onCache
L3_1 = "vehicle"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if not A0_2 then
    L2_2 = L0_1
    if "vehicle" == L2_2 then
      L2_2 = "foot"
      L0_1 = L2_2
      onFootDispatch = true
      vehicleDispatch = false
      L2_2 = SendNUIMessage
      L3_2 = {}
      L3_2.action = "carMDT"
      L4_2 = {}
      L4_2.open = true
      L4_2.mode = "foot"
      L3_2.data = L4_2
      L2_2(L3_2)
    end
  else
    L2_2 = isActionAllowed
    L3_2 = "dispatch"
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = GetVehicleClass
      L3_2 = A0_2
      L2_2 = L2_2(L3_2)
      if 18 == L2_2 then
        L2_2 = L0_1
        if "foot" == L2_2 then
          L2_2 = "vehicle"
          L0_1 = L2_2
          vehicleDispatch = true
          onFootDispatch = false
          L2_2 = L1_1
          L2_2()
          L2_2 = SendNUIMessage
          L3_2 = {}
          L3_2.action = "carMDT"
          L4_2 = {}
          L4_2.open = true
          L4_2.mode = "vehicle"
          L3_2.data = L4_2
          L2_2(L3_2)
        end
      end
    end
  end
end
L2_1(L3_1, L4_1)
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = isActionAllowed
  L1_2 = "dispatch"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = cache
    L0_2 = L0_2.vehicle
    if L0_2 then
      L0_2 = GetVehicleClass
      L1_2 = cache
      L1_2 = L1_2.vehicle
      L0_2 = L0_2(L1_2)
      if 18 == L0_2 then
        L0_2 = "vehicle"
        L0_1 = L0_2
        vehicleDispatch = true
        onFootDispatch = false
        L0_2 = L1_1
        L0_2()
        L0_2 = SendNUIMessage
        L1_2 = {}
        L1_2.action = "carMDT"
        L2_2 = {}
        L2_2.open = true
        L2_2.mode = "vehicle"
        L1_2.data = L2_2
        L0_2(L1_2)
    end
    else
      L0_2 = "foot"
      L0_1 = L0_2
      onFootDispatch = true
      vehicleDispatch = false
      L0_2 = SendNUIMessage
      L1_2 = {}
      L1_2.action = "carMDT"
      L2_2 = {}
      L2_2.open = true
      L2_2.mode = "foot"
      L1_2.data = L2_2
      L0_2(L1_2)
    end
  end
end
openVehicleDispatch = L2_1
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = "closed"
  L0_1 = L0_2
  vehicleDispatch = false
  onFootDispatch = false
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "carMDT"
  L2_2 = {}
  L2_2.open = false
  L2_2.mode = "closed"
  L1_2.data = L2_2
  L0_2(L1_2)
end
closeVehicleDispatch = L2_1
function L2_1()
  local L0_2, L1_2
  L0_2 = L0_1
  if "closed" == L0_2 then
    L0_2 = openVehicleDispatch
    L0_2()
  else
    L0_2 = closeVehicleDispatch
    L0_2()
  end
end
toggleDispatchMode = L2_1
L2_1 = lib
L2_1 = L2_1.addKeybind
L3_1 = {}
L3_1.name = "vehicle_dispatch_nui"
L3_1.description = "press F10 to focus on Vehicle Dispatch"
L4_1 = Config
L4_1 = L4_1.Keybinds
L4_1 = L4_1.vehicle_dispatch_focus
if not L4_1 then
  L4_1 = "F10"
end
L3_1.defaultKey = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = vehicleDispatch
  if not L1_2 then
    L1_2 = onFootDispatch
    if not L1_2 then
      goto lbl_14
    end
  end
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetNuiFocusKeepInput
  L2_2 = false
  L1_2(L2_2)
  ::lbl_14::
end
L3_1.onPressed = L4_1
L2_1(L3_1)
L2_1 = lib
L2_1 = L2_1.addKeybind
L3_1 = {}
L3_1.name = "vehicle_dispatch"
L3_1.description = "press F11 to toggle Vehicle Dispatch"
L4_1 = Config
L4_1 = L4_1.Keybinds
L4_1 = L4_1.open_vehicle_dispatch
if not L4_1 then
  L4_1 = "F11"
end
L3_1.defaultKey = L4_1
function L4_1(A0_2)
  local L1_2
  L1_2 = ToggleSmallDispatch
  L1_2()
end
L3_1.onPressed = L4_1
L2_1(L3_1)
L2_1 = lib
L2_1 = L2_1.addKeybind
L3_1 = {}
L3_1.name = "next_incident"
L3_1.description = "Go to Next Incident"
L3_1.defaultKey = "RIGHT"
function L4_1()
  local L0_2, L1_2
  L0_2 = vehicleDispatch
  if not L0_2 then
    L0_2 = onFootDispatch
    if not L0_2 then
      goto lbl_12
    end
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "nextIncident"
  L0_2(L1_2)
  ::lbl_12::
end
L3_1.onPressed = L4_1
L2_1(L3_1)
L2_1 = lib
L2_1 = L2_1.addKeybind
L3_1 = {}
L3_1.name = "previous_incident"
L3_1.description = "Go to Previous Incident"
L3_1.defaultKey = "LEFT"
function L4_1()
  local L0_2, L1_2
  L0_2 = vehicleDispatch
  if not L0_2 then
    L0_2 = onFootDispatch
    if not L0_2 then
      goto lbl_12
    end
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "previousIncident"
  L0_2(L1_2)
  ::lbl_12::
end
L3_1.onPressed = L4_1
L2_1(L3_1)
L2_1 = lib
L2_1 = L2_1.addKeybind
L3_1 = {}
L3_1.name = "emergency_set_waypoint"
L3_1.description = "Last Waypoint ( EMERGENCY )"
L4_1 = Config
L4_1 = L4_1.Keybinds
L4_1 = L4_1.set_last_waypoint
if not L4_1 then
  L4_1 = "O"
end
L3_1.defaultKey = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = vehicleDispatch
  if not L0_2 then
    L0_2 = onFootDispatch
    if not L0_2 then
      goto lbl_12
    end
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "respondAttachment"
  L0_2(L1_2)
  ::lbl_12::
end
L3_1.onPressed = L4_1
L2_1(L3_1)
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.SmallDispatch
  if L0_2 then
    L0_2 = Config
    L0_2 = L0_2.SmallDispatch
    L0_2 = L0_2.enabled
    if L0_2 then
      L0_2 = toggleDispatchMode
      L0_2()
      L0_2 = vehicleDispatch
      if not L0_2 then
        L0_2 = onFootDispatch
        if not L0_2 then
          L0_2 = uiOpen
          if not L0_2 then
            L0_2 = SetNuiFocus
            L1_2 = false
            L2_2 = false
            L0_2(L1_2, L2_2)
          end
        end
      end
    end
  end
end
ToggleSmallDispatch = L2_1
