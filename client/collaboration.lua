local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = {}
L4_1 = {}
L5_1 = 0
L6_1 = {}
L7_1 = false
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = L0_1
  if L3_2 then
    L3_2 = StopEditingReport
    L3_2()
  end
  L0_1 = A0_2
  L1_1 = A1_2
  L2_1 = A2_2
  L3_2 = {}
  L4_2 = PlayerData
  L4_2 = L4_2.citizenid
  L3_2.id = L4_2
  L4_2 = PlayerData
  L4_2 = L4_2.name
  L3_2.name = L4_2
  L4_2 = PlayerData
  L4_2 = L4_2.jobData
  L4_2 = L4_2.label
  L3_2.department = L4_2
  L4_2 = TriggerServerEvent
  L5_2 = "kartik-mdt:reports:startEditing"
  L6_2 = A0_2
  L7_2 = L3_2
  L8_2 = A1_2
  L9_2 = A2_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = TriggerServerEvent
  L5_2 = "kartik-mdt:reports:getActiveEditors"
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.type = "startCollabEditing"
  L5_2.reportId = A0_2
  L4_2(L5_2)
end
StartEditingReport = L8_1
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L0_1
  if L0_2 then
    L0_2 = TriggerServerEvent
    L1_2 = "kartik-mdt:reports:stopEditing"
    L2_2 = L0_1
    L3_2 = L1_1
    L4_2 = L2_1
    L0_2(L1_2, L2_2, L3_2, L4_2)
    L0_2 = nil
    L0_1 = L0_2
    L0_2 = nil
    L2_1 = L0_2
    L0_2 = nil
    L1_1 = L0_2
    L0_2 = {}
    L3_1 = L0_2
    L0_2 = SendNUIMessage
    L1_2 = {}
    L1_2.type = "stopCollabEditing"
    L0_2(L1_2)
  end
end
StopEditingReport = L8_1
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2
  L5_2 = L0_1
  if L5_2 then
    L5_2 = L0_1
    if L5_2 == A0_2 then
      L5_2 = L1_1
      if L5_2 == A3_2 then
        L5_2 = L2_1
        if L5_2 == A4_2 then
          goto lbl_14
        end
      end
    end
  end
  do return end
  ::lbl_14::
  L5_2 = table
  L5_2 = L5_2.insert
  L6_2 = L6_1
  L7_2 = {}
  L7_2.reportId = A0_2
  L7_2.changes = A1_2
  L7_2.changeType = A2_2
  L7_2.page = A3_2
  L7_2.department = A4_2
  L8_2 = GetGameTimer
  L8_2 = L8_2()
  L7_2.time = L8_2
  L5_2(L6_2, L7_2)
  L5_2 = L7_1
  if not L5_2 then
    L5_2 = ProcessChangeQueue
    L5_2()
  end
end
SendReportChanges = L8_1
function L8_1()
  local L0_2, L1_2
  L0_2 = true
  L7_1 = L0_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    while true do
      L0_3 = L6_1
      L0_3 = #L0_3
      if not (L0_3 > 0) then
        break
      end
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L5_1
      L1_3 = L0_3 - L1_3
      L2_3 = 500
      if L1_3 > L2_3 then
        L1_3 = table
        L1_3 = L1_3.remove
        L2_3 = L6_1
        L3_3 = 1
        L1_3 = L1_3(L2_3, L3_3)
        L2_3 = TriggerServerEvent
        L3_3 = "kartik-mdt:reports:updateReport"
        L4_3 = L1_3.reportId
        L5_3 = L1_3.changes
        L6_3 = L1_3.changeType
        L7_3 = L1_3.page
        L8_3 = L1_3.department
        L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
        L5_1 = L0_3
      end
      L1_3 = Wait
      L2_3 = 100
      L1_3(L2_3)
    end
    L0_3 = false
    L7_1 = L0_3
  end
  L0_2(L1_2)
end
ProcessChangeQueue = L8_1
L8_1 = RegisterNetEvent
L9_1 = "kartik-mdt:reports:receiveUpdate"
L8_1(L9_1)
L8_1 = AddEventHandler
L9_1 = "kartik-mdt:reports:receiveUpdate"
function L10_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2
  L7_2 = L0_1
  if L7_2 then
    L7_2 = L0_1
    if L7_2 == A0_2 then
      L7_2 = L1_1
      if L7_2 == A5_2 then
        L7_2 = L2_1
        if L7_2 == A6_2 then
          goto lbl_14
        end
      end
    end
  end
  do return end
  ::lbl_14::
  L7_2 = GetPlayerServerId
  L8_2 = PlayerId
  L8_2, L9_2 = L8_2()
  L7_2 = L7_2(L8_2, L9_2)
  if A3_2 == L7_2 then
    return
  end
  L7_2 = SendNUIMessage
  L8_2 = {}
  L8_2.type = "collabUpdate"
  L8_2.reportId = A0_2
  L8_2.changes = A1_2
  L8_2.changeType = A2_2
  L8_2.sourceId = A3_2
  L8_2.timestamp = A4_2
  L9_2 = L3_1
  L8_2.editors = L9_2
  L7_2(L8_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNetEvent
L9_1 = "kartik-mdt:reports:currentEditors"
L8_1(L9_1)
L8_1 = AddEventHandler
L9_1 = "kartik-mdt:reports:currentEditors"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2
  L3_1 = A1_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.type = "collabEditors"
  L3_2.reportId = A0_2
  L3_2.editors = A1_2
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNetEvent
L9_1 = "kartik-mdt:reports:editorJoined"
L8_1(L9_1)
L8_1 = AddEventHandler
L9_1 = "kartik-mdt:reports:editorJoined"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L0_1
  if A0_2 == L2_2 then
    L3_1 = A1_2
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.type = "collabEditorJoined"
    L3_2.reportId = A0_2
    L3_2.editors = A1_2
    L2_2(L3_2)
  end
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNetEvent
L9_1 = "kartik-mdt:reports:editorLeft"
L8_1(L9_1)
L8_1 = AddEventHandler
L9_1 = "kartik-mdt:reports:editorLeft"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L0_1
  if A0_2 == L2_2 then
    L3_1 = A1_2
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.type = "collabEditorLeft"
    L3_2.reportId = A0_2
    L3_2.editors = A1_2
    L2_2(L3_2)
  end
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNUICallback
L9_1 = "startEditingReport"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = StartEditingReport
  L3_2 = A0_2.reportId
  L4_2 = A0_2.page
  L5_2 = A0_2.department
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNUICallback
L9_1 = "stopEditingReport"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = StopEditingReport
  L2_2()
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNUICallback
L9_1 = "sendReportChanges"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = SendReportChanges
  L3_2 = A0_2.reportId
  L4_2 = A0_2.changes
  L5_2 = A0_2.changeType
  L6_2 = A0_2.page
  L7_2 = A0_2.department
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = AddEventHandler
L9_1 = "onResourceStop"
function L10_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = StopEditingReport
    L1_2()
  end
end
L8_1(L9_1, L10_1)
