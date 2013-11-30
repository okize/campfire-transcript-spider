class Campfire

  constructor: (@config, @date) ->
    @request = require 'request'
    @json = ''
    @options =
      uri: "https://plm.campfirenow.com/room/#{@config.room}/transcript/#{@date[0]}/#{@date[1]}/#{@date[2]}.json"
      headers:
        'User-Agent': @config.identity
      auth:
        user: @config.user
        pass: 'x'
        sendImmediately: false

  getJson: ->
    @request @options, (err, resp, body) ->
      return err if err

module.exports = Campfire
