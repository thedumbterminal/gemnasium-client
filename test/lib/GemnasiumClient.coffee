GemnasiumClient = require '../../lib/GemnasiumClient'

describe 'GemnasiumClient', ->

  instance = null

  beforeEach ->
    instance = new GemnasiumClient

  describe 'constructor()', ->

    it 'returns an object', ->
      instance.should.be.an.object
      
  describe 'alerts()', ->
    
    callback = null
    
    beforeEach ->
      callback = sinon.spy()
      instance.alerts callback
    
    it 'executes callback', ->
      callback.should.of.been.called