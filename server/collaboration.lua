local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
if "kartik-mdt" ~= L0_1 then
  return
end
L0_1 = Config
L0_1 = L0_1.CollaborationEditing
if L0_1 then
  L0_1 = Config
  L0_1 = L0_1.CollaborationEditing
  if not L0_1 then
    goto lbl_20
  end
  L0_1 = Config
  L0_1 = L0_1.useWebsockets
  if not L0_1 then
    goto lbl_20
  end
end
do return end
::lbl_20::
L0_1 = {}
L1_1 = {}
L2_1 = {}
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = L0_1
  L4_2 = L0_1
  L4_2 = L4_2[A0_2]
  if not L4_2 then
    L4_2 = {}
  end
  L3_2[A0_2] = L4_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L4_2 = L0_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  if not L4_2 then
    L4_2 = {}
  end
  L3_2[A1_2] = L4_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A1_2]
  L4_2 = L0_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L4_2 = {}
  end
  L3_2[A2_2] = L4_2
  L3_2 = L1_1
  L4_2 = L1_1
  L4_2 = L4_2[A0_2]
  if not L4_2 then
    L4_2 = {}
  end
  L3_2[A0_2] = L4_2
  L3_2 = L1_1
  L3_2 = L3_2[A0_2]
  L4_2 = L1_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  if not L4_2 then
    L4_2 = {}
  end
  L3_2[A1_2] = L4_2
  L3_2 = L1_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A1_2]
  L4_2 = L1_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L4_2 = {}
  end
  L3_2[A2_2] = L4_2
  L3_2 = L2_1
  L4_2 = L2_1
  L4_2 = L4_2[A0_2]
  if not L4_2 then
    L4_2 = {}
  end
  L3_2[A0_2] = L4_2
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  L4_2 = L2_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  if not L4_2 then
    L4_2 = {}
  end
  L3_2[A1_2] = L4_2
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A1_2]
  L4_2 = L2_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L4_2 = os
    L4_2 = L4_2.time
    L4_2 = L4_2()
  end
  L3_2[A2_2] = L4_2
end
L4_1 = RegisterNetEvent
L5_1 = "kartik-mdt:reports:startEditing"
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = source
  L5_2 = L3_1
  L6_2 = A3_2
  L7_2 = A2_2
  L8_2 = A0_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = L0_1
  L5_2 = L5_2[A3_2]
  L5_2 = L5_2[A2_2]
  L5_2 = L5_2[A0_2]
  L6_2 = tostring
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L7_2 = {}
  L8_2 = A1_2.id
  L7_2.id = L8_2
  L8_2 = A1_2.name
  L7_2.name = L8_2
  L8_2 = A1_2.department
  L7_2.department = L8_2
  L8_2 = os
  L8_2 = L8_2.time
  L8_2 = L8_2()
  L7_2.lastActive = L8_2
  L5_2[L6_2] = L7_2
  L5_2 = pairs
  L6_2 = L0_1
  L6_2 = L6_2[A3_2]
  L6_2 = L6_2[A2_2]
  L6_2 = L6_2[A0_2]
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = TriggerClientEvent
    L12_2 = "kartik-mdt:reports:editorJoined"
    L13_2 = tonumber
    L14_2 = L9_2
    L13_2 = L13_2(L14_2)
    L14_2 = A0_2
    L15_2 = L0_1
    L15_2 = L15_2[A3_2]
    L15_2 = L15_2[A2_2]
    L15_2 = L15_2[A0_2]
    L11_2(L12_2, L13_2, L14_2, L15_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "kartik-mdt:reports:stopEditing"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = source
  L4_2 = L0_1
  L4_2 = L4_2[A2_2]
  if L4_2 then
    L4_2 = L0_1
    L4_2 = L4_2[A2_2]
    L4_2 = L4_2[A1_2]
    if L4_2 then
      L4_2 = L0_1
      L4_2 = L4_2[A2_2]
      L4_2 = L4_2[A1_2]
      L4_2 = L4_2[A0_2]
      if L4_2 then
        L4_2 = L0_1
        L4_2 = L4_2[A2_2]
        L4_2 = L4_2[A1_2]
        L4_2 = L4_2[A0_2]
        L5_2 = tostring
        L6_2 = L3_2
        L5_2 = L5_2(L6_2)
        L4_2 = L4_2[L5_2]
        if L4_2 then
          L4_2 = L0_1
          L4_2 = L4_2[A2_2]
          L4_2 = L4_2[A1_2]
          L4_2 = L4_2[A0_2]
          L5_2 = tostring
          L6_2 = L3_2
          L5_2 = L5_2(L6_2)
          L4_2[L5_2] = nil
          L4_2 = pairs
          L5_2 = L0_1
          L5_2 = L5_2[A2_2]
          L5_2 = L5_2[A1_2]
          L5_2 = L5_2[A0_2]
          if not L5_2 then
            L5_2 = {}
          end
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
            L10_2 = TriggerClientEvent
            L11_2 = "kartik-mdt:reports:editorLeft"
            L12_2 = tonumber
            L13_2 = L8_2
            L12_2 = L12_2(L13_2)
            L13_2 = A0_2
            L14_2 = L0_1
            L14_2 = L14_2[A2_2]
            L14_2 = L14_2[A1_2]
            L14_2 = L14_2[A0_2]
            L10_2(L11_2, L12_2, L13_2, L14_2)
          end
        end
      end
    end
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "kartik-mdt:reports:updateReport"
function L6_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L5_2 = source
  L6_2 = L3_1
  L7_2 = A4_2
  L8_2 = A3_2
  L9_2 = A0_2
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = L0_1
  L6_2 = L6_2[A4_2]
  L6_2 = L6_2[A3_2]
  L6_2 = L6_2[A0_2]
  L7_2 = tostring
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  L6_2 = L6_2[L7_2]
  if L6_2 then
    L6_2 = L0_1
    L6_2 = L6_2[A4_2]
    L6_2 = L6_2[A3_2]
    L6_2 = L6_2[A0_2]
    L7_2 = tostring
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    L6_2 = L6_2[L7_2]
    L7_2 = os
    L7_2 = L7_2.time
    L7_2 = L7_2()
    L6_2.lastActive = L7_2
  end
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L7_2 = table
  L7_2 = L7_2.insert
  L8_2 = L1_1
  L8_2 = L8_2[A4_2]
  L8_2 = L8_2[A3_2]
  L8_2 = L8_2[A0_2]
  L9_2 = {}
  L9_2.source = L5_2
  L9_2.changes = A1_2
  L9_2.changeType = A2_2
  L9_2.page = A3_2
  L9_2.department = A4_2
  L9_2.timestamp = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = L2_1
  L7_2 = L7_2[A4_2]
  L7_2 = L7_2[A3_2]
  L7_2[A0_2] = L6_2
  L7_2 = pairs
  L8_2 = L0_1
  L8_2 = L8_2[A4_2]
  L8_2 = L8_2[A3_2]
  L8_2 = L8_2[A0_2]
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = tonumber
    L14_2 = L11_2
    L13_2 = L13_2(L14_2)
    if L13_2 ~= L5_2 then
      L13_2 = TriggerClientEvent
      L14_2 = "kartik-mdt:reports:receiveUpdate"
      L15_2 = tonumber
      L16_2 = L11_2
      L15_2 = L15_2(L16_2)
      L16_2 = A0_2
      L17_2 = A1_2
      L18_2 = A2_2
      L19_2 = L5_2
      L20_2 = L6_2
      L21_2 = A3_2
      L22_2 = A4_2
      L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
    end
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "kartik-mdt:reports:getActiveEditors"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = source
  L4_2 = L0_1
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L4_2 = {}
  end
  L4_2 = L4_2[A1_2]
  if not L4_2 then
    L4_2 = {}
  end
  L5_2 = L4_2[A0_2]
  if not L5_2 then
    L5_2 = {}
  end
  L6_2 = TriggerClientEvent
  L7_2 = "kartik-mdt:reports:currentEditors"
  L8_2 = L3_2
  L9_2 = A0_2
  L10_2 = L5_2
  L6_2(L7_2, L8_2, L9_2, L10_2)
end
L4_1(L5_1, L6_1)
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  while true do
    L0_2 = Wait
    L1_2 = 60000
    L0_2(L1_2)
    L0_2 = os
    L0_2 = L0_2.time
    L0_2 = L0_2()
    L1_2 = pairs
    L2_2 = L0_1
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = pairs
      L8_2 = L6_2
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = pairs
        L14_2 = L12_2
        L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
        for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
          L19_2 = {}
          L20_2 = pairs
          L21_2 = L18_2
          L20_2, L21_2, L22_2, L23_2 = L20_2(L21_2)
          for L24_2, L25_2 in L20_2, L21_2, L22_2, L23_2 do
            L26_2 = L25_2.lastActive
            if not L26_2 then
              L26_2 = L0_2
            end
            L26_2 = L0_2 - L26_2
            L27_2 = 300
            if L26_2 > L27_2 then
              L26_2 = table
              L26_2 = L26_2.insert
              L27_2 = L19_2
              L28_2 = L24_2
              L26_2(L27_2, L28_2)
            end
          end
          L20_2 = ipairs
          L21_2 = L19_2
          L20_2, L21_2, L22_2, L23_2 = L20_2(L21_2)
          for L24_2, L25_2 in L20_2, L21_2, L22_2, L23_2 do
            L18_2[L25_2] = nil
          end
          L20_2 = next
          L21_2 = L18_2
          L20_2 = L20_2(L21_2)
          if nil == L20_2 then
            L20_2 = L0_1
            L20_2 = L20_2[L5_2]
            L20_2 = L20_2[L11_2]
            L20_2[L17_2] = nil
            L20_2 = L1_1
            L20_2 = L20_2[L5_2]
            L20_2 = L20_2[L11_2]
            L20_2[L17_2] = nil
            L20_2 = L2_1
            L20_2 = L20_2[L5_2]
            L20_2 = L20_2[L11_2]
            L20_2[L17_2] = nil
            L20_2 = next
            L21_2 = L0_1
            L21_2 = L21_2[L5_2]
            L21_2 = L21_2[L11_2]
            L20_2 = L20_2(L21_2)
            if nil == L20_2 then
              L20_2 = L0_1
              L20_2 = L20_2[L5_2]
              L20_2[L11_2] = nil
              L20_2 = L1_1
              L20_2 = L20_2[L5_2]
              L20_2[L11_2] = nil
              L20_2 = L2_1
              L20_2 = L20_2[L5_2]
              L20_2[L11_2] = nil
            end
            L20_2 = next
            L21_2 = L0_1
            L21_2 = L21_2[L5_2]
            L20_2 = L20_2(L21_2)
            if nil == L20_2 then
              L20_2 = L0_1
              L20_2[L5_2] = nil
              L20_2 = L1_1
              L20_2[L5_2] = nil
              L20_2 = L2_1
              L20_2[L5_2] = nil
            end
          end
        end
      end
    end
  end
end
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "playerDropped"
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L0_2 = tostring
  L1_2 = source
  L0_2 = L0_2(L1_2)
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = pairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = pairs
      L14_2 = L12_2
      L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
      for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
        L19_2 = L18_2[L0_2]
        if L19_2 then
          L18_2[L0_2] = nil
          L19_2 = TriggerClientEvent
          L20_2 = "kartik-mdt:reports:editorLeft"
          L21_2 = -1
          L22_2 = L17_2
          L23_2 = L18_2
          L19_2(L20_2, L21_2, L22_2, L23_2)
          L19_2 = next
          L20_2 = L18_2
          L19_2 = L19_2(L20_2)
          if nil == L19_2 then
            L19_2 = L0_1
            L19_2 = L19_2[L5_2]
            L19_2 = L19_2[L11_2]
            L19_2[L17_2] = nil
            L19_2 = L1_1
            L19_2 = L19_2[L5_2]
            L19_2 = L19_2[L11_2]
            L19_2[L17_2] = nil
            L19_2 = L2_1
            L19_2 = L19_2[L5_2]
            L19_2 = L19_2[L11_2]
            L19_2[L17_2] = nil
            L19_2 = next
            L20_2 = L0_1
            L20_2 = L20_2[L5_2]
            L20_2 = L20_2[L11_2]
            L19_2 = L19_2(L20_2)
            if nil == L19_2 then
              L19_2 = L0_1
              L19_2 = L19_2[L5_2]
              L19_2[L11_2] = nil
              L19_2 = L1_1
              L19_2 = L19_2[L5_2]
              L19_2[L11_2] = nil
              L19_2 = L2_1
              L19_2 = L19_2[L5_2]
              L19_2[L11_2] = nil
            end
            L19_2 = next
            L20_2 = L0_1
            L20_2 = L20_2[L5_2]
            L19_2 = L19_2(L20_2)
            if nil == L19_2 then
              L19_2 = L0_1
              L19_2[L5_2] = nil
              L19_2 = L1_1
              L19_2[L5_2] = nil
              L19_2 = L2_1
              L19_2[L5_2] = nil
            end
          end
        end
      end
    end
  end
end
L4_1(L5_1, L6_1)
