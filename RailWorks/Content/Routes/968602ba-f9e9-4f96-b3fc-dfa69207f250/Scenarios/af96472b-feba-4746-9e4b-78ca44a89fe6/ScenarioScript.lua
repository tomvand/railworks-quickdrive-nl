FALSE = 0
TRUE = 1

function OnEvent ( event )
	if event == "RandomWeather" then
		math.randomseed(os.time())
		local wx = math.random(1, 3)
		SysCall ( "WeatherController:SetCurrentWeatherEventChain", "Weather" .. tostring(wx) )
		return TRUE;
	end

	-- if event == "SingleWeather1" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather1" )
	-- 	return TRUE;
	-- end
	
	-- if event == "SingleWeather2" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather2" )
	-- 	return TRUE;
	-- end
	
	-- if event == "SingleWeather3" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather3" )
	-- 	return TRUE;
	-- end
	
	-- if event == "SingleWeather4" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather4" )
	-- 	return TRUE;
	-- end
	
	-- if event == "SingleWeather5" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather5" )
	-- 	return TRUE;
	-- end
	
	-- if event == "SingleWeather6" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather6" )
	-- 	return TRUE;
	-- end
	
	-- if event == "Weather1" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "Weather1" )
	-- 	return TRUE;
	-- end
	
	-- if event == "Weather2" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "Weather2" )
	-- 	return TRUE;
	-- end
	
	-- if event == "Weather3" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "Weather3" )
	-- 	return TRUE;
	-- end
	
	-- if event == "DrizzleFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "DrizzleFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "LightRain" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRain" )
	-- 	return TRUE;
	-- end
	
	-- if event == "LightRainFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainFog" )
	-- 	return TRUE;
	-- end
		
	-- if event == "ModRain" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ModRain" )
	-- 	return TRUE;
	-- end
	
	-- if event == "ModRainFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ModRainFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "HeavyRain" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "HeavyRain" )
	-- 	return TRUE;
	-- end
	
	-- if event == "HeavyRainFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "HeavyRainFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "LightSnow" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightSnow" )
	-- 	return TRUE;
	-- end
	
	-- if event == "LightSnowFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightSnowFog" )
	-- 	return TRUE;
	-- end
		
	-- if event == "ModSnow" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ModSnow" )
	-- 	return TRUE;
	-- end
	
	-- if event == "ModSnowFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ModSnowFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "HeavySnow" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "HeavySnow" )
	-- 	return TRUE;
	-- end
	
	-- if event == "HeavySnowFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "HeavySnowFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "ClearLightFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ClearLightFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "ClearMedFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ClearMedFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "ClearThickFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ClearThickFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "LightFogClear" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightFogClear" )
	-- 	return TRUE;
	-- end
	
	-- if event == "MedFogClear" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "MedFogClear" )
	-- 	return TRUE;
	-- end
	
	-- if event == "ThickFogClear" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ThickFogClear" )
	-- 	return TRUE;
	-- end
	
	-- if event == "MistLightFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "MistLightFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "MistMedFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "MistMedFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "MistThickFog" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "MistThickFog" )
	-- 	return TRUE;
	-- end
	
	-- if event == "LightFogMist" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightFogMist" )
	-- 	return TRUE;
	-- end
	
	-- if event == "MedFogMist" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "MedFogMist" )
	-- 	return TRUE;
	-- end
	
	-- if event == "ThickFogMist" then
	-- 	SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ThickFogMist" )
	-- 	return TRUE;
	-- end
end