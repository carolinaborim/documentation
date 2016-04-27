# Can variables

## Description

Name | Description | Standard Unit
---- | ----------- | -------------
ENGINE_HOURS | Total hours of equipment engine | Seconds
ENGINE_SPEED | Engine speed of equipment | RPM
DRIVE_DIRECTION | Driving direction of equipment | [Enumeration DRIVE_DIRECTION](#enumeration-drive_direction)
ENGINE_LOAD | Percentage load on engine | Percentage (%)
FUEL_LEVEL | Percentage of fuel tank level | Percentage (%)
FUEL_RATE | Rate of fuel consuption | Cubic metre per seconds (m³/s)
MASTER_APPLY | Sprayer applying product | [Enumeration MASTER_APPLY](#enumeration-master_apply)
MOISTURE_AVERAGE | Average crop moisture in a combine | Percentage (%)
YIELD_AVERAGE | Average yeild /area from combine | Kilograms per square metre (kg/m²)
CAPACITY_Average | Average capacity for a combine | Kilograms per second (kg/s)
TEST_WEIGHT | User defined test weight for a crop in a combine | Kilograms per cubic metre (kg/m³)
HARVEST_HOURS | Hours on combine seperator | Seconds
RATE | Rate being applied by a sprayer | Milimeters squared per second (mm²/s)
UNLOAD_AUGER | Combine unloading auger status | [Enumeration UNLOAD_AUGER](#enumeration-unload_auger)
BALE_WEIGHT | Weight of last bale | Kilograms
BALE_WEIGHT_AVERAGE | Average bale weight | Kilograms
BALE_FLAKES_AVERAGE | Average flakes per bale | Range 0 - 65635
COUNTER_Bale_Cut | Number of cut bales with cutter engaged | Range 0 - 65635
COUNTER_Bale_Uncut | Number of uncut bales | Range 0 - 1000
GRAIN_LOSS_Shaker | Percentage of grain lost at shaker in a combine | Percentage (%)
GRAIN_LOSS_Rotor | Percentage of grain lost at rotor in a combine | Percentage (%)
INDUSTRIAL_DRIVE_ENGAGE | Sugar Cane harvester drive status | [Enumeration INDUSTRIAL_DRIVE_ENGAGE](#enumeration-industrial_drive_engage)
PRIMARY_EXTRACTOR_ENGAGE | Sugar Cane harvester extractor status | [Enamuration PRIMARY_EXTRACTOR_ENGAGE](#enumeration-primary_extractor_engage)
SIEVE_POSITION_Upper_Right | Combine sieve setting  | Distance in miles
STROKE_PER_FLAKE | Strokes per flake - baler | Range 0 - 1000
TOPPER_DRIVE_ENGAGE | Sugar Cane harvester topper drive status | [Enumeration TOPPER_DRIVE_ENGAGE](#enumeration-topper_drive_engage)
CAPACITY | Instant combine capacity | Kilograms per second (kg/s)
MOISTURE | ??? | Percentage (%)
BALE_WEIGHT_Total | Total weight baled | Kilograms

## Enumeration DRIVE_DIRECTION

Name | Value
---- | -----
NEUTRAL | 0
FORWARD | 1
REVERSE | 2
STAND STILL | 3
CRUISE CONTROL | 4

## Enumeration MASTER_APPLY

Name | Value
---- | -----
OFF | 0
ON | 1
ERROR | 2
NA | 3

## Enumeration UNLOAD_AUGER

Name | Value
---- | -----
OFF | 0
ON | 1
ERROR | 2
NA | 3

## Enumeration INDUSTRIAL_DRIVE_ENGAGE

Name | Value
---- | -----
OFF | 0
ON | 1
ERROR | 2
NA | 3
Reverse | 4

## Enumeration PRIMARY_EXTRACTOR_ENGAGE

Name | Value
---- | -----
OFF | 0
ON | 1
ERROR | 2
NA | 3

## Enumeration TOPPER_DRIVE_ENGAGE

Name | Value
---- | -----
OFF | 0
ON | 1
ERROR | 2
NA | 3
