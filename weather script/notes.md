Ideeën
------

SetAPEPWeather
SetSeason
SetHour
En tabellen met realistisch weer?


AP Weather triggers
-----------------------

**Let op! Download laatste update!**

General:

- Do not use Fog patterns at night
- Mist = Mist Light
- ~~Snow and rain cannot be used with the same standard pattern?~~
- **The manual does not match the available extended weather patterns!**
- Werking in train simulator:
  - Train sim start met het 'standaard' weather
  - Het weer verandert pas na een trigger
    - Triggers *moeten* via het Scenario Script (i.e. kan niet direct vanuit timetable zonder script)
    - Kan bijvoorbeeld voor extra variatie starten met Clear, en dan een van de regen patterns triggeren met een kleine kans
  - Niet alle parameters worden overschreven door het extension pattern
    - Niet: fog/visibility wordt niet hoger gemaakt
  - Extended weather patterns combineren niet (e.g. HeavyRain overschrijft ook ThickFogClear)
  - Trigger tijden in timetable tellen bij elkaar op (zo lijkt het iig)
- **Weather Extension patronen sluiten niet goed op elkaar aan!!!**
  - **Het is niet mogelijk om per script eigen transities te maken vwb neerslag!**
  - Mist kan *wel* gecontroleerd worden mbv transities

List of extension patterns based on actual files:

```
Heavy Rain Showers (opt. Fog)
- Weather1-3
- SingleWeather1-6

Heavy Snow Showers (opt. Fog)
- Weather1-3
- SingleWeather1-6

Overcast to rain (opt. Fog)
- Weather1-3

Rain to clear
- Weather1-3

Rain to Fair Cloud
- Weather1-3

Rain to overcast (opt. Fog)
- Weather1-3

Thunderstorm (opt. Fog)
- Weather1 (no 2, 3)

Thundery showers (opt. Fog)
- SingleWeather1-4

Variable Fog
- Weather1-3

Variable Rain (opt. Fog)
- Weather1-3

Variable Snow (opt. Fog)
- Weather1-3

Fair Cloud Extension
- (Heavy|Mod|Light)RainShower(Stormy|StormyFog)1-6
- (Heavy|Mod|Light)SnowShower(Fog)1-6

Overcast Extension
- ClearOvercast, OvercastClear
- OvercastClearRain, OvercastFairRain
- (Heavy|Mod|Light)RainShower(Fog)1-6
- (Heavy|Mod|Light)SnowShower(Fog)1-6

Weather Extensions
- Constant
  - DrizzleFog
  - LightRain(Fog)
  - ModRain(Fog)
  - HeavyRain(Fog)
  - LightSnow(Fog)
  - ModSnow(Fog)
  - HeavySnow(Fog)
- Transitions
  - ClearLightFog
  - ClearMedFog
  - ClearThickFog
  - LightFogClear
  - MedFogClear
  - ThickFogClear
  - MistLightFog
  - MistMedFog
  - MistThickFog
  - LightFogMist
  - MedFogMist
  - ThickFogMist
```

Overzicht extension pattern:

- Random transities:
  - Overcast to rain; Rain to overcast
  - Rain to clear (Clear to rain bestaat niet!)
  - Rain to Fair Cloud
- Variabel constant weer:
  - Heavy Rain Showers
  - Heavy Snow Showers
  - Thunderstorm
  - Variable Fog
  - Variable Rain
  - Variable Snow
- Constant weer:
  - Weather Extensions (Rain, Snow)
- Controleerbare buien:
  - Fair Cloud extension
  - Overcast extension
  - Heavy Rain Showers
  - Heavy Snow Showers
  - Thundery showers
- Controleerbare mist:
  - Weather Extensions (Fog, Mist)


**Overzicht van effecten die in scenario's gedaan kunnen worden, met Clear als basispatroon:**
- Regen (constant, begin, einde, variabel, buien, buien icm fog)
  - Begin, einde: 15-60min
  - Variabel, Buien: 10-20min
- Sneeuw (constant, variabel, buien, buien icm fog)
  - Variabel:
  - Buien:
- Onweer (variabel, buien)
  - Variabel:
  - Buien:
- Mist/Fog (constant, variabel, transities)

*Geen directe controle over wolken! Alleen mbv basispatroon*


Overzicht van effecten per extension pattern:
```
                                    
Overcast Ext          SHRA  FGSHRA  SHSN  FGSHSN        NSC->OVC  OVC->NSC  RA->NSC RA->SCT
Fair cloud Ext        SHRA  FGSHRA  SHSN  FGSHSN
Heavy Rain Showers:   SHRA  FGSHRA
Heavy Snow Showers:                 SHSN  FGSHSN
Thundery showers                                  SHTS

Weather Ext           FGDZ  RA  FGRA  SN  FGSN                NSC->FG   FG->NSC
Variable Rain               RA  FGRA
Variable Snow                         SN  FGSN
Variable Fog                                    FG
Thunderstorm                                        TS  FGTS

Overcast to rain:     OVC->RA   OVC->FGRA
Rain to overcast:     RA->OVC   FGRA->OVC
Rain to clear:        RA->NSC
Rain to Fair:         RA->SCT
```

Cloud combinations:
```
Clear, Fair:        -
Clear, Overcast:    Clear + Overcast Ext
Fair, Overcast:     Fair + Overcast Ext
```


Weather data
------------

https://weatherspark.com/h/d/51381/2022/11/20/Historical-Weather-on-Sunday-November-20-2022-in-Amsterdam-Netherlands#Figures-Visibility

```
Cloud mappings

Clear           -> Clear
Mostly clear    -> Fair cloud
Partly cloudy   -> Fair cloud
Mostly cloudy   -> Fair cloud
Overcast        -> Overcast
```

```
Rain mappings


```

### Weer

Op basis van historisch weer per maand (link)[https://weatherspark.com/h/m/147997/2022/1/Historical-Weather-in-January-2022-at-Amsterdam-Airport-Schiphol-Netherlands].

Aantal gevallen geteld om
- 12-1PM
- 12-1AM

Regen als shower geteld als deze 1u lang is.

```
Weer
      Fog   Haze    Dz  -RA   RA    +RA   -SHRA SHRA  +SHRA   -SN   SN    +SN   TS
Jan   13            3   7     3           1                   1
Feb                 2   6     4           1
Maa                 2   6                                     1
Apr   1             1   5                 4                   3
Mei   3                 5                 1
Jun                     6     2
Jul                     4     1
Aug   1                 3                 2
Sep   2                 9     3     1     3                                     1
Okt   3             1   7     4     1     1
Nov   9             2   12    2           2
Dec   7             11  13    5           
```








Oud/onzeker
-----------


```
Rain mappings

Is misschien niet heel logisch op een maandgemiddelde...

0.5-1in   Drizzle
  1-2in   Light
  2-3in   Mod
  3+ in   Heavy

      10%     15%     25%     25%     15%     10%
Jan   Clear   Light   Light   Mod     Heavy   Heavy
Feb   Clear   Driz    Light   Light   Heavy   Heavy
Maa   Clear   Driz    Light   Light   Light   Mod
Apr   Clear   Driz    Driz    Light   Light   Mod
Mei   Clear   Driz    Light   Light   Mod     Heavy
Jun   Clear   Driz    Light   Light   Mod     Heavy
Jul   
Aug
Sep
Okt
Nov
Dec
```

```
Cloud mappings

Clear           -> Clear
Mostly clear    -> Fair cloud
Partly cloudy   -> Fair cloud
Mostly cloudy   -> Overcast
Overcast        -> Overcast

      Clear   Fair    Overcast
Jan   10%     25%     65%
Feb   15%     25%     60%
Maa   15%     25%     60%
Apr   20%     30%     50%
Mei   25%     25%     50%
Jun   25%     25%     50%
Jul   30%     25%     45%
Aug   25%     30%     45%
Sep   25%     25%     50%
Okt   15%     30%     55%
Nov   10%     25%     55%
Dec   10%     25%     65%
```


Overzicht van effecten per extension pattern:

```
Overcast Ext                SHRA  RA  SHSN                FG        NSC   SCT   OVC
Fair Cloud Ext              SHRA      SHSN                FG
Weather Ext           DZ          RA          SN          FG

Heavy Rain Showers:         SHRA
Variable Rain                     RA
Heavy Snow Showers:                   SHSN
Variable Snow                                 SN
Thundery showers                                  SHTS
Variable Fog                                              FG
Thunderstorm                                                    TS

Rain to clear                     RA                                NSC
Rain to fair                      RA                                      SCT
Overcast to rain:                 RA                                            OVC
Rain to overcast                  RA                                            OVC
```