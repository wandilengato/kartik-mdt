local L0_1, L1_1, L2_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = "SELECT * FROM mdt_profiles WHERE citizenid = ?"
  L2_2 = {}
  L3_2 = A0_2
  L2_2[1] = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = #L3_2
    if L4_2 > 0 then
      L4_2 = L3_2[1]
      L5_2 = L4_2.isDangerous
      if 1 == L5_2 then
        L5_2 = true
        if L5_2 then
          goto lbl_25
        end
      end
      L5_2 = false
      ::lbl_25::
      return L5_2
    end
  end
  L4_2 = false
  return L4_2
end
isDangerous = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchWarrants"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A1_2 then
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
    L5_2 = 10
    L6_2 = fetchWarrantsFromPlayers
    L7_2 = L3_2
    L8_2 = L4_2
    L9_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = countWarrantsFromPlayers
    L8_2 = L3_2
    L7_2 = L7_2(L8_2)
    L8_2 = {}
    L8_2.warrantsData = L6_2
    L8_2.totalCount = L7_2
    return L8_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchWarrantDataByWarrantId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A1_2 then
    L2_2 = A1_2.warrantId
    L3_2 = "SELECT * FROM mdt_warrants WHERE id = ?"
    L4_2 = {}
    L5_2 = L2_2
    L4_2[1] = L5_2
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      L6_2 = #L5_2
      if L6_2 > 0 then
        L6_2 = {}
        L7_2 = L5_2[1]
        L7_2 = L7_2.suspectId
        if not L7_2 then
          L7_2 = ""
        end
        L6_2.suspectId = L7_2
        L7_2 = L5_2[1]
        L7_2 = L7_2.expiryDate
        if not L7_2 then
          L7_2 = ""
        end
        L6_2.expiryDate = L7_2
        L7_2 = L5_2[1]
        L7_2 = L7_2.status
        L6_2.status = L7_2
        L7_2 = json
        L7_2 = L7_2.decode
        L8_2 = L5_2[1]
        L8_2 = L8_2.caseNotes
        if not L8_2 then
          L8_2 = "[]"
        end
        L7_2 = L7_2(L8_2)
        L6_2.caseNotes = L7_2
        L7_2 = json
        L7_2 = L7_2.decode
        L8_2 = L5_2[1]
        L8_2 = L8_2.sightings
        if not L8_2 then
          L8_2 = "[]"
        end
        L7_2 = L7_2(L8_2)
        L6_2.sightings = L7_2
        return L6_2
    end
    else
      L6_2 = nil
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
L1_1 = "kartik-mdt:server:updateWarrant"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  if A1_2 then
    L2_2 = A1_2.warrant
    if L2_2 then
      L2_2 = A1_2.warrant
      L3_2 = L2_2.id
      L4_2 = L2_2.expiryDate
      L5_2 = json
      L5_2 = L5_2.encode
      L6_2 = L2_2.charges
      L5_2 = L5_2(L6_2)
      L6_2 = L2_2.issuingAuthority
      L7_2 = L2_2.status
      L8_2 = "UPDATE mdt_warrants SET expiryDate = ?, charges = ?, issuingAuthority = ?, status = ? WHERE id = ?"
      L9_2 = {}
      L10_2 = L4_2
      L11_2 = L5_2
      L12_2 = L6_2
      L13_2 = L7_2
      L14_2 = L3_2
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L9_2[4] = L13_2
      L9_2[5] = L14_2
      L10_2 = MySQL
      L10_2 = L10_2.query
      L10_2 = L10_2.await
      L11_2 = L8_2
      L12_2 = L9_2
      L10_2 = L10_2(L11_2, L12_2)
      L11_2 = L10_2.affectedRows
      if L11_2 > 0 then
        L11_2 = 0
        if "active" == L7_2 then
          L11_2 = 1
        end
        L12_2 = "UPDATE mdt_profiles SET warrant = ? WHERE citizenid = ?"
        L13_2 = {}
        L14_2 = L11_2
        L15_2 = L2_2.suspectId
        L13_2[1] = L14_2
        L13_2[2] = L15_2
        L14_2 = MySQL
        L14_2 = L14_2.query
        L14_2 = L14_2.await
        L15_2 = L12_2
        L16_2 = L13_2
        L14_2(L15_2, L16_2)
        L14_2 = SendDiscordLog
        L15_2 = "warrant"
        L16_2 = "\240\159\147\132 Warrant Updated"
        L17_2 = nil
        L18_2 = 3447003
        L19_2 = {}
        L20_2 = {}
        L20_2.name = "Warrant ID"
        L21_2 = tostring
        L22_2 = L3_2
        L21_2 = L21_2(L22_2)
        L20_2.value = L21_2
        L20_2.inline = true
        L21_2 = {}
        L21_2.name = "Status"
        L22_2 = L7_2 or L22_2
        if not L7_2 then
          L22_2 = "unknown"
        end
        L21_2.value = L22_2
        L21_2.inline = true
        L22_2 = {}
        L22_2.name = "Expiry Date"
        L23_2 = L4_2 or L23_2
        if not L4_2 then
          L23_2 = "N/A"
        end
        L22_2.value = L23_2
        L22_2.inline = true
        L23_2 = {}
        L23_2.name = "Player"
        L24_2 = FormatPlayer
        L25_2 = A0_2
        L24_2 = L24_2(L25_2)
        L23_2.value = L24_2
        L23_2.inline = false
        L19_2[1] = L20_2
        L19_2[2] = L21_2
        L19_2[3] = L22_2
        L19_2[4] = L23_2
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
        L14_2 = {}
        L14_2.success = true
        L14_2.message = "Warrant saved successfully."
        return L14_2
      else
        L11_2 = {}
        L11_2.success = false
        L11_2.message = "Failed to update the Warrant."
        return L11_2
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
L1_1 = "kartik-mdt:server:addNewWarrant"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  if A1_2 then
    L2_2 = A1_2.warrant
    if L2_2 then
      L2_2 = A1_2.warrant
      L3_2 = L2_2.id
      L4_2 = L2_2.suspectId
      L5_2 = L2_2.issueDate
      L6_2 = L2_2.expiryDate
      L7_2 = json
      L7_2 = L7_2.encode
      L8_2 = L2_2.charges
      L7_2 = L7_2(L8_2)
      L8_2 = L2_2.issuingAuthority
      L9_2 = L2_2.status
      if not L9_2 then
        L9_2 = "active"
      end
      L10_2 = json
      L10_2 = L10_2.encode
      L11_2 = L2_2.caseNotes
      L10_2 = L10_2(L11_2)
      L11_2 = "INSERT INTO mdt_warrants (id, suspectId, issueDate, expiryDate, charges, issuingAuthority, status, caseNotes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
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
      L14_2 = L13_2.affectedRows
      if L14_2 > 0 then
        L14_2 = 1
        L15_2 = "UPDATE mdt_profiles SET warrant = ? WHERE citizenid = ?"
        L16_2 = {}
        L17_2 = L14_2
        L18_2 = L2_2.suspectId
        L16_2[1] = L17_2
        L16_2[2] = L18_2
        L17_2 = MySQL
        L17_2 = L17_2.query
        L17_2 = L17_2.await
        L18_2 = L15_2
        L19_2 = L16_2
        L17_2(L18_2, L19_2)
        L17_2 = SendDiscordLog
        L18_2 = "warrant"
        L19_2 = "\240\159\147\140 New Warrant Issued"
        L20_2 = nil
        L21_2 = 15844367
        L22_2 = {}
        L23_2 = {}
        L23_2.name = "Warrant ID"
        L24_2 = tostring
        L25_2 = L3_2
        L24_2 = L24_2(L25_2)
        L23_2.value = L24_2
        L23_2.inline = true
        L24_2 = {}
        L24_2.name = "Suspect ID"
        L25_2 = L4_2 or L25_2
        if not L4_2 then
          L25_2 = "N/A"
        end
        L24_2.value = L25_2
        L24_2.inline = true
        L25_2 = {}
        L25_2.name = "Issued"
        L26_2 = L5_2 or L26_2
        if not L5_2 then
          L26_2 = "N/A"
        end
        L25_2.value = L26_2
        L25_2.inline = true
        L26_2 = {}
        L26_2.name = "Expires"
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
        L22_2[1] = L23_2
        L22_2[2] = L24_2
        L22_2[3] = L25_2
        L22_2[4] = L26_2
        L22_2[5] = L27_2
        L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
        L17_2 = {}
        L17_2.success = true
        L17_2.message = "Warrant inserted successfully."
        return L17_2
      else
        L14_2 = {}
        L14_2.success = false
        L14_2.message = "Failed to insert the Warrant."
        return L14_2
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
L1_1 = "kartik-mdt:server:addReportSightings"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A1_2 then
    L2_2 = A1_2.warrantId
    if L2_2 then
      L2_2 = A1_2.warrantId
      L3_2 = json
      L3_2 = L3_2.encode
      L4_2 = A1_2.sightingsData
      L3_2 = L3_2(L4_2)
      L4_2 = "UPDATE mdt_warrants SET sightings = ? WHERE id = ?"
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
      L7_2 = L6_2.affectedRows
      if L7_2 > 0 then
        L7_2 = SendDiscordLog
        L8_2 = "warrant"
        L9_2 = "\240\159\145\129\239\184\143 Warrant Sightings Added"
        L10_2 = nil
        L11_2 = 10181046
        L12_2 = {}
        L13_2 = {}
        L13_2.name = "Warrant ID"
        L14_2 = tostring
        L15_2 = L2_2
        L14_2 = L14_2(L15_2)
        L13_2.value = L14_2
        L13_2.inline = true
        L14_2 = {}
        L14_2.name = "Sightings Count"
        L15_2 = tostring
        L16_2 = A1_2.sightingsData
        L16_2 = #L16_2
        if not L16_2 then
          L16_2 = 0
        end
        L15_2 = L15_2(L16_2)
        L14_2.value = L15_2
        L14_2.inline = true
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
        L7_2.message = "sightings inserted successfully."
        return L7_2
      else
        L7_2 = {}
        L7_2.success = false
        L7_2.message = "Failed to insert the sightings."
        return L7_2
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
L1_1 = "kartik-mdt:server:updateCaseNotes"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A1_2 then
    L2_2 = A1_2.warrantId
    if L2_2 then
      L2_2 = A1_2.warrantId
      L3_2 = json
      L3_2 = L3_2.encode
      L4_2 = A1_2.caseNoteData
      L3_2 = L3_2(L4_2)
      L4_2 = "UPDATE mdt_warrants SET caseNotes = ? WHERE id = ?"
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
      L7_2 = L6_2.affectedRows
      if L7_2 > 0 then
        L7_2 = SendDiscordLog
        L8_2 = "warrant"
        L9_2 = "\240\159\147\157 Warrant Case Notes Updated"
        L10_2 = nil
        L11_2 = 8359053
        L12_2 = {}
        L13_2 = {}
        L13_2.name = "Warrant ID"
        L14_2 = tostring
        L15_2 = L2_2
        L14_2 = L14_2(L15_2)
        L13_2.value = L14_2
        L13_2.inline = true
        L14_2 = {}
        L14_2.name = "Notes Count"
        L15_2 = tostring
        L16_2 = A1_2.caseNoteData
        L16_2 = #L16_2
        if not L16_2 then
          L16_2 = 0
        end
        L15_2 = L15_2(L16_2)
        L14_2.value = L15_2
        L14_2.inline = true
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
        L7_2.message = "Case Notes inserted successfully."
        return L7_2
      else
        L7_2 = {}
        L7_2.success = false
        L7_2.message = "Failed to insert the Case Notes."
        return L7_2
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
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = [[
        SELECT suspectId 
        FROM mdt_warrants
        WHERE status != 'expired' AND expiryDate < NOW()
    ]]
  L1_2 = MySQL
  L1_2 = L1_2.Async
  L1_2 = L1_2.fetchAll
  L2_2 = L0_2
  L3_2 = {}
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = #A0_3
    if L1_3 > 0 then
      L1_3 = {}
      L2_3 = ipairs
      L3_3 = A0_3
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = table
        L8_3 = L8_3.insert
        L9_3 = L1_3
        L10_3 = L7_3.suspectId
        L8_3(L9_3, L10_3)
      end
      L2_3 = [[
                UPDATE mdt_warrants
                SET status = 'expired'
                WHERE status != 'expired' AND expiryDate < NOW()
            ]]
      L3_3 = MySQL
      L3_3 = L3_3.Async
      L3_3 = L3_3.execute
      L4_3 = L2_3
      L5_3 = {}
      function L6_3(A0_4)
        local L1_4, L2_4, L3_4, L4_4
        if A0_4 > 0 then
          L1_4 = print
          L2_4 = "[WARRANTS] Updated %d expired warrants."
          L3_4 = L2_4
          L2_4 = L2_4.format
          L4_4 = A0_4
          L2_4, L3_4, L4_4 = L2_4(L3_4, L4_4)
          L1_4(L2_4, L3_4, L4_4)
          L1_4 = updateProfiles
          L2_4 = L1_3
          L1_4(L2_4)
        else
          L1_4 = print
          L2_4 = "[WARRANTS] No expired warrants found."
          L1_4(L2_4)
        end
      end
      L3_3(L4_3, L5_3, L6_3)
    else
      L1_3 = print
      L2_3 = "[WARRANTS] No expired warrants found."
      L1_3(L2_3)
    end
  end
  L1_2(L2_2, L3_2, L4_2)
end
updateWarrantStatus = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = #A0_2
  if 0 == L1_2 then
    L1_2 = print
    L2_2 = "[PROFILES] No profiles to update."
    L1_2(L2_2)
    return
  end
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L1_2
    L10_2 = string
    L10_2 = L10_2.format
    L11_2 = "'%s'"
    L12_2 = L7_2
    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
    L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  L2_2 = table
  L2_2 = L2_2.concat
  L3_2 = L1_2
  L4_2 = ", "
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = [[
        UPDATE mdt_profiles p
        SET p.warrant = (
            SELECT CASE
                WHEN COUNT(w.id) > 0 THEN 1  -- Set warrant to 1 if any active warrants are found
                ELSE 0
            END
            FROM mdt_warrants w
            WHERE w.suspectId = p.citizenid AND w.status != 'expired'
        )
        WHERE p.citizenid IN (%s)
    ]]
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = MySQL
  L4_2 = L4_2.Async
  L4_2 = L4_2.execute
  L5_2 = L3_2
  L6_2 = {}
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = print
    L2_3 = "[PROFILES] Updated `warrant` status for %d profiles."
    L3_3 = L2_3
    L2_3 = L2_3.format
    L4_3 = A0_3
    L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3)
    L1_3(L2_3, L3_3, L4_3)
  end
  L4_2(L5_2, L6_2, L7_2)
end
updateProfiles = L0_1
