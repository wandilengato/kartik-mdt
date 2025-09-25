local function joinRadio(radioNumber)
    radioNumber = tonumber(radioNumber)
    if not radioNumber or radioNumber < 0 then return end

    if GetResourceState('cs_walkietalkie') == "started" then
        exports["cs_walkietalkie"]:joinRadio(radioNumber)
    elseif GetResourceState('zerio-radio') == "started" then
        exports["zerio-radio"]:ChangeChannel(radioNumber)
    elseif GetResourceState('mm_radio') == "started" then
        exports["mm_radio"]:JoinRadio(radioNumber)
    elseif GetResourceState('scully_radio') == "started" then
        TriggerEvent("scully_radio:joinChannel", radioNumber)
    elseif GetResourceState('stRadio') == "started" then
        exports['stRadio']:setnoRangeChannel(radioNumber)
    else
        if GetResourceState('pma-voice') == "started" then
            exports['pma-voice']:setRadioChannel(radioNumber)
            exports['pma-voice']:setVoiceProperty('radioEnabled', true)
        else
            print("No radio resource found to join the channel.")
        end
    end
end

local function leaveRadio()
    if GetResourceState('cs_walkietalkie') == "started" then
        exports["cs_walkietalkie"]:joinRadio(0)
    elseif GetResourceState('zerio-radio') == "started" then
        exports["zerio-radio"]:ChangeChannel(0)
    elseif GetResourceState('mm_radio') == "started" then
        exports["mm_radio"]:LeaveRadio()
    elseif GetResourceState('scully_radio') == "started" then
        TriggerEvent("scully_radio:leaveChannel")
    elseif GetResourceState('stRadio') == "started" then
        exports['stRadio']:setnoRangeChannel(0)
    else
        if GetResourceState('pma-voice') == "started" then
            exports['pma-voice']:setRadioChannel(0)
            exports['pma-voice']:setVoiceProperty('radioEnabled', false)
        else
            print("No radio resource found to leave the channel.")
        end
    end
end

RegisterNetEvent("kartik-mdt:client:updateRadioChannel", function(radioNumber, isJoin)
    if isJoin then
        joinRadio(radioNumber)
    else
        leaveRadio()
    end
end)
