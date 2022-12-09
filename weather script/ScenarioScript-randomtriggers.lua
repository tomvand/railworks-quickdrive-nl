-- Script for Random AP Weather Triggers, by Darren Wardlaw
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

---------------------------------------------
-- Globals
gTrigger = 0
gInit = 0

-- Common scripts

function OnEvent ( event )
-- May call functions based on whether the event begins with 'Potential', 'Anytime', 'Set Probability'
-- or SetMaxDeferredMins.  Otherwise will just called the OnEvent function.
  Print ("DEBUG OnEvent called - event is [" .. event .. "]")
   if string.len(event) > 8 and string.sub(event,1,9) == "Potential" then
      TriggerPotential(string.sub(event,10))
   else
       if string.len(event) > 6 and string.sub(event,1,7) == "Anytime" then
           TriggerAnytime(string.sub(event,8))
       else 
           if string.len(event) > 13 and string.sub(event,1,14) == "SetProbability" then
               SetProbability(string.sub(event,15))
           else
               if string.len(event) > 17 and string.sub(event,1,18) == "SetMaxDeferredMins" then
                   SetMaxDeferredMins(string.sub(event,19))
                else
                    _G["OnEvent" .. event]()
                end
            end
       end
   end
end

function TriggerAnytime(sTrigger)
-- Will select a random time based on MAX_DEFERRED_MINS to call
-- the deferred function.
-- Call SetMaxDeferredMins00 (where 00 = 1 - however long the 
-- deferred period is) before calling this function.
     Print ("DEBUG Trigger Anytime for [" .. sTrigger .. "]")
     iMaxSecs = MAX_DEFERRED_MINS * 60
     Print ("DEBUG MAX_DEFERRED_MINS [" .. MAX_DEFERRED_MINS .. "]")
     Print ("DEBUG iMaxSecs [" .. iMaxSecs .. "]")
     iRandomSecs = GetRandomNum(1,iMaxSecs)
     Print ("DEBUG iRandomSecs [" .. iRandomSecs .. "]")
     SysCall("ScenarioManager:TriggerDeferredEvent", sTrigger, iRandomSecs);
     return TRUE;
end

function TriggerPotential(sTrigger)
-------------------------------------------------------------
-- Potential triggers are based on probabiliity of the 
-- weather being executed. They will call random and normal
-- triggers. Simply put 'Potential' at the start of the 
-- trigger name. eg PotentialWeather1
-- To change the probability, call SetProbability10 etc
-- Works with any number, although any number over 100 
-- will result in the trigger always executing.
-------------------------------------------------------------
    if gTrigger > 0 or GetRandomNum(1,100) > TRIGGER_PROBABILITY then
    Print("DEBUG probability not met");
        return TRUE;
    end
    Print("DEBUG probability met, calling " .. sTrigger);
      _G["OnEvent" .. sTrigger]()
end

function MyReverse( s )
-- Will reverse a string. Written because string.reverse was being a bitch and not working!
    z = ""
    for x = string.len(s),1,-1
    do
        y = string.sub(s,x,x)
        z = z .. y
    end
    return z;
end 

function OnEventInit()
    Print ("DEBUG in function Init")
-- create a random seed from clock
    i1 = os.clock()*1000000
        Print("DEBUG i1 = [" .. i1 .. "]")
    sR = string.sub(MyReverse(tostring(i1)),1,6)
        Print ("DEBUG sR = [" .. sR .. "]")
    sSeed = math.floor(tonumber(sR))
        Print ("DEBUG sSeed = [" .. sSeed .. "]")
    math.randomseed(sSeed)
    gInit = 1
end

function GetRandomNum(n1, n2)
    if gInit == 0 then
        OnEventInit()
    end
    for i = 1,5 
    do
        rnum = math.random(n1,n2)
    end
    Print ("DEBUG Random number between [" .. n1 .. "] and [" .. n2 .. "] is [" .. rnum .. "]")
   return rnum;
end

function OnEventResetTrigger()
   gTrigger = 0
end

function SetProbability(sProbability)
    if tonumber(sProbability) ~= nil then
        iProbability = tonumber(sProbability)
        if iProbability < 1 then
            iProbability = 1
        end
        if iProbability > 100 then
            iProbability = 100
        end
        TRIGGER_PROBABILITY = iProbability
        Print("DEBUG Probability set to [" .. iProbability .. "]");
    else
        Print("DEBUG ERROR - imported sProbability is invalid: [" .. sProbability .. "]");
    end
end

function SetMaxDeferredMins(sMaxDeferredMins)
    if tonumber(sMaxDeferredMins) ~= nil then
        MAX_DEFERRED_MINS = tonumber(sMaxDeferredMins)
        Print("DEBUG MAX_DEFERRED_MINS set to [" .. MAX_DEFERRED_MINS .. "]");
    else
        Print("DEBUG ERROR - imported sMaxDeferredMins is invalid: [" .. sMaxDeferredMins .. "]")
    end
end

-- Additional Triggers -

function OnEventIntro()
-- Put intro.html in ./En/ folder
    SysCall ( "ScenarioManager:ShowInfoMessageExt", "Welcome", "intro.html", 0, MSG_VCENTRE + MSG_CENTRE, MSG_SMALL, FALSE );
end

function OnEventHTMLThunder1()
-- This will be triggered if the thunder event has been run. Put thunder1.html in ./En/ folder
    if gTrigger > 0 then
        SysCall ( "ScenarioManager:ShowInfoMessageExt", "Weather Alert!", "thunder1.html", 0, MSG_VCENTRE + MSG_CENTRE, MSG_SMALL, FALSE );
    end
end

------------------- F O G ---------------------------------
----------------------------------------------
-- APEP Fog Variable for start of scenarios --
--  Triggers                        --
--  * Potential (plus any of the following) --
--  * RandomFog                             --
--  * Weather1, Weather2, Weather3          --
-----------------------------------------------
-- APEP Weather for anywhere in the scenario --
--  Triggers                                 --                            
--  * Potential (plus any of the following)  --
--  * RandomClearToFog                       --
--  * RandomFogToClear
--  * ClearLightFog                          --
--  * ClearMedFog                            --
--  * ClearMedFog                            --
--  * LightFogClear                          --
--  * MedFogClear                            --
--  * ThickFogClear                          --
------------------------------------------- ---

---------------------
-- Random triggers --
--      Fog        --
---------------------

function OnEventRandomFog()
-- Will set a Weather pattern 1-3 for APEP Fog Variable at start of scenario
    num = GetRandomNum(1,3)
    _G["OnEventWeather" .. num]();
    return TRUE;
end

-- These scripts require the weather to be clear prior to activating and will randomly select Light/Med/Heavy Fog
function OnEventRandomClearToFog()
    aTrigger = { "ClearLightFog","ClearMedFog","ClearThickFog" }
    sTrigger = aTrigger[GetRandomNum(1,3)]
    Print ("DEBUG sTrigger = [" .. sTrigger .. "]")
    _G["OnEvent" .. sTrigger]();
end

-- These scripts require the weather to be previously set to Light/Med/Heavy Fog
-- and will only run if ResetTrigger has not been activated
function OnEventRandomFogToClear()
    aTrigger = { "LightFogClear","MedFogClear","ThickFogClear" }
    if gTrigger > 0 and gTrigger < 4 then
        sTrigger = aTrigger[gTrigger]
        Print ("DEBUG sTrigger = [" .. sTrigger .. "]")
        _G["OnEvent" .. sTrigger]();
    end
end

---------------------
-- Manual triggers --
--      Fog        --
---------------------
function OnEventClearLightFog()
    Print ("DEBUG Setting clear to light fog")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ClearLightFog" )
    gTrigger = 1
end

function OnEventClearMedFog()
    Print ("DEBUG Setting clear to medium fog")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ClearMedFog" )
    gTrigger = 2
end

function OnEventClearThickFog()
    Print ("DEBUG Setting clear to thick fog")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ClearThickFog" )
    gTrigger = 3
end

-- These scripts require the fog to be set to light/med/thick to begin with
-- Call ResetTrigger function if you wish to transit back to fog
function OnEventLightFogClear()
    Print ("DEBUG Setting light fog to clear")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightFogClear" )
    gTrigger = 1
end

function OnEventMedFogClear()
    Print ("DEBUG Setting medium fog to clear")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "MedFogClear" )
    gTrigger = 2
end

function OnEventThickFogClear()
    Print ("DEBUG Setting thick fog to clear")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ThickFogClear" )
    gTrigger = 3
end

------------------------ R A I N ----------------------------------------
----------------------------------------------------------------
-- APEP Rain Standard Weather Patterns for start of scenarios --
-- Triggers
-- * Potential + any of the following:
-- * RandomRain      - randomly selects one of the three triggers for all exensions other than APEP Weather
-- * RandomRainDay   - randomly selects one of the five daytime rain triggers for APEP Weather
-- * RandomRainNight - randomly selects one of the two night rain triggers for APEP Weather
-- * Weather1, Weather2, Weather3 
-- * DrizzleFog, ModRain, ModRainFog, HeavyRain, HeavyRainFog
----------------------------------------------------------------

---------------------
-- Random triggers --
--       Rain      --
---------------------

function OnEventRandomRain()
-- Will set a Weather pattern 1-3 for all the Rain extensions other than APEP Weather
    num = GetRandomNum(1,3)
    _G["OnEventWeather" .. num]();
    return TRUE;
end

function OnEventRandomRainDay()
-- Will set an APEP Weather trigger for DrizzleFog/ModRain/ModRainFog/HeavyRain/HeavyRainFog
    aTrigger = { "DrizzleFog","ModRain","ModRainFog","HeavyRain","HeavyRainFog" }
    sTrigger = aTrigger[GetRandomNum(1,5)]
    Print ("DEBUG sTrigger = [" .. sTrigger .. "]")
    _G["OnEvent" .. sTrigger]();
end

function OnEventRandomRainNight()
-- Will set an APEP Weather trigger for ModRain/HeavyRain
    aTrigger = { "ModRain","HeavyRain" }
    sTrigger = aTrigger[GetRandomNum(1,2)]
    Print ("DEBUG sTrigger = [" .. sTrigger .. "]")
    _G["OnEvent" .. sTrigger]();
    return TRUE;
end

---------------------
-- Manual triggers --
--      Rain       --
---------------------

--------day only rain triggers -----

function OnEventDrizzleFog()
    Print ("DEBUG Setting weather DrizzleFog")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "DrizzleFog" )
    return TRUE;
end

function OnEventModRainFog()
    Print ("DEBUG Setting weather ModRainFog")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ModRainFog" )
    return TRUE;
end

function OnEventHeavyRainFog()
    Print ("DEBUG Setting weather HeavyRainFog")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "HeavyRainFog" )
    return TRUE;
end

--------all day rain triggers -----
function OnEventModRain()
    Print ("DEBUG Setting weather ModRain")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ModRain" )
    return TRUE;
end

function OnEventHeavyRain()
    Print ("DEBUG Setting weather HeavyRain")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "HeavyRain" )
    return TRUE;
end

------------------------------ S N O W -----------------------------------------------------
------------------------------------------------------------------------------------
-- APEP Snow Standard Weather Patterns
--  Must be placed at the start of scenarios
--  * Potential (plus any of the following)
--  * RandomSnow      - randomly selects one of the three triggers for all exensions other than APEP Weather
--  * RandomSnowDay   - radomly selects one of the five daytime snow triggers for APEP Weather
--  * RandomSnowNight - randomly selects one of the two night snow triggers for APEP Weather
--  * LightSnow/LightSnowFog/ModSnow/ModSnowFog/HeavySnow/HeavySnowFog - manual triggers
------------------------------------------------------------------------------------

---------------------
-- Random triggers --
---------------------
function OnEventRandomSnow()
-- Will set a Weather pattern 1-3 for all the APEP Snow Variable extensions other than APEP Weather
    num = GetRandomNum(1,3)
    _G["OnEventWeather" .. num]();
    return TRUE;
end

function OnEventRandomSnowDay()
-- Will set an APEP Weather trigger for LightSnow/LightSnowFog/ModSnow/ModSnowFog/HeavySnow/HeavySnowFog
    aTrigger = { "LightSnow","LightSnowFog","ModSnow","ModSnowFog","HeavySnow","HeavySnowFog" }
    sTrigger = aTrigger[GetRandomNum(1,6)]
    Print ("DEBUG sTrigger = [" .. sTrigger .. "]")
    _G["OnEvent" .. sTrigger]();
    return TRUE;
end

function OnEventRandomSnowNight()
-- Will set an APEP Weather trigger for LightSnow/ModSnow/HeavySnow
    aTrigger = { "LightSnow","ModSnow","HeavySnow" }
    sTrigger = aTrigger[GetRandomNum(1,3)]
    Print ("DEBUG sTrigger = [" .. sTrigger .. "]")
    _G["OnEvent" .. sTrigger]();
    return TRUE;
end

---------------------
-- Manual triggers --
--     Snow        --
---------------------

function OnEventLightSnow()
    Print ("DEBUG Setting weather LightSnow")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightSnow" )
    return TRUE;
end

function OnEventLightSnowFog()
    Print ("DEBUG Setting weather LightSnowFog")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "LightSnowFog" )
    return TRUE;
end

function OnEventModSnow()
    Print ("DEBUG Setting weather ModSnow")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ModSnow" )
    return TRUE;
end

function OnEventModSnowFog()
    Print ("DEBUG Setting weather ModSnowFog")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "ModSnowFog" )
    return TRUE;
end

function OnEventHeavySnow()
    Print ("DEBUG Setting weather HeavySnow")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "HeavySnow" )
    return TRUE;
end

function OnEventHeavySnowFog()
    Print ("DEBUG Setting weather HeavySnowFog")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "HeavySnowFog" )
    return TRUE;
end


----- R A I N  &  S N O W  S H O W E R S ---------------------------------------------
-- Rain Heavy Showers:
--     APEP Fair Cloud / APEP Fair Cloud (Haze) / APEP Fair Cloud (Mist)
--       + Extension APEP Rain Heavy Showers / APEP Rain Heavy Showers (Fog)
-- Snow Heavy Showers:
--     APEP Overcast (Winter)
--       + Extension APEP Snow Heavy Showers
-- Snow Heavy Showers (fog):
--     APEP Overcast (Winter)(Fog)
--       + Extension APEP Snow Heavy Showers (Fog)
--
--  Triggers:
--  * PotentialRandomHeavyShowers - Potentially runs RandomHeavyShowers
--  * PotentialRandomHeavyShowersStart - Potentially runs RandomHeavyShowersStart
--  * RandomHeavyShowersStart - randomly selects a different Weather trigger (start of scenario)
--  * RandomHeavyShowers - randomly selects a different SingleWeather trigger.

--  * Weather2, Weather3 - variations of same theme
--  * SingleWeather1, SingleWeather2, SingleWeather3, SingleWeather4, SingleWeather5, SingleWeather6 
--
-- This trigger requires: APEP Fair Cloud/APEP Fair Cloud (Haze)/APEP Fair Cloud (Mist) 
--                      + Extension APEP Thunderstorm / APEP Thunderstorm (Fog)
--  * Weather1
---------------------------------------------------------------------------------------

---------------------
-- Random triggers --
--  Rain & Snow    --
---------------------
function OnEventRandomHeavyShowersStart()
-- Will set a Weather pattern 1-3 
    num = GetRandomNum(1,3)
    _G["OnEventWeather" .. num]();
    return TRUE;
end

function OnEventRandomHeavyShowers()
-- Will set a SingleWeather pattern 1-6 
    if gTrigger > 0 then
        Print ("DEBUG Exiting RandomHeavyShower event")
        return TRUE;
    end
    num = GetRandomNum(1,6)
    _G["OnEventSingleWeather" .. num]();
    return TRUE;
end

-------- T H U N D E R S T O R M S ----------------------------------------------------

---------------------------------------------------------------------------------------
-- Thunderstorms, requires
--     APEP Fair Cloud/APEP Fair Cloud (Haze)/APEP Fair Cloud (Mist) 
--       + Extension APEP Thundery Showers/APEP Thundery Showers (Fog)
--  Triggers:
--  * PotentialRandomThunderstorm - Potentially runs RandomThunderstorm
--  * RandomThunderstorm - randomly selects a different SingleWeather trigger.
---------------------------------------------------------------------------------------

---------------------
-- Random triggers --
---------------------
function OnEventRandomThunderstorm()

-- Will set a SingleWeather pattern 2-4. 
-- Not for 1 though since this one is only set at the start of the scenario
    if gTrigger > 0 then
        Print ("DEBUG Exiting RandomThunderstorm event")
        return TRUE;
    end
    num = GetRandomNum(2,4)
    _G["OnEventSingleWeather" .. num]();
    return TRUE;
end

---------------------
-- Manual triggers --
--     Common      --
---------------------
function OnEventWeather1()
    Print ("DEBUG Setting weather 1")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "Weather1" )
    return TRUE;
end

function OnEventWeather2()
    Print ("DEBUG Setting weather 2")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "Weather2" )
    return TRUE;
end

function OnEventWeather3()
    Print ("DEBUG Setting weather 3")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "Weather3" )
    return TRUE;
end

function OnEventSingleWeather1()
    Print ("DEBUG Setting single weather 1")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather1" )
    gTrigger = 1
    return TRUE;
end

function OnEventSingleWeather2()
    Print ("DEBUG Setting single weather 2")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather2" )
    gTrigger = 2
    return TRUE;
end

function OnEventSingleWeather3()
    Print ("DEBUG Setting single weather 3")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather3" )
    gTrigger = 3
    return TRUE;
end

function OnEventSingleWeather4()
    Print ("DEBUG Setting single weather 4")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather4" )
    gTrigger = 4
    return TRUE;
end

function OnEventSingleWeather5()
    Print ("DEBUG Setting single weather 5")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather5" )
    gTrigger = 5
    return TRUE;
end

function OnEventSingleWeather6()
    Print ("DEBUG Setting single weather 6")
    SysCall ( "WeatherController:SetCurrentWeatherEventChain", "SingleWeather6" )
    gTrigger = 6
    return TRUE;
end