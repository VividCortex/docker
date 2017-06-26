Please have in mind that configuration for containers is controlled via environment variables that should be set in one of the following ways:
1. as build arguments when building the image
2.  passed as configuration parameters at runtime

In the README files of the projects in this repository we give examples of both cases, such as VC_API_TOKEN as a `--build-arg` for `docker build` and VC_DRV_MANUAL_HOST_URI as a `--env` for `docker run`. If you need to setup any other configuration, such as credentials for AWS (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY), you can follow any of these routes.

