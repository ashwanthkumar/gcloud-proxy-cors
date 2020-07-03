# gcloud-proxy-cors

Many (or Most) Google Cloud Services doesn't have the right CORS Headers to be able to work from Browsers. May be for good reason that their Javascript client libraries doesn't work within browsers. This docker image contains necessary nginx configurations to setup reverse proxy over the necessary Google Cloud APIs. 

The following services have been configured

* [Auto ML](https://cloud.google.com/vision/automl/docs/create-datasets) - The actual REST API are documented as part of the How-to Guides.
* [Cloud Storage](https://cloud.google.com/storage/docs/json_api)

## License
Public Domain
