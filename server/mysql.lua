local L0_1, L1_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
if "kartik-mdt" ~= L0_1 then
  return
end
L0_1 = MySQL
L0_1 = L0_1.ready
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L0_2 = nil
  L1_2 = nil
  L2_2 = nil
  L3_2 = nil
  L4_2 = pcall
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = [[
        SELECT CHARACTER_MAXIMUM_LENGTH AS maxLen, COLLATION_NAME AS collation
        FROM information_schema.columns
        WHERE table_schema = DATABASE() AND table_name = 'player_vehicles' AND column_name = 'plate'
    ]]
  L4_2, L5_2 = L4_2(L5_2, L6_2)
  L3_2 = L5_2
  L2_2 = L4_2
  L4_2 = nil
  L5_2 = nil
  if L2_2 then
    L6_2 = L3_2[1]
    if L6_2 then
      L6_2 = L3_2[1]
      L4_2 = L6_2.collation
      L6_2 = L3_2[1]
      L5_2 = L6_2.maxLen
  end
  else
    L4_2 = "utf8mb4_unicode_ci"
    L5_2 = 50
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_criminal_codes` (
            `id` varchar(50) NOT NULL,
            `title` longtext NOT NULL,
            `description` longtext NOT NULL,
            `category` longtext NOT NULL,
            `fine` int(11) NOT NULL DEFAULT 0,
            `sentence` int(11) NOT NULL DEFAULT 0,
            `additonalPenalties` longtext DEFAULT NULL,
            `changeHistory` longtext DEFAULT NULL,
            PRIMARY KEY (`id`)
        )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_criminal_codes`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_ems_bulletin` (
            `announcementId` varchar(50) NOT NULL,
            `title` longtext NOT NULL,
            `description` longtext NOT NULL,
            `dateTime` varchar(50) NOT NULL,
            PRIMARY KEY (`announcementId`) USING BTREE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_ems_bulletin`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_ems_reports` (
            `reportId` int(11) NOT NULL AUTO_INCREMENT,
            `name` longtext NOT NULL,
            `medicId` varchar(50) NOT NULL DEFAULT '',
            `category` varchar(100) NOT NULL DEFAULT '',
            `location` varchar(255) DEFAULT '',
            `description` longtext NOT NULL,
            `dateTime` varchar(50) NOT NULL DEFAULT '',
            `evidences` longtext DEFAULT NULL,
            `peopleInvolved` longtext DEFAULT NULL,
            `vehiclesInvolved` longtext DEFAULT NULL,
            PRIMARY KEY (`reportId`) USING BTREE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_ems_reports`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_ems_incidents` (
            `incidentId` int(11) NOT NULL AUTO_INCREMENT,
            `title` longtext NOT NULL,
            `location` varchar(255) DEFAULT '',
            `description` longtext NOT NULL,
            `dateTime` varchar(50) NOT NULL DEFAULT '',
            `status` varchar(50) NOT NULL DEFAULT '',
            `priority` varchar(50) NOT NULL DEFAULT '',
            `evidences` longtext DEFAULT '[]',
            `peopleInvolved` longtext DEFAULT '[]',
            `vehiclesInvolved` longtext DEFAULT '[]',
            `timeline` longtext DEFAULT '[]',
            PRIMARY KEY (`incidentId`) USING BTREE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_ems_incidents`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_police_bulletin` (
            `announcementId` varchar(50) NOT NULL,
            `title` longtext NOT NULL,
            `description` longtext NOT NULL,
            `dateTime` varchar(50) NOT NULL,
            PRIMARY KEY (`announcementId`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_police_bulletin`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_vehicles_strikes` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `plate` varchar(50) NOT NULL,
            `reason` longtext DEFAULT NULL,
            `points` int(11) NOT NULL DEFAULT 0,
            `issuingOfficer` longtext DEFAULT NULL,
            `location` longtext DEFAULT NULL,
            `status` longtext NOT NULL,
            `date` datetime DEFAULT current_timestamp(),
            `expiryDate` longtext NOT NULL,
            `dismissalReason` longtext DEFAULT NULL,
            `dismissalDate` longtext DEFAULT NULL,
            `dismissedBy` longtext DEFAULT NULL,
            PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_vehicles_strikes`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_police_reports` (
            `reportId` int(11) NOT NULL AUTO_INCREMENT,
            `name` longtext NOT NULL,
            `category` varchar(100) NOT NULL DEFAULT '',
            `officerId` varchar(50) NOT NULL DEFAULT '',
            `location` varchar(255) DEFAULT '',
            `description` longtext NOT NULL,
            `dateTime` varchar(50) NOT NULL DEFAULT '',
            `evidences` longtext DEFAULT NULL,
            `peopleInvolved` longtext DEFAULT NULL,
            `vehiclesInvolved` longtext DEFAULT NULL,
            PRIMARY KEY (`reportId`) USING BTREE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_police_reports`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_police_incidents` (
            `incidentId` int(11) NOT NULL AUTO_INCREMENT,
            `title` longtext NOT NULL,
            `location` varchar(255) DEFAULT '',
            `description` longtext NOT NULL,
            `dateTime` varchar(50) NOT NULL DEFAULT '',
            `status` varchar(50) NOT NULL DEFAULT '',
            `priority` varchar(50) NOT NULL DEFAULT '',
            `evidences` longtext DEFAULT '[]',
            `peopleInvolved` longtext DEFAULT '[]',
            `vehiclesInvolved` longtext DEFAULT '[]',
            `timeline` longtext DEFAULT '[]',
            PRIMARY KEY (`incidentId`) USING BTREE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_police_incidents`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_profiles` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `citizenid` varchar(100) NOT NULL,
            `warrant` int(11) NOT NULL DEFAULT 0,
            `isDangerous` int(11) NOT NULL DEFAULT 0,
            `notes` longtext DEFAULT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_profiles`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_fake_profiles` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `citizenid` varchar(100) NOT NULL,
            `firstname` varchar(50) NOT NULL,
            `lastname` varchar(50) NOT NULL,
            `gender` varchar(10) NOT NULL,
            `nationality` varchar(50) NOT NULL,
            `birthdate` varchar(50) NOT NULL,
            `photo` longtext DEFAULT NULL,
            `bankAccount` varchar(50) DEFAULT NULL,
            `phoneNumber` varchar(50) DEFAULT NULL,
            `job` varchar(50) DEFAULT NULL,
            PRIMARY KEY (`id`),
            UNIQUE KEY `citizenid` (`citizenid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_fake_profiles`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_profiles`
        ADD COLUMN `fingerprint` longtext DEFAULT NULL,
        ADD COLUMN `dna` longtext DEFAULT NULL;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_units` (
            `id` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
            `callsign` varchar(50) DEFAULT NULL,
            `citizenid` varchar(100) DEFAULT NULL,
            `department` varchar(50) DEFAULT 'police',
            `currentAssignments` longtext DEFAULT '[]',
            `totalHours` decimal(20,6) DEFAULT 0.000000,
            `dutyRecords` longtext DEFAULT '[]',
            `serviceHistory` longtext DEFAULT '[]',
            `status` enum('off-duty','on-duty') NOT NULL DEFAULT 'off-duty',
            `isFired` int(1) DEFAULT 0,
            PRIMARY KEY (`id`),
            UNIQUE KEY `citizenid` (`citizenid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_units`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
            CREATE TABLE IF NOT EXISTS `mdt_ems_fto_reports` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `trainee_name` varchar(255) NOT NULL DEFAULT '0',
                `fto_name` varchar(255) NOT NULL DEFAULT '0',
                `date` varchar(255) NOT NULL DEFAULT '0',
                `shift` varchar(50) NOT NULL DEFAULT '0',
                `phase` int(11) DEFAULT 1,
                `categories` longtext NOT NULL,
                `overall_performance` int(11) NOT NULL DEFAULT 0,
                `strengths` longtext NOT NULL,
                `areas_for_improvement` longtext NOT NULL,
                `additional_comments` longtext NOT NULL,
                `status` longtext NOT NULL,
                `rejection_reason` longtext DEFAULT NULL,
                PRIMARY KEY (`id`) USING BTREE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_ems_fto_reports`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
            CREATE TABLE IF NOT EXISTS `mdt_police_fto_reports` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `trainee_name` varchar(255) NOT NULL DEFAULT '0',
                `fto_name` varchar(255) NOT NULL DEFAULT '0',
                `date` varchar(255) NOT NULL DEFAULT '0',
                `shift` varchar(50) NOT NULL DEFAULT '0',
                `phase` int(11) DEFAULT 1,
                `categories` longtext NOT NULL,
                `overall_performance` int(11) NOT NULL DEFAULT 0,
                `strengths` longtext NOT NULL,
                `areas_for_improvement` longtext NOT NULL,
                `additional_comments` longtext NOT NULL,
                `status` longtext NOT NULL,
                `rejection_reason` longtext DEFAULT NULL,
                PRIMARY KEY (`id`) USING BTREE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_police_fto_reports`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_vehicles` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `plate` varchar(50) NOT NULL,
            `status` varchar(50) DEFAULT 'clear',
            `sightings` longtext DEFAULT NULL,
            `photo` longtext DEFAULT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_vehicles`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_bodycams` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `citizenid` varchar(100) DEFAULT NULL,
              `videoURL` longtext NOT NULL DEFAULT '',
            `datetime` datetime NOT NULL DEFAULT current_timestamp(),
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_bodycams`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_cameras` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `cameraId` int(11) NOT NULL,
            `videoURL` longtext NOT NULL DEFAULT '',
            `datetime` datetime NOT NULL DEFAULT current_timestamp(),
            PRIMARY KEY (`id`)
        )  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_cameras`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_warrants` (
            `id` varchar(50) NOT NULL,
            `suspectId` varchar(100) NOT NULL,
            `issueDate` varchar(50) NOT NULL,
            `expiryDate` varchar(50) NOT NULL,
            `charges` longtext NOT NULL,
            `issuingAuthority` varchar(50) NOT NULL DEFAULT '',
            `status` varchar(50) NOT NULL DEFAULT '',
            `caseNotes` longtext NOT NULL,
            `sightings` longtext DEFAULT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_warrants`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_weapons` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `citizenId` varchar(100) NOT NULL DEFAULT '0',
            `serialNumber` varchar(250) NOT NULL DEFAULT '0',
            `weaponName` varchar(100) NOT NULL DEFAULT '0',
            `registrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
            `image` longtext DEFAULT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_weapons`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_licenses` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `citizenid` varchar(100) DEFAULT NULL,
            `name` varchar(255) NOT NULL DEFAULT '0',
            `type` varchar(50) NOT NULL DEFAULT '',
            `status` enum('approved','rejected','expired') NOT NULL DEFAULT 'approved',
            `approvedBy` varchar(255) NOT NULL DEFAULT '',
            `approvalDate` timestamp NOT NULL DEFAULT current_timestamp(),
            `expirationDate` varchar(50) NOT NULL DEFAULT '',
            `note` varchar(50) DEFAULT NULL,
            PRIMARY KEY (`id`)
        )  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_licenses`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = detectCore
  L7_2 = "qb-core"
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = detectCore
    L7_2 = "qbx_core"
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      goto lbl_364
    end
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
            ALTER TABLE `players` 
            ADD COLUMN `photo` longtext DEFAULT NULL
        ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = " SELECT COLUMN_NAME, COLLATION_NAME FROM information_schema.columns WHERE table_schema = DATABASE() AND table_name = \"players\" AND column_name = \"citizenid\""
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if L2_2 then
    L6_2 = L3_2[1]
    if L6_2 then
      L6_2 = L3_2[1]
      L0_2 = L6_2.COLLATION_NAME
      L6_2 = print
      L7_2 = "Citizenid column collation fetched successfully: "
      L8_2 = L0_2
      L6_2(L7_2, L8_2)
  end
  else
    L6_2 = print
    L7_2 = "Failed to fetch citizenid column collation or table does not exist."
    L6_2(L7_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = " SELECT COLUMN_NAME, COLLATION_NAME FROM information_schema.columns WHERE table_schema = DATABASE() AND table_name = \"player_vehicles\" AND column_name = \"plate\""
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if L2_2 then
    L6_2 = L3_2[1]
    if L6_2 then
      L6_2 = L3_2[1]
      L1_2 = L6_2.COLLATION_NAME
      L6_2 = print
      L7_2 = "Plate column collation fetched successfully: "
      L8_2 = L1_2
      L6_2(L7_2, L8_2)
  end
  else
    L6_2 = print
    L7_2 = "Failed to fetch plate column collation or table does not exist."
    L6_2(L7_2)
    goto lbl_441
    ::lbl_364::
    L6_2 = detectCore
    L7_2 = "es_extended"
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = pcall
      L7_2 = MySQL
      L7_2 = L7_2.query
      L7_2 = L7_2.await
      L8_2 = [[
            ALTER TABLE `users` 
            ADD COLUMN `photo` longtext DEFAULT NULL
        ]]
      L6_2, L7_2 = L6_2(L7_2, L8_2)
      L3_2 = L7_2
      L2_2 = L6_2
      if not L2_2 then
      end
      L6_2 = pcall
      L7_2 = MySQL
      L7_2 = L7_2.query
      L7_2 = L7_2.await
      L8_2 = " SELECT COLUMN_NAME, COLLATION_NAME FROM information_schema.columns WHERE table_schema = DATABASE() AND table_name = \"users\" AND column_name = \"identifier\""
      L6_2, L7_2 = L6_2(L7_2, L8_2)
      L3_2 = L7_2
      L2_2 = L6_2
      if L2_2 then
        L6_2 = L3_2[1]
        if L6_2 then
          L6_2 = L3_2[1]
          L0_2 = L6_2.COLLATION_NAME
          L6_2 = print
          L7_2 = "Citizenid column collation fetched successfully: "
          L8_2 = L0_2
          L6_2(L7_2, L8_2)
      end
      else
        L6_2 = print
        L7_2 = "Failed to fetch citizenid column collation or table does not exist."
        L6_2(L7_2)
      end
      L6_2 = pcall
      L7_2 = MySQL
      L7_2 = L7_2.query
      L7_2 = L7_2.await
      L8_2 = " SELECT COLUMN_NAME, COLLATION_NAME FROM information_schema.columns WHERE table_schema = DATABASE() AND table_name = \"owned_vehicles\" AND column_name = \"plate\""
      L6_2, L7_2 = L6_2(L7_2, L8_2)
      L3_2 = L7_2
      L2_2 = L6_2
      if L2_2 then
        L6_2 = L3_2[1]
        if L6_2 then
          L6_2 = L3_2[1]
          L1_2 = L6_2.COLLATION_NAME
          L6_2 = print
          L7_2 = "Plate column collation fetched successfully: "
          L8_2 = L1_2
          L6_2(L7_2, L8_2)
      end
      else
        L6_2 = print
        L7_2 = "Failed to fetch plate column collation or table does not exist."
        L6_2(L7_2)
      end
    else
      L6_2 = detectCore
      L7_2 = "ox_core"
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L6_2 = pcall
        L7_2 = MySQL
        L7_2 = L7_2.query
        L7_2 = L7_2.await
        L8_2 = [[
            ALTER TABLE `characters` 
            ADD COLUMN `photo` longtext DEFAULT NULL
        ]]
        L6_2, L7_2 = L6_2(L7_2, L8_2)
        L3_2 = L7_2
        L2_2 = L6_2
        if not L2_2 then
        end
      end
    end
  end
  ::lbl_441::
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE mdt_weapons CHANGE citizenid citizenId VARCHAR(50);
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_police_reports` 
        ADD COLUMN `evidence_locker` longtext DEFAULT NULL
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_police_reports` 
        ADD COLUMN `members` LONGTEXT DEFAULT NULL,
        ADD COLUMN `lock_reason` LONGTEXT DEFAULT NULL,
        ADD COLUMN `isLocked` TINYINT(1) DEFAULT 0
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_police_incidents` 
        ADD COLUMN `evidence_locker` longtext DEFAULT NULL
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_police_incidents` 
        ADD COLUMN `officerId` longtext DEFAULT NULL
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_police_incidents` 
        ADD COLUMN `members` LONGTEXT DEFAULT NULL,
        ADD COLUMN `lock_reason` LONGTEXT DEFAULT NULL,
        ADD COLUMN `isLocked` TINYINT(1) DEFAULT 0
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_ems_incidents` 
        ADD COLUMN `medicId` longtext DEFAULT NULL
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_ems_incidents` 
        ADD COLUMN `bodyData` longtext DEFAULT NULL
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_ems_incidents` 
        ADD COLUMN `members` LONGTEXT DEFAULT NULL,
        ADD COLUMN `lock_reason` LONGTEXT DEFAULT NULL,
        ADD COLUMN `isLocked` TINYINT(1) DEFAULT 0
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_ems_reports` 
        ADD COLUMN `bodyData` longtext DEFAULT NULL
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_ems_reports` 
        ADD COLUMN `members` LONGTEXT DEFAULT NULL,
        ADD COLUMN `lock_reason` LONGTEXT DEFAULT NULL,
        ADD COLUMN `isLocked` TINYINT(1) DEFAULT 0
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_units`
        ADD COLUMN `bodycam` ENUM('off', 'on') NOT NULL DEFAULT 'off',
        ADD COLUMN `tags` LONGTEXT DEFAULT NULL;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_units`
        ADD COLUMN `dutyStatus` ENUM('clr','avl','enr','busy') NOT NULL DEFAULT 'avl';
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        ALTER TABLE `mdt_units` DROP INDEX `callsign`;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_court_cases` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `title` varchar(255) NOT NULL,
            `date` varchar(50) NOT NULL,
            `status` varchar(50) NOT NULL,
            `defendant` varchar(255) NOT NULL,
            `judge` varchar(255) DEFAULT NULL,
            `defense` varchar(255) DEFAULT NULL,
            `prosecution` varchar(255) DEFAULT NULL,
            `courtroom` varchar(50) DEFAULT NULL,
            `relatedReports` longtext DEFAULT NULL,
            `verdict` longtext DEFAULT NULL,
            `sentence` longtext DEFAULT NULL,
            `postponedReason` longtext DEFAULT NULL,
            `newDate` varchar(50) DEFAULT NULL,
            PRIMARY KEY (`id`)
        )  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_court_cases`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        CREATE TABLE IF NOT EXISTS `mdt_court_case_notes` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `caseId` int(11) NOT NULL,
            `timestamp` varchar(50) NOT NULL,
            `author` varchar(255) NOT NULL,
            `content` longtext NOT NULL,
            PRIMARY KEY (`id`),
            KEY `caseId` (`caseId`)
        )  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to create `mdt_court_case_notes`:"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  if L0_2 then
    L6_2 = {}
    L7_2 = "mdt_criminal_codes"
    L8_2 = "mdt_ems_bulletin"
    L9_2 = "mdt_ems_reports"
    L10_2 = "mdt_ems_incidents"
    L11_2 = "mdt_police_bulletin"
    L12_2 = "mdt_police_reports"
    L13_2 = "mdt_police_incidents"
    L14_2 = "mdt_profiles"
    L15_2 = "mdt_units"
    L16_2 = "mdt_ems_fto_reports"
    L17_2 = "mdt_police_fto_reports"
    L18_2 = "mdt_bodycams"
    L19_2 = "mdt_cameras"
    L20_2 = "mdt_warrants"
    L21_2 = "mdt_weapons"
    L22_2 = "mdt_licenses"
    L23_2 = "mdt_court_cases"
    L24_2 = "mdt_court_case_notes"
    L25_2 = "mdt_fake_profiles"
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L6_2[4] = L10_2
    L6_2[5] = L11_2
    L6_2[6] = L12_2
    L6_2[7] = L13_2
    L6_2[8] = L14_2
    L6_2[9] = L15_2
    L6_2[10] = L16_2
    L6_2[11] = L17_2
    L6_2[12] = L18_2
    L6_2[13] = L19_2
    L6_2[14] = L20_2
    L6_2[15] = L21_2
    L6_2[16] = L22_2
    L6_2[17] = L23_2
    L6_2[18] = L24_2
    L6_2[19] = L25_2
    L7_2 = ipairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = "ALTER TABLE %s CONVERT TO CHARACTER SET utf8mb4 COLLATE %s;"
      L14_2 = L13_2
      L13_2 = L13_2.format
      L15_2 = L12_2
      L16_2 = L0_2
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L14_2 = pcall
      L15_2 = MySQL
      L15_2 = L15_2.query
      L15_2 = L15_2.await
      L16_2 = L13_2
      L14_2, L15_2 = L14_2(L15_2, L16_2)
      L3_2 = L15_2
      L2_2 = L14_2
      if not L2_2 then
        L14_2 = print
        L15_2 = "Failed to convert character set and collation for table '"
        L16_2 = L12_2
        L17_2 = "':"
        L15_2 = L15_2 .. L16_2 .. L17_2
        L16_2 = L3_2
        L14_2(L15_2, L16_2)
      end
    end
  end
  if L1_2 then
    L6_2 = {}
    L7_2 = "mdt_vehicles"
    L8_2 = "mdt_vehicles_strikes"
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = ipairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = "ALTER TABLE %s CONVERT TO CHARACTER SET utf8mb4 COLLATE %s;"
      L14_2 = L13_2
      L13_2 = L13_2.format
      L15_2 = L12_2
      L16_2 = L1_2
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L14_2 = pcall
      L15_2 = MySQL
      L15_2 = L15_2.query
      L15_2 = L15_2.await
      L16_2 = L13_2
      L14_2, L15_2 = L14_2(L15_2, L16_2)
      L3_2 = L15_2
      L2_2 = L14_2
      if not L2_2 then
        L14_2 = print
        L15_2 = "Failed to convert character set and collation for table '"
        L16_2 = L12_2
        L17_2 = "':"
        L15_2 = L15_2 .. L16_2 .. L17_2
        L16_2 = L3_2
        L14_2(L15_2, L16_2)
      end
    end
  end
  L6_2 = print
  L7_2 = "All tables have been created or checked successfully."
  L6_2(L7_2)
  L6_2 = print
  L7_2 = "[WARRANTS] Checking for expired warrants on script start..."
  L6_2(L7_2)
  L6_2 = updateWarrantStatus
  L6_2()
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        UPDATE `mdt_units` SET `status` = 'off-duty'
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to reset unit statuses to 'off-duty':"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = pcall
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
    UPDATE `mdt_units` SET `bodycam` = 'off'
    ]]
  L6_2, L7_2 = L6_2(L7_2, L8_2)
  L3_2 = L7_2
  L2_2 = L6_2
  if not L2_2 then
    L6_2 = print
    L7_2 = "Failed to reset bodycam statuses to 'off':"
    L8_2 = L3_2
    L6_2(L7_2, L8_2)
  end
end
L0_1(L1_1)
