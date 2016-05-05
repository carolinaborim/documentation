## GET /equipment

> curl example to get a list of equipment:

```shell
curl -X GET \
    --header "authorization: Bearer YOUR_ACCESS_TOKEN" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/equipment"
```

> HTTP 200 Successful Response Schema:

```json
[[telemetry:operation:getEquipment]]
```

This is the endpoint for retrieving the list of equipment. The equipment returned will be the equipment your accesss token have access to.

### HTTP Request

On the Telemetry API server:

`GET /equipment`

When the information is returned with success, a list of equipment will be available.

The list of equipment may contain 0 or more equipment.

There are some [parameters](#request-parameters) that can be send to `GET /equipment` to get more data on the response.

## GET /equipment/{id}

## Request parameters

> curl example to get a list of equipment sending paramenters:

```shell
curl -X GET \
    --header "authorization: Bearer YOUR_ACCESS_TOKEN" \
    --data-urlencode "include=model,dealer,manufacturingModel" \
    --data-urlencode "limit=10" \
    --data-urlencode "offset=0" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/equipment"
```

The parameters are optional. A few parameters available below:

- **include**: Includes models payload that the equipment refers to. It possible send more than one separated by comma `,`.
 - **model**: The model of the equipment.
 - **dealer**: The Dealer that equioment belongs.
 - **manufacturingModel**: The manufacturing model code.
- **offset**: Defines from each index start the list (the first index is 0).
- **limit**: Defines max number of equipment on the response
