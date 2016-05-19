## Equipment

Manages Equipment data.

## GET /equipment

> curl example to get a list of equipment:

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/equipment"
```

> HTTP 200 Successful Response Schema:

```json
[[telemetry:operation:getEquipment]]
```

This endpoint returns a list of equipment.

### HTTP Request

On the Telemetry API server:

`GET /equipment`

When the information is returned with success, a list of equipment will be available.

To understand the equipment the user can see, access the [Equipment Ownership](#equipment-ownership) section.

There are some [parameters](#equipment-request-parameters) that can be sent to `GET /equipment` to get more data on the response.

## GET /equipment/{id}

> curl example to get one equipment by id

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/equipment/{EQUIPMENT ID}"
```

> curl example to get two equipment by id

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/equipment?id={EQUIPMENT ID 1},{EQUIPMENT ID 2}"
```

> HTTP 200 Successful Response Schema:

```json
[[telemetry:operation:getEquipment]]
```

This endpoint returns an equipment associated to the given id.

To understand the equipment the user can see, access the [ownership](#equipment-ownership) section.

### HTTP Request

On the Telemetry API server:

`GET /equipment/{id}`.

When the information is returned with success, a list with one or more equipment will be available.

There are some parameters that can be sent to `GET /equipment/{id}` to get more data on the response such as `include=model,dealer`.

## Equipment request parameters

> curl example to get a list of equipment sending parameters:

```shell
curl -X GET --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
"https://agco-fuse-trackers-sandbox.herokuapp.com/equipment?&\
include=model,dealer,manufacturingModel&\
limit=10&\
offset=0"
```

The parameters below are optional:

- **include**: Includes the equipment relationship. Is possible send more than one separated by comma `,`.
 - **model**: The model of the equipment.
 - **dealer**: The Dealer that equipment belongs.
 - **manufacturingModel**: The manufacturing model code.
- **offset**: Defines from each index start the list (the first index is 0).
- **limit**: Defines max number of equipment on the response


## Equipment ownership

The Equipment is linked to an owner that can be a farmer or a dealer, also is possible the equipment be linked to both at the same time.

There are no difference do a request to get equipment as a farmer or as a dealer user.
The response always will return the equipment that the user owns
