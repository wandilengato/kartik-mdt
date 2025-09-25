local L0_1, L1_1, L2_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = lib
  L1_2 = L1_2.inputDialog
  L2_2 = "Mugshot"
  L3_2 = {}
  L4_2 = "Player ID"
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = L1_2[1]
    if L2_2 then
      goto lbl_15
    end
  end
  do return end
  ::lbl_15::
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = 1
  end
  L3_2 = TriggerServerEvent
  L4_2 = "kartik-mdt:server:takemugshot"
  L5_2 = L1_2[1]
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
openMugshot = L0_1
L0_1 = RegisterNetEvent
L1_1 = "kartik-mdt:client:takemugshot"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L2_2 = Config
  L2_2 = L2_2.Mugshot
  L2_2 = L2_2.Locations
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = 1
  end
  L2_2 = L2_2[L3_2]
  L3_2 = true
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = GetEntityCoords
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = PlayerData
  L6_2 = L6_2.citizenid
  L7_2 = PlayerData
  L7_2 = L7_2.name
  L8_2 = {}
  L9_2 = LoadScale
  L10_2 = "mugshot_board_01"
  L9_2 = L9_2(L10_2)
  L10_2 = CreateRenderModel
  L11_2 = "ID_Text"
  L12_2 = "prop_police_id_text"
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = CreateThread
  function L12_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    while true do
      L0_3 = L10_2
      if not L0_3 then
        break
      end
      L0_3 = HideHudAndRadarThisFrame
      L0_3()
      L0_3 = SetTextRenderId
      L1_3 = L10_2
      L0_3(L1_3)
      L0_3 = Set_2dLayer
      L1_3 = 4
      L0_3(L1_3)
      L0_3 = SetScriptGfxDrawBehindPausemenu
      L1_3 = 1
      L0_3(L1_3)
      L0_3 = DrawScaleformMovie
      L1_3 = L9_2
      L2_3 = 0.405
      L3_3 = 0.37
      L4_3 = 0.81
      L5_3 = 0.74
      L6_3 = 255
      L7_3 = 255
      L8_3 = 255
      L9_3 = 255
      L10_3 = 0
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
      L0_3 = SetScriptGfxDrawBehindPausemenu
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = SetTextRenderId
      L1_3 = GetDefaultScriptRendertargetRenderId
      L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L1_3()
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L11_2(L12_2)
  L11_2 = LoadModel
  L12_2 = "prop_police_id_board"
  L11_2(L12_2)
  L11_2 = LoadModel
  L12_2 = "prop_police_id_text"
  L11_2(L12_2)
  L11_2 = LoadAnimDict
  L12_2 = "mp_character_creation@lineup@male_a"
  L11_2(L12_2)
  L11_2 = CreateObject
  L12_2 = "prop_police_id_board"
  L13_2 = L5_2
  L14_2 = true
  L15_2 = true
  L16_2 = false
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L12_2 = CreateObject
  L13_2 = "prop_police_id_text"
  L14_2 = L5_2
  L15_2 = true
  L16_2 = true
  L17_2 = false
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L13_2 = AttachEntityToEntity
  L14_2 = L12_2
  L15_2 = L11_2
  L16_2 = -1
  L17_2 = 4103
  L18_2 = 0.0
  L19_2 = 0.0
  L20_2 = 0.0
  L21_2 = 0.0
  L22_2 = 0.0
  L23_2 = 0.0
  L24_2 = false
  L25_2 = false
  L26_2 = false
  L27_2 = false
  L28_2 = 2
  L29_2 = true
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  L13_2 = AttachEntityToEntity
  L14_2 = L11_2
  L15_2 = L4_2
  L16_2 = GetPedBoneIndex
  L17_2 = L4_2
  L18_2 = 28422
  L16_2 = L16_2(L17_2, L18_2)
  L17_2 = 0.0
  L18_2 = 0.0
  L19_2 = 0.0
  L20_2 = 0.0
  L21_2 = 0.0
  L22_2 = 0.0
  L23_2 = 0
  L24_2 = 0
  L25_2 = 0
  L26_2 = 0
  L27_2 = 2
  L28_2 = 1
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
  L13_2 = SetEntityCoords
  L14_2 = L4_2
  L15_2 = L2_2.MugShotCoords
  L13_2(L14_2, L15_2)
  L13_2 = SetEntityHeading
  L14_2 = L4_2
  L15_2 = L2_2.MugShotHeading
  L13_2(L14_2, L15_2)
  L13_2 = SetCurrentPedWeapon
  L14_2 = L4_2
  L15_2 = "weapon_unarmed"
  L16_2 = true
  L13_2(L14_2, L15_2, L16_2)
  L13_2 = ClearPedTasksImmediately
  L14_2 = L4_2
  L13_2(L14_2)
  L13_2 = ClearPedWetness
  L14_2 = L4_2
  L13_2(L14_2)
  L13_2 = ClearPedBloodDamage
  L14_2 = L4_2
  L13_2(L14_2)
  L13_2 = TaskPlayAnim
  L14_2 = L4_2
  L15_2 = "mp_character_creation@lineup@male_a"
  L16_2 = "loop_raised"
  L17_2 = 8.0
  L18_2 = 8.0
  L19_2 = -1
  L20_2 = 49
  L21_2 = 0
  L22_2 = false
  L23_2 = false
  L24_2 = false
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  L13_2 = FreezeEntityPosition
  L14_2 = L4_2
  L15_2 = true
  L13_2(L14_2, L15_2)
  L13_2 = SetPauseMenuActive
  L14_2 = false
  L13_2(L14_2)
  L13_2 = {}
  L14_2 = {}
  L15_2 = L2_2.MugShotHeading
  L14_2.heading = L15_2
  L15_2 = {}
  L16_2 = L2_2.MugShotHeading
  L16_2 = L16_2 + 90.0
  L15_2.heading = L16_2
  L16_2 = {}
  L17_2 = L2_2.MugShotHeading
  L17_2 = L17_2 - 90.0
  L16_2.heading = L17_2
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L13_2[3] = L16_2
  L14_2 = CreateCam
  L15_2 = "DEFAULT_SCRIPTED_CAMERA"
  L16_2 = 1
  L14_2 = L14_2(L15_2, L16_2)
  L15_2 = SetCamCoord
  L16_2 = L14_2
  L17_2 = L2_2.CameraPos
  L17_2 = L17_2.pos
  L15_2(L16_2, L17_2)
  L15_2 = SetCamRot
  L16_2 = L14_2
  L17_2 = L2_2.CameraPos
  L17_2 = L17_2.rotation
  L18_2 = 2
  L15_2(L16_2, L17_2, L18_2)
  L15_2 = RenderScriptCams
  L16_2 = 1
  L17_2 = 0
  L18_2 = 0
  L19_2 = 1
  L20_2 = 1
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
  L15_2 = 1
  L16_2 = 3
  L17_2 = 1
  for L18_2 = L15_2, L16_2, L17_2 do
    L19_2 = L13_2[L18_2]
    L20_2 = SetEntityHeading
    L21_2 = L4_2
    L22_2 = L19_2.heading
    L20_2(L21_2, L22_2)
    L20_2 = BeginScaleformMovieMethod
    L21_2 = L9_2
    L22_2 = "SET_BOARD"
    L20_2(L21_2, L22_2)
    L20_2 = PushScaleformMovieMethodParameterString
    L21_2 = "POLICE"
    L20_2(L21_2)
    L20_2 = PushScaleformMovieMethodParameterString
    L21_2 = L7_2
    L20_2(L21_2)
    L20_2 = PushScaleformMovieMethodParameterString
    L21_2 = L6_2
    L20_2(L21_2)
    L20_2 = PushScaleformMovieMethodParameterString
    L21_2 = "Criminal"
    L20_2(L21_2)
    L20_2 = PushScaleformMovieFunctionParameterInt
    L21_2 = 0
    L20_2(L21_2)
    L20_2 = PushScaleformMovieFunctionParameterInt
    L21_2 = math
    L21_2 = L21_2.random
    L22_2 = 100
    L23_2 = 999
    L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L21_2(L22_2, L23_2)
    L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
    L20_2 = PushScaleformMovieFunctionParameterInt
    L21_2 = 116
    L20_2(L21_2)
    L20_2 = EndScaleformMovieMethod
    L20_2()
    L20_2 = Wait
    L21_2 = 250
    L20_2(L21_2)
    L20_2 = lib
    L20_2 = L20_2.callback
    L20_2 = L20_2.await
    L21_2 = "kartik-mdt:server:GetMugshotWebhook"
    L22_2 = false
    L20_2 = L20_2(L21_2, L22_2)
    if L20_2 then
      L21_2 = promise
      L21_2 = L21_2.new
      L21_2 = L21_2()
      L22_2 = exports
      L22_2 = L22_2["screenshot-basic"]
      L23_2 = L22_2
      L22_2 = L22_2.requestScreenshotUpload
      L24_2 = tostring
      L25_2 = L20_2
      L24_2 = L24_2(L25_2)
      L25_2 = "files[]"
      L26_2 = {}
      L26_2.encoding = "jpg"
      function L27_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3
        L1_3 = json
        L1_3 = L1_3.decode
        L2_3 = A0_3
        L1_3 = L1_3(L2_3)
        if L1_3 then
          L2_3 = L1_3.attachments
          if L2_3 then
            L2_3 = L1_3.attachments
            L2_3 = L2_3[1]
            if L2_3 then
              L2_3 = table
              L2_3 = L2_3.insert
              L3_3 = L8_2
              L4_3 = L1_3.attachments
              L4_3 = L4_3[1]
              L4_3 = L4_3.url
              L2_3(L3_3, L4_3)
            end
          end
        end
        L2_3 = L21_2
        L3_3 = L2_3
        L2_3 = L2_3.resolve
        L4_3 = true
        L2_3(L3_3, L4_3)
      end
      L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L22_2 = Citizen
      L22_2 = L22_2.Await
      L23_2 = L21_2
      L22_2(L23_2)
    end
    L21_2 = Wait
    L22_2 = 100
    L21_2(L22_2)
  end
  L15_2 = DestroyCam
  L16_2 = L14_2
  L17_2 = 0
  L15_2(L16_2, L17_2)
  L15_2 = RenderScriptCams
  L16_2 = 0
  L17_2 = 0
  L18_2 = 1
  L19_2 = 1
  L20_2 = 1
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
  L15_2 = ClearPedTasksImmediately
  L16_2 = L4_2
  L15_2(L16_2)
  L15_2 = FreezeEntityPosition
  L16_2 = L4_2
  L17_2 = false
  L15_2(L16_2, L17_2)
  L15_2 = DeleteObject
  L16_2 = L11_2
  L15_2(L16_2)
  L15_2 = DeleteObject
  L16_2 = L12_2
  L15_2(L16_2)
  L10_2 = nil
  L3_2 = false
  L15_2 = TriggerServerEvent
  L16_2 = "kartik-mdt:server:MugLog"
  L17_2 = A0_2
  L18_2 = L8_2
  L15_2(L16_2, L17_2, L18_2)
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = RequestModel
  L2_2 = GetHashKey
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2)
  while true do
    L1_2 = HasModelLoaded
    L2_2 = GetHashKey
    L3_2 = A0_2
    L2_2, L3_2 = L2_2(L3_2)
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      break
    end
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
end
LoadModel = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  while true do
    L1_2 = HasAnimDictLoaded
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = RequestAnimDict
    L2_2 = A0_2
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
end
LoadAnimDict = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = RequestScaleformMovie
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  while true do
    L2_2 = HasScaleformMovieLoaded
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
  return L1_2
end
LoadScale = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = 0
  L3_2 = IsNamedRendertargetRegistered
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = RegisterNamedRendertarget
    L4_2 = A0_2
    L5_2 = 0
    L3_2(L4_2, L5_2)
  end
  L3_2 = IsNamedRendertargetLinked
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = LinkNamedRendertarget
    L4_2 = A1_2
    L3_2(L4_2)
  end
  L3_2 = IsNamedRendertargetRegistered
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = GetNamedRendertargetRenderId
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
  end
  return L2_2
end
CreateRenderModel = L0_1
