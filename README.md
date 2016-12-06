# gemnasium-client

[![Dependency Status](https://gemnasium.com/thedumbterminal/gemnasium-client.svg)](https://gemnasium.com/thedumbterminal/gemnasium-client)

[![Build Status](https://travis-ci.org/thedumbterminal/gemnasium-client.svg)](https://travis-ci.org/thedumbterminal/gemnasium-client)

A wrapper for the gemnasium API

## Usage

First set the correct environment variables, which can be found in the gemnasium account and project settings pages.

    export GEMNASIUM_TOKEN=yourtoken
    export GEMNASIUM_PROJECT_SLUG=yourprojectslug

    var GemnasiumClient = require('gemnasium-client');
    var client = new GemnasiumClient();

### details()

Retrieve details for the project.

    client.details(function(error, result){
      console.log(error, result);
    });

### alerts()

Retrieve all security alerts for the project.

    client.alerts(function(error, result){
      console.log(error, result);
    });

### dependencies()

Retrieve all dependencies for the project.

    client.dependencies(function(error, result){
      console.log(error, result);
    });

### dependencyFiles()

Retrieve all the dependency files for the project.

    client.dependencyFiles(function(error, result){
      console.log(error, result);
    });

## Example

Run the following command to see a demo of the above methods:

    node example/client.js

## Developing

To run tests:

    npm test
