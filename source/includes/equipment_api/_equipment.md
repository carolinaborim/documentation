# Equipment API

The [Equipment API](#equipment-api) is an endpoint with the goal to provide equipment related structured information.

The information about the equipment are retrieved from the Telemetry API and should contain the same values, but on a specific structure.

The structure of the response of the endpoints follow the [JSON API 1.0](http://jsonapi.org/format/1.0/) specification.
JSON API is a specification for how a client should request that resources be fetched or modified, and how a server should respond to those requests.

### Usage Demonstration

An example of the usage of the Equipment API can be observed on the [Dealership Demo Application](https://github.com/agco-fuse/dealership-demo).

This application is written in NodeJS and Angular, demonstrating how to [authenticate](#authentication), retrieve a [list of equipment](#get-equipment) and [single equipment details](#get-equipment-id).

There are more details and instructions on the [application project](https://github.com/agco-fuse/dealership-demo), including how to deploy your own instance of the example.

## Authentication

To make use of the endpoints, a bearer token is required on the authorization header.

Header key    | Value
------------- | -----
Authorization | Bearer [token]

Refer to the [How to Authenticate](#how-to-authenticate) section to learn how to acquire a valid token.

<aside class="notice">
You must replace <code>[token]</code> with the token response from the Authentication endpoint.
</aside>

## GET /equipment

> HTTP 200 Successful Response schema:

```json
[[equipment:model:equipmentData]]
```

This is the endpoint for retrieving the list of equipment.
You will only access equipment your access token allows.

### HTTP Request
On the Equipment API server:

`GET /equipment`.

When the information is returned with success, a list of equipment will be available with the CAN variable
informations present according to the availability on that specific equipment.

You will get a list of 100 equipment. If you want more than 100 or to do paging you will have to use the
extra parameters.

Refer to the [CAN Variables](#can-variables) section to see the possible returned values.

## GET /equipment/{id}

> HTTP 200 Successful Response schema

```json
[[equipment:model:anEquipmentData]]
```

This is the endpoint to receive a single equipment equivalent to the id sent.
You will only access equipment your access token allows.

### HTTP Request
On the Equipment API server:

`GET /equipment/{id}`.

When the information is returned with success, a single equipment will be available.

The equipment contain the CAN variable informations present according to the availability on that specific equipment.

Refer to the [CAN Variables](#can-variables) section to see the possible returned values.

## Errors

Error Code                        | Meaning
----------                        | -------
[401](#401-unauthorized)          | [Unauthorized](#401-unauthorized)
[404](#404-not-found)             | [Not Found](#404-not-found)
[500](#500-internal-server-error) | [Internal Server Error](#500-internal-server-error)

## 401 Unauthorized

> 401 Unauthorized

```json
[[equipment:model:401]]
```

When the authentication token is invalid or expired, the response will return an array of errors, with an item pointing out the status and the response code.

## 404 Not Found

> 404 Not Found

```json
[[equipment:model:404]]
```

When the list does not exist, the response will return an array of errors, with an item pointing out the status and the response code.

## 500 Internal Server Error

> 500 Internal Server Error

```json
[[equipment:model:500]]
```

When there is an error processing the request, the response will return an array of errors, with an item pointing out the status and the response code.
