# Can variables

## Description

Name | Description | Standard Unit
---- | ----------- | -------------
ENGINE_HOURS | Total hours of equipment engine | Seconds
ENGINE_SPEED | Engine speed of equipment | RPM
DRIVE_DIRECTION | Driving direction of equipment | [Enumeration DRIVE_DIRECTION](#enumeration-drive_direction)
ENGINE_LOAD | ??? | Percentage (%)
FUEL_LEVEL | ??? | Percentage (%)
FUEL_RATE | ??? | Cubic metre per seconds (m³/s)
MASTER_APPLY | ??? | [Enumeration MASTER_APPLY](#enumeration-master_apply)
MOISTURE_AVERAGE | ??? | Percentage (%)
YIELD_AVERAGE | ??? | Kilograms per square metre (kg/m²)
CAPACITY_Average | ??? | Kilograms per second (kg/s)
TEST_WEIGHT | ??? | Kilograms per cubic metre (kg/m³)
HARVEST_HOURS | ??? | Seconds
RATE | ??? | ???
UNLOAD_AUGER | ??? | [Enumeration UNLOAD_AUGER](#enumeration-unload_auger)
BALE_WEIGHT | ??? | Kilograms
BALE_WEIGHT_AVERAGE | ??? | Kilograms
BALE_FLAKES_AVERAGE | ??? | ???
COUNTER_Bale_Cut | ??? | ???
COUNTER_Bale_Uncut | ??? | ???
GRAIN_LOSS_Shaker | ??? | Percentage (%)
GRAIN_LOSS_Rotor | ??? | Percentage (%)
INDUSTRIAL_DRIVE_ENGAGE | ??? | [Enumeration INDUSTRIAL_DRIVE_ENGAGE](#enumeration-industrial_drive_engage)
PRIMARY_EXTRACTOR_ENGAGE | ??? | [Enamuration PRIMARY_EXTRACTOR_ENGAGE](#enumeration-primary_extractor_engage)
SIEVE_POSITION_Upper_Right | ??? | Distance in miles
STROKE_PER_FLAKE | ??? | ???
TOPPER_DRIVE_ENGAGE | ??? | [Enumeration TOPPER_DRIVE_ENGAGE](#enumeration-topper_drive_engage)
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
