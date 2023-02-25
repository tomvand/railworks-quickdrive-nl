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


function OnEventE189_Init()
  SysCall("1890755SA01:SetControlValue", "BrakeMode", 0, 4)
end


---------------------------------------------
-- Code for scenario 5823 (HvNL)
-- Simulated date: 12-23 dec 2022
-- Simulated time: 08:00-08:30      (8AM-9AM)
-- https://weatherspark.com/h/m/148029/2022/12/Historical-Weather-in-December-2022-at-Deelen-Air-Base-Netherlands

-- Standard weather:  Fair Cloud
-- Extension weather: Variable Fog

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
  local d = math.random(1, 27)

  local fogpattern = "WxWeather" .. math.random(1, 3)
  local hazepattern = fogpattern
  local drizzlepattern = fogpattern
  local rainpattern = fogpattern

  if d == 1 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 2 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 3 then
    -- Haze
    SysCall("ScenarioManager:TriggerDeferredEvent", hazepattern, 0)
  elseif d == 4 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 5 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 6 then
    -- Drizzle, fog
    SysCall("ScenarioManager:TriggerDeferredEvent", drizzlepattern, 0)
  elseif d == 7 then
    -- Fair
  elseif d == 8 then
    -- Moderate rain
    SysCall("ScenarioManager:TriggerDeferredEvent", rainpattern, 0)
  elseif d == 9 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 10 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 11 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 12 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 13 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 14 then
    -- Clear
  elseif d == 15 then
    -- Clear
  elseif d == 16 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 17 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 18 then
    -- Fair
  elseif d == 19 then
    -- Moderate rain
    SysCall("ScenarioManager:TriggerDeferredEvent", rainpattern, 0)
  elseif d == 20 then
    -- Fair
  elseif d == 21 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 22 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 23 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 24 then
    -- Fair
  elseif d == 25 then
    -- Fair
  elseif d == 26 then
    -- Fair
  else
    -- Fair
  end
end
