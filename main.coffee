fs = require 'fs'
Campfire = require './campfire.coffee'
Range = require './dateRange.coffee'
Save = require './save.coffee'
config = require './config.json'

host = config.campfireHost
room = config.campfireRoomId
delay = config.delayBetweenApiRequests

dates = new Range config.startDate, config.endDate

transcript = new Campfire config

getTranscript = (day) ->
  date = dates[day]
  console.log "downloading transcript from #{date[1]}/#{date[2]}/#{date[0]}..."
  transcript.get(date, host, room, (err, req, data) ->
      throw err if err
      Save.toDisk(data, date, (result) ->
        console.log result
      )
    )

start = ->
  day = 0
  do throttle = ->
    getTranscript day
    day++
    setTimeout throttle, delay unless day >= dates.length

start()
