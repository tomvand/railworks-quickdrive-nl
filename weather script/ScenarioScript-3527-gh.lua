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
-- Code for scenario 3527
-- Snowy weather

-- Standard weather:  APEP Snow Moderate
-- Extension weather: Fair Cloud Ext

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
  if math.random(1, 3) < 3 then
    -- Snow showers, Fair Cloud
    local wxpattern = "Wx"
    wxpattern = wxpattern .. ({"Light", "Mod", "Heavy"})[math.random(1, 3)]
    wxpattern = wxpattern .. "SnowShower"
    if math.random(1, 3) == 1 then
      wxpattern = wxpattern .. "Fog"
    end
    wxpattern = wxpattern .. math.random(1, 6)
    SysCall("ScenarioManager:TriggerDeferredEvent", wxpattern, 0);
  else
    -- Default continuous snow, overcast
  end
end
