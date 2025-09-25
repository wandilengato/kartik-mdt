local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = "https://discord.com/api"
L1_1 = {}
L1_1.activeThreads = "/channels/%s/threads/active"
L1_1.ban = "/guilds/%s/bans/%s"
L1_1.bans = "/guilds/%s/bans"
L1_1.bulkDelete = "/channels/%s/messages/bulk-delete"
L1_1.channel = "/channels/%s"
L1_1.channelInvites = "/channels/%s/invites"
L1_1.channelThreads = "/channels/%s/threads"
L1_1.createDm = "/users/@me/channels"
L1_1.crosspost = "/channels/%s/messages/%s/crosspost"
L1_1.currentUser = "/users/@me"
L1_1.followers = "/channels/%s/followers"
L1_1.github = "/webhooks/%s/%s/github"
L1_1.groupDm = "/channels/%s/recipients/%s"
L1_1.guild = "/guilds/%s"
L1_1.guildChannels = "/guilds/%s/channels"
L1_1.guildEmoji = "/guilds/%s/emojis/%s"
L1_1.guildEmojis = "/guilds/%s/emojis"
L1_1.guildInvites = "/guilds/%s/invites"
L1_1.guildMember = "/guilds/%s/members/%s"
L1_1.guildMembers = "/guilds/%s/members"
L1_1.guildPreview = "/guilds/%s/preview"
L1_1.guilds = "/guilds"
L1_1.guildThreads = "/guilds/%s/threads/active"
L1_1.guildWebhooks = "/guilds/%s/webhooks"
L1_1.integration = "/guilds/%s/integrations/%"
L1_1.integrations = "/guilds/%s/integrations"
L1_1.invite = "/invites/%s"
L1_1.joinedThreads = "/channels/%s/users/@me/threads/archived/private"
L1_1.memberRole = "/guilds/%s/members/%s/roles/%s"
L1_1.message = "/channels/%s/messages/%s"
L1_1.messages = "/channels/%s/messages"
L1_1.messageThreads = "/channels/%s/messages/%s/threads"
L1_1.myConnections = "/users/@me/connections"
L1_1.myGuild = "/users/@me/guilds/%s"
L1_1.myGuilds = "/users/@me/guilds"
L1_1.myVoiceState = "/guilds/%s/voice-states/@me"
L1_1.nick = "/guilds/%s/members/@me/nick"
L1_1.ownReaction = "/channels/%s/messages/%s/reactions/%s/@me"
L1_1.pinMessage = "/channels/%s/pins/%s"
L1_1.pins = "/channels/%s/pins"
L1_1.privateThreads = "/channels/%s/threads/archived/private"
L1_1.prune = "/guilds/%s/prune"
L1_1.publicThreads = "/channels/%s/threads/archived/public"
L1_1.reaction = "/channels/%s/messages/%s/reactions/%s"
L1_1.reactions = "/channels/%s/messages/%s/reactions"
L1_1.regions = "/guilds/%s/regions"
L1_1.role = "/guilds/%s/roles/%s"
L1_1.roles = "/guilds/%s/roles"
L1_1.searchMembers = "/guilds/%s/members/search"
L1_1.slack = "/webhooks/%s/%s/slack"
L1_1.threadMembers = "/channels/%s/thread-members"
L1_1.threadSelf = "/channels/%s/thread-members/@me"
L1_1.threadUser = "/channels/%s/thread-members/%s"
L1_1.typing = "/channels/%s/typing"
L1_1.user = "/users/%s"
L1_1.userReaction = "/channels/%s/messages/%s/reactions/%s/%s"
L1_1.userVoiceState = "/guilds/%s/voice-states/%s"
L1_1.vanityUrl = "/guilds/%s/vanity-url"
L1_1.webhook = "/webhooks/%s/%s"
L1_1.webhookId = "/webhooks/%s"
L1_1.webhookMessage = "/webhooks/%s/%s/messages/%s"
L1_1.webhooks = "/channels/%s/webhooks"
L1_1.welcomeScreen = "/guilds/%s/welcome-screen"
L1_1.widget = "/guilds/%s/widget"
L1_1.widgetImage = "/guilds/%s/widget.png"
L1_1.widgetJson = "/guilds/%s/widget.json"
function L2_1(A0_2)
  local L1_2
  L1_2 = 200
  L1_2 = A0_2 < L1_2
  return L1_2
end
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = L2_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = not L1_2
  return L1_2
end
function L4_1(A0_2)
  local L1_2
  function L1_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3
    L3_3 = L3_1
    L4_3 = A0_3
    L3_3 = L3_3(L4_3)
    if L3_3 then
      L3_3 = json
      L3_3 = L3_3.decode
      L4_3 = A1_3
      L3_3 = L3_3(L4_3)
      object = L3_3
      L3_3 = object
      if nil == L3_3 then
        L3_3 = A0_2
        L4_3 = L3_3
        L3_3 = L3_3.reject
        L5_3 = A1_3
        L3_3(L4_3, L5_3)
      else
        L3_3 = A0_2
        L4_3 = L3_3
        L3_3 = L3_3.resolve
        L5_3 = object
        L3_3(L4_3, L5_3)
      end
    else
      L3_3 = A0_2
      L4_3 = L3_3
      L3_3 = L3_3.reject
      L5_3 = A0_3
      L3_3(L4_3, L5_3)
    end
  end
  return L1_2
end
createSimplePromiseCallback = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  if A0_2 then
    L2_2 = pairs
    L3_2 = A0_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = L1_2
      L10_2 = "%s=%s"
      L11_2 = L10_2
      L10_2 = L10_2.format
      L12_2 = L6_2
      L13_2 = L7_2
      L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    end
  end
  L2_2 = #L1_2
  if L2_2 > 0 then
    L2_2 = "?"
    L3_2 = table
    L3_2 = L3_2.concat
    L4_2 = L1_2
    L5_2 = "&"
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L2_2 .. L3_2
    return L2_2
  else
    L2_2 = ""
    return L2_2
  end
end
createQueryString = L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = createQueryString
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  L4_2 = type
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = L0_1
    L6_2 = A0_2
    L5_2 = A0_2.format
    L7_2 = table
    L7_2 = L7_2.unpack
    L8_2 = A1_2
    L7_2, L8_2 = L7_2(L8_2)
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L6_2 = L3_2
    L4_2 = L4_2 .. L5_2 .. L6_2
    return L4_2
  else
    L4_2 = L0_1
    L5_2 = A0_2
    L6_2 = L3_2
    L4_2 = L4_2 .. L5_2 .. L6_2
    return L4_2
  end
end
L5_1 = {}
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  A0_2.__index = A0_2
  L2_2 = setmetatable
  L3_2 = {}
  L4_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2.route = A1_2
  L3_2 = {}
  L2_2.items = L3_2
  L2_2.rateLimitRemaining = 0
  L2_2.rateLimitReset = 0
  L2_2.rateLimitHits = 0
  return L2_2
end
L5_1.new = L6_1
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = table
  L2_2 = L2_2.insert
  L3_2 = A0_2.items
  L4_2 = 1
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
L5_1.enqueue = L6_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = table
  L1_2 = L1_2.remove
  L2_2 = A0_2.items
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = L1_2
    L2_2 = L2_2()
    if not L2_2 then
      L2_2 = table
      L2_2 = L2_2.insert
      L3_2 = A0_2.items
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
    end
  end
end
L5_1.dequeue = L6_1
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.items
  L1_2 = #L1_2
  L1_2 = L1_2 > 0
  return L1_2
end
L5_1.isReady = L6_1
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = A0_2.rateLimitRemaining
  L3_2 = L3_2 - 1
  A0_2.rateLimitRemaining = L3_2
  if 429 == A1_2 then
    A0_2.rateLimitRemaining = 0
    L3_2 = A0_2.rateLimitHits
    L3_2 = L3_2 + 1
    A0_2.rateLimitHits = L3_2
    L3_2 = os
    L3_2 = L3_2.time
    L3_2 = L3_2()
    L4_2 = A0_2.rateLimitHits
    L4_2 = L4_2 * 5
    L3_2 = L3_2 + L4_2
    A0_2.rateLimitReset = L3_2
    L3_2 = false
    return L3_2
  else
    L3_2 = A0_2.rateLimitHits
    if L3_2 > 0 then
      L3_2 = A0_2.rateLimitHits
      L3_2 = L3_2 - 1
      A0_2.rateLimitHits = L3_2
    end
    L3_2 = L3_1
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = tonumber
      L4_2 = A2_2["x-ratelimit-remaining"]
      L3_2 = L3_2(L4_2)
      L4_2 = tonumber
      L5_2 = A2_2["x-ratelimit-reset"]
      L4_2 = L4_2(L5_2)
      if L3_2 then
        A0_2.rateLimitRemaining = L3_2
      end
      if L4_2 then
        A0_2.rateLimitReset = L4_2
      end
    end
    L3_2 = true
    return L3_2
  end
end
L5_1.processResponse = L6_1
L6_1 = {}
DiscordRest = L6_1
L6_1 = DiscordRest
L7_1 = {}
L7_1.GUILD_TEXT = 0
L7_1.DM = 1
L7_1.GUILD_VOICE = 2
L7_1.GROUP_DM = 3
L7_1.GUILD_CATEGORY = 4
L7_1.GUILD_NEWS = 5
L7_1.GUILD_STORE = 6
L7_1.GUILD_NEWS_THREAD = 10
L7_1.GUILD_PUBLIC_THREAD = 11
L7_1.GUILD_PRIVATE_THREAD = 12
L7_1.GUILD_STAGE_VOICE = 13
L6_1.channelTypes = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  A0_2.__index = A0_2
  L2_2 = setmetatable
  L3_2 = {}
  L4_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2.botToken = A1_2
  L3_2 = {}
  L2_2.queues = L3_2
  L3_2 = Citizen
  L3_2 = L3_2.CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3
    while true do
      L0_3 = L2_2
      if not L0_3 then
        break
      end
      L0_3 = Citizen
      L0_3 = L0_3.Wait
      L1_3 = L2_2
      L2_3 = L1_3
      L1_3 = L1_3.processQueues
      L1_3 = L1_3(L2_3)
      if L1_3 then
        L1_3 = 0
        if L1_3 then
          goto lbl_15
        end
      end
      L1_3 = 500
      ::lbl_15::
      L0_3(L1_3)
    end
  end
  L3_2(L4_2)
  return L2_2
end
L6_1.new = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.queues
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = A0_2.queues
    L3_2 = L5_1
    L4_2 = L3_2
    L3_2 = L3_2.new
    L5_2 = A1_2
    L3_2 = L3_2(L4_2, L5_2)
    L2_2[A1_2] = L3_2
  end
  L2_2 = A0_2.queues
  L2_2 = L2_2[A1_2]
  return L2_2
end
L6_1.getQueue = L7_1
L6_1 = DiscordRest
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = false
  L2_2 = pairs
  L3_2 = A0_2.queues
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L9_2 = L7_2
    L8_2 = L7_2.isReady
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L9_2 = L7_2
      L8_2 = L7_2.dequeue
      L8_2(L9_2)
      L1_2 = true
      L8_2 = Citizen
      L8_2 = L8_2.Wait
      L9_2 = 50
      L8_2(L9_2)
    end
  end
  return L1_2
end
L6_1.processQueues = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = "Bot "
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = A0_2.botToken
    if not L3_2 then
      L3_2 = ""
    end
  end
  L2_2 = L2_2 .. L3_2
  return L2_2
end
L6_1.getAuthorization = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2
  if not A6_2 then
    L7_2 = {}
    A6_2 = L7_2
  end
  if A5_2 then
    L7_2 = type
    L8_2 = A5_2
    L7_2 = L7_2(L8_2)
    if "string" ~= L7_2 then
      A6_2["Content-Type"] = "application/json"
      L7_2 = json
      L7_2 = L7_2.encode
      L8_2 = A5_2
      L7_2 = L7_2(L8_2)
      A5_2 = L7_2
    end
  else
    A6_2["Content-Length"] = "0"
    A5_2 = ""
  end
  L8_2 = A1_2
  L7_2 = A1_2.enqueue
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = promise
    L0_3 = L0_3.new
    L0_3 = L0_3()
    L1_3 = PerformHttpRequest
    L2_3 = A2_2
    function L3_3(A0_4, A1_4, A2_4)
      local L3_4, L4_4, L5_4, L6_4, L7_4
      L3_4 = A1_2
      L4_4 = L3_4
      L3_4 = L3_4.processResponse
      L5_4 = A0_4
      L6_4 = A2_4
      L3_4 = L3_4(L4_4, L5_4, L6_4)
      if L3_4 then
        L3_4 = L0_3
        L4_4 = L3_4
        L3_4 = L3_4.resolve
        L5_4 = true
        L3_4(L4_4, L5_4)
        L3_4 = A3_2
        if L3_4 then
          L3_4 = A3_2
          L4_4 = A0_4
          L5_4 = A1_4
          L6_4 = A2_4
          L3_4(L4_4, L5_4, L6_4)
        end
      else
        L3_4 = L0_3
        L4_4 = L3_4
        L3_4 = L3_4.resolve
        L5_4 = false
        L3_4(L4_4, L5_4)
        L3_4 = Config
        L3_4 = L3_4.debug
        if L3_4 then
          L3_4 = print
          L4_4 = "Rate limiting detected for %s, this request will be requeued after %d seconds"
          L5_4 = L4_4
          L4_4 = L4_4.format
          L6_4 = A2_2
          L7_4 = A1_2.rateLimitHits
          L7_4 = L7_4 * 5
          L4_4, L5_4, L6_4, L7_4 = L4_4(L5_4, L6_4, L7_4)
          L3_4(L4_4, L5_4, L6_4, L7_4)
        end
      end
    end
    L4_3 = A4_2
    L5_3 = A5_2
    L6_3 = A6_2
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
    L1_3 = Citizen
    L1_3 = L1_3.Await
    L2_3 = L0_3
    return L1_3(L2_3)
  end
  L7_2(L8_2, L9_2)
end
L6_1.enqueueRequest = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L8_2 = A0_2
  L7_2 = A0_2.getQueue
  L9_2 = A1_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = L4_1
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = promise
  L9_2 = L9_2.new
  L9_2 = L9_2()
  L11_2 = A0_2
  L10_2 = A0_2.enqueueRequest
  L12_2 = L7_2
  L13_2 = L8_2
  L14_2 = createSimplePromiseCallback
  L15_2 = L9_2
  L14_2 = L14_2(L15_2)
  L15_2 = A4_2
  L16_2 = A5_2
  L17_2 = A6_2
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  return L9_2
end
L6_1.performRequest = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L7_2 = A0_2
  L6_2 = A0_2.getQueue
  L8_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = A1_2
  L8_2 = createQueryString
  L9_2 = A2_2
  L8_2 = L8_2(L9_2)
  L7_2 = L7_2 .. L8_2
  L8_2 = promise
  L8_2 = L8_2.new
  L8_2 = L8_2()
  L10_2 = A0_2
  L9_2 = A0_2.enqueueRequest
  L11_2 = L6_2
  L12_2 = L7_2
  L13_2 = createSimplePromiseCallback
  L14_2 = L8_2
  L13_2 = L13_2(L14_2)
  L14_2 = A3_2
  L15_2 = A4_2
  L16_2 = A5_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  return L8_2
end
L6_1.performRequestToWebhook = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L8_2 = A0_2
  L7_2 = A0_2.performRequest
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L12_2 = A4_2
  L13_2 = A5_2
  L14_2 = {}
  L16_2 = A0_2
  L15_2 = A0_2.getAuthorization
  L17_2 = A6_2
  L15_2 = L15_2(L16_2, L17_2)
  L14_2.Authorization = L15_2
  return L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
L6_1.performAuthorizedRequest = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.threadUser
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "PUT"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.addThreadMember = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.bulkDelete
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = {}
  L10_2.messages = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.bulkDeleteMessages = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.channelInvites
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = A2_2 or L10_2
  if not A2_2 then
    L10_2 = {}
  end
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.createChannelInvite = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.messages
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.createMessage = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.ownReaction
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L9_2 = nil
  L10_2 = "PUT"
  L11_2 = nil
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.createReaction = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.crosspost
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.crosspostMessage = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.reactions
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.deleteAllReactions = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.reaction
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L9_2 = nil
  L10_2 = "DELETE"
  L11_2 = nil
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.deleteAllReactionsForEmoji = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.channel
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "DELETE"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.deleteChannel = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.editChannelPermissions
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.deleteChannelPermission = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.message
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.deleteMessage = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.ownReaction
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L9_2 = nil
  L10_2 = "DELETE"
  L11_2 = nil
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.deleteOwnReaction = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L7_2 = A0_2
  L6_2 = A0_2.performAuthorizedRequest
  L8_2 = L1_1.userReaction
  L9_2 = {}
  L10_2 = A1_2
  L11_2 = A2_2
  L12_2 = A3_2
  L13_2 = A4_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L10_2 = nil
  L11_2 = "DELETE"
  L12_2 = nil
  L13_2 = A5_2
  return L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L6_1.deleteUserReaction = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.editChannelPermissions
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "PUT"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.editChannelPermissions = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.message
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "PATCH"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.editMessage = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.followers
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = {}
  L10_2.webhook_channel_id = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.followNewsChannel = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.channel
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getChannel = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.channelInvites
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getChannelInvites = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.message
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.getChannelMessage = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.messages
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = A2_2
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.getChannelMessages = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.pins
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getPinnedMessages = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L7_2 = A0_2
  L6_2 = A0_2.performAuthorizedRequest
  L8_2 = L1_1.reaction
  L9_2 = {}
  L10_2 = A1_2
  L11_2 = A2_2
  L12_2 = A3_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L10_2 = A4_2
  L11_2 = "GET"
  L12_2 = nil
  L13_2 = A5_2
  return L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L6_1.getReactions = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.groupDm
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "PUT"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.groupDmAddRecipient = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.groupDm
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.groupDmRemoveRecipient = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.threadSelf
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "PUT"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.joinThread = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.threadSelf
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "DELETE"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.leaveThread = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.activeThreads
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.listActiveThreads = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.joinedThreads
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = A2_2
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.listJoinedPrivateArchivedThreads = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.privateThreads
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = A2_2
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.listPrivateArchivedThreads = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.publicThreads
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = A2_2
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.listPublicArchivedThreads = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.threadMembers
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.listThreadMembers = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.channel
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "PATCH"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.modifyChannel = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.pinMessage
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "PUT"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.pinMessage = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.threadUser
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.removeThreadMember = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.messageThreads
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "POST"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.startThreadWithMessage = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = A2_2.auto_archive_duration
  if not L4_2 then
    A2_2.auto_archive_duration = 1440
  end
  L4_2 = type
  L5_2 = A2_2.type
  L4_2 = L4_2(L5_2)
  if "string" == L4_2 then
    L4_2 = DiscordRest
    L4_2 = L4_2.channelTypes
    L5_2 = A2_2.type
    L4_2 = L4_2[L5_2]
    A2_2.type = L4_2
  end
  L4_2 = A2_2.type
  if not L4_2 then
    L4_2 = DiscordRest
    L4_2 = L4_2.channelTypes
    L4_2 = L4_2.GUILD_PUBLIC_THREAD
    A2_2.type = L4_2
  end
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.channelThreads
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.startThreadWithoutMessage = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.typing
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "POST"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.triggerTypingIndicator = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.pinMessage
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.unpinMessage = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guildEmojis
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.createGuildEmoji = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guildEmoji
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.deleteGuildEmoji = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guildEmoji
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.getGuildEmoji = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.guildEmojis
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.listGuildEmojis = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.guildEmoji
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "PATCH"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.modifyGuildEmoji = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.guildMember
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "PUT"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.addGuildMember = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.memberRole
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L9_2 = nil
  L10_2 = "PUT"
  L11_2 = nil
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.addGuildMemberRole = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.prune
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = A2_2
  L11_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = L4_2
  L4_2 = L4_2.next
  function L6_2(A0_3)
    local L1_3
    L1_3 = A0_3.pruned
    return L1_3
  end
  return L4_2(L5_2, L6_2)
end
L6_1.beginGuildPrune = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.guilds
  L6_2 = nil
  L7_2 = nil
  L8_2 = "POST"
  L9_2 = A1_2
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.createGuild = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.ban
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "PUT"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.createGuildBan = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guildChannels
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.createGuildChannel = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.roles
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "POST"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.createGuildRole = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.guild
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "DELETE"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.deleteGuild = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.integration
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.deleteGuildIntegration = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.role
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.deleteGuildRole = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guild
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = {}
  L8_2.with_counts = A2_2
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.getGuild = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.ban
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.getGuildBan = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.bans
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildBans = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.guildChannels
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildChannels = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.integrations
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildIntegrations = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.guildInvites
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildInvites = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guildMember
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.getGuildMember = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.guildPreview
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildPreview = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.prune
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = A2_2
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = L4_2
  L4_2 = L4_2.next
  function L6_2(A0_3)
    local L1_3
    L1_3 = A0_3.pruned
    return L1_3
  end
  return L4_2(L5_2, L6_2)
end
L6_1.getGuildPruneCount = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.roles
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildRoles = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.vanityUrl
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildVanityUrl = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.regions
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildVoiceRegions = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.welcomeScreen
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildWelcomeScreen = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = A0_2
  L2_2 = A0_2.performRequest
  L4_2 = L1_1.widgetJson
  L5_2 = {}
  L6_2 = A1_2
  L5_2[1] = L6_2
  L6_2 = nil
  L7_2 = "GET"
  L8_2 = nil
  return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
end
L6_1.getGuildWidget = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.widget
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.getGuildWidgetSettings = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.guildThreads
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.listActiveGuildThreads = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guildMembers
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = A2_2
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.listGuildMembers = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.nick
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = {}
  L8_2.nick = A2_2
  L9_2 = "PATCH"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.modifyCurrentUserNick = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.myVoiceState
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "PATCH"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.modifyCurrentUserVoiceState = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guild
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "PATCH"
  L10_2 = params
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.modifyGuild = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guildChannels
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "PATCH"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.modifyGuildChannelPositions = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.guildMember
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "PATCH"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.modifyGuildMember = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.role
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "PATCH"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.modifyGuildRole = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.roles
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "PATCH"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.modifyGuildRolePositions = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.welcomeScreen
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "PATCH"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.modifyGuildWelcomeScreen = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.widget
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "PATCH"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.modifyGuildWidget = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.userVoiceState
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = nil
  L10_2 = "PATCH"
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.modifyUserVoiceState = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.ban
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.removeGuildBan = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.guildMember
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = nil
  L9_2 = "DELETE"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.removeGuildMember = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L6_2 = A0_2
  L5_2 = A0_2.performAuthorizedRequest
  L7_2 = L1_1.memberRole
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L9_2 = nil
  L10_2 = "DELETE"
  L11_2 = nil
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L6_1.removeGuildMemberRole = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.searchMembers
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = A2_2
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1.searchGuildMembers = L7_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.invite
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "DELETE"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.deleteInvite = L7_1
L6_1 = DiscordRest
L7_1 = "getInvite"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.invite
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = A2_2
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.createDm
  L6_2 = nil
  L7_2 = nil
  L8_2 = "POST"
  L9_2 = {}
  L9_2.recipient_id = A1_2
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1.createDm = L7_1
L6_1 = DiscordRest
L7_1 = "getCurrentUser"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = A0_2
  L2_2 = A0_2.performAuthorizedRequest
  L4_2 = L1_1.currentUser
  L5_2 = nil
  L6_2 = nil
  L7_2 = "GET"
  L8_2 = nil
  L9_2 = A1_2
  return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getCurrentUserGuilds"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.myGuilds
  L6_2 = nil
  L7_2 = A1_2
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getUser"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.user
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getUserConnections"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = A0_2
  L2_2 = A0_2.performAuthorizedRequest
  L4_2 = L1_1.myConnections
  L5_2 = nil
  L6_2 = nil
  L7_2 = "GET"
  L8_2 = nil
  L9_2 = A1_2
  return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "leaveGuild"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.myGuild
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "DELETE"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "modifyCurrentUser"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.currentUser
  L6_2 = nil
  L7_2 = nil
  L8_2 = "PATCH"
  L9_2 = A1_2
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "deleteWebhook"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.webhookId
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "DELETE"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "deleteWebhookMessage"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = A0_2
  L4_2 = A0_2.performRequest
  L6_2 = L1_1.webhookMessage
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = A3_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L8_2 = nil
  L9_2 = "DELETE"
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "deleteWebhookWithToken"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = A0_2
  L3_2 = A0_2.deleteWebhookWithUrl
  L5_2 = L4_1
  L6_2 = L1_1.webhook
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2)
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "deleteWebhookWithUrl"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L3_2 = A0_2
  L2_2 = A0_2.performRequestToWebhook
  L4_2 = A1_2
  L5_2 = nil
  L6_2 = "DELETE"
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "editWebhookMessage"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L6_2 = A0_2
  L5_2 = A0_2.performRequest
  L7_2 = L1_1.webhookMessage
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L9_2 = nil
  L10_2 = "PATCH"
  L11_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "executeGitHubCompatibleWebhook"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L6_2 = A0_2
  L5_2 = A0_2.executeGitHubCompatibleWebhookUrl
  L7_2 = L4_1
  L8_2 = L1_1.github
  L9_2 = {}
  L10_2 = A1_2
  L11_2 = A2_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = A3_2
  L9_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "executeGitHubCompatibleWebhookUrl"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = A0_2
  L4_2 = A0_2.performRequestToWebhook
  L6_2 = A1_2
  L7_2 = A3_2
  L8_2 = "POST"
  L9_2 = A2_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "executeSlackCompatibleWebhook"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L6_2 = A0_2
  L5_2 = A0_2.executeSlackCompatibleWebhookUrl
  L7_2 = L4_1
  L8_2 = L1_1.slack
  L9_2 = {}
  L10_2 = A1_2
  L11_2 = A2_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = A3_2
  L9_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "executeSlackCompatibleWebhookUrl"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = A0_2
  L4_2 = A0_2.performRequestToWebhook
  L6_2 = A1_2
  L7_2 = A3_2
  L8_2 = "POST"
  L9_2 = A2_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "executeWebhook"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L6_2 = A0_2
  L5_2 = A0_2.executeWebhookUrl
  L7_2 = L4_1
  L8_2 = L1_1.webhook
  L9_2 = {}
  L10_2 = A1_2
  L11_2 = A2_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = A3_2
  L9_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "executeWebhookUrl"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = A0_2
  L4_2 = A0_2.performRequestToWebhook
  L6_2 = A1_2
  L7_2 = A3_2
  L8_2 = "POST"
  L9_2 = A2_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getChannelWebhooks"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.webhooks
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getGuildWebhooks"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.guildWebhooks
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getWebhook"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2
  L3_2 = A0_2.performAuthorizedRequest
  L5_2 = L1_1.webhookId
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L7_2 = nil
  L8_2 = "GET"
  L9_2 = nil
  L10_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getWebhookMessage"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performRequest
  L6_2 = L1_1.webhookMessage
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = A3_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L8_2 = nil
  L9_2 = "GET"
  L10_2 = nil
  L11_2 = botToken
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getWebhookWithToken"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = A0_2
  L3_2 = A0_2.getWebhookWithUrl
  L5_2 = L4_1
  L6_2 = L1_1.webhook
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2)
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getWebhookWithUrl"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L3_2 = A0_2
  L2_2 = A0_2.performRequestToWebhook
  L4_2 = A1_2
  L5_2 = nil
  L6_2 = "GET"
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "modifyWebhook"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2
  L4_2 = A0_2.performAuthorizedRequest
  L6_2 = L1_1.webhookId
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L8_2 = nil
  L9_2 = "PATCH"
  L10_2 = A2_2
  L11_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "modifyWebhookWithToken"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = A0_2
  L4_2 = A0_2.modifyWebhookWithUrl
  L6_2 = L4_1
  L7_2 = L1_1.webhook
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "modifyWebhookWithUrl"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = A0_2
  L3_2 = A0_2.performRequestToWebhook
  L5_2 = A1_2
  L6_2 = nil
  L7_2 = "PATCH"
  L8_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getUserId"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = promise
  L2_2 = L2_2.new
  L2_2 = L2_2()
  L3_2 = ipairs
  L4_2 = GetPlayerIdentifiers
  L5_2 = A1_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L4_2(L5_2)
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L10_2 = L8_2
    L9_2 = L8_2.sub
    L11_2 = 1
    L12_2 = 8
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    if "discord:" == L9_2 then
      L10_2 = L2_2
      L9_2 = L2_2.resolve
      L12_2 = L8_2
      L11_2 = L8_2.sub
      L13_2 = 9
      L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
      return L9_2(L10_2, L11_2, L12_2, L13_2)
    end
  end
  L4_2 = L2_2
  L3_2 = L2_2.reject
  L5_2 = "Player %d has no Discord identifier"
  L6_2 = L5_2
  L5_2 = L5_2.format
  L7_2 = A1_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2, L7_2)
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "addGuildMemberRoleToPlayer"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L6_2 = A0_2
  L5_2 = A0_2.getUserId
  L7_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2
  L5_2 = L5_2.next
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.addGuildMemberRole
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    L6_3 = A4_2
    return L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
  end
  return L5_2(L6_2, L7_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "addPlayerToGuild"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L6_2 = A0_2
  L5_2 = A0_2.getUserId
  L7_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2
  L5_2 = L5_2.next
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.addGuildMember
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A2_2
    L6_3 = A3_2
    L7_3 = A4_2
    return L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
  end
  return L5_2(L6_2, L7_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "addPlayerToThread"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L5_2 = A0_2
  L4_2 = A0_2.getUserId
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2
  L4_2 = L4_2.next
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.addThreadMember
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  return L4_2(L5_2, L6_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "createGuildBanForPlayer"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L6_2 = A0_2
  L5_2 = A0_2.getUserId
  L7_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2
  L5_2 = L5_2.next
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.createGuildBan
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    L6_3 = A4_2
    return L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
  end
  return L5_2(L6_2, L7_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "deletePlayerReaction"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2
  L7_2 = A0_2
  L6_2 = A0_2.getUserId
  L8_2 = A4_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L6_2
  L6_2 = L6_2.next
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.deleteUserReaction
    L3_3 = A1_2
    L4_3 = A2_2
    L5_3 = A3_2
    L6_3 = A0_3
    L7_3 = A5_2
    return L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
  end
  return L6_2(L7_2, L8_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getGuildBanForPlayer"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L5_2 = A0_2
  L4_2 = A0_2.getUserId
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2
  L4_2 = L4_2.next
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.getGuildBan
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  return L4_2(L5_2, L6_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getGuildMemberForPlayer"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L5_2 = A0_2
  L4_2 = A0_2.getUserId
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2
  L4_2 = L4_2.next
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.getGuildMember
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  return L4_2(L5_2, L6_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "getUserForPlayer"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L4_2 = A0_2
  L3_2 = A0_2.getUserId
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L3_2
  L3_2 = L3_2.next
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.getUser
    L3_3 = A0_3
    L4_3 = A2_2
    return L1_3(L2_3, L3_3, L4_3)
  end
  return L3_2(L4_2, L5_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "groupDmAddPlayer"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L6_2 = A0_2
  L5_2 = A0_2.getUserId
  L7_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2
  L5_2 = L5_2.next
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.groupDmAddRecipient
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    L6_3 = A4_2
    return L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
  end
  return L5_2(L6_2, L7_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "groupDmRemovePlayer"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L5_2 = A0_2
  L4_2 = A0_2.getUserId
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2
  L4_2 = L4_2.next
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.groupDmRemoveRecipient
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  return L4_2(L5_2, L6_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "modifyGuildMemberForPlayer"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L6_2 = A0_2
  L5_2 = A0_2.getUserId
  L7_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2
  L5_2 = L5_2.next
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.modifyGuildMember
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    L6_3 = A4_2
    return L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
  end
  return L5_2(L6_2, L7_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "modifyPlayerVoiceState"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L6_2 = A0_2
  L5_2 = A0_2.getUserId
  L7_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2
  L5_2 = L5_2.next
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.modifyUserVoiceState
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    L6_3 = A4_2
    return L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
  end
  return L5_2(L6_2, L7_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "removeGuildBanForPlayer"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L5_2 = A0_2
  L4_2 = A0_2.getUserId
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2
  L4_2 = L4_2.next
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.removeGuildBan
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  return L4_2(L5_2, L6_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "removeGuildMemberRoleFromPlayer"
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L6_2 = A0_2
  L5_2 = A0_2.getUserId
  L7_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_2
  L5_2 = L5_2.next
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.removeGuildMemberRole
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    L6_3 = A4_2
    return L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
  end
  return L5_2(L6_2, L7_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "removePlayerFromGuild"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L5_2 = A0_2
  L4_2 = A0_2.getUserId
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2
  L4_2 = L4_2.next
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.removeGuildMember
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  return L4_2(L5_2, L6_2)
end
L6_1[L7_1] = L8_1
L6_1 = DiscordRest
L7_1 = "removePlayerFromThread"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L5_2 = A0_2
  L4_2 = A0_2.getUserId
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2
  L4_2 = L4_2.next
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.removeThreadMember
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A3_2
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  return L4_2(L5_2, L6_2)
end
L6_1[L7_1] = L8_1
L6_1 = _ENV
L7_1 = "ServerConfig"
L6_1 = L6_1[L7_1]
L7_1 = "DiscordBot"
L6_1 = L6_1[L7_1]
L7_1 = _ENV
L8_1 = "ServerConfig"
L7_1 = L7_1[L8_1]
L8_1 = "GuildID"
L7_1 = L7_1[L8_1]
L8_1 = _ENV
L9_1 = "ServerConfig"
L8_1 = L8_1[L9_1]
L9_1 = "ScriptAlertChannelID"
L8_1 = L8_1[L9_1]
if not L8_1 then
  L8_1 = nil
end
L9_1 = DiscordRest
L11_1 = "new"
L10_1 = L9_1
L9_1 = L9_1[L11_1]
L11_1 = L6_1
L9_1 = L9_1(L10_1, L11_1)
function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = promise
  L1_2 = L1_2.new
  L1_2 = L1_2()
  L2_2 = L9_1
  L3_2 = L2_2
  L2_2 = L2_2.getGuildChannels
  L4_2 = L7_1
  L5_2 = L6_1
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L2_2
  L2_2 = L2_2.next
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L1_3 = ipairs
    L2_3 = A0_3
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = L6_3.name
      L8_3 = A0_2
      if L7_3 == L8_3 then
        L7_3 = L1_2
        L8_3 = L7_3
        L7_3 = L7_3.resolve
        L9_3 = L6_3.id
        L7_3(L8_3, L9_3)
        return
      end
    end
    L1_3 = L1_2
    L2_3 = L1_3
    L1_3 = L1_3.reject
    L3_3 = "No channel named "
    L4_3 = A0_2
    L3_3 = L3_3 .. L4_3
    L1_3(L2_3, L3_3)
  end
  L2_2(L3_2, L4_2)
  return L1_2
end
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L10_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L2_2 = L2_2.next
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L9_1
    L2_3 = L1_3
    L1_3 = L1_3.createMessage
    L3_3 = A0_3
    L4_3 = A1_2
    L5_3 = L6_1
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  return L2_2(L3_2, L4_2)
end
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = promise
  L1_2 = L1_2.new
  L1_2 = L1_2()
  L2_2 = L9_1
  L3_2 = L2_2
  L2_2 = L2_2.performAuthorizedRequest
  L4_2 = "/guilds/"
  L5_2 = A0_2
  L6_2 = "?with_counts=true"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = {}
  L6_2 = nil
  L7_2 = "GET"
  L8_2 = nil
  L9_2 = L6_1
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = L2_2
  L2_2 = L2_2.next
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L1_2
    L2_3 = L1_3
    L1_3 = L1_3.resolve
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
  end
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L1_2
    L2_3 = L1_3
    L1_3 = L1_3.reject
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
  end
  L2_2(L3_2, L4_2, L5_2)
  return L1_2
end
L13_1 = _ENV
L14_1 = "sendVersionUpdateEmbed"
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = {}
  L3_2.title = "New Update Available"
  L4_2 = [[
A new update is available for **kartik-mdt**.

]]
  L5_2 = "Current Version: **"
  L6_2 = A0_2
  L7_2 = "**\n"
  L8_2 = "New Version: **"
  L9_2 = A1_2
  L10_2 = "**\n"
  L11_2 = "Changelogs: **"
  L12_2 = A2_2
  L13_2 = "**"
  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L3_2.description = L4_2
  L3_2.color = 5814783
  L4_2 = os
  L4_2 = L4_2.date
  L5_2 = "!%Y-%m-%dT%H:%M:%SZ"
  L4_2 = L4_2(L5_2)
  L3_2.timestamp = L4_2
  L4_2 = {}
  L5_2 = {}
  L5_2.type = 1
  L6_2 = {}
  L7_2 = {}
  L7_2.type = 2
  L7_2.style = 5
  L7_2.label = "Join Discord"
  L7_2.url = "https://discord.gg/Mxe4hFBNT3"
  L8_2 = {}
  L8_2.type = 2
  L8_2.style = 5
  L8_2.label = "Purchase Script"
  L8_2.url = "https://kartik-scripts.tebex.io"
  L9_2 = {}
  L9_2.type = 2
  L9_2.style = 5
  L9_2.label = "Documentation"
  L9_2.url = "https://kartik-scripts.gitbook.io"
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L5_2.components = L6_2
  L4_2[1] = L5_2
  L5_2 = L8_1
  if L5_2 then
    L5_2 = L9_1
    L6_2 = L5_2
    L5_2 = L5_2.createMessage
    L7_2 = L8_1
    L8_2 = {}
    L8_2.content = nil
    L9_2 = {}
    L10_2 = L3_2
    L9_2[1] = L10_2
    L8_2.embeds = L9_2
    L8_2.components = L4_2
    L9_2 = L6_1
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L6_2 = L5_2
    L5_2 = L5_2.next
    function L7_2(A0_3)
      local L1_3
      L1_3 = A0_3.id
      statusMessageId = L1_3
    end
    function L8_2(A0_3)
      local L1_3, L2_3, L3_3
      L1_3 = print
      L2_3 = "Failed to send version update message: "
      L3_3 = A0_3
      L2_3 = L2_3 .. L3_3
      L1_3(L2_3)
    end
    L5_2(L6_2, L7_2, L8_2)
  end
end
L13_1[L14_1] = L15_1
