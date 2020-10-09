
    FiniuGUY = {}

FiniuGUY.Weapons = { -- Wyjatki broni jesli macie zwiekszony dmg

    [`weapon_bron`] = 2.0,
}



Citizen.CreateThread(function()

    local aiming, shooting, curMul, _, weapon = nil, nil, nil



    for weaponHash,weaponDamage in pairs(FiniuGUY.Weapons) do _SET_WEAPON_DAMAGE_MODIFIER(weaponHash, weaponDamage) end



    while true do
      Citizen.Wait(100)
        aiming, shooting = IsControlPressed(0, 25), IsPedShooting(PlayerPedId())

        

        if aiming or shooting then            

            _, weapon = GetCurrentPedWeapon(PlayerPedId(), true)



            if _ then

                curMul = GetPlayerWeaponDamageModifier(PlayerId())

                _SET_WEAPON_DAMAGE_MODIFIER(weapon, (FiniuGUY.Weapons[weapon] or 1.0))



                if curMul > (FiniuGUY.Weapons[weapon] or 1.0) then

                    TriggerServerEvent('FiniuGUY:dmg', curMul, (FiniuGUY.Weapons[weapon] or 1.0))

                    Citizen.Wait(60000)

                end

            end

        else

            Citizen.Wait(10)

        end



        Citizen.Wait(0)

    end

end)
