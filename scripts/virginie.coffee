# Description:
#   Quotes from Virginie
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hey virginie - display random quotes from Virginie
#
# Notes:
#   None
#
# Author:
#   carmstrong

quotes = [
  ":yaf:"
  ]

module.exports = (robot) ->
 robot.hear /.*(hey virginie).*/i, (msg) ->
  quote = msg.random quotes
  msg.send "Virginie's quote :", "\"" + quote + "\""

