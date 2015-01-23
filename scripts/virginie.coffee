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
  "Benoit: tu as pas le lien de ton github ? virginie: https://github.com/",
  "jla j'espere que sa va fonctionnais que je puisse commencer les commencers les cours arf",
  "limite que je pende l'ordi mais j'y suis arriver xd",
  "pour sa rien a fonctionnais",
  "avec bundle exec rake  db : migrate sa a fonctionnais"
  ]

module.exports = (robot) ->
 robot.hear /.*(hey virginie).*/i, (msg) ->
  quote = msg.random quotes
  msg.send "Virginie's quote :", "\"" + quote + "\""

