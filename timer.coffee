class Timer

  constructor: (@date) ->
    @moment = require 'moment'
    @startDate = @moment @date
    @waitTime = 10
    @days = 7

  currentDate: ->
    year: @startDate.format('YYYY')
    month: @startDate.format('MM')
    day: @startDate.format('DD')

  tick: ->
    @startDate.subtract('days', 1)
    @days--

  getDate: ->
    date = new Array(
      @currentDate().year,
      @currentDate().month,
      @currentDate().day
    )

module.exports = Timer