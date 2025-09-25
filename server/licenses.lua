local L0_1, L1_1, L2_1, L3_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
if "kartik-mdt" ~= L0_1 then
  return
end
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "string" ~= L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = "^%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d$"
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A0_2
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = true
    return L2_2
  else
    L2_2 = os
    L2_2 = L2_2.date
    L3_2 = "%H:%M:%S"
    L2_2 = L2_2(L3_2)
    L3_2 = A0_2
    L4_2 = " "
    L5_2 = L2_2
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = string
    L4_2 = L4_2.match
    L5_2 = L3_2
    L6_2 = L1_2
    L4_2 = L4_2(L5_2, L6_2)
    L4_2 = nil ~= L4_2
    return L4_2
  end
end
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if not A1_2 then
    L2_2 = print
    L3_2 = "No data received."
    L2_2(L3_2)
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
  L2_2 = A0_2
  L3_2 = GetPlayerData
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = A1_2.citizenId
  L5_2 = A1_2.license
  L6_2 = L5_2.approvedBy
  if not L6_2 then
    L6_2 = L3_2.name
  end
  L5_2.approvedBy = L6_2
  L6_2 = L0_1
  L7_2 = L5_2.approvedDate
  L6_2 = L6_2(L7_2)
  if L6_2 then
    L6_2 = L5_2.approvedDate
    if "0000-00-00 00:00:00" ~= L6_2 then
      goto lbl_35
    end
  end
  L6_2 = os
  L6_2 = L6_2.date
  L7_2 = "%Y-%m-%d %H:%M:%S"
  L6_2 = L6_2(L7_2)
  L5_2.approvedDate = L6_2
  ::lbl_35::
  L6_2 = L5_2.status
  if "approved" == L6_2 then
    L6_2 = print
    L7_2 = type
    L8_2 = L5_2.expirationDate
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L7_2(L8_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L6_2 = print
    L7_2 = L0_1
    L8_2 = L5_2.expirationDate
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L7_2(L8_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L6_2 = L0_1
    L7_2 = L5_2.expirationDate
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = L5_2.expirationDate
    end
    if "0000-00-00 00:00:00" == L6_2 then
      L6_2 = os
      L6_2 = L6_2.date
      L7_2 = "%Y-%m-%d %H:%M:%S"
      L6_2 = L6_2(L7_2)
      L5_2.expirationDate = L6_2
    end
  else
    L6_2 = os
    L6_2 = L6_2.date
    L7_2 = "%Y-%m-%d %H:%M:%S"
    L6_2 = L6_2(L7_2)
    L5_2.expirationDate = L6_2
  end
  L6_2 = L5_2.name
  if L6_2 then
    L6_2 = L5_2.type
    if L6_2 then
      L6_2 = L5_2.status
      if L6_2 then
        goto lbl_81
      end
    end
  end
  L6_2 = {}
  L6_2.success = false
  L6_2.message = "Missing required license fields."
  do return L6_2 end
  ::lbl_81::
  L6_2 = fetchLicenses
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L7_2 = false
  if L6_2 then
    L8_2 = #L6_2
    if L8_2 > 0 then
      L8_2 = ipairs
      L9_2 = L6_2
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        L14_2 = L13_2.type
        L15_2 = L5_2.type
        if L14_2 == L15_2 then
          L7_2 = true
          break
        end
      end
    end
  end
  if L7_2 then
    L8_2 = [[
                UPDATE mdt_licenses
                SET name = ?, status = ?, approvedBy = ?, approvalDate = ?, expirationDate = ?, note = ?
                WHERE citizenId = ? AND type = ?
            ]]
    L9_2 = {}
    L10_2 = L5_2.name
    L11_2 = L5_2.status
    L12_2 = L5_2.approvedBy
    L13_2 = L5_2.approvedDate
    L14_2 = L5_2.expirationDate
    L15_2 = L5_2.note
    if not L15_2 then
      L15_2 = nil
    end
    L16_2 = L4_2
    L17_2 = L5_2.type
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L9_2[4] = L13_2
    L9_2[5] = L14_2
    L9_2[6] = L15_2
    L9_2[7] = L16_2
    L9_2[8] = L17_2
    L10_2 = MySQL
    L10_2 = L10_2.query
    L10_2 = L10_2.await
    L11_2 = L8_2
    L12_2 = L9_2
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 then
      L11_2 = fetchLicenses
      L12_2 = L4_2
      L11_2 = L11_2(L12_2)
      L12_2 = UpdateLicense
      L13_2 = L4_2
      L14_2 = L5_2.type
      L15_2 = L5_2.status
      L12_2(L13_2, L14_2, L15_2)
      L12_2 = SendDiscordLog
      L13_2 = "licenses"
      L14_2 = "\226\156\133 License Updated"
      L15_2 = nil
      L16_2 = 5793266
      L17_2 = {}
      L18_2 = {}
      L18_2.name = "Citizen ID"
      L18_2.value = L4_2
      L18_2.inline = true
      L19_2 = {}
      L19_2.name = "License Type"
      L20_2 = L5_2.type
      L19_2.value = L20_2
      L19_2.inline = true
      L20_2 = {}
      L20_2.name = "New Status"
      L21_2 = L5_2.status
      L20_2.value = L21_2
      L20_2.inline = true
      L21_2 = {}
      L21_2.name = "Updated By"
      L22_2 = FormatPlayer
      L23_2 = A0_2
      L22_2 = L22_2(L23_2)
      L21_2.value = L22_2
      L21_2.inline = false
      L17_2[1] = L18_2
      L17_2[2] = L19_2
      L17_2[3] = L20_2
      L17_2[4] = L21_2
      L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
      L12_2 = {}
      L12_2.success = true
      L12_2.message = "License updated successfully."
      L13_2 = json
      L13_2 = L13_2.encode
      L14_2 = L11_2
      L13_2 = L13_2(L14_2)
      L12_2.licenses = L13_2
      return L12_2
    else
      L11_2 = {}
      L11_2.success = false
      L11_2.message = "Failed to update license."
      return L11_2
    end
  else
    L8_2 = [[
                INSERT INTO mdt_licenses (citizenId, name, type, status, approvedBy, approvalDate, expirationDate, note)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            ]]
    L9_2 = {}
    L10_2 = L4_2
    L11_2 = L5_2.name
    L12_2 = L5_2.type
    L13_2 = L5_2.status
    L14_2 = L5_2.approvedBy
    L15_2 = L5_2.approvedDate
    L16_2 = L5_2.expirationDate
    L17_2 = L5_2.note
    if not L17_2 then
      L17_2 = nil
    end
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L9_2[4] = L13_2
    L9_2[5] = L14_2
    L9_2[6] = L15_2
    L9_2[7] = L16_2
    L9_2[8] = L17_2
    L10_2 = MySQL
    L10_2 = L10_2.query
    L10_2 = L10_2.await
    L11_2 = L8_2
    L12_2 = L9_2
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 then
      L11_2 = fetchLicenses
      L12_2 = L4_2
      L11_2 = L11_2(L12_2)
      L12_2 = UpdateLicense
      L13_2 = L4_2
      L14_2 = L5_2.type
      L15_2 = L5_2.status
      L12_2(L13_2, L14_2, L15_2)
      L12_2 = SendDiscordLog
      L13_2 = "licenses"
      L14_2 = "\240\159\134\149 License Added"
      L15_2 = nil
      L16_2 = 3447003
      L17_2 = {}
      L18_2 = {}
      L18_2.name = "Citizen ID"
      L18_2.value = L4_2
      L18_2.inline = true
      L19_2 = {}
      L19_2.name = "License Type"
      L20_2 = L5_2.type
      L19_2.value = L20_2
      L19_2.inline = true
      L20_2 = {}
      L20_2.name = "Status"
      L21_2 = L5_2.status
      L20_2.value = L21_2
      L20_2.inline = true
      L21_2 = {}
      L21_2.name = "Approved By"
      L22_2 = FormatPlayer
      L23_2 = A0_2
      L22_2 = L22_2(L23_2)
      L21_2.value = L22_2
      L21_2.inline = false
      L17_2[1] = L18_2
      L17_2[2] = L19_2
      L17_2[3] = L20_2
      L17_2[4] = L21_2
      L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
      L12_2 = {}
      L12_2.success = true
      L12_2.message = "License inserted successfully."
      L13_2 = json
      L13_2 = L13_2.encode
      L14_2 = L11_2
      L13_2 = L13_2(L14_2)
      L12_2.licenses = L13_2
      return L12_2
    else
      L11_2 = {}
      L11_2.success = false
      L11_2.message = "Failed to insert license."
      return L11_2
    end
  end
end
updateCitizenLicense = L1_1
L1_1 = exports
L2_1 = "updateCitizenLicense"
L3_1 = updateCitizenLicense
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:updateCitizenLicense"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = updateCitizenLicense
  L3_2 = A0_2
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = [[
        SELECT * FROM mdt_licenses WHERE citizenId = ?
    ]]
  L2_2 = {}
  L3_2 = A0_2
  L2_2[1] = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2, L4_2 = L3_2(L4_2, L5_2)
  if L4_2 then
    L5_2 = print
    L6_2 = "Error fetching licenses for citizenId "
    L7_2 = A0_2
    L8_2 = ": "
    L9_2 = L4_2
    L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
    L5_2(L6_2)
    L5_2 = {}
    return L5_2
  end
  L5_2 = L3_2 or L5_2
  if not L3_2 then
    L5_2 = {}
  end
  return L5_2
end
fetchLicenses = L1_1
L1_1 = CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = Wait
  L1_2 = 1000
  L0_2(L1_2)
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SHOW TABLES LIKE 'mdt_licenses'"
  L0_2 = L0_2(L1_2)
  L1_2 = #L0_2
  if 0 == L1_2 then
    return
  end
  L1_2 = print
  L2_2 = "^3[MDT] Checking licenses for broken data on startup...^0"
  L1_2(L2_2)
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = [[
        SELECT id, approvalDate, expirationDate
        FROM mdt_licenses
        WHERE approvalDate IS NULL OR approvalDate = '0000-00-00 00:00:00' 
           OR expirationDate IS NULL OR expirationDate = '0000-00-00 00:00:00'
    ]]
  L1_2 = L1_2(L2_2)
  L2_2 = 0
  L3_2 = pairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = os
    L9_2 = L9_2.date
    L10_2 = "%Y-%m-%d %H:%M:%S"
    L9_2 = L9_2(L10_2)
    L10_2 = L8_2.approvalDate
    if L10_2 then
      L10_2 = L8_2.approvalDate
    end
    L10_2 = L9_2 or L10_2
    if "0000-00-00 00:00:00" ~= L10_2 or not L9_2 then
      L10_2 = L8_2.approvalDate
    end
    L11_2 = L8_2.expirationDate
    if L11_2 then
      L11_2 = L8_2.expirationDate
    end
    L11_2 = L9_2 or L11_2
    if "0000-00-00 00:00:00" ~= L11_2 or not L9_2 then
      L11_2 = L8_2.expirationDate
    end
    L12_2 = L0_1
    L13_2 = L10_2
    L12_2 = L12_2(L13_2)
    if not L12_2 then
      L10_2 = L9_2
    end
    L12_2 = L0_1
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if not L12_2 then
      L11_2 = L9_2
    end
    L12_2 = MySQL
    L12_2 = L12_2.query
    L12_2 = L12_2.await
    L13_2 = [[
            UPDATE mdt_licenses
            SET approvalDate = ?, expirationDate = ?
            WHERE id = ?
        ]]
    L14_2 = {}
    L15_2 = L10_2
    L16_2 = L11_2
    L17_2 = L8_2.id
    L14_2[1] = L15_2
    L14_2[2] = L16_2
    L14_2[3] = L17_2
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      L13_2 = L12_2.affectedRows
      if L13_2 then
        L13_2 = L12_2.affectedRows
        if L13_2 > 0 then
          L2_2 = L2_2 + 1
        end
      end
    end
  end
  L3_2 = print
  L4_2 = "^2[MDT] Fixed %d broken license record(s) on startup.^0"
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = L2_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L4_2(L5_2, L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
end
L1_1(L2_1)
L1_1 = CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SHOW TABLES LIKE 'mdt_licenses'"
  L0_2 = L0_2(L1_2)
  L1_2 = #L0_2
  if 0 == L1_2 then
    return
  end
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT * FROM mdt_licenses WHERE expirationDate < ? AND status = ?"
  L3_2 = {}
  L4_2 = os
  L4_2 = L4_2.date
  L5_2 = "%Y-%m-%d"
  L4_2 = L4_2(L5_2)
  L5_2 = "approved"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.expirationDate
    if L8_2 then
      L8_2 = "expired"
      L9_2 = MySQL
      L9_2 = L9_2.query
      L9_2 = L9_2.await
      L10_2 = "UPDATE mdt_licenses SET status = ? WHERE id = ?"
      L11_2 = {}
      L12_2 = L8_2
      L13_2 = L7_2.id
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L9_2(L10_2, L11_2)
      L9_2 = UpdateLicense
      L10_2 = L7_2.citizenId
      L11_2 = L7_2.type
      L12_2 = L8_2
      L9_2(L10_2, L11_2, L12_2)
      L9_2 = print
      L10_2 = "["
      L11_2 = L7_2.citizenId
      L12_2 = "] "
      L13_2 = L7_2.name
      L14_2 = " expired"
      L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2
      L9_2(L10_2)
    end
  end
end
L1_1(L2_1)
