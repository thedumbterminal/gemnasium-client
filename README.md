# gemnasium-client

[![Dependency Status](https://gemnasium.com/thedumbterminal/gemnasium-client.svg)](https://gemnasium.com/thedumbterminal/gemnasium-client)

[![Build Status](https://travis-ci.org/thedumbterminal/gemnasium-client.svg)](https://travis-ci.org/thedumbterminal/gemnasium-client)

A wrapper for the gemnasium API

## Usage

First set the correct environment variables, which can be found in the gemnasium account and project settings pages.

    export GEMNASIUM_TOKEN=yourtoken
    export GEMNASIUM_PROJECT_SLUG=yourprojectslug

(coffeescript)

    GemnasiumClient = require 'gemnasium-client'
    client = new GemnasiumClient
    client.alerts (error, result) ->
      throw error if error
      console.log 'result:', result

(javascript)

    var GemnasiumClient = require('gemnasium-client');
    var client = new GemnasiumClient;
    client.alerts(function(error, result){
      if(error){
        throw error;
      }
      console.log('result:', result);
    });

## Developing

To compile JS:

    npm run build

To run tests:

    npm test
