local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizens"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  if not A1_2 then
    return
  end
  L2_2 = A1_2.query
  if L2_2 then
    L2_2 = A1_2.query
    L3_2 = L2_2
    L2_2 = L2_2.lower
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_13
    end
  end
  L2_2 = ""
  ::lbl_13::
  L3_2 = math
  L3_2 = L3_2.max
  L4_2 = 1
  L5_2 = A1_2.page
  if not L5_2 then
    L5_2 = 1
  end
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L3_2 - 1
  L4_2 = L4_2 * 10
  L5_2 = 10
  L6_2 = {}
  L7_2 = fetchRealCitizens
  L8_2 = L2_2
  L9_2 = L4_2
  L10_2 = L5_2
  L7_2, L8_2 = L7_2(L8_2, L9_2, L10_2)
  realCount = L8_2
  realCitizens = L7_2
  L7_2 = realCitizens
  L6_2 = L7_2 or L6_2
  if not L7_2 then
    L7_2 = {}
    L6_2 = L7_2
  end
  L7_2 = realCount
  if L5_2 > L7_2 then
    L8_2 = L5_2 - L7_2
    L9_2 = ""
    L10_2 = {}
    L11_2 = {}
    if "" ~= L2_2 then
      L9_2 = [[
                WHERE 
                    LOWER(firstname) LIKE ? OR
                    LOWER(lastname) LIKE ? OR
                    LOWER(citizenid) LIKE ?
            ]]
      L12_2 = 1
      L13_2 = 3
      L14_2 = 1
      for L15_2 = L12_2, L13_2, L14_2 do
        L16_2 = table
        L16_2 = L16_2.insert
        L17_2 = L10_2
        L18_2 = "%"
        L19_2 = L2_2
        L20_2 = "%"
        L18_2 = L18_2 .. L19_2 .. L20_2
        L16_2(L17_2, L18_2)
        L16_2 = table
        L16_2 = L16_2.insert
        L17_2 = L11_2
        L18_2 = "%"
        L19_2 = L2_2
        L20_2 = "%"
        L18_2 = L18_2 .. L19_2 .. L20_2
        L16_2(L17_2, L18_2)
      end
    end
    L12_2 = "SELECT COUNT(citizenid) as count FROM mdt_fake_profiles "
    L13_2 = L9_2
    L12_2 = L12_2 .. L13_2
    L13_2 = MySQL
    L13_2 = L13_2.query
    L13_2 = L13_2.await
    L14_2 = L12_2
    L15_2 = L10_2
    L13_2 = L13_2(L14_2, L15_2)
    if L13_2 then
      L14_2 = L13_2[1]
      if L14_2 then
        L14_2 = L13_2[1]
        L14_2 = L14_2.count
        if L14_2 then
          goto lbl_94
        end
      end
    end
    L14_2 = 0
    ::lbl_94::
    L7_2 = L7_2 + L14_2
    L15_2 = L3_2 - 1
    L4_2 = L15_2 * L8_2
    L15_2 = table
    L15_2 = L15_2.insert
    L16_2 = L11_2
    L17_2 = L8_2
    L15_2(L16_2, L17_2)
    L15_2 = table
    L15_2 = L15_2.insert
    L16_2 = L11_2
    L17_2 = L4_2
    L15_2(L16_2, L17_2)
    L15_2 = "SELECT * FROM mdt_fake_profiles "
    L16_2 = L9_2
    L17_2 = " LIMIT ? OFFSET ?"
    L15_2 = L15_2 .. L16_2 .. L17_2
    L16_2 = MySQL
    L16_2 = L16_2.query
    L16_2 = L16_2.await
    L17_2 = L15_2
    L18_2 = L11_2
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = ipairs
    L18_2 = L16_2 or L18_2
    if not L16_2 then
      L18_2 = {}
    end
    L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2)
    for L21_2, L22_2 in L17_2, L18_2, L19_2, L20_2 do
      L23_2 = MySQL
      L23_2 = L23_2.query
      L23_2 = L23_2.await
      L24_2 = "SELECT warrant, fingerprint, dna, isDangerous FROM mdt_profiles WHERE citizenid = ?"
      L25_2 = {}
      L26_2 = L22_2.citizenid
      L25_2[1] = L26_2
      L23_2 = L23_2(L24_2, L25_2)
      if L23_2 then
        L24_2 = L23_2[1]
        if L24_2 then
          goto lbl_143
        end
      end
      L24_2 = {}
      ::lbl_143::
      L25_2 = fetchLicenses
      L26_2 = L22_2.citizenid
      L25_2 = L25_2(L26_2)
      L26_2 = table
      L26_2 = L26_2.insert
      L27_2 = L6_2
      L28_2 = {}
      L29_2 = L22_2.citizenid
      L28_2.citizenid = L29_2
      L29_2 = L22_2.firstname
      L28_2.firstname = L29_2
      L29_2 = L22_2.lastname
      L28_2.surname = L29_2
      L29_2 = L22_2.gender
      L28_2.gender = L29_2
      L29_2 = L22_2.nationality
      L28_2.nationality = L29_2
      L29_2 = L22_2.birthdate
      L28_2.birthdate = L29_2
      L29_2 = L22_2.photo
      L28_2.photo = L29_2
      L29_2 = L22_2.bankAccount
      L28_2.bankAccount = L29_2
      L29_2 = L22_2.phoneNumber
      L28_2.phoneNumber = L29_2
      L29_2 = L22_2.job
      L28_2.job = L29_2
      L29_2 = L24_2.warrant
      if not L29_2 then
        L29_2 = 0
      end
      L28_2.warrant = L29_2
      L29_2 = L24_2.isDangerous
      if not L29_2 then
        L29_2 = 0
      end
      L28_2.isDangerous = L29_2
      L29_2 = L25_2 or L29_2
      if not L25_2 then
        L29_2 = {}
      end
      L28_2.licenses = L29_2
      L29_2 = L24_2.fingerprint
      if not L29_2 then
        L29_2 = "Not Registered"
      end
      L28_2.fingerprint = L29_2
      L29_2 = L24_2.dna
      if not L29_2 then
        L29_2 = "Not Registered"
      end
      L28_2.dna = L29_2
      L26_2(L27_2, L28_2)
      L26_2 = #L6_2
      if L5_2 <= L26_2 then
        break
      end
    end
  end
  L8_2 = {}
  L8_2.citizens = L6_2
  L8_2.totalCount = L7_2
  return L8_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizenDataByCitizenId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = "SELECT * FROM mdt_profiles WHERE citizenid = ?"
    L4_2 = {}
    L5_2 = L2_2
    L4_2[1] = L5_2
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = next
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L6_2 = "INSERT INTO mdt_profiles SET citizenid = ?"
      L7_2 = {}
      L8_2 = L2_2
      L7_2[1] = L8_2
      L8_2 = MySQL
      L8_2 = L8_2.query
      L8_2 = L8_2.await
      L9_2 = L6_2
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
      L8_2 = {}
      L9_2 = {}
      L9_2.citizenid = L2_2
      L8_2[1] = L9_2
      L5_2 = L8_2
    end
    L6_2 = {}
    L6_2.success = true
    L7_2 = L5_2[1]
    L7_2 = L7_2.notes
    if not L7_2 then
      L7_2 = ""
    end
    L6_2.notes = L7_2
    return L6_2
  else
    L2_2 = {}
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizenReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = [[
            SELECT * FROM mdt_police_reports 
            WHERE JSON_CONTAINS(peopleInvolved, '{"citizenId": "]]
    L4_2 = L2_2
    L5_2 = [[
"}', '$')
        ]]
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = MySQL
    L4_2 = L4_2.query
    L4_2 = L4_2.await
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = #L4_2
      if L5_2 > 0 then
        L5_2 = {}
        L6_2 = ipairs
        L7_2 = L4_2
        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
        for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
          L12_2 = {}
          L13_2 = L11_2.reportId
          L12_2.reportId = L13_2
          L13_2 = L11_2.name
          if not L13_2 then
            L13_2 = "Unknown"
          end
          L12_2.reportName = L13_2
          L13_2 = L11_2.location
          L12_2.location = L13_2
          L13_2 = L11_2.citizenid
          if not L13_2 then
            L13_2 = L2_2
          end
          L12_2.citizenId = L13_2
          L13_2 = L11_2.dateTime
          L12_2.dateTime = L13_2
          L13_2 = L11_2.peopleInvolved
          L12_2.peopleInvolved = L13_2
          L13_2 = table
          L13_2 = L13_2.insert
          L14_2 = L5_2
          L15_2 = L12_2
          L13_2(L14_2, L15_2)
        end
        return L5_2
    end
    else
      L5_2 = {}
      return L5_2
    end
  else
    L2_2 = {}
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizenIncidentReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = [[
            SELECT * FROM mdt_police_incidents 
            WHERE JSON_CONTAINS(peopleInvolved, '{"citizenId": "]]
    L4_2 = L2_2
    L5_2 = [[
"}', '$')
        ]]
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = MySQL
    L4_2 = L4_2.query
    L4_2 = L4_2.await
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = #L4_2
      if L5_2 > 0 then
        L5_2 = {}
        L6_2 = ipairs
        L7_2 = L4_2
        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
        for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
          L12_2 = {}
          L13_2 = L11_2.incidentId
          L12_2.incidentId = L13_2
          L13_2 = L11_2.title
          if not L13_2 then
            L13_2 = "Unknown"
          end
          L12_2.incidentName = L13_2
          L13_2 = L11_2.location
          L12_2.location = L13_2
          L13_2 = L11_2.citizenid
          if not L13_2 then
            L13_2 = L2_2
          end
          L12_2.citizenId = L13_2
          L13_2 = L11_2.dateTime
          L12_2.dateTime = L13_2
          L13_2 = L11_2.peopleInvolved
          L12_2.peopleInvolved = L13_2
          L13_2 = table
          L13_2 = L13_2.insert
          L14_2 = L5_2
          L15_2 = L12_2
          L13_2(L14_2, L15_2)
        end
        return L5_2
    end
    else
      L5_2 = {}
      return L5_2
    end
  else
    L2_2 = {}
    return L2_2
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = fetchCitizenVehiclesFromTable
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  return L1_2
end
fetchCitizenVehicles = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = [[
        SELECT 
            serialNumber,
            weaponName,
            registrationDate
        FROM 
            mdt_weapons
        WHERE
            citizenId = @citizenId
    ]]
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = L1_2
  L4_2 = {}
  L4_2.citizenId = A0_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = {}
  L4_2 = ipairs
  L5_2 = L2_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = table
    L10_2 = L10_2.insert
    L11_2 = L3_2
    L12_2 = {}
    L13_2 = L9_2.serialNumber
    L12_2.serialNumber = L13_2
    L13_2 = L9_2.weaponName
    L12_2.weaponName = L13_2
    L13_2 = L9_2.registrationDate
    L12_2.registrationDate = L13_2
    L10_2(L11_2, L12_2)
  end
  return L3_2
end
fetchCitizenWeapons = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizenAssets"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = A1_2.citizenId
    L4_2 = fetchCitizenVehicles
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = fetchCitizenWeapons
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L6_2 = pcall
    L7_2 = fetchCitizenProperties
    L8_2 = L3_2
    L6_2, L7_2 = L6_2(L7_2, L8_2)
    if not L6_2 or not L7_2 then
      L8_2 = {}
      L7_2 = L8_2
    end
    L8_2 = {}
    L8_2.success = true
    L9_2 = L4_2 or L9_2
    if not L4_2 then
      L9_2 = {}
    end
    L8_2.vehicles = L9_2
    L9_2 = L5_2 or L9_2
    if not L5_2 then
      L9_2 = {}
    end
    L8_2.weapons = L9_2
    L9_2 = L7_2 or L9_2
    if not L7_2 then
      L9_2 = {}
    end
    L8_2.properties = L9_2
    return L8_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizenInsurances"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = A1_2.citizenId
    L4_2 = fetchHealthInsurance
    if L4_2 then
      L4_2 = fetchHealthInsurance
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        goto lbl_15
      end
    end
    L4_2 = {}
    ::lbl_15::
    L5_2 = fetchHomeInsurance
    if L5_2 then
      L5_2 = fetchHomeInsurance
      L6_2 = L3_2
      L5_2 = L5_2(L6_2)
      if L5_2 then
        goto lbl_25
      end
    end
    L5_2 = {}
    ::lbl_25::
    L6_2 = fetchVehicleInsurance
    if L6_2 then
      L6_2 = fetchVehicleInsurance
      L7_2 = L3_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        goto lbl_35
      end
    end
    L6_2 = {}
    ::lbl_35::
    L7_2 = fetchVehicleRegistration
    if L7_2 then
      L7_2 = fetchVehicleRegistration
      L8_2 = L3_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        goto lbl_45
      end
    end
    L7_2 = {}
    ::lbl_45::
    L8_2 = {}
    L9_2 = ipairs
    L10_2 = L4_2
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = table
      L15_2 = L15_2.insert
      L16_2 = L8_2
      L17_2 = L14_2
      L15_2(L16_2, L17_2)
    end
    L9_2 = ipairs
    L10_2 = L5_2
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = table
      L15_2 = L15_2.insert
      L16_2 = L8_2
      L17_2 = L14_2
      L15_2(L16_2, L17_2)
    end
    L9_2 = ipairs
    L10_2 = L6_2
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = table
      L15_2 = L15_2.insert
      L16_2 = L8_2
      L17_2 = L14_2
      L15_2(L16_2, L17_2)
    end
    L9_2 = ipairs
    L10_2 = L7_2
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = table
      L15_2 = L15_2.insert
      L16_2 = L8_2
      L17_2 = L14_2
      L15_2(L16_2, L17_2)
    end
    L9_2 = {}
    L9_2.success = true
    L9_2.insurances = L8_2
    return L9_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizenCitations"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = A1_2.citizenId
    L4_2 = pcall
    L5_2 = fetchCitizenCitations
    L6_2 = L3_2
    L4_2, L5_2 = L4_2(L5_2, L6_2)
    if not L4_2 or not L5_2 then
      L6_2 = {}
      L5_2 = L6_2
    end
    L6_2 = {}
    L6_2.success = true
    L6_2.citations = L5_2
    return L6_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizenWarrants"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = "SELECT * FROM mdt_warrants WHERE suspectId = ?"
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
        L7_2 = ipairs
        L8_2 = L5_2
        L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
        for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
          L13_2 = {}
          L14_2 = L12_2.id
          L13_2.id = L14_2
          L14_2 = citizenId
          L13_2.suspectId = L14_2
          L14_2 = L12_2.status
          L13_2.status = L14_2
          L14_2 = L12_2.issueDate
          if not L14_2 then
            L14_2 = "Unknown"
          end
          L13_2.issueDate = L14_2
          L14_2 = L12_2.expiryDate
          if not L14_2 then
            L14_2 = "Unknown"
          end
          L13_2.expiryDate = L14_2
          L14_2 = L12_2.charges
          if not L14_2 then
            L14_2 = "[]"
          end
          L13_2.charges = L14_2
          L14_2 = L12_2.issuingAuthority
          if not L14_2 then
            L14_2 = ""
          end
          L13_2.issuingAuthority = L14_2
          L14_2 = table
          L14_2 = L14_2.insert
          L15_2 = L6_2
          L16_2 = L13_2
          L14_2(L15_2, L16_2)
        end
        return L6_2
    end
    else
      L6_2 = {}
      return L6_2
    end
  else
    L2_2 = {}
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:addCitizenNote"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A1_2 then
    L2_2 = A1_2.citizenid
    L3_2 = A1_2.notesData
    L4_2 = "UPDATE mdt_profiles SET notes = ? WHERE citizenid = ?"
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
    L7_2 = true
    return L7_2
  else
    L2_2 = false
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:deleteNote"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = json
    L3_2 = L3_2.encode
    L4_2 = A1_2.updatedNotes
    L3_2 = L3_2(L4_2)
    L4_2 = "UPDATE mdt_profiles SET notes = ? WHERE citizenid = ?"
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
    L7_2 = {}
    L7_2.success = true
    return L7_2
  else
    L2_2 = {}
    L2_2.success = false
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:updateCitizenPhoto"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    if L2_2 then
      L2_2 = A1_2.photo
      if L2_2 then
        goto lbl_14
      end
    end
  end
  L2_2 = {}
  L2_2.success = false
  L2_2.message = "Invalid or missing data."
  do return L2_2 end
  ::lbl_14::
  L2_2 = updateCitizenPhoto
  if L2_2 then
    L2_2 = updateCitizenPhoto
    L3_2 = A1_2.citizenId
    L4_2 = A1_2.photo
    L2_2 = L2_2(L3_2, L4_2)
  end
  if L2_2 then
    L3_2 = {}
    L3_2.success = true
    L3_2.message = "Photo changed successfully."
    return L3_2
  end
  L3_2 = "UPDATE mdt_fake_profiles SET photo = ? WHERE citizenid = ?"
  L4_2 = {}
  L5_2 = A1_2.photo
  L6_2 = A1_2.citizenId
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L6_2 = L5_2.affectedRows
    if L6_2 > 0 then
      L6_2 = {}
      L6_2.success = true
      L6_2.message = "Photo changed successfully."
      return L6_2
    end
  end
  L6_2 = {}
  L6_2.success = false
  L6_2.message = "Citizen ID not found"
  return L6_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:updateCitizenDangerStatus"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = A1_2.isDangerous
    L4_2 = "UPDATE mdt_profiles SET isDangerous = ? WHERE citizenid = ?"
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
    L7_2 = {}
    L7_2.success = true
    return L7_2
  else
    L2_2 = {}
    L2_2.success = false
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:updateCitizenBiometric"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = A1_2.type
    L4_2 = A1_2.value
    L5_2 = L3_2
    L6_2 = "UPDATE mdt_profiles SET "
    L7_2 = L5_2
    L8_2 = " = ? WHERE citizenid = ?"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L7_2 = {}
    L8_2 = L4_2
    L9_2 = L2_2
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = MySQL
    L8_2 = L8_2.query
    L8_2 = L8_2.await
    L9_2 = L6_2
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = {}
    L9_2.success = true
    return L9_2
  else
    L2_2 = {}
    L2_2.success = false
    return L2_2
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = A0_2.citizenid
  if L1_2 then
    L1_2 = A0_2.firstname
    if L1_2 then
      L1_2 = A0_2.lastname
      if L1_2 then
        goto lbl_13
      end
    end
  end
  L1_2 = false
  L2_2 = "Missing required fields"
  do return L1_2, L2_2 end
  ::lbl_13::
  L1_2 = checkCitizenIdInPlayers
  if L1_2 then
    L1_2 = checkCitizenIdInPlayers
    L2_2 = A0_2.citizenid
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = false
      L2_2 = "Citizen ID already exists in players table"
      return L1_2, L2_2
    end
  end
  L1_2 = [[
        INSERT INTO mdt_fake_profiles 
        (citizenid, firstname, lastname, gender, nationality, birthdate, photo, bankAccount, phoneNumber, job)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE
        firstname = VALUES(firstname),
        lastname = VALUES(lastname),
        gender = VALUES(gender),
        nationality = VALUES(nationality),
        birthdate = VALUES(birthdate),
        photo = VALUES(photo),
        bankAccount = VALUES(bankAccount),
        phoneNumber = VALUES(phoneNumber),
        job = VALUES(job)
    ]]
  L2_2 = {}
  L3_2 = A0_2.citizenid
  L4_2 = A0_2.firstname
  L5_2 = A0_2.lastname
  L6_2 = A0_2.gender
  if not L6_2 then
    L6_2 = "Unknown"
  end
  L7_2 = A0_2.nationality
  if not L7_2 then
    L7_2 = "Unknown"
  end
  L8_2 = A0_2.birthdate
  if not L8_2 then
    L8_2 = "Unknown"
  end
  L9_2 = A0_2.photo
  if not L9_2 then
    L9_2 = nil
  end
  L10_2 = A0_2.bankAccount
  if not L10_2 then
    L10_2 = nil
  end
  L11_2 = A0_2.phoneNumber
  if not L11_2 then
    L11_2 = nil
  end
  L12_2 = A0_2.job
  if not L12_2 then
    L12_2 = "Unknown"
  end
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = true
  L5_2 = "Profile added successfully"
  return L4_2, L5_2
end
AddFakeProfile = L0_1
L0_1 = exports
L1_1 = "AddFakeProfile"
L2_1 = AddFakeProfile
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if not A0_2 then
    L1_2 = false
    L2_2 = "Missing citizenid"
    return L1_2, L2_2
  end
  L1_2 = "DELETE FROM mdt_fake_profiles WHERE citizenid = ?"
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = L1_2
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = true
  L4_2 = "Profile removed successfully"
  return L3_2, L4_2
end
RemoveFakeProfile = L0_1
L0_1 = exports
L1_1 = "RemoveFakeProfile"
L2_1 = RemoveFakeProfile
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:updateCitizenName"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = {}
  L2_2.success = false
  if A1_2 then
    L3_2 = A1_2.citizenId
    L4_2 = A1_2.firstname
    L5_2 = A1_2.surname
    L6_2 = SetPlayerName
    L7_2 = L3_2
    L8_2 = L4_2
    L9_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if L6_2 then
      L2_2.success = true
    end
    return L2_2
  else
    return L2_2
  end
end
L0_1(L1_1, L2_1)
