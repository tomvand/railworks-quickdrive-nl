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
-- Code for scenario 1967 (ZvNL)
-- Simulated date: 09-09-2009
-- Simulated time: 18:15-19:00      (6PM-7PM)
-- https://weatherspark.com/h/m/147995/2009/9/Historical-Weather-in-September-2009-at-Rotterdam-The-Hague-Airport-Netherlands

-- Standard weather:  Fair cloud
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

  local drizzlepattern = "WxDrizzleFog"
  local lightrainpattern = "WxLightRain"
  local modrainpattern = "WxModRain"

  if d == 1 then
    -- 
  elseif d == 2 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainpattern, 0);
  elseif d == 3 then
    -- Moderate rain
    SysCall("ScenarioManager:TriggerDeferredEvent", modrainpattern, 0);
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
    -- 
  elseif d == 10 then
    -- 
  elseif d == 11 then
    -- 
  elseif d == 12 then
    -- 
  elseif d == 13 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainpattern, 0);
  elseif d == 14 then
    -- 
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
    -- 
  elseif d == 22 then
    -- 
  elseif d == 23 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainpattern, 0);
  elseif d == 24 then
    -- 
  elseif d == 25 then
    -- 
  elseif d == 26 then
    -- 
  elseif d == 27 then
    -- 
  elseif d == 28 then
    -- 
  elseif d == 29 then
    -- Drizzle
    SysCall("ScenarioManager:TriggerDeferredEvent", drizzlepattern, 0);
  elseif d == 30 then
    -- Light rain
    SysCall("ScenarioManager:TriggerDeferredEvent", lightrainpattern, 0);
  else
  end
end
