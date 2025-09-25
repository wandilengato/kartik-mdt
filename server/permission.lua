local L0_1, L1_1, L2_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A1_2 then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if "table" == L2_2 then
      goto lbl_10
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_10::
  L2_2 = ipairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = ipairs
    L9_2 = A0_2
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      if L13_2 == L7_2 then
        L14_2 = true
        return L14_2
      end
    end
  end
  L2_2 = false
  return L2_2
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if "table" == L8_2 then
      L8_2 = deepCopy
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L1_2[L6_2] = L8_2
    else
      L1_2[L6_2] = L7_2
    end
  end
  return L1_2
end
deepCopy = L1_1
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if false == A0_2 then
    L3_2 = false
    return L3_2
  end
  if true == A0_2 then
    L3_2 = true
    return L3_2
  end
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if "table" ~= L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = A0_2.rank
  L4_2 = A0_2.tags
  L5_2 = A0_2.require
  if not L5_2 then
    L5_2 = "any"
  end
  L6_2 = nil ~= L3_2 and false ~= L3_2 and A1_2 >= L3_2
  L7_2 = L0_1
  L8_2 = A2_2
  L9_2 = L4_2
  L7_2 = L7_2(L8_2, L9_2)
  if "all" == L5_2 then
    L8_2 = L6_2 or L8_2
    if L6_2 then
      L8_2 = L7_2
    end
    return L8_2
  else
    L8_2 = L6_2 or L8_2
    if not L6_2 then
      L8_2 = L7_2
    end
    return L8_2
  end
end
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = {}
  L4_2 = Config
  L4_2 = L4_2.Permissions
  L4_2 = L4_2[A0_2]
  if L4_2 then
    L5_2 = L4_2.Pages
    if L5_2 then
      goto lbl_14
    end
  end
  L5_2 = {}
  do return L5_2 end
  ::lbl_14::
  if not A2_2 then
    L5_2 = {}
    A2_2 = L5_2
  end
  L5_2 = deepCopy
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L3_2 = L5_2
  L5_2 = pairs
  L6_2 = L4_2.Pages
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = false
    L12_2 = false
    L13_2 = L10_2.view
    if false ~= L13_2 then
      L13_2 = L1_1
      L14_2 = L10_2.view
      L15_2 = A1_2
      L16_2 = A2_2
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L11_2 = L13_2
    end
    L13_2 = L10_2.edit
    if false ~= L13_2 then
      L13_2 = L1_1
      L14_2 = L10_2.edit
      L15_2 = A1_2
      L16_2 = A2_2
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L12_2 = L13_2
    end
    L13_2 = L3_2.Pages
    L14_2 = {}
    L14_2.view = L11_2
    L14_2.edit = L12_2
    L13_2[L9_2] = L14_2
  end
  return L3_2
end
GetSanitizedPermissions = L2_1
