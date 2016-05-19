## Duties

Manages equipment status.

A duty is the current work status of a given equipment.

Possible duty states are:

| Status           | Description              |
| ---------------- | ------------------------ |
| NO_CONTACT       | Equipment is unreachable |
| OFF_PARKED       | Equipment is turned off  |
| HEADLAND_TURNING | ???                      |
| TRANSPORT        | ???                      |
| WORKING          | Equipment is working     |
| STOPPEDIDLE      | Equipment is idle        |

## GET /duties

> curl example to get a list of duties:

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/duties"
```

> HTTP 200 Successful Response Schema:

```json
[[telemetry:operation:getDuty]]
```

This endpoint returns a list of duties.

### HTTP Request

On the Telemetry API server:

`GET /duties`

When the information is returned with success, a list of duties will be available.

There are some [parameters](#duties-request-parameters) that can be sent to `GET /duties` to filter the response.

## GET /duties/{id}

> curl example to get one duties by id

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/duties/{DUTY ID}"
```

> curl example to get two duties by id

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData?id={DUTY ID 1},{DUTY ID 2}"
```

> HTTP 200 Successful Response Schema:

```json
[[telemetry:operation:getDuty]]
```

This endpoint returns a duty associated with the given id.

### HTTP Request

On the Telemetry API server:

`GET /duties/{id}`.

When the information is returned with success, a list with one or more duties will be available.

There are some [parameters](#duties-request-parameters) that can be sent to `GET /duties/{id}`.

## Duties request parameters

> curl example to get a list of tracking points sending parameters:

```shell
curl -X GET --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
"https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData?\
status={DUTY VALUE}&\
limit=10&\
offset=0"
```

The parameters below are optional:

- **status**: Equipment status.
- **offset**: Defines from each index start the list (the first index is 0).
- **limit**: Defines max number of tracking points on the response
