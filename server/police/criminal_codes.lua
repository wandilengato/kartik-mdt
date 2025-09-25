local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCriminalCodes"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = A1_2.page
    L4_2 = A1_2.query
    if not L4_2 then
      L4_2 = ""
    end
    L5_2 = L3_2 - 1
    L5_2 = L5_2 * 10
    L6_2 = ""
    L7_2 = {}
    L8_2 = {}
    L9_2 = 0
    if "" ~= L4_2 then
      L6_2 = "WHERE LOWER(id) LIKE LOWER(?) OR LOWER(title) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?) "
      L10_2 = {}
      L11_2 = "%"
      L12_2 = L4_2
      L13_2 = "%"
      L11_2 = L11_2 .. L12_2 .. L13_2
      L12_2 = "%"
      L13_2 = L4_2
      L14_2 = "%"
      L12_2 = L12_2 .. L13_2 .. L14_2
      L13_2 = "%"
      L14_2 = L4_2
      L15_2 = "%"
      L13_2 = L13_2 .. L14_2 .. L15_2
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L7_2 = L10_2
    end
    L10_2 = "SELECT * FROM mdt_criminal_codes "
    L11_2 = L6_2
    L10_2 = L10_2 .. L11_2
    L11_2 = L10_2
    L12_2 = " LIMIT 10 OFFSET ?"
    L11_2 = L11_2 .. L12_2
    L10_2 = L11_2
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L7_2
    L13_2 = L5_2
    L11_2(L12_2, L13_2)
    L11_2 = MySQL
    L11_2 = L11_2.query
    L11_2 = L11_2.await
    L12_2 = L10_2
    L13_2 = L7_2
    L11_2 = L11_2(L12_2, L13_2)
    L12_2 = ipairs
    L13_2 = L11_2
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
      L18_2 = {}
      L19_2 = L17_2.id
      L18_2.id = L19_2
      L19_2 = L17_2.title
      L18_2.title = L19_2
      L19_2 = L17_2.description
      L18_2.description = L19_2
      L19_2 = L17_2.fine
      L18_2.fine = L19_2
      L19_2 = L17_2.category
      L18_2.category = L19_2
      L19_2 = L17_2.additonalPenalties
      L18_2.additonalPenalties = L19_2
      L19_2 = L17_2.sentence
      L18_2.sentence = L19_2
      L19_2 = table
      L19_2 = L19_2.insert
      L20_2 = L8_2
      L21_2 = L18_2
      L19_2(L20_2, L21_2)
    end
    if "" ~= L4_2 then
      L7_2[3] = nil
    end
    L12_2 = "SELECT COUNT(*) as count FROM mdt_criminal_codes "
    L13_2 = L6_2
    L12_2 = L12_2 .. L13_2
    L13_2 = MySQL
    L13_2 = L13_2.query
    L13_2 = L13_2.await
    L14_2 = L12_2
    L15_2 = L7_2
    L13_2 = L13_2(L14_2, L15_2)
    L14_2 = L13_2[1]
    L9_2 = L14_2.count
    L14_2 = {}
    L14_2.criminalCodesData = L8_2
    L14_2.totalCount = L9_2
    return L14_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchAllCriminalCodes"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A1_2 then
    L2_2 = {}
    L3_2 = "SELECT * FROM mdt_criminal_codes "
    L4_2 = MySQL
    L4_2 = L4_2.query
    L4_2 = L4_2.await
    L5_2 = L3_2
    L6_2 = {}
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = ipairs
    L6_2 = L4_2
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = {}
      L12_2 = L10_2.id
      L11_2.id = L12_2
      L12_2 = L10_2.title
      L11_2.title = L12_2
      L12_2 = L10_2.description
      L11_2.description = L12_2
      L12_2 = L10_2.fine
      L11_2.fine = L12_2
      L12_2 = L10_2.category
      L11_2.category = L12_2
      L12_2 = L10_2.additonalPenalties
      L11_2.additonalPenalties = L12_2
      L12_2 = L10_2.sentence
      L11_2.sentence = L12_2
      L12_2 = table
      L12_2 = L12_2.insert
      L13_2 = L2_2
      L14_2 = L11_2
      L12_2(L13_2, L14_2)
    end
    L5_2 = {}
    L5_2.success = true
    L5_2.criminalCodesData = L2_2
    return L5_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCriminalCodeById"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A1_2 then
    L2_2 = A1_2.id
    L3_2 = "SELECT * FROM mdt_criminal_codes WHERE id = ?"
    L4_2 = {}
    L5_2 = L2_2
    L4_2[1] = L5_2
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = {}
    L7_2 = L5_2[1]
    L7_2 = L7_2.changeHistory
    if not L7_2 then
      L7_2 = ""
    end
    L6_2.changeHistory = L7_2
    L7_2 = L5_2[1]
    L7_2 = L7_2.additonalPenalties
    if not L7_2 then
      L7_2 = ""
    end
    L6_2.additonalPenalties = L7_2
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
L1_1 = "kartik-mdt:server:addCriminalCode"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  if A1_2 then
    L2_2 = A1_2.codeToAdd
    if L2_2 then
      L2_2 = A1_2.codeToAdd
      L3_2 = L2_2.id
      L4_2 = L2_2.title
      L5_2 = L2_2.description
      L6_2 = L2_2.fine
      L7_2 = L2_2.category
      L8_2 = L2_2.sentence
      L9_2 = json
      L9_2 = L9_2.encode
      L10_2 = L2_2.changeHistory
      L9_2 = L9_2(L10_2)
      L10_2 = "INSERT INTO mdt_criminal_codes (id, title, description, category, fine, sentence, changeHistory) VALUES (?, ?, ?, ?, ?, ?, ?)"
      L11_2 = {}
      L12_2 = L3_2
      L13_2 = L4_2
      L14_2 = L5_2
      L15_2 = L7_2
      L16_2 = L6_2
      L17_2 = L8_2
      L18_2 = L9_2
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L11_2[3] = L14_2
      L11_2[4] = L15_2
      L11_2[5] = L16_2
      L11_2[6] = L17_2
      L11_2[7] = L18_2
      L12_2 = MySQL
      L12_2 = L12_2.query
      L12_2 = L12_2.await
      L13_2 = L10_2
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      L13_2 = L12_2.affectedRows
      if L13_2 > 0 then
        L13_2 = SendDiscordLog
        L14_2 = "criminal_code"
        L15_2 = "\240\159\147\156 Criminal Code Added"
        L16_2 = nil
        L17_2 = 5763719
        L18_2 = {}
        L19_2 = {}
        L19_2.name = "Code ID"
        L20_2 = tostring
        L21_2 = L3_2
        L20_2 = L20_2(L21_2)
        L19_2.value = L20_2
        L19_2.inline = true
        L20_2 = {}
        L20_2.name = "Title"
        L21_2 = L4_2 or L21_2
        if not L4_2 then
          L21_2 = "N/A"
        end
        L20_2.value = L21_2
        L20_2.inline = true
        L21_2 = {}
        L21_2.name = "Fine"
        L22_2 = "$"
        L23_2 = tostring
        L24_2 = L6_2 or L24_2
        if not L6_2 then
          L24_2 = 0
        end
        L23_2 = L23_2(L24_2)
        L22_2 = L22_2 .. L23_2
        L21_2.value = L22_2
        L21_2.inline = true
        L22_2 = {}
        L22_2.name = "Sentence"
        L23_2 = tostring
        L24_2 = L8_2 or L24_2
        if not L8_2 then
          L24_2 = 0
        end
        L23_2 = L23_2(L24_2)
        L24_2 = " months"
        L23_2 = L23_2 .. L24_2
        L22_2.value = L23_2
        L22_2.inline = true
        L23_2 = {}
        L23_2.name = "Category"
        L24_2 = L7_2 or L24_2
        if not L7_2 then
          L24_2 = "N/A"
        end
        L23_2.value = L24_2
        L23_2.inline = true
        L24_2 = {}
        L24_2.name = "Added By"
        L25_2 = GetPlayerName
        L26_2 = A0_2
        L25_2 = L25_2(L26_2)
        if not L25_2 then
          L25_2 = "Source: "
          L26_2 = tostring
          L27_2 = A0_2
          L26_2 = L26_2(L27_2)
          L25_2 = L25_2 .. L26_2
        end
        L24_2.value = L25_2
        L24_2.inline = false
        L18_2[1] = L19_2
        L18_2[2] = L20_2
        L18_2[3] = L21_2
        L18_2[4] = L22_2
        L18_2[5] = L23_2
        L18_2[6] = L24_2
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
        L13_2 = {}
        L13_2.success = true
        L13_2.message = "Inserted successfully."
        return L13_2
      else
        L13_2 = {}
        L13_2.success = false
        L13_2.message = "Failed to insert the code."
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
L1_1 = "kartik-mdt:server:updateCriminalCode"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  if A1_2 then
    L2_2 = A1_2.code
    if L2_2 then
      L2_2 = A1_2.code
      L3_2 = L2_2.id
      L4_2 = L2_2.title
      L5_2 = L2_2.description
      L6_2 = L2_2.fine
      L7_2 = L2_2.category
      L8_2 = L2_2.sentence
      L9_2 = json
      L9_2 = L9_2.encode
      L10_2 = L2_2.additonalPenalties
      L9_2 = L9_2(L10_2)
      L10_2 = json
      L10_2 = L10_2.encode
      L11_2 = L2_2.changeHistory
      L10_2 = L10_2(L11_2)
      L11_2 = "UPDATE mdt_criminal_codes SET title = ?, description = ?, fine = ?, sentence = ?, additonalPenalties = ?, changeHistory = ?, category = ? WHERE id = ?"
      L12_2 = {}
      L13_2 = L4_2
      L14_2 = L5_2
      L15_2 = L6_2
      L16_2 = L8_2
      L17_2 = L9_2
      L18_2 = L10_2
      L19_2 = L7_2
      L20_2 = L3_2
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
        L14_2 = SendDiscordLog
        L15_2 = "criminal_code"
        L16_2 = "\226\156\143\239\184\143 Criminal Code Updated"
        L17_2 = nil
        L18_2 = 3447003
        L19_2 = {}
        L20_2 = {}
        L20_2.name = "Code ID"
        L21_2 = tostring
        L22_2 = L3_2
        L21_2 = L21_2(L22_2)
        L20_2.value = L21_2
        L20_2.inline = true
        L21_2 = {}
        L21_2.name = "Title"
        L22_2 = L4_2 or L22_2
        if not L4_2 then
          L22_2 = "N/A"
        end
        L21_2.value = L22_2
        L21_2.inline = true
        L22_2 = {}
        L22_2.name = "category"
        L23_2 = L7_2 or L23_2
        if not L7_2 then
          L23_2 = "N/A"
        end
        L22_2.value = L23_2
        L22_2.inline = true
        L23_2 = {}
        L23_2.name = "Fine"
        L24_2 = "$"
        L25_2 = tostring
        L26_2 = L6_2 or L26_2
        if not L6_2 then
          L26_2 = 0
        end
        L25_2 = L25_2(L26_2)
        L24_2 = L24_2 .. L25_2
        L23_2.value = L24_2
        L23_2.inline = true
        L24_2 = {}
        L24_2.name = "Sentence"
        L25_2 = tostring
        L26_2 = L8_2 or L26_2
        if not L8_2 then
          L26_2 = 0
        end
        L25_2 = L25_2(L26_2)
        L26_2 = " months"
        L25_2 = L25_2 .. L26_2
        L24_2.value = L25_2
        L24_2.inline = true
        L25_2 = {}
        L25_2.name = "Updated By"
        L26_2 = GetPlayerName
        L27_2 = A0_2
        L26_2 = L26_2(L27_2)
        if not L26_2 then
          L26_2 = "Source: "
          L27_2 = tostring
          L28_2 = A0_2
          L27_2 = L27_2(L28_2)
          L26_2 = L26_2 .. L27_2
        end
        L25_2.value = L26_2
        L25_2.inline = false
        L19_2[1] = L20_2
        L19_2[2] = L21_2
        L19_2[3] = L22_2
        L19_2[4] = L23_2
        L19_2[5] = L24_2
        L19_2[6] = L25_2
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
        L14_2 = {}
        L14_2.success = true
        L14_2.message = "Report saved successfully."
        return L14_2
      else
        L14_2 = {}
        L14_2.success = false
        L14_2.message = "Failed to update the report."
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
L1_1 = "kartik-mdt:server:deleteCriminalCode"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A1_2 then
    L2_2 = A1_2.id
    if L2_2 then
      L2_2 = A1_2.id
      L3_2 = "DELETE FROM mdt_criminal_codes WHERE id = ?"
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
        L7_2 = "criminal_code"
        L8_2 = "\240\159\151\145\239\184\143 Criminal Code Deleted"
        L9_2 = nil
        L10_2 = 15158332
        L11_2 = {}
        L12_2 = {}
        L12_2.name = "Code ID"
        L13_2 = tostring
        L14_2 = L2_2
        L13_2 = L13_2(L14_2)
        L12_2.value = L13_2
        L12_2.inline = true
        L13_2 = {}
        L13_2.name = "Deleted By"
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
        L13_2.inline = false
        L11_2[1] = L12_2
        L11_2[2] = L13_2
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        L6_2 = {}
        L6_2.success = true
        L6_2.message = "Code deleted successfully."
        return L6_2
      else
        L6_2 = {}
        L6_2.success = false
        L6_2.message = "Failed to delete the Code."
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
