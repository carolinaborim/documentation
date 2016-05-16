## Observing changes with Server Sent Events

The Telemetry API endpoints support observing event changes through
(SSE)[http://www.w3.org/TR/2009/WD-eventsource-20091029/] (Server Sent Events).

By appending a `/changes/stream` to the endpoints, a connection will start to
send information whenever the data changes in the background, reducing the
latency of the connection and supporting live data for streaming.

> Example of using the `/changes/stream` endpoint

```shell
curl -X GET \
    --header "Authorization: Bearer {YOUR ACCESS TOKEN}" \
    -v
    "https://agco-fuse-trackers-sandbox.herokuapp.com/equipment/changes/stream"

> [...]
< HTTP/1.1 200 OK
< Server: Cowboy
< Connection: keep-alive
< Content-Type: text/event-stream
< Cache-Control: no-cache
< Date: Mon, 16 May 2016 21:27:30 GMT
< Transfer-Encoding: chunked
< Via: 1.1 vegur
<
event: ticker
data: 0

event: ticker
data: 1

event: equipment_i
id: 1463492955_1
data: {"id":"ff69026f-eec7-44c5-8456-c08ac062fa67","description":"Equipment with manufactoringModel","serviceLevel":1,"identificationNumber":"0000001","manufacturingDate":"2014-06-30T15:18:51.000Z","links":{"dealer":"d7e07085-253c-4028-82fa-96f2bfcc9c4b","manufacturingModel":"e93e018d-07be-45c4-8b60-8e0770daf18a","model":"ffbfa8e6-aa5e-4572-8820-32adc97c8dc4","owner":"fd80ac0d-4813-4810-a978-9f68a07cd8ac"}}

```

The Server Sent Events are built on top of HTTP protocol, allowing it to be
used through proxies and websocket if required.
A HTTP response with the header of `Content-Type: text/event-stream` is sent back, streaming events as they are computed by the service.

The previous filters and aggregations can be combined to manimulate the information returned.

There are libraries available for many backend platforms, as
[Java](https://github.com/aslakhellesoy/eventsource-java) or
[Node](https://github.com/aslakhellesoy/eventsource-node), and the [EventSource
interface](https://developer.mozilla.org/en-US/docs/Web/API/EventSource) is
[widely available](http://caniuse.com/#feat=eventsource) on modern browsers.

More information about the supported arguments on the `/changes/stream`
endpoint is available on [AGCO JSON API profile
specs](https://github.com/agco/agco-json-api-profiles/blob/master/public/change-events-profile.md)
