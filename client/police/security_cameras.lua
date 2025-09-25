local L0_1, L1_1, L2_1
cam = nil
L0_1 = RegisterNUICallback
L1_1 = "getCameraList"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A0_2 then
    L2_2 = Config
    L2_2 = L2_2.Cameras
    if L2_2 then
      L3_2 = tonumber
      L4_2 = A0_2.page
      L3_2 = L3_2(L4_2)
      if not L3_2 then
        L3_2 = 1
      end
      L4_2 = A0_2.query
      if not L4_2 then
        L4_2 = ""
      end
      L5_2 = {}
      L6_2 = #L2_2
      L7_2 = pairs
      L8_2 = L2_2
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.location
        if L13_2 then
          L13_2 = L12_2.location
          L14_2 = L13_2
          L13_2 = L13_2.lower
          L13_2 = L13_2(L14_2)
          L14_2 = L13_2
          L13_2 = L13_2.find
          L16_2 = L4_2
          L15_2 = L4_2.lower
          L15_2, L16_2 = L15_2(L16_2)
          L13_2 = L13_2(L14_2, L15_2, L16_2)
          if L13_2 then
            goto lbl_45
          end
        end
        L13_2 = tostring
        L14_2 = L12_2.id
        L13_2 = L13_2(L14_2)
        L14_2 = L13_2
        L13_2 = L13_2.find
        L16_2 = L4_2
        L15_2 = L4_2.lower
        L15_2, L16_2 = L15_2(L16_2)
        L13_2 = L13_2(L14_2, L15_2, L16_2)
        ::lbl_45::
        if L13_2 then
          L13_2 = table
          L13_2 = L13_2.insert
          L14_2 = L5_2
          L15_2 = L12_2
          L13_2(L14_2, L15_2)
        end
      end
      L7_2 = table
      L7_2 = L7_2.sort
      L8_2 = L5_2
      function L9_2(A0_3, A1_3)
        local L2_3, L3_3
        L2_3 = A0_3.id
        L3_3 = A1_3.id
        L2_3 = L2_3 < L3_3
        return L2_3
      end
      L7_2(L8_2, L9_2)
      L7_2 = {}
      L8_2 = L3_2 - 1
      L8_2 = L8_2 * 10
      L8_2 = L8_2 + 1
      L9_2 = math
      L9_2 = L9_2.min
      L10_2 = L3_2 * 10
      L11_2 = L6_2
      L9_2 = L9_2(L10_2, L11_2)
      if L6_2 >= L8_2 then
        L10_2 = L8_2
        L11_2 = L9_2
        L12_2 = 1
        for L13_2 = L10_2, L11_2, L12_2 do
          L14_2 = table
          L14_2 = L14_2.insert
          L15_2 = L7_2
          L16_2 = L5_2[L13_2]
          L14_2(L15_2, L16_2)
        end
      end
      L10_2 = A1_2
      L11_2 = {}
      L11_2.cameras = L7_2
      L11_2.totalCount = L6_2
      L10_2(L11_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "openCamera"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 then
    L2_2 = A0_2.id
    L3_2 = Config
    L3_2 = L3_2.Cameras
    L3_2 = L3_2[L2_2]
    L4_2 = Config
    L4_2 = L4_2.RecordTime
    if L3_2 then
      L5_2 = A0_2.type
      if "view" == L5_2 then
        L5_2 = L3_2.rotation
        if not L5_2 then
          L5_2 = {}
          L5_2.x = -7.5
          L5_2.y = 0
          L5_2.z = 0
          L5_2.order = 2
        end
        L6_2 = CreateCam
        L7_2 = "DEFAULT_SCRIPTED_CAMERA"
        L8_2 = true
        L6_2 = L6_2(L7_2, L8_2)
        cam = L6_2
        L6_2 = SetCamCoord
        L7_2 = cam
        L8_2 = L3_2.coords
        L8_2 = L8_2.x
        L9_2 = L3_2.coords
        L9_2 = L9_2.y
        L10_2 = L3_2.coords
        L10_2 = L10_2.z
        L6_2(L7_2, L8_2, L9_2, L10_2)
        L6_2 = SetCamRot
        L7_2 = cam
        L8_2 = L5_2.x
        L9_2 = L5_2.y
        L10_2 = L5_2.z
        L11_2 = L5_2.order
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        L6_2 = SetFocusPosAndVel
        L7_2 = L3_2.coords
        L7_2 = L7_2.x
        L8_2 = L3_2.coords
        L8_2 = L8_2.y
        L9_2 = L3_2.coords
        L9_2 = L9_2.z
        L10_2 = 0.0
        L11_2 = 0.0
        L12_2 = 0.0
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        L6_2 = SetCamActive
        L7_2 = cam
        L8_2 = true
        L6_2(L7_2, L8_2)
        L6_2 = RenderScriptCams
        L7_2 = true
        L8_2 = false
        L9_2 = 0
        L10_2 = true
        L11_2 = true
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      end
      L5_2 = A1_2
      L6_2 = {}
      L6_2.success = true
      L6_2.recTime = L4_2
      L5_2(L6_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "closeCamera"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = cam
  if L2_2 then
    L2_2 = RenderScriptCams
    L3_2 = false
    L4_2 = false
    L5_2 = 0
    L6_2 = true
    L7_2 = true
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    L2_2 = DestroyCam
    L3_2 = cam
    L4_2 = false
    L2_2(L3_2, L4_2)
    cam = nil
    PlyInCam = false
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "getPaginatedSecurityCameraVideos"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:getPaginatedSecurityCameraVideos"
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
