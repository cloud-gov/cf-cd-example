# Example: Continuous Deployment (CD) to Cloud Foundry [![Build Status](https://travis-ci.org/18F/cf-cd-example.svg?branch=master)](https://travis-ci.org/18F/cf-cd-example)

This repository demonstrates how to continuously deploy a simple application from a continuous deployment system to Cloud Foundry. This example happens to use the following:

* A Ruby application using the Sinatra framework
* Travis CI for deployment
* Deployment to cloud.gov

but using alternatives to these would only require minor adjustments.

## Usage

To set up continuous deployment in your own project:

* Copy the [deploy script](deploy.sh), and modify the variables at the top.
* Ensure that you have an [application manifest](https://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html).
* Set up your continuous deployment system to call `deploy.sh`, and pass the following environment variables corresponding to a deployer user:
    * `CF_USERNAME`
    * `CF_PASSWORD`

## Testing locally

```sh
./deploy.sh
```

## Caveats

* The script only deploys a single application. If you have multiple - say, a web server and a worker - you will need to adapt the script.
