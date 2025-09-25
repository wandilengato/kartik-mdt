local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchReports"
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
    L11_2 = "SELECT * FROM mdt_police_reports "
    L12_2 = L7_2
    L13_2 = " ORDER BY reportId DESC"
    L11_2 = L11_2 .. L12_2 .. L13_2
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
      L19_2 = "unknown"
      L20_2 = L18_2.officerId
      if L20_2 then
        L20_2 = getCitizenIdFromUnitId
        L21_2 = L18_2.officerId
        L20_2 = L20_2(L21_2)
        if L20_2 then
          L21_2 = pcall
          function L22_2()
            local L0_3, L1_3
            L0_3 = GetOfflinePlayerByCitizenId
            L1_3 = L20_2
            return L0_3(L1_3)
          end
          L21_2, L22_2 = L21_2(L22_2)
          if L21_2 and L22_2 then
            L23_2 = L22_2.name
            L19_2 = L23_2 or L19_2
          end
          if not L23_2 then
            L19_2 = "Unknown"
          end
        else
          L19_2 = L18_2.officerId
        end
      end
      L20_2 = {}
      L21_2 = L18_2.reportId
      L20_2.reportId = L21_2
      L21_2 = L18_2.name
      L20_2.reportName = L21_2
      L21_2 = L18_2.dateTime
      L20_2.dateTime = L21_2
      L20_2.officerName = L19_2
      L21_2 = L18_2.isLocked
      L20_2.isLocked = L21_2
      L21_2 = L18_2.isLocked
      if L21_2 then
        L21_2 = checkReportPermission
        L22_2 = L3_2.citizenId
        L23_2 = L18_2.reportId
        L24_2 = "report"
        L25_2 = "police"
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
    L13_2 = "SELECT COUNT(*) as count FROM mdt_police_reports "
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
L1_1 = "kartik-mdt:server:fetchReportDataByReportId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if A1_2 then
    L2_2 = A1_2.reportId
    L3_2 = "SELECT * FROM mdt_police_reports WHERE reportId = ?"
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
      L14_2 = "police"
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
    L10_2 = L10_2.officerId
    L9_2.officerId = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.evidence_locker
    L9_2.evidenceLockerNumber = L10_2
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
L1_1 = "kartik-mdt:server:fetchLockerItems"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A1_2 then
    L2_2 = A1_2.lockerNumber
    L3_2 = GetEvidenceStashId
    if L3_2 then
      L3_2 = GetEvidenceStashId
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        goto lbl_15
      end
    end
    L3_2 = "evidence_"
    L4_2 = L2_2
    L3_2 = L3_2 .. L4_2
    ::lbl_15::
    L4_2 = getStashItems
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = {}
    L6_2 = pairs
    L7_2 = L4_2
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
      if L11_2 then
        L12_2 = {}
        L13_2 = formatMetadata
        if L13_2 then
          L13_2 = formatMetadata
          L14_2 = L11_2.metadata
          L13_2 = L13_2(L14_2)
          if L13_2 then
            goto lbl_39
            L12_2 = L13_2 or L12_2
          end
        end
        L13_2 = {}
        L12_2 = L13_2
        ::lbl_39::
        L13_2 = table
        L13_2 = L13_2.insert
        L14_2 = L5_2
        L15_2 = {}
        L16_2 = L11_2.name
        L15_2.name = L16_2
        L16_2 = L11_2.label
        L15_2.label = L16_2
        L16_2 = L11_2.count
        if not L16_2 then
          L16_2 = L11_2.amount
        end
        L15_2.amount = L16_2
        L16_2 = L11_2.label
        L15_2.description = L16_2
        L15_2.metadata = L12_2
        L13_2(L14_2, L15_2)
      else
      end
    end
    L6_2 = {}
    L6_2.lockerItems = L5_2
    return L6_2
  else
    L2_2 = nil
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:addNewReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  if A1_2 then
    L2_2 = A1_2.reportToAdd
    if L2_2 then
      L2_2 = A1_2.reportToAdd
      L3_2 = L2_2.reportName
      L4_2 = L2_2.officerId
      L5_2 = L2_2.location
      L6_2 = L2_2.category
      L7_2 = L2_2.description
      L8_2 = L2_2.dateTime
      L9_2 = json
      L9_2 = L9_2.encode
      L10_2 = L2_2.evidences
      L9_2 = L9_2(L10_2)
      L10_2 = json
      L10_2 = L10_2.encode
      L11_2 = L2_2.peopleInvolved
      L10_2 = L10_2(L11_2)
      L11_2 = json
      L11_2 = L11_2.encode
      L12_2 = L2_2.vehiclesInvolved
      L11_2 = L11_2(L12_2)
      L12_2 = "INSERT INTO mdt_police_reports (name, officerId, location, category, description, dateTime, evidences, peopleInvolved, vehiclesInvolved) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
      L13_2 = {}
      L14_2 = L3_2
      L15_2 = L4_2
      L16_2 = L5_2
      L17_2 = L6_2
      L18_2 = L7_2
      L19_2 = L8_2
      L20_2 = L9_2
      L21_2 = L10_2
      L22_2 = L11_2
      L13_2[1] = L14_2
      L13_2[2] = L15_2
      L13_2[3] = L16_2
      L13_2[4] = L17_2
      L13_2[5] = L18_2
      L13_2[6] = L19_2
      L13_2[7] = L20_2
      L13_2[8] = L21_2
      L13_2[9] = L22_2
      L14_2 = MySQL
      L14_2 = L14_2.query
      L14_2 = L14_2.await
      L15_2 = L12_2
      L16_2 = L13_2
      L14_2 = L14_2(L15_2, L16_2)
      L15_2 = L14_2.insertId
      L16_2 = SendDiscordLog
      L17_2 = "pd_report"
      L18_2 = "\240\159\147\139 New Report Created"
      L19_2 = nil
      L20_2 = 3066993
      L21_2 = {}
      L22_2 = {}
      L22_2.name = "\240\159\145\174 Officer ID"
      L23_2 = tostring
      L24_2 = L4_2
      L23_2 = L23_2(L24_2)
      L22_2.value = L23_2
      L22_2.inline = true
      L23_2 = {}
      L23_2.name = "\240\159\147\132 Report Name"
      L24_2 = L3_2 or L24_2
      if not L3_2 then
        L24_2 = "Unknown"
      end
      L23_2.value = L24_2
      L23_2.inline = true
      L24_2 = {}
      L24_2.name = "\240\159\147\141 Location"
      L25_2 = L5_2 or L25_2
      if not L5_2 then
        L25_2 = "N/A"
      end
      L24_2.value = L25_2
      L24_2.inline = true
      L25_2 = {}
      L25_2.name = "\240\159\143\183\239\184\143 Category"
      L26_2 = L6_2 or L26_2
      if not L6_2 then
        L26_2 = "N/A"
      end
      L25_2.value = L26_2
      L25_2.inline = true
      L26_2 = {}
      L26_2.name = "\240\159\149\146 Date/Time"
      L27_2 = os
      L27_2 = L27_2.date
      L28_2 = "%Y-%m-%d %H:%M:%S"
      L27_2 = L27_2(L28_2)
      L26_2.value = L27_2
      L26_2.inline = false
      L21_2[1] = L22_2
      L21_2[2] = L23_2
      L21_2[3] = L24_2
      L21_2[4] = L25_2
      L21_2[5] = L26_2
      L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
      L16_2 = {}
      L16_2.success = true
      L16_2.message = "Report added successfully."
      L16_2.reportId = L15_2
      return L16_2
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
L1_1 = "kartik-mdt:server:saveCurrentReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
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
      L8_2 = A1_2.reportId
      L9_2 = A1_2.evidenceLockerNumber
      L10_2 = "UPDATE mdt_police_reports SET name = ?, location = ?, evidence_locker = ?, description = ?, evidences = ?, peopleInvolved = ?, vehiclesInvolved = ? WHERE reportId = ?"
      L11_2 = {}
      L12_2 = L2_2
      L13_2 = L3_2
      L14_2 = L9_2
      L15_2 = L4_2
      L16_2 = L5_2
      L17_2 = L6_2
      L18_2 = L7_2
      L19_2 = L8_2
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
        L14_2 = "pd_report"
        L15_2 = "\226\156\143\239\184\143 Report Updated"
        L16_2 = nil
        L17_2 = 3447003
        L18_2 = {}
        L19_2 = {}
        L19_2.name = "Report ID"
        L20_2 = tostring
        L21_2 = L8_2 or L21_2
        if not L8_2 then
          L21_2 = "N/A"
        end
        L20_2 = L20_2(L21_2)
        L19_2.value = L20_2
        L19_2.inline = true
        L20_2 = {}
        L20_2.name = "Name"
        L21_2 = L2_2 or L21_2
        if not L2_2 or "" == L2_2 or not L2_2 then
          L21_2 = "N/A"
        end
        L20_2.value = L21_2
        L20_2.inline = true
        L21_2 = {}
        L21_2.name = "Location"
        L22_2 = L3_2 or L22_2
        if not L3_2 or "" == L3_2 or not L3_2 then
          L22_2 = "N/A"
        end
        L21_2.value = L22_2
        L21_2.inline = true
        L22_2 = {}
        L22_2.name = "Officer"
        L23_2 = GetPlayerName
        L24_2 = A0_2
        L23_2 = L23_2(L24_2)
        if not L23_2 then
          L23_2 = "Source: "
          L24_2 = tostring
          L25_2 = A0_2
          L24_2 = L24_2(L25_2)
          L23_2 = L23_2 .. L24_2
        end
        L22_2.value = L23_2
        L22_2.inline = true
        L23_2 = {}
        L23_2.name = "Source"
        L24_2 = tostring
        L25_2 = A0_2
        L24_2 = L24_2(L25_2)
        L23_2.value = L24_2
        L23_2.inline = true
        L18_2[1] = L19_2
        L18_2[2] = L20_2
        L18_2[3] = L21_2
        L18_2[4] = L22_2
        L18_2[5] = L23_2
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
L1_1 = "kartik-mdt:server:deleteReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A1_2 then
    L2_2 = A1_2.reportId
    if L2_2 then
      L2_2 = A1_2.reportId
      L3_2 = "DELETE FROM mdt_police_reports WHERE reportId = ?"
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
        L7_2 = "pd_report"
        L8_2 = "\240\159\151\145\239\184\143 Report Deleted"
        L9_2 = nil
        L10_2 = 15158332
        L11_2 = {}
        L12_2 = {}
        L12_2.name = "Report ID"
        if L2_2 then
          L13_2 = tostring
          L14_2 = L2_2
          L13_2 = L13_2(L14_2)
          if L13_2 then
            goto lbl_39
          end
        end
        L13_2 = "N/A"
        ::lbl_39::
        L12_2.value = L13_2
        L12_2.inline = true
        L13_2 = {}
        L13_2.name = "Officer"
        L14_2 = GetPlayerName
        L15_2 = A0_2
        L14_2 = L14_2(L15_2)
        if not L14_2 then
          L14_2 = "Source: "
          L15_2 = tostring
          L16_2 = A0_2
          L15_2 = L15_2(L16_2)
          L14_2 = L14_2 .. L15_2
        end
        L13_2.value = L14_2
        L13_2.inline = true
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
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:jailPerson"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    if L2_2 then
      L2_2 = A1_2.jailSentence
      if L2_2 then
        L2_2 = A1_2.citizenId
        L3_2 = A1_2.jailSentence
        L4_2 = pcall
        L5_2 = JailPerson
        L6_2 = A0_2
        L7_2 = L2_2
        L8_2 = L3_2
        L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
        if L4_2 then
          L6_2 = SendDiscordLog
          L7_2 = "jail"
          L8_2 = "\240\159\154\147 Jail Sentence Applied"
          L9_2 = 15105570
          L10_2 = {}
          L11_2 = {}
          L11_2.name = "Citizen ID"
          L11_2.value = L2_2
          L11_2.inline = true
          L12_2 = {}
          L12_2.name = "Sentence (months)"
          L13_2 = tostring
          L14_2 = L3_2
          L13_2 = L13_2(L14_2)
          L12_2.value = L13_2
          L12_2.inline = true
          L13_2 = {}
          L13_2.name = "Officer"
          L14_2 = GetPlayerName
          L15_2 = A0_2
          L14_2 = L14_2(L15_2)
          if not L14_2 then
            L14_2 = "Source: "
            L15_2 = A0_2
            L14_2 = L14_2 .. L15_2
          end
          L13_2.value = L14_2
          L13_2.inline = true
          L10_2[1] = L11_2
          L10_2[2] = L12_2
          L10_2[3] = L13_2
          L6_2(L7_2, L8_2, L9_2, L10_2)
          return L5_2
        else
          L6_2 = DefaultJailPerson
          L7_2 = A0_2
          L8_2 = L2_2
          L9_2 = L3_2
          return L6_2(L7_2, L8_2, L9_2)
        end
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
L1_1 = "kartik-mdt:server:finePerson"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    if L2_2 then
      L2_2 = A1_2.fineAmount
      if L2_2 then
        L2_2 = A1_2.citizenId
        L3_2 = A1_2.fineAmount
        L4_2 = pcall
        L5_2 = FinePerson
        L6_2 = A0_2
        L7_2 = L2_2
        L8_2 = L3_2
        L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
        if L4_2 then
          L6_2 = SendDiscordLog
          L7_2 = "fine"
          L8_2 = "\240\159\146\176 Fine Issued"
          L9_2 = 15844367
          L10_2 = {}
          L11_2 = {}
          L11_2.name = "Citizen ID"
          L11_2.value = L2_2
          L11_2.inline = true
          L12_2 = {}
          L12_2.name = "Fine Amount"
          L13_2 = "$"
          L14_2 = tostring
          L15_2 = L3_2
          L14_2 = L14_2(L15_2)
          L13_2 = L13_2 .. L14_2
          L12_2.value = L13_2
          L12_2.inline = true
          L13_2 = {}
          L13_2.name = "Officer"
          L14_2 = GetPlayerName
          L15_2 = A0_2
          L14_2 = L14_2(L15_2)
          if not L14_2 then
            L14_2 = "Source: "
            L15_2 = A0_2
            L14_2 = L14_2 .. L15_2
          end
          L13_2.value = L14_2
          L13_2.inline = true
          L10_2[1] = L11_2
          L10_2[2] = L12_2
          L10_2[3] = L13_2
          L6_2(L7_2, L8_2, L9_2, L10_2)
          return L5_2
        else
          L6_2 = DefaultFinePerson
          L7_2 = A0_2
          L8_2 = L2_2
          L9_2 = L3_2
          return L6_2(L7_2, L8_2, L9_2)
        end
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
L1_1 = "kartik-mdt:server:fetchEvidenceCases"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A1_2 then
    L2_2 = fetchEvidenceLockers
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    L3_2 = L2_2.cases
    L4_2 = L2_2.totalCount
    L5_2 = {}
    L5_2.success = true
    L5_2.cases = L3_2
    L5_2.totalCount = L4_2
    return L5_2
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
