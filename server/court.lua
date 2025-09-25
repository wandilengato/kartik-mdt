local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = os
  L1_2 = L1_2.date
  L2_2 = "%Y"
  L1_2 = L1_2(L2_2)
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "CC-%s-%03d"
  L4_2 = L1_2
  L5_2 = A0_2
  return L2_2(L3_2, L4_2, L5_2)
end
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:getCourtCases"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_2 = A1_2.page
  if not L2_2 then
    L2_2 = 1
  end
  L3_2 = A1_2.query
  if not L3_2 then
    L3_2 = ""
  end
  L4_2 = 10
  L5_2 = [[
        SELECT c.*
        FROM mdt_court_cases c
        WHERE ? = '' OR 
              LOWER(c.title) LIKE LOWER(?) OR 
              LOWER(c.defendant) LIKE LOWER(?) OR 
              LOWER(c.id) LIKE LOWER(?)
        ORDER BY c.date DESC
        LIMIT ? OFFSET ?
    ]]
  L6_2 = {}
  L7_2 = L3_2
  L8_2 = "%"
  L9_2 = L3_2
  L10_2 = "%"
  L8_2 = L8_2 .. L9_2 .. L10_2
  L9_2 = "%"
  L10_2 = L3_2
  L11_2 = "%"
  L9_2 = L9_2 .. L10_2 .. L11_2
  L10_2 = "%"
  L11_2 = L3_2
  L12_2 = "%"
  L10_2 = L10_2 .. L11_2 .. L12_2
  L11_2 = L4_2
  L12_2 = L2_2 - 1
  L12_2 = L12_2 * L4_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L6_2[5] = L11_2
  L6_2[6] = L12_2
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = L5_2
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = [[
        SELECT COUNT(*) as count FROM mdt_court_cases 
        WHERE ? = '' OR 
              LOWER(title) LIKE LOWER(?) OR 
              LOWER(defendant) LIKE LOWER(?) OR 
              LOWER(id) LIKE LOWER(?)
    ]]
  L9_2 = MySQL
  L9_2 = L9_2.query
  L9_2 = L9_2.await
  L10_2 = L8_2
  L11_2 = {}
  L12_2 = L3_2
  L13_2 = "%"
  L14_2 = L3_2
  L15_2 = "%"
  L13_2 = L13_2 .. L14_2 .. L15_2
  L14_2 = "%"
  L15_2 = L3_2
  L16_2 = "%"
  L14_2 = L14_2 .. L15_2 .. L16_2
  L15_2 = "%"
  L16_2 = L3_2
  L17_2 = "%"
  L15_2 = L15_2 .. L16_2 .. L17_2
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L11_2[4] = L15_2
  L9_2 = L9_2(L10_2, L11_2)
  L9_2 = L9_2[1]
  L9_2 = L9_2.count
  L10_2 = {}
  L11_2 = ipairs
  L12_2 = L7_2
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = table
    L17_2 = L17_2.insert
    L18_2 = L10_2
    L19_2 = L16_2.id
    L17_2(L18_2, L19_2)
  end
  L11_2 = [[
        SELECT * FROM mdt_court_case_notes 
        WHERE caseId IN (?)
        ORDER BY timestamp DESC
    ]]
  L12_2 = {}
  L13_2 = #L10_2
  if L13_2 > 0 then
    L13_2 = MySQL
    L13_2 = L13_2.query
    L13_2 = L13_2.await
    L14_2 = L11_2
    L15_2 = {}
    L16_2 = table
    L16_2 = L16_2.concat
    L17_2 = L10_2
    L18_2 = ","
    L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L16_2(L17_2, L18_2)
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L15_2[3] = L18_2
    L15_2[4] = L19_2
    L15_2[5] = L20_2
    L15_2[6] = L21_2
    L15_2[7] = L22_2
    L13_2 = L13_2(L14_2, L15_2)
    L12_2 = L13_2
  end
  L13_2 = {}
  L14_2 = ipairs
  L15_2 = L12_2
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
  for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
    L20_2 = L19_2.caseId
    L20_2 = L13_2[L20_2]
    if not L20_2 then
      L20_2 = L19_2.caseId
      L21_2 = {}
      L13_2[L20_2] = L21_2
    end
    L20_2 = table
    L20_2 = L20_2.insert
    L21_2 = L19_2.caseId
    L21_2 = L13_2[L21_2]
    L22_2 = L19_2
    L20_2(L21_2, L22_2)
  end
  L14_2 = ipairs
  L15_2 = L7_2
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
  for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
    L20_2 = json
    L20_2 = L20_2.decode
    L21_2 = L19_2.relatedReports
    if not L21_2 then
      L21_2 = "[]"
    end
    L20_2 = L20_2(L21_2)
    L19_2.relatedReports = L20_2
    L20_2 = L19_2.id
    L20_2 = L13_2[L20_2]
    if not L20_2 then
      L20_2 = {}
    end
    L19_2.notes = L20_2
    L20_2 = L1_1
    L21_2 = L19_2.id
    L20_2 = L20_2(L21_2)
    L19_2.formattedId = L20_2
  end
  L14_2 = {}
  L14_2.success = true
  L14_2.cases = L7_2
  L14_2.totalCount = L9_2
  return L14_2
end
L2_1(L3_1, L4_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:createCourtCase"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L2_2 = A1_2.caseData
  if not L2_2 then
    L2_2 = {}
    L2_2.success = false
    L2_2.error = "No case data provided"
    return L2_2
  end
  L2_2 = GetPlayerData
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = A1_2.caseData
  L4_2 = L3_2.title
  if L4_2 then
    L4_2 = L3_2.title
    L5_2 = L4_2
    L4_2 = L4_2.len
    L4_2 = L4_2(L5_2)
    if not (L4_2 < 3) then
      goto lbl_26
    end
  end
  L4_2 = {}
  L4_2.success = false
  L4_2.error = "Case title is required and must be at least 3 characters"
  do return L4_2 end
  ::lbl_26::
  L4_2 = L3_2.defendant
  if L4_2 then
    L4_2 = L3_2.defendant
    L5_2 = L4_2
    L4_2 = L4_2.len
    L4_2 = L4_2(L5_2)
    if not (L4_2 < 3) then
      goto lbl_39
    end
  end
  L4_2 = {}
  L4_2.success = false
  L4_2.error = "Defendant name is required and must be at least 3 characters"
  do return L4_2 end
  ::lbl_39::
  L4_2 = L3_2.date
  if not L4_2 then
    L4_2 = {}
    L4_2.success = false
    L4_2.error = "Case date is required"
    return L4_2
  end
  L4_2 = [[
        INSERT INTO mdt_court_cases (
            title, date, status, defendant, judge, defense, 
            prosecution, courtroom, relatedReports
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ]]
  L5_2 = {}
  L6_2 = L3_2.title
  L7_2 = L3_2.date
  L8_2 = L3_2.status
  L9_2 = L3_2.defendant
  L10_2 = L3_2.judge
  if not L10_2 then
    L10_2 = ""
  end
  L11_2 = L3_2.defense
  if not L11_2 then
    L11_2 = ""
  end
  L12_2 = L3_2.prosecution
  if not L12_2 then
    L12_2 = ""
  end
  L13_2 = L3_2.courtroom
  if not L13_2 then
    L13_2 = ""
  end
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = L3_2.relatedReports
  if not L15_2 then
    L15_2 = {}
  end
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L14_2(L15_2)
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L5_2[7] = L12_2
  L5_2[8] = L13_2
  L5_2[9] = L14_2
  L5_2[10] = L15_2
  L5_2[11] = L16_2
  L5_2[12] = L17_2
  L5_2[13] = L18_2
  L5_2[14] = L19_2
  L5_2[15] = L20_2
  L5_2[16] = L21_2
  L5_2[17] = L22_2
  L5_2[18] = L23_2
  L5_2[19] = L24_2
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = L4_2
  L9_2 = L5_2
  L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L8_2 = {}
    L8_2.success = false
    L9_2 = "Database error: "
    L10_2 = tostring
    L11_2 = L7_2
    L10_2 = L10_2(L11_2)
    L9_2 = L9_2 .. L10_2
    L8_2.error = L9_2
    return L8_2
  end
  L8_2 = L7_2.affectedRows
  if L8_2 > 0 then
    L8_2 = L7_2.insertId
    L9_2 = [[
            INSERT INTO mdt_court_case_notes (caseId, timestamp, author, content)
            VALUES (?, ?, ?, ?)
        ]]
    L10_2 = {}
    L11_2 = L8_2
    L12_2 = os
    L12_2 = L12_2.date
    L13_2 = "%Y-%m-%dT%H:%M:%S"
    L12_2 = L12_2(L13_2)
    L13_2 = L2_2.name
    L14_2 = "Case created by "
    L15_2 = L2_2.name
    L14_2 = L14_2 .. L15_2
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L10_2[4] = L14_2
    L11_2 = pcall
    L12_2 = MySQL
    L12_2 = L12_2.query
    L12_2 = L12_2.await
    L13_2 = L9_2
    L14_2 = L10_2
    L11_2, L12_2 = L11_2(L12_2, L13_2, L14_2)
    if not L11_2 then
      L13_2 = print
      L14_2 = "Failed to add initial note:"
      L15_2 = tostring
      L16_2 = L12_2
      L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L15_2(L16_2)
      L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
    end
    L13_2 = SendDiscordLog
    L14_2 = "court_cases"
    L15_2 = "\240\159\147\129 New Court Case Created"
    L16_2 = nil
    L17_2 = 3447003
    L18_2 = {}
    L19_2 = {}
    L19_2.name = "Case ID"
    L20_2 = tostring
    L21_2 = L8_2
    L20_2 = L20_2(L21_2)
    L19_2.value = L20_2
    L19_2.inline = true
    L20_2 = {}
    L20_2.name = "Title"
    L21_2 = L3_2.title
    L20_2.value = L21_2
    L20_2.inline = true
    L21_2 = {}
    L21_2.name = "Defendant"
    L22_2 = L3_2.defendant
    L21_2.value = L22_2
    L21_2.inline = true
    L22_2 = {}
    L22_2.name = "Filed By"
    L23_2 = FormatPlayer
    L24_2 = A0_2
    L23_2 = L23_2(L24_2)
    L22_2.value = L23_2
    L22_2.inline = false
    L18_2[1] = L19_2
    L18_2[2] = L20_2
    L18_2[3] = L21_2
    L18_2[4] = L22_2
    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
    L13_2 = {}
    L13_2.success = true
    L13_2.caseId = L8_2
    L13_2.message = "Court case created successfully"
    return L13_2
  else
    L8_2 = {}
    L8_2.success = false
    L8_2.error = "Failed to create case"
    return L8_2
  end
end
L2_1(L3_1, L4_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:updateCourtCaseStatus"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L2_2 = A1_2.caseData
  if L2_2 then
    L2_2 = A1_2.caseId
    if L2_2 then
      goto lbl_12
    end
  end
  L2_2 = {}
  L2_2.success = false
  L2_2.error = "Invalid case data"
  do return L2_2 end
  ::lbl_12::
  L2_2 = GetPlayerData
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = A1_2.caseData
  L4_2 = [[
        UPDATE mdt_court_cases 
        SET status = ?, verdict = ?, sentence = ?, 
            postponedReason = ?, newDate = ?
        WHERE id = ?
    ]]
  L5_2 = {}
  L6_2 = L3_2.status
  L7_2 = L3_2.verdict
  L8_2 = L3_2.sentence
  L9_2 = L3_2.postponedReason
  L10_2 = L3_2.newDate
  L11_2 = L3_2.id
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = L4_2
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L6_2.affectedRows
  if L7_2 > 0 then
    L7_2 = [[
            INSERT INTO mdt_court_case_notes (caseId, timestamp, author, content)
            VALUES (?, ?, ?, ?)
        ]]
    L8_2 = {}
    L9_2 = L3_2.id
    L10_2 = os
    L10_2 = L10_2.date
    L11_2 = "%Y-%m-%dT%H:%M:%S"
    L10_2 = L10_2(L11_2)
    L11_2 = L2_2.name
    L12_2 = string
    L12_2 = L12_2.format
    L13_2 = "Status updated to: %s"
    L14_2 = L3_2.status
    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L12_2(L13_2, L14_2)
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L8_2[4] = L12_2
    L8_2[5] = L13_2
    L8_2[6] = L14_2
    L8_2[7] = L15_2
    L8_2[8] = L16_2
    L8_2[9] = L17_2
    L8_2[10] = L18_2
    L8_2[11] = L19_2
    L8_2[12] = L20_2
    L8_2[13] = L21_2
    L9_2 = MySQL
    L9_2 = L9_2.query
    L9_2 = L9_2.await
    L10_2 = L7_2
    L11_2 = L8_2
    L9_2(L10_2, L11_2)
    L9_2 = [[
            SELECT c.*, 
                   (SELECT JSON_ARRAYAGG(
                        JSON_OBJECT(
                            'id', n.id,
                            'timestamp', n.timestamp,
                            'author', n.author,
                            'content', n.content
                        )
                    ) FROM mdt_court_case_notes n WHERE n.caseId = c.id) as notes
            FROM mdt_court_cases c
            WHERE c.id = ?
        ]]
    L10_2 = MySQL
    L10_2 = L10_2.query
    L10_2 = L10_2.await
    L11_2 = L9_2
    L12_2 = {}
    L13_2 = L3_2.id
    L12_2[1] = L13_2
    L10_2 = L10_2(L11_2, L12_2)
    L10_2 = L10_2[1]
    L11_2 = json
    L11_2 = L11_2.decode
    L12_2 = L10_2.relatedReports
    if not L12_2 then
      L12_2 = "[]"
    end
    L11_2 = L11_2(L12_2)
    L10_2.relatedReports = L11_2
    L11_2 = json
    L11_2 = L11_2.decode
    L12_2 = L10_2.notes
    if not L12_2 then
      L12_2 = "[]"
    end
    L11_2 = L11_2(L12_2)
    L10_2.notes = L11_2
    L11_2 = SendDiscordLog
    L12_2 = "court_cases"
    L13_2 = "\226\154\150\239\184\143 Court Case Status Updated"
    L14_2 = nil
    L15_2 = 15105570
    L16_2 = {}
    L17_2 = {}
    L17_2.name = "Case ID"
    L18_2 = tostring
    L19_2 = L3_2.id
    L18_2 = L18_2(L19_2)
    L17_2.value = L18_2
    L17_2.inline = true
    L18_2 = {}
    L18_2.name = "New Status"
    L19_2 = L3_2.status
    if not L19_2 then
      L19_2 = "N/A"
    end
    L18_2.value = L19_2
    L18_2.inline = true
    L19_2 = {}
    L19_2.name = "Updated By"
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
    L11_2.success = true
    L12_2 = {}
    L12_2.case = L10_2
    L11_2.data = L12_2
    return L11_2
  else
    L7_2 = {}
    L7_2.success = false
    L7_2.error = "Case not found"
    return L7_2
  end
end
L2_1(L3_1, L4_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:addCourtCaseNote"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = A1_2.case
  if L2_2 then
    L2_2 = A1_2.caseId
    if L2_2 then
      goto lbl_12
    end
  end
  L2_2 = {}
  L2_2.success = false
  L2_2.error = "Invalid case data"
  do return L2_2 end
  ::lbl_12::
  L2_2 = GetPlayerData
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = A1_2.case
  L4_2 = [[
        INSERT INTO mdt_court_case_notes (caseId, timestamp, author, content)
        VALUES (?, ?, ?, ?)
    ]]
  L5_2 = {}
  L6_2 = A1_2.caseId
  L7_2 = os
  L7_2 = L7_2.date
  L8_2 = "%Y-%m-%dT%H:%M:%S"
  L7_2 = L7_2(L8_2)
  L8_2 = L2_2.name
  L9_2 = L3_2.content
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
  L7_2 = L6_2.affectedRows
  if L7_2 > 0 then
    L7_2 = SendDiscordLog
    L8_2 = "court_cases"
    L9_2 = "\240\159\147\157 New Note Added to Court Case"
    L10_2 = nil
    L11_2 = 15844367
    L12_2 = {}
    L13_2 = {}
    L13_2.name = "Case ID"
    L14_2 = tostring
    L15_2 = A1_2.caseId
    L14_2 = L14_2(L15_2)
    L13_2.value = L14_2
    L13_2.inline = true
    L14_2 = {}
    L14_2.name = "Author"
    L15_2 = L2_2.name
    L14_2.value = L15_2
    L14_2.inline = true
    L15_2 = {}
    L15_2.name = "Added By"
    L16_2 = FormatPlayer
    L17_2 = A0_2
    L16_2 = L16_2(L17_2)
    L15_2.value = L16_2
    L15_2.inline = false
    L16_2 = {}
    L16_2.name = "Note"
    L17_2 = L3_2.content
    L18_2 = L17_2
    L17_2 = L17_2.sub
    L19_2 = 1
    L20_2 = 100
    L17_2 = L17_2(L18_2, L19_2, L20_2)
    L18_2 = L3_2.content
    L19_2 = L18_2
    L18_2 = L18_2.len
    L18_2 = L18_2(L19_2)
    if L18_2 > 100 then
      L18_2 = "..."
      if L18_2 then
        goto lbl_82
      end
    end
    L18_2 = ""
    ::lbl_82::
    L17_2 = L17_2 .. L18_2
    L16_2.value = L17_2
    L16_2.inline = false
    L12_2[1] = L13_2
    L12_2[2] = L14_2
    L12_2[3] = L15_2
    L12_2[4] = L16_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    L7_2 = {}
    L7_2.success = true
    return L7_2
  else
    L7_2 = {}
    L7_2.success = false
    L7_2.error = "Failed to add note"
    return L7_2
  end
end
L2_1(L3_1, L4_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:deleteCourtCase"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = A1_2.caseId
  if not L2_2 then
    L2_2 = {}
    L2_2.success = false
    L2_2.error = "No case ID provided"
    return L2_2
  end
  L2_2 = "SELECT id FROM mdt_court_cases WHERE id = ?"
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L2_2
  L5_2 = {}
  L6_2 = A1_2.caseId
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = #L3_2
    if 0 ~= L4_2 then
      goto lbl_29
    end
  end
  L4_2 = {}
  L4_2.success = false
  L4_2.error = "Case not found"
  do return L4_2 end
  ::lbl_29::
  L4_2 = "DELETE FROM mdt_court_cases WHERE id = ?"
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = L4_2
  L7_2 = {}
  L8_2 = A1_2.caseId
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2.affectedRows
  if L6_2 > 0 then
    L6_2 = SendDiscordLog
    L7_2 = "court_cases"
    L8_2 = "\226\157\140 Court Case Deleted"
    L9_2 = nil
    L10_2 = 10038562
    L11_2 = {}
    L12_2 = {}
    L12_2.name = "Case ID"
    L13_2 = tostring
    L14_2 = A1_2.caseId
    L13_2 = L13_2(L14_2)
    L12_2.value = L13_2
    L12_2.inline = true
    L13_2 = {}
    L13_2.name = "Deleted By"
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
    L7_2 = {}
    L8_2 = A1_2.caseId
    L7_2.caseId = L8_2
    L6_2.data = L7_2
    return L6_2
  else
    L6_2 = {}
    L6_2.success = false
    L6_2.error = "Failed to delete case"
    return L6_2
  end
end
L2_1(L3_1, L4_1)
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)"
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2 = L1_2(L2_2, L3_2)
  L7_2 = string
  L7_2 = L7_2.format
  L8_2 = "%04d-%02d-%02d %02d:%02d:%02d"
  L9_2 = L1_2
  L10_2 = L2_2
  L11_2 = L3_2
  L12_2 = L4_2
  L13_2 = L5_2
  L14_2 = L6_2
  return L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "kartik-mdt:server:getCourtCasesForDateRange"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = A1_2.startDate
  if L2_2 then
    L2_2 = A1_2.endDate
    if L2_2 then
      goto lbl_12
    end
  end
  L2_2 = {}
  L2_2.success = false
  L2_2.error = "No date provided"
  do return L2_2 end
  ::lbl_12::
  L2_2 = L2_1
  L3_2 = A1_2.startDate
  L2_2 = L2_2(L3_2)
  L3_2 = L2_1
  L4_2 = A1_2.endDate
  L3_2 = L3_2(L4_2)
  L4_2 = [[
        SELECT * FROM mdt_court_cases
        WHERE date BETWEEN ? AND ?
        ORDER BY date DESC
    ]]
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = L4_2
  L7_2 = {}
  L8_2 = L2_2
  L9_2 = L3_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = #L5_2
  if 0 == L6_2 then
    L6_2 = {}
    L6_2.success = false
    L6_2.error = "No cases found for the given date range"
    return L6_2
  end
  L6_2 = {}
  L7_2 = ipairs
  L8_2 = L5_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = table
    L13_2 = L13_2.insert
    L14_2 = L6_2
    L15_2 = L12_2.id
    L13_2(L14_2, L15_2)
  end
  L7_2 = {}
  L8_2 = #L6_2
  if L8_2 > 0 then
    L8_2 = [[
            SELECT * FROM mdt_court_case_notes 
            WHERE caseId IN (]]
    L9_2 = table
    L9_2 = L9_2.concat
    L10_2 = L6_2
    L11_2 = ","
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = [[
)
            ORDER BY timestamp DESC
        ]]
    L8_2 = L8_2 .. L9_2 .. L10_2
    L9_2 = MySQL
    L9_2 = L9_2.query
    L9_2 = L9_2.await
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    L7_2 = L9_2
  end
  L8_2 = {}
  L9_2 = ipairs
  L10_2 = L7_2
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = L14_2.caseId
    L15_2 = L8_2[L15_2]
    if not L15_2 then
      L15_2 = L14_2.caseId
      L16_2 = {}
      L8_2[L15_2] = L16_2
    end
    L15_2 = table
    L15_2 = L15_2.insert
    L16_2 = L14_2.caseId
    L16_2 = L8_2[L16_2]
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  L9_2 = ipairs
  L10_2 = L5_2
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = json
    L15_2 = L15_2.decode
    L16_2 = L14_2.relatedReports
    if not L16_2 then
      L16_2 = "[]"
    end
    L15_2 = L15_2(L16_2)
    L14_2.relatedReports = L15_2
    L15_2 = L14_2.id
    L15_2 = L8_2[L15_2]
    if not L15_2 then
      L15_2 = {}
    end
    L14_2.notes = L15_2
    L15_2 = L1_1
    L16_2 = L14_2.id
    L15_2 = L15_2(L16_2)
    L14_2.formattedId = L15_2
  end
  L9_2 = {}
  L9_2.success = true
  L9_2.cases = L5_2
  return L9_2
end
L3_1(L4_1, L5_1)
