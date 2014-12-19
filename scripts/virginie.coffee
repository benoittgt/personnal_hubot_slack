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
  "ce que j'ecriver avant kje lecriver dans mon editeur de texte  enfin du moin je croyais lol",
  "une fois que jai t new requests je fork",
  "Benoit: tu as pas le lien de ton github ? virginie: https://github.com/"
  ]

module.exports = (robot) ->
 robot.hear /.*(hey virginie).*/i, (msg) ->
  quote = msg.random quotes
  msg.send "Virginie's quote :", "\"" + quote + "\""

