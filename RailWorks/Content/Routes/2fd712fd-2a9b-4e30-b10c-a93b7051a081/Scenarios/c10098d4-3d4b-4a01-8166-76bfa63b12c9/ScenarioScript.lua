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
TRIGGER_PROBABILITY = 75
MAX_DEFERRED_MINS = 60

function OnEvent ( event )
  _G["OnEvent" .. event]()
end


---------------------------------------------
-- Code for scenario 2461
-- Simulated date: 20-06-1996
-- Simulated time: 12:29-13:11      (12PM-1PM)
-- https://weatherspark.com/h/m/147995/1996/6/Historical-Weather-in-June-1996-at-Rotterdam-The-Hague-Airport-Netherlands

-- Standard weather:  Fair Cloud
-- Extension weather: Overcast Ext

function Initialise()
  math.randomseed(os.clock())
end

function OnEventCustomWeather()
  local d = math.random(1, 30)

  if d == 1 then
    -- Fair
  elseif d == 2 then
    -- Fair
  elseif d == 3 then
    -- Fair
  elseif d == 4 then
    -- Fair
  elseif d == 5 then
    -- Fair
  elseif d == 6 then
    -- Fair
  elseif d == 7 then
    -- Clear
  elseif d == 8 then
    -- Fair
  elseif d == 9 then
    -- Fog
    local t1 = 0
    local t2 = t1 + 30*60
    SysCall("ScenarioManager:TriggerDeferredEvent", "LightRainShowerFog" .. math.random(1,6), t1);
    SysCall("ScenarioManager:TriggerDeferredEvent", "LightRainShowerFog" .. math.random(1,6), t2);
  elseif d == 10 then
    -- Fair
  elseif d == 11 then
    -- Fair
  elseif d == 12 then
    -- Fair
  elseif d == 13 then
    -- Fair
  elseif d == 14 then
    -- Fair
  elseif d == 15 then
    -- Fair
  elseif d == 16 then
    -- Fair
  elseif d == 17 then
    -- Fair
  elseif d == 18 then
    -- Fair
  elseif d == 19 then
    -- Fair
  elseif d == 20 then
    -- Fair
  elseif d == 21 then
    -- Fair
  elseif d == 22 then
    -- Light rain shower
    local t1 = math.random(0, 20*60)
    local t2 = t1 + 22*60 + math.random(0, 20*60)
    SysCall("ScenarioManager:TriggerDeferredEvent", "LightRainShower" .. math.random(1,6), t1);
    SysCall("ScenarioManager:TriggerDeferredEvent", "LightRainShower" .. math.random(1,6), t2);
  elseif d == 23 then
    -- Fair
  elseif d == 24 then
    -- Drizzle
    local t1 = 0
    local t2 = t1 + 30*60
    SysCall("ScenarioManager:TriggerDeferredEvent", "LightRainShower6", t1);
    SysCall("ScenarioManager:TriggerDeferredEvent", "LightRainShower6", t2);
  elseif d == 25 then
    -- Overcast
    if math.random(1, 2) == 1 then
      SysCall("ScenarioManager:TriggerDeferredEvent", "OvercastClear", 0);
    else
      SysCall("ScenarioManager:TriggerDeferredEvent", "ClearOvercast", 0);
    end
  elseif d == 26 then
    -- Drizzle
    local t1 = 0
    local t2 = t1 + 30*60
    SysCall("ScenarioManager:TriggerDeferredEvent", "LightRainShower6", t1);
    SysCall("ScenarioManager:TriggerDeferredEvent", "LightRainShower6", t2);
  elseif d == 27 then
    -- Fair
  elseif d == 28 then
    -- Fair
  elseif d == 29 then
    -- Fair
  else
    -- Fair
  end
end


function OnEventOvercastClear()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "OvercastClear" )
end

function OnEventClearOvercast()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ClearOvercast" )
end

function OnEventDrizzleFog()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "DrizzleFog" )
end

function OnEventLightRain()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRain" )
end

function OnEventLightRainShowerFog1()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShowerFog1" )
end
function OnEventLightRainShowerFog2()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShowerFog2" )
end
function OnEventLightRainShowerFog3()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShowerFog3" )
end
function OnEventLightRainShowerFog4()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShowerFog4" )
end
function OnEventLightRainShowerFog5()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShowerFog5" )
end
function OnEventLightRainShowerFog6()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShowerFog6" )
end

function OnEventLightRainShower1()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShower1" )
end
function OnEventLightRainShower2()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShower2" )
end
function OnEventLightRainShower3()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShower3" )
end
function OnEventLightRainShower4()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShower4" )
end
function OnEventLightRainShower5()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShower5" )
end
function OnEventLightRainShower6()
  SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightRainShower6" )
end
