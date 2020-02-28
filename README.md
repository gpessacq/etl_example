## ETL Example

This Ruby on Rails application demonstrates a simple ETL example using the [light-service]https://github.com/adomokos/light-service gem pattern

### Prerequisites

1. Have the examples_app installed and running, which serves as the source of the information to be extracted by the ETL Example application:
[https://github.com/gpessacq/example_app]https://github.com/gpessacq/example_app


### Instructions

1. An environment variable **END_POINT** with the endpoint to be queried, in this case, using the example_app:

`export BASE_URL=localhost:3100/units.json`


