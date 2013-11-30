# returns an array of date arrays
# @startDate is the day to start counting from
# @endDate is the day to stop counting (leave blank for today)
class Range

  constructor: (startDate, endDate) ->
    @moment = require 'moment'
    @twix = require 'twix'
    @startDate = @moment startDate
    @endDate = if endDate then @moment endDate else @moment()
    @dayCount = @startDate.twix(@endDate).length 'days'
    @range = @_getArray()

  _getArray: ->
    arr = []
    date = @startDate
    i = 0
    while i <= @dayCount
      arr.push @_getFormattedDate date
      date.add 'days', 1
      i++
    return arr

  _getFormattedDate: (date) ->
    dateArray = new Array(
      date.format('YYYY'),
      date.format('MM'),
      date.format('DD')
    )

module.exports = Range