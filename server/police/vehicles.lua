local L0_1, L1_1, L2_1, L3_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "^%s*(.-)%s*$"
  return L1_2(L2_2, L3_2)
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 then
    L1_2 = "SELECT * FROM mdt_vehicles WHERE plate = ?"
    L2_2 = MySQL
    L2_2 = L2_2.query
    L2_2 = L2_2.await
    L3_2 = L1_2
    L4_2 = {}
    L5_2 = A0_2
    L4_2[1] = L5_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = next
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = L2_2[1]
      L3_2 = L3_2.status
      if "bolo" == L3_2 then
        L3_2 = {}
        L3_2.success = false
        L3_2.message = "Vehicle is already marked as BOLO."
        return L3_2
      end
      L3_2 = "UPDATE mdt_vehicles SET status = 'bolo' WHERE plate = ?"
      L4_2 = MySQL
      L4_2 = L4_2.query
      L4_2 = L4_2.await
      L5_2 = L3_2
      L6_2 = {}
      L7_2 = A0_2
      L6_2[1] = L7_2
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = L4_2.affectedRows
      if L5_2 > 0 then
        L5_2 = {}
        L5_2.success = true
        L5_2.message = "Bolo added successfully"
        return L5_2
      else
        L5_2 = {}
        L5_2.success = false
        L5_2.message = "Failed to add bolo."
        return L5_2
      end
    else
      L3_2 = GetVehicleOwner
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L4_2 = "INSERT INTO mdt_vehicles (plate, status) VALUES (?, 'bolo')"
        L5_2 = MySQL
        L5_2 = L5_2.query
        L5_2 = L5_2.await
        L6_2 = L4_2
        L7_2 = {}
        L8_2 = A0_2
        L7_2[1] = L8_2
        L5_2(L6_2, L7_2)
        L5_2 = {}
        L5_2.success = true
        L5_2.message = "Bolo added successfully"
        return L5_2
      else
        L4_2 = {}
        L4_2.success = false
        L4_2.message = "Owner not found in database."
        return L4_2
      end
    end
  else
    L1_2 = {}
    L1_2.success = false
    L1_2.message = "No data received."
    return L1_2
  end
end
addBolo = L1_1
L1_1 = exports
L2_1 = "addBolo"
L3_1 = addBolo
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 then
    L1_2 = "SELECT * FROM mdt_vehicles WHERE plate = ?"
    L2_2 = MySQL
    L2_2 = L2_2.query
    L2_2 = L2_2.await
    L3_2 = L1_2
    L4_2 = {}
    L5_2 = A0_2
    L4_2[1] = L5_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = next
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = L2_2[1]
      L3_2 = L3_2.status
      if "bolo" ~= L3_2 then
        L3_2 = {}
        L3_2.success = false
        L3_2.message = "Vehicle is not marked as BOLO."
        return L3_2
      end
      L3_2 = "UPDATE mdt_vehicles SET status = 'clear' WHERE plate = ?"
      L4_2 = MySQL
      L4_2 = L4_2.query
      L4_2 = L4_2.await
      L5_2 = L3_2
      L6_2 = {}
      L7_2 = A0_2
      L6_2[1] = L7_2
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = L4_2.affectedRows
      if L5_2 > 0 then
        L5_2 = {}
        L5_2.success = true
        L5_2.message = "Bolo removed successfully"
        return L5_2
      else
        L5_2 = {}
        L5_2.success = false
        L5_2.message = "Failed to remove bolo."
        return L5_2
      end
    else
      L3_2 = GetVehicleOwner
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L4_2 = "INSERT INTO mdt_vehicles (plate, status) VALUES (?, 'clear')"
        L5_2 = MySQL
        L5_2 = L5_2.query
        L5_2 = L5_2.await
        L6_2 = L4_2
        L7_2 = {}
        L8_2 = A0_2
        L7_2[1] = L8_2
        L5_2(L6_2, L7_2)
        L5_2 = {}
        L5_2.success = true
        L5_2.message = "Bolo removed successfully"
        return L5_2
      else
        L4_2 = {}
        L4_2.success = false
        L4_2.message = "Owner not found in database."
        return L4_2
      end
    end
  else
    L1_2 = {}
    L1_2.success = false
    L1_2.message = "No data received."
    return L1_2
  end
end
clearBolo = L1_1
L1_1 = exports
L2_1 = "clearBolo"
L3_1 = clearBolo
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "kartik-mdt:server:addBolo"
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = L0_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = addBolo
  L2_2 = A0_2
  L1_2(L2_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "kartik-mdt:server:clearBolo"
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = L0_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = clearBolo
  L2_2 = A0_2
  L1_2(L2_2)
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:fetchVehicles"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A1_2 then
    L2_2 = A1_2.page
    if not L2_2 then
      L2_2 = 1
    end
    L3_2 = A1_2.query
    if not L3_2 then
      L3_2 = ""
    end
    L4_2 = L2_2 - 1
    L4_2 = L4_2 * 10
    L5_2 = 10
    L6_2 = fetchVehiclesFromPlayerTable
    L7_2 = L3_2
    L8_2 = L4_2
    L9_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = countVehiclesFromPlayerTable
    L8_2 = L3_2
    L7_2 = L7_2(L8_2)
    L8_2 = {}
    L8_2.vehiclesData = L6_2
    L8_2.totalCount = L7_2
    return L8_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:getVehicleDataByPlate"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A1_2 then
    L2_2 = A1_2.id
    L3_2 = fetchVehicleByPlate
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = {}
    L4_2.data = L3_2
    L4_2.success = true
    return L4_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:fetchVehicleDataByPlate"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A1_2 then
    L2_2 = A1_2.plate
    L3_2 = "SELECT * FROM mdt_vehicles WHERE plate = ?"
    L4_2 = {}
    L5_2 = L2_2
    L4_2[1] = L5_2
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = next
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L6_2 = "INSERT INTO mdt_vehicles (plate, status) VALUES (?, 'clear')"
      L7_2 = {}
      L8_2 = L2_2
      L7_2[1] = L8_2
      L8_2 = MySQL
      L8_2 = L8_2.query
      L8_2 = L8_2.await
      L9_2 = L6_2
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
      L8_2 = {}
      L9_2 = {}
      L9_2.plate = L2_2
      L9_2.status = "clear"
      L8_2[1] = L9_2
      L5_2 = L8_2
    end
    L6_2 = {}
    L7_2 = L5_2[1]
    L7_2 = L7_2.plate
    if not L7_2 then
      L7_2 = L2_2
    end
    L6_2.plate = L7_2
    L7_2 = L5_2[1]
    L7_2 = L7_2.status
    if not L7_2 then
      L7_2 = "clear"
    end
    L6_2.status = L7_2
    L7_2 = L5_2[1]
    L7_2 = L7_2.sightings
    if not L7_2 then
      L7_2 = ""
    end
    L6_2.sightings = L7_2
    L7_2 = L5_2[1]
    L7_2 = L7_2.photo
    L6_2.photo = L7_2
    return L6_2
  else
    L2_2 = nil
    return L2_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:fetchVehiclesStrikes"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A1_2 then
    L2_2 = A1_2.plate
    L3_2 = "SELECT * FROM mdt_vehicles_strikes WHERE plate = ?"
    L4_2 = {}
    L5_2 = L2_2
    L4_2[1] = L5_2
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = next
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L6_2 = {}
      return L6_2
    end
    return L5_2
  else
    L2_2 = {}
    return L2_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:fetchVehiclesReports"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A1_2.plate
    L3_2 = [[
            SELECT * FROM mdt_police_reports 
            WHERE JSON_CONTAINS(vehiclesInvolved, '{"plate": "]]
    L4_2 = L2_2
    L5_2 = [[
"}', '$')
        ]]
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = MySQL
    L4_2 = L4_2.query
    L4_2 = L4_2.await
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = #L4_2
      if L5_2 > 0 then
        L5_2 = {}
        L6_2 = ipairs
        L7_2 = L4_2
        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
        for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
          L12_2 = {}
          L13_2 = L11_2.reportId
          L12_2.reportId = L13_2
          L13_2 = L11_2.name
          if not L13_2 then
            L13_2 = "Unknown"
          end
          L12_2.reportName = L13_2
          L13_2 = L11_2.dateTime
          L12_2.dateTime = L13_2
          L13_2 = L11_2.peopleInvolved
          L12_2.peopleInvolved = L13_2
          L13_2 = table
          L13_2 = L13_2.insert
          L14_2 = L5_2
          L15_2 = L12_2
          L13_2(L14_2, L15_2)
        end
        return L5_2
    end
    else
      L5_2 = nil
      return L5_2
    end
  else
    L2_2 = nil
    return L2_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:updateVehicleStatus"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  if A1_2 then
    L2_2 = A1_2.plate
    if L2_2 then
      goto lbl_11
    end
  end
  L2_2 = {}
  L2_2.success = false
  L2_2.message = "No data received."
  do return L2_2 end
  ::lbl_11::
  L2_2 = A1_2.plate
  L3_2 = A1_2.status
  L4_2 = "bolo" == L3_2
  L5_2 = "UPDATE mdt_vehicles SET status = ? WHERE plate = ?"
  L6_2 = {}
  L7_2 = L3_2
  L8_2 = L2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = L5_2
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 then
    L8_2 = L7_2.affectedRows
    if 0 ~= L8_2 then
      goto lbl_39
    end
  end
  L8_2 = {}
  L8_2.success = false
  L8_2.message = "Failed to update the vehicle status."
  do return L8_2 end
  ::lbl_39::
  if L4_2 then
    L8_2 = GlobalState
    L8_2 = L8_2.wanted_vehicles
    L8_2[L2_2] = true
  else
    L8_2 = GlobalState
    L8_2 = L8_2.wanted_vehicles
    L8_2[L2_2] = nil
  end
  L8_2 = SendDiscordLog
  L9_2 = "vehicle"
  L10_2 = "\240\159\154\152 Vehicle Status Updated"
  L11_2 = nil
  L12_2 = 3447003
  L13_2 = {}
  L14_2 = {}
  L14_2.name = "Plate"
  L14_2.value = L2_2
  L14_2.inline = true
  L15_2 = {}
  L15_2.name = "New Status"
  L15_2.value = L3_2
  L15_2.inline = true
  L16_2 = {}
  L16_2.name = "Player"
  L17_2 = FormatPlayer
  L18_2 = A0_2
  L17_2 = L17_2(L18_2)
  L16_2.value = L17_2
  L16_2.inline = false
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L13_2[3] = L16_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = {}
  L8_2.success = true
  L8_2.message = "Vehicle status updated successfully."
  return L8_2
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:addVehicleReportSightings"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A1_2 then
    L2_2 = A1_2.plate
    if L2_2 then
      L2_2 = A1_2.plate
      L3_2 = json
      L3_2 = L3_2.encode
      L4_2 = A1_2.sightings
      L3_2 = L3_2(L4_2)
      L4_2 = "UPDATE mdt_vehicles SET sightings = ? WHERE plate = ?"
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
        L8_2 = "vehicle"
        L9_2 = "\240\159\145\129\239\184\143 Vehicle Sightings Added"
        L10_2 = nil
        L11_2 = 10181046
        L12_2 = {}
        L13_2 = {}
        L13_2.name = "Plate"
        L13_2.value = L2_2
        L13_2.inline = true
        L14_2 = {}
        L14_2.name = "Sightings Count"
        L15_2 = tostring
        L16_2 = A1_2.sightings
        L16_2 = #L16_2
        if not L16_2 then
          L16_2 = 0
        end
        L15_2 = L15_2(L16_2)
        L14_2.value = L15_2
        L14_2.inline = true
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
        L7_2.message = "sightings inserted successfully."
        return L7_2
      else
        L7_2 = {}
        L7_2.success = false
        L7_2.message = "Failed to insert the sightings."
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
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:updateVehiclePhoto"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A1_2 then
    L2_2 = A1_2.plate
    L3_2 = A1_2.photo
    L4_2 = "UPDATE mdt_vehicles SET photo = ? WHERE plate = ?"
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
      L8_2 = "vehicle"
      L9_2 = "\240\159\147\183 Vehicle Photo Updated"
      L10_2 = nil
      L11_2 = 16763904
      L12_2 = {}
      L13_2 = {}
      L13_2.name = "Plate"
      L13_2.value = L2_2
      L13_2.inline = true
      L14_2 = {}
      L14_2.name = "Player"
      L15_2 = FormatPlayer
      L16_2 = A0_2
      L15_2 = L15_2(L16_2)
      L14_2.value = L15_2
      L14_2.inline = false
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      L7_2 = {}
      L7_2.success = true
      L7_2.message = "Photo Changed Successfully"
      return L7_2
    else
      L7_2 = {}
      L7_2.success = false
      L7_2.message = "Failed to change."
      return L7_2
    end
  else
    L2_2 = false
    return L2_2
  end
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT plate, status FROM mdt_vehicles WHERE plate = @plate"
  L3_2 = {}
  L3_2["@plate"] = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = L1_2[1]
    if L2_2 then
      L2_2 = L1_2[1]
      L2_2 = L2_2.status
      if "bolo" == L2_2 then
        L3_2 = true
        return L3_2
      end
      L3_2 = false
      return L3_2
    end
  end
end
GetBoloStatus = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 then
    L1_2 = MySQL
    L1_2 = L1_2.query
    L1_2 = L1_2.await
    L2_2 = "SELECT warrant FROM mdt_profiles WHERE citizenid = @citizenId"
    L3_2 = {}
    L3_2["@citizenId"] = A0_2
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      L2_2 = L1_2[1]
      if L2_2 then
        L2_2 = L1_2[1]
        L2_2 = L2_2.warrant
        if 1 == L2_2 then
          L3_2 = true
          return L3_2
        end
        L3_2 = false
        return L3_2
      end
    end
  end
end
GetWarrantStatus = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT plate FROM mdt_vehicles WHERE status = ?"
  L2_2 = {}
  L3_2 = "bolo"
  L2_2[1] = L3_2
  L0_2 = L0_2(L1_2, L2_2)
  if L0_2 then
    L1_2 = #L0_2
    if 0 ~= L1_2 then
      goto lbl_18
    end
  end
  L1_2 = {}
  do return L1_2 end
  ::lbl_18::
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.plate
    L1_2[L8_2] = true
  end
  return L1_2
end
GetWantedVehicles = L1_1
L1_1 = CreateThread
function L2_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 10000
  L0_2(L1_2)
  L0_2 = GlobalState
  L1_2 = GetWantedVehicles
  L1_2 = L1_2()
  L0_2.wanted_vehicles = L1_2
end
L1_1(L2_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:addVehicleStrike"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  if A1_2 then
    L2_2 = A1_2.plate
    if L2_2 then
      L2_2 = A1_2.strike
      if L2_2 then
        goto lbl_11
      end
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_11::
  L2_2 = A1_2.plate
  L3_2 = A1_2.strike
  L4_2 = L3_2.points
  if not L4_2 then
    L3_2.points = 1
  end
  L4_2 = type
  L5_2 = L3_2.points
  L4_2 = L4_2(L5_2)
  if "number" ~= L4_2 then
    L4_2 = tonumber
    L5_2 = L3_2.points
    L4_2 = L4_2(L5_2)
    L3_2.points = L4_2
  end
  L4_2 = math
  L4_2 = L4_2.floor
  L5_2 = L3_2.points
  L4_2 = L4_2(L5_2)
  L3_2.points = L4_2
  L4_2 = Config
  L4_2 = L4_2.VehicleStrikePoints
  if not L4_2 then
    L4_2 = 10
  end
  L5_2 = L3_2.points
  if L5_2 < 1 then
    L3_2.points = 1
  end
  L5_2 = L3_2.points
  if L4_2 < L5_2 then
    L3_2.points = L4_2
  end
  L5_2 = L3_2.expiryDate
  if not L5_2 then
    L5_2 = os
    L5_2 = L5_2.date
    L6_2 = "%Y-%m-%dT%H:%M:%S.000Z"
    L7_2 = os
    L7_2 = L7_2.time
    L7_2 = L7_2()
    L7_2 = L7_2 + 2592000
    L5_2 = L5_2(L6_2, L7_2)
    L3_2.expiryDate = L5_2
  end
  L5_2 = L3_2.reason
  if L5_2 then
    L5_2 = L3_2.location
    if L5_2 then
      L5_2 = L3_2.status
      if L5_2 then
        goto lbl_68
      end
    end
  end
  L5_2 = false
  do return L5_2 end
  ::lbl_68::
  L5_2 = L3_2.reason
  L6_2 = L3_2.points
  L7_2 = L3_2.issuingOfficer
  L8_2 = L3_2.location
  L9_2 = L3_2.status
  L10_2 = L3_2.expiryDate
  L11_2 = "INSERT INTO mdt_vehicles_strikes (plate, points, reason, issuingOfficer, location, status, expiryDate) VALUES (?, ?, ?, ?, ?, ?, ?)"
  L12_2 = MySQL
  L12_2 = L12_2.query
  L12_2 = L12_2.await
  L13_2 = L11_2
  L14_2 = {}
  L15_2 = L2_2
  L16_2 = L6_2
  L17_2 = L5_2
  L18_2 = L7_2
  L19_2 = L8_2
  L20_2 = L9_2
  L21_2 = L10_2
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L14_2[4] = L18_2
  L14_2[5] = L19_2
  L14_2[6] = L20_2
  L14_2[7] = L21_2
  L12_2(L13_2, L14_2)
  L12_2 = SendDiscordLog
  L13_2 = "vehicle"
  L14_2 = "\240\159\154\168 Vehicle Strike Issued"
  L15_2 = nil
  L16_2 = 16733525
  L17_2 = {}
  L18_2 = {}
  L18_2.name = "Plate"
  L18_2.value = L2_2
  L18_2.inline = true
  L19_2 = {}
  L19_2.name = "Reason"
  L20_2 = L5_2 or L20_2
  if not L5_2 then
    L20_2 = "N/A"
  end
  L19_2.value = L20_2
  L19_2.inline = true
  L20_2 = {}
  L20_2.name = "Points"
  L21_2 = tostring
  L22_2 = L6_2
  L21_2 = L21_2(L22_2)
  L20_2.value = L21_2
  L20_2.inline = true
  L21_2 = {}
  L21_2.name = "Location"
  L22_2 = L8_2 or L22_2
  if not L8_2 then
    L22_2 = "Unknown"
  end
  L21_2.value = L22_2
  L21_2.inline = true
  L22_2 = {}
  L22_2.name = "Status"
  L23_2 = L9_2 or L23_2
  if not L9_2 then
    L23_2 = "pending"
  end
  L22_2.value = L23_2
  L22_2.inline = true
  L23_2 = {}
  L23_2.name = "Expires"
  L24_2 = L10_2 or L24_2
  if not L10_2 then
    L24_2 = "N/A"
  end
  L23_2.value = L24_2
  L23_2.inline = true
  L24_2 = {}
  L24_2.name = "Player"
  L25_2 = FormatPlayer
  L26_2 = A0_2
  L25_2 = L25_2(L26_2)
  L24_2.value = L25_2
  L24_2.inline = false
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L17_2[4] = L21_2
  L17_2[5] = L22_2
  L17_2[6] = L23_2
  L17_2[7] = L24_2
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = true
  return L12_2
end
L1_1(L2_1, L3_1)
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "kartik-mdt:server:updateVehicleStrike"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if A1_2 then
    L2_2 = A1_2.plate
    if L2_2 then
      L2_2 = A1_2.strikeId
      if L2_2 then
        L2_2 = A1_2.updatedStrike
        if L2_2 then
          goto lbl_14
        end
      end
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_14::
  L2_2 = A1_2.plate
  L3_2 = A1_2.strikeId
  L4_2 = A1_2.updatedStrike
  L5_2 = L4_2.status
  L6_2 = L4_2.dismissalReason
  L7_2 = L4_2.dismissalDate
  L8_2 = L4_2.dismissedBy
  L9_2 = "UPDATE mdt_vehicles_strikes SET status = ?, dismissalReason = ?, dismissalDate = ?, dismissedBy = ? WHERE id = ?"
  L10_2 = MySQL
  L10_2 = L10_2.query
  L10_2 = L10_2.await
  L11_2 = L9_2
  L12_2 = {}
  L13_2 = L5_2
  L14_2 = L6_2
  L15_2 = L7_2
  L16_2 = L8_2
  L17_2 = L3_2
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L12_2[4] = L16_2
  L12_2[5] = L17_2
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = L10_2.affectedRows
  if L11_2 > 0 then
    L11_2 = SendDiscordLog
    L12_2 = "vehicle"
    L13_2 = "\226\156\133 Vehicle Strike Updated"
    L14_2 = nil
    L15_2 = 8311585
    L16_2 = {}
    L17_2 = {}
    L17_2.name = "Strike ID"
    L18_2 = tostring
    L19_2 = L3_2
    L18_2 = L18_2(L19_2)
    L17_2.value = L18_2
    L17_2.inline = true
    L18_2 = {}
    L18_2.name = "New Status"
    L19_2 = L5_2 or L19_2
    if not L5_2 then
      L19_2 = "N/A"
    end
    L18_2.value = L19_2
    L18_2.inline = true
    L19_2 = {}
    L19_2.name = "Dismissed By"
    L20_2 = L8_2 or L20_2
    if not L8_2 then
      L20_2 = "N/A"
    end
    L19_2.value = L20_2
    L19_2.inline = true
    L20_2 = {}
    L20_2.name = "Dismissal Reason"
    L21_2 = L6_2 or L21_2
    if not L6_2 then
      L21_2 = "None"
    end
    L20_2.value = L21_2
    L20_2.inline = false
    L21_2 = {}
    L21_2.name = "Player"
    L22_2 = FormatPlayer
    L23_2 = A0_2
    L22_2 = L22_2(L23_2)
    L21_2.value = L22_2
    L21_2.inline = false
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L16_2[4] = L20_2
    L16_2[5] = L21_2
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    L11_2 = true
    return L11_2
  else
    L11_2 = false
    return L11_2
  end
end
L1_1(L2_1, L3_1)
