https = require 'https'
moment = require 'moment'

class GemnasiumClient

  constructor: ->
    @_token = process.env.GEMNASIUM_TOKEN
    throw new Error 'No GEMNASIUM_TOKEN environment variable set' unless @_token
    @_slug = process.env.GEMNASIUM_PROJECT_SLUG
    throw new Error 'No GEMNASIUM_PROJECT_SLUG environment variable set' unless @_slug

  alerts: (cb) ->
    options =
      hostname: 'api.gemnasium.com'
      path: "/v1/projects/#{@_slug}/alerts"
      auth: "x:#{@_token}"
    https.get(options, (res) =>
      body = ''
      res.setEncoding 'utf8'
      res.on 'data', (chunk) ->
        body += chunk
      res.on 'end', =>
        #deal with api errors
        if res.statusCode isnt 200
          return cb new Error(parsed.message)
        this._handleResponse body, cb
    ).on 'error', (e) ->  #deal with transport errors
      cb e

  _handleResponse: (body, cb) ->
    parsed = null
    try
      parsed = JSON.parse body
    catch e #deal with data errors
      console.log "body: ", body
      return cb e

    #all ok
    parsed = [] unless parsed

    #convert date strings to objects
    parsed.map (item) ->
      item.open_at = moment item.open_at
    cb undefined, parsed

module.exports = GemnasiumClient