ETL Example

This Ruby on Rails application demonstrates a simple ETL example using the [light-service]https://github.com/adomokos/light-service gem pattern

### Prerequisites

1. Have the examples_app installed and running, which serves as the source of the information to be extracted by the ETL Example application:
[https://github.com/gpessacq/example_app]https://github.com/gpessacq/example_app


### Instructions

1. An enviroment variable **BASE_URL** with the base url of the example_app needs to be defined. 
For instance:

`export BASE_URL=localhost:3100`

2. An environment variable **END_POINT** with the endpoint to be queried, in this case, using the example_app:

`export BASE_URL=units.json`


