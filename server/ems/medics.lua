local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchMedics"
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
  L8_2 = "ems"
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2)
  L7_2 = {}
  L7_2.medics = L5_2
  L7_2.totalCount = L6_2
  return L7_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:addNewMedics"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  if A1_2 then
    L2_2 = A1_2.medic
    if L2_2 then
      L2_2 = A1_2.medic
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
        L5_2 = "ems"
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
      L12_2 = MySQL
      L12_2 = L12_2.query
      L12_2 = L12_2.await
      L13_2 = L11_2
      L14_2 = {}
      L15_2 = L4_2
      L14_2[1] = L15_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L13_2 = #L12_2
        if L13_2 > 0 then
          L13_2 = L12_2[1]
          L13_2 = L13_2.isFired
          if 0 == L13_2 then
            L13_2 = {}
            L13_2.success = false
            L13_2.message = "Failed to hire the Medic."
            return L13_2
          else
            L13_2 = table
            L13_2 = L13_2.insert
            L14_2 = L9_2
            L15_2 = {}
            L16_2 = os
            L16_2 = L16_2.date
            L17_2 = "%Y-%m-%d"
            L16_2 = L16_2(L17_2)
            L15_2.date = L16_2
            L16_2 = "Rehired to department: "
            L17_2 = L5_2
            L16_2 = L16_2 .. L17_2
            L15_2.event = L16_2
            L13_2(L14_2, L15_2)
            L13_2 = json
            L13_2 = L13_2.encode
            L14_2 = L9_2
            L13_2 = L13_2(L14_2)
            L14_2 = [[
                    UPDATE mdt_units
                    SET id = ?, citizenid = ?, department = ?, currentAssignments = ?, 
                        dutyRecords = ?, serviceHistory = ?, status = ?, isFired = 0
                    WHERE citizenid = ?
                ]]
            L15_2 = {}
            L16_2 = L3_2
            L17_2 = L4_2
            L18_2 = "ems"
            L19_2 = json
            L19_2 = L19_2.encode
            L20_2 = L10_2
            L19_2 = L19_2(L20_2)
            L20_2 = json
            L20_2 = L20_2.encode
            L21_2 = L8_2
            L20_2 = L20_2(L21_2)
            L21_2 = L13_2
            L22_2 = L7_2
            L23_2 = L4_2
            L15_2[1] = L16_2
            L15_2[2] = L17_2
            L15_2[3] = L18_2
            L15_2[4] = L19_2
            L15_2[5] = L20_2
            L15_2[6] = L21_2
            L15_2[7] = L22_2
            L15_2[8] = L23_2
            L16_2 = MySQL
            L16_2 = L16_2.query
            L16_2 = L16_2.await
            L17_2 = L14_2
            L18_2 = L15_2
            L16_2 = L16_2(L17_2, L18_2)
            L17_2 = L16_2.affectedRows
            if L17_2 > 0 then
              L17_2 = setJob
              L18_2 = L4_2
              L19_2 = L5_2
              L20_2 = L6_2
              L17_2(L18_2, L19_2, L20_2)
              L17_2 = SendDiscordLog
              L18_2 = "ems_medic"
              L19_2 = "\240\159\154\145 Medic Rehired"
              L20_2 = nil
              L21_2 = 3447003
              L22_2 = {}
              L23_2 = {}
              L23_2.name = "Citizen ID"
              L23_2.value = L4_2
              L23_2.inline = true
              L24_2 = {}
              L24_2.name = "Department"
              L24_2.value = L5_2
              L24_2.inline = true
              L25_2 = {}
              L25_2.name = "Rank"
              L25_2.value = L6_2
              L25_2.inline = true
              L26_2 = {}
              L26_2.name = "Player"
              L27_2 = FormatPlayer
              L28_2 = A0_2
              L27_2 = L27_2(L28_2)
              L26_2.value = L27_2
              L26_2.inline = false
              L22_2[1] = L23_2
              L22_2[2] = L24_2
              L22_2[3] = L25_2
              L22_2[4] = L26_2
              L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
              L17_2 = {}
              L17_2.success = true
              L17_2.message = "Rehired successfully."
              return L17_2
            else
              L17_2 = {}
              L17_2.success = false
              L17_2.message = "Failed to rehire."
              return L17_2
            end
          end
      end
      else
        L13_2 = [[
                INSERT INTO mdt_units (id, citizenid, department, currentAssignments, dutyRecords, serviceHistory, status)
                VALUES (?, ?, ?, ?, ?, ?, ?)
            ]]
        L14_2 = {}
        L15_2 = L3_2
        L16_2 = L4_2
        L17_2 = "ems"
        L18_2 = json
        L18_2 = L18_2.encode
        L19_2 = L10_2
        L18_2 = L18_2(L19_2)
        L19_2 = json
        L19_2 = L19_2.encode
        L20_2 = L8_2
        L19_2 = L19_2(L20_2)
        L20_2 = json
        L20_2 = L20_2.encode
        L21_2 = L9_2
        L20_2 = L20_2(L21_2)
        L21_2 = L7_2
        L14_2[1] = L15_2
        L14_2[2] = L16_2
        L14_2[3] = L17_2
        L14_2[4] = L18_2
        L14_2[5] = L19_2
        L14_2[6] = L20_2
        L14_2[7] = L21_2
        L15_2 = MySQL
        L15_2 = L15_2.query
        L15_2 = L15_2.await
        L16_2 = L13_2
        L17_2 = L14_2
        L15_2 = L15_2(L16_2, L17_2)
        L16_2 = L15_2.affectedRows
        if L16_2 > 0 then
          L16_2 = setJob
          L17_2 = L4_2
          L18_2 = L5_2
          L19_2 = L6_2
          L16_2(L17_2, L18_2, L19_2)
          L16_2 = SendDiscordLog
          L17_2 = "ems_medic"
          L18_2 = "\226\156\133 Medic Hired"
          L19_2 = nil
          L20_2 = 5763719
          L21_2 = {}
          L22_2 = {}
          L22_2.name = "Citizen ID"
          L22_2.value = L4_2
          L22_2.inline = true
          L23_2 = {}
          L23_2.name = "Department"
          L23_2.value = L5_2
          L23_2.inline = true
          L24_2 = {}
          L24_2.name = "Rank"
          L24_2.value = L6_2
          L24_2.inline = true
          L25_2 = {}
          L25_2.name = "Player"
          L26_2 = FormatPlayer
          L27_2 = A0_2
          L26_2 = L26_2(L27_2)
          L25_2.value = L26_2
          L25_2.inline = false
          L21_2[1] = L22_2
          L21_2[2] = L23_2
          L21_2[3] = L24_2
          L21_2[4] = L25_2
          L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
          L16_2 = {}
          L16_2.success = true
          L16_2.message = "Hired successfully."
          return L16_2
        else
          L16_2 = {}
          L16_2.success = false
          L16_2.message = "Failed to hire."
          return L16_2
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
L1_1 = "kartik-mdt:server:fetchMedicDataByMedicId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A1_2 then
    L2_2 = A1_2.MedicId
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
L1_1 = "kartik-mdt:server:updateMedicRank"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  if A1_2 then
    L2_2 = A1_2.medicId
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
    L10_2 = "ems"
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
      L11_2 = SendDiscordLog
      L12_2 = "ems_medic"
      L13_2 = "\240\159\169\186 Medic Rank Updated"
      L14_2 = nil
      L15_2 = 15844367
      L16_2 = {}
      L17_2 = {}
      L17_2.name = "Citizen ID"
      L17_2.value = L3_2
      L17_2.inline = true
      L18_2 = {}
      L18_2.name = "New Rank"
      L18_2.value = L4_2
      L18_2.inline = true
      L19_2 = {}
      L19_2.name = "Player"
      L20_2 = FormatPlayer
      L21_2 = A0_2
      L20_2 = L20_2(L21_2)
      L19_2.value = L20_2
      L19_2.inline = false
      L16_2[1] = L17_2
      L16_2[2] = L18_2
      L16_2[3] = L19_2
      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
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
L1_1 = "kartik-mdt:server:addMedicAssignment"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A1_2 then
    L2_2 = A1_2.medicId
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
      L8_2 = "ems_medic"
      L9_2 = "\240\159\147\139 Medic Assignment Updated"
      L10_2 = nil
      L11_2 = 3447003
      L12_2 = {}
      L13_2 = {}
      L13_2.name = "Medic ID"
      L13_2.value = L2_2
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
L1_1 = "kartik-mdt:server:fireMedic"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
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
      L8_2 = SendDiscordLog
      L9_2 = "ems_medic"
      L10_2 = "\226\157\140 Medic Fired"
      L11_2 = nil
      L12_2 = 15548997
      L13_2 = {}
      L14_2 = {}
      L14_2.name = "Citizen ID"
      L14_2.value = L2_2
      L14_2.inline = true
      L15_2 = {}
      L15_2.name = "Player"
      L16_2 = FormatPlayer
      L17_2 = A0_2
      L16_2 = L16_2(L17_2)
      L15_2.value = L16_2
      L15_2.inline = false
      L13_2[1] = L14_2
      L13_2[2] = L15_2
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
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
L1_1 = "kartik-mdt:server:updateMedictags"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
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
        L8_2 = "ems_medic"
        L9_2 = "\240\159\143\183\239\184\143 Medic Tags Updated"
        L10_2 = nil
        L11_2 = 3447003
        L12_2 = {}
        L13_2 = {}
        L13_2.name = "Citizen ID"
        L13_2.value = L2_2
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
