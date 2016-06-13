# Equipment API

## Introduction

The [Equipment API](#equipment-api) is a façade whose goal is to provide an easier way of retrieving
equipment related structured information.

The equipment information are retrieved from the Telemetry API and
contains the same values, with the structure modeled after the equipment
concept.

The structure of the response exposes the related information of the equipment,
including some other sparse concepts available on the Telemetry API, as the
location of the equipment, the working status and other CAN variables.

The structure of endpoint responses follow the [JSON API 1.0](http://jsonapi.org/format/1.0/) specification.
JSON API is a specification concerning how a client should request that
resources to be fetched or modified, and how a server should respond to those
requests.

### Environments

Equipment API is available on the following environments:

| Environment | URL                                                                                                    |
| ----------- | ------------------------------------------------------------------------------------------------------ |
| Sandbox     | [https://fuse-equipment-api-sandbox.herokuapp.com/](https://fuse-equipment-api-sandbox.herokuapp.com/) |
| Production  | [https://fuse-equipment-api.herokuapp.com/](https://fuse-equipment-api.herokuapp.com/)                 |

### Usage Demonstration

An usage example of the Equipment API can be observed on the
[Dealership Demo Application](https://github.com/agco-fuse/dealership-demo).

This application is written in NodeJS and Angular. It demonstrate [how permissions are handled](#how-permissions-are-handled),
[how to retrieve an equipment list](#get-equipment) and [how to retrieve a single equipment](#get-equipment-id).

There are more details and instructions including how to deploy your own instance of the example
on the [project page](https://github.com/agco-fuse/dealership-demo).

Refer to the [Authenticate](#authenticate) section to learn how to acquire a valid token.

<aside class="notice">
You must replace <code>[token]</code> with the token response from the Authentication endpoint.
</aside>

## GET /equipment

<blockquote class='lang-specific curl'><p>Example of using curl to request a list of equipment</p></blockquote>

```curl
curl -X GET \
  --header "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  "https://fuse-equipment-api-sandbox.herokuapp.com/equipment?limit=1&offset=0"
```

<blockquote class='lang-specific schema'><p>HTTP 200 Successful Response schema:</p></blockquote>

```schema
[[equipment:model:equipmentData]]
```

This endpoint returns a list of equipment.

Equipment could be either a Tractor, a Baler, an Applicator, a Harvester or any
other equipment type that is being tracked by the platform.

An equipment on the response contains the identification information, as the
manufacturing date and description, and related information to the current status.
It is possible to extract the location coordinates and the latest values of CAN
variables reported back from the tracker.

You will only access equipment your access token allows.

### HTTP Request
On the Equipment API server:

`GET /equipment`.

When the information is returned with success, a list of equipment will be available with the CAN variable
information present according to the availability on that specific equipment.

You will get a limited list of 100 equipment. If you want more than 100 or to do paging you can use the
extra parameters.

Refer to the [CAN Variables](#can-variables) section to see the possible returned values.

## GET /equipment/{id}

<blockquote class='lang-specific curl'><p>Example of using curl to request details of an equipment</p></blockquote>

```curl
curl -X GET \
  --header "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  "https://fuse-equipment-api-sandbox.herokuapp.com/equipment/{id of the equipment}"
```

<blockquote class='lang-specific schema'><p>HTTP 200 Successful Response schema:</p></blockquote>

```schema
[[equipment:model:anEquipmentData]]
```

This endpoint returns a single equipment associated with the given id.

Equipment could be either a Tractor, a Baler, an Applicator, a Harvester or any
other equipment type that is being tracked by the platform.

An equipment on the response contains the identification information, as the
manufacturing date and description, and related information to the current status.
It is possible to extract the location coordinates and the latest values of CAN
variables reported back from the tracker.

You will only access equipment your access token allows.

### HTTP Request
On the Equipment API server:

`GET /equipment/{id}`.

When the information is returned with success, a single equipment will be available.

The equipment contain the CAN variable information present according to the availability on that specific equipment.

Refer to the [CAN Variables](#can-variables) section to see the possible returned values.

## Errors

Error Code                        | Meaning
----------                        | -------
[401](#401-unauthorized)          | [Unauthorized](#401-unauthorized)
[404](#404-not-found)             | [Not Found](#404-not-found)
[500](#500-internal-server-error) | [Internal Server Error](#500-internal-server-error)

## 401 Unauthorized

<blockquote class='lang-specific schema'><p>HTTP 401 Unauthorized Response schema:</p></blockquote>

```schema
[[equipment:model:401]]
```

When the authentication token is invalid or expired, the response will return an array of errors, with an item pointing out the status and the response code.

<aside class="info">There is a response schema on the right panel.</aside>

## 404 Not Found

<blockquote class='lang-specific schema'><p>HTTP 404 Not Found Response schema:</p></blockquote>

```schema
[[equipment:model:404]]
```

When the list does not exist, the response will return an array of errors, with an item pointing out the status and the response code.

<aside class="info">There is a response schema on the right panel.</aside>

## 500 Internal Server Error

<blockquote class='lang-specific schema'><p>HTTP 500 Internal Server Error Response schema:</p></blockquote>

```schema
[[equipment:model:500]]
```

When there is an error processing the request, the response will return an array of errors, with an item pointing out the status and the response code.
<aside class="info">There is a response schema on the right panel.</aside>
