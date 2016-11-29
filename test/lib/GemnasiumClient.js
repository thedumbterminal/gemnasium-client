const GemnasiumClient = require('../../lib/GemnasiumClient');

describe('GemnasiumClient', function(){

  let instance;

  before(function(){
    instance = new GemnasiumClient();
  });

  describe('constructor()', function(){

    it('returns an object', function(){
      instance.should.be.an.object;
    });

  });

  describe('alerts()', function(){

    let error;
    let result;

    before(function(done){
      let callback = sinon.spy();
      instance.alerts(function(err, res){
        error = err;
        result = res;
        done();
      });
    });

    it('does not error', function(){
      (typeof error).should.eq('undefined');
    });

    it('returns an array', function(){
      result.should.be.an.Array;
    });

  });

  describe('dependencies()', function(){

    let error;
    let result;

    before(function(done){
      let callback = sinon.spy();
      instance.dependencies(function(err, res){
        error = err;
        result = res;
        done();
      });
    });

    it('does not error', function(){
      (typeof error).should.eq('undefined');
    });

    it('returns an array', function(){
      result.should.be.an.Array;
    });

  });

  describe('_handleResponse()', function(){

    let callback;

    before(function(){
      callback = sinon.spy();
      const body = [{
        open_at: '2015-06-17T11:22:33.123456Z'
      }];
      instance._handleResponse(JSON.stringify(body), callback);
    });

    it('runs the specified callback', function(){
      callback.should.of.been.called;
    });

    it('converts date strings to objects', function(){
      callback.args[0][1][0].open_at.should.be.an.Object;
    });

  });

});
