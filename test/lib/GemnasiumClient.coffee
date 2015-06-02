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