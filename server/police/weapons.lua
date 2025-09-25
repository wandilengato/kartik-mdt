local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:fetchWeapons"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = A1_2.page
    L4_2 = A1_2.query
    if not L4_2 then
      L4_2 = ""
    end
    L5_2 = L3_2 - 1
    L5_2 = L5_2 * 10
    L6_2 = [[
            SELECT COUNT(*) as total FROM mdt_weapons
            WHERE (citizenId LIKE ? OR serialNumber LIKE ?)
        ]]
    L7_2 = "%"
    L8_2 = L4_2
    L9_2 = "%"
    L7_2 = L7_2 .. L8_2 .. L9_2
    L8_2 = {}
    L9_2 = L7_2
    L10_2 = L7_2
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = MySQL
    L9_2 = L9_2.query
    L9_2 = L9_2.await
    L10_2 = L6_2
    L11_2 = L8_2
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = L9_2[1]
    if L10_2 then
      L10_2 = L9_2[1]
      L10_2 = L10_2.total
      if L10_2 then
        goto lbl_37
      end
    end
    L10_2 = 0
    ::lbl_37::
    L11_2 = [[
            SELECT * FROM mdt_weapons
            WHERE (citizenId LIKE ? OR serialNumber LIKE ?)
            LIMIT 10 OFFSET ?
        ]]
    L12_2 = {}
    L13_2 = L7_2
    L14_2 = L7_2
    L15_2 = L5_2
    L12_2[1] = L13_2
    L12_2[2] = L14_2
    L12_2[3] = L15_2
    L13_2 = MySQL
    L13_2 = L13_2.query
    L13_2 = L13_2.await
    L14_2 = L11_2
    L15_2 = L12_2
    L13_2 = L13_2(L14_2, L15_2)
    L14_2 = ipairs
    L15_2 = L13_2
    L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
    for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
      L20_2 = L19_2.citizenId
      L21_2 = pcall
      function L22_2()
        local L0_3, L1_3
        L0_3 = GetOfflinePlayerByCitizenId
        L1_3 = L20_2
        return L0_3(L1_3)
      end
      L21_2, L22_2 = L21_2(L22_2)
      L23_2 = L13_2[L18_2]
      if L21_2 and L22_2 then
        L24_2 = L22_2.name
        if L24_2 then
          goto lbl_67
        end
      end
      L24_2 = "Unknown"
      ::lbl_67::
      L23_2.ownerName = L24_2
    end
    L14_2 = {}
    L14_2.totalCount = L10_2
    L14_2.weapons = L13_2
    return L14_2
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
L1_1 = "kartik-mdt:server:fetchWeaponDataBySerialNumber"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = A1_2.serialNumber
    L4_2 = MySQL
    L4_2 = L4_2.query
    L4_2 = L4_2.await
    L5_2 = "SELECT * FROM mdt_weapons WHERE serialNumber = ?"
    L6_2 = {}
    L7_2 = L3_2
    L6_2[1] = L7_2
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = {}
    L5_2.success = true
    L5_2.message = "Weapon fetched successfully."
    L5_2.weaponData = L4_2
    return L5_2
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
L1_1 = "kartik-mdt:server:updateWeapon"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A0_2
    A1_2 = A1_2.weapon
    L3_2 = A1_2.serialNumber
    L4_2 = A1_2.image
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = "UPDATE mdt_weapons SET image = ? WHERE serialNumber = ?"
    L7_2 = {}
    L8_2 = L4_2
    L9_2 = L3_2
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = SendDiscordLog
    L7_2 = "weapon"
    L8_2 = "\240\159\155\160\239\184\143 Weapon Image Updated"
    L9_2 = nil
    L10_2 = 15844367
    L11_2 = {}
    L12_2 = {}
    L12_2.name = "Serial Number"
    L13_2 = L3_2 or L13_2
    if not L3_2 then
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
    L6_2.message = "Weapon updated successfully."
    L6_2.weaponData = L5_2
    return L6_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:deleteWeapon"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = A1_2.id
    L4_2 = MySQL
    L4_2 = L4_2.query
    L4_2 = L4_2.await
    L5_2 = "DELETE FROM mdt_weapons WHERE serialNumber = ?"
    L6_2 = {}
    L7_2 = L3_2
    L6_2[1] = L7_2
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = SendDiscordLog
    L6_2 = "weapon"
    L7_2 = "\240\159\151\145\239\184\143 Weapon Deleted"
    L8_2 = nil
    L9_2 = 15158332
    L10_2 = {}
    L11_2 = {}
    L11_2.name = "Serial Number"
    L12_2 = L3_2 or L12_2
    if not L3_2 then
      L12_2 = "N/A"
    end
    L11_2.value = L12_2
    L11_2.inline = true
    L12_2 = {}
    L12_2.name = "Player"
    L13_2 = FormatPlayer
    L14_2 = A0_2
    L13_2 = L13_2(L14_2)
    L12_2.value = L13_2
    L12_2.inline = false
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    L5_2 = {}
    L5_2.success = true
    L5_2.message = "Weapon deleted successfully."
    L5_2.weaponData = L4_2
    return L5_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:addWeapon"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if A1_2 then
    A1_2 = A1_2.weapon
    L2_2 = A1_2.serialNumber
    L3_2 = MySQL
    L3_2 = L3_2.query
    L3_2 = L3_2.await
    L4_2 = "SELECT * FROM mdt_weapons WHERE serialNumber = ?"
    L5_2 = {}
    L6_2 = L2_2
    L5_2[1] = L6_2
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = #L3_2
    if L4_2 > 0 then
      L4_2 = {}
      L4_2.success = false
      L4_2.message = "Weapon already exists."
      return L4_2
    else
      L4_2 = A1_2.image
      L5_2 = A1_2.weaponName
      L6_2 = A1_2.citizenId
      L7_2 = MySQL
      L7_2 = L7_2.query
      L7_2 = L7_2.await
      L8_2 = "INSERT INTO mdt_weapons (serialNumber, image, weaponName, citizenId) VALUES (?, ?, ?, ?)"
      L9_2 = {}
      L10_2 = L2_2
      L11_2 = L4_2
      L12_2 = L5_2
      L13_2 = L6_2
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L9_2[4] = L13_2
      L7_2 = L7_2(L8_2, L9_2)
      L8_2 = SendDiscordLog
      L9_2 = "weapon"
      L10_2 = "\240\159\148\171 Weapon Added"
      L11_2 = nil
      L12_2 = 5763719
      L13_2 = {}
      L14_2 = {}
      L14_2.name = "Serial Number"
      L15_2 = L2_2 or L15_2
      if not L2_2 then
        L15_2 = "N/A"
      end
      L14_2.value = L15_2
      L14_2.inline = true
      L15_2 = {}
      L15_2.name = "Weapon Name"
      L16_2 = L5_2 or L16_2
      if not L5_2 then
        L16_2 = "N/A"
      end
      L15_2.value = L16_2
      L15_2.inline = true
      L16_2 = {}
      L16_2.name = "Citizen ID"
      L17_2 = L6_2 or L17_2
      if not L6_2 then
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
      L13_2[1] = L14_2
      L13_2[2] = L15_2
      L13_2[3] = L16_2
      L13_2[4] = L17_2
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
      L8_2 = {}
      L8_2.success = true
      L8_2.message = "Weapon added successfully."
      L8_2.weaponData = L7_2
      return L8_2
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "kartik-mdt:server:updateWeaponImage"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 then
    L2_2 = A0_2
    L3_2 = A1_2.serialNumber
    L4_2 = A1_2.photo
    L5_2 = MySQL
    L5_2 = L5_2.query
    L5_2 = L5_2.await
    L6_2 = "UPDATE mdt_weapons SET image = ? WHERE serialNumber = ?"
    L7_2 = {}
    L8_2 = L4_2
    L9_2 = L3_2
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = SendDiscordLog
    L7_2 = "weapon"
    L8_2 = "\240\159\155\160\239\184\143 Weapon Image Updated"
    L9_2 = nil
    L10_2 = 15844367
    L11_2 = {}
    L12_2 = {}
    L12_2.name = "Serial Number"
    L13_2 = L3_2 or L13_2
    if not L3_2 then
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
    L6_2.message = "Weapon updated successfully."
    L6_2.weaponData = L5_2
    return L6_2
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = "SELECT * FROM mdt_weapons WHERE serialNumber = ?"
  L6_2 = {}
  L7_2 = A0_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2[1]
  if L5_2 then
    return
  end
  if nil == A0_2 then
    return
  end
  if nil == A1_2 then
    A1_2 = "https://kappa.lol/hObsm7"
  end
  L5_2 = MySQL
  L5_2 = L5_2.Async
  L5_2 = L5_2.insert
  L6_2 = "INSERT INTO mdt_weapons (serialNumber, citizenId, weaponName, image) VALUES (:serialNumber, :citizenId, :weaponName, :image) ON DUPLICATE KEY UPDATE citizenId = :citizenId, weaponName = :weaponName, image = :image"
  L7_2 = {}
  L7_2.serialNumber = A0_2
  L7_2.citizenId = A2_2
  L7_2.weaponName = A3_2
  L7_2.image = A1_2
  L5_2(L6_2, L7_2)
end
CreateWeaponInfo = L0_1
L0_1 = exports
L1_1 = "CreateWeaponInfo"
L2_1 = CreateWeaponInfo
L0_1(L1_1, L2_1)
