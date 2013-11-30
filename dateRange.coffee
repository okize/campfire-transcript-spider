# returns an array of date arrays
# @startDate is the day to start counting from
# @endDate is the day to stop counting (leave blank for today)
class Range

  constructor: (@startDate, @endDate) ->
    moment = require 'moment'
    twix = require 'twix'
    @start = moment @startDate
    @end = if @endDate then moment @endDate else moment()
    @dayCount = @start.twix(@end).length 'days'
    return @_getRange()

  _getRange: ->
    arr = []
    date = @start
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