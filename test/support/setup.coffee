chai = require 'chai'
sinonChai = require 'sinon-chai'
sinon = require 'sinon'

chai.config.includeStack = true

chai.should()
chai.use sinonChai

global.sinon = sinon