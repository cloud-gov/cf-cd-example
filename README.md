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
* Set up your continuous deployment system.
    * If using Travis CI:
        1. Copy the [`.travis.yml`](.travis.yml).
        1. Update the `env` with your deployer user credentials. Make sure to [encrypt the password](https://docs.travis-ci.com/user/environment-variables#Defining-encrypted-variables-in-.travis.yml).
    * If using something else:
        1. Ensure that the following environment variables are set, corresponding to your deployer user:
            * `CF_USERNAME`
            * `CF_PASSWORD`
        1. Ensure that your deployment system calls `deploy.sh`.
* Deploy automatically.
    * Since buildpack changes (such as security fixes) are only picked up when an application is `push`ed/`restage`d, your application should be automatically deployed on a regular schedule.
    * On Travis CI, you can do this with [cron jobs](https://docs.travis-ci.com/user/cron-jobs/).

## Testing locally

```sh
./deploy.sh
```

## Caveats

* The script only deploys a single application. If you have multiple - say, a web server and a worker - you will need to adapt the script.
