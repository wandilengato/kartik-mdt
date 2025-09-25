local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "saveImage"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:saveImage"
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
L1_1 = "getExportDepartments"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:getWebhook"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = Config
      L3_2 = L3_2.Exports
      L4_2 = A1_2
      L5_2 = {}
      L5_2.exportData = L3_2
      L6_2 = L2_2.webhook
      L5_2.webhook = L6_2
      L4_2(L5_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "getServerWebhook"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:getWebhook"
    L4_2 = false
    L5_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 then
      L3_2 = A1_2
      L4_2 = {}
      L4_2.success = true
      L5_2 = L2_2.webhook
      L4_2.webhook = L5_2
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "downloadDutyRecords"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:downloadDutyRecords"
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
L1_1 = "receivePDF"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "kartik-mdt:server:receivePDF"
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
