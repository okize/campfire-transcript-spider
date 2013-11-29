class Timer

  constructor: (@date) ->
    @moment = require 'moment'
    @startDate = @moment @date
    @days = 1

  tick: ->
    @startDate.subtract('days', 1)
    @days--

  getDate: ->
    date = new Array(
      @startDate.format('YYYY'),
      @startDate.format('MM'),
      @startDate.format('DD')
    )

module.exports = Timer