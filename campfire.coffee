# makes a request for a json transcript of a campfire chat room
# @config contains identity & auth token
# @date is an array [Y, M, D] that contains the date of the transcript being requested
# @host is the sub-domain of campfire host (ie. sample in 'sample.cam')
# @room is the campfire room number
class CampfireConfig

  constructor: (@config) ->
    @options =
      headers:
        'User-Agent': @config.identity
      auth:
        user: @config.auth
        pass: 'x'
        sendImmediately: false

  get: (date, host, room, cb) ->
    request = require 'request'
    @options.uri = "https://#{host}.campfirenow.com/room/#{room}/transcript/#{date[0]}/#{date[1]}/#{date[2]}.json"
    request @options, (err, resp, body) ->
      return cb(err, resp, body)

class Campfire
  instance = null

  @setConfig: (config) ->
    instance ?= new CampfireConfig(config)

module.exports = Campfire
