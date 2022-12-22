FALSE = 0
TRUE = 1

-- condition return values
CONDITION_NOT_YET_MET = 0
CONDITION_SUCCEEDED = 1
CONDITION_FAILED = 2

-- Message types
MT_INFO = 0   -- large centre screen pop up
MT_ALERT = 1  -- top right alert message

MSG_TOP = 1
MSG_VCENTRE = 2
MSG_BOTTOM = 4
MSG_LEFT = 8
MSG_CENTRE = 16
MSG_RIGHT = 32

MSG_SMALL = 0
MSG_REG = 1
MSG_LRG = 2


---------------------------------------------
-- Code for scenario 2461
-- Simulated date: 13-05-1987
-- Simulated time: 07:43-08:37      (8AM-9AM)
-- https://weatherspark.com/h/m/148031/1987/5/Historical-Weather-in-May-1987-at-Soesterberg-Air-Base-Netherlands

-- Standard weather:  Fair Cloud
-- Extension weather: Weather Ext

function Initialise()
  math.randomseed(os.clock())
end

function OnEvent ( event )
  if string.sub(event, 1, 2) == "Wx" then
    local wxpattern = string.sub(event, 3, -1)
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", wxpattern )
  else
    _G["OnEvent" .. event]()
  end
end

function OnEventCustomWeather()
  local d = math.random(1, 31)

  if d == 1 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  elseif d == 2 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRain", 0);
  elseif d == 3 then
    -- Light rain + Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRainFog", 0);
  elseif d == 4 then
    -- 
  elseif d == 5 then
    -- 
  elseif d == 6 then
    -- 
  elseif d == 7 then
    -- 
  elseif d == 8 then
    -- 
  elseif d == 9 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  elseif d == 10 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  elseif d == 11 then
    -- Overcast
  elseif d == 12 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRain", 0);
  elseif d == 13 then
    -- Light rain showers
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRain", 0);
  elseif d == 14 then
    -- Light rain (showers) + Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRainFog", 0);
  elseif d == 15 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  elseif d == 16 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRain", 0);
  elseif d == 17 then
    -- 
  elseif d == 18 then
    -- Drizzle
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  elseif d == 19 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  elseif d == 20 then
    -- 
  elseif d == 21 then
    -- 
  elseif d == 22 then
    -- 
  elseif d == 23 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  elseif d == 24 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  elseif d == 25 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  elseif d == 26 then
    -- 
  elseif d == 27 then
    -- 
  elseif d == 28 then
    -- 
  elseif d == 29 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRain", 0);
  elseif d == 30 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRain", 0);
  else
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
  end
end
