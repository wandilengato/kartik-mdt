local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "fetchIncidents"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:fetchIncidents"
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
L1_1 = "fetchIncidentDataByIncidentId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:fetchIncidentDataByIncidentId"
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
L1_1 = "addNewIncident"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:addNewIncident"
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
L1_1 = "saveIncident"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:saveIncident"
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
  else
    L2_2 = A1_2
    L3_2 = false
    L2_2(L3_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "deleteIncident"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = hasManagePermission
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = lib
      L2_2 = L2_2.callback
      L2_2 = L2_2.await
      L3_2 = "kartik-mdt:server:deleteIncident"
      L4_2 = false
      L5_2 = A0_2
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      if L2_2 then
        L3_2 = A1_2
        L4_2 = L2_2
        L3_2(L4_2)
      else
        L3_2 = A1_2
        L4_2 = {}
        L4_2.success = false
        L4_2.message = "Failed to delete incident."
        L3_2(L4_2)
      end
    else
      L2_2 = A1_2
      L3_2 = {}
      L3_2.success = false
      L3_2.message = "You do not have permission to delete incidents."
      L2_2(L3_2)
    end
  end
end
L0_1(L1_1, L2_1)
