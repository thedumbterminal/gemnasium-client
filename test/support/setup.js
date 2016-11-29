const chai = require('chai');
const sinonChai = require('sinon-chai');
const sinon = require('sinon');

chai.config.includeStack = true;

chai.should();
chai.use(sinonChai);

global.sinon = sinon;
