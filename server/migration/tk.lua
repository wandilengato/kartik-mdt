local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_weapons"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = json
    L8_2 = L8_2.decode
    L9_2 = L7_2.owners
    if not L9_2 then
      L9_2 = "[]"
    end
    L8_2 = L8_2(L9_2)
    L9_2 = ipairs
    L10_2 = L8_2
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = L14_2.identifier
      if not L15_2 then
        L15_2 = "unknown"
      end
      L16_2 = MySQL
      L16_2 = L16_2.query
      L16_2 = L16_2.await
      L17_2 = [[
                INSERT INTO mdt_weapons (citizenId, serialNumber, weaponName, registrationDate, image)
                VALUES (?, ?, ?, FROM_UNIXTIME(?), ?)
            ]]
      L18_2 = {}
      L19_2 = L15_2
      L20_2 = L7_2.serial
      if not L20_2 then
        L20_2 = "unknown"
      end
      L21_2 = L7_2.name
      if not L21_2 then
        L21_2 = "unknown"
      end
      L22_2 = L7_2.date
      if not L22_2 then
        L22_2 = os
        L22_2 = L22_2.time
        L22_2 = L22_2()
      end
      L23_2 = L7_2.image
      if not L23_2 then
        L23_2 = nil
      end
      L18_2[1] = L19_2
      L18_2[2] = L20_2
      L18_2[3] = L21_2
      L18_2[4] = L22_2
      L18_2[5] = L23_2
      L16_2(L17_2, L18_2)
      L1_2 = L1_2 + 1
    end
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d weapon ownership entries to mdt_weapons."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
end
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_vehicles"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.plate
    L9_2 = L7_2.image
    L10_2 = L7_2.photos
    L11_2 = nil
    if L9_2 and "" ~= L9_2 then
      L11_2 = L9_2
    elseif L10_2 and "" ~= L10_2 then
      L12_2 = pcall
      L13_2 = json
      L13_2 = L13_2.decode
      L14_2 = L10_2
      L12_2, L13_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L14_2 = type
        L15_2 = L13_2
        L14_2 = L14_2(L15_2)
        if "table" == L14_2 then
          L14_2 = #L13_2
          if L14_2 > 0 then
            L11_2 = L13_2[1]
          end
        end
      end
    end
    L12_2 = MySQL
    L12_2 = L12_2.query
    L12_2 = L12_2.await
    L13_2 = [[
            INSERT INTO mdt_vehicles (plate, status, sightings, photo)
            VALUES (?, 'clear', NULL, ?)
        ]]
    L14_2 = {}
    L15_2 = L8_2
    L16_2 = L11_2
    L14_2[1] = L15_2
    L14_2[2] = L16_2
    L12_2(L13_2, L14_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d vehicles to mdt_vehicles."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT * FROM tk_mdt_evidence WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = L1_2[1]
  return L2_2
end
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_reports"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = os
    L8_2 = L8_2.date
    L9_2 = "%Y-%m-%d %H:%M:%S"
    L10_2 = L7_2.date
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = json
    L9_2 = L9_2.decode
    L10_2 = L7_2.evidence
    if not L10_2 then
      L10_2 = "[]"
    end
    L9_2 = L9_2(L10_2)
    L10_2 = {}
    if L9_2 then
      L11_2 = ipairs
      L12_2 = L9_2
      L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
      for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
        L17_2 = L2_1
        L18_2 = L16_2
        L17_2 = L17_2(L18_2)
        if L17_2 then
          L18_2 = table
          L18_2 = L18_2.insert
          L19_2 = L10_2
          L20_2 = {}
          L21_2 = tostring
          L22_2 = L17_2.id
          L21_2 = L21_2(L22_2)
          L20_2.id = L21_2
          L21_2 = L17_2.image
          if L21_2 then
            L21_2 = L17_2.image
            if "" ~= L21_2 then
              L21_2 = "image"
              if L21_2 then
                goto lbl_55
              end
            end
          end
          L21_2 = "text"
          ::lbl_55::
          L20_2.type = L21_2
          L21_2 = L17_2.notes
          if not L21_2 then
            L21_2 = "Imported evidence"
          end
          L20_2.description = L21_2
          L21_2 = L17_2.image
          if not L21_2 then
            L21_2 = ""
          end
          L20_2.url = L21_2
          L18_2(L19_2, L20_2)
        end
      end
    end
    L11_2 = json
    L11_2 = L11_2.decode
    L12_2 = L7_2.photos
    if not L12_2 then
      L12_2 = "[]"
    end
    L11_2 = L11_2(L12_2)
    if L11_2 then
      L12_2 = ipairs
      L13_2 = L11_2
      L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
      for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
        if L17_2 and "" ~= L17_2 then
          L18_2 = table
          L18_2 = L18_2.insert
          L19_2 = L10_2
          L20_2 = {}
          L21_2 = "photo_"
          L22_2 = L16_2
          L21_2 = L21_2 .. L22_2
          L20_2.id = L21_2
          L20_2.type = "image"
          L20_2.description = "Imported photo"
          L20_2.url = L17_2
          L18_2(L19_2, L20_2)
        end
      end
    end
    L12_2 = {}
    function L13_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
      L2_3 = json
      L2_3 = L2_3.decode
      L3_3 = A1_3 or L3_3
      if not A1_3 then
        L3_3 = "[]"
      end
      L2_3 = L2_3(L3_3)
      L3_3 = ipairs
      L4_3 = L2_3
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L9_3 = table
        L9_3 = L9_3.insert
        L10_3 = L12_2
        L11_3 = {}
        L12_3 = L8_3.name
        L11_3.name = L12_3
        L12_3 = L8_3.identifier
        L11_3.citizenId = L12_3
        L11_3.category = A0_3
        L12_3 = {}
        L11_3.charges = L12_3
        L9_3(L10_3, L11_3)
      end
    end
    L14_2 = L13_2
    L15_2 = "Officer"
    L16_2 = L7_2.officers
    L14_2(L15_2, L16_2)
    L14_2 = L13_2
    L15_2 = "Criminal"
    L16_2 = L7_2.suspects
    L14_2(L15_2, L16_2)
    L14_2 = L13_2
    L15_2 = "Civilian"
    L16_2 = L7_2.civilians
    L14_2(L15_2, L16_2)
    L14_2 = json
    L14_2 = L14_2.decode
    L15_2 = L7_2.vehicles
    if not L15_2 then
      L15_2 = "[]"
    end
    L14_2 = L14_2(L15_2)
    L15_2 = {}
    if L14_2 then
      L16_2 = ipairs
      L17_2 = L14_2
      L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
      for L20_2, L21_2 in L16_2, L17_2, L18_2, L19_2 do
        L22_2 = table
        L22_2 = L22_2.insert
        L23_2 = L15_2
        L24_2 = {}
        L25_2 = L21_2.plate
        L24_2.plate = L25_2
        L25_2 = L21_2.name
        L24_2.model = L25_2
        L22_2(L23_2, L24_2)
      end
    end
    L16_2 = MySQL
    L16_2 = L16_2.query
    L16_2 = L16_2.await
    L17_2 = [[
            INSERT INTO mdt_police_reports 
            (name, officerId, category, location, evidence_locker, description, dateTime, evidences, peopleInvolved, vehiclesInvolved)
            VALUES (?, ?, ?, '', NULL, ?, ?, ?, ?, ?)
        ]]
    L18_2 = {}
    L19_2 = L7_2.title
    L20_2 = L7_2.creator
    L21_2 = "General"
    L22_2 = L7_2.content
    if not L22_2 then
      L22_2 = ""
    end
    L23_2 = L8_2
    L24_2 = json
    L24_2 = L24_2.encode
    L25_2 = L10_2
    L24_2 = L24_2(L25_2)
    L25_2 = json
    L25_2 = L25_2.encode
    L26_2 = L12_2
    L25_2 = L25_2(L26_2)
    L26_2 = json
    L26_2 = L26_2.encode
    L27_2 = L15_2
    L26_2, L27_2 = L26_2(L27_2)
    L18_2[1] = L19_2
    L18_2[2] = L20_2
    L18_2[3] = L21_2
    L18_2[4] = L22_2
    L18_2[5] = L23_2
    L18_2[6] = L24_2
    L18_2[7] = L25_2
    L18_2[8] = L26_2
    L18_2[9] = L27_2
    L16_2 = L16_2(L17_2, L18_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d police reports to mdt_police_reports."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
end
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_profiles"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.image
    if not L8_2 or "" == L8_2 then
      L9_2 = L7_2.photos
      if L9_2 then
        L9_2 = json
        L9_2 = L9_2.decode
        L10_2 = L7_2.photos
        if not L10_2 then
          L10_2 = "[]"
        end
        L9_2 = L9_2(L10_2)
        L10_2 = type
        L11_2 = L9_2
        L10_2 = L10_2(L11_2)
        if "table" == L10_2 then
          L10_2 = #L9_2
          if L10_2 > 0 then
            L8_2 = L9_2[1]
          end
        end
      end
    end
    if L8_2 and "" ~= L8_2 then
      L9_2 = MySQL
      L9_2 = L9_2.query
      L9_2 = L9_2.await
      L10_2 = "UPDATE players SET photo = ? WHERE citizenid = ?"
      L11_2 = {}
      L12_2 = L8_2
      L13_2 = L7_2.identifier
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L9_2(L10_2, L11_2)
    end
    L9_2 = MySQL
    L9_2 = L9_2.query
    L9_2 = L9_2.await
    L10_2 = [[
            INSERT INTO mdt_profiles (citizenid, warrant, isDangerous, fingerprint, dna, notes)
            VALUES (?, 0, 0, NULL, NULL, ?)
        ]]
    L11_2 = {}
    L12_2 = L7_2.identifier
    L13_2 = L7_2.notes
    if not L13_2 then
      L13_2 = ""
    end
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L9_2(L10_2, L11_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d profiles: photo to `players`, profile to `mdt_profiles`."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_paramedics"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.identifier
    L9_2 = L7_2.callsign
    L10_2 = "off-duty"
    L11_2 = MySQL
    L11_2 = L11_2.query
    L11_2 = L11_2.await
    L12_2 = [[
            INSERT INTO mdt_units (id, callsign, citizenid, department, status, dutyStatus)
            VALUES (?, ?, ?, ?, ?, ?)
            ON DUPLICATE KEY UPDATE
                callsign = VALUES(callsign),
                department = VALUES(department),
                status = VALUES(status),
                dutyStatus = VALUES(dutyStatus)
        ]]
    L13_2 = {}
    L14_2 = L8_2
    L15_2 = L9_2
    L16_2 = L8_2
    L17_2 = "ems"
    L18_2 = L10_2
    L19_2 = "avl"
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L13_2[3] = L16_2
    L13_2[4] = L17_2
    L13_2[5] = L18_2
    L13_2[6] = L19_2
    L11_2(L12_2, L13_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d EMS units to mdt_units."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
end
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_officers"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.identifier
    L9_2 = L7_2.callsign
    L10_2 = "off-duty"
    L11_2 = MySQL
    L11_2 = L11_2.query
    L11_2 = L11_2.await
    L12_2 = [[
            INSERT INTO mdt_units (id, callsign, citizenid, department, status, dutyStatus)
            VALUES (?, ?, ?, ?, ?, ?)
            ON DUPLICATE KEY UPDATE
                callsign = callsign,
                department = VALUES(department),
                status = VALUES(status),
                dutyStatus = VALUES(dutyStatus)
        ]]
    L13_2 = {}
    L14_2 = L8_2
    L15_2 = L9_2
    L16_2 = L8_2
    L17_2 = "police"
    L18_2 = L10_2
    L19_2 = "avl"
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L13_2[3] = L16_2
    L13_2[4] = L17_2
    L13_2[5] = L18_2
    L13_2[6] = L19_2
    L11_2(L12_2, L13_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d Law Enforcement Officers to mdt_units."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
end
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_incidents"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = os
    L8_2 = L8_2.date
    L9_2 = "%Y-%m-%d %H:%M:%S"
    L10_2 = L7_2.date
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = json
    L9_2 = L9_2.decode
    L10_2 = L7_2.evidence
    if not L10_2 then
      L10_2 = "[]"
    end
    L9_2 = L9_2(L10_2)
    L10_2 = {}
    if L9_2 then
      L11_2 = ipairs
      L12_2 = L9_2
      L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
      for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
        L17_2 = L2_1
        L18_2 = L16_2
        L17_2 = L17_2(L18_2)
        if L17_2 then
          L18_2 = table
          L18_2 = L18_2.insert
          L19_2 = L10_2
          L20_2 = {}
          L21_2 = tostring
          L22_2 = L17_2.id
          L21_2 = L21_2(L22_2)
          L20_2.id = L21_2
          L21_2 = L17_2.image
          if L21_2 then
            L21_2 = L17_2.image
            if "" ~= L21_2 then
              L21_2 = "image"
              if L21_2 then
                goto lbl_55
              end
            end
          end
          L21_2 = "text"
          ::lbl_55::
          L20_2.type = L21_2
          L21_2 = L17_2.notes
          if not L21_2 then
            L21_2 = "Imported evidence"
          end
          L20_2.description = L21_2
          L21_2 = L17_2.image
          if not L21_2 then
            L21_2 = ""
          end
          L20_2.url = L21_2
          L18_2(L19_2, L20_2)
        end
      end
    end
    L11_2 = json
    L11_2 = L11_2.decode
    L12_2 = L7_2.photos
    if not L12_2 then
      L12_2 = "[]"
    end
    L11_2 = L11_2(L12_2)
    if L11_2 then
      L12_2 = ipairs
      L13_2 = L11_2
      L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
      for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
        if L17_2 and "" ~= L17_2 then
          L18_2 = table
          L18_2 = L18_2.insert
          L19_2 = L10_2
          L20_2 = {}
          L21_2 = "photo_"
          L22_2 = L16_2
          L21_2 = L21_2 .. L22_2
          L20_2.id = L21_2
          L20_2.type = "image"
          L20_2.description = "Imported photo"
          L20_2.url = L17_2
          L18_2(L19_2, L20_2)
        end
      end
    end
    L12_2 = {}
    function L13_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
      L2_3 = json
      L2_3 = L2_3.decode
      L3_3 = A1_3 or L3_3
      if not A1_3 then
        L3_3 = "[]"
      end
      L2_3 = L2_3(L3_3)
      L3_3 = ipairs
      L4_3 = L2_3
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L9_3 = table
        L9_3 = L9_3.insert
        L10_3 = L12_2
        L11_3 = {}
        L12_3 = L8_3.name
        L11_3.name = L12_3
        L12_3 = L8_3.identifier
        L11_3.citizenId = L12_3
        L11_3.category = A0_3
        L12_3 = {}
        L11_3.charges = L12_3
        L9_3(L10_3, L11_3)
      end
    end
    L14_2 = L13_2
    L15_2 = "Officer"
    L16_2 = L7_2.officers
    L14_2(L15_2, L16_2)
    L14_2 = L13_2
    L15_2 = "Criminal"
    L16_2 = L7_2.criminals
    L14_2(L15_2, L16_2)
    L14_2 = L13_2
    L15_2 = "Civilian"
    L16_2 = L7_2.civilians
    L14_2(L15_2, L16_2)
    L14_2 = json
    L14_2 = L14_2.decode
    L15_2 = L7_2.vehicles
    if not L15_2 then
      L15_2 = "[]"
    end
    L14_2 = L14_2(L15_2)
    L15_2 = {}
    if L14_2 then
      L16_2 = ipairs
      L17_2 = L14_2
      L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
      for L20_2, L21_2 in L16_2, L17_2, L18_2, L19_2 do
        L22_2 = table
        L22_2 = L22_2.insert
        L23_2 = L15_2
        L24_2 = {}
        L25_2 = L21_2.plate
        if not L25_2 then
          L25_2 = ""
        end
        L24_2.plate = L25_2
        L25_2 = L21_2.model
        if not L25_2 then
          L25_2 = L21_2.name
          if not L25_2 then
            L25_2 = "Unknown"
          end
        end
        L24_2.model = L25_2
        L22_2(L23_2, L24_2)
      end
    end
    L16_2 = MySQL
    L16_2 = L16_2.query
    L16_2 = L16_2.await
    L17_2 = [[
            INSERT INTO mdt_police_incidents
            (title, location, officerId, description, dateTime, status, priority, evidences, peopleInvolved, vehiclesInvolved, timeline, evidence_locker)
            VALUES (?, '', NULL, ?, ?, '', '', ?, ?, ?, '[]', NULL)
        ]]
    L18_2 = {}
    L19_2 = L7_2.title
    if not L19_2 then
      L19_2 = ""
    end
    L20_2 = L7_2.content
    if not L20_2 then
      L20_2 = ""
    end
    L21_2 = L8_2
    L22_2 = json
    L22_2 = L22_2.encode
    L23_2 = L10_2
    L22_2 = L22_2(L23_2)
    L23_2 = json
    L23_2 = L23_2.encode
    L24_2 = L12_2
    L23_2 = L23_2(L24_2)
    L24_2 = json
    L24_2 = L24_2.encode
    L25_2 = L15_2
    L24_2, L25_2 = L24_2(L25_2)
    L18_2[1] = L19_2
    L18_2[2] = L20_2
    L18_2[3] = L21_2
    L18_2[4] = L22_2
    L18_2[5] = L23_2
    L18_2[6] = L24_2
    L18_2[7] = L25_2
    L16_2 = L16_2(L17_2, L18_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d police incidents to mdt_police_incidents."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
end
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_ems_reports"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = os
    L8_2 = L8_2.date
    L9_2 = "%Y-%m-%d %H:%M:%S"
    L10_2 = L7_2.date
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = json
    L9_2 = L9_2.decode
    L10_2 = L7_2.photos
    if not L10_2 then
      L10_2 = "[]"
    end
    L9_2 = L9_2(L10_2)
    L10_2 = {}
    if L9_2 then
      L11_2 = ipairs
      L12_2 = L9_2
      L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
      for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
        if L16_2 and "" ~= L16_2 then
          L17_2 = table
          L17_2 = L17_2.insert
          L18_2 = L10_2
          L19_2 = {}
          L20_2 = "photo_"
          L21_2 = L15_2
          L20_2 = L20_2 .. L21_2
          L19_2.id = L20_2
          L19_2.type = "image"
          L19_2.description = "Imported photo"
          L19_2.url = L16_2
          L17_2(L18_2, L19_2)
        end
      end
    end
    L11_2 = {}
    function L12_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
      L2_3 = json
      L2_3 = L2_3.decode
      L3_3 = A1_3 or L3_3
      if not A1_3 then
        L3_3 = "[]"
      end
      L2_3 = L2_3(L3_3)
      L3_3 = ipairs
      L4_3 = L2_3
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L9_3 = table
        L9_3 = L9_3.insert
        L10_3 = L11_2
        L11_3 = {}
        L12_3 = L8_3.name
        L11_3.name = L12_3
        L12_3 = L8_3.identifier
        L11_3.citizenId = L12_3
        L11_3.category = A0_3
        L12_3 = {}
        L11_3.charges = L12_3
        L9_3(L10_3, L11_3)
      end
    end
    L13_2 = L12_2
    L14_2 = "Medic"
    L15_2 = L7_2.paramedics
    L13_2(L14_2, L15_2)
    L13_2 = L12_2
    L14_2 = "Civilian"
    L15_2 = L7_2.patients
    L13_2(L14_2, L15_2)
    L13_2 = {}
    L14_2 = MySQL
    L14_2 = L14_2.query
    L14_2 = L14_2.await
    L15_2 = [[
            INSERT INTO mdt_ems_reports
            (name, medicId, location, description, dateTime, evidences, peopleInvolved, vehiclesInvolved, category)
            VALUES (?, ?, '', ?, ?, ?, ?, ?, ?)
        ]]
    L16_2 = {}
    L17_2 = L7_2.title
    if not L17_2 then
      L17_2 = ""
    end
    L18_2 = L7_2.creator
    if not L18_2 then
      L18_2 = ""
    end
    L19_2 = L7_2.content
    if not L19_2 then
      L19_2 = ""
    end
    L20_2 = L8_2
    L21_2 = json
    L21_2 = L21_2.encode
    L22_2 = L10_2
    L21_2 = L21_2(L22_2)
    L22_2 = json
    L22_2 = L22_2.encode
    L23_2 = L11_2
    L22_2 = L22_2(L23_2)
    L23_2 = json
    L23_2 = L23_2.encode
    L24_2 = L13_2
    L23_2 = L23_2(L24_2)
    L24_2 = "General"
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L16_2[4] = L20_2
    L16_2[5] = L21_2
    L16_2[6] = L22_2
    L16_2[7] = L23_2
    L16_2[8] = L24_2
    L14_2 = L14_2(L15_2, L16_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d EMS reports to mdt_ems_reports."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
end
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_ems_announcements"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.message
    if L8_2 then
      L8_2 = L7_2.message
      L9_2 = L8_2
      L8_2 = L8_2.match
      L10_2 = "^(.-)<br>"
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 then
        goto lbl_21
      end
    end
    L8_2 = "EMS Announcement"
    ::lbl_21::
    L9_2 = L7_2.message
    if L9_2 then
      L9_2 = L7_2.message
      L10_2 = L9_2
      L9_2 = L9_2.gsub
      L11_2 = "^(.-)<br>"
      L12_2 = ""
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      if L9_2 then
        goto lbl_32
      end
    end
    L9_2 = ""
    ::lbl_32::
    L10_2 = os
    L10_2 = L10_2.date
    L11_2 = "%Y-%m-%d %H:%M:%S"
    L12_2 = L7_2.date
    if not L12_2 then
      L12_2 = os
      L12_2 = L12_2.time
      L12_2 = L12_2()
    end
    L10_2 = L10_2(L11_2, L12_2)
    L11_2 = MySQL
    L11_2 = L11_2.query
    L11_2 = L11_2.await
    L12_2 = [[
            INSERT INTO mdt_ems_bulletin (announcementId, title, description, dateTime)
            VALUES (?, ?, ?, ?)
        ]]
    L13_2 = {}
    L14_2 = tostring
    L15_2 = L7_2.id
    L14_2 = L14_2(L15_2)
    L15_2 = L8_2
    L16_2 = L9_2
    L17_2 = L10_2
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L13_2[3] = L16_2
    L13_2[4] = L17_2
    L11_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L1_2 = L1_2 + 1
    end
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d EMS announcements to mdt_ems_bulletin."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
end
function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_announcements"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.message
    if L8_2 then
      L8_2 = L7_2.message
      L9_2 = L8_2
      L8_2 = L8_2.match
      L10_2 = "^(.-)<br>"
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 then
        goto lbl_21
      end
    end
    L8_2 = "Announcement"
    ::lbl_21::
    L9_2 = L7_2.message
    if L9_2 then
      L9_2 = L7_2.message
      L10_2 = L9_2
      L9_2 = L9_2.gsub
      L11_2 = "^(.-)<br>"
      L12_2 = ""
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      if L9_2 then
        goto lbl_32
      end
    end
    L9_2 = ""
    ::lbl_32::
    L10_2 = os
    L10_2 = L10_2.date
    L11_2 = "%Y-%m-%d %H:%M:%S"
    L12_2 = L7_2.date
    if not L12_2 then
      L12_2 = os
      L12_2 = L12_2.time
      L12_2 = L12_2()
    end
    L10_2 = L10_2(L11_2, L12_2)
    L11_2 = MySQL
    L11_2 = L11_2.query
    L11_2 = L11_2.await
    L12_2 = [[
            INSERT INTO mdt_police_bulletin (announcementId, title, description, dateTime)
            VALUES (?, ?, ?, ?)
        ]]
    L13_2 = {}
    L14_2 = tostring
    L15_2 = L7_2.id
    L14_2 = L14_2(L15_2)
    L15_2 = L8_2
    L16_2 = L9_2
    L17_2 = L10_2
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L13_2[3] = L16_2
    L13_2[4] = L17_2
    L11_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L1_2 = L1_2 + 1
    end
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d announcements to mdt_police_bulletin."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
end
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM tk_mdt_charges"
  L0_2 = L0_2(L1_2)
  L1_2 = 0
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = json
    L8_2 = L8_2.decode
    L9_2 = L7_2.fine
    if not L9_2 then
      L9_2 = "{}"
    end
    L8_2 = L8_2(L9_2)
    L9_2 = json
    L9_2 = L9_2.decode
    L10_2 = L7_2.sentence
    if not L10_2 then
      L10_2 = "{}"
    end
    L9_2 = L9_2(L10_2)
    L10_2 = tonumber
    L11_2 = L8_2.default
    if not L11_2 then
      L11_2 = 0
    end
    L10_2 = L10_2(L11_2)
    L11_2 = tonumber
    L12_2 = L9_2.default
    if not L12_2 then
      L12_2 = 0
    end
    L11_2 = L11_2(L12_2)
    L12_2 = MySQL
    L12_2 = L12_2.query
    L12_2 = L12_2.await
    L13_2 = [[
            INSERT INTO mdt_criminal_codes (id, title, description, category, fine, sentence)
            VALUES (?, ?, ?, ?, ?, ?)
        ]]
    L14_2 = {}
    L15_2 = tostring
    L16_2 = L7_2.id
    L15_2 = L15_2(L16_2)
    L16_2 = L7_2.name
    L17_2 = L7_2.description
    if not L17_2 then
      L17_2 = ""
    end
    L18_2 = L7_2.class
    if not L18_2 then
      L18_2 = "Uncategorized"
    end
    L19_2 = L10_2
    L20_2 = L11_2
    L14_2[1] = L15_2
    L14_2[2] = L16_2
    L14_2[3] = L17_2
    L14_2[4] = L18_2
    L14_2[5] = L19_2
    L14_2[6] = L20_2
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      L1_2 = L1_2 + 1
    end
  end
  L2_2 = print
  L3_2 = "\226\156\133 Migrated %d charges to mdt_criminal_codes."
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
end
L12_1 = RegisterCommand
L13_1 = "migrate_tk"
function L14_1()
  local L0_2, L1_2
  L0_2 = print
  L1_2 = "Starting migration..."
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L9_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L10_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L0_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L1_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L3_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L4_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L7_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L8_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L5_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L6_1
  L0_2(L1_2)
  L0_2 = pcall
  L1_2 = L11_1
  L0_2(L1_2)
  L0_2 = print
  L1_2 = "Migration complete."
  L0_2(L1_2)
end
L15_1 = true
L12_1(L13_1, L14_1, L15_1)
