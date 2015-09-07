m = require('mochainon')
path = require('path')
url = require('url')
utils = require('../lib/utils')
defaults = require('../lib/defaults')

describe 'Defaults:', ->

	describe '.resinUrl', ->

		it 'should be a valid url', ->
			setting = utils.evaluateSetting(defaults, 'resinUrl')
			m.chai.expect ->
				url.parse(setting)
			.to.not.throw(Error)

	describe '.apiUrl', ->

		it 'should be a valid url', ->
			setting = utils.evaluateSetting(defaults, 'apiUrl')
			m.chai.expect ->
				url.parse(setting)
			.to.not.throw(Error)

	describe '.dashboardUrl', ->

		it 'should be a valid url', ->
			setting = utils.evaluateSetting(defaults, 'dashboardUrl')
			m.chai.expect ->
				url.parse(setting)
			.to.not.throw(Error)

	describe '.dataDirectory', ->

		it 'should be an absolute path', ->
			setting = utils.evaluateSetting(defaults, 'dataDirectory')
			isAbsolute = setting is path.resolve(setting)
			m.chai.expect(isAbsolute).to.be.true

	describe '.projectsDirectory', ->

		it 'should be an absolute path', ->
			setting = utils.evaluateSetting(defaults, 'projectsDirectory')
			isAbsolute = setting is path.resolve(setting)
			m.chai.expect(isAbsolute).to.be.true

	describe '.cacheDirectory', ->

		it 'should be an absolute path', ->
			setting = utils.evaluateSetting(defaults, 'cacheDirectory')
			isAbsolute = setting is path.resolve(setting)
			m.chai.expect(isAbsolute).to.be.true

	describe '.imageCacheTime', ->

		it 'should be a number', ->
			setting = utils.evaluateSetting(defaults, 'imageCacheTime')
			m.chai.expect(setting).to.be.a('number')

		it 'should be a positive number', ->
			setting = utils.evaluateSetting(defaults, 'imageCacheTime')
			m.chai.expect(setting > 0).to.be.true

	describe '.tokenRefreshInterval', ->

		it 'should be a number', ->
			setting = utils.evaluateSetting(defaults, 'tokenRefreshInterval')
			m.chai.expect(setting).to.be.a('number')

		it 'should be a positive number', ->
			setting = utils.evaluateSetting(defaults, 'tokenRefreshInterval')
			m.chai.expect(setting > 0).to.be.true

		it 'should be an integer', ->
			setting = utils.evaluateSetting(defaults, 'tokenRefreshInterval')
			m.chai.expect(setting % 1).to.equal(0)