## Duties

Manages equipment status.

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

This is the endpoint to receive a duty equivalent to the sent id.

### HTTP Request

On the Telemetry API server:

`GET /duties/{id}`.

When the information is returned with success, a list with one or more duties will be available.

There are some parameters that can be sent to `GET /duties/{id}` to filter data on the response such as `limit=2`.

## duties request parameters

> curl example to get a list of tracking points sending paramenters:

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
