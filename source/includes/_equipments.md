# Equipment API

The [Equipment API](#equipment-api) is an endpoint with the goal to provide equipment related structured information.

The information about the equipments are retrieved from the Telemetry API and should contain the same values, but on a specific structure.

## Authentication

To make use of the endpoints, a bearer token is required on the authorization header.

Header key    | Value
------------- | -----
Authorization | Bearer [token]

Refer to the [Authentication](#authentication) section to learn how to aquire a valid token.

<aside class="notice">
You must replace <code>[token]</code> with the token response from the Authentication endpoint.
</aside>

## List endpoint


> The endpoint information is the following:

[[equipment:operation:equipments]]

This is the endpoint for retrieving the list of equipments.
The equipments returned will be the equipments your accesss token have access to.

### HTTP Request
On the Equipment API server:

`GET /equipments`.

### Possible responses

Code | Status
---- | ------
200  | Success
401  | Unauthorized
404  | Not Found
500  | Unhandled Error


### 200 Successful

> The returned model schema is the following:

[[equipment:model:Model 2]]

When the information is returned with success, a list of equipments will be available.

The list of equipments may contain 0 or more equipments, with the CAN variable
informations present according to the availability on that specific equipment.

Refer to the [CAN Variables](#can-variables) section to see the possible returned values.

### 401 Unauthorized

> The returned model schema is the following:

[[equipment:model:Model 3]]

When the authentication token is invalid or expired, the response will return an array of errors, with an item pointing out the status and the response code.

### 404 Not Found

> The returned model schema is the following:

[[equipment:model:Model 5]]

When the list does not exist, the response will return an array of errors, with an item pointing out the status and the response code.

### 500 Unhandled Error

> The returned model schema is the following:

[[equipment:model:Model 7]]

When there is an error processing the request, the response will return an array of errors, with an item pointing out the status and the response code.

