local L0_1, L1_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
if "kartik-mdt" ~= L0_1 then
  return
end
L0_1 = detectCore
L1_1 = "es_extended"
L0_1 = L0_1(L1_1)
if not L0_1 then
  return
end
L0_1 = {}
Jobs = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L3_2 = ""
  L4_2 = {}
  if "" ~= A0_2 then
    L3_2 = [[
            WHERE 
                LOWER(users.firstname) LIKE ? OR
                LOWER(users.lastname) LIKE ? OR
                LOWER(users.identifier) LIKE ? 
        ]]
    L5_2 = 1
    L6_2 = 3
    L7_2 = 1
    for L8_2 = L5_2, L6_2, L7_2 do
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = L4_2
      L11_2 = "%"
      L12_2 = A0_2
      L13_2 = "%"
      L11_2 = L11_2 .. L12_2 .. L13_2
      L9_2(L10_2, L11_2)
    end
  end
  L5_2 = "SELECT COUNT(users.identifier) as count FROM users "
  L6_2 = L3_2
  L5_2 = L5_2 .. L6_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = L5_2
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 then
    L7_2 = L6_2[1]
    if L7_2 then
      L7_2 = L6_2[1]
      L7_2 = L7_2.count
      if L7_2 then
        goto lbl_39
      end
    end
  end
  L7_2 = 0
  ::lbl_39::
  L8_2 = "SELECT * FROM users "
  L9_2 = L3_2
  L10_2 = " LIMIT ? OFFSET ?"
  L8_2 = L8_2 .. L9_2 .. L10_2
  L9_2 = table
  L9_2 = L9_2.insert
  L10_2 = L4_2
  L11_2 = A2_2
  L9_2(L10_2, L11_2)
  L9_2 = table
  L9_2 = L9_2.insert
  L10_2 = L4_2
  L11_2 = A1_2
  L9_2(L10_2, L11_2)
  L9_2 = MySQL
  L9_2 = L9_2.query
  L9_2 = L9_2.await
  L10_2 = L8_2
  L11_2 = L4_2
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = {}
  L11_2 = ipairs
  L12_2 = L9_2 or L12_2
  if not L9_2 then
    L12_2 = {}
  end
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = Jobs
    L18_2 = L16_2.job
    L17_2 = L17_2[L18_2]
    if not L17_2 then
      L17_2 = {}
    end
    L18_2 = MySQL
    L18_2 = L18_2.query
    L18_2 = L18_2.await
    L19_2 = "SELECT warrant, fingerprint, dna, isDangerous FROM mdt_profiles WHERE citizenid = ?"
    L20_2 = {}
    L21_2 = L16_2.identifier
    L20_2[1] = L21_2
    L18_2 = L18_2(L19_2, L20_2)
    if L18_2 then
      L19_2 = L18_2[1]
      if L19_2 then
        goto lbl_91
      end
    end
    L19_2 = {}
    ::lbl_91::
    L20_2 = fetchLicenses
    L21_2 = L16_2.identifier
    L20_2 = L20_2(L21_2)
    L21_2 = "Unknown"
    L22_2 = GetPhoneNumber
    if L22_2 then
      L22_2 = pcall
      L23_2 = GetPhoneNumber
      L24_2 = L16_2.identifier
      L22_2, L23_2 = L22_2(L23_2, L24_2)
      if L22_2 then
        L21_2 = L23_2
      end
    end
    L22_2 = table
    L22_2 = L22_2.insert
    L23_2 = L10_2
    L24_2 = {}
    L25_2 = L16_2.id
    if not L25_2 then
      L25_2 = nil
    end
    L24_2.id = L25_2
    L25_2 = L16_2.identifier
    L24_2.citizenid = L25_2
    L25_2 = L16_2.firstname
    L24_2.firstname = L25_2
    L25_2 = L16_2.lastname
    L24_2.surname = L25_2
    L25_2 = L16_2.sex
    if "f" == L25_2 then
      L25_2 = "Female"
      if L25_2 then
        goto lbl_128
      end
    end
    L25_2 = "Male"
    ::lbl_128::
    L24_2.gender = L25_2
    L25_2 = L16_2.nationality
    if not L25_2 then
      L25_2 = "Unknown"
    end
    L24_2.nationality = L25_2
    L25_2 = L16_2.dateofbirth
    if not L25_2 then
      L25_2 = "Unknown"
    end
    L24_2.birthdate = L25_2
    L25_2 = L16_2.photo
    L24_2.photo = L25_2
    L25_2 = L16_2.account
    if not L25_2 then
      L25_2 = "Unknown"
    end
    L24_2.bankAccount = L25_2
    L24_2.phoneNumber = L21_2
    L25_2 = L17_2.label
    L24_2.job = L25_2
    L25_2 = L19_2.warrant
    if not L25_2 then
      L25_2 = 0
    end
    L24_2.warrant = L25_2
    L25_2 = L19_2.isDangerous
    if not L25_2 then
      L25_2 = 0
    end
    L24_2.isDangerous = L25_2
    L25_2 = L20_2 or L25_2
    if not L20_2 then
      L25_2 = {}
    end
    L24_2.licenses = L25_2
    L25_2 = L19_2.fingerprint
    if not L25_2 then
      L25_2 = "Not Registered"
    end
    L24_2.fingerprint = L25_2
    L25_2 = L19_2.dna
    if not L25_2 then
      L25_2 = "Not Registered"
    end
    L24_2.dna = L25_2
    L22_2(L23_2, L24_2)
  end
  L11_2 = L10_2
  L12_2 = L7_2
  return L11_2, L12_2
end
fetchRealCitizens = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = "UPDATE users SET photo = ? WHERE identifier = ?"
  L3_2 = {}
  L4_2 = A1_2
  L5_2 = A0_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = L4_2.affectedRows
    if L5_2 > 0 then
      L5_2 = true
      return L5_2
    end
  end
  L5_2 = false
  return L5_2
end
updateCitizenPhoto = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = "SELECT COUNT(*) as count FROM users WHERE identifier = ?"
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = L1_2
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L2_2 or L3_2
  if L2_2 then
    L3_2 = L2_2[1]
    L3_2 = L3_2.count
    L3_2 = L3_2 > 0
  end
  return L3_2
end
checkCitizenIdInPlayers = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = [[
        SELECT COUNT(*) as count
        FROM mdt_units
        JOIN users ON mdt_units.citizenid = users.identifier
        ]]
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L2_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = L3_2[1]
    if L4_2 then
      L4_2 = L3_2[1]
      L4_2 = L4_2.count
      if L4_2 then
        goto lbl_20
      end
    end
  end
  L4_2 = 0
  ::lbl_20::
  return L4_2
end
fetchBodycamPlayerCount = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = "WHERE mdt_units.citizenid = users.identifier"
  L3_2 = {}
  if "" ~= A0_2 then
    L4_2 = L2_2
    L5_2 = " AND (LOWER(users.firstname) LIKE LOWER(?) "
    L6_2 = "OR LOWER(users.lastname) LIKE LOWER(?) "
    L7_2 = "OR LOWER(users.identifier) LIKE LOWER(?))"
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
    L2_2 = L4_2
    L4_2 = {}
    L5_2 = "%"
    L6_2 = A0_2
    L7_2 = "%"
    L5_2 = L5_2 .. L6_2 .. L7_2
    L6_2 = "%"
    L7_2 = A0_2
    L8_2 = "%"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L7_2 = "%"
    L8_2 = A0_2
    L9_2 = "%"
    L7_2 = L7_2 .. L8_2 .. L9_2
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L3_2 = L4_2
  end
  L4_2 = {}
  L5_2 = table
  L5_2 = L5_2.unpack
  L6_2 = L3_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L5_2(L6_2)
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L4_2[5] = L9_2
  L4_2[6] = L10_2
  L4_2[7] = L11_2
  L4_2[8] = L12_2
  L4_2[9] = L13_2
  L4_2[10] = L14_2
  L4_2[11] = L15_2
  L4_2[12] = L16_2
  L4_2[13] = L17_2
  L4_2[14] = L18_2
  L4_2[15] = L19_2
  L4_2[16] = L20_2
  L5_2 = table
  L5_2 = L5_2.insert
  L6_2 = L4_2
  L7_2 = A1_2
  L5_2(L6_2, L7_2)
  L5_2 = [[
        SELECT mdt_units.citizenid, mdt_units.bodycam AS status,
               users.firstname, users.lastname, users.job
        FROM mdt_units
        JOIN users ON mdt_units.citizenid = users.identifier
        ]]
  L6_2 = L2_2
  L7_2 = [[
        ORDER BY mdt_units.bodycam ASC
        LIMIT 10 OFFSET ?
    ]]
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = L5_2
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    L6_2 = {}
  end
  L7_2 = {}
  L8_2 = ipairs
  L9_2 = L6_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = Jobs
    L15_2 = L13_2.job
    L14_2 = L14_2[L15_2]
    if not L14_2 then
      L14_2 = {}
    end
    L15_2 = table
    L15_2 = L15_2.insert
    L16_2 = L7_2
    L17_2 = {}
    L18_2 = L13_2.citizenid
    L17_2.citizenId = L18_2
    L18_2 = L13_2.firstname
    if not L18_2 then
      L18_2 = "Unknown"
    end
    L19_2 = " "
    L20_2 = L13_2.lastname
    if not L20_2 then
      L20_2 = ""
    end
    L18_2 = L18_2 .. L19_2 .. L20_2
    L17_2.name = L18_2
    L18_2 = L14_2.label
    if not L18_2 then
      L18_2 = "Unknown"
    end
    L17_2.department = L18_2
    L18_2 = L14_2.grade
    if L18_2 then
      L18_2 = L14_2.grade
      L18_2 = L18_2.name
      if L18_2 then
        goto lbl_98
      end
    end
    L18_2 = "Unknown"
    ::lbl_98::
    L17_2.rank = L18_2
    L18_2 = L13_2.status
    L17_2.status = L18_2
    L15_2(L16_2, L17_2)
  end
  L8_2 = fetchBodycamPlayerCount
  if L8_2 then
    L8_2 = fetchBodycamPlayerCount
    L9_2 = L2_2
    L10_2 = L3_2
    L8_2 = L8_2(L9_2, L10_2)
  end
  L9_2 = L7_2
  L10_2 = L8_2
  return L9_2, L10_2
end
fetchBodycamPlayersWithPagination = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = [[
        SELECT COUNT(*) as count
        FROM mdt_units
        JOIN users ON mdt_units.citizenid = users.identifier
    ]]
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L2_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = L3_2[1]
    if L4_2 then
      L4_2 = L3_2[1]
      L4_2 = L4_2.count
      if L4_2 then
        goto lbl_20
      end
    end
  end
  L4_2 = 0
  ::lbl_20::
  return L4_2
end
fetchUnitCount = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L3_2 = "WHERE mdt_units.department = '"
  L4_2 = A2_2
  L5_2 = "' AND mdt_units.citizenid = users.identifier"
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = {}
  if "" ~= A0_2 then
    L5_2 = L3_2
    L6_2 = " AND (LOWER(users.firstname) LIKE LOWER(?) "
    L7_2 = "OR LOWER(users.lastname) LIKE LOWER(?) "
    L8_2 = "OR LOWER(users.identifier) LIKE LOWER(?))"
    L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
    L3_2 = L5_2
    L5_2 = {}
    L6_2 = "%"
    L7_2 = A0_2
    L8_2 = "%"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L7_2 = "%"
    L8_2 = A0_2
    L9_2 = "%"
    L7_2 = L7_2 .. L8_2 .. L9_2
    L8_2 = "%"
    L9_2 = A0_2
    L10_2 = "%"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L4_2 = L5_2
  end
  L5_2 = {}
  L6_2 = table
  L6_2 = L6_2.unpack
  L7_2 = L4_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L6_2(L7_2)
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
  L6_2 = table
  L6_2 = L6_2.insert
  L7_2 = L5_2
  L8_2 = A1_2
  L6_2(L7_2, L8_2)
  L6_2 = [[
        SELECT mdt_units.id, mdt_units.dutyRecords, mdt_units.tags, mdt_units.isFired,
               mdt_units.totalHours, mdt_units.status, users.identifier AS citizenid, users.photo,
               users.firstname, users.lastname, users.job, mdt_units.callsign
        FROM mdt_units
        JOIN users ON mdt_units.citizenid = users.identifier
    ]]
  L7_2 = L3_2
  L8_2 = [[
        LIMIT 10 OFFSET ?
    ]]
  L6_2 = L6_2 .. L7_2 .. L8_2
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = L6_2
  L9_2 = L5_2
  L7_2 = L7_2(L8_2, L9_2)
  if not L7_2 then
    L7_2 = {}
  end
  L8_2 = {}
  L9_2 = ipairs
  L10_2 = L7_2
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = Jobs
    L16_2 = L14_2.job
    L15_2 = L15_2[L16_2]
    if not L15_2 then
      L15_2 = {}
    end
    L16_2 = json
    L16_2 = L16_2.decode
    L17_2 = L14_2.dutyRecords
    if not L17_2 then
      L17_2 = "[]"
    end
    L16_2 = L16_2(L17_2)
    L17_2 = {}
    L18_2 = #L16_2
    if L18_2 > 10 then
      L18_2 = {}
      L19_2 = table
      L19_2 = L19_2.unpack
      L20_2 = L16_2
      L21_2 = #L16_2
      L21_2 = L21_2 - 9
      L22_2 = #L16_2
      L19_2, L20_2, L21_2, L22_2, L23_2 = L19_2(L20_2, L21_2, L22_2)
      L18_2[1] = L19_2
      L18_2[2] = L20_2
      L18_2[3] = L21_2
      L18_2[4] = L22_2
      L18_2[5] = L23_2
      L17_2 = L18_2
    else
      L17_2 = L16_2
    end
    L18_2 = table
    L18_2 = L18_2.insert
    L19_2 = L8_2
    L20_2 = {}
    L21_2 = L14_2.id
    L20_2.id = L21_2
    L21_2 = L14_2.citizenid
    L20_2.citizenId = L21_2
    L21_2 = L14_2.firstname
    if not L21_2 then
      L21_2 = "Unknown"
    end
    L22_2 = " "
    L23_2 = L14_2.lastname
    if not L23_2 then
      L23_2 = ""
    end
    L21_2 = L21_2 .. L22_2 .. L23_2
    L20_2.name = L21_2
    L21_2 = L15_2.grade
    if L21_2 then
      L21_2 = L15_2.grade_name
      if L21_2 then
        goto lbl_123
      end
    end
    L21_2 = "Unknown"
    ::lbl_123::
    L20_2.rank = L21_2
    L21_2 = L15_2.label
    if not L21_2 then
      L21_2 = "Unknown"
    end
    L20_2.department = L21_2
    L21_2 = L14_2.tags
    L20_2.tags = L21_2
    L21_2 = L14_2.status
    L20_2.status = L21_2
    L21_2 = L14_2.isFired
    if not L21_2 then
      L21_2 = 0
    end
    L20_2.isFired = L21_2
    L21_2 = L14_2.photo
    L20_2.photo = L21_2
    L21_2 = L14_2.totalHours
    L20_2.totalDutyHours = L21_2
    L21_2 = L14_2.callsign
    L20_2.callsign = L21_2
    L20_2.dutyRecords = L17_2
    L18_2(L19_2, L20_2)
  end
  L9_2 = fetchUnitCount
  L10_2 = L3_2
  L11_2 = L4_2
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = L8_2
  L11_2 = L9_2
  return L10_2, L11_2
end
fetchUnitData = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = [[
        SELECT 
            warrants.id AS warrant_id,
            warrants.expiryDate AS expiryDate,
            warrants.issueDate AS issueDate,
            warrants.status AS status,
            users.firstname AS player_firstname,
            users.lastname AS player_lastname
        FROM 
            mdt_warrants AS warrants
        JOIN 
            users AS users 
        ON 
            warrants.suspectId = users.identifier
        WHERE 
            warrants.status = 'active'
        LIMIT ? OFFSET ?;
    ]]
  L3_2 = {}
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = {}
  end
  L5_2 = {}
  L6_2 = ipairs
  L7_2 = L4_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = {}
    L13_2 = L11_2.warrant_id
    L12_2.id = L13_2
    L13_2 = L11_2.expiryDate
    L12_2.expiryDate = L13_2
    L13_2 = L11_2.issueDate
    L12_2.issueDate = L13_2
    L13_2 = L11_2.player_firstname
    if not L13_2 then
      L13_2 = "Unknown"
    end
    L14_2 = " "
    L15_2 = L11_2.player_lastname
    if not L15_2 then
      L15_2 = ""
    end
    L13_2 = L13_2 .. L14_2 .. L15_2
    L12_2.name = L13_2
    L13_2 = L11_2.status
    L12_2.status = L13_2
    L13_2 = table
    L13_2 = L13_2.insert
    L14_2 = L5_2
    L15_2 = L12_2
    L13_2(L14_2, L15_2)
  end
  return L5_2
end
fetchWarrantsWithPlayers = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = [[
        SELECT 
            owned_vehicles.plate AS plate,
            owned_vehicles.vehicle AS vehicle,
            COALESCE(mdt_vehicles.status, 'Unknown') AS status,
            owned_vehicles.owner AS citizenid
        FROM 
            owned_vehicles
        LEFT JOIN 
            mdt_vehicles 
        ON 
            mdt_vehicles.plate = owned_vehicles.plate
        WHERE
            mdt_vehicles.status = 'bolo'
        LIMIT ? OFFSET ?;
    ]]
  L3_2 = {}
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = {}
  end
  L5_2 = {}
  L6_2 = ipairs
  L7_2 = L4_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = json
    L12_2 = L12_2.decode
    L13_2 = L11_2.vehicle
    L12_2 = L12_2(L13_2)
    L13_2 = pcall
    function L14_2()
      local L0_3, L1_3
      L0_3 = GetOfflinePlayerByCitizenId
      L1_3 = L11_2.citizenid
      return L0_3(L1_3)
    end
    L13_2, L14_2 = L13_2(L14_2)
    if L13_2 and L14_2 then
      L15_2 = L14_2.name
      if L15_2 then
        goto lbl_38
      end
    end
    L15_2 = "Unknown"
    ::lbl_38::
    L16_2 = {}
    L17_2 = L11_2.plate
    L16_2.plate = L17_2
    L17_2 = L11_2.status
    L16_2.status = L17_2
    L17_2 = L12_2.model
    L16_2.model = L17_2
    L16_2.owner = L15_2
    L17_2 = L11_2.citizenid
    L16_2.citizenid = L17_2
    L17_2 = table
    L17_2 = L17_2.insert
    L18_2 = L5_2
    L19_2 = L16_2
    L17_2(L18_2, L19_2)
  end
  return L5_2
end
fetchWantedVehiclesWithPlayers = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT plate, owner AS citizenid, id FROM owned_vehicles WHERE plate = @plate"
  L3_2 = {}
  L3_2["@plate"] = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = L1_2[1]
    if L2_2 then
      L2_2 = L1_2[1]
      L2_2 = L2_2.citizenid
      L3_2 = pcall
      function L4_2()
        local L0_3, L1_3
        L0_3 = GetOfflinePlayerByCitizenId
        L1_3 = L2_2
        return L0_3(L1_3)
      end
      L3_2, L4_2 = L3_2(L4_2)
      if L3_2 and L4_2 then
        L5_2 = L4_2.name
        if L5_2 then
          goto lbl_27
        end
      end
      L5_2 = "Unknown"
      ::lbl_27::
      return L5_2
  end
  else
    L2_2 = false
    return L2_2
  end
end
GetVehicleOwner = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = [[
        SELECT 
            owned_vehicles.plate AS plate,
            owned_vehicles.vehicle AS vehicle,
            COALESCE(mdt_vehicles.status, 'Unknown') AS status,
            owned_vehicles.owner AS citizenid,
            mdt_vehicles.sightings AS sightings,
            mdt_vehicles.photo AS photo
        FROM 
            owned_vehicles
        LEFT JOIN 
            mdt_vehicles 
        ON 
            mdt_vehicles.plate = owned_vehicles.plate
        WHERE 
            owned_vehicles.plate = ?
    ]]
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = #L1_2
    if L2_2 > 0 then
      L2_2 = L1_2[1]
      L3_2 = pcall
      function L4_2()
        local L0_3, L1_3
        L0_3 = GetOfflinePlayerByCitizenId
        L1_3 = L2_2.citizenid
        return L0_3(L1_3)
      end
      L3_2, L4_2 = L3_2(L4_2)
      if L3_2 and L4_2 then
        L5_2 = L4_2.name
        if L5_2 then
          goto lbl_27
        end
      end
      L5_2 = "Unknown"
      ::lbl_27::
      L6_2 = json
      L6_2 = L6_2.decode
      L7_2 = L2_2.vehicle
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L7_2 = L6_2.model
        if L7_2 then
          goto lbl_37
        end
      end
      L7_2 = "Unknown"
      ::lbl_37::
      L8_2 = {}
      L9_2 = L2_2.plate
      L8_2.plate = L9_2
      L9_2 = L2_2.status
      L8_2.status = L9_2
      L8_2.model = L7_2
      L9_2 = L2_2.sightings
      L8_2.sightings = L9_2
      L9_2 = L2_2.photo
      L8_2.photo = L9_2
      L8_2.owner = L5_2
      L9_2 = L2_2.citizenid
      L8_2.citizenid = L9_2
      return L8_2
    end
  end
  L2_2 = nil
  return L2_2
end
fetchVehicleByPlate = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L3_2 = ""
  L4_2 = {}
  if "" ~= A0_2 then
    L5_2 = "WHERE LOWER(owned_vehicles.plate) LIKE LOWER(?) "
    L6_2 = "OR LOWER(owned_vehicles.owner) LIKE LOWER(?) "
    L5_2 = L5_2 .. L6_2
    L3_2 = L5_2
    L5_2 = {}
    L6_2 = "%"
    L7_2 = A0_2
    L8_2 = "%"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L7_2 = "%"
    L8_2 = A0_2
    L9_2 = "%"
    L7_2 = L7_2 .. L8_2 .. L9_2
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L4_2 = L5_2
  end
  L5_2 = [[
        SELECT 
            owned_vehicles.plate AS plate,
            owned_vehicles.vehicle AS vehicle,
            COALESCE(mdt_vehicles.status, 'Unknown') AS status,
            owned_vehicles.owner AS citizenid
        FROM 
            owned_vehicles
        LEFT JOIN 
            mdt_vehicles 
        ON 
            mdt_vehicles.plate = owned_vehicles.plate
    ]]
  L6_2 = L3_2
  L7_2 = " LIMIT ? OFFSET ?"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = table
  L6_2 = L6_2.insert
  L7_2 = L4_2
  L8_2 = A2_2
  L6_2(L7_2, L8_2)
  L6_2 = table
  L6_2 = L6_2.insert
  L7_2 = L4_2
  L8_2 = A1_2
  L6_2(L7_2, L8_2)
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = L5_2
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = {}
  L8_2 = ipairs
  L9_2 = L6_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = pcall
    function L15_2()
      local L0_3, L1_3
      L0_3 = GetOfflinePlayerByCitizenId
      L1_3 = L13_2.citizenid
      return L0_3(L1_3)
    end
    L14_2, L15_2 = L14_2(L15_2)
    if L14_2 and L15_2 then
      L16_2 = L15_2.name
      if L16_2 then
        goto lbl_59
      end
    end
    L16_2 = "Unknown"
    ::lbl_59::
    L17_2 = json
    L17_2 = L17_2.decode
    L18_2 = L13_2.vehicle
    L17_2 = L17_2(L18_2)
    if L17_2 then
      L18_2 = L17_2.model
      if L18_2 then
        goto lbl_69
      end
    end
    L18_2 = "Unknown"
    ::lbl_69::
    L19_2 = {}
    L20_2 = L13_2.plate
    L19_2.plate = L20_2
    L20_2 = L13_2.status
    L19_2.status = L20_2
    L19_2.model = L18_2
    L19_2.owner = L16_2
    L20_2 = L13_2.citizenid
    L19_2.citizenid = L20_2
    L20_2 = table
    L20_2 = L20_2.insert
    L21_2 = L7_2
    L22_2 = L19_2
    L20_2(L21_2, L22_2)
  end
  return L7_2
end
fetchVehiclesFromPlayerTable = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = ""
  L2_2 = {}
  if "" ~= A0_2 then
    L3_2 = "WHERE LOWER(owned_vehicles.plate) LIKE LOWER(?) "
    L4_2 = "OR LOWER(owned_vehicles.owner) LIKE LOWER(?) "
    L3_2 = L3_2 .. L4_2
    L1_2 = L3_2
    L3_2 = {}
    L4_2 = "%"
    L5_2 = A0_2
    L6_2 = "%"
    L4_2 = L4_2 .. L5_2 .. L6_2
    L5_2 = "%"
    L6_2 = A0_2
    L7_2 = "%"
    L5_2 = L5_2 .. L6_2 .. L7_2
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L2_2 = L3_2
  end
  L3_2 = "SELECT COUNT(*) AS count FROM owned_vehicles "
  L4_2 = L1_2
  L3_2 = L3_2 .. L4_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = L3_2
  L6_2 = L2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2[1]
  if L5_2 then
    L5_2 = L4_2[1]
    L5_2 = L5_2.count
    if L5_2 then
      goto lbl_39
    end
  end
  L5_2 = 0
  ::lbl_39::
  return L5_2
end
countVehiclesFromPlayerTable = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L3_2 = ""
  L4_2 = {}
  if "" ~= A0_2 then
    L5_2 = "WHERE LOWER(users.firstname) LIKE LOWER(?) "
    L6_2 = "OR LOWER(users.lastname) LIKE LOWER(?) "
    L7_2 = "OR LOWER(users.identifier) LIKE LOWER(?) "
    L8_2 = "OR warrants.id = ?"
    L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
    L3_2 = L5_2
    L5_2 = {}
    L6_2 = "%"
    L7_2 = A0_2
    L8_2 = "%"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L7_2 = "%"
    L8_2 = A0_2
    L9_2 = "%"
    L7_2 = L7_2 .. L8_2 .. L9_2
    L8_2 = "%"
    L9_2 = A0_2
    L10_2 = "%"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L9_2 = A0_2
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L5_2[4] = L9_2
    L4_2 = L5_2
  end
  L5_2 = [[
        SELECT 
            warrants.id AS report_id,
            warrants.suspectId AS report_suspectId,
            warrants.charges AS report_charges,
            warrants.issueDate AS issueDate,
            warrants.issuingAuthority AS issuingAuthority,
            warrants.status AS status,
            users.photo AS photo,
            users.firstname AS player_firstname,
            users.lastname AS player_lastname,
            users.dateofbirth AS player_birthdate
        FROM 
            mdt_warrants AS warrants
        JOIN 
            users AS users 
        ON 
            warrants.suspectId = users.identifier
    ]]
  L6_2 = L3_2
  L7_2 = " LIMIT ? OFFSET ?"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = table
  L6_2 = L6_2.insert
  L7_2 = L4_2
  L8_2 = A2_2
  L6_2(L7_2, L8_2)
  L6_2 = table
  L6_2 = L6_2.insert
  L7_2 = L4_2
  L8_2 = A1_2
  L6_2(L7_2, L8_2)
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = L5_2
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = {}
  L8_2 = ipairs
  L9_2 = L6_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = {}
    L15_2 = L13_2.report_id
    L14_2.id = L15_2
    L15_2 = L13_2.report_charges
    L14_2.charges = L15_2
    L15_2 = L13_2.issueDate
    L14_2.issueDate = L15_2
    L15_2 = L13_2.issuingAuthority
    if not L15_2 then
      L15_2 = ""
    end
    L14_2.issuingAuthority = L15_2
    L15_2 = L13_2.status
    L14_2.status = L15_2
    L15_2 = L13_2.photo
    L14_2.photo = L15_2
    L15_2 = L13_2.player_firstname
    L16_2 = " "
    L17_2 = L13_2.player_lastname
    L15_2 = L15_2 .. L16_2 .. L17_2
    L14_2.name = L15_2
    L15_2 = L13_2.player_birthdate
    L14_2.birthdate = L15_2
    L15_2 = L13_2.player_nationality
    if not L15_2 then
      L15_2 = "Unknown"
    end
    L14_2.nationality = L15_2
    L15_2 = isDangerous
    L16_2 = L13_2.report_suspectId
    L15_2 = L15_2(L16_2)
    L14_2.isDangerous = L15_2
    L15_2 = table
    L15_2 = L15_2.insert
    L16_2 = L7_2
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  return L7_2
end
fetchWarrantsFromPlayers = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = ""
  L2_2 = {}
  if "" ~= A0_2 then
    L3_2 = "WHERE LOWER(users.firstname) LIKE LOWER(?) "
    L4_2 = "OR LOWER(users.lastname) LIKE LOWER(?) "
    L5_2 = "OR LOWER(users.identifier) LIKE LOWER(?) "
    L6_2 = "OR warrants.id = ?"
    L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2
    L1_2 = L3_2
    L3_2 = {}
    L4_2 = "%"
    L5_2 = A0_2
    L6_2 = "%"
    L4_2 = L4_2 .. L5_2 .. L6_2
    L5_2 = "%"
    L6_2 = A0_2
    L7_2 = "%"
    L5_2 = L5_2 .. L6_2 .. L7_2
    L6_2 = "%"
    L7_2 = A0_2
    L8_2 = "%"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L7_2 = A0_2
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L3_2[4] = L7_2
    L2_2 = L3_2
  end
  L3_2 = [[
        SELECT COUNT(*) AS count
        FROM mdt_warrants AS warrants
        JOIN users AS users
        ON warrants.suspectId = users.identifier
    ]]
  L4_2 = L1_2
  L3_2 = L3_2 .. L4_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = L3_2
  L6_2 = L2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2[1]
  if L5_2 then
    L5_2 = L4_2[1]
    L5_2 = L5_2.count
    if L5_2 then
      goto lbl_46
    end
  end
  L5_2 = 0
  ::lbl_46::
  return L5_2
end
countWarrantsFromPlayers = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = {}
  L1_2.citizenid = A0_2
  L2_2 = [[
        SELECT 
            owned_vehicles.plate AS plate,
            owned_vehicles.vehicle AS vehicle,
            COALESCE(mdt_vehicles.status, 'Unknown') AS status,
            owned_vehicles.owner AS citizenid
        FROM 
            owned_vehicles
        LEFT JOIN 
            mdt_vehicles 
        ON 
            mdt_vehicles.plate = owned_vehicles.plate
        WHERE
            owned_vehicles.owner = @citizenid
    ]]
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L2_2
  L5_2 = L1_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = {}
  L5_2 = ipairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = GetOfflinePlayerByCitizenId
    L12_2 = L10_2.citizenid
    L11_2 = L11_2(L12_2)
    if L11_2 then
      L12_2 = L11_2.name
      if L12_2 then
        goto lbl_26
      end
    end
    L12_2 = "Unknown"
    ::lbl_26::
    L13_2 = json
    L13_2 = L13_2.decode
    L14_2 = L10_2.vehicle
    L13_2 = L13_2(L14_2)
    if L13_2 then
      L14_2 = L13_2.model
      if L14_2 then
        goto lbl_36
      end
    end
    L14_2 = "Unknown"
    ::lbl_36::
    L15_2 = "Unknown"
    L16_2 = L10_2.sightings
    if L16_2 then
      L16_2 = L10_2.sightings
      L16_2 = #L16_2
      if L16_2 > 0 then
        L16_2 = L10_2.sightings
        L17_2 = L10_2.sightings
        L17_2 = #L17_2
        L16_2 = L16_2[L17_2]
        L15_2 = L16_2.timestamp
      end
    end
    L16_2 = {}
    L17_2 = L10_2.plate
    L16_2.plate = L17_2
    L17_2 = L10_2.status
    L16_2.status = L17_2
    L16_2.model = L14_2
    L16_2.owner = L12_2
    L17_2 = L10_2.citizenid
    L16_2.citizenid = L17_2
    L16_2.lastseen = L15_2
    L17_2 = table
    L17_2 = L17_2.insert
    L18_2 = L4_2
    L19_2 = L16_2
    L17_2(L18_2, L19_2)
  end
  return L4_2
end
fetchCitizenVehiclesFromTable = L0_1
