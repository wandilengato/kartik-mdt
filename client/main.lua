local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
MDTData = L0_1
tempShotCoords = nil
L0_1 = false
hasCustomEvidence = false
uiOpen = false
L1_1 = Config
L1_1 = L1_1.Debug
if L1_1 then
  L1_1 = print
  L2_1 = "MDT Loaded Successfully"
  L1_1(L2_1)
end
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = PlayerData
  if L0_2 then
    L0_2 = next
    L1_2 = PlayerData
    L0_2 = L0_2(L1_2)
    if L0_2 then
      goto lbl_11
    end
  end
  L0_2 = false
  do return L0_2 end
  ::lbl_11::
  L0_2 = getCurrentJob
  L0_2 = L0_2()
  L1_2 = getCurrentJobRank
  L1_2 = L1_2()
  L2_2 = Config
  L2_2 = L2_2.Permissions
  L3_2 = L0_2.job
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    return
  end
  L2_2 = {}
  L3_2 = PlayerData
  L3_2 = L3_2.citizenid
  L2_2.citizenId = L3_2
  L3_2 = PlayerData
  L3_2 = L3_2.name
  L2_2.name = L3_2
  L3_2 = L0_2.jobLabel
  L2_2.department = L3_2
  L3_2 = L1_2.rankLabel
  L2_2.role = L3_2
  L3_2 = L1_2.rank
  L2_2.grade = L3_2
  L3_2 = hasManagePermission
  L3_2 = L3_2()
  L2_2.hasManagePermission = L3_2
  L3_2 = getDepartmentCategory
  L4_2 = L0_2.job
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = "unknown"
  end
  L2_2.job = L3_2
  L3_2 = L0_2.job
  if not L3_2 then
    L3_2 = "unknown"
  end
  L2_2.jobName = L3_2
  L3_2 = getDepartmentLogo
  L4_2 = L0_2.job
  L3_2 = L3_2(L4_2)
  L2_2.departmentLogo = L3_2
  MDTData = L2_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "kartik-mdt:server:getOfficerData"
  L5_2 = false
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 then
    L4_2 = MDTData
    L5_2 = L3_2.callsign
    L4_2.callsign = L5_2
    L4_2 = MDTData
    L5_2 = L3_2.status
    L4_2.status = L5_2
    L4_2 = MDTData
    L5_2 = L3_2.id
    L4_2.id = L5_2
    L4_2 = MDTData
    L5_2 = L3_2.dutyStatus
    L4_2.dutyStatus = L5_2
    L4_2 = true
    L0_1 = L4_2
  else
    L4_2 = false
    L0_1 = L4_2
  end
end
setupMDTData = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = GetEntityCoords
    L2_2 = cache
    L2_2 = L2_2.ped
    L1_2 = L1_2(L2_2)
    tempShotCoords = L1_2
  else
    tempShotCoords = nil
  end
end
SaveShootingCoords = L1_1
L1_1 = exports
L2_1 = "SaveShootingCoords"
L3_1 = SaveShootingCoords
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Config
  L1_2 = L1_2.Utils
  L1_2 = L1_2.mdt
  L1_2 = L1_2.itemRequired
  if L1_2 then
    L1_2 = HasItem
    L2_2 = Config
    L2_2 = L2_2.Utils
    L2_2 = L2_2.mdt
    L2_2 = L2_2.item
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = false
      return L1_2
    end
  end
  L1_2 = uiOpen
  if L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = PlayerData
  if L1_2 then
    L1_2 = next
    L2_2 = PlayerData
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_32
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_32::
  L1_2 = getCurrentJob
  L1_2 = L1_2()
  L1_2 = L1_2.job
  L2_2 = Config
  L2_2 = L2_2.Permissions
  L2_2 = L2_2[L1_2]
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "kartik-mdt:server:getPermissionData"
  L4_2 = false
  L5_2 = MDTData
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    L3_2 = L2_2.permissions
    if L3_2 then
      L3_2 = MDTData
      L4_2 = L2_2.permissions
      L3_2.permissions = L4_2
    end
  end
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "setVisible"
  L4_2.data = true
  L3_2(L4_2)
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "openMDT"
  L4_2.data = A0_2
  L3_2(L4_2)
  uiOpen = true
  L3_2 = SetNuiFocus
  L4_2 = true
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetNuiFocusKeepInput
  L4_2 = false
  L3_2(L4_2)
  L3_2 = doAnimation
  L3_2()
  L3_2 = true
  return L3_2
end
openMDT = L1_1
L1_1 = exports
L2_1 = "openMDT"
L3_1 = openMDT
L1_1(L2_1, L3_1)
L1_1 = Config
L1_1 = L1_1.Utils
L1_1 = L1_1.mdt
L1_1 = L1_1.useByCommand
if L1_1 then
  L1_1 = RegisterCommand
  L2_1 = Config
  L2_1 = L2_1.Utils
  L2_1 = L2_1.mdt
  L2_1 = L2_1.command
  function L3_1()
    local L0_2, L1_2
    L0_2 = openMDT
    L0_2()
  end
  L1_1(L2_1, L3_1)
end
L1_1 = Config
L1_1 = L1_1.Utils
L1_1 = L1_1.mdt
L1_1 = L1_1.enableKeybind
if L1_1 then
  L1_1 = RegisterKeyMapping
  L2_1 = Config
  L2_1 = L2_1.Utils
  L2_1 = L2_1.mdt
  L2_1 = L2_1.command
  L3_1 = "Open MDT"
  L4_1 = "keyboard"
  L5_1 = Config
  L5_1 = L5_1.Utils
  L5_1 = L5_1.mdt
  L5_1 = L5_1.keybind
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
L1_1 = Config
L1_1 = L1_1.Utils
L1_1 = L1_1.dispatch
L1_1 = L1_1.enableKeybind
if L1_1 then
  L1_1 = RegisterKeyMapping
  L2_1 = Config
  L2_1 = L2_1.Utils
  L2_1 = L2_1.dispatch
  L2_1 = L2_1.command
  L3_1 = "Open Dispatch"
  L4_1 = "keyboard"
  L5_1 = Config
  L5_1 = L5_1.Utils
  L5_1 = L5_1.dispatch
  L5_1 = L5_1.keybind
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
L1_1 = Config
L1_1 = L1_1.Utils
L1_1 = L1_1.bodycam
L1_1 = L1_1.enableKeybind
if L1_1 then
  L1_1 = RegisterKeyMapping
  L2_1 = Config
  L2_1 = L2_1.Utils
  L2_1 = L2_1.bodycam
  L2_1 = L2_1.command
  L3_1 = "Use Bodycam"
  L4_1 = "keyboard"
  L5_1 = Config
  L5_1 = L5_1.Utils
  L5_1 = L5_1.bodycam
  L5_1 = L5_1.keybind
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = uiOpen
  if L0_2 then
    return
  end
  L0_2 = PlayerData
  if not L0_2 then
    L0_2 = next
    L1_2 = PlayerData
    L0_2 = L0_2(L1_2)
    if not L0_2 then
      return
    end
  end
  L0_2 = getCurrentJob
  L0_2 = L0_2()
  L0_2 = L0_2.job
  L1_2 = Config
  L1_2 = L1_2.Permissions
  L1_2 = L1_2[L0_2]
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "setVisible"
  L2_2.data = true
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "openUIEditor"
  L2_2.data = true
  L1_2(L2_2)
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetNuiFocusKeepInput
  L2_2 = false
  L1_2(L2_2)
end
openUIEditor = L1_1
L1_1 = RegisterCommand
L2_1 = "mdt_settings"
function L3_1()
  local L0_2, L1_2
  L0_2 = openUIEditor
  L0_2()
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Config
  L0_2 = L0_2.Utils
  L0_2 = L0_2.dispatch
  L0_2 = L0_2.itemRequired
  if L0_2 then
    L0_2 = HasItem
    L1_2 = Config
    L1_2 = L1_2.Utils
    L1_2 = L1_2.dispatch
    L1_2 = L1_2.item
    L0_2 = L0_2(L1_2)
    if not L0_2 then
      return
    end
  end
  L0_2 = uiOpen
  if L0_2 then
    return
  end
  L0_2 = PlayerData
  if not L0_2 then
    return
  end
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "kartik-mdt:server:getPermissionData"
  L2_2 = false
  L3_2 = MDTData
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  if L0_2 then
    L1_2 = L0_2.permissions
    if L1_2 then
      L1_2 = MDTData
      L2_2 = L0_2.permissions
      L1_2.permissions = L2_2
    end
  end
  L1_2 = isActionAllowed
  L2_2 = "dispatch"
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "setVisible"
  L2_2.data = true
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "showDispatch"
  L2_2.data = true
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "setData"
  L2_2.data = true
  L1_2(L2_2)
  uiOpen = true
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetNuiFocusKeepInput
  L2_2 = false
  L1_2(L2_2)
  L1_2 = doAnimation
  L1_2()
end
openDispatch = L1_1
L1_1 = exports
L2_1 = "openDispatch"
L3_1 = openDispatch
L1_1(L2_1, L3_1)
L1_1 = Config
L1_1 = L1_1.Utils
L1_1 = L1_1.dispatch
L1_1 = L1_1.useByCommand
if L1_1 then
  L1_1 = RegisterCommand
  L2_1 = Config
  L2_1 = L2_1.Utils
  L2_1 = L2_1.dispatch
  L2_1 = L2_1.command
  function L3_1()
    local L0_2, L1_2
    L0_2 = openDispatch
    L0_2()
  end
  L1_1(L2_1, L3_1)
end
L1_1 = RegisterCommand
L2_1 = "resetmdt"
function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = uiOpen
  if not L0_2 then
    return
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "resetMDT"
  L1_2.data = true
  L0_2(L1_2)
  uiOpen = false
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = uiOpen
  if not L0_2 then
    return
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "closeFullUI"
  L1_2.data = true
  L0_2(L1_2)
  uiOpen = false
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
end
forceCloseUI = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = uiOpen
  if not L0_2 then
    return
  end
  L0_2 = RequestAnimDict
  L1_2 = Config
  L1_2 = L1_2.Animation
  L1_2 = L1_2.tabletDict
  L0_2(L1_2)
  while true do
    L0_2 = HasAnimDictLoaded
    L1_2 = Config
    L1_2 = L1_2.Animation
    L1_2 = L1_2.tabletDict
    L0_2 = L0_2(L1_2)
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
  end
  L0_2 = RequestModel
  L1_2 = Config
  L1_2 = L1_2.Animation
  L1_2 = L1_2.tabletProp
  L0_2(L1_2)
  while true do
    L0_2 = HasModelLoaded
    L1_2 = Config
    L1_2 = L1_2.Animation
    L1_2 = L1_2.tabletProp
    L0_2 = L0_2(L1_2)
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
  end
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = CreateObject
  L2_2 = Config
  L2_2 = L2_2.Animation
  L2_2 = L2_2.tabletProp
  L3_2 = 0.0
  L4_2 = 0.0
  L5_2 = 0.0
  L6_2 = true
  L7_2 = true
  L8_2 = false
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  tabletObj = L1_2
  L1_2 = GetPedBoneIndex
  L2_2 = L0_2
  L3_2 = Config
  L3_2 = L3_2.Animation
  L3_2 = L3_2.tabletBone
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = AttachEntityToEntity
  L3_2 = tabletObj
  L4_2 = L0_2
  L5_2 = L1_2
  L6_2 = Config
  L6_2 = L6_2.Animation
  L6_2 = L6_2.tabletOffset
  L6_2 = L6_2.x
  L7_2 = Config
  L7_2 = L7_2.Animation
  L7_2 = L7_2.tabletOffset
  L7_2 = L7_2.y
  L8_2 = Config
  L8_2 = L8_2.Animation
  L8_2 = L8_2.tabletOffset
  L8_2 = L8_2.z
  L9_2 = Config
  L9_2 = L9_2.Animation
  L9_2 = L9_2.tabletRot
  L9_2 = L9_2.x
  L10_2 = Config
  L10_2 = L10_2.Animation
  L10_2 = L10_2.tabletRot
  L10_2 = L10_2.y
  L11_2 = Config
  L11_2 = L11_2.Animation
  L11_2 = L11_2.tabletRot
  L11_2 = L11_2.z
  L12_2 = true
  L13_2 = false
  L14_2 = false
  L15_2 = false
  L16_2 = 2
  L17_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L2_2 = SetModelAsNoLongerNeeded
  L3_2 = Config
  L3_2 = L3_2.Animation
  L3_2 = L3_2.tabletProp
  L2_2(L3_2)
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    while true do
      L0_3 = uiOpen
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = IsEntityPlayingAnim
      L1_3 = L0_2
      L2_3 = Config
      L2_3 = L2_3.Animation
      L2_3 = L2_3.tabletDict
      L3_3 = Config
      L3_3 = L3_3.Animation
      L3_3 = L3_3.tabletAnim
      L4_3 = 3
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
      if not L0_3 then
        L0_3 = TaskPlayAnim
        L1_3 = L0_2
        L2_3 = Config
        L2_3 = L2_3.Animation
        L2_3 = L2_3.tabletDict
        L3_3 = Config
        L3_3 = L3_3.Animation
        L3_3 = L3_3.tabletAnim
        L4_3 = 3.0
        L5_3 = 3.0
        L6_3 = -1
        L7_3 = 49
        L8_3 = 0
        L9_3 = 0
        L10_3 = 0
        L11_3 = 0
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
      end
    end
    L0_3 = ClearPedSecondaryTask
    L1_3 = L0_2
    L0_3(L1_3)
    L0_3 = Wait
    L1_3 = 250
    L0_3(L1_3)
    L0_3 = DetachEntity
    L1_3 = tabletObj
    L2_3 = true
    L3_3 = false
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = DeleteEntity
    L1_3 = tabletObj
    L0_3(L1_3)
  end
  L2_2(L3_2)
end
doAnimation = L1_1
L1_1 = RegisterNUICallback
L2_1 = "initMDTData"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L0_1
  if L2_2 then
    L2_2 = A1_2
    L3_2 = MDTData
    L2_2(L3_2)
  else
    L2_2 = setupMDTData
    L2_2()
    L2_2 = L0_1
    if L2_2 then
      L2_2 = A1_2
      L3_2 = MDTData
      L2_2(L3_2)
    else
      L2_2 = lib
      L2_2 = L2_2.notify
      L3_2 = {}
      L3_2.title = "No Access"
      L3_2.description = "You do not have access to this feature."
      L3_2.type = "error"
      L2_2(L3_2)
      L2_2 = A1_2
      L3_2 = false
      L2_2(L3_2)
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "toggleDuty"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  if A0_2 then
    L2_2 = A0_2.citizenId
    if L2_2 then
      L2_2 = TriggerEvent
      L3_2 = "kartik-mdt:client:updatePlayerDuty"
      L2_2(L3_2)
      L2_2 = A1_2
      L3_2 = "ok"
      L2_2(L3_2)
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "changeCallsign"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:changeCallsign"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = L2_2.success
      if L3_2 then
        L3_2 = MDTData
        L4_2 = L2_2.callsign
        L3_2.callsign = L4_2
      end
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "hideFrame"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "closeMenu"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = closeUI
  L2_2()
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "forceStopRecording"
  L1_2.data = true
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = SetNuiFocusKeepInput
  L1_2 = false
  L0_2(L1_2)
  uiOpen = false
  L0_2 = TriggerScreenblurFadeOut
  L1_2 = 0
  L0_2(L1_2)
  L0_2 = RenderScriptCams
  L1_2 = false
  L0_2(L1_2)
  L0_2 = DestroyAllCams
  L1_2 = true
  L0_2(L1_2)
  L0_2 = ClearFocus
  L0_2()
  L0_2 = inRoomBodycam
  if L0_2 then
    L0_2 = savedCoords
    if L0_2 then
      L0_2 = SetEntityCoords
      L1_2 = cache
      L1_2 = L1_2.ped
      L2_2 = savedCoords
      L2_2 = L2_2.x
      L3_2 = savedCoords
      L3_2 = L3_2.y
      L4_2 = savedCoords
      L4_2 = L4_2.z
      L0_2(L1_2, L2_2, L3_2, L4_2)
    end
    inRoomBodycam = false
    L0_2 = FreezeEntityPosition
    L1_2 = cache
    L1_2 = L1_2.ped
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = SetEntityVisible
    L1_2 = cache
    L1_2 = L1_2.ped
    L2_2 = true
    L3_2 = false
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = SetEntityCollision
    L1_2 = cache
    L1_2 = L1_2.ped
    L2_2 = true
    L3_2 = true
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = SetEntityInvincible
    L1_2 = cache
    L1_2 = L1_2.ped
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = NetworkSetEntityInvisibleToNetwork
    L1_2 = cache
    L1_2 = L1_2.ped
    L2_2 = false
    L0_2(L1_2, L2_2)
  end
  savedCoords = nil
  L0_2 = NetworkSetInSpectatorMode
  L1_2 = false
  L2_2 = PlayerPedId
  L2_2, L3_2, L4_2 = L2_2()
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
closeUI = L1_1
L1_1 = RegisterNUICallback
L2_1 = "getRosterLink"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = getCurrentJob
  L2_2 = L2_2()
  L2_2 = L2_2.job
  L3_2 = Config
  L3_2 = L3_2.Permissions
  L3_2 = L3_2[L2_2]
  if not L3_2 then
    return
  end
  L3_2 = L2_2
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "kartik-mdt:server:getRosterLink"
  L6_2 = false
  L7_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 then
    L5_2 = A1_2
    L6_2 = L4_2
    L5_2(L6_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "getSOPLink"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = getCurrentJob
  L2_2 = L2_2()
  L2_2 = L2_2.job
  L3_2 = Config
  L3_2 = L3_2.Permissions
  L3_2 = L3_2[L2_2]
  if not L3_2 then
    return
  end
  L3_2 = L2_2
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "kartik-mdt:server:getSOPLink"
  L6_2 = false
  L7_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 then
    L5_2 = A1_2
    L6_2 = L4_2
    L5_2(L6_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "saveVideoUrl"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "kartik-mdt:server:saveVideoUrl"
  L4_2 = false
  L5_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    L3_2 = A1_2
    L4_2 = L2_2
    L3_2(L4_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = GetCurrentResourceName
L2_1 = L2_1()
function L3_1()
  local L0_2, L1_2
  L0_2 = TriggerServerEvent
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  L0_2(L1_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "fetchReportsCategory"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = getDepartmentCategory
  L3_2 = getCurrentJob
  L3_2 = L3_2()
  L3_2 = L3_2.job
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = A1_2
    L4_2 = {}
    L5_2 = Config
    L5_2 = L5_2.ReportsCategories
    L5_2 = L5_2[L2_2]
    if not L5_2 then
      L5_2 = {}
    end
    L4_2.reportsCategory = L5_2
    L3_2(L4_2)
  else
    L3_2 = A1_2
    L4_2 = {}
    L5_2 = {}
    L4_2.reportsCategory = L5_2
    L3_2(L4_2)
  end
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = {}
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = PlayerData
    L2_2 = L2_2.citizenid
  end
  L1_2.citizenId = L2_2
  L2_2 = L1_2.citizenId
  if not L2_2 then
    L2_2 = "Unknown"
    return L2_2
  end
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "kartik-mdt:server:getPhoneNumber"
  L4_2 = false
  L5_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    return L2_2
  else
    L3_2 = "Unknown"
    return L3_2
  end
end
GetPhoneNumber = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = "sasplogo.webp"
  L2_2 = ipairs
  L3_2 = Config
  L3_2 = L3_2.Logo
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.type
    if L8_2 == A0_2 then
      L1_2 = L7_2.logo
      break
    end
  end
  return L1_2
end
getDepartmentLogo = L1_1
L1_1 = RegisterNUICallback
L2_1 = "fetchJobLogo"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.Logo
  if L2_2 then
    L2_2 = A1_2
    L3_2 = {}
    L4_2 = Config
    L4_2 = L4_2.Logo
    L3_2.jobLogo = L4_2
    L2_2(L3_2)
  else
    L2_2 = A1_2
    L3_2 = {}
    L3_2.jobLogo = ""
    L2_2(L3_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "setLocale"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = lib
  L2_2 = L2_2.getLocales
  L2_2 = L2_2()
  L3_2 = A1_2
  L4_2 = L2_2 or L4_2
  if not L2_2 then
    L4_2 = {}
  end
  L3_2(L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "getTabletData"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = {}
  L3_2 = Config
  L3_2 = L3_2.TabletTheme
  if not L3_2 then
    L3_2 = false
  end
  L2_2.TabletTheme = L3_2
  L3_2 = Config
  L3_2 = L3_2.CollaborationEditing
  if not L3_2 then
    L3_2 = false
  end
  L2_2.CollaborationEditing = L3_2
  L3_2 = Config
  L3_2 = L3_2.useWebsockets
  if not L3_2 then
    L3_2 = false
  end
  L2_2.useWebsockets = L3_2
  L3_2 = Config
  L3_2 = L3_2.webSocketURL
  if not L3_2 then
    L3_2 = "http://localhost:3001"
  end
  L2_2.webSocketURL = L3_2
  L3_2 = hasCustomEvidence
  if not L3_2 then
    L3_2 = false
  end
  L2_2.hasCustomEvidence = L3_2
  L3_2 = Config
  L3_2 = L3_2.VehicleStrikePoints
  if not L3_2 then
    L3_2 = 10
  end
  L2_2.vehicleStrikePoints = L3_2
  L3_2 = A1_2
  L4_2 = L2_2
  L3_2(L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "getTemplates"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.EditorTemplates
  L3_2 = A1_2
  L4_2 = L2_2 or L4_2
  if not L2_2 then
    L4_2 = {}
  end
  L3_2(L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "setUnitStatus"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "kartik-mdt:server:setUnitStatus"
  L4_2 = false
  L5_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    L3_2 = L2_2.success
    if L3_2 then
      L3_2 = MDTData
      L4_2 = A0_2.status
      L3_2.dutyStatus = L4_2
    end
    L3_2 = A1_2
    L4_2 = L2_2 or L4_2
    if not L2_2 then
      L4_2 = {}
    end
    L3_2(L4_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "kartik-mdt:client:syncChanges"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = uiOpen
  if not L2_2 then
    return
  end
  if A0_2 and A1_2 then
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.action = A0_2
    L3_2.data = A1_2
    L2_2(L3_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "closeUIEditor"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = uiOpen
  if not L2_2 then
    L2_2 = SetNuiFocus
    L3_2 = false
    L4_2 = false
    L2_2(L3_2, L4_2)
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
