## Langzame treinen performance

| VMax | 130km/u | 140km/u |
| ---: | ------: | ------: |
|  120 |    0.92 |    0.86 |
|  110 |    0.85 |    0.79 |
|  100 |    0.77 |    0.71 |
|   90 |    0.69 |    0.64 |
|   80 |    0.62 |    0.57 |
|   70 |    0.54 |    0.50 |


## OUD Langzame treinen performance

| VMax |            130km/u |            140km/u |
| ---: | -----------------: | -----------------: |
|  120 | 0.85 * 0.92 = 0.78 | 0.85 * 0.86 = 0.73 |
|  110 | 0.85 * 0.85 = 0.72 | 0.85 * 0.79 = 0.67 |
|  100 | 0.85 * 0.77 = 0.65 | 0.85 * 0.71 = 0.60 |
|   90 | 0.85 * 0.69 = 0.59 | 0.85 * 0.64 = 0.55 |
|   80 | 0.85 * 0.62 = 0.52 | 0.85 * 0.57 = 0.49 |
|   70 | 0.85 * 0.54 = 0.46 | 0.85 * 0.50 = 0.43 |

Uit test: echte performance 90/130 is ~60%.

Uit 2e test:
59% -> 75%
40% -> 50%
59% -> 75%


## Alpen Express

Alpen Express reed in 2020, 2022.
De trein in 2020 heeft meer Bahntouristik rijtuigen (beschikbaar in trainsim). Bijvoorbeeld https://www.flickr.com/photos/jord1/49660922823/. 


2023:

Voorlopige tijden: https://treinposities.nl/spooragenda/2023-02-24/177/Alpen_Express 


2022:

- Dienstregeling 2022: https://treinposities.nl/ritinfo/20220304/13489
- Samenstelling: https://www.flickr.com/photos/120261694@N07/51946268716/
- SK-GfF detail https://www.flickr.com/photos/120261694@N07/51949836249
- Spoorgebruik
  - Gv3 https://www.flickr.com/photos/159407874@N07/51944388121/

NL-RXP 9901 (9184 1570 827-3) (loc)

D-SVG 5680 50-80 821-7

D-SVG 5680 50-80 814-2

A-TRAIN 6181 70-70 003-2

SK-GfF 5156 05-70 512-5

SK-GfF 5156 05-70 517-4

SK-GfF 5156 05-70 502-6

SK-GfF 5156 05-70 501-8

SK-GfF 5156 05-70 504-2

D-GfF 5680 89-90 673-5 (barrijtuig)

SK-GfF 5156 05-70 515-8

SK-GfF 5156 05-70 519-0

SK-GfF 5156 05-70 520-8

SK-GfF 5156 05-70 518-2

A-TRAIN 6181 70-70 001-6

SK-GfF 5156 05-70 511-7

SK-GfF 5156 05-70 513-3

#### In trainsim:

D-SVG 5680 -> https://rail-sim.de/forum/filebase/entry/8156-repaint-3dzug-rw0381-bomz-236-in-partyzug/ ; ~> https://rail-sim.de/forum/filebase/entry/1010-eurofimawagen-ceske-drahy-v-1/

A-TRAIN 6181

SK-GfF 5156 ~> https://rail-sim.de/forum/filebase/entry/5897-schlafwagen-wlabm-russisch-und-osteurop%C3%A4isch/ ; ~> https://rail-sim.de/forum/filebase/entry/1029-avmz-and-bimz-repaints-by-dave-v-1-0/ ; ~> https://rail-sim.de/forum/filebase/entry/1012-eurofimawagen-deutsche-bahn-v-1/

D-GfF 5680 ~> https://rail-sim.de/forum/filebase/entry/4743-bomz-abteilwagen-flixtrain/

---

## Trein spawnen

Als er een lengte limiet is ingesteld, pikt de spawner dan alleen uit de kortere treinen, of worden langere gekozen maar niet gespawnt?

- Train simulator pikt uit de korte treinen. In de test werd er *altijd* een passende trein gespawnt.

## Scenario building

Eeen AI trein wacht ongeveer **35 seconden** bij een platform marker. Een trein kan vertraagd worden door meerdere platform markers dicht achter elkaar bij de spawn positie te plaatsen en de trein daar te laten stoppen. Inclusief optrekken en remmen zorgt 1 marker dan voor ongeveer 25 seconden vertraging.

Statische treinen:
- Cast/Addon -> Perople -> Cast ...