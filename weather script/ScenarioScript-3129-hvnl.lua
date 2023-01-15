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
-- Code for scenario 3129 (HvNL)
-- Simulated date: 16 feb 2009
-- Simulated time: 9AM-10AM
-- https://weatherspark.com/h/m/148029/2022/12/Historical-Weather-in-December-2022-at-Deelen-Air-Base-Netherlands

-- Standard weather:  Fair
-- Extension weather: Weather ext

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
  local d = math.random(1, 28)

  local clearpattern = ({"WxClearLightFog", "LightFogClear"})[math.random(1, 2)]
  local lightrainpattern = "WxLightRain"
  local lightrainfogpattern = "WxLightRainFog"
  local drizzlefogpattern = "WxDrizzleFog"
  local fogpattern = "WxDrizzleFog"
  local snowpattern = "WxLightSnow"
  local snowfogpattern = "WxLightSnowFog"
  local snowshowerspattern = "WxLightSnow"
  local sleetfogpattern = "WxLightSnowFog"
  local overcastpattern = "WxDrizzleFog"

  if d == 1 then
    -- Clear
    SysCall("ScenarioManager:TriggerDeferredEvent", clearpattern, 0)
  elseif d == 2 then
    -- Fair
  elseif d == 3 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainpattern, 0)
  elseif d == 4 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 5 then
    -- Light rain + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 6 then
    -- Light rain + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainfogpattern, 0)
  elseif d == 7 then
    -- Light rain + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainfogpattern, 0)
  elseif d == 8 then
    -- Snow
    SysCall("ScenarioManager:TriggerDeferredEvent", snowpattern, 0)
  elseif d == 9 then
    -- Light rain + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainfogpattern, 0)
  elseif d == 10 then
    -- Light rain + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainfogpattern, 0)
  elseif d == 11 then
    -- Fair
  elseif d == 12 then
    -- Snow showers
    SysCall("ScenarioManager:TriggerDeferredEvent", snowshowerspattern, 0)
  elseif d == 13 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainpattern, 0)
  elseif d == 14 then
    -- Clear
    SysCall("ScenarioManager:TriggerDeferredEvent", clearpattern, 0)
  elseif d == 15 then
    -- Sleet + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", sleetfogpattern, 0)
  elseif d == 16 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainpattern, 0)
  elseif d == 17 then
    -- Light rain + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainfogpattern, 0)
  elseif d == 18 then
    -- Fair
  elseif d == 19 then
    -- Light snow + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", snowfogpattern, 0)
  elseif d == 20 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 21 then
    -- Light rain + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainfogpattern, 0)
  elseif d == 22 then
    -- Fair
  elseif d == 23 then
    -- Light rain (showers)
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainpattern, 0)
  elseif d == 24 then
    -- Overcast
    SysCall("ScenarioManager:TriggerDeferredEvent", overcastpattern, 0)
  elseif d == 25 then
    -- Drizzle + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", drizzlefogpattern, 0)
  elseif d == 26 then
    -- Clear
    SysCall("ScenarioManager:TriggerDeferredEvent", clearpattern, 0)
  elseif d == 27 then
    -- Drizzle + fog
    SysCall("ScenarioManager:TriggerDeferredEvent", drizzlefogpattern, 0)
  else
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  end
end
