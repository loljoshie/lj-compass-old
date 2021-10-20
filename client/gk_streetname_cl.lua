Citizen.CreateThread( function()
	local lastStreetA = 0
	local lastStreetB = 0

	while Config.ShowStreet do
		Citizen.Wait(0)

		local playerPos = GetEntityCoords(PlayerPedId(), true)
		local streetA, streetB = GetStreetNameAtCoord(playerPos.x, playerPos.y, playerPos.z)
		street = {}

		if not ((streetA == lastStreetA or streetA == lastStreetB) and (streetB == lastStreetA or streetB == lastStreetB)) then
			lastStreetA = streetA
			lastStreetB = streetB
		end

		if lastStreetA ~= 0 then
			table.insert(street, GetStreetNameFromHashKey(lastStreetA))
		end

		if lastStreetB ~= 0 then
			table.insert(street, GetStreetNameFromHashKey(lastStreetB))
		end

		if street ~= laststreet then
			if IsPedInAnyVehicle(PlayerPedId()) then
				SendNUIMessage({action = "display", streetB =  GetStreetNameFromHashKey(lastStreetB)})
				SendNUIMessage({action = "display", streetA =  GetStreetNameFromHashKey(lastStreetA)})
			else
				SendNUIMessage({action = "hide", type = streetA})
			end
			
			Citizen.Wait(50)
		end
		laststreet = street
		Citizen.Wait(100)
	end
end)
