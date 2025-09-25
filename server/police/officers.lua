local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchOfficers"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
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
  L5_2 = fetchUnitData
  L6_2 = L3_2
  L7_2 = L4_2
  L8_2 = "police"
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2)
  L7_2 = {}
  L7_2.officers = L5_2
  L7_2.totalCount = L6_2
  return L7_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:addNewOfficers"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  if A1_2 then
    L2_2 = A1_2.officer
    if L2_2 then
      L2_2 = A1_2.officer
      L3_2 = L2_2.id
      if not L3_2 then
        L3_2 = ""
      end
      L4_2 = L2_2.citizenId
      if not L4_2 then
        L4_2 = ""
      end
      L5_2 = L2_2.department
      if not L5_2 then
        L5_2 = "police"
      end
      L6_2 = L2_2.rank
      if not L6_2 then
        L6_2 = ""
      end
      L7_2 = L2_2.status
      if not L7_2 then
        L7_2 = ""
      end
      L8_2 = L2_2.dutyRecords
      if not L8_2 then
        L8_2 = {}
      end
      L9_2 = L2_2.serviceHistory
      if not L9_2 then
        L9_2 = {}
      end
      L10_2 = L2_2.currentAssignments
      if not L10_2 then
        L10_2 = {}
      end
      L11_2 = type
      L12_2 = L9_2
      L11_2 = L11_2(L12_2)
      if "string" == L11_2 then
        L11_2 = json
        L11_2 = L11_2.decode
        L12_2 = L9_2
        L11_2 = L11_2(L12_2)
        L9_2 = L11_2 or L9_2
        if not L11_2 then
          L11_2 = {}
          L9_2 = L11_2
        end
      end
      L11_2 = "SELECT * FROM mdt_units WHERE citizenid = ?"
      L12_2 = {}
      L13_2 = L4_2
      L12_2[1] = L13_2
      L13_2 = MySQL
      L13_2 = L13_2.query
      L13_2 = L13_2.await
      L14_2 = L11_2
      L15_2 = L12_2
      L13_2 = L13_2(L14_2, L15_2)
      if L13_2 then
        L14_2 = #L13_2
        if L14_2 > 0 then
          L14_2 = L13_2[1]
          L14_2 = L14_2.isFired
          if 0 == L14_2 then
            L14_2 = {}
            L14_2.success = false
            L14_2.message = "Failed to hire the officer: Officer is already active."
            return L14_2
          else
            L14_2 = {}
            L15_2 = os
            L15_2 = L15_2.date
            L16_2 = "%Y-%m-%d"
            L15_2 = L15_2(L16_2)
            L14_2.date = L15_2
            L15_2 = "Rehired to department: "
            L16_2 = L5_2
            L15_2 = L15_2 .. L16_2
            L14_2.event = L15_2
            L15_2 = table
            L15_2 = L15_2.insert
            L16_2 = L9_2
            L17_2 = L14_2
            L15_2(L16_2, L17_2)
            L15_2 = json
            L15_2 = L15_2.encode
            L16_2 = L9_2
            L15_2 = L15_2(L16_2)
            L16_2 = [[
                    UPDATE mdt_units
                    SET id = ?, citizenid = ?, department = ?, currentAssignments = ?, 
                        dutyRecords = ?, serviceHistory = ?, status = ?, isFired = 0
                    WHERE citizenid = ?
                ]]
            L17_2 = {}
            L18_2 = L3_2
            L19_2 = L4_2
            L20_2 = "police"
            L21_2 = json
            L21_2 = L21_2.encode
            L22_2 = L10_2
            L21_2 = L21_2(L22_2)
            L22_2 = json
            L22_2 = L22_2.encode
            L23_2 = L8_2
            L22_2 = L22_2(L23_2)
            L23_2 = L15_2
            L24_2 = L7_2
            L25_2 = L4_2
            L17_2[1] = L18_2
            L17_2[2] = L19_2
            L17_2[3] = L20_2
            L17_2[4] = L21_2
            L17_2[5] = L22_2
            L17_2[6] = L23_2
            L17_2[7] = L24_2
            L17_2[8] = L25_2
            L18_2 = MySQL
            L18_2 = L18_2.query
            L18_2 = L18_2.await
            L19_2 = L16_2
            L20_2 = L17_2
            L18_2 = L18_2(L19_2, L20_2)
            if L18_2 then
              L19_2 = L18_2.affectedRows
              if L19_2 > 0 then
                L19_2 = setJob
                L20_2 = L4_2
                L21_2 = L5_2
                L22_2 = L6_2
                L19_2 = L19_2(L20_2, L21_2, L22_2)
                L20_2 = SendDiscordLog
                L21_2 = "pd_officer"
                L22_2 = "\240\159\145\174 Officer Rehired"
                L23_2 = nil
                L24_2 = 3447003
                L25_2 = {}
                L26_2 = {}
                L26_2.name = "Citizen ID"
                L26_2.value = L4_2
                L26_2.inline = true
                L27_2 = {}
                L27_2.name = "Department"
                L27_2.value = L5_2
                L27_2.inline = true
                L28_2 = {}
                L28_2.name = "Rank"
                L29_2 = L6_2 or L29_2
                if not L6_2 then
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
                L25_2[1] = L26_2
                L25_2[2] = L27_2
                L25_2[3] = L28_2
                L25_2[4] = L29_2
                L20_2(L21_2, L22_2, L23_2, L24_2, L25_2)
                L20_2 = {}
                L20_2.success = true
                L20_2.message = "Rehired successfully."
                return L20_2
            end
            else
              L19_2 = {}
              L19_2.success = false
              L19_2.message = "Failed to rehire the officer."
              return L19_2
            end
          end
      end
      else
        L14_2 = [[
                INSERT INTO mdt_units (id, citizenid, department, currentAssignments, dutyRecords, serviceHistory, status)
                VALUES (?, ?, ?, ?, ?, ?, ?)
            ]]
        L15_2 = {}
        L16_2 = L3_2
        L17_2 = L4_2
        L18_2 = "police"
        L19_2 = json
        L19_2 = L19_2.encode
        L20_2 = L10_2
        L19_2 = L19_2(L20_2)
        L20_2 = json
        L20_2 = L20_2.encode
        L21_2 = L8_2
        L20_2 = L20_2(L21_2)
        L21_2 = json
        L21_2 = L21_2.encode
        L22_2 = L9_2
        L21_2 = L21_2(L22_2)
        L22_2 = L7_2
        L15_2[1] = L16_2
        L15_2[2] = L17_2
        L15_2[3] = L18_2
        L15_2[4] = L19_2
        L15_2[5] = L20_2
        L15_2[6] = L21_2
        L15_2[7] = L22_2
        L16_2 = MySQL
        L16_2 = L16_2.query
        L16_2 = L16_2.await
        L17_2 = L14_2
        L18_2 = L15_2
        L16_2 = L16_2(L17_2, L18_2)
        if L16_2 then
          L17_2 = L16_2.affectedRows
          if L17_2 > 0 then
            L17_2 = setJob
            L18_2 = L4_2
            L19_2 = L5_2
            L20_2 = L6_2
            L17_2 = L17_2(L18_2, L19_2, L20_2)
            L18_2 = SendDiscordLog
            L19_2 = "pd_officer"
            L20_2 = "\226\156\133 Officer Hired"
            L21_2 = nil
            L22_2 = 5763719
            L23_2 = {}
            L24_2 = {}
            L24_2.name = "Citizen ID"
            L24_2.value = L4_2
            L24_2.inline = true
            L25_2 = {}
            L25_2.name = "Department"
            L25_2.value = L5_2
            L25_2.inline = true
            L26_2 = {}
            L26_2.name = "Rank"
            L27_2 = L6_2 or L27_2
            if not L6_2 then
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
            L23_2[1] = L24_2
            L23_2[2] = L25_2
            L23_2[3] = L26_2
            L23_2[4] = L27_2
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
            L18_2 = {}
            L18_2.success = true
            L18_2.message = "Officer hired successfully."
            return L18_2
        end
        else
          L17_2 = {}
          L17_2.success = false
          L17_2.message = "Failed to hire the officer."
          return L17_2
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
L1_1 = "kartik-mdt:server:fetchOfficerDataByOfficerId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A1_2 then
    L2_2 = A1_2.OfficerId
    L3_2 = "SELECT * FROM mdt_units WHERE id = ?"
    L4_2 = {}
    L5_2 = L2_2
    L4_2[1] = L5_2
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = json
    L6_2 = L6_2.decode
    L7_2 = L5_2[1]
    L7_2 = L7_2.dutyRecords
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L6_2 = {}
    end
    L7_2 = {}
    L8_2 = #L6_2
    if L8_2 > 10 then
      L8_2 = {}
      L9_2 = table
      L9_2 = L9_2.unpack
      L10_2 = L6_2
      L11_2 = #L6_2
      L11_2 = L11_2 - 9
      L12_2 = #L6_2
      L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L8_2[4] = L12_2
      L7_2 = L8_2
    else
      L7_2 = L6_2
    end
    L8_2 = {}
    L9_2 = L5_2[1]
    L9_2 = L9_2.currentAssignments
    if not L9_2 then
      L9_2 = ""
    end
    L8_2.currentAssignments = L9_2
    L9_2 = L5_2[1]
    L9_2 = L9_2.serviceHistory
    if not L9_2 then
      L9_2 = ""
    end
    L8_2.serviceHistory = L9_2
    L9_2 = L7_2 or L9_2
    if not L7_2 then
      L9_2 = ""
    end
    L8_2.dutyRecords = L9_2
    L9_2 = L5_2[1]
    L9_2 = L9_2.totalHours
    if not L9_2 then
      L9_2 = 0.0
    end
    L8_2.totalHours = L9_2
    return L8_2
  else
    L2_2 = nil
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:updateOfficerRank"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  if A1_2 then
    L2_2 = A1_2.officerId
    L3_2 = A1_2.citizenId
    L4_2 = A1_2.rank
    L5_2 = A1_2.department
    L6_2 = json
    L6_2 = L6_2.encode
    L7_2 = A1_2.serviceHistory
    L6_2 = L6_2(L7_2)
    L7_2 = "UPDATE mdt_units SET serviceHistory = ?, department = ?, callsign = NULL WHERE id = ?"
    L8_2 = {}
    L9_2 = L6_2
    L10_2 = "police"
    L11_2 = L2_2
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = MySQL
    L9_2 = L9_2.query
    L9_2 = L9_2.await
    L10_2 = L7_2
    L11_2 = L8_2
    L9_2 = L9_2(L10_2, L11_2)
    if L9_2 then
      L10_2 = setJob
      L11_2 = L3_2
      L12_2 = L5_2
      L13_2 = L4_2
      L10_2 = L10_2(L11_2, L12_2, L13_2)
      if L10_2 then
        L11_2 = SendDiscordLog
        L12_2 = "pd_officer"
        L13_2 = "\240\159\147\138 Officer Rank Updated"
        L14_2 = nil
        L15_2 = 3447003
        L16_2 = {}
        L17_2 = {}
        L17_2.name = "Citizen ID"
        L18_2 = L3_2 or L18_2
        if not L3_2 then
          L18_2 = "N/A"
        end
        L17_2.value = L18_2
        L17_2.inline = true
        L18_2 = {}
        L18_2.name = "New Rank"
        L19_2 = L4_2 or L19_2
        if not L4_2 then
          L19_2 = "N/A"
        end
        L18_2.value = L19_2
        L18_2.inline = true
        L19_2 = {}
        L19_2.name = "Department"
        L20_2 = L5_2 or L20_2
        if not L5_2 then
          L20_2 = "police"
        end
        L19_2.value = L20_2
        L19_2.inline = true
        L20_2 = {}
        L20_2.name = "Player"
        L21_2 = FormatPlayer
        L22_2 = A0_2
        L21_2 = L21_2(L22_2)
        L20_2.value = L21_2
        L20_2.inline = false
        L16_2[1] = L17_2
        L16_2[2] = L18_2
        L16_2[3] = L19_2
        L16_2[4] = L20_2
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
      end
      L11_2 = {}
      L11_2.success = L10_2
      L11_2.message = "Updated"
      return L11_2
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
L1_1 = "kartik-mdt:server:addOfficerAssignment"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A1_2 then
    L2_2 = A1_2.officerId
    L3_2 = json
    L3_2 = L3_2.encode
    L4_2 = A1_2.currentAssignments
    L3_2 = L3_2(L4_2)
    L4_2 = "UPDATE mdt_units SET currentAssignments = ? WHERE id = ?"
    L5_2 = {}
    L6_2 = L3_2
    L7_2 = L2_2
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = MySQL
    L6_2 = L6_2.query
    L6_2 = L6_2.await
    L7_2 = L4_2
    L8_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L7_2 = SendDiscordLog
      L8_2 = "pd_officer"
      L9_2 = "\240\159\151\130\239\184\143 Officer Assignments Updated"
      L10_2 = nil
      L11_2 = 3447003
      L12_2 = {}
      L13_2 = {}
      L13_2.name = "Officer ID"
      L14_2 = tostring
      L15_2 = L2_2
      L14_2 = L14_2(L15_2)
      L13_2.value = L14_2
      L13_2.inline = true
      L14_2 = {}
      L14_2.name = "Player"
      L15_2 = FormatPlayer
      L16_2 = A0_2
      L15_2 = L15_2(L16_2)
      L14_2.value = L15_2
      L14_2.inline = false
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      L7_2 = {}
      L7_2.success = true
      L7_2.message = "Updated"
      return L7_2
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
L1_1 = "kartik-mdt:server:fireOfficer"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = json
    L3_2 = L3_2.encode
    L4_2 = A1_2.serviceHistory
    L3_2 = L3_2(L4_2)
    L4_2 = "UPDATE mdt_units SET isFired = ?, status = ?, serviceHistory = ?, callsign = NULL WHERE citizenid = ?"
    L5_2 = {}
    L6_2 = 1
    L7_2 = "off-duty"
    L8_2 = L3_2
    L9_2 = L2_2
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L5_2[4] = L9_2
    L6_2 = MySQL
    L6_2 = L6_2.query
    L6_2 = L6_2.await
    L7_2 = L4_2
    L8_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L7_2 = setJob
      L8_2 = L2_2
      L9_2 = "unemployed"
      L10_2 = 0
      L7_2 = L7_2(L8_2, L9_2, L10_2)
      if L7_2 then
        L8_2 = SendDiscordLog
        L9_2 = "pd_officer"
        L10_2 = "\240\159\148\165 Officer Fired"
        L11_2 = nil
        L12_2 = 15158332
        L13_2 = {}
        L14_2 = {}
        L14_2.name = "Citizen ID"
        L15_2 = L2_2 or L15_2
        if not L2_2 then
          L15_2 = "N/A"
        end
        L14_2.value = L15_2
        L14_2.inline = true
        L15_2 = {}
        L15_2.name = "New Job"
        L15_2.value = "unemployed"
        L15_2.inline = true
        L16_2 = {}
        L16_2.name = "Player"
        L17_2 = FormatPlayer
        L18_2 = A0_2
        L17_2 = L17_2(L18_2)
        L16_2.value = L17_2
        L16_2.inline = false
        L13_2[1] = L14_2
        L13_2[2] = L15_2
        L13_2[3] = L16_2
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
      end
      L8_2 = {}
      L8_2.success = L7_2
      L8_2.message = "Updated"
      return L8_2
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
L1_1 = "kartik-mdt:server:updateOfficertags"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A1_2 then
    L2_2 = A1_2.tags
    if L2_2 then
      L2_2 = A1_2.citizenId
      L3_2 = json
      L3_2 = L3_2.encode
      L4_2 = A1_2.tags
      L3_2 = L3_2(L4_2)
      L4_2 = "UPDATE mdt_units SET tags = ? WHERE citizenid = ?"
      L5_2 = {}
      L6_2 = L3_2
      L7_2 = L2_2
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = MySQL
      L6_2 = L6_2.query
      L6_2 = L6_2.await
      L7_2 = L4_2
      L8_2 = L5_2
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        L7_2 = SendDiscordLog
        L8_2 = "pd_officer"
        L9_2 = "\240\159\143\183\239\184\143 Officer Tags Updated"
        L10_2 = nil
        L11_2 = 8311585
        L12_2 = {}
        L13_2 = {}
        L13_2.name = "Citizen ID"
        L14_2 = L2_2 or L14_2
        if not L2_2 then
          L14_2 = "N/A"
        end
        L13_2.value = L14_2
        L13_2.inline = true
        L14_2 = {}
        L14_2.name = "Tags"
        L15_2 = table
        L15_2 = L15_2.concat
        L16_2 = A1_2.tags
        if not L16_2 then
          L16_2 = {}
        end
        L17_2 = ", "
        L15_2 = L15_2(L16_2, L17_2)
        L14_2.value = L15_2
        L14_2.inline = false
        L15_2 = {}
        L15_2.name = "Player"
        L16_2 = FormatPlayer
        L17_2 = A0_2
        L16_2 = L16_2(L17_2)
        L15_2.value = L16_2
        L15_2.inline = false
        L12_2[1] = L13_2
        L12_2[2] = L14_2
        L12_2[3] = L15_2
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
        L7_2 = {}
        L7_2.success = true
        L7_2.message = "Updated Tags"
        return L7_2
      end
  end
  else
    L2_2 = nil
    return L2_2
  end
end
L0_1(L1_1, L2_1)
