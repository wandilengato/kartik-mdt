local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
radioChannels = L0_1
L0_1 = {}
incidentNumber = 0
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = pcall
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    L0_3 = nil
    L1_3 = {}
    L2_3 = "on-duty"
    L1_3[1] = L2_3
    L2_3 = "SELECT COUNT(*) as total FROM mdt_units WHERE status = ? AND isFired = 0"
    L3_3 = MySQL
    L3_3 = L3_3.query
    L3_3 = L3_3.await
    L4_3 = L2_3
    L5_3 = L1_3
    L3_3 = L3_3(L4_3, L5_3)
    L4_3 = L3_3[1]
    if L4_3 then
      L4_3 = L3_3[1]
      L4_3 = L4_3.total
      if L4_3 then
        goto lbl_21
      end
    end
    L4_3 = 0
    ::lbl_21::
    L5_3 = false
    L6_3 = A0_2
    if L6_3 then
      L6_3 = A0_2.page
      if L6_3 then
        L6_3 = A0_2.page
        L7_3 = A0_2.limit
        if not L7_3 then
          L7_3 = 5
        end
        L8_3 = L6_3 - 1
        L8_3 = L8_3 * L7_3
        L0_3 = "SELECT * FROM mdt_units WHERE status = ? AND isFired = 0 LIMIT ? OFFSET ?"
        L9_3 = table
        L9_3 = L9_3.insert
        L10_3 = L1_3
        L11_3 = L7_3
        L9_3(L10_3, L11_3)
        L9_3 = table
        L9_3 = L9_3.insert
        L10_3 = L1_3
        L11_3 = L8_3
        L9_3(L10_3, L11_3)
        L9_3 = A0_2.page
        L9_3 = L9_3 * L7_3
        L5_3 = L4_3 > L9_3
    end
    else
      L0_3 = "SELECT * FROM mdt_units WHERE status = ? AND isFired = 0"
    end
    L6_3 = MySQL
    L6_3 = L6_3.query
    L6_3 = L6_3.await
    L7_3 = L0_3
    L8_3 = L1_3
    L6_3 = L6_3(L7_3, L8_3)
    if L6_3 then
      L7_3 = type
      L8_3 = L6_3
      L7_3 = L7_3(L8_3)
      if "table" == L7_3 then
        goto lbl_73
      end
    end
    L7_3 = error
    L8_3 = "MySQL query failed or returned invalid result."
    L7_3(L8_3)
    ::lbl_73::
    L7_3 = {}
    L8_3 = ipairs
    L9_3 = L6_3
    L8_3, L9_3, L10_3, L11_3 = L8_3(L9_3)
    for L12_3, L13_3 in L8_3, L9_3, L10_3, L11_3 do
      L14_3 = GetPlayerByCitizenId
      L15_3 = L13_3.citizenid
      L14_3 = L14_3(L15_3)
      if L14_3 then
        L15_3 = L14_3.source
        if L15_3 then
          L16_3 = L14_3.name
          if not L16_3 then
            L16_3 = "Unknown"
          end
          L17_3 = L14_3.jobData
          if not L17_3 then
            L17_3 = {}
          end
          L18_3 = {}
          L18_3.source = L15_3
          L19_3 = L13_3.id
          L18_3.officerId = L19_3
          L19_3 = L17_3.label
          if not L19_3 then
            L19_3 = "Unknown"
          end
          L18_3.department = L19_3
          L19_3 = L17_3.name
          if not L19_3 then
            L19_3 = "Unknown"
          end
          L18_3.job = L19_3
          L19_3 = L17_3.name
          if not L19_3 then
            L19_3 = "Unknown"
          end
          L18_3.depName = L19_3
          L19_3 = L13_3.dutyStatus
          if not L19_3 then
            L19_3 = "avl"
          end
          L18_3.dutyStatus = L19_3
          L19_3 = L17_3.grade
          if L19_3 then
            L19_3 = L17_3.grade
            L19_3 = L19_3.name
            if L19_3 then
              goto lbl_129
            end
          end
          L19_3 = "Unknown"
          ::lbl_129::
          L18_3.rank = L19_3
          L19_3 = L13_3.callsign
          L18_3.callsign = L19_3
          L19_3 = L13_3.citizenid
          L18_3.citizenId = L19_3
          L19_3 = L13_3.status
          L18_3.status = L19_3
          L18_3.name = L16_3
          L19_3 = table
          L19_3 = L19_3.insert
          L20_3 = L7_3
          L21_3 = L18_3
          L19_3(L20_3, L21_3)
        end
      end
    end
    L8_3 = {}
    L8_3.units = L7_3
    L8_3.success = true
    L8_3.hasMore = L5_3
    return L8_3
  end
  L1_2, L2_2 = L1_2(L2_2)
  if L1_2 then
    return L2_2
  else
    L3_2 = {}
    L4_2 = {}
    L3_2.units = L4_2
    L3_2.success = false
    L3_2.error = L2_2
    return L3_2
  end
end
fetchActiveUnitsHere = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 then
    L2_2 = A0_2.citizenid
    if L2_2 then
      L2_2 = A0_2.citizenid
      L3_2 = GetPlayerByCitizenId
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = L3_2.source
      if L4_2 then
        L5_2 = GetPlayerPed
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = GetEntityCoords
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        L7_2 = {}
        L8_2 = tostring
        L9_2 = os
        L9_2 = L9_2.time
        L9_2, L10_2, L11_2 = L9_2()
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        L7_2.id = L8_2
        L8_2 = os
        L8_2 = L8_2.date
        L9_2 = "%Y-%m-%d %H:%M:%S"
        L10_2 = os
        L10_2 = L10_2.time
        L10_2, L11_2 = L10_2()
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        L7_2.time = L8_2
        L7_2.title = "Reply to call"
        L7_2.code = "Reply"
        L8_2 = L6_2.x
        L7_2.x = L8_2
        L8_2 = L6_2.y
        L7_2.y = L8_2
        L8_2 = L6_2.z
        L7_2.z = L8_2
        L8_2 = A1_2 or L8_2
        if not A1_2 then
          L8_2 = "Unit are on its way"
        end
        L7_2.description = L8_2
        L7_2.type = "Call"
        L8_2 = TriggerClientEvent
        L9_2 = "kartik-mdt:client:sendReplyDispatchNotification"
        L10_2 = L4_2
        L11_2 = L7_2
        L8_2(L9_2, L10_2, L11_2)
      end
    end
  end
end
sendDispatchNotificationBack = L1_1
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:fetchActiveUnitsHere"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  if A1_2 then
    L2_2 = fetchActiveUnitsHere
    L3_2 = A1_2
    return L2_2(L3_2)
  else
    L2_2 = nil
    return L2_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:getRadioChannels"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  if A1_2 then
    L2_2 = {}
    L3_2 = radioChannels
    L2_2.radioChannels = L3_2
    L2_2.success = true
    return L2_2
  else
    L2_2 = nil
    return L2_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:createRadioChannels"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A1_2 then
    L2_2 = table
    L2_2 = L2_2.insert
    L3_2 = radioChannels
    L4_2 = A1_2.newChannel
    L2_2(L3_2, L4_2)
    L2_2 = CreateThread
    function L3_2()
      local L0_3, L1_3, L2_3
      L0_3 = syncDataBetweenUnits
      L1_3 = "setRadioChannels"
      L2_3 = radioChannels
      L0_3(L1_3, L2_3)
    end
    L2_2(L3_2)
    L2_2 = {}
    L3_2 = radioChannels
    L2_2.radioChannels = L3_2
    L2_2.success = true
    return L2_2
  else
    L2_2 = nil
    return L2_2
  end
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = false
  L2_2 = L0_1
  if L2_2 then
    L2_2 = L0_1
    L2_2 = L2_2[A0_2]
    if L2_2 then
      L2_2 = L0_1
      L2_2[A0_2] = nil
      L1_2 = true
    end
    L2_2 = pairs
    L3_2 = L0_1
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = ipairs
      L9_2 = L7_2
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        if L13_2 == A0_2 then
          L14_2 = table
          L14_2 = L14_2.remove
          L15_2 = L7_2
          L16_2 = L12_2
          L14_2(L15_2, L16_2)
          L1_2 = true
          break
        end
      end
    end
  end
  L2_2 = pairs
  L3_2 = radioChannels
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = ipairs
    L9_2 = L7_2.units
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = L13_2.citizenid
      if L14_2 == A0_2 then
        L14_2 = table
        L14_2 = L14_2.remove
        L15_2 = L7_2.units
        L16_2 = L12_2
        L14_2(L15_2, L16_2)
        L1_2 = true
        break
      end
    end
  end
  if L1_2 then
    L2_2 = CreateThread
    function L3_2()
      local L0_3, L1_3, L2_3
      L0_3 = syncDataBetweenUnits
      L1_3 = "setRadioChannels"
      L2_3 = radioChannels
      L0_3(L1_3, L2_3)
    end
    L2_2(L3_2)
  end
end
LeaveRadio = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L1_2 = A0_2.channelId
  L2_2 = A0_2.unitId
  L3_2 = A0_2.isJoining
  L4_2 = A0_2.citizenid
  L5_2 = L0_1
  if L5_2 then
    L5_2 = pairs
    L6_2 = L0_1
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = ipairs
      L12_2 = L10_2
      L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
      for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
        if L16_2 == L4_2 then
          L17_2 = {}
          L17_2.success = false
          return L17_2
        end
      end
    end
  end
  L5_2 = GetPlayerByCitizenId
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2.name
  L7_2 = L5_2.source
  L8_2 = 0
  L9_2 = ipairs
  L10_2 = radioChannels
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = L14_2.id
    if L15_2 == L1_2 then
      if L3_2 then
        L15_2 = ipairs
        L16_2 = radioChannels
        L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
        for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
          L21_2 = ipairs
          L22_2 = L20_2.units
          L21_2, L22_2, L23_2, L24_2 = L21_2(L22_2)
          for L25_2, L26_2 in L21_2, L22_2, L23_2, L24_2 do
            L27_2 = L26_2.citizenid
            if L27_2 == L4_2 then
              L27_2 = table
              L27_2 = L27_2.remove
              L28_2 = L20_2.units
              L29_2 = L25_2
              L27_2(L28_2, L29_2)
              break
            end
          end
        end
        L15_2 = table
        L15_2 = L15_2.insert
        L16_2 = L14_2.units
        L17_2 = {}
        L17_2.callsign = L2_2
        L17_2.citizenid = L4_2
        L17_2.name = L6_2
        L15_2(L16_2, L17_2)
        L8_2 = L14_2.radioNumber
      else
        L15_2 = ipairs
        L16_2 = L14_2.units
        L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
        for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
          L21_2 = L20_2.citizenid
          if L21_2 == L4_2 then
            L21_2 = table
            L21_2 = L21_2.remove
            L22_2 = L14_2.units
            L23_2 = L19_2
            L21_2(L22_2, L23_2)
            break
          end
        end
        L15_2 = L5_2.jobData
        L8_2 = L14_2.radioNumber
        if L15_2 then
          L16_2 = Config
          L16_2 = L16_2.DefaultRadios
          L17_2 = L15_2.name
          L16_2 = L16_2[L17_2]
          if L16_2 then
            L3_2 = true
            L16_2 = Config
            L16_2 = L16_2.DefaultRadios
            L17_2 = L15_2.name
            L8_2 = L16_2[L17_2]
          end
        end
      end
      L15_2 = TriggerClientEvent
      L16_2 = "kartik-mdt:client:updateRadioChannel"
      L17_2 = L7_2
      L18_2 = L8_2
      L19_2 = L3_2
      L15_2(L16_2, L17_2, L18_2, L19_2)
      L15_2 = L0_1
      L15_2 = L15_2[L4_2]
      if L15_2 then
        L15_2 = pairs
        L16_2 = L0_1
        L16_2 = L16_2[L4_2]
        L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
        for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
          L21_2 = GetPlayerByCitizenId
          L22_2 = L20_2
          L21_2 = L21_2(L22_2)
          L22_2 = L21_2.source
          L23_2 = TriggerClientEvent
          L24_2 = "kartik-mdt:client:updateRadioChannel"
          L25_2 = L22_2
          L26_2 = L8_2
          L27_2 = L3_2
          L23_2(L24_2, L25_2, L26_2, L27_2)
        end
      end
      L15_2 = CreateThread
      function L16_2()
        local L0_3, L1_3, L2_3
        L0_3 = syncDataBetweenUnits
        L1_3 = "setRadioChannels"
        L2_3 = radioChannels
        L0_3(L1_3, L2_3)
      end
      L15_2(L16_2)
      break
    end
  end
  L9_2 = {}
  L10_2 = radioChannels
  L9_2.radioChannels = L10_2
  L9_2.success = true
  return L9_2
end
JoinLeaveRadio = L1_1
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:joinLeaveRadio"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  if A1_2 then
    L2_2 = JoinLeaveRadio
    L3_2 = A1_2
    return L2_2(L3_2)
  else
    L2_2 = {}
    L2_2.success = false
    return L2_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:assignRadioNumber"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  if A1_2 then
    L2_2 = A1_2.channelId
    L3_2 = A1_2.radioNumber
    L4_2 = ipairs
    L5_2 = radioChannels
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L9_2.id
      if L10_2 == L2_2 then
        L9_2.radioNumber = L3_2
        L10_2 = pairs
        L11_2 = L9_2.units
        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
        for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
          L16_2 = GetPlayerByCitizenId
          L17_2 = L15_2.citizenid
          L16_2 = L16_2(L17_2)
          L17_2 = L16_2.source
          if L17_2 then
            L18_2 = TriggerClientEvent
            L19_2 = "kartik-mdt:client:updateRadioChannel"
            L20_2 = L17_2
            L21_2 = L3_2
            L22_2 = true
            L18_2(L19_2, L20_2, L21_2, L22_2)
          end
          L19_2 = L15_2.citizenid
          L18_2 = L0_1
          L18_2 = L18_2[L19_2]
          if L18_2 then
            L18_2 = pairs
            L20_2 = L15_2.citizenid
            L19_2 = L0_1
            L19_2 = L19_2[L20_2]
            L18_2, L19_2, L20_2, L21_2 = L18_2(L19_2)
            for L22_2, L23_2 in L18_2, L19_2, L20_2, L21_2 do
              L24_2 = GetPlayerByCitizenId
              L25_2 = L23_2
              L24_2 = L24_2(L25_2)
              L24_2 = L24_2.source
              L25_2 = TriggerClientEvent
              L26_2 = "kartik-mdt:client:updateRadioChannel"
              L27_2 = L24_2
              L28_2 = L3_2
              L29_2 = true
              L25_2(L26_2, L27_2, L28_2, L29_2)
            end
          end
        end
        break
      end
    end
    L4_2 = CreateThread
    function L5_2()
      local L0_3, L1_3, L2_3
      L0_3 = syncDataBetweenUnits
      L1_3 = "setRadioChannels"
      L2_3 = radioChannels
      L0_3(L1_3, L2_3)
    end
    L4_2(L5_2)
    L4_2 = {}
    L5_2 = radioChannels
    L4_2.radioChannels = L5_2
    L4_2.success = true
    return L4_2
  else
    L2_2 = {}
    L2_2.success = false
    return L2_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:renameChannelName"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A1_2 then
    L2_2 = A1_2.channelId
    L3_2 = A1_2.renameChannelName
    L4_2 = ipairs
    L5_2 = radioChannels
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L9_2.id
      if L10_2 == L2_2 then
        L9_2.name = L3_2
        break
      end
    end
    L4_2 = CreateThread
    function L5_2()
      local L0_3, L1_3, L2_3
      L0_3 = syncDataBetweenUnits
      L1_3 = "setRadioChannels"
      L2_3 = radioChannels
      L0_3(L1_3, L2_3)
    end
    L4_2(L5_2)
    L4_2 = {}
    L5_2 = radioChannels
    L4_2.radioChannels = L5_2
    L4_2.success = true
    return L4_2
  else
    L2_2 = {}
    L2_2.success = false
    return L2_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:deleteRadioChannel"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  if A1_2 then
    L2_2 = A1_2.channelId
    if L2_2 then
      goto lbl_10
    end
  end
  L2_2 = {}
  L2_2.success = false
  do return L2_2 end
  ::lbl_10::
  L2_2 = A1_2.channelId
  L3_2 = nil
  L4_2 = ipairs
  L5_2 = radioChannels
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.id
    if L10_2 == L2_2 then
      L3_2 = L8_2
      L10_2 = L9_2.incidentId
      if L10_2 then
        L10_2 = pairs
        L11_2 = incidents
        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
        for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
          L16_2 = L15_2.units
          if L16_2 == L2_2 then
            L15_2.units = nil
            break
          end
        end
      end
      L10_2 = pairs
      L11_2 = L9_2.units
      L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
      for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
        L16_2 = GetPlayerByCitizenId
        L17_2 = L15_2.citizenid
        L16_2 = L16_2(L17_2)
        L17_2 = L16_2.source
        if L17_2 then
          L18_2 = TriggerClientEvent
          L19_2 = "kartik-mdt:client:updateRadioChannel"
          L20_2 = L17_2
          L21_2 = radioNumber
          L22_2 = false
          L18_2(L19_2, L20_2, L21_2, L22_2)
        end
      end
      break
    end
  end
  if L3_2 then
    L4_2 = table
    L4_2 = L4_2.remove
    L5_2 = radioChannels
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
    L4_2 = CreateThread
    function L5_2()
      local L0_3, L1_3, L2_3
      L0_3 = syncDataBetweenUnits
      L1_3 = "setRadioChannels"
      L2_3 = radioChannels
      L0_3(L1_3, L2_3)
    end
    L4_2(L5_2)
    L4_2 = {}
    L5_2 = radioChannels
    L4_2.radioChannels = L5_2
    L5_2 = incidents
    L4_2.recentIncidents = L5_2
    L4_2.success = true
    return L4_2
  else
    L4_2 = {}
    L4_2.success = false
    return L4_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:getActiveIncidents"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if not A1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = pcall
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L0_3 = {}
    L1_3 = GetPlayerData
    L2_3 = A0_2
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      L2_3 = error
      L3_3 = "Player data not found for source: "
      L4_3 = tostring
      L5_3 = A0_2
      L4_3 = L4_3(L5_3)
      L3_3 = L3_3 .. L4_3
      L2_3(L3_3)
    end
    L2_3 = L1_3.jobData
    if L2_3 then
      L2_3 = L1_3.jobData
      L2_3 = L2_3.name
    end
    if not L2_3 then
      L3_3 = error
      L4_3 = "Department name missing for player source: "
      L5_3 = tostring
      L6_3 = A0_2
      L5_3 = L5_3(L6_3)
      L4_3 = L4_3 .. L5_3
      L3_3(L4_3)
    end
    L3_3 = getDepartmentCategory
    L4_3 = L2_3
    L3_3 = L3_3(L4_3)
    if not L3_3 then
      L4_3 = error
      L5_3 = "Job category not found for department: "
      L6_3 = tostring
      L7_3 = L2_3
      L6_3 = L6_3(L7_3)
      L5_3 = L5_3 .. L6_3
      L4_3(L5_3)
    end
    L4_3 = pairs
    L5_3 = incidents
    L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
    for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
      L10_3 = L9_3.jobs
      if L10_3 then
        L10_3 = L9_3.jobs
        L10_3 = L10_3[L3_3]
        if L10_3 then
          L10_3 = table
          L10_3 = L10_3.insert
          L11_3 = L0_3
          L12_3 = L9_3
          L10_3(L11_3, L12_3)
        end
      end
    end
    L4_3 = {}
    L4_3.incidents = L0_3
    L4_3.success = true
    return L4_3
  end
  L2_2, L3_2 = L2_2(L3_2)
  if L2_2 then
    return L3_2
  else
    L4_2 = {}
    L5_2 = {}
    L4_2.incidents = L5_2
    L4_2.success = false
    L4_2.error = L3_2
    return L4_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:attachUnitToIncident"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  if A1_2 then
    L2_2 = A1_2.incident
    if L2_2 then
      goto lbl_11
    end
  end
  L2_2 = {}
  L2_2.success = false
  L2_2.message = "No incident data received."
  do return L2_2 end
  ::lbl_11::
  L2_2 = A1_2.incident
  L2_2 = L2_2.id
  L3_2 = A1_2.unitData
  L4_2 = A1_2.type
  L5_2 = nil
  L6_2 = ipairs
  L7_2 = incidents
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = L11_2.id
    if L12_2 == L2_2 then
      L5_2 = L11_2
      break
    end
  end
  if not L5_2 then
    L6_2 = {}
    L6_2.success = false
    L6_2.message = "Incident not found"
    return L6_2
  end
  L6_2 = L5_2.units
  L7_2 = L5_2.location
  if not L7_2 then
    L7_2 = "Unknown Location"
  end
  L8_2 = L5_2.id
  L9_2 = L5_2.title
  if not L9_2 then
    L9_2 = "Unknown Call"
  end
  L10_2 = Config
  L10_2 = L10_2.AutoCallCreation
  if L10_2 or "car" ~= L4_2 then
    L10_2 = string
    L10_2 = L10_2.format
    L11_2 = "%s - %s"
    L12_2 = L9_2
    L13_2 = L7_2
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    if not L6_2 then
      L11_2 = "CH"
      L12_2 = tostring
      L13_2 = os
      L13_2 = L13_2.time
      L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L13_2()
      L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
      L11_2 = L11_2 .. L12_2
      L12_2 = {}
      L12_2.id = L11_2
      L12_2.name = L10_2
      L12_2.incidentId = L8_2
      L12_2.status = "In-situation"
      L13_2 = {}
      L12_2.units = L13_2
      if L3_2 then
        L13_2 = L3_2.callsign
        if L13_2 then
          L13_2 = L3_2.citizenid
          if L13_2 then
            L13_2 = L3_2.name
            if L13_2 then
              L13_2 = ipairs
              L14_2 = radioChannels
              L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
              for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
                L19_2 = ipairs
                L20_2 = L18_2.units
                L19_2, L20_2, L21_2, L22_2 = L19_2(L20_2)
                for L23_2, L24_2 in L19_2, L20_2, L21_2, L22_2 do
                  L25_2 = L24_2.citizenid
                  L26_2 = L3_2.citizenid
                  if L25_2 == L26_2 then
                    L25_2 = table
                    L25_2 = L25_2.remove
                    L26_2 = L18_2.units
                    L27_2 = L23_2
                    L25_2(L26_2, L27_2)
                    break
                  end
                end
              end
              L13_2 = table
              L13_2 = L13_2.insert
              L14_2 = L12_2.units
              L15_2 = {}
              L16_2 = L3_2.callsign
              L15_2.callsign = L16_2
              L16_2 = L3_2.citizenid
              L15_2.citizenid = L16_2
              L16_2 = L3_2.name
              L15_2.name = L16_2
              L13_2(L14_2, L15_2)
            end
          end
        end
      end
      L13_2 = table
      L13_2 = L13_2.insert
      L14_2 = radioChannels
      L15_2 = L12_2
      L13_2(L14_2, L15_2)
      L13_2 = ipairs
      L14_2 = incidents
      L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
      for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
        L19_2 = L18_2.id
        if L19_2 == L8_2 then
          L18_2.units = L11_2
          L18_2.location = L7_2
          break
        end
      end
      L13_2 = L5_2.person
      if L13_2 then
        L13_2 = sendDispatchNotificationBack
        L14_2 = L5_2.person
        L13_2(L14_2)
      end
      L13_2 = CreateThread
      function L14_2()
        local L0_3, L1_3, L2_3, L3_3
        L0_3 = syncDataBetweenUnits
        L1_3 = "setIncidentsAndRadio"
        L2_3 = {}
        L3_3 = radioChannels
        L2_3.radioChannels = L3_3
        L3_3 = incidents
        L2_3.incidents = L3_3
        L0_3(L1_3, L2_3)
      end
      L13_2(L14_2)
      L13_2 = {}
      L13_2.success = true
      L14_2 = radioChannels
      L13_2.radioChannels = L14_2
      L14_2 = incidents
      L13_2.incidents = L14_2
      return L13_2
    else
      L11_2 = {}
      L11_2.channelId = L6_2
      L12_2 = L3_2.callsign
      L11_2.unitId = L12_2
      L11_2.isJoining = true
      L12_2 = L3_2.citizenid
      L11_2.citizenid = L12_2
      L12_2 = JoinLeaveRadio
      L13_2 = L11_2
      L12_2(L13_2)
    end
    L11_2 = ipairs
    L12_2 = radioChannels
    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
    for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
      L17_2 = L16_2.incidentId
      if L17_2 == L8_2 then
        L17_2 = L16_2.id
        if L17_2 ~= L6_2 then
          L17_2 = {}
          L17_2.success = false
          L17_2.message = "Incident ID already assigned to another channel."
          return L17_2
        end
      end
      L17_2 = L16_2.id
      if L17_2 == L6_2 then
        L17_2 = L16_2.status
        if "active" == L17_2 then
          L16_2.status = "In-situation"
          L16_2.incidentId = L8_2
        end
        break
      end
    end
    L11_2 = ipairs
    L12_2 = incidents
    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
    for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
      L17_2 = L16_2.id
      if L17_2 == L8_2 then
        L16_2.units = L6_2
        L16_2.location = L7_2
        break
      end
    end
  else
    L10_2 = L5_2.person
    if L10_2 then
      L10_2 = sendDispatchNotificationBack
      L11_2 = L5_2.person
      L10_2(L11_2)
    end
  end
  L10_2 = GetPlayerData
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L11_2 = {}
    L11_2.success = false
    L11_2.message = "Player data not found"
    return L11_2
  end
  L11_2 = L10_2.jobData
  if L11_2 then
    L11_2 = L10_2.jobData
    L11_2 = L11_2.name
  end
  if not L11_2 then
    L12_2 = {}
    L12_2.success = false
    L12_2.message = "Department name missing"
    return L12_2
  end
  L12_2 = getDepartmentCategory
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  if not L12_2 then
    L13_2 = {}
    L13_2.success = false
    L13_2.message = "Job category not found"
    return L13_2
  end
  L13_2 = {}
  L14_2 = ipairs
  L15_2 = incidents
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
  for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
    L20_2 = L19_2.jobs
    if L20_2 then
      L20_2 = L19_2.jobs
      L20_2 = L20_2[L12_2]
      if L20_2 then
        L20_2 = table
        L20_2 = L20_2.insert
        L21_2 = L13_2
        L22_2 = L19_2
        L20_2(L21_2, L22_2)
      end
    end
  end
  L14_2 = CreateThread
  function L15_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = syncDataBetweenUnits
    L1_3 = "setIncidentsAndRadio"
    L2_3 = {}
    L3_3 = radioChannels
    L2_3.radioChannels = L3_3
    L3_3 = L13_2
    L2_3.incidents = L3_3
    L0_3(L1_3, L2_3)
  end
  L14_2(L15_2)
  L14_2 = {}
  L14_2.success = true
  L15_2 = radioChannels
  L14_2.radioChannels = L15_2
  L14_2.incidents = L13_2
  return L14_2
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:detachUnit"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A1_2 then
    L2_2 = A1_2.channelId
    if L2_2 then
      L2_2 = A1_2.channelId
      L3_2 = A1_2.incidentId
      L4_2 = pairs
      L5_2 = radioChannels
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = L9_2.id
        if L10_2 == L2_2 then
          L9_2.incidentId = nil
          L9_2.status = "active"
          break
        end
      end
      L4_2 = ipairs
      L5_2 = incidents
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = L9_2.id
        if L10_2 == L3_2 then
          L9_2.units = nil
          break
        end
      end
      L4_2 = GetPlayerData
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      if not L4_2 then
        L5_2 = {}
        L5_2.success = false
        L5_2.error = "Player data not found"
        return L5_2
      end
      L5_2 = L4_2.jobData
      if L5_2 then
        L5_2 = L4_2.jobData
        L5_2 = L5_2.name
      end
      if not L5_2 then
        L6_2 = {}
        L6_2.success = false
        L6_2.error = "Department name missing"
        return L6_2
      end
      L6_2 = getDepartmentCategory
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if not L6_2 then
        L7_2 = {}
        L7_2.success = false
        L7_2.error = "Job category not found"
        return L7_2
      end
      L7_2 = {}
      L8_2 = ipairs
      L9_2 = incidents
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        L14_2 = L13_2.jobs
        if L14_2 then
          L14_2 = L13_2.jobs
          L14_2 = L14_2[L6_2]
          if L14_2 then
            L14_2 = table
            L14_2 = L14_2.insert
            L15_2 = L7_2
            L16_2 = L13_2
            L14_2(L15_2, L16_2)
          end
        end
      end
      L8_2 = CreateThread
      function L9_2()
        local L0_3, L1_3, L2_3, L3_3
        L0_3 = syncDataBetweenUnits
        L1_3 = "setIncidentsAndRadio"
        L2_3 = {}
        L3_3 = radioChannels
        L2_3.radioChannels = L3_3
        L3_3 = L7_2
        L2_3.incidents = L3_3
        L0_3(L1_3, L2_3)
      end
      L8_2(L9_2)
      L8_2 = {}
      L8_2.success = true
      L9_2 = radioChannels
      L8_2.radioChannels = L9_2
      L8_2.incidents = L7_2
      return L8_2
  end
  else
    L2_2 = {}
    L2_2.success = false
    return L2_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:deleteDispatchIncident"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A1_2 then
    L2_2 = A1_2.incidentId
    if L2_2 then
      goto lbl_10
    end
  end
  L2_2 = {}
  L2_2.success = false
  do return L2_2 end
  ::lbl_10::
  L2_2 = A1_2.incidentId
  L3_2 = nil
  L4_2 = nil
  L5_2 = ipairs
  L6_2 = incidents
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L10_2.id
    if L11_2 == L2_2 then
      L3_2 = L9_2
      L4_2 = L10_2.units
      break
    end
  end
  if not L3_2 then
    L5_2 = {}
    L5_2.success = false
    return L5_2
  end
  L5_2 = table
  L5_2 = L5_2.remove
  L6_2 = incidents
  L7_2 = L3_2
  L5_2(L6_2, L7_2)
  if L4_2 then
    L5_2 = ipairs
    L6_2 = radioChannels
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = L10_2.id
      if L11_2 == L4_2 then
        L10_2.incidentId = nil
        L10_2.status = "active"
        break
      end
    end
  end
  L5_2 = GetPlayerData
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L6_2 = {}
    L6_2.success = false
    L6_2.error = "Player data not found"
    return L6_2
  end
  L6_2 = L5_2.jobData
  if L6_2 then
    L6_2 = L5_2.jobData
    L6_2 = L6_2.name
  end
  if not L6_2 then
    L7_2 = {}
    L7_2.success = false
    L7_2.error = "Department name missing"
    return L7_2
  end
  L7_2 = getDepartmentCategory
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L8_2 = {}
    L8_2.success = false
    L8_2.error = "Job category not found"
    return L8_2
  end
  L8_2 = {}
  L9_2 = ipairs
  L10_2 = incidents
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = L14_2.jobs
    if L15_2 then
      L15_2 = L14_2.jobs
      L15_2 = L15_2[L7_2]
      if L15_2 then
        L15_2 = table
        L15_2 = L15_2.insert
        L16_2 = L8_2
        L17_2 = L14_2
        L15_2(L16_2, L17_2)
      end
    end
  end
  L9_2 = CreateThread
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = syncDataBetweenUnits
    L1_3 = "setIncidentsAndRadio"
    L2_3 = {}
    L3_3 = radioChannels
    L2_3.radioChannels = L3_3
    L3_3 = L8_2
    L2_3.incidents = L3_3
    L0_3(L1_3, L2_3)
  end
  L9_2(L10_2)
  L9_2 = {}
  L9_2.incidents = L8_2
  L10_2 = radioChannels
  L9_2.radioChannels = L10_2
  L9_2.success = true
  return L9_2
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:setlastwaypoint"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = A0_2
  L2_2 = GetPlayerData
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.jobData
  L3_2 = L3_2.name
  L4_2 = GetSanitizedPermissions
  L5_2 = L3_2
  L6_2 = L2_2.jobData
  L6_2 = L6_2.grade
  L6_2 = L6_2.level
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = next
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = L4_2.Pages
      L5_2 = L5_2.dispatch
      L5_2 = L5_2.view
      if L5_2 then
        goto lbl_30
      end
    end
  end
  L5_2 = {}
  L5_2.success = false
  L5_2.message = "Permission denied."
  do return L5_2 end
  ::lbl_30::
  L5_2 = next
  L6_2 = incidents
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = {}
    L6_2 = getDepartmentCategory
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    L7_2 = pairs
    L8_2 = incidents
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = L12_2.jobs
      L13_2 = L13_2[L6_2]
      if L13_2 then
        L13_2 = table
        L13_2 = L13_2.insert
        L14_2 = L5_2
        L15_2 = L12_2
        L13_2(L14_2, L15_2)
      end
    end
    L7_2 = #L5_2
    if 0 == L7_2 then
      L7_2 = {}
      L7_2.success = false
      L7_2.message = "No matching incidents for your department."
      return L7_2
    end
    L7_2 = #L5_2
    L7_2 = L5_2[L7_2]
    L8_2 = {}
    L9_2 = L7_2.x
    L8_2.x = L9_2
    L9_2 = L7_2.y
    L8_2.y = L9_2
    L9_2 = {}
    L9_2.coords = L8_2
    L9_2.success = true
    return L9_2
  else
    L5_2 = {}
    L5_2.success = false
    L5_2.message = "No incidents found."
    return L5_2
  end
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if not A0_2 then
    return
  end
  L1_2 = pcall
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L0_3 = A0_2.x
    if L0_3 then
      L0_3 = A0_2.y
      if L0_3 then
        goto lbl_8
      end
    end
    do return end
    ::lbl_8::
    L0_3 = fetchActiveUnitsHere
    L0_3 = L0_3()
    L1_3 = A0_2.id
    if not L1_3 then
      L1_3 = incidentNumber
      L1_3 = L1_3 + 1
      A0_2.id = L1_3
      L1_3 = A0_2.id
      incidentNumber = L1_3
    end
    L1_3 = os
    L1_3 = L1_3.date
    L2_3 = "%Y-%m-%d %H:%M:%S"
    L3_3 = os
    L3_3 = L3_3.time
    L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L3_3()
    L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
    A0_2.time = L1_3
    L1_3 = A0_2.jobs
    if not L1_3 then
      L1_3 = {}
      A0_2.jobs = L1_3
    end
    L1_3 = {}
    L2_3 = pairs
    L3_3 = A0_2.jobs
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
      L8_3 = Config
      L8_3 = L8_3.Jobs
      L8_3 = L8_3[L6_3]
      if L8_3 then
        L1_3[L6_3] = L7_3
      else
        L8_3 = getDepartmentCategory
        L9_3 = L6_3
        L8_3 = L8_3(L9_3)
        if L8_3 then
          L1_3[L8_3] = true
        end
      end
    end
    A0_2.jobs = L1_3
    L2_3 = table
    L2_3 = L2_3.insert
    L3_3 = incidents
    L4_3 = A0_2
    L2_3(L3_3, L4_3)
    L2_3 = L0_3.success
    if L2_3 then
      L2_3 = pairs
      L3_3 = L0_3.units
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = L7_3.depName
        if not L8_3 then
        else
          L8_3 = getDepartmentCategory
          L9_3 = L7_3.depName
          L8_3 = L8_3(L9_3)
          if not L8_3 then
          else
            L9_3 = A0_2.jobs
            L9_3 = L9_3[L8_3]
            if not L9_3 then
            else
              L9_3 = L7_3.source
              if L9_3 then
                L10_3 = TriggerClientEvent
                L11_3 = "kartik-mdt:client:sendDispatchNotification"
                L12_3 = L9_3
                L13_3 = A0_2
                L10_3(L11_3, L12_3, L13_3)
              end
            end
          end
        end
      end
    end
  end
  L1_2, L2_2 = L1_2(L2_2)
  if not L1_2 then
    L3_2 = print
    L4_2 = "^1[sendDispatchNotification] Error: ^0"
    L5_2 = tostring
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2 .. L5_2
    L3_2(L4_2)
  end
end
sendDispatchNotification = L1_1
L1_1 = exports
L2_1 = "sendDispatchNotification"
L3_1 = sendDispatchNotification
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "kartik-mdt:server:sendDispatchNotification"
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = Config
  L1_2 = L1_2.DisableNetEvent
  if L1_2 then
    return
  end
  L1_2 = sendDispatchNotification
  L2_2 = A0_2
  L1_2(L2_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2
  L0_2 = L0_1
  return L0_2
end
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:GetUnitAttachments"
function L4_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1
  L1_2 = L1_2()
  if not L1_2 then
    L1_2 = {}
  end
  L2_2 = {}
  L2_2.success = true
  L2_2.attachments = L1_2
  return L2_2
end
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if not A0_2 or not A1_2 then
    L3_2 = {}
    L3_2.success = false
    L3_2.message = "Missing unit IDs"
    return L3_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A1_2]
  if not L3_2 then
    L3_2 = L0_1
    L4_2 = {}
    L3_2[A1_2] = L4_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if L3_2 then
    L3_2 = {}
    L3_2.success = true
    L3_2.message = "Unit is already attached to the call."
    return L3_2
  end
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L0_1
  L4_2 = L4_2[A1_2]
  L5_2 = A0_2
  L3_2(L4_2, L5_2)
  if A2_2 then
    L3_2 = #A2_2
    if L3_2 > 0 then
      L3_2 = ipairs
      L4_2 = A2_2
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
        L9_2 = table
        L9_2 = L9_2.insert
        L10_2 = L0_1
        L10_2 = L10_2[A1_2]
        L11_2 = L8_2
        L9_2(L10_2, L11_2)
      end
      L3_2 = L0_1
      L3_2[A0_2] = nil
    end
  end
  if A2_2 then
    L3_2 = #A2_2
    if L3_2 > 0 then
    end
  end
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3
    L0_3 = syncDataBetweenUnits
    L1_3 = "setUnitAttachments"
    L2_3 = L0_1
    L0_3(L1_3, L2_3)
  end
  L3_2(L4_2)
  L3_2 = {}
  L3_2.success = true
  L4_2 = L0_1
  L3_2.attachments = L4_2
  return L3_2
end
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "kartik-mdt:server:attachUnitToUnit"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L2_1
  L3_2 = A1_2.unitId
  L4_2 = A1_2.targetUnitId
  L5_2 = A1_2.attachedUnitsToMove
  return L2_2(L3_2, L4_2, L5_2)
end
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A0_2 or not A1_2 then
    L3_2 = {}
    L3_2.success = false
    L3_2.message = "Missing unit IDs"
    return L3_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A1_2]
  if not L3_2 then
    L3_2 = {}
    L3_2.success = false
    L3_2.message = "Parent unit not found"
    return L3_2
  end
  L3_2 = false
  L4_2 = ipairs
  L5_2 = L0_1
  L5_2 = L5_2[A1_2]
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    if L9_2 == A0_2 then
      L10_2 = table
      L10_2 = L10_2.remove
      L11_2 = L0_1
      L11_2 = L11_2[A1_2]
      L12_2 = L8_2
      L10_2(L11_2, L12_2)
      L3_2 = true
      break
    end
  end
  if not L3_2 then
    L4_2 = {}
    L4_2.success = false
    L4_2.message = "Unit not found in parent's attachments"
    return L4_2
  end
  if A2_2 then
    L4_2 = #A2_2
    if L4_2 > 0 then
      L4_2 = L0_1
      L4_2[A0_2] = A2_2
    end
  end
  L4_2 = L0_1
  L4_2 = L4_2[A1_2]
  L4_2 = #L4_2
  if 0 == L4_2 then
    L4_2 = L0_1
    L4_2[A1_2] = nil
  end
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3
    L0_3 = syncDataBetweenUnits
    L1_3 = "setUnitAttachments"
    L2_3 = L0_1
    L0_3(L1_3, L2_3)
  end
  L4_2(L5_2)
  L4_2 = {}
  L4_2.success = true
  L5_2 = L0_1
  L4_2.attachments = L5_2
  return L4_2
end
L4_1 = lib
L4_1 = L4_1.callback
L4_1 = L4_1.register
L5_1 = "kartik-mdt:server:detachUnitFromUnit"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L3_1
  L3_2 = A1_2.unitId
  L4_2 = A1_2.parentUnitId
  L5_2 = A1_2.attachedUnits
  return L2_2(L3_2, L4_2, L5_2)
end
L4_1(L5_1, L6_1)
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  while true do
    L0_2 = Wait
    L1_2 = 600000
    L0_2(L1_2)
    L0_2 = os
    L0_2 = L0_2.time
    L0_2 = L0_2()
    L1_2 = 1
    while true do
      L2_2 = incidents
      L2_2 = #L2_2
      if not (L1_2 <= L2_2) then
        break
      end
      L2_2 = os
      L2_2 = L2_2.time
      L3_2 = {}
      L4_2 = tonumber
      L5_2 = incidents
      L5_2 = L5_2[L1_2]
      L5_2 = L5_2.time
      L6_2 = L5_2
      L5_2 = L5_2.sub
      L7_2 = 1
      L8_2 = 4
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L3_2.year = L4_2
      L4_2 = tonumber
      L5_2 = incidents
      L5_2 = L5_2[L1_2]
      L5_2 = L5_2.time
      L6_2 = L5_2
      L5_2 = L5_2.sub
      L7_2 = 6
      L8_2 = 7
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L3_2.month = L4_2
      L4_2 = tonumber
      L5_2 = incidents
      L5_2 = L5_2[L1_2]
      L5_2 = L5_2.time
      L6_2 = L5_2
      L5_2 = L5_2.sub
      L7_2 = 9
      L8_2 = 10
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L3_2.day = L4_2
      L4_2 = tonumber
      L5_2 = incidents
      L5_2 = L5_2[L1_2]
      L5_2 = L5_2.time
      L6_2 = L5_2
      L5_2 = L5_2.sub
      L7_2 = 12
      L8_2 = 13
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L3_2.hour = L4_2
      L4_2 = tonumber
      L5_2 = incidents
      L5_2 = L5_2[L1_2]
      L5_2 = L5_2.time
      L6_2 = L5_2
      L5_2 = L5_2.sub
      L7_2 = 15
      L8_2 = 16
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L3_2.min = L4_2
      L4_2 = tonumber
      L5_2 = incidents
      L5_2 = L5_2[L1_2]
      L5_2 = L5_2.time
      L6_2 = L5_2
      L5_2 = L5_2.sub
      L7_2 = 18
      L8_2 = 19
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L3_2.sec = L4_2
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L3_2 = L0_2 - L2_2
        L4_2 = 1200
        if L3_2 > L4_2 then
          L3_2 = incidents
          L3_2 = L3_2[L1_2]
          L3_2 = L3_2.units
          if not L3_2 then
            L3_2 = table
            L3_2 = L3_2.remove
            L4_2 = incidents
            L5_2 = L1_2
            L3_2(L4_2, L5_2)
        end
      end
      else
        L1_2 = L1_2 + 1
      end
    end
  end
end
L4_1(L5_1)
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = isActionAllowed
  L4_2 = A0_2
  L5_2 = "dispatch"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    return
  end
  L3_2 = nil
  L4_2 = ipairs
  L5_2 = incidents
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = tonumber
    L11_2 = L9_2.id
    L10_2 = L10_2(L11_2)
    if L10_2 == A1_2 then
      L3_2 = L9_2
      break
    end
  end
  if not L3_2 then
    return
  end
  L4_2 = L3_2.person
  if L4_2 then
    L4_2 = sendDispatchNotificationBack
    L5_2 = L3_2.person
    L6_2 = A2_2
    L4_2(L5_2, L6_2)
  end
end
ReplyToIncident = L4_1
