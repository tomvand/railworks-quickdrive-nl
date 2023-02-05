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
-- Code for scenario 5534 (HvNL)
-- Simulated date: apr 1997
-- Simulated time: 11AM-12AM
-- https://weatherspark.com/h/m/52666/1997/4/Historical-Weather-in-April-1997-in-Utrecht-Netherlands#Figures-ObservedWeather

-- Standard weather:  Fair Cloud
-- Extension weather: Overcast Ext

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
  local d = math.random(1, 30)

  local clearpattern = "WxClearOvercast"
  local overcastpattern = "WxOvercastClear"
  local showerpattern = "WxLightRainShower" .. math.random(1, 6)
  local rainpattern = showerpattern
  local drizzlepattern = "WxLightRainShowerFog" .. math.random(1, 6)
  local fogpattern = drizzlepattern

  if d == 1 then
    -- Clear
    SysCall("ScenarioManager:TriggerDeferredEvent", clearpattern, 0)
  elseif d == 2 then
    -- 
  elseif d == 3 then
    -- 
  elseif d == 4 then
    -- Light rain shower
    SysCall("ScenarioManager:TriggerDeferredEvent", showerpattern, 0)
  elseif d == 5 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", rainpattern, 0)
  elseif d == 6 then
    -- 
  elseif d == 7 then
    -- Clear
    SysCall("ScenarioManager:TriggerDeferredEvent", clearpattern, 0)
  elseif d == 8 then
    -- 
  elseif d == 9 then
    -- 
  elseif d == 10 then
    -- 
  elseif d == 11 then
    -- Overcast
    SysCall("ScenarioManager:TriggerDeferredEvent", overcastpattern, 0)
  elseif d == 12 then
    -- 
  elseif d == 13 then
    -- 
  elseif d == 14 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", rainpattern, 0)
  elseif d == 15 then
    -- 
  elseif d == 16 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", rainpattern, 0)
  elseif d == 17 then
    -- Clear
    SysCall("ScenarioManager:TriggerDeferredEvent", clearpattern, 0)
  elseif d == 18 then
    -- 
  elseif d == 19 then
    -- 
    SysCall("ScenarioManager:TriggerDeferredEvent", rainpattern, 0)
  elseif d == 20 then
    -- 
  elseif d == 21 then
    -- 
  elseif d == 22 then
    -- 
  elseif d == 23 then
    -- 
  elseif d == 24 then
    -- 
  elseif d == 25 then
    -- Overcast
    SysCall("ScenarioManager:TriggerDeferredEvent", overcastpattern, 0)
  elseif d == 26 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 27 then
    -- Fog
    SysCall("ScenarioManager:TriggerDeferredEvent", fogpattern, 0)
  elseif d == 28 then
    -- Drizzle
    SysCall("ScenarioManager:TriggerDeferredEvent", drizzlepattern, 0)
  elseif d == 29 then
    -- 
  else
    --
  end
end
