Citizen.CreateThread( function()
	local heading, lastHeading = 0, 1
	if  Config.ShowCompass==true then
		SendNUIMessage({ action = "display", compass = compass })
	else
		SendNUIMessage({ action = "hide", compass = compass })
	end
	while Config.ShowCompass do
		Citizen.Wait(0)
		if Config.FollowCam then
			local camRot = GetGameplayCamRot(0)
			heading = tostring(round(360.0 - ((camRot.z + 360.0) % 360.0)))

		else
			heading = tostring(round(360.0 - GetEntityHeading(PlayerPedId())))
		end

		if heading == '360' then heading = '0' end

		if heading ~= lastHeading then
			if IsPedInAnyVehicle(PlayerPedId()) then
				SendNUIMessage({ action = "display", value = heading })
			else
				SendNUIMessage({ action = "hide", value = heading })
			end
		end
		lastHeading = heading
	end
end)


