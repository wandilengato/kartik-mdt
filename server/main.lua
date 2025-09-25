local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
if "kartik-mdt" ~= L0_1 then
  L0_1 = print
  L1_1 = "^1[kartik-mdt] This resource must be started as kartik-mdt^0"
  L0_1(L1_1)
  L0_1 = print
  L1_1 = "^1[kartik-mdt] Please change the resource name to kartik-mdt in your server.cfg^0"
  L0_1(L1_1)
  return
end
L0_1 = {}
incidents = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 then
    L1_2 = A0_2.citizenId
    L2_2 = "SELECT * FROM mdt_units WHERE citizenid = ?"
    L3_2 = MySQL
    L3_2 = L3_2.query
    L3_2 = L3_2.await
    L4_2 = L2_2
    L5_2 = {}
    L6_2 = L1_2
    L5_2[1] = L6_2
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L4_2 = #L3_2
      if L4_2 > 0 then
        L4_2 = L3_2[1]
        L4_2 = L4_2.isFired
        if 1 == L4_2 then
          L4_2 = false
          return L4_2
        end
        L4_2 = {}
        L5_2 = L3_2[1]
        L5_2 = L5_2.id
        if not L5_2 then
          L5_2 = ""
        end
        L4_2.id = L5_2
        L5_2 = L3_2[1]
        L5_2 = L5_2.callsign
        if not L5_2 then
          L5_2 = ""
        end
        L4_2.callsign = L5_2
        L5_2 = L3_2[1]
        L5_2 = L5_2.status
        if not L5_2 then
          L5_2 = "off-duty"
        end
        L4_2.status = L5_2
        L5_2 = L3_2[1]
        L5_2 = L5_2.dutyStatus
        if not L5_2 then
          L5_2 = "avl"
        end
        L4_2.dutyStatus = L5_2
        L5_2 = radioChannels
        if not L5_2 then
          L5_2 = {}
        end
        L4_2.radioChannels = L5_2
        L5_2 = GetSanitizedPermissions
        L6_2 = A0_2.jobName
        L7_2 = A0_2.grade
        L8_2 = json
        L8_2 = L8_2.decode
        L9_2 = L3_2[1]
        L9_2 = L9_2.tags
        L8_2 = L8_2(L9_2)
        if not L8_2 then
          L8_2 = {}
        end
        L5_2 = L5_2(L6_2, L7_2, L8_2)
        L4_2.permissions = L5_2
        return L4_2
    end
    else
      L4_2 = next
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if not L4_2 then
        L4_2 = "INSERT INTO mdt_units (id, citizenid, department) VALUES (?, ?, ?)"
        L5_2 = {}
        L6_2 = "U"
        L7_2 = tostring
        L8_2 = os
        L8_2 = L8_2.time
        L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2()
        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
        L6_2 = L6_2 .. L7_2
        L7_2 = L1_2
        L8_2 = A0_2.job
        if not L8_2 then
          L8_2 = "unknown"
        end
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L5_2[3] = L8_2
        L6_2 = MySQL
        L6_2 = L6_2.query
        L6_2 = L6_2.await
        L7_2 = L4_2
        L8_2 = L5_2
        L6_2(L7_2, L8_2)
        L6_2 = MySQL
        L6_2 = L6_2.query
        L6_2 = L6_2.await
        L7_2 = "SELECT * FROM mdt_units WHERE citizenid = ?"
        L8_2 = {}
        L9_2 = L1_2
        L8_2[1] = L9_2
        L6_2 = L6_2(L7_2, L8_2)
        if L6_2 then
          L7_2 = #L6_2
          if L7_2 > 0 then
            L7_2 = {}
            L8_2 = L6_2[1]
            L8_2 = L8_2.id
            if not L8_2 then
              L8_2 = ""
            end
            L7_2.id = L8_2
            L8_2 = L6_2[1]
            L8_2 = L8_2.callsign
            if not L8_2 then
              L8_2 = ""
            end
            L7_2.callsign = L8_2
            L8_2 = L6_2[1]
            L8_2 = L8_2.status
            if not L8_2 then
              L8_2 = "off-duty"
            end
            L7_2.status = L8_2
            L8_2 = L6_2[1]
            L8_2 = L8_2.dutyStatus
            if not L8_2 then
              L8_2 = "avl"
            end
            L7_2.dutyStatus = L8_2
            L8_2 = GetSanitizedPermissions
            L9_2 = A0_2.jobName
            L10_2 = A0_2.grade
            L11_2 = json
            L11_2 = L11_2.decode
            L12_2 = L6_2[1]
            L12_2 = L12_2.tags
            L11_2 = L11_2(L12_2)
            if not L11_2 then
              L11_2 = {}
            end
            L8_2 = L8_2(L9_2, L10_2, L11_2)
            L7_2.permissions = L8_2
            return L7_2
        end
        else
          L7_2 = nil
          return L7_2
        end
      else
        L4_2 = nil
        return L4_2
      end
    end
  else
    L1_2 = nil
    return L1_2
  end
end
getOfficerData = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 then
    L1_2 = A0_2.citizenId
    L2_2 = "SELECT * FROM mdt_units WHERE citizenid = ?"
    L3_2 = MySQL
    L3_2 = L3_2.query
    L3_2 = L3_2.await
    L4_2 = L2_2
    L5_2 = {}
    L6_2 = L1_2
    L5_2[1] = L6_2
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L4_2 = #L3_2
      if L4_2 > 0 then
        L4_2 = L3_2[1]
        L4_2 = L4_2.isFired
        if 1 == L4_2 then
          L4_2 = false
          return L4_2
        end
        L4_2 = {}
        L5_2 = GetSanitizedPermissions
        L6_2 = A0_2.jobName
        L7_2 = A0_2.grade
        L8_2 = json
        L8_2 = L8_2.decode
        L9_2 = L3_2[1]
        L9_2 = L9_2.tags
        L8_2 = L8_2(L9_2)
        if not L8_2 then
          L8_2 = {}
        end
        L5_2 = L5_2(L6_2, L7_2, L8_2)
        L4_2.permissions = L5_2
        return L4_2
    end
    else
      L4_2 = nil
      return L4_2
    end
  else
    L1_2 = nil
    return L1_2
  end
end
getPermissionData = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if not A0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = "SELECT callsign FROM mdt_units WHERE citizenid = ?"
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = L1_2
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if L3_2 then
    L4_2 = "XX-00"
    return L4_2
  else
    if L2_2 then
      L4_2 = L2_2[1]
      if L4_2 then
        L4_2 = L2_2[1]
        if L4_2 then
          L4_2 = L2_2[1]
          L4_2 = L4_2.callsign
          if L4_2 then
            goto lbl_33
          end
        end
        L4_2 = "Unknown"
        ::lbl_33::
        return L4_2
    end
    else
      L4_2 = "XX-00"
      return L4_2
    end
  end
end
GetCallsign = L0_1
L0_1 = exports
L1_1 = "GetCallsign"
L2_1 = GetCallsign
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:getOfficerData"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = getOfficerData
  L3_2 = A1_2
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:getPermissionData"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = getPermissionData
  L3_2 = A1_2
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:setUnitStatus"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A1_2 then
    L2_2 = A1_2.status
    if L2_2 then
      L2_2 = A0_2
      L3_2 = GetPlayerData
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = L3_2.citizenId
      L5_2 = "UPDATE mdt_units SET dutyStatus = ? WHERE citizenid = ?"
      L6_2 = {}
      L7_2 = A1_2.status
      L8_2 = L4_2
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = MySQL
      L7_2 = L7_2.query
      L7_2 = L7_2.await
      L8_2 = L5_2
      L9_2 = L6_2
      L7_2 = L7_2(L8_2, L9_2)
      L8_2 = L7_2.affectedRows
      if L8_2 > 0 then
        L8_2 = CreateThread
        function L9_2()
          local L0_3, L1_3, L2_3, L3_3
          L0_3 = fetchActiveUnitsHere
          L0_3 = L0_3()
          L0_3 = L0_3.units
          if not L0_3 then
            L0_3 = {}
          end
          L1_3 = syncDataBetweenUnits
          L2_3 = "setActiveOfficers"
          L3_3 = L0_3
          L1_3(L2_3, L3_3)
        end
        L8_2(L9_2)
        L8_2 = {}
        L8_2.success = true
        L8_2.message = "Status Changed Successfully"
        return L8_2
      else
        L8_2 = {}
        L8_2.success = false
        L8_2.message = "Failed to change."
        return L8_2
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:changeCallsign"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A1_2 then
    L2_2 = A1_2.newCallsign
    L3_2 = A1_2.citizenId
    L4_2 = "UPDATE mdt_units SET callsign = ? WHERE citizenid = ?"
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
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = L6_2.affectedRows
    if L7_2 > 0 then
      L7_2 = {}
      L7_2.success = true
      L7_2.callsign = L2_2
      L7_2.message = "Your callsign has been successfully changed."
      return L7_2
    else
      L7_2 = {}
      L7_2.success = false
      L7_2.message = "Failed to change"
      return L7_2
    end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "Failed to change."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = nil
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  L9_2 = A0_2
  L8_2 = A0_2.match
  L10_2 = "T"
  L8_2 = L8_2(L9_2, L10_2)
  if L8_2 then
    L9_2 = A0_2
    L8_2 = A0_2.match
    L10_2 = "(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)"
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2, L10_2)
    L6_2 = L13_2
    L5_2 = L12_2
    L4_2 = L11_2
    L3_2 = L10_2
    L2_2 = L9_2
    L1_2 = L8_2
    L9_2 = A0_2
    L8_2 = A0_2.match
    L10_2 = "([Z+-].*)$"
    L8_2 = L8_2(L9_2, L10_2)
    L7_2 = L8_2
    if "Z" == L7_2 or not L7_2 then
      L8_2 = os
      L8_2 = L8_2.time
      L9_2 = {}
      L10_2 = tonumber
      L11_2 = L1_2
      L10_2 = L10_2(L11_2)
      L9_2.year = L10_2
      L10_2 = tonumber
      L11_2 = L2_2
      L10_2 = L10_2(L11_2)
      L9_2.month = L10_2
      L10_2 = tonumber
      L11_2 = L3_2
      L10_2 = L10_2(L11_2)
      L9_2.day = L10_2
      L10_2 = tonumber
      L11_2 = L4_2
      L10_2 = L10_2(L11_2)
      L9_2.hour = L10_2
      L10_2 = tonumber
      L11_2 = L5_2
      L10_2 = L10_2(L11_2)
      L9_2.min = L10_2
      L10_2 = tonumber
      L11_2 = L6_2
      L10_2 = L10_2(L11_2)
      L9_2.sec = L10_2
      L8_2 = L8_2(L9_2)
      return L8_2
    end
  else
    L9_2 = A0_2
    L8_2 = A0_2.match
    L10_2 = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2, L10_2)
    L6_2 = L13_2
    L5_2 = L12_2
    L4_2 = L11_2
    L3_2 = L10_2
    L2_2 = L9_2
    L1_2 = L8_2
  end
  L8_2 = tonumber
  L9_2 = L1_2
  L8_2 = L8_2(L9_2)
  L1_2 = L8_2
  L8_2 = tonumber
  L9_2 = L2_2
  L8_2 = L8_2(L9_2)
  L2_2 = L8_2
  L8_2 = tonumber
  L9_2 = L3_2
  L8_2 = L8_2(L9_2)
  L3_2 = L8_2
  L8_2 = tonumber
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  L4_2 = L8_2
  L8_2 = tonumber
  L9_2 = L5_2
  L8_2 = L8_2(L9_2)
  L5_2 = L8_2
  L8_2 = tonumber
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  L6_2 = L8_2
  if not (L1_2 and L2_2 and L3_2 and L4_2 and L5_2) or not L6_2 then
    L8_2 = nil
    return L8_2
  end
  L8_2 = os
  L8_2 = L8_2.time
  L9_2 = {}
  L9_2.year = L1_2
  L9_2.month = L2_2
  L9_2.day = L3_2
  L9_2.hour = L4_2
  L9_2.min = L5_2
  L9_2.sec = L6_2
  return L8_2(L9_2)
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "T"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.match
    L3_2 = "Z$"
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      return A0_2
    end
  end
  L1_2 = nil
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  L8_2 = A0_2
  L7_2 = A0_2.match
  L9_2 = "T"
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 then
    L8_2 = A0_2
    L7_2 = A0_2.match
    L9_2 = "(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)"
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2)
    L6_2 = L12_2
    L5_2 = L11_2
    L4_2 = L10_2
    L3_2 = L9_2
    L2_2 = L8_2
    L1_2 = L7_2
  else
    L8_2 = A0_2
    L7_2 = A0_2.match
    L9_2 = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2)
    L6_2 = L12_2
    L5_2 = L11_2
    L4_2 = L10_2
    L3_2 = L9_2
    L2_2 = L8_2
    L1_2 = L7_2
  end
  if not (L1_2 and L2_2 and L3_2 and L4_2 and L5_2) or not L6_2 then
    L7_2 = nil
    return L7_2
  end
  L7_2 = {}
  L8_2 = tonumber
  L9_2 = L1_2
  L8_2 = L8_2(L9_2)
  L7_2.year = L8_2
  L8_2 = tonumber
  L9_2 = L2_2
  L8_2 = L8_2(L9_2)
  L7_2.month = L8_2
  L8_2 = tonumber
  L9_2 = L3_2
  L8_2 = L8_2(L9_2)
  L7_2.day = L8_2
  L8_2 = tonumber
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  L7_2.hour = L8_2
  L8_2 = tonumber
  L9_2 = L5_2
  L8_2 = L8_2(L9_2)
  L7_2.min = L8_2
  L8_2 = tonumber
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  L7_2.sec = L8_2
  L8_2 = os
  L8_2 = L8_2.time
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  L9_2 = os
  L9_2 = L9_2.date
  L10_2 = "!%Y-%m-%dT%H:%M:%S.000Z"
  L11_2 = L8_2
  return L9_2(L10_2, L11_2)
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)"
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    return A0_2
  end
  L7_2 = os
  L7_2 = L7_2.time
  L8_2 = {}
  L9_2 = tonumber
  L10_2 = L1_2
  L9_2 = L9_2(L10_2)
  L8_2.year = L9_2
  L9_2 = tonumber
  L10_2 = L2_2
  L9_2 = L9_2(L10_2)
  L8_2.month = L9_2
  L9_2 = tonumber
  L10_2 = L3_2
  L9_2 = L9_2(L10_2)
  L8_2.day = L9_2
  L9_2 = tonumber
  L10_2 = L4_2
  L9_2 = L9_2(L10_2)
  L8_2.hour = L9_2
  L9_2 = tonumber
  L10_2 = L5_2
  L9_2 = L9_2(L10_2)
  L8_2.min = L9_2
  L9_2 = tonumber
  L10_2 = L6_2
  L9_2 = L9_2(L10_2)
  L8_2.sec = L9_2
  L7_2 = L7_2(L8_2)
  L8_2 = os
  L8_2 = L8_2.difftime
  L9_2 = os
  L9_2 = L9_2.time
  L9_2 = L9_2()
  L10_2 = os
  L10_2 = L10_2.time
  L11_2 = os
  L11_2 = L11_2.date
  L12_2 = "!*t"
  L11_2, L12_2 = L11_2(L12_2)
  L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L9_2 = L7_2 + L8_2
  L10_2 = os
  L10_2 = L10_2.date
  L11_2 = "%Y-%m-%d %H:%M:%S"
  L12_2 = L9_2
  return L10_2(L11_2, L12_2)
end
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "kartik-mdt:server:toggleDuty"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  if not A1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = A1_2.duty
  L3_2 = A1_2.citizenId
  L4_2 = nil
  L5_2 = {}
  L6_2 = 0
  L7_2 = "SELECT dutyRecords FROM mdt_units WHERE citizenid = ?"
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L7_2
  L10_2 = {}
  L11_2 = L3_2
  L10_2[1] = L11_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = GetOfflinePlayerByCitizenId
  L10_2 = L3_2
  L9_2 = L9_2(L10_2)
  if L8_2 then
    L10_2 = L8_2[1]
    if L10_2 then
      goto lbl_31
    end
  end
  L10_2 = nil
  do return L10_2 end
  ::lbl_31::
  L10_2 = json
  L10_2 = L10_2.decode
  L11_2 = L8_2[1]
  L11_2 = L11_2.dutyRecords
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = {}
  end
  if L2_2 then
    L11_2 = {}
    L12_2 = os
    L12_2 = L12_2.date
    L13_2 = "!%Y-%m-%dT%H:%M:%S.000Z"
    L12_2 = L12_2(L13_2)
    L11_2.startTime = L12_2
    L11_2.endTime = ""
    L11_2.hours = 0
    L4_2 = L11_2
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L10_2
    L13_2 = L4_2
    L11_2(L12_2, L13_2)
    L11_2 = SendDiscordLog
    L12_2 = "duty_logs"
    L13_2 = "\240\159\159\162 Duty Started"
    L14_2 = L9_2.name
    L15_2 = " is now **ON DUTY**"
    L14_2 = L14_2 .. L15_2
    L15_2 = 3066993
    L16_2 = {}
    L17_2 = {}
    L17_2.name = "Citizen ID"
    L17_2.value = L3_2
    L17_2.inline = true
    L18_2 = {}
    L18_2.name = "Start Time"
    L19_2 = L2_1
    L20_2 = L4_2.startTime
    L19_2 = L19_2(L20_2)
    L18_2.value = L19_2
    L18_2.inline = true
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  else
    L11_2 = #L10_2
    if L11_2 > 0 then
      L11_2 = #L10_2
      L11_2 = L10_2[L11_2]
      L11_2 = L11_2.endTime
      if "" == L11_2 then
        L11_2 = #L10_2
        L11_2 = L10_2[L11_2]
        L12_2 = os
        L12_2 = L12_2.date
        L13_2 = "!%Y-%m-%dT%H:%M:%S.000Z"
        L12_2 = L12_2(L13_2)
        L11_2.endTime = L12_2
        L11_2 = #L10_2
        L11_2 = L10_2[L11_2]
        L11_2 = L11_2.startTime
        L12_2 = #L10_2
        L12_2 = L10_2[L12_2]
        L12_2 = L12_2.endTime
        L13_2 = L0_1
        L14_2 = L11_2
        L13_2 = L13_2(L14_2)
        L14_2 = L0_1
        L15_2 = L12_2
        L14_2 = L14_2(L15_2)
        L15_2 = L14_2 - L13_2
        L15_2 = L15_2 / 3600
        L16_2 = Config
        L16_2 = L16_2.MinimumDutyMinutes
        if not L16_2 then
          L16_2 = 20
        end
        L16_2 = L16_2 / 60
        if L15_2 < L16_2 then
          L17_2 = table
          L17_2 = L17_2.remove
          L18_2 = L10_2
          L19_2 = #L10_2
          L17_2(L18_2, L19_2)
        else
          L17_2 = math
          L17_2 = L17_2.abs
          L18_2 = L15_2
          L17_2 = L17_2(L18_2)
          L15_2 = L17_2
          L17_2 = #L10_2
          L17_2 = L10_2[L17_2]
          L18_2 = math
          L18_2 = L18_2.floor
          L19_2 = L15_2 * 10
          L18_2 = L18_2(L19_2)
          L18_2 = L18_2 / 10
          L17_2.hours = L18_2
          L17_2 = #L10_2
          L17_2 = L10_2[L17_2]
          L6_2 = L17_2.hours
          L17_2 = math
          L17_2 = L17_2.floor
          L18_2 = L6_2 * 60
          L17_2 = L17_2(L18_2)
          L18_2 = string
          L18_2 = L18_2.format
          L19_2 = "%d hr %d min"
          L20_2 = math
          L20_2 = L20_2.floor
          L21_2 = L17_2 / 60
          L20_2 = L20_2(L21_2)
          L21_2 = L17_2 % 60
          L18_2 = L18_2(L19_2, L20_2, L21_2)
          L19_2 = SendDiscordLog
          L20_2 = "duty_logs"
          L21_2 = "\240\159\148\180 Duty Ended"
          L22_2 = L9_2.name
          L23_2 = " is now **OFF DUTY**"
          L22_2 = L22_2 .. L23_2
          L23_2 = 15158332
          L24_2 = {}
          L25_2 = {}
          L25_2.name = "Citizen ID"
          L25_2.value = L3_2
          L25_2.inline = true
          L26_2 = {}
          L26_2.name = "Start Time"
          L27_2 = L2_1
          L28_2 = L11_2
          L27_2 = L27_2(L28_2)
          L26_2.value = L27_2
          L26_2.inline = true
          L27_2 = {}
          L27_2.name = "End Time"
          L28_2 = L2_1
          L29_2 = L12_2
          L28_2 = L28_2(L29_2)
          L27_2.value = L28_2
          L27_2.inline = true
          L28_2 = {}
          L28_2.name = "Duration"
          L28_2.value = L18_2
          L28_2.inline = true
          L24_2[1] = L25_2
          L24_2[2] = L26_2
          L24_2[3] = L27_2
          L24_2[4] = L28_2
          L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
        end
    end
    else
      L11_2 = json
      L11_2 = L11_2.encode
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      L12_2 = {}
      L12_2.success = true
      L12_2.status = "off-duty"
      L12_2.dutyRecords = L11_2
      L12_2.message = "No active duty record found."
      return L12_2
    end
  end
  L11_2 = "off-duty"
  if L2_2 then
    L11_2 = "on-duty"
  end
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L10_2
  L12_2 = L12_2(L13_2)
  L13_2 = "UPDATE mdt_units SET status = ?, dutyRecords = ?, totalHours = totalHours + ? WHERE citizenid = ?"
  L14_2 = {}
  L15_2 = L11_2
  L16_2 = L12_2
  L17_2 = L6_2
  L18_2 = L3_2
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L14_2[4] = L18_2
  L15_2 = MySQL
  L15_2 = L15_2.query
  L15_2 = L15_2.await
  L16_2 = L13_2
  L17_2 = L14_2
  L15_2 = L15_2(L16_2, L17_2)
  if L15_2 then
    L16_2 = L15_2.affectedRows
    if L16_2 > 0 then
      L16_2 = CreateThread
      function L17_2()
        local L0_3, L1_3, L2_3, L3_3
        L0_3 = fetchActiveUnitsHere
        L0_3 = L0_3()
        L0_3 = L0_3.units
        if not L0_3 then
          L0_3 = {}
        end
        L1_3 = syncDataBetweenUnits
        L2_3 = "setActiveOfficers"
        L3_3 = L0_3
        L1_3(L2_3, L3_3)
      end
      L16_2(L17_2)
      L16_2 = {}
      L16_2.success = true
      L16_2.status = L11_2
      L16_2.message = "Duty records updated successfully."
      return L16_2
  end
  else
    L16_2 = nil
    return L16_2
  end
end
L3_1(L4_1, L5_1)
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "kartik-mdt:server:getRosterLink"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2
  if A1_2 then
    L2_2 = ServerConfig
    L2_2 = L2_2.Roster
    L2_2 = L2_2[A1_2]
    if L2_2 then
      L2_2 = {}
      L3_2 = ServerConfig
      L3_2 = L3_2.Roster
      L3_2 = L3_2[A1_2]
      L2_2.roster = L3_2
      L2_2.success = true
      return L2_2
    else
      L2_2 = {}
      L2_2.success = false
      L2_2.message = " No Roster Found"
      return L2_2
    end
  else
    L2_2 = nil
    return L2_2
  end
end
L3_1(L4_1, L5_1)
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "kartik-mdt:server:getSOPLink"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2
  if A1_2 then
    L2_2 = ServerConfig
    L2_2 = L2_2.SOP
    L2_2 = L2_2[A1_2]
    if L2_2 then
      L2_2 = {}
      L3_2 = ServerConfig
      L3_2 = L3_2.SOP
      L3_2 = L3_2[A1_2]
      L2_2.sop = L3_2
      L2_2.success = true
      return L2_2
    else
      L2_2 = {}
      L2_2.success = false
      L2_2.message = " No SOP Found"
      return L2_2
    end
  else
    L2_2 = nil
    return L2_2
  end
end
L3_1(L4_1, L5_1)
L3_1 = AddEventHandler
L4_1 = "playerDropped"
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L0_2 = source
  L1_2 = GetPlayerData
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = L1_2.citizenId
  L3_2 = L1_2.jobData
  if L3_2 then
    L3_2 = L1_2.jobData
    L3_2 = L3_2.name
  end
  if not L2_2 or not L3_2 then
    L4_2 = print
    L5_2 = "No citizenId or department for player:"
    L6_2 = L0_2
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = blipPlayers
  L4_2 = L4_2[L2_2]
  if L4_2 then
    L4_2 = blipPlayers
    L4_2[L2_2] = nil
  end
  L4_2 = handleBodycamToggle
  L5_2 = L0_2
  L6_2 = false
  L7_2 = L2_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = LeaveRadio
  L5_2 = L2_2
  L4_2(L5_2)
  L4_2 = getDepartmentCategory
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = MySQL
    L4_2 = L4_2.query
    L4_2 = L4_2.await
    L5_2 = "SELECT * FROM mdt_units WHERE citizenid = ?"
    L6_2 = {}
    L7_2 = L2_2
    L6_2[1] = L7_2
    L4_2 = L4_2(L5_2, L6_2)
    if L4_2 then
      L5_2 = L4_2[1]
      if L5_2 then
        L5_2 = L4_2[1]
        L5_2 = L5_2.status
        if "on-duty" == L5_2 then
          L5_2 = L4_2[1]
          L5_2 = L5_2.dutyRecords
          L6_2 = type
          L7_2 = L5_2
          L6_2 = L6_2(L7_2)
          if "string" == L6_2 then
            L6_2 = pcall
            L7_2 = json
            L7_2 = L7_2.decode
            L8_2 = L5_2
            L6_2, L7_2 = L6_2(L7_2, L8_2)
            L5_2 = L7_2 or L5_2
            if not L6_2 or not L7_2 then
              L8_2 = {}
              L5_2 = L8_2
            end
          end
          L6_2 = type
          L7_2 = L5_2
          L6_2 = L6_2(L7_2)
          if "table" ~= L6_2 then
            L6_2 = {}
            L5_2 = L6_2
          end
          L6_2 = os
          L6_2 = L6_2.date
          L7_2 = "!%Y-%m-%dT%H:%M:%S.000Z"
          L6_2 = L6_2(L7_2)
          L7_2 = ipairs
          L8_2 = L5_2
          L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
          for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
            L13_2 = L12_2.endTime
            if "" ~= L13_2 then
              L13_2 = L12_2.endTime
              if L13_2 then
                goto lbl_221
              end
            end
            L12_2.endTime = L6_2
            L13_2 = L12_2.startTime
            if L13_2 then
              L13_2 = L12_2.startTime
              L13_2 = #L13_2
              if L13_2 >= 19 then
                L13_2 = os
                L13_2 = L13_2.time
                L14_2 = {}
                L15_2 = tonumber
                L16_2 = L12_2.startTime
                L17_2 = L16_2
                L16_2 = L16_2.sub
                L18_2 = 1
                L19_2 = 4
                L16_2, L17_2, L18_2, L19_2, L20_2 = L16_2(L17_2, L18_2, L19_2)
                L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
                L14_2.year = L15_2
                L15_2 = tonumber
                L16_2 = L12_2.startTime
                L17_2 = L16_2
                L16_2 = L16_2.sub
                L18_2 = 6
                L19_2 = 7
                L16_2, L17_2, L18_2, L19_2, L20_2 = L16_2(L17_2, L18_2, L19_2)
                L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
                L14_2.month = L15_2
                L15_2 = tonumber
                L16_2 = L12_2.startTime
                L17_2 = L16_2
                L16_2 = L16_2.sub
                L18_2 = 9
                L19_2 = 10
                L16_2, L17_2, L18_2, L19_2, L20_2 = L16_2(L17_2, L18_2, L19_2)
                L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
                L14_2.day = L15_2
                L15_2 = tonumber
                L16_2 = L12_2.startTime
                L17_2 = L16_2
                L16_2 = L16_2.sub
                L18_2 = 12
                L19_2 = 13
                L16_2, L17_2, L18_2, L19_2, L20_2 = L16_2(L17_2, L18_2, L19_2)
                L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
                L14_2.hour = L15_2
                L15_2 = tonumber
                L16_2 = L12_2.startTime
                L17_2 = L16_2
                L16_2 = L16_2.sub
                L18_2 = 15
                L19_2 = 16
                L16_2, L17_2, L18_2, L19_2, L20_2 = L16_2(L17_2, L18_2, L19_2)
                L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
                L14_2.min = L15_2
                L15_2 = tonumber
                L16_2 = L12_2.startTime
                L17_2 = L16_2
                L16_2 = L16_2.sub
                L18_2 = 18
                L19_2 = 19
                L16_2, L17_2, L18_2, L19_2, L20_2 = L16_2(L17_2, L18_2, L19_2)
                L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
                L14_2.sec = L15_2
                L13_2 = L13_2(L14_2)
                L14_2 = os
                L14_2 = L14_2.time
                L15_2 = {}
                L16_2 = tonumber
                L18_2 = L6_2
                L17_2 = L6_2.sub
                L19_2 = 1
                L20_2 = 4
                L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2, L19_2, L20_2)
                L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                L15_2.year = L16_2
                L16_2 = tonumber
                L18_2 = L6_2
                L17_2 = L6_2.sub
                L19_2 = 6
                L20_2 = 7
                L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2, L19_2, L20_2)
                L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                L15_2.month = L16_2
                L16_2 = tonumber
                L18_2 = L6_2
                L17_2 = L6_2.sub
                L19_2 = 9
                L20_2 = 10
                L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2, L19_2, L20_2)
                L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                L15_2.day = L16_2
                L16_2 = tonumber
                L18_2 = L6_2
                L17_2 = L6_2.sub
                L19_2 = 12
                L20_2 = 13
                L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2, L19_2, L20_2)
                L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                L15_2.hour = L16_2
                L16_2 = tonumber
                L18_2 = L6_2
                L17_2 = L6_2.sub
                L19_2 = 15
                L20_2 = 16
                L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2, L19_2, L20_2)
                L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                L15_2.min = L16_2
                L16_2 = tonumber
                L18_2 = L6_2
                L17_2 = L6_2.sub
                L19_2 = 18
                L20_2 = 19
                L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2, L19_2, L20_2)
                L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                L15_2.sec = L16_2
                L14_2 = L14_2(L15_2)
                L15_2 = math
                L15_2 = L15_2.floor
                L16_2 = L14_2 - L13_2
                L16_2 = L16_2 / 3600
                L16_2 = L16_2 * 10
                L15_2 = L15_2(L16_2)
                L15_2 = L15_2 / 10
                L12_2.hours = L15_2
              end
            end
            ::lbl_221::
          end
          L7_2 = json
          L7_2 = L7_2.encode
          L8_2 = L5_2
          L7_2 = L7_2(L8_2)
          L8_2 = MySQL
          L8_2 = L8_2.update
          L8_2 = L8_2.await
          L9_2 = "UPDATE mdt_units SET dutyRecords = ?, status = ? WHERE citizenid = ?"
          L10_2 = {}
          L11_2 = L7_2
          L12_2 = "off-duty"
          L13_2 = L2_2
          L10_2[1] = L11_2
          L10_2[2] = L12_2
          L10_2[3] = L13_2
          L8_2(L9_2, L10_2)
        end
      end
    end
  end
end
L3_1(L4_1, L5_1)
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.startTime
    L9_2 = L7_2.endTime
    if L8_2 and L9_2 and "" ~= L9_2 then
      L10_2 = L1_1
      L11_2 = L8_2
      L10_2 = L10_2(L11_2)
      L11_2 = L1_1
      L12_2 = L9_2
      L11_2 = L11_2(L12_2)
      if L10_2 and L11_2 then
        L12_2 = L0_1
        L13_2 = L10_2
        L12_2 = L12_2(L13_2)
        L13_2 = L0_1
        L14_2 = L11_2
        L13_2 = L13_2(L14_2)
        if L12_2 and L13_2 then
          L14_2 = L13_2 - L12_2
          L14_2 = L14_2 / 3600
          if L14_2 > 0 then
            L7_2.startTime = L10_2
            L7_2.endTime = L11_2
            L15_2 = math
            L15_2 = L15_2.floor
            L16_2 = L14_2 * 10
            L15_2 = L15_2(L16_2)
            L15_2 = L15_2 / 10
            L7_2.hours = L15_2
            L15_2 = table
            L15_2 = L15_2.insert
            L16_2 = L1_2
            L17_2 = L7_2
            L15_2(L16_2, L17_2)
          end
        end
      end
    end
  end
  return L1_2
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = "SELECT dutyRecords FROM mdt_units WHERE citizenid = ?"
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = L1_2
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = L2_2[1]
    if L3_2 then
      goto lbl_18
    end
  end
  L3_2 = 0
  do return L3_2 end
  ::lbl_18::
  L3_2 = json
  L3_2 = L3_2.decode
  L4_2 = L2_2[1]
  L4_2 = L4_2.dutyRecords
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = {}
  end
  L4_2 = L3_1
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = 0
  L6_2 = ipairs
  L7_2 = L4_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = L11_2.hours
    L5_2 = L5_2 + L12_2
  end
  L6_2 = "UPDATE mdt_units SET dutyRecords = ?, totalHours = ? WHERE citizenid = ?"
  L7_2 = {}
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  L9_2 = L5_2
  L10_2 = A0_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L6_2
  L10_2 = L7_2
  L8_2 = L8_2(L9_2, L10_2)
  if L8_2 then
    L9_2 = L8_2.affectedRows
    if L9_2 > 0 then
      L9_2 = 1
      if L9_2 then
        goto lbl_66
      end
    end
  end
  L9_2 = 0
  ::lbl_66::
  return L9_2
end
L5_1 = CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = Wait
  L1_2 = 6000
  L0_2(L1_2)
  function L0_2(A0_3)
    local L1_3, L2_3
    L1_3 = tonumber
    L2_3 = A0_3
    return L1_3(L2_3)
  end
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  L2_2 = GetResourceMetadata
  L3_2 = L1_2
  L4_2 = "version"
  L5_2 = 0
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = PerformHttpRequest
  L4_2 = "https://raw.githubusercontent.com/kartik1410/kartik-tebex-version/master/kartik-mdt"
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    if not A1_3 then
      L3_3 = print
      L4_3 = "^1Version check disabled because github is down.^0"
      L3_3(L4_3)
      return
    end
    L3_3 = json
    L3_3 = L3_3.decode
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    if L3_3 then
      L4_3 = L3_3.version
      if L4_3 then
        L4_3 = L0_2
        L5_3 = L3_3.version
        L6_3 = L5_3
        L5_3 = L5_3.gsub
        L7_3 = "%."
        L8_3 = ""
        L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L5_3(L6_3, L7_3, L8_3)
        L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
        L5_3 = L0_2
        L6_3 = L2_2
        L7_3 = L6_3
        L6_3 = L6_3.gsub
        L8_3 = "%."
        L9_3 = ""
        L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L6_3(L7_3, L8_3, L9_3)
        L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
        if L4_3 > L5_3 then
          L4_3 = print
          L5_3 = "^3["
          L6_3 = L1_2
          L7_3 = [[
] New Update Available.^0
Current Version: ^5]]
          L8_3 = L2_2
          L9_3 = [[
^0.
New Version: ^5]]
          L10_3 = L3_3.version
          L11_3 = [[
^0.
Changelogs: ^5]]
          L12_3 = L3_3.notes
          L13_3 = "^0."
          L5_3 = L5_3 .. L6_3 .. L7_3 .. L8_3 .. L9_3 .. L10_3 .. L11_3 .. L12_3 .. L13_3
          L4_3(L5_3)
          L4_3 = sendVersionUpdateEmbed
          L5_3 = L2_2
          L6_3 = L3_3.version
          L7_3 = L3_3.notes
          L4_3(L5_3, L6_3, L7_3)
        else
          L4_3 = L0_2
          L5_3 = L3_3.version
          L6_3 = L5_3
          L5_3 = L5_3.gsub
          L7_3 = "%."
          L8_3 = ""
          L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L5_3(L6_3, L7_3, L8_3)
          L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
          L5_3 = L0_2
          L6_3 = L2_2
          L7_3 = L6_3
          L6_3 = L6_3.gsub
          L8_3 = "%."
          L9_3 = ""
          L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L6_3(L7_3, L8_3, L9_3)
          L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
          if L4_3 == L5_3 then
            L4_3 = print
            L5_3 = "^2["
            L6_3 = L1_2
            L7_3 = "] running on latest version^0."
            L5_3 = L5_3 .. L6_3 .. L7_3
            L4_3(L5_3)
          end
        end
    end
    else
      L4_3 = print
      L5_3 = "^1Failed to decode version information.^0"
      L4_3(L5_3)
    end
  end
  L6_2 = "GET"
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = print
  L4_2 = "^2[kartik-mdt] Loaded^0 [https://discord.gg/qxGPARNwNP]"
  L3_2(L4_2)
end
L5_1(L6_1)
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = {}
  L2_2 = {}
  L2_2.color = 16082267
  L2_2.title = "** NUI Exploit **"
  L3_2 = GetPlayerName
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = " was kicked for exploiting NUI DevTools"
  L3_2 = L3_2 .. L4_2
  L2_2.description = L3_2
  L2_2.type = "rich"
  L1_2[1] = L2_2
  L2_2 = print
  L3_2 = "[NUI Exploit Detected] Kicking Player ID: "
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L2_2(L3_2)
  L2_2 = PerformHttpRequest
  L3_2 = ServerConfig
  L3_2 = L3_2.AdminWebhook
  function L4_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3
    if 200 ~= A0_3 then
      L3_3 = print
      L4_3 = "Failed to send webhook: "
      L5_3 = tostring
      L6_3 = A0_3
      L5_3 = L5_3(L6_3)
      L4_3 = L4_3 .. L5_3
      L3_3(L4_3)
    end
  end
  L5_2 = "POST"
  L6_2 = json
  L6_2 = L6_2.encode
  L7_2 = {}
  L7_2.username = "MDT & Dispatch"
  L7_2.embeds = L1_2
  L7_2.avatar_url = "https://r2.fivemanage.com/f2nWaTPuI7VQSmQCGKxLD/1.png"
  L7_2.content = ""
  L6_2 = L6_2(L7_2)
  L7_2 = {}
  L7_2["Content-Type"] = "application/json"
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = DropPlayer
  L3_2 = A0_2
  L4_2 = "You tried opening NUI Devtools. Avoid it"
  L2_2(L3_2, L4_2)
end
exploitKick = L5_1
L5_1 = RegisterServerEvent
L6_1 = GetCurrentResourceName
L6_1 = L6_1()
function L7_1()
  local L0_2, L1_2, L2_2
  L0_2 = source
  L1_2 = exploitKick
  L2_2 = L0_2
  L1_2(L2_2)
end
L5_1(L6_1, L7_1)
L5_1 = lib
L5_1 = L5_1.callback
L5_1 = L5_1.register
L6_1 = "kartik-mdt:server:getPhoneNumber"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    if L2_2 then
      L2_2 = GetPhoneNumber
      if L2_2 then
        L2_2 = GetPhoneNumber
        L3_2 = A1_2.citizenId
        L4_2 = A0_2
        L2_2 = L2_2(L3_2, L4_2)
        if L2_2 then
          goto lbl_22
        end
      end
      L2_2 = GetPlayerByCitizenId
      L3_2 = A1_2.citizenId
      L2_2 = L2_2(L3_2)
      L2_2 = L2_2.phone
      if not L2_2 then
        L2_2 = "Unknown"
      end
      ::lbl_22::
      return L2_2
    end
  end
end
L5_1(L6_1, L7_1)
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = fetchActiveUnitsHere
  L3_2 = L3_2()
  L3_2 = L3_2.units
  if not L3_2 then
    L3_2 = {}
  end
  L4_2 = pairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    if L9_2 then
      L10_2 = L9_2.source
      if L10_2 then
        L10_2 = TriggerClientEvent
        L11_2 = "kartik-mdt:client:syncChanges"
        L12_2 = L9_2.source
        L13_2 = A0_2
        L14_2 = A1_2
        L10_2(L11_2, L12_2, L13_2, L14_2)
      end
    end
  end
end
syncDataBetweenUnits = L5_1
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = ServerConfig
  L5_2 = L5_2.Webhooks
  L5_2 = L5_2[A0_2]
  if not L5_2 then
    return
  end
  L6_2 = {}
  L7_2 = {}
  L7_2.title = A1_2
  L8_2 = A2_2 or L8_2
  if not A2_2 then
    L8_2 = ""
  end
  L7_2.description = L8_2
  L8_2 = A3_2 or L8_2
  if not A3_2 then
    L8_2 = 16777215
  end
  L7_2.color = L8_2
  L8_2 = A4_2 or L8_2
  if not A4_2 then
    L8_2 = {}
  end
  L7_2.fields = L8_2
  L8_2 = {}
  L9_2 = "MDT Logger \226\128\162 "
  L10_2 = os
  L10_2 = L10_2.date
  L11_2 = "%Y-%m-%d %H:%M:%S"
  L10_2 = L10_2(L11_2)
  L9_2 = L9_2 .. L10_2
  L8_2.text = L9_2
  L7_2.footer = L8_2
  L6_2[1] = L7_2
  L7_2 = PerformHttpRequest
  L8_2 = L5_2
  function L9_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3
    if 204 ~= A0_3 then
      L3_3 = print
      L4_3 = "[DiscordLog] Failed to send log: "
      L5_3 = A0_3
      L3_3(L4_3, L5_3)
    end
  end
  L10_2 = "POST"
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = {}
  L12_2.username = "MDT System"
  L12_2.avatar_url = "https://r2.fivemanage.com/f2nWaTPuI7VQSmQCGKxLD/1.png"
  L12_2.embeds = L6_2
  L11_2 = L11_2(L12_2)
  L12_2 = {}
  L12_2["Content-Type"] = "application/json"
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
end
SendDiscordLog = L5_1
