local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "fetchOfficers"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:fetchOfficers"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "fetchOfficerDataByOfficerId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:fetchOfficerDataByOfficerId"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    else
      L3_2 = A1_2
      L4_2 = false
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "updateOfficerRank"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = hasManagePermission
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = lib
      L2_2 = L2_2.callback
      L2_2 = L2_2.await
      L3_2 = "kartik-mdt:server:updateOfficerRank"
      L4_2 = false
      L5_2 = A0_2
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      if L2_2 then
        L3_2 = A1_2
        L4_2 = L2_2
        L3_2(L4_2)
      end
    else
      L2_2 = A1_2
      L3_2 = {}
      L3_2.success = false
      L3_2.message = "You do not have permission to update officer ranks."
      L2_2(L3_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "addNewOfficers"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = hasManagePermission
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = lib
      L2_2 = L2_2.callback
      L2_2 = L2_2.await
      L3_2 = "kartik-mdt:server:addNewOfficers"
      L4_2 = false
      L5_2 = A0_2
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      if L2_2 then
        L3_2 = A1_2
        L4_2 = L2_2
        L3_2(L4_2)
      end
    else
      L2_2 = A1_2
      L3_2 = {}
      L3_2.success = false
      L3_2.message = "You do not have permission to add new officers."
      L2_2(L3_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "addOfficerAssignment"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:addOfficerAssignment"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "updateOfficertags"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:updateOfficertags"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "fireOfficer"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = hasManagePermission
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = lib
      L2_2 = L2_2.callback
      L2_2 = L2_2.await
      L3_2 = "kartik-mdt:server:fireOfficer"
      L4_2 = false
      L5_2 = A0_2
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      if L2_2 then
        L3_2 = A1_2
        L4_2 = L2_2
        L3_2(L4_2)
      end
    else
      L2_2 = A1_2
      L3_2 = {}
      L3_2.success = false
      L3_2.message = "You do not have permission to fire officers."
      L2_2(L3_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "getDepartments"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 then
    L2_2 = Jobs
    if L2_2 then
      L2_2 = getCurrentJob
      L2_2 = L2_2()
      L2_2 = L2_2.job
      L3_2 = {}
      L4_2 = getDepartmentCategory
      L5_2 = L2_2
      L4_2 = L4_2(L5_2)
      L2_2 = L4_2
      L4_2 = pairs
      L5_2 = Config
      L5_2 = L5_2.Jobs
      L5_2 = L5_2[L2_2]
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = table
        L10_2 = L10_2.insert
        L11_2 = L3_2
        L12_2 = Jobs
        L12_2 = L12_2[L9_2]
        L10_2(L11_2, L12_2)
      end
      L4_2 = A1_2
      L5_2 = L3_2
      L4_2(L5_2)
    else
      L2_2 = A1_2
      L3_2 = nil
      L2_2(L3_2)
    end
  else
    L2_2 = A1_2
    L3_2 = nil
    L2_2(L3_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "fetchTags"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  if A0_2 then
    L2_2 = Config
    L2_2 = L2_2.OfficerTags
    if L2_2 then
      L2_2 = A1_2
      L3_2 = Config
      L3_2 = L3_2.OfficerTags
      L2_2(L3_2)
    else
      L2_2 = A1_2
      L3_2 = {}
      L2_2(L3_2)
    end
  else
    L2_2 = A1_2
    L3_2 = {}
    L2_2(L3_2)
  end
end
L0_1(L1_1, L2_1)
