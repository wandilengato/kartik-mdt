local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:saveVideoUrl"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A1_2 then
    L2_2 = A1_2.id
    L3_2 = A1_2.url
    L4_2 = A1_2.type
    if "bodycam" == L4_2 then
      L4_2 = "INSERT INTO mdt_bodycams (citizenid, videoURL) VALUES (?, ?)"
      L5_2 = {}
      L6_2 = L2_2
      L7_2 = L3_2
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = MySQL
      L6_2 = L6_2.query
      L6_2 = L6_2.await
      L7_2 = L4_2
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
    else
      L4_2 = Config
      L4_2 = L4_2.Cameras
      L4_2 = L4_2[L2_2]
      if L4_2 then
        L4_2 = "INSERT INTO mdt_cameras (cameraId, videoURL) VALUES (?, ?)"
        L5_2 = {}
        L6_2 = L2_2
        L7_2 = L3_2
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L6_2 = MySQL
        L6_2 = L6_2.query
        L6_2 = L6_2.await
        L7_2 = L4_2
        L8_2 = L5_2
        L6_2(L7_2, L8_2)
      end
    end
  else
    L2_2 = nil
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:getPaginatedSecurityCameraVideos"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if A1_2 then
    L2_2 = A1_2.id
    L3_2 = A1_2.page
    L4_2 = A1_2.perPage
    L5_2 = L3_2 - 1
    L5_2 = L5_2 * L4_2
    L6_2 = "SELECT * FROM mdt_cameras WHERE cameraId = ? LIMIT ? OFFSET ?"
    L7_2 = {}
    L8_2 = L2_2
    L9_2 = L4_2
    L10_2 = L5_2
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = MySQL
    L8_2 = L8_2.query
    L8_2 = L8_2.await
    L9_2 = L6_2
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = "SELECT COUNT(*) AS count FROM mdt_cameras WHERE cameraId = ?"
    L10_2 = {}
    L11_2 = L2_2
    L10_2[1] = L11_2
    L11_2 = MySQL
    L11_2 = L11_2.query
    L11_2 = L11_2.await
    L12_2 = L9_2
    L13_2 = L10_2
    L11_2 = L11_2(L12_2, L13_2)
    L11_2 = L11_2[1]
    L11_2 = L11_2.count
    if L8_2 then
      L12_2 = #L8_2
      if L12_2 > 0 then
        L12_2 = {}
        L12_2.success = true
        L12_2.videos = L8_2
        L12_2.totalCount = L11_2
        return L12_2
    end
    else
      L12_2 = {}
      L12_2.success = false
      L12_2.totalCount = L11_2
      return L12_2
    end
  else
    L2_2 = nil
    return L2_2
  end
end
L0_1(L1_1, L2_1)
