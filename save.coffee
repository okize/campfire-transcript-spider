# save
class Save

  constructor: ->

  @toDisk: (data, date, cb) ->
    fs = require 'fs'
    path = require 'path'
    dir = './data'
    filename = "#{date[0]}#{date[1]}#{date[2]}.json"
    fs.writeFile path.join(dir, filename), data, (err) ->
      throw err if err
      return cb "saved #{filename} to disk..."

module.exports = Save
