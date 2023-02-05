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
-- Code for scenario 1946 (ZWNL)
-- Simulated date: August 1986
-- Simulated time: 2PM-3PM
-- https://weatherspark.com/h/m/51258/1986/8/Historical-Weather-in-August-1986-in-Rotterdam-Netherlands#Figures-ObservedWeather

-- Standard weather:  Fair Cloud
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
  local d = math.random(1, 31)

  local clearpattern = ({"WxClearLightFog", "WxLightFogClear"})[math.random(1, 2)]
  local drizzlepattern = "WxDrizzleFog"
  local showerspattern = ({"WxLightRain", "WxDrizzleFog"})[math.random(1, 2)]
  local rainpattern = ({"WxLightRain", "WxLightRainFog"})[math.random(1, 2)]
  local overcastpattern = "WxLightRain"

  if d == 1 then
    -- 
  elseif d == 2 then
    -- 
  elseif d == 3 then
    -- 
  elseif d == 4 then
    -- 
  elseif d == 5 then
    -- 
  elseif d == 6 then
    -- Clear
    SysCall("ScenarioManager:TriggerDeferredEvent", clearpattern, 0)
  elseif d == 7 then
    -- 
  elseif d == 8 then
    -- 
  elseif d == 9 then
    -- 
  elseif d == 10 then
    -- Drizzle
    SysCall("ScenarioManager:TriggerDeferredEvent", drizzlepattern, 0)
  elseif d == 11 then
    -- Light rain showers
    SysCall("ScenarioManager:TriggerDeferredEvent", showerspattern, 0)
  elseif d == 12 then
    -- 
  elseif d == 13 then
    -- 
  elseif d == 14 then
    -- Drizzle
    SysCall("ScenarioManager:TriggerDeferredEvent", drizzlepattern, 0)
  elseif d == 15 then
    -- 
  elseif d == 16 then
    -- 
  elseif d == 17 then
    -- 
  elseif d == 18 then
    -- 
  elseif d == 19 then
    -- 
  elseif d == 20 then
    -- 
  elseif d == 21 then
    -- Drizzle
    SysCall("ScenarioManager:TriggerDeferredEvent", drizzlepattern, 0)
  elseif d == 22 then
    -- Drizzle
    SysCall("ScenarioManager:TriggerDeferredEvent", drizzlepattern, 0)
  elseif d == 23 then
    -- 
  elseif d == 24 then
    -- 
  elseif d == 25 then
    -- 
  elseif d == 26 then
    -- Overcast
    SysCall("ScenarioManager:TriggerDeferredEvent", overcastpattern, 0)
  elseif d == 27 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", rainpattern, 0)
  elseif d == 28 then
    -- 
  elseif d == 29 then
    -- 
  elseif d ==30 then
    -- 
  else
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", rainpattern, 0)
  end
end
