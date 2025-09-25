local L0_1, L1_1, L2_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
if "kartik-mdt" ~= L0_1 then
  return
end
L0_1 = {}
PlayerOnBodycam = L0_1
L0_1 = GlobalState
L1_1 = PlayerOnBodycam
L0_1.PlayerOnBodycam = L1_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = "SELECT * FROM mdt_units WHERE citizenid = ?"
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = L3_2
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = #L4_2
  if 0 == L5_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = L4_2[1]
  L5_2 = L5_2.isFired
  if 1 == L5_2 then
    L5_2 = false
    return L5_2
  end
  if A1_2 then
    L5_2 = PlayerOnBodycam
    L5_2 = L5_2[A2_2]
    if L5_2 then
      L5_2 = PlayerOnBodycam
      L5_2 = L5_2[A2_2]
      L5_2 = L5_2.status
      if "off" == L5_2 then
        L5_2 = updateBodycamStatus
        L6_2 = A2_2
        L7_2 = "on"
        L5_2(L6_2, L7_2)
        L5_2 = GetPlayerByCitizenId
        L6_2 = A2_2
        L5_2 = L5_2(L6_2)
        if L5_2 then
          L6_2 = L5_2.jobData
          if not L6_2 then
            L6_2 = {}
            L6_2.label = "Unknown"
            L7_2 = {}
            L7_2.name = "Unknown"
            L6_2.grade = L7_2
          end
          L7_2 = L6_2.label
          L8_2 = PlayerOnBodycam
          L8_2 = L8_2[A2_2]
          L8_2 = L8_2.department
          if L7_2 == L8_2 then
            L7_2 = L6_2.grade
            L7_2 = L7_2.name
            L8_2 = PlayerOnBodycam
            L8_2 = L8_2[A2_2]
            L8_2 = L8_2.rank
            if L7_2 == L8_2 then
              goto lbl_85
            end
          end
          L7_2 = PlayerOnBodycam
          L7_2 = L7_2[A2_2]
          L8_2 = L6_2.label
          L7_2.department = L8_2
          L7_2 = PlayerOnBodycam
          L7_2 = L7_2[A2_2]
          L8_2 = L6_2.grade
          L8_2 = L8_2.name
          L7_2.rank = L8_2
          L7_2 = GlobalState
          L8_2 = PlayerOnBodycam
          L7_2.PlayerOnBodycam = L8_2
        end
        ::lbl_85::
        L6_2 = PlayerOnBodycam
        L6_2 = L6_2[A2_2]
        return L6_2
    end
    else
      L5_2 = GetPlayerByCitizenId
      L6_2 = A2_2
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L6_2 = createBodycamEntry
        L7_2 = L5_2
        L8_2 = A2_2
        L9_2 = "on"
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = PlayerOnBodycam
        L6_2 = L6_2[A2_2]
        return L6_2
      end
    end
  else
    L5_2 = PlayerOnBodycam
    L5_2 = L5_2[A2_2]
    if L5_2 then
      L5_2 = updateBodycamStatus
      L6_2 = A2_2
      L7_2 = "off"
      L5_2(L6_2, L7_2)
      L5_2 = PlayerOnBodycam
      L5_2 = L5_2[A2_2]
      return L5_2
    else
      L5_2 = false
      return L5_2
    end
  end
end
handleBodycamToggle = L0_1
L0_1 = RegisterNetEvent
L1_1 = "kartik-mdt:server:removeBodycam"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = source
  L1_2 = Config
  L1_2 = L1_2.Utils
  L1_2 = L1_2.bodycam
  L1_2 = L1_2.itemRequired
  if not L1_2 then
    return
  end
  L1_2 = GetPlayerData
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = L1_2.citizenId
  L3_2 = handleBodycamToggle
  L4_2 = L0_2
  L5_2 = false
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "kartik-mdt:client:removeBodycam"
    L6_2 = L0_2
    L4_2(L5_2, L6_2)
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "UPDATE mdt_units SET bodycam = ? WHERE citizenid = ?"
  L4_2 = {}
  L5_2 = A1_2
  L6_2 = A0_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2(L3_2, L4_2)
  L2_2 = PlayerOnBodycam
  L2_2 = L2_2[A0_2]
  L2_2.status = A1_2
  L2_2 = GlobalState
  L3_2 = PlayerOnBodycam
  L2_2.PlayerOnBodycam = L3_2
end
updateBodycamStatus = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = A0_2.name
  if not L3_2 then
    L3_2 = "Unknown"
  end
  L4_2 = A0_2.jobData
  if not L4_2 then
    L4_2 = {}
    L4_2.label = "Unknown"
    L5_2 = {}
    L5_2.name = "Unknown"
    L4_2.grade = L5_2
  end
  L5_2 = PlayerOnBodycam
  L6_2 = {}
  L6_2.citizenId = A1_2
  L6_2.name = L3_2
  L7_2 = L4_2.label
  L6_2.department = L7_2
  L7_2 = L4_2.grade
  L7_2 = L7_2.name
  L6_2.rank = L7_2
  L6_2.status = A2_2
  L6_2.videoURLs = ""
  L5_2[A1_2] = L6_2
  L5_2 = GlobalState
  L6_2 = PlayerOnBodycam
  L5_2.PlayerOnBodycam = L6_2
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = "UPDATE mdt_units SET bodycam = ? WHERE citizenid = ?"
  L7_2 = {}
  L8_2 = A2_2
  L9_2 = A1_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2(L6_2, L7_2)
end
createBodycamEntry = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:toggleBodycam"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = handleBodycamToggle
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchBodycams"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if not A1_2 then
    return
  end
  L2_2 = A1_2.page
  if not L2_2 then
    L2_2 = 1
  end
  L3_2 = A1_2.query
  if not L3_2 then
    L3_2 = ""
  end
  L4_2 = L2_2 - 1
  L4_2 = L4_2 * 10
  L5_2 = fetchBodycamPlayersWithPagination
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2, L6_2 = L5_2(L6_2, L7_2)
  L7_2 = {}
  L7_2.bodycams = L5_2
  L7_2.totalCount = L6_2
  return L7_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:getSource"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A1_2 then
    L2_2 = GetPlayerByCitizenId
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L3_2 = L2_2.source
      L4_2 = GetPlayerPed
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = GetEntityCoords
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L6_2 = L3_2
      L7_2 = L5_2
      return L6_2, L7_2
    else
      L3_2 = false
      return L3_2
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchBodycamDataById"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A1_2 then
    L2_2 = A1_2.id
    L3_2 = "SELECT COUNT(*) AS count FROM mdt_bodycams WHERE citizenid = ?"
    L4_2 = {}
    L5_2 = L2_2
    L4_2[1] = L5_2
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = L5_2[1]
    L6_2 = L6_2.count
    if L6_2 > 0 then
      L6_2 = {}
      L6_2.success = true
      return L6_2
    else
      L6_2 = {}
      L6_2.success = false
      return L6_2
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
L1_1 = "kartik-mdt:server:getPaginatedCameraVideos"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if A1_2 then
    L2_2 = A1_2.id
    L3_2 = A1_2.page
    L4_2 = A1_2.perPage
    L5_2 = L3_2 - 1
    L5_2 = L5_2 * L4_2
    L6_2 = "SELECT * FROM mdt_bodycams WHERE citizenid = ? LIMIT ? OFFSET ?"
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
    L9_2 = "SELECT COUNT(*) AS count FROM mdt_bodycams WHERE citizenid = ?"
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
