local L0_1, L1_1, L2_1, L3_1
L0_1 = nil
targetPed = nil
PlyInCam = false
carCam = false
inRoomBodycam = false
savedCoords = nil
L1_1 = Config
L1_1 = L1_1.Utils
L1_1 = L1_1.bodycam
L1_1 = L1_1.useByCommand
if L1_1 then
  L1_1 = RegisterCommand
  L2_1 = Config
  L2_1 = L2_1.Utils
  L2_1 = L2_1.bodycam
  L2_1 = L2_1.command
  function L3_1()
    local L0_2, L1_2
    L0_2 = isActionAllowed
    L1_2 = "bodycam"
    L0_2 = L0_2(L1_2)
    if not L0_2 then
      return
    end
    L0_2 = ToggleBodycam
    L0_2()
  end
  L1_1(L2_1, L3_1)
end
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = lib
  L3_2 = L3_2.notify
  L4_2 = {}
  L4_2.title = "Bodycam"
  L4_2.description = A0_2
  L4_2.duration = A2_2
  L4_2.type = A1_2
  L3_2(L4_2)
end
NotifyPlayer = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "toggleBodycamUI"
  L4_2 = {}
  L4_2.visible = A0_2
  L5_2 = A1_2 or L5_2
  if not A0_2 or not A1_2 then
    L5_2 = nil
  end
  L4_2.data = L5_2
  L3_2.data = L4_2
  L2_2(L3_2)
end
BodyOverlay = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = Config
  L0_2 = L0_2.Utils
  L0_2 = L0_2.bodycam
  L0_2 = L0_2.itemRequired
  if L0_2 then
    L0_2 = HasItem
    L1_2 = Config
    L1_2 = L1_2.Utils
    L1_2 = L1_2.bodycam
    L1_2 = L1_2.item
    L0_2 = L0_2(L1_2)
    if not L0_2 then
      return
    end
  end
  L0_2 = PlayerData
  if L0_2 then
    L0_2 = PlayerData
    L0_2 = L0_2.citizenid
  end
  if not L0_2 then
    L1_2 = NotifyPlayer
    L2_2 = "Citizen ID not found!"
    L3_2 = "error"
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = GlobalState
  L1_2 = L1_2.PlayerOnBodycam
  if L1_2 then
    L1_2 = GlobalState
    L1_2 = L1_2.PlayerOnBodycam
    L1_2 = L1_2[L0_2]
    if L1_2 then
      L1_2 = GlobalState
      L1_2 = L1_2.PlayerOnBodycam
      L1_2 = L1_2[L0_2]
      L1_2 = L1_2.status
      L1_2 = "on" == L1_2
    end
  end
  if L1_2 then
    L2_2 = "Deactivating"
    if L2_2 then
      goto lbl_51
    end
  end
  L2_2 = "Activating"
  ::lbl_51::
  L3_2 = lib
  L3_2 = L3_2.progressBar
  L4_2 = {}
  L4_2.duration = 2500
  L5_2 = L2_2
  L6_2 = " Bodycam"
  L5_2 = L5_2 .. L6_2
  L4_2.label = L5_2
  L4_2.useWhileDead = false
  L4_2.canCancel = true
  L5_2 = {}
  L5_2.combat = true
  L4_2.disable = L5_2
  L5_2 = {}
  L5_2.dict = "clothingtie"
  L5_2.clip = "try_tie_positive_a"
  L4_2.anim = L5_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = lib
    L4_2 = L4_2.callback
    L4_2 = L4_2.await
    L5_2 = "kartik-mdt:server:toggleBodycam"
    L6_2 = false
    L7_2 = not L1_2
    L8_2 = L0_2
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    if L4_2 then
      L5_2 = BodyOverlay
      L6_2 = not L1_2
      L7_2 = L4_2
      L5_2(L6_2, L7_2)
    else
      L5_2 = NotifyPlayer
      L6_2 = "Failed to toggle bodycam!"
      L7_2 = "error"
      L5_2(L6_2, L7_2)
    end
  else
    L4_2 = NotifyPlayer
    L5_2 = "Cancelled!"
    L6_2 = "error"
    L4_2(L5_2, L6_2)
  end
end
ToggleBodycam = L1_1
L1_1 = exports
L2_1 = "ToggleBodycam"
L3_1 = ToggleBodycam
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "fetchBodycams"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:fetchBodycams"
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
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "fetchBodycamDataById"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:fetchBodycamDataById"
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
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "getPaginatedCameraVideos"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:getPaginatedCameraVideos"
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
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  while true do
    L0_2 = PlyInCam
    if not L0_2 then
      break
    end
    L0_2 = SetCamRot
    L1_2 = L0_1
    L2_2 = 0
    L3_2 = 0
    L4_2 = GetEntityHeading
    L5_2 = targetPed
    L4_2 = L4_2(L5_2)
    L5_2 = 2
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L0_2 = Wait
    L1_2 = 1
    L0_2(L1_2)
  end
end
SetCamRotation = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L0_2 = PlyInCam
    if not L0_2 then
      break
    end
    L0_2 = IsPedInAnyVehicle
    L1_2 = targetPed
    L2_2 = false
    L0_2 = L0_2(L1_2, L2_2)
    if L0_2 then
      L0_2 = carCam
      if not L0_2 then
        L0_2 = AttachCamToPedBone
        L1_2 = L0_1
        L2_2 = targetPed
        L3_2 = 46240
        L4_2 = 0.1
        L5_2 = 0.25
        L6_2 = -0.1
        L7_2 = true
        L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
        carCam = true
    end
    else
      L0_2 = IsPedInAnyVehicle
      L1_2 = targetPed
      L2_2 = false
      L0_2 = L0_2(L1_2, L2_2)
      if not L0_2 then
        L0_2 = carCam
        if L0_2 then
          L0_2 = AttachCamToPedBone
          L1_2 = L0_1
          L2_2 = targetPed
          L3_2 = 46240
          L4_2 = 0.1
          L5_2 = 0.025
          L6_2 = 0.1
          L7_2 = true
          L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
          carCam = false
        end
      end
    end
    L0_2 = Wait
    L1_2 = 2000
    L0_2(L1_2)
  end
end
SetCarCam = L1_1
L1_1 = RegisterNUICallback
L2_1 = "openBodycam"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A0_2 then
    L2_2 = A0_2.camera
    if L2_2 then
      goto lbl_13
    end
  end
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = false
  L3_2.message = "Invalid bodycam data."
  L2_2(L3_2)
  do return end
  ::lbl_13::
  L2_2 = A0_2.camera
  L3_2 = L2_2.citizenId
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "kartik-mdt:server:getSource"
  L6_2 = false
  L7_2 = L3_2
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  if not L4_2 then
    L6_2 = A1_2
    L7_2 = {}
    L7_2.success = false
    L7_2.message = "Cannot Establish Connection."
    L6_2(L7_2)
    return
  end
  L6_2 = inRoomBodycam
  if L6_2 then
    L6_2 = GetEntityCoords
    L7_2 = cache
    L7_2 = L7_2.ped
    L6_2 = L6_2(L7_2)
    savedCoords = L6_2
    L6_2 = SetEntityCoords
    L7_2 = cache
    L7_2 = L7_2.ped
    L8_2 = L5_2.x
    L9_2 = L5_2.y
    L10_2 = L5_2.z
    L10_2 = L10_2 - 100.0
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = FreezeEntityPosition
    L7_2 = cache
    L7_2 = L7_2.ped
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = SetEntityVisible
    L7_2 = cache
    L7_2 = L7_2.ped
    L8_2 = false
    L9_2 = false
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = SetEntityCollision
    L7_2 = cache
    L7_2 = L7_2.ped
    L8_2 = false
    L9_2 = false
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = SetEntityInvincible
    L7_2 = cache
    L7_2 = L7_2.ped
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = NetworkSetEntityInvisibleToNetwork
    L7_2 = cache
    L7_2 = L7_2.ped
    L8_2 = true
    L6_2(L7_2, L8_2)
  end
  L6_2 = Wait
  L7_2 = 1000
  L6_2(L7_2)
  L6_2 = GetPlayerFromServerId
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  if L6_2 < 1 then
    L7_2 = A1_2
    L8_2 = {}
    L8_2.success = false
    L8_2.message = "Target player not found."
    L7_2(L8_2)
    return
  end
  L7_2 = GetPlayerPed
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  targetPed = L7_2
  L7_2 = inRoomBodycam
  if not L7_2 then
    L7_2 = targetPed
    if L7_2 then
      L7_2 = DoesEntityExist
      L8_2 = targetPed
      L7_2 = L7_2(L8_2)
      if L7_2 then
        goto lbl_112
      end
    end
    L7_2 = A1_2
    L8_2 = {}
    L8_2.success = false
    L8_2.message = "Target not available."
    L7_2(L8_2)
    return
  end
  ::lbl_112::
  L7_2 = CreateCam
  L8_2 = "DEFAULT_SCRIPTED_FLY_CAMERA"
  L9_2 = true
  L7_2 = L7_2(L8_2, L9_2)
  L0_1 = L7_2
  L7_2 = AttachCamToPedBone
  L8_2 = L0_1
  L9_2 = targetPed
  L10_2 = Config
  L10_2 = L10_2.Bodycam
  L10_2 = L10_2.boneIndex
  L11_2 = Config
  L11_2 = L11_2.Bodycam
  L11_2 = L11_2.xOffset
  L12_2 = Config
  L12_2 = L12_2.Bodycam
  L12_2 = L12_2.yOffset
  L13_2 = Config
  L13_2 = L13_2.Bodycam
  L13_2 = L13_2.zOffset
  L14_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L7_2 = SetCamFov
  L8_2 = L0_1
  L9_2 = Config
  L9_2 = L9_2.Bodycam
  L9_2 = L9_2.fov
  L7_2(L8_2, L9_2)
  L7_2 = GetEntityHeading
  L8_2 = targetPed
  L7_2 = L7_2(L8_2)
  PlyInCam = true
  L8_2 = inRoomBodycam
  if not L8_2 then
    L8_2 = NetworkSetInSpectatorMode
    L9_2 = true
    L10_2 = targetPed
    L8_2(L9_2, L10_2)
  end
  L8_2 = SetCamRot
  L9_2 = L0_1
  L10_2 = 0.0
  L11_2 = 0.0
  L12_2 = L7_2
  L13_2 = 2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = RenderScriptCams
  L9_2 = true
  L10_2 = false
  L11_2 = 0
  L12_2 = true
  L13_2 = false
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = ShakeCam
  L9_2 = L0_1
  L10_2 = "HAND_SHAKE"
  L11_2 = 1.0
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = SetCamShakeAmplitude
  L9_2 = L0_1
  L10_2 = 2.0
  L8_2(L9_2, L10_2)
  L8_2 = DoScreenFadeIn
  L9_2 = 1000
  L8_2(L9_2)
  L8_2 = CreateThread
  L9_2 = SetCarCam
  L8_2(L9_2)
  L8_2 = CreateThread
  L9_2 = SetCamRotation
  L8_2(L9_2)
  L8_2 = A1_2
  L9_2 = {}
  L9_2.success = true
  L10_2 = Config
  L10_2 = L10_2.BodycamRecordTime
  L9_2.recTime = L10_2
  L8_2(L9_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "closeCamera"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = inRoomBodycam
  if L2_2 then
    L2_2 = savedCoords
    if L2_2 then
      L2_2 = SetEntityCoords
      L3_2 = cache
      L3_2 = L3_2.ped
      L4_2 = savedCoords
      L4_2 = L4_2.x
      L5_2 = savedCoords
      L5_2 = L5_2.y
      L6_2 = savedCoords
      L6_2 = L6_2.z
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
    L2_2 = FreezeEntityPosition
    L3_2 = cache
    L3_2 = L3_2.ped
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = SetEntityVisible
    L3_2 = cache
    L3_2 = L3_2.ped
    L4_2 = true
    L5_2 = false
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = SetEntityCollision
    L3_2 = cache
    L3_2 = L3_2.ped
    L4_2 = true
    L5_2 = true
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = SetEntityInvincible
    L3_2 = cache
    L3_2 = L3_2.ped
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = NetworkSetEntityInvisibleToNetwork
    L3_2 = cache
    L3_2 = L3_2.ped
    L4_2 = false
    L2_2(L3_2, L4_2)
  end
  savedCoords = nil
  L2_2 = L0_1
  if L2_2 then
    L2_2 = RenderScriptCams
    L3_2 = false
    L4_2 = false
    L5_2 = 0
    L6_2 = 1
    L7_2 = 0
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    L2_2 = DestroyCam
    L3_2 = L0_1
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = nil
    L0_1 = L2_2
    PlyInCam = false
    carCam = false
    L2_2 = NetworkSetInSpectatorMode
    L3_2 = false
    L4_2 = targetPed
    L2_2(L3_2, L4_2)
    targetPed = nil
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  else
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "kartik-mdt:client:removeBodycam"
function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = BodyOverlay
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = uiOpen
  if L0_2 then
    return
  end
  inRoomBodycam = true
  L0_2 = PlayerData
  if not L0_2 then
    return
  end
  L0_2 = isActionAllowed
  L1_2 = "bodycam"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    return
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "setVisible"
  L1_2.data = true
  L0_2(L1_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "showBodycamPage"
  L1_2.data = true
  L0_2(L1_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "setData"
  L1_2.data = true
  L0_2(L1_2)
  uiOpen = true
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = SetNuiFocusKeepInput
  L1_2 = false
  L0_2(L1_2)
  L0_2 = doAnimation
  L0_2()
end
openBodycamList = L1_1
