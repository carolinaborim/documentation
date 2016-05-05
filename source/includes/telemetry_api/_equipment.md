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

This is the endpoint for retrieving the list of equipment. You will only have access to equipment you own.

### HTTP Request

On the Telemetry API server:

`GET /equipment`

When the information is returned with success, a list of equipment will be available.

There are some [parameters](#request-parameters) that can be send to `GET /equipment` to get more data on the response.

## GET /equipment/{id}

> curl example to get one equipment by id

```shell
curl -X GET \
    --header "authorization: Bearer YOUR_ACCESS_TOKEN" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/equipment/ff6f026f-eac7-44c1-8456-c59ac061f467"
```

> curl example to get two equipment by id

```shell
curl -X GET \
    --header "authorization: Bearer YOUR_ACCESS_TOKEN" \
    "https://agco-fuse-trackers-sandbox.herokuapp.com/equipment/ff6f026f-eac7-44c1-8456-c59ac061f467,fc5eb98f-31fe-4daf-a68r-1fe6f647ad71"
```

> HTTP 200 Successful Response Schema:

```json
[[telemetry:operation:getEquipment]]
```

This is the endpoint to receive a equipment equivalent to the id sent.
The equipment returned will be the equipment your accesss token have access to.

### HTTP Request

On the Telemetry API server:

`GET /equipment/{id}`.

When the information is returned with success, a list with one or more equipment will be available.

There are some parameters that can be send to `GET /equipment/{id}` to get more data on the response such as `include=model,dealer`.

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

- **include**: Includes the equipment relationship. Is possible send more than one separated by comma `,`.
 - **model**: The model of the equipment.
 - **dealer**: The Dealer that equipment belongs.
 - **manufacturingModel**: The manufacturing model code.
- **offset**: Defines from each index start the list (the first index is 0).
- **limit**: Defines max number of equipment on the response
