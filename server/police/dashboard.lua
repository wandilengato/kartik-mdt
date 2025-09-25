local L0_1, L1_1, L2_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = "SELECT COUNT(*) as total FROM mdt_police_bulletin"
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = L1_2
  L4_2 = {}
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L2_2[1]
  if L3_2 then
    L3_2 = L2_2[1]
    L3_2 = L3_2.total
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = 0
  ::lbl_17::
  L4_2 = false
  if A0_2 then
    L5_2 = A0_2.page
    if L5_2 then
      L5_2 = A0_2.limit
      if L5_2 then
        L5_2 = A0_2.page
        L6_2 = A0_2.limit
        L7_2 = L5_2 - 1
        L7_2 = L7_2 * L6_2
        L8_2 = "SELECT * FROM mdt_police_bulletin LIMIT ? OFFSET ?"
        L9_2 = {}
        L10_2 = L6_2
        L11_2 = L7_2
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L10_2 = MySQL
        L10_2 = L10_2.query
        L10_2 = L10_2.await
        L11_2 = L8_2
        L12_2 = L9_2
        L10_2 = L10_2(L11_2, L12_2)
        L11_2 = L5_2 * L6_2
        L4_2 = L3_2 > L11_2
        if L10_2 then
          L11_2 = {}
          L11_2.success = true
          L11_2.announcements = L10_2
          L11_2.message = ""
          L11_2.hasMore = L4_2
          return L11_2
        else
          L11_2 = {}
          L11_2.success = false
          L11_2.message = "No announcements found."
          return L11_2
        end
    end
  end
  else
    L5_2 = nil
    return L5_2
  end
end
fetchAnnouncements = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchAnnouncements"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = fetchAnnouncements
  L3_2 = A1_2
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:initPoliceDashboard"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = fetchAnnouncements
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L3_2 = fetchWarrants
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L4_2 = fetchRecentReports
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = {}
  end
  L5_2 = fetchWantedVehicles
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L6_2 = {}
  L7_2 = L2_2 or L7_2
  if not L2_2 then
    L7_2 = {}
  end
  L6_2.announcements = L7_2
  L7_2 = L3_2 or L7_2
  if not L3_2 then
    L7_2 = {}
  end
  L6_2.warrantsData = L7_2
  L7_2 = L4_2 or L7_2
  if not L4_2 then
    L7_2 = {}
  end
  L6_2.reports = L7_2
  L7_2 = L5_2 or L7_2
  if not L5_2 then
    L7_2 = {}
  end
  L6_2.vehiclesData = L7_2
  return L6_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:addAnnouncement"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  if A1_2 then
    L2_2 = A1_2.announcementToAdd
    if L2_2 then
      A1_2 = A1_2.announcementToAdd
      L2_2 = A1_2.announcementId
      L3_2 = A1_2.title
      L4_2 = A1_2.description
      L5_2 = A1_2.dateTime
      L6_2 = "INSERT INTO mdt_police_bulletin (announcementId, title, description, dateTime) VALUES (?, ?, ?, ?)"
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
          L10_2 = "pd_announcement"
          L11_2 = "\240\159\147\162 New Announcement Added"
          L12_2 = nil
          L13_2 = 8311585
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
          L16_2.name = "Posted At"
          L17_2 = L5_2 or L17_2
          if not L5_2 then
            L17_2 = os
            L17_2 = L17_2.date
            L18_2 = "%Y-%m-%d %H:%M:%S"
            L17_2 = L17_2(L18_2)
          end
          L16_2.value = L17_2
          L16_2.inline = true
          L17_2 = {}
          L17_2.name = "Player"
          L18_2 = string
          L18_2 = L18_2.format
          L19_2 = "%s (source: %d)"
          L20_2 = GetPlayerName
          L21_2 = A0_2
          L20_2 = L20_2(L21_2)
          if not L20_2 then
            L20_2 = "Unknown"
          end
          L21_2 = A0_2
          L18_2 = L18_2(L19_2, L20_2, L21_2)
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
        L9_2 = {}
        L9_2.success = false
        L9_2.message = "Failed to add announcement."
        return L9_2
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
L1_1 = "kartik-mdt:server:deleteAnnouncement"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A1_2 then
    L2_2 = A1_2.announcementId
    if L2_2 then
      L2_2 = A1_2.announcementId
      L3_2 = "DELETE FROM mdt_police_bulletin WHERE announcementId = ?"
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
        L7_2 = "pd_announcement"
        L8_2 = "\240\159\151\145\239\184\143 Announcement Deleted"
        L9_2 = nil
        L10_2 = 15158332
        L11_2 = {}
        L12_2 = {}
        L12_2.name = "Announcement ID"
        L13_2 = tostring
        L14_2 = L2_2
        L13_2 = L13_2(L14_2)
        L12_2.value = L13_2
        L12_2.inline = true
        L13_2 = {}
        L13_2.name = "Player"
        L14_2 = string
        L14_2 = L14_2.format
        L15_2 = "%s (source: %d)"
        L16_2 = GetPlayerName
        L17_2 = A0_2
        L16_2 = L16_2(L17_2)
        if not L16_2 then
          L16_2 = "Unknown"
        end
        L17_2 = A0_2
        L14_2 = L14_2(L15_2, L16_2, L17_2)
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
        L6_2 = {}
        L6_2.success = false
        L6_2.message = "Failed to delete the announcement."
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
L1_1 = "kartik-mdt:server:editAnnouncement"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  if A1_2 then
    L2_2 = A1_2.edited
    L3_2 = L2_2.announcementId
    L4_2 = L2_2.title
    L5_2 = L2_2.description
    L6_2 = L2_2.dateTime
    L7_2 = "SELECT * FROM mdt_police_bulletin WHERE announcementId = ?"
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
      L10_2 = "UPDATE mdt_police_bulletin SET title = ?, description = ?, dateTime = ? WHERE announcementId = ?"
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
        L14_2 = "pd_announcement"
        L15_2 = "\226\156\143\239\184\143 Announcement Edited"
        L16_2 = nil
        L17_2 = 3447003
        L18_2 = {}
        L19_2 = {}
        L19_2.name = "Announcement ID"
        L20_2 = tostring
        L21_2 = L3_2
        L20_2 = L20_2(L21_2)
        L19_2.value = L20_2
        L19_2.inline = true
        L20_2 = {}
        L20_2.name = "New Title"
        L21_2 = L4_2 or L21_2
        if not L4_2 then
          L21_2 = "N/A"
        end
        L20_2.value = L21_2
        L20_2.inline = true
        L21_2 = {}
        L21_2.name = "New Date"
        L22_2 = L6_2 or L22_2
        if not L6_2 then
          L22_2 = os
          L22_2 = L22_2.date
          L23_2 = "%Y-%m-%d %H:%M:%S"
          L22_2 = L22_2(L23_2)
        end
        L21_2.value = L22_2
        L21_2.inline = true
        L22_2 = {}
        L22_2.name = "Player"
        L23_2 = string
        L23_2 = L23_2.format
        L24_2 = "%s (source: %d)"
        L25_2 = GetPlayerName
        L26_2 = A0_2
        L25_2 = L25_2(L26_2)
        if not L25_2 then
          L25_2 = "Unknown"
        end
        L26_2 = A0_2
        L23_2 = L23_2(L24_2, L25_2, L26_2)
        L22_2.value = L23_2
        L22_2.inline = false
        L18_2[1] = L19_2
        L18_2[2] = L20_2
        L18_2[3] = L21_2
        L18_2[4] = L22_2
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
        L13_2 = {}
        L13_2.success = true
        L13_2.message = "Announcement Changed Successfully"
        return L13_2
      else
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
    L2_2 = nil
    return L2_2
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L1_2 = A0_2.page
    if L1_2 then
      L1_2 = A0_2.limit
      if L1_2 then
        L1_2 = A0_2.page
        L2_2 = A0_2.limit
        L3_2 = L1_2 - 1
        L3_2 = L3_2 * L2_2
        L4_2 = fetchWarrantsWithPlayers
        L5_2 = L2_2
        L6_2 = L3_2
        L4_2 = L4_2(L5_2, L6_2)
        L5_2 = {}
        L5_2.warrantsData = L4_2
        L5_2.success = true
        return L5_2
      end
    end
  end
end
fetchWarrants = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchActiveWarrants"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = fetchWarrants
  L3_2 = A1_2
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L1_2 = A0_2.page
    if L1_2 then
      L1_2 = A0_2.limit
      if L1_2 then
        L1_2 = A0_2.page
        L2_2 = A0_2.limit
        L3_2 = L1_2 - 1
        L3_2 = L3_2 * L2_2
        L4_2 = fetchWantedVehiclesWithPlayers
        L5_2 = L2_2
        L6_2 = L3_2
        L4_2 = L4_2(L5_2, L6_2)
        L5_2 = {}
        L5_2.vehiclesData = L4_2
        L5_2.success = true
        return L5_2
      end
    end
  end
end
fetchWantedVehicles = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchWantedVehicles"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = fetchWantedVehicles
  L3_2 = A1_2
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
