local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchEMSReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = GetPlayerData
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L4_2 = {}
      L5_2 = {}
      L4_2.reports = L5_2
      L4_2.totalCount = 0
      return L4_2
    end
    L4_2 = A1_2.page
    L5_2 = A1_2.query
    if not L5_2 then
      L5_2 = ""
    end
    L6_2 = L4_2 - 1
    L6_2 = L6_2 * 10
    L7_2 = ""
    L8_2 = {}
    L9_2 = {}
    L10_2 = 0
    if "" ~= L5_2 then
      L7_2 = "WHERE LOWER(name) LIKE LOWER(?) OR LOWER(reportId) LIKE LOWER(?) "
      L11_2 = {}
      L12_2 = "%"
      L13_2 = L5_2
      L14_2 = "%"
      L12_2 = L12_2 .. L13_2 .. L14_2
      L13_2 = "%"
      L14_2 = L5_2
      L15_2 = "%"
      L13_2 = L13_2 .. L14_2 .. L15_2
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L8_2 = L11_2
    end
    L11_2 = "SELECT * FROM mdt_ems_reports "
    L12_2 = L7_2
    L11_2 = L11_2 .. L12_2
    L12_2 = L11_2
    L13_2 = " LIMIT 10 OFFSET ?"
    L12_2 = L12_2 .. L13_2
    L11_2 = L12_2
    L12_2 = table
    L12_2 = L12_2.insert
    L13_2 = L8_2
    L14_2 = L6_2
    L12_2(L13_2, L14_2)
    L12_2 = MySQL
    L12_2 = L12_2.query
    L12_2 = L12_2.await
    L13_2 = L11_2
    L14_2 = L8_2
    L12_2 = L12_2(L13_2, L14_2)
    L13_2 = ipairs
    L14_2 = L12_2
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
    for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
      L19_2 = "Unknown"
      L20_2 = L18_2.medicId
      if L20_2 then
        L20_2 = getCitizenIdFromUnitId
        L21_2 = L18_2.medicId
        L20_2 = L20_2(L21_2)
        if L20_2 then
          L21_2 = GetOfflinePlayerByCitizenId
          L22_2 = L20_2
          L21_2 = L21_2(L22_2)
          if L21_2 then
            L22_2 = L21_2.name
            L19_2 = L22_2 or L19_2
          end
          if not L22_2 then
            L19_2 = "Unknown"
          end
        else
          L19_2 = L18_2.medicId
        end
      end
      L20_2 = {}
      L21_2 = L18_2.reportId
      L20_2.reportId = L21_2
      L21_2 = L18_2.name
      L20_2.reportName = L21_2
      L21_2 = L18_2.dateTime
      L20_2.dateTime = L21_2
      L20_2.medicName = L19_2
      L21_2 = L18_2.isLocked
      L20_2.isLocked = L21_2
      L21_2 = L18_2.isLocked
      if L21_2 then
        L21_2 = checkReportPermission
        L22_2 = L3_2.citizenId
        L23_2 = L18_2.reportId
        L24_2 = "report"
        L25_2 = "ems"
        L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2)
        L21_2 = not L21_2
      end
      L20_2.canAccessReport = L21_2
      L21_2 = L18_2.lock_reason
      if not L21_2 then
        L21_2 = "No reason specified"
      end
      L20_2.lockReason = L21_2
      L21_2 = L18_2.category
      L20_2.category = L21_2
      L21_2 = L18_2.peopleInvolved
      L20_2.peopleInvolved = L21_2
      L21_2 = L18_2.location
      L20_2.location = L21_2
      L21_2 = table
      L21_2 = L21_2.insert
      L22_2 = L9_2
      L23_2 = L20_2
      L21_2(L22_2, L23_2)
    end
    if "" ~= L5_2 then
      L8_2[3] = nil
    end
    L13_2 = "SELECT COUNT(*) as count FROM mdt_ems_reports "
    L14_2 = L7_2
    L13_2 = L13_2 .. L14_2
    L14_2 = MySQL
    L14_2 = L14_2.query
    L14_2 = L14_2.await
    L15_2 = L13_2
    L16_2 = L8_2
    L14_2 = L14_2(L15_2, L16_2)
    L15_2 = L14_2[1]
    L10_2 = L15_2.count
    L15_2 = {}
    L15_2.reports = L9_2
    L15_2.totalCount = L10_2
    return L15_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchEMSReportDataByReportId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if A1_2 then
    L2_2 = A1_2.reportId
    L3_2 = "SELECT * FROM mdt_ems_reports WHERE reportId = ?"
    L4_2 = {}
    L5_2 = L2_2
    L4_2[1] = L5_2
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = #L5_2
    if 0 == L6_2 then
      L6_2 = {}
      L6_2.success = false
      L6_2.message = "No data found."
      return L6_2
    end
    L6_2 = L5_2[1]
    L6_2 = L6_2.isLocked
    if L6_2 then
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
      L8_2 = L6_2.jobData
      L8_2 = L8_2.name
      L9_2 = L6_2.jobData
      L9_2 = L9_2.grade
      L9_2 = L9_2.level
      L10_2 = checkReportPermission
      L11_2 = L7_2
      L12_2 = L2_2
      L13_2 = "report"
      L14_2 = "ems"
      L15_2 = L8_2
      L16_2 = L9_2
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      if not L10_2 then
        L10_2 = {}
        L10_2.success = false
        L10_2.message = "No permission."
        return L10_2
      end
    end
    L6_2 = {}
    L7_2 = pcall
    L8_2 = json
    L8_2 = L8_2.decode
    L9_2 = L5_2[1]
    L9_2 = L9_2.members
    if not L9_2 then
      L9_2 = "[]"
    end
    L7_2, L8_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L9_2 = type
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if "table" == L9_2 then
        L9_2 = ipairs
        L10_2 = L8_2
        L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
        for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
          L15_2 = GetPlayerData
          L16_2 = A0_2
          L15_2 = L15_2(L16_2)
          if L15_2 then
            L16_2 = {}
            L16_2.id = L14_2
            L17_2 = L15_2.name
            L16_2.name = L17_2
            L17_2 = table
            L17_2 = L17_2.insert
            L18_2 = L6_2
            L19_2 = L16_2
            L17_2(L18_2, L19_2)
          end
        end
      end
    end
    L9_2 = {}
    L10_2 = A1_2.reportId
    L9_2.reportId = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.name
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.reportName = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.medicId
    L9_2.medicId = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.dateTime
    L9_2.dateTime = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.location
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.location = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.description
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.description = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.evidences
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.evidences = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.peopleInvolved
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.peopleInvolved = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.vehiclesInvolved
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.vehiclesInvolved = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.bodyData
    if not L10_2 then
      L10_2 = {}
    end
    L9_2.bodyData = L10_2
    L10_2 = L6_2 or L10_2
    if not L6_2 then
      L10_2 = {}
    end
    L9_2.reportAccess = L10_2
    L10_2 = {}
    L10_2.success = true
    L10_2.data = L9_2
    return L10_2
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data found."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:addNewEMSReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  if A1_2 then
    L2_2 = A1_2.reportToAdd
    if L2_2 then
      L2_2 = A1_2.reportToAdd
      L3_2 = L2_2.reportName
      L4_2 = L2_2.medicId
      L5_2 = L2_2.location
      L6_2 = L2_2.description
      L7_2 = L2_2.dateTime
      L8_2 = json
      L8_2 = L8_2.encode
      L9_2 = L2_2.evidences
      L8_2 = L8_2(L9_2)
      L9_2 = json
      L9_2 = L9_2.encode
      L10_2 = L2_2.peopleInvolved
      L9_2 = L9_2(L10_2)
      L10_2 = json
      L10_2 = L10_2.encode
      L11_2 = L2_2.vehiclesInvolved
      L10_2 = L10_2(L11_2)
      L11_2 = "INSERT INTO mdt_ems_reports (name, medicId, location, description, dateTime, evidences, peopleInvolved, vehiclesInvolved) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
      L12_2 = {}
      L13_2 = L3_2
      L14_2 = L4_2
      L15_2 = L5_2
      L16_2 = L6_2
      L17_2 = L7_2
      L18_2 = L8_2
      L19_2 = L9_2
      L20_2 = L10_2
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L12_2[3] = L15_2
      L12_2[4] = L16_2
      L12_2[5] = L17_2
      L12_2[6] = L18_2
      L12_2[7] = L19_2
      L12_2[8] = L20_2
      L13_2 = MySQL
      L13_2 = L13_2.query
      L13_2 = L13_2.await
      L14_2 = L11_2
      L15_2 = L12_2
      L13_2 = L13_2(L14_2, L15_2)
      L14_2 = L13_2.insertId
      L15_2 = SendDiscordLog
      L16_2 = "ems_reports"
      L17_2 = "\240\159\147\132 EMS Report Created"
      L18_2 = nil
      L19_2 = 3066993
      L20_2 = {}
      L21_2 = {}
      L21_2.name = "Report ID"
      L22_2 = tostring
      L23_2 = L14_2
      L22_2 = L22_2(L23_2)
      L21_2.value = L22_2
      L21_2.inline = true
      L22_2 = {}
      L22_2.name = "Report Name"
      L22_2.value = L3_2
      L22_2.inline = true
      L23_2 = {}
      L23_2.name = "Medic ID"
      L23_2.value = L4_2
      L23_2.inline = true
      L24_2 = {}
      L24_2.name = "Player"
      L25_2 = FormatPlayer
      L26_2 = A0_2
      L25_2 = L25_2(L26_2)
      L24_2.value = L25_2
      L24_2.inline = false
      L20_2[1] = L21_2
      L20_2[2] = L22_2
      L20_2[3] = L23_2
      L20_2[4] = L24_2
      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
      L15_2 = {}
      L15_2.success = true
      L15_2.message = "Report added successfully."
      L15_2.reportId = L14_2
      return L15_2
  end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:saveCurrentEMSReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if A1_2 then
    L2_2 = A1_2.reportId
    if L2_2 then
      L2_2 = A1_2.reportName
      L3_2 = A1_2.location
      L4_2 = A1_2.description
      L5_2 = json
      L5_2 = L5_2.encode
      L6_2 = A1_2.evidences
      L5_2 = L5_2(L6_2)
      L6_2 = json
      L6_2 = L6_2.encode
      L7_2 = A1_2.peopleInvolved
      L6_2 = L6_2(L7_2)
      L7_2 = json
      L7_2 = L7_2.encode
      L8_2 = A1_2.vehiclesInvolved
      L7_2 = L7_2(L8_2)
      L8_2 = json
      L8_2 = L8_2.encode
      L9_2 = A1_2.bodyData
      L8_2 = L8_2(L9_2)
      if not L8_2 then
        L8_2 = {}
      end
      L9_2 = A1_2.reportId
      L10_2 = "UPDATE mdt_ems_reports SET name = ?, location = ?, description = ?, evidences = ?, peopleInvolved = ?, vehiclesInvolved = ?, bodyData = ? WHERE reportId = ?"
      L11_2 = {}
      L12_2 = L2_2
      L13_2 = L3_2
      L14_2 = L4_2
      L15_2 = L5_2
      L16_2 = L6_2
      L17_2 = L7_2
      L18_2 = L8_2
      L19_2 = L9_2
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L11_2[3] = L14_2
      L11_2[4] = L15_2
      L11_2[5] = L16_2
      L11_2[6] = L17_2
      L11_2[7] = L18_2
      L11_2[8] = L19_2
      L12_2 = MySQL
      L12_2 = L12_2.query
      L12_2 = L12_2.await
      L13_2 = L10_2
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      L13_2 = L12_2.affectedRows
      if L13_2 > 0 then
        L13_2 = SendDiscordLog
        L14_2 = "ems_reports"
        L15_2 = "\226\156\143\239\184\143 EMS Report Edited"
        L16_2 = nil
        L17_2 = 15105570
        L18_2 = {}
        L19_2 = {}
        L19_2.name = "Report ID"
        L20_2 = tostring
        L21_2 = L9_2
        L20_2 = L20_2(L21_2)
        L19_2.value = L20_2
        L19_2.inline = true
        L20_2 = {}
        L20_2.name = "Updated Name"
        L20_2.value = L2_2
        L20_2.inline = true
        L21_2 = {}
        L21_2.name = "Player"
        L22_2 = FormatPlayer
        L23_2 = A0_2
        L22_2 = L22_2(L23_2)
        L21_2.value = L22_2
        L21_2.inline = false
        L18_2[1] = L19_2
        L18_2[2] = L20_2
        L18_2[3] = L21_2
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
        L13_2 = {}
        L13_2.success = true
        L13_2.message = "Report saved successfully."
        return L13_2
      else
        L13_2 = {}
        L13_2.success = false
        L13_2.message = "Failed to update the report."
        return L13_2
      end
  end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:deleteEMSReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.reportId
    if L2_2 then
      L2_2 = A1_2.reportId
      L3_2 = "DELETE FROM mdt_ems_reports WHERE reportId = ?"
      L4_2 = {}
      L5_2 = L2_2
      L4_2[1] = L5_2
      L5_2 = MySQL
      L5_2 = L5_2.query
      L5_2 = L5_2.await
      L6_2 = L3_2
      L7_2 = L4_2
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = L5_2.affectedRows
      if L6_2 > 0 then
        L6_2 = SendDiscordLog
        L7_2 = "ems_reports"
        L8_2 = "\240\159\151\145\239\184\143 EMS Report Deleted"
        L9_2 = nil
        L10_2 = 10038562
        L11_2 = {}
        L12_2 = {}
        L12_2.name = "Report ID"
        L13_2 = tostring
        L14_2 = L2_2
        L13_2 = L13_2(L14_2)
        L12_2.value = L13_2
        L12_2.inline = true
        L13_2 = {}
        L13_2.name = "Player"
        L14_2 = FormatPlayer
        L15_2 = A0_2
        L14_2 = L14_2(L15_2)
        L13_2.value = L14_2
        L13_2.inline = false
        L11_2[1] = L12_2
        L11_2[2] = L13_2
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        L6_2 = {}
        L6_2.success = true
        L6_2.message = "Report deleted successfully."
        return L6_2
      else
        L6_2 = {}
        L6_2.success = false
        L6_2.message = "Failed to delete the report."
        return L6_2
      end
  end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = nil
  L2_2 = {}
  if A0_2 then
    L3_2 = A0_2.page
    if L3_2 then
      L3_2 = A0_2.limit
      if L3_2 then
        L3_2 = A0_2.page
        L4_2 = A0_2.limit
        L5_2 = L3_2 - 1
        L5_2 = L5_2 * L4_2
        L1_2 = "SELECT * FROM mdt_ems_reports ORDER BY dateTime DESC LIMIT ? OFFSET ?;"
        L6_2 = table
        L6_2 = L6_2.insert
        L7_2 = L2_2
        L8_2 = L4_2
        L6_2(L7_2, L8_2)
        L6_2 = table
        L6_2 = L6_2.insert
        L7_2 = L2_2
        L8_2 = L5_2
        L6_2(L7_2, L8_2)
    end
  end
  else
    L1_2 = "SELECT * FROM mdt_ems_reports ORDER BY dateTime DESC;"
  end
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = {}
  L5_2 = ipairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = {}
    L12_2 = L10_2.reportId
    L11_2.reportId = L12_2
    L12_2 = L10_2.name
    if not L12_2 then
      L12_2 = ""
    end
    L11_2.reportName = L12_2
    L12_2 = L10_2.dateTime
    L11_2.dateTime = L12_2
    L12_2 = L10_2.location
    if not L12_2 then
      L12_2 = ""
    end
    L11_2.location = L12_2
    L12_2 = table
    L12_2 = L12_2.insert
    L13_2 = L4_2
    L14_2 = L11_2
    L12_2(L13_2, L14_2)
  end
  L5_2 = {}
  L5_2.reports = L4_2
  L5_2.success = true
  return L5_2
end
fetchEMSRecentReports = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:getRecentEMSReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = fetchEMSRecentReports
  L3_2 = A1_2
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
