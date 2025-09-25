if (GetResourceState('xsound') ~= "started") then
    return
end

function PlaySound(sound)
    if sound then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", sound, 0.25) -- xsound
    end
end
