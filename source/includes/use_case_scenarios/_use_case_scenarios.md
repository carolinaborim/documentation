# Use case scenarios

## Retrieving equipment data

The AGCO's Telemetry API is a solution where equipment data are centralized and one of its functionalities is the retrieval of those data.

There is also a façade of Telemetry API, that responds with more information related to the equipment, making it easier to collect telemetry data, such as *status*, *location* and *CAN variables*.

### Credentials

To do the requests it is necessary to have a credential with access to a list of equipment.
There is a [documentation](https://agco-fuse.github.io/documentation/#authenticate-using-oauth2) that explains how the authentication works.

### Request an access token

In order to consume our API, a valid bearer token must be set in the Authorization header of every HTTP request. There is a [code example](https://github.com/agco-fuse/dealership-demo/blob/master/index.js#L17-L30) showing how to do that.

## Get a list of equipment

To access a list of equipment, it's necessary to make a HTTP Request to [Equipment API](https://agco-fuse.github.io/documentation/#get-equipment) in the following format: `GET /equipment` and when the information is returned with success, the list will be available.

At this [code example](https://github.com/agco-fuse/dealership-demo/blob/master/app/scripts/services/apiservice.js#L11-L19) we are requesting the API to get a list of equipment.

The equipment on the response contains the identification information, as the manufacturing date and description, and related information to the current status. It is possible to extract the location coordinates and the latest values of CAN variables reported back from the tracker.

More details can be found on link [Get equipment section](#get-equipment)

## Get a single equipment

  To access an equipment, it's necessary to make a HTTP Request to [Equipment API](https://agco-fuse.github.io/documentation/#get-equipment) in the following format: `GET /equipment/{id}` and when the information is returned with success, a single equipment will be available.

At this [code example](https://github.com/agco-fuse/dealership-demo/blob/master/app/scripts/services/apiservice.js#L21-L29) we are requesting the API to get a specific equipment by passing a valid id as a parameter.

The equipment on the response contains the identification information, as the manufacturing date and description, and related information to the current status. It is possible to extract the location coordinates and the latest values of CAN variables reported back from the tracker.

More details can be found on link [Get single equipment section](#get-equipment-id)

## Get the dealer associated to an equipment

  To get a dealer associated to an equipment, it's necessary to make a HTTP Request to Dealer API in the following format: `GET /dealer/{id}` and when the information is returned with success, a single dealer will be available.

  At this [code example](https://github.com/agco-fuse/dealership-demo/blob/master/app/scripts/services/apiservice.js#L31-L38) we are requesting the API to get a specific dealer by passing a valid id as a parameter.

## Get available CAN variables from an equipment

  When a HTTP Request is done to the Equipment API, the answer will include a list of equipment.<br>

  Each of those equipment will include a list of its available `CAN varibles snapshots` inside the `trackingData` as can be seen on the example on the right side.<br>

  > The example below shows a group of CAN variables that belongs to an equipment.

  ```json
{
  "data": [
  {
    "type": "equipment",
      "id": "example-id",
      "attributes": {
        "description": "Example Equipment",
        "serviceLevel": 1,
        "identificationNumber": "00000",
        "manufacturingDate": "2014-06-30T15:18:51.000Z",
        "trackingPoint": {
          "location": {
            "type": "Point",
            "coordinates": [
              38,
            32,
            400
            ]
          },
          "status": "OFF_PARKED"
        },
        "trackingData": {
          "DRIVING_DIRECTION": "3",
          "ENGINE_HOURS": "180000",
          "ENGINE_LOAD": "90",
          "ENGINE_SPEED": "125",
          "FUEL_LEVEL": "30"
        }
      },
      "relationships": {
        "dealer": {
          "links": {
            "self": "",
            "related": ""
          },
          "data": {
            "type": "dealer",
            "id": "de1729a8-a294-4293-83c8-3d96f9686b04"
          }
        },
        "model": {
          "links": {
            "self": "",
            "related": ""
          },
          "data": {
            "type": "model",
            "id": "ffbfa8e6-aa5e-4572-8820-32adc97c8dc4"
          }
        }
      }
  }
  ]
}

  ```
