# gcloud-proxy-cors

Many (or Most) Google Cloud Services doesn't have the right CORS Headers to be able to work from Browsers. May be for good reason that their Javascript client libraries doesn't work within browsers. This docker image contains necessary nginx configurations to setup reverse proxy over the necessary Google Cloud APIs. 

The following services have been configured

* [Auto ML](https://cloud.google.com/vision/automl/docs/create-datasets) - The actual REST API are documented as part of the How-to Guides.
* [Cloud Storage](https://cloud.google.com/storage/docs/json_api)
* [Cloud Resource Manager](https://cloud.google.com/resource-manager/reference/rest)

## Usage
Create a folder to keep all the generated LetsEncrypt Certificates. 
```
mkdir -p letsencrypt/
```

You would need to configure the environment variables

| Environment Variable | Description |
| --- | --- |
| `ORIGIN_CHECK_DOMAIN` | For security reasons, you need this variable to specify from which domain you would be making requests to these proxies. We don't return CORS Headers otherwise. |
| `CERTBOT_EMAIL` | Email that would be associated with the certificates that are being generated. |
| `CRM_FQDN` | Fully-qualified domain name that you're exposing the CloudResourceManager API Proxy. |
| `AL_FQDN` | Fully-qualified domain name that you're exposing the AutoML API Proxy. |
| `GS_FQDN` | Fully-qualified domain name that you're exposing the Google Cloud Storage API Proxy. |


You can then start the proxies using `docker run`.
```
docker pull ashwanthkumar/gcloud-proxy-cors:latest
docker run --restart=unless-stopped -v "$PWD/letsencrypt:/etc/letsencrypt" -e 'ORIGIN_CHECK_DOMAIN=airtableblocks\\.com' -e "CERTBOT_EMAIL=youremail@foo.in" -e "ENVSUBST_VARS=AL_FQDN GS_FQDN CRM_FQDN ORIGIN_CHECK_DOMAIN" -e "CRM_FQDN=cloudresourcemanager.foo.in" -e "AL_FQDN=automl.foo.in" -e "GS_FQDN=gs.foo.in" -p "80:80" -p "443:443" ashwanthkumar/gcloud-proxy-cors:latest
```

## License
Public Domain
