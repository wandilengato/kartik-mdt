local L0_1, L1_1, L2_1
function L0_1()
  local L0_2, L1_2, L2_2
  L0_2 = uiOpen
  if L0_2 then
    return
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "openCivMDT"
  L1_2.data = true
  L0_2(L1_2)
  uiOpen = true
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = SetNuiFocusKeepInput
  L1_2 = false
  L0_2(L1_2)
end
openCivilianMDT = L0_1
function L0_1()
  local L0_2, L1_2, L2_2
  L0_2 = uiOpen
  if not L0_2 then
    return
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "openCivMDT"
  L1_2.data = false
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
end
closeCivilianMDT = L0_1
L0_1 = RegisterNUICallback
L1_1 = "closeCivMDT"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = closeCivilianMDT
  L2_2()
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
