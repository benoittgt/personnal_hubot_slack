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
  "Fuckin' A, man!",
  "une fois que jai t new requests je fork",
  "Benoit: tu as pas le lien de ton github ? virginie: https://github.com/"
  ]

module.exports = (robot) ->
 robot.hear /.*(hey virginie).*/i, (msg) ->
  quote = msg.random quotes
  msg.send "Virginie's quote :", "\"" + quote + "\""

