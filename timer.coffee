class Timer

  constructor: (@startDate, @interval) ->
    @moment = require 'moment'
    @date = if @startDate then @moment @startDate else @moment()
    @days = @interval

  tick: ->
    @date.subtract('days', 1)
    @days--

  getDate: ->
    date = new Array(
      @date.format('YYYY'),
      @date.format('MM'),
      @date.format('DD')
    )

module.exports = Timer
