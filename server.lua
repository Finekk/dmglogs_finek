
RegisterNetEvent("FiniuGUY:dmg")
AddEventHandler("FiniuGUY:dmg", function(Weapons, curMul)
  local webhook = 'TUTAJ_TWÓJ_WEBHOOK'

  local steamid = GetPlayerIdentifier(source)
  local nickname = GetPlayerName(source)
    local embed = {
          {
              ["color"] = 8663865,
              ["title"] = "Dmg boost ",
              ["description"] = "\nGracz: ".. nickname.."\n Steam:" .. steamid.."\n Posiada zwiększony damage broni".."\n",
              ["footer"] = {
                  ["text"] = "logi",
              },
          }
      }
  
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end)
