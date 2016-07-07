# Use case scenarios

## Retrieving equipment data

The AGCO's Telemetry API is a solution where equipment data are centralized and one of it's functionalities is the retrieval of those data.

There is also a façade of Telemetry API, that respond with more information related to the equipment, making it easier to collect telemetry data, such as *status*, *location* and *CAN variables*.

## Credentials

To do the requests it is necessary to have a credential with access to a list of equipment.
There is a [documentation](https://agco-fuse.github.io/documentation/#authenticate-using-oauth2) that explains how the authentication works.

## Request an access token

The best way of authentication having credentials in a Bearer token format, there is a [code example](https://github.com/agco-fuse/dealership-demo/blob/master/index.js#L17-L30) showing how to do that.

## Equipment API

## Get a list of equipment
Given I'm a developer with a Bearer token,<br>
When I do a request to Equipment API, asking for a list of equipment<br>
The API will answer with the requested list<br>

**How it works?**

At this [code example](https://github.com/agco-fuse/dealership-demo/blob/master/app/scripts/services/apiservice.js#L11-L19) we are requesting the API to get a list of equipment.

To access this list, it's necessary to make a HTTP Request in the following format: GET /equipment and when the information is returned with success, a list of equipment will be available.

The equipment on the response contains the identification information, as the manufacturing date and description, and related information to the current status. It is possible to extract the location coordinates and the latest values of CAN variables reported back from the tracker.

More details can be found on link [Get equipment section](#get-equipment)

## Get a single equipment
Given I'm a developer with a Bearer token,<br>
When I do a request to Equipment API, asking for a single equipment<br>
The API will answer with the requested equipment<br>

**How it works?**

At this [code example](https://github.com/agco-fuse/dealership-demo/blob/master/app/scripts/services/apiservice.js#L21-L29) we are requesting the API to get a specific equipment by passing a valid id as a parameter.

To access this equipment, it's necessary to make a HTTP Request in the following format: GET /equipment/{id} and when the information is returned with success, a single equipment will be available.

The equipment on the response contains the identification information, as the manufacturing date and description, and related information to the current status. It is possible to extract the location coordinates and the latest values of CAN variables reported back from the tracker.

More details can be found on link [Get single equipment section](#get-equipment-id)
