# Telemetry API

## Introduction

The Telemetry API provides access to data about each equipment the user owns.
The information queried provides a rich inspection of the telemetry data sent
to AGCO's platform.

You are able to retrieve information about equipment,
[equipment](#get-equipment20), [equipment's duty state](#get-duties), [tracking
data](#get-trackingdata), or [tracking point](#get-trackingpoints) for example.

This service is built on top of our open source
[elastic-harversterjs](https://github.com/agco/elastic-harvesterjs) library,
enabling advanced queries to be sent so you can have precise access to
information available on the platform.

The endpoints on this service implement [AGCO's JSON API
Profile](https://github.com/agco/agco-json-api-profiles) extensions, which let
you
[filter](https://github.com/agco/agco-json-api-profiles/blob/master/public/filtering-profile.md),
[request change
events](https://github.com/agco/agco-json-api-profiles/blob/master/public/change-events-profile.md),
and
[search](https://github.com/agco/agco-json-api-profiles/blob/master/public/search-profile.md)
the information available.

For further information on each endpoint, as examples and status code, see the following sections.
