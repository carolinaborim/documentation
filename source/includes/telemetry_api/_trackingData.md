## Tracking Data

Manages tracking data.

## GET /trackingData

> curl example to get a list of tracking data:

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData"
```

> HTTP 200 Successful Response Schema:

```json
[[telemetry:operation:getTrackingData]]
```

### HTTP Request

On the Telemetry API server:

`GET /trackingData`

When the information is returned with success, a list of tracking data will be available.

There are some [parameters](#tracking-data-request-parameters) that can be sent to `GET /trackingData` to get more data on the response.

## GET /trackingData/{id}

> curl example to get one tracking data by id

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData/{TRACKING DATA ID}"
```

> curl example to get two tracking data by id

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData?id={TRACKING DATA ID 1},{TRACKING DATA ID 2}"
```

> HTTP 200 Successful Response Schema:

```json
[[telemetry:operation:getTrackingData]]
```

This is the endpoint to receive a tracking data equivalent to the id sent.

### HTTP Request

On the Telemetry API server:

`GET /trackingData/{id}`.

When the information is returned with success, a list with one or more tracking data will be available.

There are some parameters that can be sent to `GET /trackingData/{id}` to get more data on the response such as `include=canVariable,trackingPoint`.

## Tracking data request parameters

> curl example to get a list of tracking data sending paramenters:

```shell
curl -X GET --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
"https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData?\
externalId={EXTERNAL TRACKING DATA ID}&\
raw={RAW VALUE}&\
links.trackingData={TRACKING DATA}&\
links.canVariable={CAN VARIABLE}&\
include=canvariable,trackingPoint&\
limit=10&\
offset=0"
```

The parameters below are optional:

- **externalId**: TBD.
- **raw**: Denormalized data (the actual value sent by the sensor).
- **links.trackingData**: TBD.
- **links.canVariable**: TBD.
- **include**: Includes the tracking data relationship. Is possible send more than one separated by comma `,`.
  - **canVariable**: TBD.
  - **trackingPoint**: TBD.
- **offset**: Defines from each index start the list (the first index is 0).
- **limit**: Defines max number of tracking data on the response
