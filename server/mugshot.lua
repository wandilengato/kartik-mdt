local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = ""
L1_1 = ""
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "kartik-mdt:server:GetMugshotWebhook"
function L4_1(A0_2, A1_2)
  local L2_2
  L2_2 = ServerConfig
  L2_2 = L2_2.Webhook
  return L2_2
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "kartik-mdt:server:takemugshot"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = source
  L4_2 = GetPlayerData
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetPlayerData
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if L4_2 and L5_2 then
    if L2_2 ~= L3_2 then
      L6_2 = GetEntityCoords
      L7_2 = GetPlayerPed
      L8_2 = L3_2
      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L7_2 = GetEntityCoords
      L8_2 = GetPlayerPed
      L9_2 = L2_2
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L8_2 = L6_2 - L7_2
      L8_2 = #L8_2
      L9_2 = Config
      L9_2 = L9_2.Mugshot
      L9_2 = L9_2.maxDistance
      if L8_2 <= L9_2 then
        L9_2 = TriggerClientEvent
        L10_2 = "kartik-mdt:client:takemugshot"
        L11_2 = L2_2
        L12_2 = L3_2
        L13_2 = A1_2
        L9_2(L10_2, L11_2, L12_2, L13_2)
      else
        L9_2 = TriggerClientEvent
        L10_2 = "ox_lib:notify"
        L11_2 = L3_2
        L12_2 = {}
        L12_2.description = "The Player is too far away to take a mugshot."
        L12_2.type = "error"
        L9_2(L10_2, L11_2, L12_2)
      end
    else
      L6_2 = TriggerClientEvent
      L7_2 = "ox_lib:notify"
      L8_2 = L3_2
      L9_2 = {}
      L9_2.description = "You can't take a mugshot of yourself."
      L9_2.type = "error"
      L6_2(L7_2, L8_2, L9_2)
    end
  else
    L6_2 = TriggerClientEvent
    L7_2 = "ox_lib:notify"
    L8_2 = L3_2
    L9_2 = {}
    L9_2.description = "Invalid Player ID."
    L9_2.type = "error"
    L6_2(L7_2, L8_2, L9_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "kartik-mdt:server:MugLog"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = GetPlayerData
  L3_2 = source
  L2_2 = L2_2(L3_2)
  L3_2 = GetPlayerData
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = L2_2.name
  L5_2 = L2_2.citizenId
  L6_2 = L3_2.name
  L7_2 = {}
  L8_2 = {}
  L9_2 = Config
  L9_2 = L9_2.LogTitle
  L8_2.title = L9_2
  L8_2.color = 16761035
  L9_2 = {}
  L10_2 = os
  L10_2 = L10_2.date
  L11_2 = "!%a %b %d, %H:%M"
  L12_2 = os
  L12_2 = L12_2.time
  L12_2 = L12_2()
  L12_2 = L12_2 + 21600
  L10_2 = L10_2(L11_2, L12_2)
  L9_2.text = L10_2
  L8_2.footer = L9_2
  L9_2 = {}
  L10_2 = {}
  L10_2.name = "Suspect:"
  L11_2 = "```"
  L12_2 = L4_2
  L13_2 = "```"
  L11_2 = L11_2 .. L12_2 .. L13_2
  L10_2.value = L11_2
  L10_2.inline = false
  L11_2 = {}
  L11_2.name = "Citizen ID:"
  L12_2 = "```"
  L13_2 = L5_2
  L14_2 = "```"
  L12_2 = L12_2 .. L13_2 .. L14_2
  L11_2.value = L12_2
  L11_2.inline = false
  L12_2 = {}
  L12_2.name = "Officer:"
  L13_2 = "```"
  L14_2 = L6_2
  L15_2 = "```"
  L13_2 = L13_2 .. L14_2 .. L15_2
  L12_2.value = L13_2
  L12_2.inline = false
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L8_2.fields = L9_2
  L9_2 = {}
  L9_2.name = "MDT & Dispatch"
  L9_2.icon_url = "https://r2.fivemanage.com/f2nWaTPuI7VQSmQCGKxLD/1.png"
  L8_2.author = L9_2
  L9_2 = {}
  L10_2 = A1_2[1]
  if not L10_2 then
    L10_2 = ""
  end
  L9_2.url = L10_2
  L8_2.image = L9_2
  L7_2[1] = L8_2
  L8_2 = 2
  L9_2 = #A1_2
  L10_2 = 1
  for L11_2 = L8_2, L9_2, L10_2 do
    L12_2 = table
    L12_2 = L12_2.insert
    L13_2 = L7_2
    L14_2 = {}
    L15_2 = "Mugshot Angle "
    L16_2 = L11_2
    L15_2 = L15_2 .. L16_2
    L14_2.title = L15_2
    L14_2.color = 16761035
    L15_2 = {}
    L16_2 = A1_2[L11_2]
    L15_2.url = L16_2
    L14_2.image = L15_2
    L12_2(L13_2, L14_2)
  end
  L8_2 = ServerConfig
  L8_2 = L8_2.Webhooks
  L8_2 = L8_2.mugshot
  if L8_2 then
    L8_2 = PerformHttpRequest
    L9_2 = ServerConfig
    L9_2 = L9_2.Webhooks
    L9_2 = L9_2.mugshot
    function L10_2()
      local L0_3, L1_3
    end
    L11_2 = "POST"
    L12_2 = json
    L12_2 = L12_2.encode
    L13_2 = {}
    L14_2 = Config
    L14_2 = L14_2.LogName
    L13_2.username = L14_2
    L13_2.embeds = L7_2
    L12_2 = L12_2(L13_2)
    L13_2 = {}
    L13_2["Content-Type"] = "application/json"
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  end
end
L2_1(L3_1, L4_1)
