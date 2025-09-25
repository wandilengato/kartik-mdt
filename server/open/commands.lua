lib.addCommand('911', {
    help = 'Send a message to 911',
    params = {{
        name = 'message',
        type = 'string',
        help = '911 Message'
    }}
}, function(source, args, raw)
    local fullMessage = raw:sub(5)
    local jobs = {
        police = true
    }
    TriggerClientEvent('kartik-mdt:client:sendCall', source, fullMessage, false, jobs, "911")
end)

lib.addCommand('911a', {
    help = 'Send an anonymous message to 911',
    params = {{
        name = 'message',
        type = 'string',
        help = '911 Message'
    }}
}, function(source, args, raw)
    local fullMessage = raw:sub(5)
    local jobs = {
        police = true
    }
    TriggerClientEvent('kartik-mdt:client:sendCall', source, fullMessage, true, jobs, "911")
end)

lib.addCommand('311', {
    help = 'Send a message to 311',
    params = {{
        name = 'message',
        type = 'string',
        help = '311 Message'
    }}
}, function(source, args, raw)
    local fullMessage = raw:sub(5)
    local jobs = {
        ems = true
    }
    TriggerClientEvent('kartik-mdt:client:sendCall', source, fullMessage, false, jobs, "311")
end)

lib.addCommand('311a', {
    help = 'Send an anonymous message to 311',
    params = {{
        name = 'message',
        type = 'string',
        help = '311 Message'
    }}
}, function(source, args, raw)
    local fullMessage = raw:sub(5)
    local jobs = {
        ems = true
    }
    TriggerClientEvent('kartik-mdt:client:sendCall', source, fullMessage, true, jobs, "311")
end)

lib.addCommand('311r', {
    help = 'Send a reply message to 311',
    params = {
        {
            name = 'id',
            type = 'number',
            help = 'Incident Id',
        },
        {
            name = 'message',
            type = 'string',
            help = '311 Message'
        },
    }
}, function(source, args, raw)
    local trimmedRaw = raw:sub(#'311r' + 2)
    local spacePos = trimmedRaw:find(' ')
    local message = trimmedRaw:sub(spacePos + 1)
    ReplyToIncident(source, args.id, message)
end)

lib.addCommand('911r', {
    help = 'Send a reply message to 911',
    params = {
        {
            name = 'id',
            type = 'number',
            help = 'Incident Id',
        },
        {
            name = 'message',
            type = 'string',
            help = '911 Message'
        },
    }
}, function(source, args, raw)
    local trimmedRaw = raw:sub(#'911r' + 2)
    local spacePos = trimmedRaw:find(' ')
    local message = trimmedRaw:sub(spacePos + 1)
    ReplyToIncident(source, args.id, message)
end)
