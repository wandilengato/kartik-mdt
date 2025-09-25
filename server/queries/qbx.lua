local L0_1, L1_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
if "kartik-mdt" ~= L0_1 then
  return
end
L0_1 = detectCore
L1_1 = "qbx_core"
L0_1 = L0_1(L1_1)
if not L0_1 then
  return
end
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2
  L3_2 = {}
  L4_2 = 0
  L5_2 = {}
  L6_2 = nil
  L7_2 = nil
  L8_2 = "%"
  L10_2 = A0_2
  L9_2 = A0_2.lower
  L9_2 = L9_2(L10_2)
  L10_2 = "%"
  L8_2 = L8_2 .. L9_2 .. L10_2
  L9_2 = ""
  L10_2 = ""
  L11_2 = {}
  L12_2 = {}
  L13_2 = {}
  if "" ~= A0_2 then
    L15_2 = A0_2
    L14_2 = A0_2.find
    L16_2 = " "
    L14_2 = L14_2(L15_2, L16_2)
    if L14_2 then
      L15_2 = A0_2
      L14_2 = A0_2.match
      L16_2 = "^(%S+)%s+(.+)$"
      L14_2, L15_2 = L14_2(L15_2, L16_2)
      L7_2 = L15_2
      L6_2 = L14_2
      if L6_2 then
        L15_2 = L6_2
        L14_2 = L6_2.lower
        L14_2 = L14_2(L15_2)
        L6_2 = L14_2
      end
      if L7_2 then
        L15_2 = L7_2
        L14_2 = L7_2.lower
        L14_2 = L14_2(L15_2)
        L7_2 = L14_2
      end
    end
  end
  if "" ~= A0_2 then
    if L6_2 and L7_2 then
      L9_2 = [[
                (
                    LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname"))) LIKE ? AND
                    LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname"))) LIKE ?
                )
            ]]
      L10_2 = [[
                (
                    LOWER(mdt_profiles.notes) LIKE ? OR
                    LOWER(mdt_profiles.fingerprint) LIKE ? OR
                    LOWER(mdt_profiles.dna) LIKE ?
                )
            ]]
      L14_2 = {}
      L15_2 = "%"
      L16_2 = L6_2
      L17_2 = "%"
      L15_2 = L15_2 .. L16_2 .. L17_2
      L16_2 = "%"
      L17_2 = L7_2
      L18_2 = "%"
      L16_2 = L16_2 .. L17_2 .. L18_2
      L14_2[1] = L15_2
      L14_2[2] = L16_2
      L11_2 = L14_2
      L14_2 = {}
      L15_2 = "%"
      L16_2 = L6_2
      L17_2 = "%"
      L15_2 = L15_2 .. L16_2 .. L17_2
      L16_2 = "%"
      L17_2 = L7_2
      L18_2 = "%"
      L16_2 = L16_2 .. L17_2 .. L18_2
      L17_2 = "%"
      L19_2 = A0_2
      L18_2 = A0_2.lower
      L18_2 = L18_2(L19_2)
      L19_2 = "%"
      L17_2 = L17_2 .. L18_2 .. L19_2
      L14_2[1] = L15_2
      L14_2[2] = L16_2
      L14_2[3] = L17_2
      L12_2 = L14_2
    else
      L14_2 = 1
      L15_2 = 3
      L16_2 = 1
      for L17_2 = L14_2, L15_2, L16_2 do
        L18_2 = table
        L18_2 = L18_2.insert
        L19_2 = L11_2
        L20_2 = L8_2
        L18_2(L19_2, L20_2)
      end
      L14_2 = 1
      L15_2 = 3
      L16_2 = 1
      for L17_2 = L14_2, L15_2, L16_2 do
        L18_2 = table
        L18_2 = L18_2.insert
        L19_2 = L12_2
        L20_2 = L8_2
        L18_2(L19_2, L20_2)
      end
      L9_2 = [[
                (
                    LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname"))) LIKE ? OR
                    LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname"))) LIKE ? OR
                    LOWER(players.citizenid) LIKE ?
                )
            ]]
      L10_2 = [[
                (
                    LOWER(mdt_profiles.notes) LIKE ? OR
                    LOWER(mdt_profiles.fingerprint) LIKE ? OR
                    LOWER(mdt_profiles.dna) LIKE ?
                )
            ]]
    end
    L14_2 = MySQL
    L14_2 = L14_2.scalar
    L14_2 = L14_2.await
    L15_2 = "SELECT COUNT(*) FROM players WHERE "
    L16_2 = L9_2
    L15_2 = L15_2 .. L16_2
    L16_2 = L11_2
    L14_2 = L14_2(L15_2, L16_2)
    L15_2 = MySQL
    L15_2 = L15_2.scalar
    L15_2 = L15_2.await
    L16_2 = [[
            SELECT COUNT(DISTINCT players.citizenid)
            FROM mdt_profiles
            JOIN players ON players.citizenid = mdt_profiles.citizenid
            WHERE ]]
    L17_2 = L10_2
    L16_2 = L16_2 .. L17_2
    L17_2 = L12_2
    L15_2 = L15_2(L16_2, L17_2)
    L16_2 = L14_2 or L16_2
    if not L14_2 then
      L16_2 = 0
    end
    L17_2 = L15_2 or L17_2
    if not L15_2 then
      L17_2 = 0
    end
    L4_2 = L16_2 + L17_2
    L16_2 = ipairs
    L17_2 = L11_2
    L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
    for L20_2, L21_2 in L16_2, L17_2, L18_2, L19_2 do
      L22_2 = table
      L22_2 = L22_2.insert
      L23_2 = L13_2
      L24_2 = L21_2
      L22_2(L23_2, L24_2)
    end
    L16_2 = ipairs
    L17_2 = L12_2
    L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
    for L20_2, L21_2 in L16_2, L17_2, L18_2, L19_2 do
      L22_2 = table
      L22_2 = L22_2.insert
      L23_2 = L13_2
      L24_2 = L21_2
      L22_2(L23_2, L24_2)
    end
    L16_2 = table
    L16_2 = L16_2.insert
    L17_2 = L13_2
    L18_2 = A2_2
    L16_2(L17_2, L18_2)
    L16_2 = table
    L16_2 = L16_2.insert
    L17_2 = L13_2
    L18_2 = A1_2
    L16_2(L17_2, L18_2)
    L16_2 = MySQL
    L16_2 = L16_2.query
    L16_2 = L16_2.await
    L17_2 = [[
            SELECT id, citizenid, charinfo, photo, job FROM (
                SELECT players.id, players.citizenid, players.charinfo, players.photo, players.job
                FROM players
                WHERE ]]
    L18_2 = L9_2
    L19_2 = [[

                UNION

                SELECT players.id, players.citizenid, players.charinfo, players.photo, players.job
                FROM mdt_profiles
                JOIN players ON players.citizenid = mdt_profiles.citizenid
                WHERE ]]
    L20_2 = L10_2
    L21_2 = [[
            ) AS combined_results
            LIMIT ? OFFSET ?
        ]]
    L17_2 = L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2
    L18_2 = L13_2
    L16_2 = L16_2(L17_2, L18_2)
    L5_2 = L16_2
  else
    L14_2 = MySQL
    L14_2 = L14_2.scalar
    L14_2 = L14_2.await
    L15_2 = "SELECT COUNT(*) FROM players"
    L14_2 = L14_2(L15_2)
    L4_2 = L14_2
    L14_2 = MySQL
    L14_2 = L14_2.query
    L14_2 = L14_2.await
    L15_2 = "SELECT id, citizenid, charinfo, photo, job FROM players LIMIT ? OFFSET ?"
    L16_2 = {}
    L17_2 = A2_2
    L18_2 = A1_2
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L14_2 = L14_2(L15_2, L16_2)
    L5_2 = L14_2
  end
  L14_2 = ipairs
  L15_2 = L5_2 or L15_2
  if not L5_2 then
    L15_2 = {}
  end
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
  for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
    L20_2 = json
    L20_2 = L20_2.decode
    L21_2 = L19_2.charinfo
    L20_2 = L20_2(L21_2)
    L21_2 = json
    L21_2 = L21_2.decode
    L22_2 = L19_2.job
    L21_2 = L21_2(L22_2)
    L22_2 = MySQL
    L22_2 = L22_2.query
    L22_2 = L22_2.await
    L23_2 = "SELECT warrant, fingerprint, dna, isDangerous FROM mdt_profiles WHERE citizenid = ?"
    L24_2 = {}
    L25_2 = L19_2.citizenid
    L24_2[1] = L25_2
    L22_2 = L22_2(L23_2, L24_2)
    if L22_2 then
      L23_2 = L22_2[1]
      if L23_2 then
        goto lbl_221
      end
    end
    L23_2 = {}
    ::lbl_221::
    L24_2 = fetchLicenses
    L25_2 = L19_2.citizenid
    L24_2 = L24_2(L25_2)
    L25_2 = L20_2
    if L25_2 then
      L25_2 = L25_2.phone
    end
    if not L25_2 then
      L25_2 = "Unknown"
    end
    L26_2 = GetPhoneNumber
    if L26_2 then
      L26_2 = pcall
      L27_2 = GetPhoneNumber
      L28_2 = L19_2.citizenid
      L26_2, L27_2 = L26_2(L27_2, L28_2)
      if L26_2 then
        L25_2 = L27_2
      end
    end
    L26_2 = table
    L26_2 = L26_2.insert
    L27_2 = L3_2
    L28_2 = {}
    L29_2 = L19_2.citizenid
    L28_2.citizenid = L29_2
    L29_2 = L20_2.firstname
    L28_2.firstname = L29_2
    L29_2 = L20_2.lastname
    L28_2.surname = L29_2
    L29_2 = tonumber
    L30_2 = L20_2.gender
    L29_2 = L29_2(L30_2)
    if 1 == L29_2 then
      L29_2 = "Female"
      if L29_2 then
        goto lbl_261
      end
    end
    L29_2 = "Male"
    ::lbl_261::
    L28_2.gender = L29_2
    L29_2 = type
    L30_2 = L20_2.nationality
    L29_2 = L29_2(L30_2)
    if "table" == L29_2 then
      L29_2 = L20_2.nationality
      L29_2 = L29_2.name
      if L29_2 then
        goto lbl_272
      end
    end
    L29_2 = L20_2.nationality
    ::lbl_272::
    L28_2.nationality = L29_2
    L29_2 = L20_2.birthdate
    L28_2.birthdate = L29_2
    L29_2 = L19_2.photo
    L28_2.photo = L29_2
    L29_2 = L20_2.account
    L28_2.bankAccount = L29_2
    L28_2.phoneNumber = L25_2
    L29_2 = L21_2.label
    L28_2.job = L29_2
    L29_2 = L23_2.warrant
    if not L29_2 then
      L29_2 = 0
    end
    L28_2.warrant = L29_2
    L29_2 = L23_2.isDangerous
    if not L29_2 then
      L29_2 = 0
    end
    L28_2.isDangerous = L29_2
    L29_2 = L24_2 or L29_2
    if not L24_2 then
      L29_2 = {}
    end
    L28_2.licenses = L29_2
    L29_2 = L23_2.fingerprint
    if not L29_2 then
      L29_2 = "Not Registered"
    end
    L28_2.fingerprint = L29_2
    L29_2 = L23_2.dna
    if not L29_2 then
      L29_2 = "Not Registered"
    end
    L28_2.dna = L29_2
    L26_2(L27_2, L28_2)
  end
  L14_2 = L3_2
  L15_2 = L4_2
  return L14_2, L15_2
end
fetchRealCitizens = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = "UPDATE players SET photo = ? WHERE citizenid = ?"
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
  L1_2 = "SELECT COUNT(*) as count FROM players WHERE citizenid = ?"
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
        JOIN players ON mdt_units.citizenid = players.citizenid
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
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L2_2 = "WHERE mdt_units.citizenid = players.citizenid"
  L3_2 = {}
  if "" ~= A0_2 then
    L4_2 = L2_2
    L5_2 = " AND (LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, \"$.firstname\"))) LIKE LOWER(?) "
    L6_2 = "OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, \"$.lastname\"))) LIKE LOWER(?) "
    L7_2 = "OR LOWER(players.citizenid) LIKE LOWER(?))"
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
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L5_2(L6_2)
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
  L4_2[17] = L21_2
  L5_2 = table
  L5_2 = L5_2.insert
  L6_2 = L4_2
  L7_2 = A1_2
  L5_2(L6_2, L7_2)
  L5_2 = [[
        SELECT mdt_units.citizenid, mdt_units.bodycam AS status,
               players.charinfo, players.job
        FROM mdt_units
        JOIN players ON mdt_units.citizenid = players.citizenid
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
    L14_2 = json
    L14_2 = L14_2.decode
    L15_2 = L13_2.charinfo
    if not L15_2 then
      L15_2 = "{}"
    end
    L14_2 = L14_2(L15_2)
    L15_2 = json
    L15_2 = L15_2.decode
    L16_2 = L13_2.job
    if not L16_2 then
      L16_2 = "{}"
    end
    L15_2 = L15_2(L16_2)
    L16_2 = table
    L16_2 = L16_2.insert
    L17_2 = L7_2
    L18_2 = {}
    L19_2 = L13_2.citizenid
    L18_2.citizenId = L19_2
    L19_2 = L14_2.firstname
    if not L19_2 then
      L19_2 = "Unknown"
    end
    L20_2 = " "
    L21_2 = L14_2.lastname
    if not L21_2 then
      L21_2 = ""
    end
    L19_2 = L19_2 .. L20_2 .. L21_2
    L18_2.name = L19_2
    L19_2 = L15_2.label
    if not L19_2 then
      L19_2 = "Unknown"
    end
    L18_2.department = L19_2
    L19_2 = L15_2.grade
    if L19_2 then
      L19_2 = L15_2.grade
      L19_2 = L19_2.name
      if L19_2 then
        goto lbl_105
      end
    end
    L19_2 = "Unknown"
    ::lbl_105::
    L18_2.rank = L19_2
    L19_2 = L13_2.status
    L18_2.status = L19_2
    L16_2(L17_2, L18_2)
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
        JOIN players ON mdt_units.citizenid = players.citizenid
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
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L3_2 = "WHERE mdt_units.department = '"
  L4_2 = A2_2
  L5_2 = "' AND mdt_units.citizenid = players.citizenid"
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = {}
  if "" ~= A0_2 then
    L5_2 = L3_2
    L6_2 = " AND (LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, \"$.firstname\"))) LIKE LOWER(?) "
    L7_2 = "OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, \"$.lastname\"))) LIKE LOWER(?) "
    L8_2 = "OR LOWER(players.citizenid) LIKE LOWER(?))"
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
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L6_2(L7_2)
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
  L6_2 = table
  L6_2 = L6_2.insert
  L7_2 = L5_2
  L8_2 = A1_2
  L6_2(L7_2, L8_2)
  L6_2 = [[
        SELECT mdt_units.id, mdt_units.dutyRecords, mdt_units.tags, mdt_units.isFired,
               mdt_units.totalHours, mdt_units.status, players.citizenid, players.photo,
               players.charinfo, players.job, mdt_units.callsign
        FROM mdt_units
        JOIN players ON mdt_units.citizenid = players.citizenid
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
    L15_2 = json
    L15_2 = L15_2.decode
    L16_2 = L14_2.charinfo
    if not L16_2 then
      L16_2 = "{}"
    end
    L15_2 = L15_2(L16_2)
    L16_2 = json
    L16_2 = L16_2.decode
    L17_2 = L14_2.job
    if not L17_2 then
      L17_2 = "{}"
    end
    L16_2 = L16_2(L17_2)
    L17_2 = json
    L17_2 = L17_2.decode
    L18_2 = L14_2.dutyRecords
    if not L18_2 then
      L18_2 = "[]"
    end
    L17_2 = L17_2(L18_2)
    L18_2 = {}
    L19_2 = #L17_2
    if L19_2 > 10 then
      L19_2 = {}
      L20_2 = table
      L20_2 = L20_2.unpack
      L21_2 = L17_2
      L22_2 = #L17_2
      L22_2 = L22_2 - 9
      L23_2 = #L17_2
      L20_2, L21_2, L22_2, L23_2, L24_2 = L20_2(L21_2, L22_2, L23_2)
      L19_2[1] = L20_2
      L19_2[2] = L21_2
      L19_2[3] = L22_2
      L19_2[4] = L23_2
      L19_2[5] = L24_2
      L18_2 = L19_2
    else
      L18_2 = L17_2
    end
    L19_2 = table
    L19_2 = L19_2.insert
    L20_2 = L8_2
    L21_2 = {}
    L22_2 = L14_2.id
    L21_2.id = L22_2
    L22_2 = L14_2.citizenid
    L21_2.citizenId = L22_2
    L22_2 = L15_2.firstname
    if not L22_2 then
      L22_2 = "Unknown"
    end
    L23_2 = " "
    L24_2 = L15_2.lastname
    if not L24_2 then
      L24_2 = ""
    end
    L22_2 = L22_2 .. L23_2 .. L24_2
    L21_2.name = L22_2
    L22_2 = L16_2.grade
    if L22_2 then
      L22_2 = L16_2.grade
      L22_2 = L22_2.name
      if L22_2 then
        goto lbl_131
      end
    end
    L22_2 = "Unknown"
    ::lbl_131::
    L21_2.rank = L22_2
    L22_2 = L16_2.label
    if not L22_2 then
      L22_2 = "Unknown"
    end
    L21_2.department = L22_2
    L22_2 = L14_2.tags
    L21_2.tags = L22_2
    L22_2 = L14_2.status
    L21_2.status = L22_2
    L22_2 = L14_2.isFired
    if not L22_2 then
      L22_2 = 0
    end
    L21_2.isFired = L22_2
    L22_2 = L14_2.photo
    L21_2.photo = L22_2
    L22_2 = L14_2.totalHours
    L21_2.totalDutyHours = L22_2
    L22_2 = L14_2.callsign
    L21_2.callsign = L22_2
    L21_2.dutyRecords = L18_2
    L19_2(L20_2, L21_2)
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
            JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS player_firstname,
            JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS player_lastname
        FROM 
            mdt_warrants AS warrants
        JOIN 
            players AS players 
        ON 
            warrants.suspectId = players.citizenid
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
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = [[
        SELECT 
            player_vehicles.plate AS plate,
            player_vehicles.vehicle AS vehicle,
            COALESCE(mdt_vehicles.status, 'Unknown') AS status,
            player_vehicles.citizenid AS citizenid
        FROM 
            player_vehicles
        LEFT JOIN 
            mdt_vehicles 
        ON 
            mdt_vehicles.plate = player_vehicles.plate
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
    L12_2 = pcall
    function L13_2()
      local L0_3, L1_3
      L0_3 = GetOfflinePlayerByCitizenId
      L1_3 = L11_2.citizenid
      return L0_3(L1_3)
    end
    L12_2, L13_2 = L12_2(L13_2)
    if L12_2 and L13_2 then
      L14_2 = L13_2.name
      if L14_2 then
        goto lbl_34
      end
    end
    L14_2 = "Unknown"
    ::lbl_34::
    L15_2 = {}
    L16_2 = L11_2.plate
    L15_2.plate = L16_2
    L16_2 = L11_2.status
    L15_2.status = L16_2
    L16_2 = GetHashKey
    L17_2 = L11_2.vehicle
    L16_2 = L16_2(L17_2)
    L15_2.model = L16_2
    L15_2.owner = L14_2
    L16_2 = L11_2.citizenid
    L15_2.citizenid = L16_2
    L16_2 = table
    L16_2 = L16_2.insert
    L17_2 = L5_2
    L18_2 = L15_2
    L16_2(L17_2, L18_2)
  end
  return L5_2
end
fetchWantedVehiclesWithPlayers = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT plate, citizenid, id FROM player_vehicles WHERE plate = @plate"
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = [[
        SELECT 
            player_vehicles.plate AS plate,
            player_vehicles.vehicle AS vehicle,
            COALESCE(mdt_vehicles.status, 'Unknown') AS status,
            player_vehicles.citizenid AS citizenid,
             mdt_vehicles.sightings AS sightings,
            mdt_vehicles.photo AS photo
        FROM player_vehicles
        LEFT JOIN mdt_vehicles ON mdt_vehicles.plate = player_vehicles.plate
        WHERE player_vehicles.plate = ?
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
      L6_2 = {}
      L7_2 = L2_2.plate
      L6_2.plate = L7_2
      L7_2 = L2_2.status
      L6_2.status = L7_2
      L7_2 = GetHashKey
      L8_2 = L2_2.vehicle
      L7_2 = L7_2(L8_2)
      L6_2.model = L7_2
      L6_2.owner = L5_2
      L7_2 = L2_2.sightings
      L6_2.sightings = L7_2
      L7_2 = L2_2.photo
      L6_2.photo = L7_2
      L7_2 = L2_2.citizenid
      L6_2.citizenid = L7_2
      return L6_2
    end
  end
  L2_2 = nil
  return L2_2
end
fetchVehicleByPlate = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L3_2 = ""
  L4_2 = {}
  if "" ~= A0_2 then
    L5_2 = "WHERE LOWER(player_vehicles.plate) LIKE LOWER(?) "
    L6_2 = "OR LOWER(player_vehicles.citizenid) LIKE LOWER(?) "
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
            player_vehicles.plate AS plate,
            player_vehicles.vehicle AS vehicle,
            COALESCE(mdt_vehicles.status, 'Unknown') AS status,
            player_vehicles.citizenid AS citizenid
        FROM 
            player_vehicles
        LEFT JOIN 
            mdt_vehicles 
        ON 
            mdt_vehicles.plate = player_vehicles.plate
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
    L17_2 = {}
    L18_2 = L13_2.plate
    L17_2.plate = L18_2
    L18_2 = L13_2.status
    L17_2.status = L18_2
    L18_2 = GetHashKey
    L19_2 = L13_2.vehicle
    L18_2 = L18_2(L19_2)
    L17_2.model = L18_2
    L17_2.owner = L16_2
    L18_2 = L13_2.citizenid
    L17_2.citizenid = L18_2
    L18_2 = table
    L18_2 = L18_2.insert
    L19_2 = L7_2
    L20_2 = L17_2
    L18_2(L19_2, L20_2)
  end
  return L7_2
end
fetchVehiclesFromPlayerTable = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = ""
  L2_2 = {}
  if "" ~= A0_2 then
    L3_2 = "WHERE LOWER(player_vehicles.plate) LIKE LOWER(?) "
    L4_2 = "OR LOWER(player_vehicles.citizenid) LIKE LOWER(?) "
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
  L3_2 = "SELECT COUNT(*) AS count FROM player_vehicles "
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
    L5_2 = "WHERE LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, \"$.firstname\"))) LIKE LOWER(?) "
    L6_2 = "OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, \"$.lastname\"))) LIKE LOWER(?) "
    L7_2 = "OR LOWER(players.citizenid) LIKE LOWER(?) "
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
            players.photo AS photo,
            JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS player_firstname,
            JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS player_lastname,
            JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.birthdate")) AS player_birthdate,
            JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.nationality")) AS player_nationality
        FROM 
            mdt_warrants AS warrants
        JOIN 
            players AS players 
        ON 
            warrants.suspectId = players.citizenid
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
    L3_2 = "WHERE LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, \"$.firstname\"))) LIKE LOWER(?) "
    L4_2 = "OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, \"$.lastname\"))) LIKE LOWER(?) "
    L5_2 = "OR LOWER(players.citizenid) LIKE LOWER(?) "
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
        JOIN players AS players
        ON warrants.suspectId = players.citizenid
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = {}
  L1_2.citizenid = A0_2
  L2_2 = [[
        SELECT 
            player_vehicles.plate AS plate,
            player_vehicles.vehicle AS vehicle,
            COALESCE(mdt_vehicles.status, 'Unknown') AS status,
            player_vehicles.citizenid AS citizenid
        FROM 
            player_vehicles
        LEFT JOIN 
            mdt_vehicles 
        ON 
            mdt_vehicles.plate = player_vehicles.plate
        WHERE
            player_vehicles.citizenid = @citizenid
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
    L13_2 = "Unknown"
    L14_2 = L10_2.sightings
    if L14_2 then
      L14_2 = L10_2.sightings
      L14_2 = #L14_2
      if L14_2 > 0 then
        L14_2 = L10_2.sightings
        L15_2 = L10_2.sightings
        L15_2 = #L15_2
        L14_2 = L14_2[L15_2]
        L13_2 = L14_2.timestamp
      end
    end
    L14_2 = {}
    L15_2 = L10_2.plate
    L14_2.plate = L15_2
    L15_2 = L10_2.status
    L14_2.status = L15_2
    L15_2 = GetHashKey
    L16_2 = L10_2.vehicle
    L15_2 = L15_2(L16_2)
    L14_2.model = L15_2
    L14_2.owner = L12_2
    L15_2 = L10_2.citizenid
    L14_2.citizenid = L15_2
    L14_2.lastseen = L13_2
    L15_2 = table
    L15_2 = L15_2.insert
    L16_2 = L4_2
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  return L4_2
end
fetchCitizenVehiclesFromTable = L0_1
