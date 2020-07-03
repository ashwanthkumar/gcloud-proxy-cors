# automl-proxy-cors

AutoML service on Google Cloud doesn't have CORS headers, so you can't build a frontend app that runs within a browser that can call it's REST API. This repository contains a docker image that runs nginx as a reverse proxy (with SSL support) to automl REST API endpoint and responds CORS headers too as part of preflight check.

## License
Public Domain

