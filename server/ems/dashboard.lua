local L0_1, L1_1, L2_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = nil
  L2_2 = {}
  L3_2 = "SELECT COUNT(*) as total FROM mdt_ems_bulletin"
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = L3_2
  L6_2 = {}
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2[1]
  if L5_2 then
    L5_2 = L4_2[1]
    L5_2 = L5_2.total
    if L5_2 then
      goto lbl_20
    end
  end
  L5_2 = 0
  ::lbl_20::
  L6_2 = false
  if A0_2 then
    L7_2 = A0_2.page
    if L7_2 then
      L7_2 = A0_2.limit
      if L7_2 then
        L7_2 = A0_2.page
        L8_2 = A0_2.limit
        L9_2 = L7_2 - 1
        L9_2 = L9_2 * L8_2
        L1_2 = "SELECT * FROM mdt_ems_bulletin LIMIT ? OFFSET ?"
        L10_2 = table
        L10_2 = L10_2.insert
        L11_2 = L2_2
        L12_2 = L8_2
        L10_2(L11_2, L12_2)
        L10_2 = table
        L10_2 = L10_2.insert
        L11_2 = L2_2
        L12_2 = L9_2
        L10_2(L11_2, L12_2)
        L10_2 = A0_2.page
        L11_2 = A0_2.limit
        L10_2 = L10_2 * L11_2
        L6_2 = L5_2 > L10_2
    end
  end
  else
    L1_2 = "SELECT * FROM mdt_ems_bulletin"
  end
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = L1_2
  L9_2 = L2_2
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 then
    L8_2 = {}
    L8_2.success = true
    L8_2.announcements = L7_2
    L8_2.message = ""
    L8_2.hasMore = L6_2
    return L8_2
  else
    L8_2 = print
    L9_2 = "Error fetching announcements."
    L8_2(L9_2)
    L8_2 = {}
    L8_2.success = false
    L8_2.message = "No announcements found."
    return L8_2
  end
end
fetchEMSAnnouncements = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:initEMSDashboard"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = fetchEMSAnnouncements
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L3_2 = fetchWarrants
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L4_2 = fetchEMSRecentReports
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = {}
  end
  L5_2 = fetchWantedVehicles
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L6_2 = fetchActiveUnitsHere
  L6_2 = L6_2()
  L7_2 = {}
  L8_2 = L2_2 or L8_2
  if not L2_2 then
    L8_2 = {}
  end
  L7_2.announcements = L8_2
  L8_2 = L3_2 or L8_2
  if not L3_2 then
    L8_2 = {}
  end
  L7_2.warrantsData = L8_2
  L8_2 = L4_2 or L8_2
  if not L4_2 then
    L8_2 = {}
  end
  L7_2.reports = L8_2
  L8_2 = L5_2 or L8_2
  if not L5_2 then
    L8_2 = {}
  end
  L7_2.vehiclesData = L8_2
  L8_2 = L6_2 or L8_2
  if not L6_2 then
    L8_2 = {}
  end
  L7_2.units = L8_2
  return L7_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchEMSAnnouncements"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = fetchEMSAnnouncements
  L3_2 = A1_2
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:addEMSAnnouncement"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if A1_2 then
    L2_2 = A1_2.announcementToAdd
    if L2_2 then
      A1_2 = A1_2.announcementToAdd
      L2_2 = A1_2.announcementId
      L3_2 = A1_2.title
      L4_2 = A1_2.description
      L5_2 = A1_2.dateTime
      L6_2 = "INSERT INTO mdt_ems_bulletin (announcementId, title, description, dateTime) VALUES (?, ?, ?, ?)"
      L7_2 = {}
      L8_2 = L2_2
      L9_2 = L3_2
      L10_2 = L4_2
      L11_2 = L5_2
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L7_2[4] = L11_2
      L8_2 = MySQL
      L8_2 = L8_2.query
      L8_2 = L8_2.await
      L9_2 = L6_2
      L10_2 = L7_2
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 then
        L9_2 = L8_2.affectedRows
        if L9_2 > 0 then
          L9_2 = SendDiscordLog
          L10_2 = "ems_announcement"
          L11_2 = "\240\159\134\149 EMS Announcement Created"
          L12_2 = nil
          L13_2 = 5763719
          L14_2 = {}
          L15_2 = {}
          L15_2.name = "Title"
          L16_2 = L3_2 or L16_2
          if not L3_2 then
            L16_2 = "N/A"
          end
          L15_2.value = L16_2
          L15_2.inline = true
          L16_2 = {}
          L16_2.name = "Date"
          L17_2 = L5_2 or L17_2
          if not L5_2 then
            L17_2 = "N/A"
          end
          L16_2.value = L17_2
          L16_2.inline = true
          L17_2 = {}
          L17_2.name = "Player"
          L18_2 = FormatPlayer
          L19_2 = A0_2
          L18_2 = L18_2(L19_2)
          L17_2.value = L18_2
          L17_2.inline = false
          L14_2[1] = L15_2
          L14_2[2] = L16_2
          L14_2[3] = L17_2
          L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
          L9_2 = {}
          L9_2.success = true
          L9_2.message = "Announcement added successfully."
          return L9_2
      end
      else
        L9_2 = print
        L10_2 = "Error inserting announcement."
        L9_2(L10_2)
        L9_2 = {}
        L9_2.success = false
        L9_2.message = "Failed to add announcement."
        return L9_2
      end
  end
  else
    L2_2 = print
    L3_2 = "No data received."
    L2_2(L3_2)
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
L1_1 = "kartik-mdt:server:deleteEMSAnnouncement"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.announcementId
    if L2_2 then
      L2_2 = A1_2.announcementId
      L3_2 = "DELETE FROM mdt_ems_bulletin WHERE announcementId = ?"
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
        L7_2 = "ems_announcement"
        L8_2 = "\240\159\151\145\239\184\143 EMS Announcement Deleted"
        L9_2 = nil
        L10_2 = 15158332
        L11_2 = {}
        L12_2 = {}
        L12_2.name = "Announcement ID"
        L13_2 = L2_2 or L13_2
        if not L2_2 then
          L13_2 = "N/A"
        end
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
        L6_2.message = "Announcement deleted successfully."
        return L6_2
      else
        L6_2 = print
        L7_2 = "Delete failed or no rows affected."
        L6_2(L7_2)
        L6_2 = {}
        L6_2.success = false
        L6_2.message = "Failed to delete the announcement."
        return L6_2
      end
  end
  else
    L2_2 = print
    L3_2 = "No data received."
    L2_2(L3_2)
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
L1_1 = "kartik-mdt:server:editEMSAnnouncement"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if A1_2 then
    L2_2 = A1_2.edited
    L3_2 = L2_2.announcementId
    L4_2 = L2_2.title
    L5_2 = L2_2.description
    L6_2 = L2_2.dateTime
    L7_2 = "SELECT * FROM mdt_ems_bulletin WHERE announcementId = ?"
    L8_2 = {}
    L9_2 = L3_2
    L8_2[1] = L9_2
    L9_2 = MySQL
    L9_2 = L9_2.query
    L9_2 = L9_2.await
    L10_2 = L7_2
    L11_2 = L8_2
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = #L9_2
    if L10_2 > 0 then
      L10_2 = "UPDATE mdt_ems_bulletin SET title = ?, description = ?, dateTime = ? WHERE announcementId = ?"
      L11_2 = {}
      L12_2 = L4_2
      L13_2 = L5_2
      L14_2 = L6_2
      L15_2 = L3_2
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L11_2[3] = L14_2
      L11_2[4] = L15_2
      L12_2 = MySQL
      L12_2 = L12_2.query
      L12_2 = L12_2.await
      L13_2 = L10_2
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      L13_2 = L12_2.affectedRows
      if L13_2 > 0 then
        L13_2 = SendDiscordLog
        L14_2 = "ems_announcement"
        L15_2 = "\226\156\143\239\184\143 EMS Announcement Edited"
        L16_2 = nil
        L17_2 = 3447003
        L18_2 = {}
        L19_2 = {}
        L19_2.name = "Title"
        L20_2 = L4_2 or L20_2
        if not L4_2 then
          L20_2 = "N/A"
        end
        L19_2.value = L20_2
        L19_2.inline = true
        L20_2 = {}
        L20_2.name = "Date"
        L21_2 = L6_2 or L21_2
        if not L6_2 then
          L21_2 = "N/A"
        end
        L20_2.value = L21_2
        L20_2.inline = true
        L21_2 = {}
        L21_2.name = "Player"
        L22_2 = FormatPlayer
        L23_2 = A0_2
        L22_2 = L22_2(L23_2)
        L21_2.value = L22_2
        L21_2.inline = false
        L18_2[1] = L19_2
        L18_2[2] = L20_2
        L18_2[3] = L21_2
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
        L13_2 = {}
        L13_2.success = true
        L13_2.message = "Announcement Changed Successfully"
        return L13_2
      else
        L13_2 = print
        L14_2 = "Insertion failed or no rows affected."
        L13_2(L14_2)
        L13_2 = {}
        L13_2.success = false
        L13_2.message = "Failed to change."
        return L13_2
      end
    else
      L10_2 = {}
      L10_2.success = false
      L10_2.message = "Failed to change the announcement."
      return L10_2
    end
  else
    L2_2 = print
    L3_2 = "No data received."
    L2_2(L3_2)
    L2_2 = nil
    return L2_2
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A0_2 then
    L1_2 = A0_2.page
    if L1_2 then
      L1_2 = A0_2.limit
      if L1_2 then
        L1_2 = A0_2.page
        L2_2 = A0_2.limit
        L3_2 = L1_2 - 1
        L3_2 = L3_2 * L2_2
        L4_2 = "SELECT * FROM mdt_police_reports ORDER BY dateTime DESC LIMIT ? OFFSET ?;"
        L5_2 = {}
        L6_2 = L2_2
        L7_2 = L3_2
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L6_2 = MySQL
        L6_2 = L6_2.query
        L6_2 = L6_2.await
        L7_2 = L4_2
        L8_2 = L5_2
        L6_2 = L6_2(L7_2, L8_2)
        L7_2 = {}
        L8_2 = ipairs
        L9_2 = L6_2
        L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
        for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
          L14_2 = {}
          L15_2 = L13_2.reportId
          L14_2.reportId = L15_2
          L15_2 = L13_2.name
          if not L15_2 then
            L15_2 = ""
          end
          L14_2.reportName = L15_2
          L15_2 = L13_2.dateTime
          L14_2.dateTime = L15_2
          L15_2 = L13_2.location
          if not L15_2 then
            L15_2 = ""
          end
          L14_2.location = L15_2
          L15_2 = table
          L15_2 = L15_2.insert
          L16_2 = L7_2
          L17_2 = L14_2
          L15_2(L16_2, L17_2)
        end
        L8_2 = {}
        L8_2.reports = L7_2
        L8_2.success = true
        return L8_2
    end
  end
  else
    L1_2 = print
    L2_2 = "No data received."
    L1_2(L2_2)
    L1_2 = {}
    L1_2.success = false
    return L1_2
  end
end
fetchRecentReports = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:getRecentReports"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = fetchRecentReports
  L3_2 = A1_2
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
