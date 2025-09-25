local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizenEMSReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = [[
            SELECT * FROM mdt_ems_reports 
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
      L5_2.success = false
      L5_2.message = "No reports found for the given citizenId"
      return L5_2
    end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received"
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchCitizenEMSIncidentReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = [[
            SELECT * FROM mdt_ems_incidents
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
      L5_2.success = false
      L5_2.message = "No reports found for the given citizenId"
      return L5_2
    end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received"
    return L2_2
  end
end
L0_1(L1_1, L2_1)
