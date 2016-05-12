# Can Variables

## Description

| Name | CAN variable name | Description | Standard Unit |
| ---- | ----------------- | ----------- | ------------- |
| Bale Flakes, Average | BALE_FLAKES_AVERAGE | Average flakes per bale | Range 0 - 65635 |
| Bale Flakes, Strokes per | STROKE_PER_FLAKE | Strokes per flake | Range 0 - 1000 |
| Bale Weight, Average | BALE_WEIGHT_AVERAGE | Average bale weight | Kilograms |
| Bale Weight, Last | BALE_WEIGHT | Weight of last bale | Kilograms |
| Bale Weight, Total | BALE_WEIGHT_Total | Accumulated mass of bales produced during equipment operation | Kilograms |
| Bale, Total Cut | COUNTER_Bale_Cut | Accumulated count of cut bales produced during equipment operation | Range 0 - 65635 |
| Bale, Total Uncut | COUNTER_Bale_Uncut | Accumulated count of uncut bales produced during equipment operation | Range 0 - 1000 |
| Capacity, Average | CAPACITY_Average | Average equipment mass capacity | Kilograms per second (kg/s) |
| Capacity, Instant | CAPACITY | Instantaneous equipment mass capacity | Kilograms per second (kg/s) |
| Crop Moisture, Average | MOISTURE_AVERAGE | Average moisture in crop yield | Percentage (%) |
| Crop Moisture, Instant | MOISTURE | Moisture in crop yeild | Percentage (%) |
| Drive State | DRIVING_DIRECTION | Equipment drive configuration | [Enumeration DRIVE_DIRECTION](#enumeration-drive_direction) |
| Effective Total Time | HARVEST_HOURS | Accumulated time in working position | Seconds |
| Engine Fuel Rate | FUEL_RATE | Amount of fuel consumed by engine per unit of time | Cubic metre per seconds (m³/s) |
| Engine Hours | ENGINE_HOURS | Accumulated time of operation of engine | Seconds |
| Engine Load | ENGINE_LOAD | The ratio of actual engine percent torque (indicated) to maximum indicated torque available at the current engine speed, clipped to zero torque during engine braking | Percentage (%) |
| Engine Speed | ENGINE_SPEED | Actual engine speed which is calculated over a minimum crankshaft angle of 720 degrees divided by the number of cylinders | RPM |
| Equipment Speed | VEHICLE_SPEED | A value of the speed of a machine as calculated from the measured wheel or tail shaft speed | Meters per second (m/s) |
| Fuel Level | FUEL_LEVEL | Ratio of volume of fuel to the total volume of fuel storage container | Percentage (%) |
| Grain Bin/Tank, Full Indicator | GRAIN_BIN_FULL | Status of grain bin/tank full indicator | [Enumeration GRAIN_BIN_FULL](#enumeration-grain_bin_full) |
| Grain Loss, Rotor | GRAIN_LOSS_Rotor | Percentage of crop loss measured at the rotor | Percentage (%) |
| Grain Loss, Shaker | GRAIN_LOSS_Shaker | Percentage of crop loss measured at the shaker | Percentage (%) |
| Grain Loss, Shoe | GRAIN_LOSS_Shoe | Percentage of crop loss measured at the shoe | Percentage (%) |
| Industrial Drive Status | INDUSTRIAL_DRIVE_ENGAGE | Status of sugar cane harvester industrial drive | [Enumeration INDUSTRIAL_DRIVE_ENGAGE](#enumeration-industrial_drive_engage) |
| Instantaneous Area Per Time Capacity | RATE | Area per time | Milimeters squared per second (mm²/s) |
| Master Apply Status | MASTER_APPLY | Applicator Master Apply Switch Status | [Enumeration MASTER_APPLY](#enumeration-master_apply) |
| Primary Extractor Status | PRIMARY_EXTRACTOR_ENGAGE | Status of sugar cane harvester primary extractor | [Enamuration PRIMARY_EXTRACTOR_ENGAGE](#enumeration-primary_extractor_engage) |
| Sieve Position, Upper Right | SIEVE_POSITION_Upper_Right | Upper right sieve position setting | Distance in miles |
| Topper Drive Status | TOPPER_DRIVE_ENGAGE | Status of sugar cane harvester topper drive | [Enumeration TOPPER_DRIVE_ENGAGE](#enumeration-topper_drive_engage) |
| Unload Auger Status | UNLOAD_AUGER_STATUS | Status of the unload auger | [Enumeration UNLOAD_AUGER_STATUS](#enumeration-unload_auger_status) |
| Wheel Slip | WHEEL_SLIP | Wheel slippage as a percent | Percentage (%) |
| Yield, Mass per Area, Average | YIELD_AVERAGE | Average yield as mass per area, not corrected for the reference moisture percentage | Kilograms per square metre (kg/m²) |
| Yield, Mass per Area, Instant | YIELD | Instantaneous yield as mass per area, not corrected for the reference moisture percentage | Kilograms per square metre (kg/m²) |
| Yield, Test Weight | TEST_WEIGHT | Test weight of crop for yield calculation conversion | Kilograms per cubic metre (kg/m³) |

## Enumeration DRIVE_DIRECTION

| Name | Value |
| ---- | ----- |
| NEUTRAL | 0 |
| FORWARD | 1 |
| REVERSE | 2 |
| STAND STILL | 3 |
| CRUISE CONTROL | 4 |

## Enumeration GRAIN_BIN_FULL

| Name | Value |
| ---- | ----- |
| OFF | 0 |
| ON | 1 |
| ERROR | 2 |
| NA | 3 |

## Enumeration INDUSTRIAL_DRIVE_ENGAGE

| Name | Value |
| ---- | ----- |
| OFF | 0 |
| ON | 1 |
| ERROR | 2 |
| NA | 3 |
| Reverse | 4 |

## Enumeration MASTER_APPLY

| Name | Value |
| ---- | ----- |
| OFF | 0 |
| ON | 1 |
| ERROR | 2 |
| NA | 3 |

## Enumeration PRIMARY_EXTRACTOR_ENGAGE

| Name | Value |
| ---- | ----- |
| OFF | 0 |
| ON | 1 |
| ERROR | 2 |
| NA | 3 |

## Enumeration TOPPER_DRIVE_ENGAGE

| Name | Value |
| ---- | ----- |
| OFF | 0 |
| ON | 1 |
| ERROR | 2 |
| NA | 3 |

## Enumeration UNLOAD_AUGER_STATUS

| Name | Value |
| ---- | ----- |
| OFF | 0 |
| ON | 1 |
| ERROR | 2 |
| NA | 3 |
