// Example script to demo library

var GemnasiumClient = require('../lib/GemnasiumClient');
var client = new GemnasiumClient();

client.details(function(error, result){
  if(error){
    throw error;
  }
  console.log('\ndetails() result:', result);
});

client.alerts(function(error, result){
  if(error){
    throw error;
  }
  console.log('\nalerts() result:', result);
});

client.dependencies(function(error, result){
  if(error){
    throw error;
  }
  console.log('\ndependencies() result:', result);
});

client.dependencyFiles(function(error, result){
  if(error){
    throw error;
  }
  console.log('\ndependencyFiles() result:', result);
});
