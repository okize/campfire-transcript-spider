# save
class Save

  constructor: (@data, @date) ->
    fs = require 'fs'
    path = require 'path'
    dir = './data'
    filename = @getFilename @date

  _getFilename: (date) ->
    return "#{date[0]}#{date[1]}#{date[2]}.json"

class Bootstrap
  instance = null

  @setConfig: (data) ->
    instance ?= new Save(data)

module.exports = Bootstrap
