local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "fetchEMSReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:fetchEMSReports"
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
L1_1 = "fetchEMSReportDataByReportId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:fetchEMSReportDataByReportId"
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
L1_1 = "addNewEMSReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:addNewEMSReport"
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
L1_1 = "saveCurrentEMSReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:saveCurrentEMSReport"
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
L1_1 = "deleteEMSReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:deleteEMSReport"
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
L1_1 = "getRecentEMSReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:getRecentEMSReports"
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
