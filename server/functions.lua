local L0_1, L1_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
if "kartik-mdt" ~= L0_1 then
  return
end
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = GetNumResources
  L1_2 = L1_2()
  L2_2 = 0
  L3_2 = L1_2 - 1
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = GetResourceByFindIndex
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 == A0_2 then
      L7_2 = GetResourceState
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if "started" == L7_2 then
        L7_2 = true
        return L7_2
      end
    end
  end
  L2_2 = false
  return L2_2
end
detectCore = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = ipairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      if A0_2 == L12_2 then
        return L5_2
      end
    end
  end
end
getDepartmentCategory = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = "SELECT citizenid FROM mdt_units WHERE id = ?"
    L2_2 = {}
    L3_2 = A0_2
    L2_2[1] = L3_2
    queryParams = L2_2
    L2_2 = MySQL
    L2_2 = L2_2.query
    L2_2 = L2_2.await
    L3_2 = L1_2
    L4_2 = queryParams
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L3_2 = L2_2[1]
      if L3_2 then
        L3_2 = L2_2[1]
        L3_2 = L3_2.citizenid
        return L3_2
      end
    end
    L3_2 = false
    return L3_2
  end
end
getCitizenIdFromUnitId = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = GetPlayerData
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = L2_2.jobData
  L3_2 = L3_2.name
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = L2_2.jobData
  L4_2 = L4_2.grade
  L4_2 = L4_2.level
  L5_2 = GetSanitizedPermissions
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L6_2 = next
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      goto lbl_30
    end
  end
  L6_2 = false
  do return L6_2 end
  ::lbl_30::
  L6_2 = L5_2.Pages
  L6_2 = L6_2[A1_2]
  if not L6_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = L5_2.Pages
  L6_2 = L6_2[A1_2]
  L6_2 = L6_2.view
  if not L6_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = true
  return L6_2
end
isActionAllowed = L0_1
