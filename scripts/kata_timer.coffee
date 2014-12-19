# Description:
# Hubot's kata timer for dojo coding session
#
# Dependencies:
# None
#
# Configuration:
# HUBOT_KATA_DEFAULT_TIME
#
# Commands:
# hubot start kata - start a new kata
# hubot start kata <time> - start a new kata with a duration of <time> minutes
# hubot stop kata - stop a kata
# hubot kata? - shows the details of the current kata
# hubot total rounds - shows the number of the total completed katas
#
# Author:
# mcollina & quickly edited by benoitgt
currentkata = null

module.exports = (robot) ->
  robot.brain.data.katas ||= 0
  robot.respond /start kata ?(\d+)?/i, (msg) ->
    if currentkata?
      msg.send "Kata already started"
      return
        
    currentkata = {}

    currentkata.func = ->
      msg.send "kata's time is over, time to change!"
      currentkata = null
      robot.brain.data.katas += 1
      
    currentkata.time = new Date()
    currentkata.length = process.env.HUBOT_KATA_DEFAULT_TIME ? 5
    currentkata.length = parseInt(msg.match[1]) if msg.match[1]?

    msg.send "Kata started!"

    currentkata.timer = setTimeout(currentkata.func, currentkata.length * 60 * 1000)

  robot.respond /kata\?/i, (msg) ->
    unless currentkata?
      msg.send "You have not started kata"
      return

    minutes = currentkata.time.getTime() + currentkata.length * 60 * 1000
    minutes -= new Date().getTime()
    secondes = currentkata.time.getTime() + 60 * 1000
    secondes -= new Date().getTime()

    # secondes = setInterval(currentkata.time.getTime() + 60 * 1000 if secondes == 0, 1000)

    minutes = Math.round(minutes / 1000 / 60)
    # if secondes == 0
    #   secondes = 60
    # else
    # secondes = Math.round(secondes / 1000)

    secondes = Math.round(secondes / 1000)

    msg.send "There are still #{minutes-1}:#{secondes} in this kata"

  robot.respond /stop kata/i, (msg) ->
    unless currentkata?
      msg.send "You have not started any kata"
      return
      
    clearTimeout(currentkata.timer)
    
    currentkata = null
    msg.send "Kata stopped!"
  
  robot.respond /total katas/i, (msg) ->
    msg.send "You have completed #{robot.brain.data.katas} katas"