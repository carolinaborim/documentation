## Tracking Data

Manages tracking data.

## GET /trackingData

<blockquote class='lang-specific curl'><p>curl example to get a list of tracking data:</p></blockquote>

```curl
curl -X GET \
    --header "Authorization: Bearer YOUR_ACCESS_TOKEN" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData"
```

<blockquote class='lang-specific schema'><p>HTTP 200 Successful Response Schema:</p></blockquote>

```schema
[[telemetry:operation:getTrackingData]]
```

This endpoint returns a list of tracking data.

### HTTP Request

On the Telemetry API server:

`GET /trackingData`

When the information is returned with success, a list of tracking data will be available.

There are some [parameters](#tracking-data-request-parameters) that can be sent to `GET /trackingData` to get more data on the response.

## GET /trackingData/{id}

<blockquote class='lang-specific curl'><p>curl example to get one tracking data by id</p></blockquote>

```curl
curl -X GET \
    --header "Authorization: Bearer YOUR_ACCESS_TOKEN" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData/{TRACKING DATA ID}"
```

<blockquote class='lang-specific curl'><p>curl example to get two tracking data by id</p></blockquote>

```curl
curl -X GET \
    --header "Authorization: Bearer YOUR_ACCESS_TOKEN" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData?id={TRACKING DATA ID 1},{TRACKING DATA ID 2}"
```

<blockquote class='lang-specific schema'><p>HTTP 200 Successful Response Schema:</p></blockquote>

```schema
[[telemetry:operation:getTrackingData]]
```

This endpoint returns a tracking data associated to the given id.

### HTTP Request

On the Telemetry API server:

`GET /trackingData/{id}`.

When the information is returned with success, a list with one or more tracking data will be available.

There are some parameters that can be sent to `GET /trackingData/{id}` to get more data on the response such as `include=canVariable,trackingPoint`.

## GET /trackingData/search

<blockquote class='lang-specific curl'><p>curl example to get more information from trackingData:</p></blockquote>

```curl
curl -X GET \
    --header "Authorization: Bearer YOUR_ACCESS_TOKEN" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData/search?include=trackingPoint"
```

<blockquote class='lang-specific curl'><p>curl example to get ENGINE_HOURS as an associated CAN variable:</p></blockquote>

```curl
curl -X GET \
    --header "Authorization: Bearer YOUR_ACCESS_TOKEN" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData/search?links.canVariable=ENGINE_HOURS"
```

<blockquote class='lang-specific curl'><p>curl example to get aggregated trackingData information:</p></blockquote>

```curl
curl -X GET \
    --header "Authorization: Bearer YOUR_ACCESS_TOKEN" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/trackingData/search?include=trackingPoint&\
aggregations=equipmentAgg&\
equipmentAgg.property=links.trackingPoint.equipment.id"
```

This endpoint allows you
[searching, filtering and aggregating](https://github.com/agco/agco-json-api-profiles/blob/master/public/search-profile.md)
tracking data.

It allows filtering by a specific field or relationship,
retrieving CAN variables and tracking points associated
to a given equipment and also aggregating equipment
information, if needed.

### Getting more information from trackingData

In case you need more information other than the pure trackingData
payload you can enrich it by using the `include` field. In the example,
the `trackingPoint` is being added to the response.

### Getting associated CAN variables or tracking points

In case you need to add other CAN variables than the ones available by
default, you can enrich the `trackingData` payload by adding a
`/trackingData/search?links.canVariable={CAN VARIABLE NAME}` field.
In the example below, the `ENGINE_HOURS` is being added to the response.

You can also include the `trackingPoint` associated to this `trackingData`
by adding a `/trackingData/search?include=trackingPoint` field.
In the previous example, the `trackingPoint` is being added to the response.

### Aggregating information

In case you want to group information by properties, you can create and
use aggregations.
You can only aggregate information based on the `includes` you did or on
the information available on `trackingData` payload.
To create a new aggregation, you need to add a field
`aggregations` and in this case, it is up to you to provide an
aggregation name, as its value. In our  example, the created aggregation
name is `equipmentAgg`. The result of this aggregation is going to be
included in the `meta` index, as a list of created aggregations.

You can also sort or limit the aggregation properties. You can find
further information about aggregations operators
[here](https://github.com/agco/agco-json-api-profiles/blob/master/public/search-profile.md).

<aside class="info">There is a curl example on the right panel.</aside>

## Tracking data request parameters

<blockquote class='lang-specific curl'><p>curl example to get a list of tracking data sending parameters:</p></blockquote>

```curl
curl -X GET --header "Authorization: Bearer YOUR_ACCESS_TOKEN" \
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
- **links.canVariable**: Equipment CAN variable value.
- **links.trackingPoint**: Equipment geolocation information.
- **include**: Includes the tracking data relationship. Is possible send more than one separated by comma `,`.
  - **canVariable**: Equipment CAN variable value.
  - **trackingPoint**: Equipment geolocation information.
- **offset**: Defines from each index start the list (the first index is 0).
- **limit**: Defines max number of tracking data on the response

<aside class="info">There is a curl example on the right panel.</aside>
