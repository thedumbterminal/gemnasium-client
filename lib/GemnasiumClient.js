var https = require('https');
var moment = require('moment');

var GemnasiumClient = function(){
  this._token = process.env.GEMNASIUM_TOKEN;
  if(!this._token){
    throw new Error('No GEMNASIUM_TOKEN environment variable set');
  }
  this._slug = process.env.GEMNASIUM_PROJECT_SLUG;
  if(!this._slug){
    throw new Error('No GEMNASIUM_PROJECT_SLUG environment variable set');
  }
};

GemnasiumClient.prototype.details = function(cb){
  this._request(null, cb);
};

GemnasiumClient.prototype.alerts = function(cb){
  this._request('alerts', cb);
};

GemnasiumClient.prototype.dependencies = function(cb){
  this._request('dependencies', cb);
};

GemnasiumClient.prototype.dependencyFiles = function(cb){
  this._request('dependency_files', cb);
};

GemnasiumClient.prototype._request = function(action, cb){
  var self = this;
  https.get(this._options(action), function(res){
    var body = '';
    res.setEncoding('utf8');
    res.on('data', function(chunk){
      body += chunk;
      res.on('end', function(){
        //deal with api errors
        if(res.statusCode !== 200){
          return cb(new Error(body));
        };
        self._handleResponse(body, cb);
      }).on('error', function(e){  //deal with transport errors
        cb(e);
      });
    });
  });
};

GemnasiumClient.prototype._options = function(action){
  var path = "/v1/projects/" + this._slug;
  if(action){
    path += "/" + action;
  }
  return {
    hostname: 'api.gemnasium.com',
    path: path,
    auth: "x:" + this._token
  };
};

GemnasiumClient.prototype._handleResponse = function(body, cb){
  var parsed;
  try{
    parsed = JSON.parse(body);
  }
  catch(e){ //deal with data errors
    console.log("body: ", body);
    return cb(e);
  }

  //convert date strings to objects
  if(Array.isArray(parsed)){
    parsed.map(function(item){
      if(item.open_at){
        item.open_at = moment(item.open_at);
      }
    });
  }
  cb(undefined, parsed);
};

module.exports = GemnasiumClient;
