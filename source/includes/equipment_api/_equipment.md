# Equipment API

The [Equipment API](#equipment-api) is an endpoint with the goal to provide equipment related structured information.

The information about the equipment are retrieved from the Telemetry API and should contain the same values, but on a specific structure.

## Authentication

To make use of the endpoints, a bearer token is required on the authorization header.

Header key    | Value
------------- | -----
Authorization | Bearer [token]

Refer to the [How to Authenticate](#how-to-authenticate) section to learn how to aquire a valid token.

<aside class="notice">
You must replace <code>[token]</code> with the token response from the Authentication endpoint.
</aside>

## GET /equipment

> HTTP 200 Successful Response schema:

```json
[[equipment:model:Model 2]]
````

This is the endpoint for retrieving the list of equipment.
The equipment returned will be the equipment your accesss token have access to.

### HTTP Request
On the Equipment API server:

`GET /equipment`.

When the information is returned with success, a list of equipment will be available with the CAN variable
informations present according to the availability on that specific equipment.

Refer to the [CAN Variables](#can-variables) section to see the possible returned values.

## GET /equipment/{id}

> HTTP 200 Successfu Response schemal

```json
[[equipment:model:Model 8]]
````

This is the endpoint to receive a single equipment equivalent to the id sent.
The equipment returned will be the equipment your accesss token have access to.

### HTTP Request
On the Equipment API server:

`GET /equipment/{id}`.

When the information is returned with success, a single equipment will be available.

The equipment contain the CAN variable informations present according to the availability on that specific equipment.

Refer to the [CAN Variables](#can-variables) section to see the possible returned values.

## Errors

Error Code | Meaning
---------- | -------
[401](#401-unauthorized) | [Unauthorized](#401-unauthorized)
[404](#404-not-found) | [Not Found](#404-not-found)
[500](#500-internal-server-error) | [Internal Server Error](#500-internal-server-error)

## 401 Unauthorized

> 401 Unauthorized

```json
[[equipment:model:Model 3]]
```

When the authentication token is invalid or expired, the response will return an array of errors, with an item pointing out the status and the response code.

## 404 Not Found

> 404 Not Found

```json
[[equipment:model:Model 5]]
```

When the list does not exist, the response will return an array of errors, with an item pointing out the status and the response code.

## 500 Internal Server Error

> 500 Internal Server Error

```json
[[equipment:model:Model 7]]
```

When there is an error processing the request, the response will return an array of errors, with an item pointing out the status and the response code.
