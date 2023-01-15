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
-- Code for scenario 1523 (ZvNL)
-- Simulated date: 10-12-1996
-- Simulated time: 08:00-08:30      (8AM-9AM)
-- https://weatherspark.com/h/m/148026/1996/12/Historical-Weather-in-December-1996-at-Eindhoven-Airport-Netherlands

-- Standard weather:  Fair Cloud
-- Extension weather: Weather Extended

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

  local fogpattern = {"WxDrizzleFog", "WxLightRainFog"}
  fogpattern = fogpattern[math.random(1, 2)]
  local overcastpattern = "WxLightRain"

  if d == 1 then
    -- Fair
  elseif d == 2 then
    -- Fair
  elseif d == 3 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRain", 0);
  elseif d == 4 then
    -- Fair
  elseif d == 5 then
    -- Fair
  elseif d == 6 then
    -- Light rain, fog
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRainFog", 0);
  elseif d == 7 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0);
  elseif d == 8 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0);
  elseif d == 9 then
    -- Overcast
    SysCall("ScenarioManager:TriggerDeferredEvent", overcastpattern, 0);
  elseif d == 10 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0);
  elseif d == 11 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0);
  elseif d == 12 then
    -- Drizzle(/Sleet)
    if math.random(1, 2) == 1 then
      SysCall("ScenarioManager:TriggerDeferredEvent", "WxDrizzleFog", 0);
    else
      SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightSnow", 0);
    end
  elseif d == 13 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0);
  elseif d == 14 then
    -- Fair
  elseif d == 15 then
    -- Fair
  elseif d == 16 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0);
  elseif d == 17 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0);
  elseif d == 18 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0);
  elseif d == 19 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightRain", 0);
  elseif d == 20 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0);
  elseif d == 21 then
    -- Fair
  elseif d == 22 then
    -- Fair
  elseif d == 23 then
    -- Fair
  elseif d == 24 then
    -- Fair
  elseif d == 25 then
    -- Fair
  elseif d == 26 then
    -- Fair
  elseif d == 27 then
    -- Fair
  elseif d == 28 then
    -- Fair
  elseif d == 29 then
    -- Fair
  elseif d == 30 then
    -- Light snow
    SysCall("ScenarioManager:TriggerDeferredEvent", "WxLightSnow", 0);
  else
    -- Fair
  end
end
