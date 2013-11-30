# makes a request for a json transcript of a campfire chat room
# @config contains identity & auth token
# @date is an array [Y, M, D] that contains the date of the transcript being requested
# @room is the campfire room number

class Campfire

  constructor: (config, date, room) ->
    @request = require 'request'
    @json = ''
    @options =
      uri: "https://plm.campfirenow.com/room/#{room}/transcript/#{date[0]}/#{date[1]}/#{date[2]}.json"
      headers:
        'User-Agent': config.identity
      auth:
        user: config.auth
        pass: 'x'
        sendImmediately: false

  getJson: ->
    @request @options, (err, resp, body) ->
      return err if err

module.exports = Campfire
