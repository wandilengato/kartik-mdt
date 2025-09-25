local L0_1, L1_1, L2_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = {}
  L3_2 = {}
  L3_2.report = "mdt_police_reports"
  L3_2.incident = "mdt_police_incidents"
  L2_2.police = L3_2
  L3_2 = {}
  L3_2.report = "mdt_ems_reports"
  L3_2.incident = "mdt_ems_incidents"
  L2_2.ems = L3_2
  L3_2 = L2_2[A1_2]
  if not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = L3_2[A0_2]
  return L4_2
end
resolveReportTable = L0_1
function L0_1(A0_2)
  local L1_2
  if "incident" == A0_2 then
    L1_2 = "incidentId"
    if L1_2 then
      goto lbl_7
    end
  end
  L1_2 = "reportId"
  ::lbl_7::
  return L1_2
end
resolveReportIdColumn = L0_1
function L0_1(A0_2)
  local L1_2
  if "ems" == A0_2 then
    L1_2 = "medicId"
    if L1_2 then
      goto lbl_7
    end
  end
  L1_2 = "officerId"
  ::lbl_7::
  return L1_2
end
resolveOfficerColumn = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = "SELECT id FROM mdt_units WHERE citizenid = ?"
  L8_2 = {}
  L9_2 = A0_2
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 then
    L7_2 = #L6_2
    if 0 ~= L7_2 then
      goto lbl_17
    end
  end
  L7_2 = false
  do return L7_2 end
  ::lbl_17::
  L7_2 = L6_2[1]
  L7_2 = L7_2.id
  if not L7_2 then
    L8_2 = false
    return L8_2
  end
  L8_2 = resolveReportTable
  L9_2 = A2_2
  L10_2 = A3_2
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    L9_2 = false
    return L9_2
  end
  L9_2 = resolveReportIdColumn
  L10_2 = A2_2
  L9_2 = L9_2(L10_2)
  L10_2 = resolveOfficerColumn
  L11_2 = A3_2
  L10_2 = L10_2(L11_2)
  L11_2 = string
  L11_2 = L11_2.format
  L12_2 = [[
        SELECT %s, members
        FROM %s
        WHERE %s = ?
    ]]
  L13_2 = L10_2
  L14_2 = L8_2
  L15_2 = L9_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L12_2 = MySQL
  L12_2 = L12_2.query
  L12_2 = L12_2.await
  L13_2 = L11_2
  L14_2 = {}
  L15_2 = A1_2
  L14_2[1] = L15_2
  L12_2 = L12_2(L13_2, L14_2)
  if L12_2 then
    L13_2 = #L12_2
    if 0 ~= L13_2 then
      goto lbl_60
    end
  end
  L13_2 = false
  do return L13_2 end
  ::lbl_60::
  L13_2 = L12_2[1]
  L14_2 = L13_2[L10_2]
  if L14_2 == L7_2 then
    L14_2 = true
    return L14_2
  end
  L14_2 = Config
  L14_2 = L14_2.Permissions
  L14_2 = L14_2[A4_2]
  if not L14_2 then
    L14_2 = false
    return L14_2
  end
  L14_2 = Config
  L14_2 = L14_2.Permissions
  L14_2 = L14_2[A4_2]
  L14_2 = L14_2.management_rank
  if A5_2 >= L14_2 then
    L14_2 = true
    return L14_2
  end
  L14_2 = pcall
  L15_2 = json
  L15_2 = L15_2.decode
  L16_2 = L13_2.members
  if not L16_2 then
    L16_2 = "[]"
  end
  L14_2, L15_2 = L14_2(L15_2, L16_2)
  if L14_2 then
    L16_2 = type
    L17_2 = L15_2
    L16_2 = L16_2(L17_2)
    if "table" == L16_2 then
      L16_2 = ipairs
      L17_2 = L15_2
      L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
      for L20_2, L21_2 in L16_2, L17_2, L18_2, L19_2 do
        if L21_2 == A0_2 then
          L22_2 = true
          return L22_2
        end
      end
    end
  end
  L16_2 = false
  return L16_2
end
checkReportPermission = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:unlockReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if not A1_2 then
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
  L2_2 = A1_2.reportId
  L3_2 = A1_2.reportType
  L4_2 = A1_2.page
  L5_2 = GetPlayerData
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L6_2 = {}
    L6_2.success = false
    L6_2.message = "No player data found."
    return L6_2
  end
  L6_2 = L5_2.citizenId
  L7_2 = resolveReportTable
  L8_2 = L3_2
  L9_2 = L4_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = resolveReportIdColumn
  L9_2 = L3_2
  L8_2 = L8_2(L9_2)
  if not L7_2 then
    L9_2 = {}
    L9_2.success = false
    L9_2.message = "Invalid report type or page."
    return L9_2
  end
  L9_2 = MySQL
  L9_2 = L9_2.query
  L9_2 = L9_2.await
  L10_2 = "SELECT * FROM %s WHERE %s = ?"
  L11_2 = L10_2
  L10_2 = L10_2.format
  L12_2 = L7_2
  L13_2 = L8_2
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = {}
  L12_2 = L2_2
  L11_2[1] = L12_2
  L9_2 = L9_2(L10_2, L11_2)
  if L9_2 then
    L10_2 = #L9_2
    if 0 ~= L10_2 then
      goto lbl_59
    end
  end
  L10_2 = {}
  L10_2.success = false
  L10_2.message = "Report not found."
  do return L10_2 end
  ::lbl_59::
  L10_2 = checkReportPermission
  L11_2 = L6_2
  L12_2 = L2_2
  L13_2 = L3_2
  L14_2 = L4_2
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  if not L10_2 then
    L10_2 = {}
    L10_2.success = false
    L10_2.message = "No permission."
    return L10_2
  end
  L10_2 = "UPDATE %s SET isLocked = 0 WHERE %s = ?"
  L11_2 = L10_2
  L10_2 = L10_2.format
  L12_2 = L7_2
  L13_2 = L8_2
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = MySQL
  L11_2 = L11_2.update
  L11_2 = L11_2.await
  L12_2 = L10_2
  L13_2 = {}
  L14_2 = L2_2
  L13_2[1] = L14_2
  L11_2 = L11_2(L12_2, L13_2)
  if L11_2 and L11_2 > 0 then
    L12_2 = {}
    L12_2.success = true
    L12_2.message = "Report unlocked successfully."
    if L12_2 then
      goto lbl_100
    end
  end
  L12_2 = {}
  L12_2.success = false
  L12_2.message = "Failed to unlock report."
  ::lbl_100::
  return L12_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:lockReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if not A1_2 then
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
  L2_2 = A1_2.reportId
  L3_2 = A1_2.lockReason
  L4_2 = A1_2.reportType
  L5_2 = A1_2.page
  L6_2 = GetPlayerData
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L7_2 = {}
    L7_2.success = false
    L7_2.message = "No player data found."
    return L7_2
  end
  L7_2 = L6_2.citizenId
  L8_2 = resolveReportTable
  L9_2 = L4_2
  L10_2 = L5_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = resolveReportIdColumn
  L10_2 = L4_2
  L9_2 = L9_2(L10_2)
  if not L8_2 then
    L10_2 = {}
    L10_2.success = false
    L10_2.message = "Invalid report type or page."
    return L10_2
  end
  L10_2 = MySQL
  L10_2 = L10_2.query
  L10_2 = L10_2.await
  L11_2 = "SELECT * FROM %s WHERE %s = ?"
  L12_2 = L11_2
  L11_2 = L11_2.format
  L13_2 = L8_2
  L14_2 = L9_2
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = {}
  L13_2 = L2_2
  L12_2[1] = L13_2
  L10_2 = L10_2(L11_2, L12_2)
  if L10_2 then
    L11_2 = #L10_2
    if 0 ~= L11_2 then
      goto lbl_60
    end
  end
  L11_2 = {}
  L11_2.success = false
  L11_2.message = "Report not found."
  do return L11_2 end
  ::lbl_60::
  L11_2 = checkReportPermission
  L12_2 = L7_2
  L13_2 = L2_2
  L14_2 = L4_2
  L15_2 = L5_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  if not L11_2 then
    L11_2 = {}
    L11_2.success = false
    L11_2.message = "No permission."
    return L11_2
  end
  L11_2 = "UPDATE %s SET isLocked = 1, lock_reason = ? WHERE %s = ?"
  L12_2 = L11_2
  L11_2 = L11_2.format
  L13_2 = L8_2
  L14_2 = L9_2
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = MySQL
  L12_2 = L12_2.update
  L12_2 = L12_2.await
  L13_2 = L11_2
  L14_2 = {}
  L15_2 = L3_2
  L16_2 = L2_2
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L12_2 = L12_2(L13_2, L14_2)
  if L12_2 and L12_2 > 0 then
    L13_2 = {}
    L13_2.success = true
    L13_2.message = "Report locked successfully."
    if L13_2 then
      goto lbl_102
    end
  end
  L13_2 = {}
  L13_2.success = false
  L13_2.message = "Failed to lock report."
  ::lbl_102::
  return L13_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:grantReportAccess"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = A1_2.reportId
  L3_2 = A1_2.userId
  L4_2 = A1_2.reportType
  L5_2 = A1_2.page
  if not L2_2 or not L3_2 then
    L6_2 = {}
    L6_2.success = false
    L6_2.message = "Invalid data."
    return L6_2
  end
  L6_2 = resolveReportTable
  L7_2 = L4_2
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = resolveReportIdColumn
  L8_2 = L4_2
  L7_2 = L7_2(L8_2)
  if not L6_2 then
    L8_2 = {}
    L8_2.success = false
    L8_2.message = "Invalid report type or page."
    return L8_2
  end
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = "SELECT members FROM %s WHERE %s = ?"
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = L6_2
  L12_2 = L7_2
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = {}
  L11_2 = L2_2
  L10_2[1] = L11_2
  L8_2 = L8_2(L9_2, L10_2)
  if L8_2 then
    L9_2 = #L8_2
    if 0 ~= L9_2 then
      goto lbl_51
    end
  end
  L9_2 = {}
  L9_2.success = false
  L9_2.message = "Report not found."
  do return L9_2 end
  ::lbl_51::
  L9_2 = L8_2[1]
  L9_2 = L9_2.members
  if not L9_2 then
    L9_2 = "[]"
  end
  L10_2 = pcall
  L11_2 = json
  L11_2 = L11_2.decode
  L12_2 = L9_2
  L10_2, L11_2 = L10_2(L11_2, L12_2)
  if L10_2 then
    L12_2 = type
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if "table" == L12_2 then
      goto lbl_71
    end
  end
  L12_2 = {}
  L11_2 = L12_2
  ::lbl_71::
  L12_2 = ipairs
  L13_2 = L11_2
  L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
  for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
    if L17_2 == L3_2 then
      L18_2 = {}
      L18_2.success = false
      L18_2.message = "Already has access."
      return L18_2
    end
  end
  L12_2 = table
  L12_2 = L12_2.insert
  L13_2 = L11_2
  L14_2 = L3_2
  L12_2(L13_2, L14_2)
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  L13_2 = MySQL
  L13_2 = L13_2.update
  L13_2 = L13_2.await
  L14_2 = "UPDATE %s SET members = ? WHERE %s = ?"
  L15_2 = L14_2
  L14_2 = L14_2.format
  L16_2 = L6_2
  L17_2 = L7_2
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L15_2 = {}
  L16_2 = L12_2
  L17_2 = L2_2
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L13_2(L14_2, L15_2)
  L13_2 = {}
  L13_2.success = true
  return L13_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:revokeReportAccess"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L2_2 = A1_2.reportId
  L3_2 = A1_2.userId
  L4_2 = A1_2.reportType
  L5_2 = A1_2.page
  if not L2_2 or not L3_2 then
    L6_2 = {}
    L6_2.success = false
    L6_2.message = "Invalid data."
    return L6_2
  end
  L6_2 = resolveReportTable
  L7_2 = L4_2
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = resolveReportIdColumn
  L8_2 = L4_2
  L7_2 = L7_2(L8_2)
  if not L6_2 then
    L8_2 = {}
    L8_2.success = false
    L8_2.message = "Invalid report type or page."
    return L8_2
  end
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = "SELECT members FROM %s WHERE %s = ?"
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = L6_2
  L12_2 = L7_2
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = {}
  L11_2 = L2_2
  L10_2[1] = L11_2
  L8_2 = L8_2(L9_2, L10_2)
  if L8_2 then
    L9_2 = #L8_2
    if 0 ~= L9_2 then
      goto lbl_51
    end
  end
  L9_2 = {}
  L9_2.success = false
  L9_2.message = "Report not found."
  do return L9_2 end
  ::lbl_51::
  L9_2 = L8_2[1]
  L9_2 = L9_2.members
  if not L9_2 then
    L9_2 = "[]"
  end
  L10_2 = pcall
  L11_2 = json
  L11_2 = L11_2.decode
  L12_2 = L9_2
  L10_2, L11_2 = L10_2(L11_2, L12_2)
  if L10_2 then
    L12_2 = type
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if "table" == L12_2 then
      goto lbl_71
    end
  end
  L12_2 = {}
  L11_2 = L12_2
  ::lbl_71::
  L12_2 = {}
  L13_2 = ipairs
  L14_2 = L11_2
  L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
  for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
    if L18_2 ~= L3_2 then
      L19_2 = table
      L19_2 = L19_2.insert
      L20_2 = L12_2
      L21_2 = L18_2
      L19_2(L20_2, L21_2)
    end
  end
  L13_2 = json
  L13_2 = L13_2.encode
  L14_2 = L12_2
  L13_2 = L13_2(L14_2)
  L14_2 = MySQL
  L14_2 = L14_2.update
  L14_2 = L14_2.await
  L15_2 = "UPDATE %s SET members = ? WHERE %s = ?"
  L16_2 = L15_2
  L15_2 = L15_2.format
  L17_2 = L6_2
  L18_2 = L7_2
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L16_2 = {}
  L17_2 = L13_2
  L18_2 = L2_2
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L14_2(L15_2, L16_2)
  L14_2 = {}
  L14_2.success = true
  return L14_2
end
L0_1(L1_1, L2_1)
