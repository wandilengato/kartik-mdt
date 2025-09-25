local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchIncidents"
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
      L4_2.incidents = L5_2
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
      L7_2 = "WHERE LOWER(title) LIKE LOWER(?) OR LOWER(incidentId) LIKE LOWER(?) "
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
    L11_2 = "SELECT * FROM mdt_police_incidents "
    L12_2 = L7_2
    L13_2 = " ORDER BY incidentId DESC"
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
      L19_2 = "Unknown"
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
            L19_2 = L22_2.name
          end
        else
          L19_2 = L18_2.officerId
        end
      end
      L20_2 = {}
      L21_2 = L18_2.incidentId
      L20_2.incidentId = L21_2
      L21_2 = L18_2.title
      L20_2.title = L21_2
      L21_2 = L19_2 or L21_2
      if not L19_2 then
        L21_2 = "Unknown"
      end
      L20_2.officerName = L21_2
      L21_2 = L18_2.isLocked
      L20_2.isLocked = L21_2
      L21_2 = L18_2.isLocked
      if L21_2 then
        L21_2 = checkReportPermission
        L22_2 = L3_2.citizenId
        L23_2 = L18_2.incidentId
        L24_2 = "incident"
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
      L21_2 = L18_2.dateTime
      L20_2.dateTime = L21_2
      L21_2 = L18_2.priority
      L20_2.priority = L21_2
      L21_2 = L18_2.status
      L20_2.status = L21_2
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
    L13_2 = "SELECT COUNT(*) as count FROM mdt_police_incidents "
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
    L15_2.incidents = L9_2
    L15_2.totalCount = L10_2
    return L15_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchIncidentDataByIncidentId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if A1_2 then
    L2_2 = A1_2.incidentId
    L3_2 = "SELECT * FROM mdt_police_incidents WHERE incidentId = ?"
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
      L13_2 = "incident"
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
    L10_2 = A1_2.incidentId
    L9_2.incidentId = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.title
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.title = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.priority
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.priority = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.evidence_locker
    L9_2.evidenceLockerNumber = L10_2
    L10_2 = L5_2[1]
    L10_2 = L10_2.status
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.status = L10_2
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
    L10_2 = L10_2.timeline
    if not L10_2 then
      L10_2 = ""
    end
    L9_2.timeline = L10_2
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
L1_1 = "kartik-mdt:server:addNewIncident"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  if A1_2 then
    L2_2 = A1_2.incidentToAdd
    if L2_2 then
      L2_2 = A1_2.incidentToAdd
      L3_2 = L2_2.title
      L4_2 = L2_2.location
      L5_2 = L2_2.priority
      L6_2 = L2_2.description
      L7_2 = L2_2.dateTime
      L8_2 = L2_2.officerId
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
      L12_2 = L2_2.status
      L13_2 = json
      L13_2 = L13_2.encode
      L14_2 = L2_2.timeline
      L13_2 = L13_2(L14_2)
      L14_2 = "INSERT INTO mdt_police_incidents (title, officerId, location, priority, description, dateTime, evidences, peopleInvolved, vehiclesInvolved, status, timeline) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
      L15_2 = {}
      L16_2 = L3_2
      L17_2 = L8_2
      L18_2 = L4_2
      L19_2 = L5_2
      L20_2 = L6_2
      L21_2 = L7_2
      L22_2 = L9_2
      L23_2 = L10_2
      L24_2 = L11_2
      L25_2 = L12_2
      L26_2 = L13_2
      L15_2[1] = L16_2
      L15_2[2] = L17_2
      L15_2[3] = L18_2
      L15_2[4] = L19_2
      L15_2[5] = L20_2
      L15_2[6] = L21_2
      L15_2[7] = L22_2
      L15_2[8] = L23_2
      L15_2[9] = L24_2
      L15_2[10] = L25_2
      L15_2[11] = L26_2
      L16_2 = MySQL
      L16_2 = L16_2.query
      L16_2 = L16_2.await
      L17_2 = L14_2
      L18_2 = L15_2
      L16_2 = L16_2(L17_2, L18_2)
      L17_2 = L16_2.insertId
      L18_2 = SendDiscordLog
      L19_2 = "pd_incident"
      L20_2 = "\240\159\147\132 Incident Created"
      L21_2 = nil
      L22_2 = 8311585
      L23_2 = {}
      L24_2 = {}
      L24_2.name = "Incident ID"
      L25_2 = tostring
      L26_2 = L17_2
      L25_2 = L25_2(L26_2)
      L24_2.value = L25_2
      L24_2.inline = true
      L25_2 = {}
      L25_2.name = "Title"
      L26_2 = L3_2 or L26_2
      if not L3_2 then
        L26_2 = "N/A"
      end
      L25_2.value = L26_2
      L25_2.inline = true
      L26_2 = {}
      L26_2.name = "Priority"
      L27_2 = L5_2 or L27_2
      if not L5_2 then
        L27_2 = "N/A"
      end
      L26_2.value = L27_2
      L26_2.inline = true
      L27_2 = {}
      L27_2.name = "Status"
      L28_2 = L12_2 or L28_2
      if not L12_2 then
        L28_2 = "N/A"
      end
      L27_2.value = L28_2
      L27_2.inline = true
      L28_2 = {}
      L28_2.name = "Location"
      L29_2 = L4_2 or L29_2
      if not L4_2 then
        L29_2 = "N/A"
      end
      L28_2.value = L29_2
      L28_2.inline = true
      L29_2 = {}
      L29_2.name = "Player"
      L30_2 = FormatPlayer
      L31_2 = A0_2
      L30_2 = L30_2(L31_2)
      L29_2.value = L30_2
      L29_2.inline = false
      L23_2[1] = L24_2
      L23_2[2] = L25_2
      L23_2[3] = L26_2
      L23_2[4] = L27_2
      L23_2[5] = L28_2
      L23_2[6] = L29_2
      L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
      L18_2 = {}
      L18_2.success = true
      L18_2.message = "Incident added successfully."
      L18_2.incidentId = L17_2
      return L18_2
  end
  else
    L2_2 = false
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:saveIncident"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  if A1_2 then
    L2_2 = A1_2.incidentId
    if L2_2 then
      L2_2 = A1_2.title
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
      L8_2 = A1_2.incidentId
      L9_2 = A1_2.status
      L10_2 = A1_2.priority
      L11_2 = A1_2.evidenceLockerNumber
      L12_2 = json
      L12_2 = L12_2.encode
      L13_2 = A1_2.timeline
      L12_2 = L12_2(L13_2)
      L13_2 = "UPDATE mdt_police_incidents SET title = ?, location = ?, evidence_locker = ?, description = ?, evidences = ?, peopleInvolved = ?, vehiclesInvolved = ?, status = ?, priority = ?, timeline = ? WHERE incidentId = ?"
      L14_2 = {}
      L15_2 = L2_2
      L16_2 = L3_2
      L17_2 = L11_2
      L18_2 = L4_2
      L19_2 = L5_2
      L20_2 = L6_2
      L21_2 = L7_2
      L22_2 = L9_2
      L23_2 = L10_2
      L24_2 = L12_2
      L25_2 = L8_2
      L14_2[1] = L15_2
      L14_2[2] = L16_2
      L14_2[3] = L17_2
      L14_2[4] = L18_2
      L14_2[5] = L19_2
      L14_2[6] = L20_2
      L14_2[7] = L21_2
      L14_2[8] = L22_2
      L14_2[9] = L23_2
      L14_2[10] = L24_2
      L14_2[11] = L25_2
      L15_2 = MySQL
      L15_2 = L15_2.query
      L15_2 = L15_2.await
      L16_2 = L13_2
      L17_2 = L14_2
      L15_2 = L15_2(L16_2, L17_2)
      L16_2 = L15_2.affectedRows
      if L16_2 > 0 then
        L16_2 = SendDiscordLog
        L17_2 = "pd_incident"
        L18_2 = "\226\156\143\239\184\143 Incident Updated"
        L19_2 = nil
        L20_2 = 3447003
        L21_2 = {}
        L22_2 = {}
        L22_2.name = "Incident ID"
        L23_2 = tostring
        L24_2 = L8_2
        L23_2 = L23_2(L24_2)
        L22_2.value = L23_2
        L22_2.inline = true
        L23_2 = {}
        L23_2.name = "Title"
        L24_2 = L2_2 or L24_2
        if not L2_2 then
          L24_2 = "N/A"
        end
        L23_2.value = L24_2
        L23_2.inline = true
        L24_2 = {}
        L24_2.name = "Priority"
        L25_2 = L10_2 or L25_2
        if not L10_2 then
          L25_2 = "N/A"
        end
        L24_2.value = L25_2
        L24_2.inline = true
        L25_2 = {}
        L25_2.name = "Status"
        L26_2 = L9_2 or L26_2
        if not L9_2 then
          L26_2 = "N/A"
        end
        L25_2.value = L26_2
        L25_2.inline = true
        L26_2 = {}
        L26_2.name = "Location"
        L27_2 = L3_2 or L27_2
        if not L3_2 then
          L27_2 = "N/A"
        end
        L26_2.value = L27_2
        L26_2.inline = true
        L27_2 = {}
        L27_2.name = "Player"
        L28_2 = FormatPlayer
        L29_2 = A0_2
        L28_2 = L28_2(L29_2)
        L27_2.value = L28_2
        L27_2.inline = false
        L21_2[1] = L22_2
        L21_2[2] = L23_2
        L21_2[3] = L24_2
        L21_2[4] = L25_2
        L21_2[5] = L26_2
        L21_2[6] = L27_2
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
        L16_2 = {}
        L16_2.success = true
        L16_2.message = "Incident saved successfully."
        return L16_2
      else
        L16_2 = {}
        L16_2.success = false
        L16_2.message = "Failed to update the incident."
        return L16_2
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
L1_1 = "kartik-mdt:server:deleteIncident"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.incidentId
    if L2_2 then
      L2_2 = A1_2.incidentId
      L3_2 = "DELETE FROM mdt_police_incidents WHERE incidentId = ?"
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
        L7_2 = "pd_incident"
        L8_2 = "\240\159\151\145\239\184\143 Incident Deleted"
        L9_2 = nil
        L10_2 = 15158332
        L11_2 = {}
        L12_2 = {}
        L12_2.name = "Incident ID"
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
        L6_2.message = "Incident deleted successfully."
        return L6_2
      else
        L6_2 = {}
        L6_2.success = false
        L6_2.message = "Failed to delete the incident."
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
