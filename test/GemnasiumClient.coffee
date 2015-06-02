GemnasiumClient = require '../lib/GemnasiumClient'

describe 'GemnasiumClient', ->

  describe 'constructor()', ->
    
    instance = null
    
    before ->
      instance = new GemnasiumClient
  
    it 'returns an object', ->
      instance.should.be.an.object