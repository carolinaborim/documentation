## Tracking Points

Manages tracking points.

## GET /trackingPoints

<blockquote class='lang-specific curl'><p>curl example to get a list of tracking points:</p></blockquote>

```curl
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingPoints"
```

<blockquote class='lang-specific schema'><p>HTTP 200 Successful Response Schema:</p></blockquote>

```schema
[[telemetry:operation:getTrackingPoint]]
```

This endpoint returns a list of tracking points.

### HTTP Request

On the Telemetry API server:

`GET /trackingPoints`

When the information is returned with success, a list of tracking points will be available.

There are some [parameters](#tracking-points-request-parameters) that can be sent to `GET /trackingPoints` to get more data on the response.

## GET /trackingPoints/{id}

<blockquote class='lang-specific curl'><p>curl example to get one tracking points by id</p></blockquote>

```curl
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingPoints/{TRACKING POINT ID}"
```

<blockquote class='lang-specific curl'><p>curl example to get two tracking points by id</p></blockquote>

```curl
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData?id={TRACKING POINT ID 1},{TRACKING POINT ID 2}"
```

<blockquote class='lang-specific schema'><p>HTTP 200 Successful Response Schema:</p></blockquote>

```schema
[[telemetry:operation:getTrackingPoint]]
```

This endpoint returns a tracking point associated to the given id.

### HTTP Request

On the Telemetry API server:

`GET /trackingPoints/{id}`.

When the information is returned with success, a list with one or more tracking points will be available.

There are some [parameters](#tracking-points-request-parameters) that can be sent to
`GET /trackingPoints/{id}` to get more data on the response such as `include=duty,equipment`.

## Tracking points request parameters

<blockquote class='lang-specific curl'><p>curl example to get a list of tracking points sending parameters:</p></blockquote>

```curl
curl -X GET --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
"https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData?\
deviceId={DEVICE ID}&\
head={HEAD VALUE}&\
location={LOCATION VALUE}&\
links.duty={DUTY}&\
links.equipment={EQUIPMENT}&\
timeOfOccurrence={TIME}&\
include=duty,equipment&\
limit=10&\
offset=0"
```

The parameters below are optional:

- **deviceId**: Gateway device identification number.
- **head**: TBD.
- **location**: Equipment location.
- **links.duty**: [Equipment status](#duties).
- **links.equipment**: [Equipment information](#equipment).
- **timeOfOccurrence**: time.
- **include**: Includes the tracking points relationships. Is possible send more than one separated by comma `,`.
  - **duty**: [Equipment status](#duties).
  - **equipment**: [Equipment information](#equipment).
- **offset**: Defines from each index start the list (the first index is 0).
- **limit**: Defines max number of tracking points on the response
