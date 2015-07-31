GemnasiumClient = require '../../lib/GemnasiumClient'

describe 'GemnasiumClient', ->

  instance = null

  before ->
    #process.env.GEMNASIUM_TOKEN = 'FAKE'
    #process.env.GEMNASIUM_PROJECT_SLUG = 'FAKE'
    instance = new GemnasiumClient

  describe 'constructor()', ->

    it 'returns an object', ->
      instance.should.be.an.object

  describe 'alerts()', ->

    error = null
    result = null

    before (done) ->
      callback = sinon.spy()
      instance.alerts (err, res) ->
        error = err
        result = res
        done()

    it 'does not error', ->
      (typeof error).should.eq 'undefined'

    it 'returns an array', ->
      result.should.be.an.Array

  describe 'dependencies()', ->

    error = null
    result = null

    before (done) ->
      callback = sinon.spy()
      instance.dependencies (err, res) ->
        error = err
        result = res
        done()

    it 'does not error', ->
      (typeof error).should.eq 'undefined'

    it 'returns an array', ->
      result.should.be.an.Array

  describe '_handleResponse()', ->

    callback = null

    before ->
      callback = sinon.spy()
      body = [
          open_at: '2015-06-17T11:22:33.123456Z'
      ]
      instance._handleResponse JSON.stringify(body), callback

    it 'runs the specified callback', ->
      callback.should.of.been.called

    it 'converts date strings to objects', ->
      callback.args[0][1][0].open_at.should.be.an.Object
