# gemnasium-client

[![Dependency Status](https://gemnasium.com/thedumbterminal/gemnasium-client.svg)](https://gemnasium.com/thedumbterminal/gemnasium-client)

[![Build Status](https://travis-ci.org/thedumbterminal/gemnasium-client.svg)](https://travis-ci.org/thedumbterminal/gemnasium-client.svg)

A wrapper for the gemnasium API

## Developing

To compile JS:

    npm run build

To run tests:

First set the correct environment variables, which can be found in the gemnasium account and project settings pages.

    export GEMNASIUM_TOKEN=yourtoken
    export GEMNASIUM_PROJECT_SLUG=yourprojectslug
    npm test
