-- SlowAimStealthWalk
-- Version 1.0

local slow_speed = 0.5 -- walking speed multiplier when aiming down sights
local stealth_speed = 0.3 -- stealth walking speed multiplier

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()

        if IsPedAimingFromCover(playerPed) or IsPedInCover(playerPed, 0) then
            -- Do not change walking speed when in cover
        elseif IsPlayerFreeAiming(PlayerId()) then
            SetPedStealthMovement(playerPed, true, "DEFAULT_ACTION")
            SetPedMovementClipset(playerPed, "move_ped_crouched", 0.55)
            SetPlayerForcedAim(PlayerId(), true)
            SetPlayerMoveSpeedMultiplier(PlayerId(), slow_speed)
        else
            SetPlayerForcedAim(PlayerId(), false)
            ResetPedMovementClipset(playerPed, 0.0)
            ResetPedStrafeClipset(playerPed)
            SetPlayerMoveSpeedMultiplier(PlayerId(), 1.0)
        end
    end
end)
