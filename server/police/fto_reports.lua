local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchFTOReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = A1_2.page
    L4_2 = A1_2.query
    if not L4_2 then
      L4_2 = ""
    end
    L5_2 = L3_2 - 1
    L5_2 = L5_2 * 10
    L6_2 = ""
    L7_2 = {}
    L8_2 = {}
    L9_2 = 0
    if "" ~= L4_2 then
      L6_2 = "WHERE LOWER(trainee_name) LIKE LOWER(?) OR LOWER(id) LIKE LOWER(?) OR LOWER(fto_name) LIKE LOWER(?) "
      L10_2 = {}
      L11_2 = "%"
      L12_2 = L4_2
      L13_2 = "%"
      L11_2 = L11_2 .. L12_2 .. L13_2
      L12_2 = "%"
      L13_2 = L4_2
      L14_2 = "%"
      L12_2 = L12_2 .. L13_2 .. L14_2
      L13_2 = "%"
      L14_2 = L4_2
      L15_2 = "%"
      L13_2 = L13_2 .. L14_2 .. L15_2
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L7_2 = L10_2
    end
    L10_2 = "SELECT * FROM mdt_police_fto_reports "
    L11_2 = L6_2
    L12_2 = " ORDER BY id DESC"
    L10_2 = L10_2 .. L11_2 .. L12_2
    L11_2 = L10_2
    L12_2 = " LIMIT 10 OFFSET ?"
    L11_2 = L11_2 .. L12_2
    L10_2 = L11_2
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L7_2
    L13_2 = L5_2
    L11_2(L12_2, L13_2)
    L11_2 = MySQL
    L11_2 = L11_2.query
    L11_2 = L11_2.await
    L12_2 = L10_2
    L13_2 = L7_2
    L11_2 = L11_2(L12_2, L13_2)
    L12_2 = ipairs
    L13_2 = L11_2
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
      L18_2 = {}
      L19_2 = L17_2.id
      L18_2.id = L19_2
      L19_2 = L17_2.trainee_name
      L18_2.traineeName = L19_2
      L19_2 = L17_2.fto_name
      L18_2.ftoName = L19_2
      L19_2 = L17_2.status
      L18_2.status = L19_2
      L19_2 = L17_2.date
      L18_2.date = L19_2
      L19_2 = L17_2.shift
      L18_2.shift = L19_2
      L19_2 = L17_2.phase
      L18_2.phase = L19_2
      L19_2 = L17_2.overall_performance
      L18_2.overallPerformance = L19_2
      L19_2 = table
      L19_2 = L19_2.insert
      L20_2 = L8_2
      L21_2 = L18_2
      L19_2(L20_2, L21_2)
    end
    if "" ~= L4_2 then
      L7_2[3] = nil
    end
    L12_2 = "SELECT COUNT(*) as count FROM mdt_police_fto_reports "
    L13_2 = L6_2
    L12_2 = L12_2 .. L13_2
    L13_2 = MySQL
    L13_2 = L13_2.query
    L13_2 = L13_2.await
    L14_2 = L12_2
    L15_2 = L7_2
    L13_2 = L13_2(L14_2, L15_2)
    L14_2 = L13_2[1]
    L9_2 = L14_2.count
    L14_2 = {}
    L14_2.ftoreports = L8_2
    L14_2.totalCount = L9_2
    return L14_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchFTOReportDataByReportId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A1_2 then
    L2_2 = A1_2.ReportId
    if L2_2 then
      L2_2 = A1_2.ReportId
      L3_2 = "SELECT * FROM mdt_police_fto_reports WHERE id = ?"
      L4_2 = {}
      L5_2 = L2_2
      L4_2[1] = L5_2
      L5_2 = MySQL
      L5_2 = L5_2.query
      L5_2 = L5_2.await
      L6_2 = L3_2
      L7_2 = L4_2
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = L5_2[1]
      if L6_2 then
        L6_2 = {}
        L6_2.id = L2_2
        L7_2 = L5_2[1]
        L7_2 = L7_2.categories
        if not L7_2 then
          L7_2 = ""
        end
        L6_2.categories = L7_2
        L7_2 = L5_2[1]
        L7_2 = L7_2.strengths
        L6_2.strengths = L7_2
        L7_2 = L5_2[1]
        L7_2 = L7_2.areas_for_improvement
        L6_2.areasForImprovement = L7_2
        L7_2 = L5_2[1]
        L7_2 = L7_2.additional_comments
        if not L7_2 then
          L7_2 = ""
        end
        L6_2.additionalComments = L7_2
        L7_2 = L5_2[1]
        L7_2 = L7_2.rejection_reason
        if not L7_2 then
          L7_2 = ""
        end
        L6_2.rejectionReason = L7_2
        return L6_2
      else
        L6_2 = nil
        return L6_2
      end
  end
  else
    L2_2 = nil
    return L2_2
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = GetPlayerName
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = "Unknown"
  end
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "[%s] %s "
  L4_2 = A0_2
  L5_2 = L1_2
  return L2_2(L3_2, L4_2, L5_2)
end
FormatPlayer = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:createFTOReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  if A1_2 then
    L2_2 = A1_2.report
    if L2_2 then
      L2_2 = A1_2.report
      L3_2 = L2_2.traineeName
      L4_2 = L2_2.ftoName
      L5_2 = L2_2.date
      L6_2 = L2_2.shift
      L7_2 = L2_2.phase
      L8_2 = json
      L8_2 = L8_2.encode
      L9_2 = L2_2.categories
      L8_2 = L8_2(L9_2)
      L9_2 = L2_2.overallPerformance
      L10_2 = L2_2.strengths
      L11_2 = L2_2.areasForImprovement
      L12_2 = L2_2.additionalComments
      L13_2 = L2_2.status
      L14_2 = "INSERT INTO mdt_police_fto_reports (trainee_name, fto_name, date, shift, phase, categories, overall_performance, strengths, areas_for_improvement, additional_comments, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
      L15_2 = {}
      L16_2 = L3_2
      L17_2 = L4_2
      L18_2 = L5_2
      L19_2 = L6_2
      L20_2 = L7_2
      L21_2 = L8_2
      L22_2 = L9_2
      L23_2 = L10_2
      L24_2 = L11_2
      L25_2 = L12_2
      L26_2 = L13_2
      L15_2[1] = L16_2
      L15_2[2] = L17_2
      L15_2[3] = L18_2
      L15_2[4] = L19_2
      L15_2[5] = L20_2
      L15_2[6] = L21_2
      L15_2[7] = L22_2
      L15_2[8] = L23_2
      L15_2[9] = L24_2
      L15_2[10] = L25_2
      L15_2[11] = L26_2
      L16_2 = MySQL
      L16_2 = L16_2.query
      L16_2 = L16_2.await
      L17_2 = L14_2
      L18_2 = L15_2
      L16_2 = L16_2(L17_2, L18_2)
      L17_2 = L16_2.insertId
      L18_2 = SendDiscordLog
      L19_2 = "pd_fto"
      L20_2 = "\240\159\147\157 FTO Report Created"
      L21_2 = nil
      L22_2 = 5763719
      L23_2 = {}
      L24_2 = {}
      L24_2.name = "Trainee"
      L25_2 = L3_2 or L25_2
      if not L3_2 then
        L25_2 = "N/A"
      end
      L24_2.value = L25_2
      L24_2.inline = true
      L25_2 = {}
      L25_2.name = "FTO"
      L26_2 = L4_2 or L26_2
      if not L4_2 then
        L26_2 = "N/A"
      end
      L25_2.value = L26_2
      L25_2.inline = true
      L26_2 = {}
      L26_2.name = "Date"
      L27_2 = L5_2 or L27_2
      if not L5_2 then
        L27_2 = os
        L27_2 = L27_2.date
        L27_2 = L27_2()
      end
      L26_2.value = L27_2
      L26_2.inline = true
      L27_2 = {}
      L27_2.name = "Shift"
      L28_2 = L6_2 or L28_2
      if not L6_2 then
        L28_2 = "N/A"
      end
      L27_2.value = L28_2
      L27_2.inline = true
      L28_2 = {}
      L28_2.name = "Phase"
      L29_2 = L7_2 or L29_2
      if not L7_2 then
        L29_2 = "N/A"
      end
      L28_2.value = L29_2
      L28_2.inline = true
      L29_2 = {}
      L29_2.name = "Player"
      L30_2 = FormatPlayer
      L31_2 = A0_2
      L30_2 = L30_2(L31_2)
      L29_2.value = L30_2
      L29_2.inline = false
      L23_2[1] = L24_2
      L23_2[2] = L25_2
      L23_2[3] = L26_2
      L23_2[4] = L27_2
      L23_2[5] = L28_2
      L23_2[6] = L29_2
      L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
      L18_2 = {}
      L18_2.success = true
      L18_2.message = "Report added successfully."
      L18_2.reportId = L17_2
      return L18_2
  end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:saveFTOReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2
  if A1_2 then
    L2_2 = A1_2.reportId
    if L2_2 then
      L2_2 = A1_2.reportId
      L3_2 = A1_2.report
      L4_2 = L3_2.traineeName
      L5_2 = L3_2.ftoName
      L6_2 = L3_2.date
      L7_2 = L3_2.shift
      L8_2 = L3_2.phase
      L9_2 = json
      L9_2 = L9_2.encode
      L10_2 = L3_2.categories
      L9_2 = L9_2(L10_2)
      L10_2 = L3_2.overallPerformance
      L11_2 = L3_2.strengths
      L12_2 = L3_2.areasForImprovement
      L13_2 = L3_2.additionalComments
      L14_2 = "UPDATE mdt_police_fto_reports SET trainee_name = ?, fto_name = ?, date = ?, shift = ?, phase = ?, categories = ?, overall_performance = ?, strengths = ?, areas_for_improvement = ?, additional_comments = ? WHERE id = ?"
      L15_2 = {}
      L16_2 = L4_2
      L17_2 = L5_2
      L18_2 = L6_2
      L19_2 = L7_2
      L20_2 = L8_2
      L21_2 = L9_2
      L22_2 = L10_2
      L23_2 = L11_2
      L24_2 = L12_2
      L25_2 = L13_2
      L26_2 = L2_2
      L15_2[1] = L16_2
      L15_2[2] = L17_2
      L15_2[3] = L18_2
      L15_2[4] = L19_2
      L15_2[5] = L20_2
      L15_2[6] = L21_2
      L15_2[7] = L22_2
      L15_2[8] = L23_2
      L15_2[9] = L24_2
      L15_2[10] = L25_2
      L15_2[11] = L26_2
      L16_2 = MySQL
      L16_2 = L16_2.query
      L16_2 = L16_2.await
      L17_2 = L14_2
      L18_2 = L15_2
      L16_2 = L16_2(L17_2, L18_2)
      L17_2 = L16_2.affectedRows
      if L17_2 > 0 then
        L17_2 = SendDiscordLog
        L18_2 = "pd_fto"
        L19_2 = "\226\156\143\239\184\143 FTO Report Updated"
        L20_2 = nil
        L21_2 = 3447003
        L22_2 = {}
        L23_2 = {}
        L23_2.name = "Trainee"
        L24_2 = L4_2 or L24_2
        if not L4_2 then
          L24_2 = "N/A"
        end
        L23_2.value = L24_2
        L23_2.inline = true
        L24_2 = {}
        L24_2.name = "FTO"
        L25_2 = L5_2 or L25_2
        if not L5_2 then
          L25_2 = "N/A"
        end
        L24_2.value = L25_2
        L24_2.inline = true
        L25_2 = {}
        L25_2.name = "Date"
        L26_2 = L6_2 or L26_2
        if not L6_2 then
          L26_2 = os
          L26_2 = L26_2.date
          L26_2 = L26_2()
        end
        L25_2.value = L26_2
        L25_2.inline = true
        L26_2 = {}
        L26_2.name = "Phase"
        L27_2 = L8_2 or L27_2
        if not L8_2 then
          L27_2 = "N/A"
        end
        L26_2.value = L27_2
        L26_2.inline = true
        L27_2 = {}
        L27_2.name = "Report ID"
        L28_2 = tostring
        L29_2 = L2_2
        L28_2 = L28_2(L29_2)
        L27_2.value = L28_2
        L27_2.inline = true
        L28_2 = {}
        L28_2.name = "Player"
        L29_2 = FormatPlayer
        L30_2 = A0_2
        L29_2 = L29_2(L30_2)
        L28_2.value = L29_2
        L28_2.inline = false
        L22_2[1] = L23_2
        L22_2[2] = L24_2
        L22_2[3] = L25_2
        L22_2[4] = L26_2
        L22_2[5] = L27_2
        L22_2[6] = L28_2
        L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
        L17_2 = {}
        L17_2.success = true
        L17_2.message = "Report saved successfully."
        return L17_2
      else
        L17_2 = {}
        L17_2.success = false
        L17_2.message = "Failed to update the report."
        return L17_2
      end
  end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:approveFTOReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.reportId
    if L2_2 then
      L2_2 = A1_2.reportId
      L3_2 = "UPDATE mdt_police_fto_reports SET status = 'approved' WHERE id = ?"
      L4_2 = {}
      L5_2 = L2_2
      L4_2[1] = L5_2
      L5_2 = MySQL
      L5_2 = L5_2.query
      L5_2 = L5_2.await
      L6_2 = L3_2
      L7_2 = L4_2
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = L5_2.affectedRows
      if L6_2 > 0 then
        L6_2 = SendDiscordLog
        L7_2 = "pd_fto"
        L8_2 = "\226\156\133 FTO Report Approved"
        L9_2 = nil
        L10_2 = 5763719
        L11_2 = {}
        L12_2 = {}
        L12_2.name = "Report ID"
        L13_2 = tostring
        L14_2 = L2_2
        L13_2 = L13_2(L14_2)
        L12_2.value = L13_2
        L12_2.inline = true
        L13_2 = {}
        L13_2.name = "Player"
        L14_2 = FormatPlayer
        L15_2 = A0_2
        L14_2 = L14_2(L15_2)
        L13_2.value = L14_2
        L13_2.inline = false
        L11_2[1] = L12_2
        L11_2[2] = L13_2
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        L6_2 = {}
        L6_2.success = true
        L6_2.message = "Report approved successfully."
        return L6_2
      else
        L6_2 = {}
        L6_2.success = false
        L6_2.message = "Failed to approve the report."
        return L6_2
      end
  end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:rejectFTOReport"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A1_2 then
    L2_2 = A1_2.reportId
    if L2_2 then
      L2_2 = A1_2.reportId
      L3_2 = A1_2.rejectionReason
      L4_2 = "UPDATE mdt_police_fto_reports SET status = 'rejected', rejection_reason = ? WHERE id = ?"
      L5_2 = {}
      L6_2 = L3_2
      L7_2 = L2_2
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = MySQL
      L6_2 = L6_2.query
      L6_2 = L6_2.await
      L7_2 = L4_2
      L8_2 = L5_2
      L6_2 = L6_2(L7_2, L8_2)
      L7_2 = L6_2.affectedRows
      if L7_2 > 0 then
        L7_2 = SendDiscordLog
        L8_2 = "pd_fto"
        L9_2 = "\226\157\140 FTO Report Rejected"
        L10_2 = nil
        L11_2 = 15158332
        L12_2 = {}
        L13_2 = {}
        L13_2.name = "Report ID"
        L14_2 = tostring
        L15_2 = L2_2
        L14_2 = L14_2(L15_2)
        L13_2.value = L14_2
        L13_2.inline = true
        L14_2 = {}
        L14_2.name = "Reason"
        L15_2 = L3_2 or L15_2
        if not L3_2 then
          L15_2 = "No reason provided"
        end
        L14_2.value = L15_2
        L14_2.inline = false
        L15_2 = {}
        L15_2.name = "Player"
        L16_2 = FormatPlayer
        L17_2 = A0_2
        L16_2 = L16_2(L17_2)
        L15_2.value = L16_2
        L15_2.inline = false
        L12_2[1] = L13_2
        L12_2[2] = L14_2
        L12_2[3] = L15_2
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
        L7_2 = {}
        L7_2.success = true
        L7_2.message = "Report rejected successfully."
        return L7_2
      else
        L7_2 = {}
        L7_2.success = false
        L7_2.message = "Failed to reject the report."
        return L7_2
      end
  end
  else
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received."
    return L2_2
  end
end
L0_1(L1_1, L2_1)
