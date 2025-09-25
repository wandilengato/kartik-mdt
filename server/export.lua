local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = false
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "%d+"
  L1_2 = L1_2(L2_2, L3_2)
  return L1_2
end
extractNumericId = L2_1
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = {}
  L5_2 = "Bot "
  L6_2 = ServerConfig
  L6_2 = L6_2.DiscordBot
  L5_2 = L5_2 .. L6_2
  L4_2.Authorization = L5_2
  L4_2["Content-Type"] = "application/json"
  L5_2 = {}
  L6_2 = "Check out this attachment"
  L7_2 = PerformHttpRequest
  L8_2 = "https://discord.com/api/v10/users/@me/channels"
  function L9_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    if 200 == A0_3 then
      L2_3 = json
      L2_3 = L2_3.decode
      L3_3 = A1_3
      L2_3 = L2_3(L3_3)
      L3_3 = L2_3.id
      L4_3 = {}
      L5_3 = A2_2
      if "image" == L5_3 then
        L5_3 = {}
        L6_3 = {}
        L7_3 = A1_2
        L6_3.url = L7_3
        L5_3.image = L6_3
        L4_3 = L5_3
      else
        L5_3 = A2_2
        if "text" == L5_3 then
          L5_3 = {}
          L6_3 = L6_2
          L5_3.title = L6_3
          L6_3 = A1_2
          L5_3.description = L6_3
          L4_3 = L5_3
        else
          L5_3 = A2_2
          if "file" == L5_3 then
            L5_3 = "----------"
            L6_3 = os
            L6_3 = L6_3.time
            L6_3 = L6_3()
            L5_3 = L5_3 .. L6_3
            L6_3 = "multipart/form-data; boundary="
            L7_3 = L5_3
            L6_3 = L6_3 .. L7_3
            L4_2["Content-Type"] = L6_3
            L6_3 = io
            L6_3 = L6_3.open
            L7_3 = A1_2
            L8_3 = "rb"
            L6_3 = L6_3(L7_3, L8_3)
            if not L6_3 then
              L7_3 = print
              L8_3 = "Error opening file:"
              L9_3 = A1_2
              L7_3(L8_3, L9_3)
              return
            end
            L8_3 = L6_3
            L7_3 = L6_3.read
            L9_3 = "*all"
            L7_3 = L7_3(L8_3, L9_3)
            L9_3 = L6_3
            L8_3 = L6_3.close
            L8_3(L9_3)
            L8_3 = "--"
            L9_3 = L5_3
            L10_3 = "\r\n"
            L8_3 = L8_3 .. L9_3 .. L10_3
            L9_3 = L8_3
            L10_3 = "Content-Disposition: form-data; name=\"content\"\r\n\r\n"
            L11_3 = L6_2
            L12_3 = "\r\n"
            L9_3 = L9_3 .. L10_3 .. L11_3 .. L12_3
            L8_3 = L9_3
            L9_3 = L8_3
            L10_3 = "--"
            L11_3 = L5_3
            L12_3 = "\r\n"
            L9_3 = L9_3 .. L10_3 .. L11_3 .. L12_3
            L8_3 = L9_3
            L9_3 = L8_3
            L10_3 = "Content-Disposition: form-data; name=\"file\"; filename="
            L11_3 = A3_2.fileName
            L12_3 = "\r\n"
            L9_3 = L9_3 .. L10_3 .. L11_3 .. L12_3
            L8_3 = L9_3
            L9_3 = L8_3
            L10_3 = "Content-Type: application/octet-stream\r\n\r\n"
            L9_3 = L9_3 .. L10_3
            L8_3 = L9_3
            L9_3 = L8_3
            L10_3 = L7_3
            L11_3 = "\r\n"
            L9_3 = L9_3 .. L10_3 .. L11_3
            L8_3 = L9_3
            L9_3 = L8_3
            L10_3 = "--"
            L11_3 = L5_3
            L12_3 = "--"
            L9_3 = L9_3 .. L10_3 .. L11_3 .. L12_3
            L8_3 = L9_3
            L5_2 = L8_3
          end
        end
      end
      L5_3 = A2_2
      if "file" ~= L5_3 then
        L5_3 = json
        L5_3 = L5_3.encode
        L6_3 = {}
        L7_3 = L6_2
        L6_3.content = L7_3
        L7_3 = {}
        L8_3 = L4_3
        L7_3[1] = L8_3
        L6_3.embeds = L7_3
        L5_3 = L5_3(L6_3)
        L5_2 = L5_3
      end
      L5_3 = PerformHttpRequest
      L6_3 = "https://discord.com/api/v10/channels/"
      L7_3 = L3_3
      L8_3 = "/messages"
      L6_3 = L6_3 .. L7_3 .. L8_3
      function L7_3(A0_4, A1_4)
        local L2_4, L3_4, L4_4
        if 200 == A0_4 then
          L2_4 = print
          L3_4 = "Attachment and embed sent successfully"
          L2_4(L3_4)
        else
          L2_4 = print
          L3_4 = "Failed to send attachment and embed. Status code: "
          L4_4 = A0_4
          L3_4 = L3_4 .. L4_4
          L2_4(L3_4)
          if A1_4 then
            L2_4 = print
            L3_4 = "Response: "
            L4_4 = A1_4
            L3_4 = L3_4 .. L4_4
            L2_4(L3_4)
          end
        end
      end
      L8_3 = "POST"
      L9_3 = L5_2
      L10_3 = L4_2
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3)
    else
      L2_3 = print
      L3_3 = "Failed to create DM channel. Status code: "
      L4_3 = A0_3
      L3_3 = L3_3 .. L4_3
      L2_3(L3_3)
      if A1_3 then
        L2_3 = print
        L3_3 = "Response: "
        L4_3 = A1_3
        L3_3 = L3_3 .. L4_3
        L2_3(L3_3)
      end
    end
  end
  L10_2 = "POST"
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = {}
  L12_2.recipient_id = A0_2
  L11_2 = L11_2(L12_2)
  L12_2 = L4_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
end
sendAttachmentToDiscord = L2_1
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L1_1
  if not L0_2 then
    L0_2 = L0_1
    L0_2 = #L0_2
    if 0 ~= L0_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L0_2 = true
  L1_1 = L0_2
  L0_2 = table
  L0_2 = L0_2.remove
  L1_2 = L0_1
  L2_2 = 1
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = sendAttachmentToDiscord
  L2_2 = L0_2.discordId
  L3_2 = L0_2.content
  L4_2 = L0_2.contentType
  L5_2 = L0_2
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3
    L0_3 = SetTimeout
    L1_3 = 60000
    function L2_3()
      local L0_4, L1_4
      L0_4 = false
      L1_1 = L0_4
      L0_4 = processQueue
      L0_4()
    end
    L0_3(L1_3, L2_3)
  end
  L1_2(L2_2)
end
processQueue = L2_1
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:getWebhook"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = ServerConfig
  L2_2 = L2_2.Webhook
  if L2_2 then
    L2_2 = {}
    L2_2.success = true
    L3_2 = ServerConfig
    L3_2 = L3_2.Webhook
    L2_2.webhook = L3_2
    return L2_2
  else
    L2_2 = print
    L3_2 = "Invalid data received"
    L2_2(L3_2)
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "Invalid data"
    return L2_2
  end
end
L2_1(L3_1, L4_1)
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if "" == A0_2 then
    L1_2 = ""
    return L1_2
  end
  L1_2 = "(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)"
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = L1_2
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    return A0_2
  end
  L8_2 = os
  L8_2 = L8_2.time
  L9_2 = {}
  L10_2 = tonumber
  L11_2 = L2_2
  L10_2 = L10_2(L11_2)
  L9_2.year = L10_2
  L10_2 = tonumber
  L11_2 = L3_2
  L10_2 = L10_2(L11_2)
  L9_2.month = L10_2
  L10_2 = tonumber
  L11_2 = L4_2
  L10_2 = L10_2(L11_2)
  L9_2.day = L10_2
  L10_2 = tonumber
  L11_2 = L5_2
  L10_2 = L10_2(L11_2)
  L9_2.hour = L10_2
  L10_2 = tonumber
  L11_2 = L6_2
  L10_2 = L10_2(L11_2)
  L9_2.min = L10_2
  L10_2 = tonumber
  L11_2 = L7_2
  L10_2 = L10_2(L11_2)
  L9_2.sec = L10_2
  L8_2 = L8_2(L9_2)
  L9_2 = os
  L9_2 = L9_2.difftime
  L10_2 = os
  L10_2 = L10_2.time
  L10_2 = L10_2()
  L11_2 = os
  L11_2 = L11_2.time
  L12_2 = os
  L12_2 = L12_2.date
  L13_2 = "!*t"
  L12_2, L13_2 = L12_2(L13_2)
  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L10_2 = L8_2 + L9_2
  L11_2 = os
  L11_2 = L11_2.date
  L12_2 = "%Y-%m-%d %H:%M:%S"
  L13_2 = L10_2
  return L11_2(L12_2, L13_2)
end
convertUtcToLocal = L2_1
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:downloadDutyRecords"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2
  if A1_2 then
    L2_2 = A1_2.citizenId
    L3_2 = extractNumericId
    L4_2 = GetPlayerIdentifierByType
    L5_2 = A0_2
    L6_2 = "discord"
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2 = L4_2(L5_2, L6_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
    L4_2 = "SELECT dutyRecords FROM mdt_units WHERE citizenid = ?"
    L5_2 = {}
    L6_2 = L2_2
    L5_2[1] = L6_2
    L6_2 = MySQL
    L6_2 = L6_2.query
    L6_2 = L6_2.await
    L7_2 = L4_2
    L8_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L7_2 = #L6_2
      if L7_2 > 0 then
        L7_2 = L6_2[1]
        L7_2 = L7_2.dutyRecords
        L8_2 = json
        L8_2 = L8_2.decode
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L9_2 = type
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          if "table" == L9_2 then
            L9_2 = GetResourcePath
            L10_2 = GetCurrentResourceName
            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2 = L10_2()
            L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
            L10_2 = L9_2
            L11_2 = "/DutyRecords.xls"
            L10_2 = L10_2 .. L11_2
            L11_2 = os
            L11_2 = L11_2.remove
            L12_2 = L10_2
            L11_2(L12_2)
            L11_2 = io
            L11_2 = L11_2.open
            L12_2 = L10_2
            L13_2 = "w"
            L11_2 = L11_2(L12_2, L13_2)
            if L11_2 then
              L13_2 = L11_2
              L12_2 = L11_2.write
              L14_2 = "CitizenId\tStartTime\tEndTime\tHours\n"
              L12_2(L13_2, L14_2)
              L12_2 = ipairs
              L13_2 = L8_2
              L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
              for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
                L18_2 = convertUtcToLocal
                L19_2 = L17_2.startTime
                if not L19_2 then
                  L19_2 = ""
                end
                L18_2 = L18_2(L19_2)
                L19_2 = convertUtcToLocal
                L20_2 = L17_2.endTime
                if not L20_2 then
                  L20_2 = ""
                end
                L19_2 = L19_2(L20_2)
                L20_2 = L17_2.hours
                if not L20_2 then
                  L20_2 = ""
                end
                L22_2 = L11_2
                L21_2 = L11_2.write
                L23_2 = L2_2
                L24_2 = "\t"
                L25_2 = L18_2
                L26_2 = "\t"
                L27_2 = L19_2
                L28_2 = "\t"
                L29_2 = L20_2
                L30_2 = "\n"
                L23_2 = L23_2 .. L24_2 .. L25_2 .. L26_2 .. L27_2 .. L28_2 .. L29_2 .. L30_2
                L21_2(L22_2, L23_2)
              end
              L13_2 = L11_2
              L12_2 = L11_2.close
              L12_2(L13_2)
              L12_2 = print
              L13_2 = "Duty records file written successfully."
              L12_2(L13_2)
              L12_2 = table
              L12_2 = L12_2.insert
              L13_2 = L0_1
              L14_2 = {}
              L14_2.discordId = L3_2
              L14_2.content = L10_2
              L14_2.contentType = "file"
              L14_2.source = A0_2
              L15_2 = "Duty Records_"
              L16_2 = L2_2
              L17_2 = ".xls"
              L15_2 = L15_2 .. L16_2 .. L17_2
              L14_2.fileName = L15_2
              L12_2(L13_2, L14_2)
              L12_2 = processQueue
              L12_2()
              L12_2 = {}
              L12_2.success = true
              L12_2.message = "Added to queue, You will receive in your DM shortly."
              return L12_2
            else
              L12_2 = print
              L13_2 = "Failed to open the file for writing."
              L12_2(L13_2)
            end
          end
        end
      end
    end
  else
    L2_2 = print
    L3_2 = "No data received."
    L2_2(L3_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:receivePDF"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A1_2 then
    L2_2 = {}
    L2_2.success = false
    L2_2.message = "No data received"
    return L2_2
  end
  L2_2 = GetPlayerIdentifierByType
  L3_2 = A0_2
  L4_2 = "discord"
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L2_2
  L2_2 = L2_2.match
  L4_2 = "%d+"
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = json
  L3_2 = L3_2.decode
  L4_2 = A1_2.data
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.attachments
  L4_2 = L4_2[1]
  L5_2 = L4_2.url
  L6_2 = L4_2.filename
  L7_2 = "Here is the PDF file: "
  L8_2 = L6_2
  L9_2 = "\n"
  L10_2 = L5_2
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2
  L8_2 = table
  L8_2 = L8_2.insert
  L9_2 = L0_1
  L10_2 = {}
  L10_2.discordId = L2_2
  L10_2.content = L7_2
  L10_2.contentType = "text"
  L10_2.source = A0_2
  L10_2.fileName = L6_2
  L8_2(L9_2, L10_2)
  L8_2 = processQueue
  L8_2()
  L8_2 = {}
  L8_2.success = true
  L8_2.message = "PDF URL and file name received and will be sent shortly"
  return L8_2
end
L2_1(L3_1, L4_1)
