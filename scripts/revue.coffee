# Description
#   Easily add links and images to your Revue weekly digest
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_REVUE_ACCESS_TOKEN
#
# Commands:
#   hubot add link <url> - Adds the url <url> as a link to your weekly digest
#   hubot add image <image> - Adds the image <url> as an image to your weekly digest
#
# Notes:
#   Eat, sleep, curate, repeat (weekly)
#
# Author:
#   martijndekuijper

config =
  access_token: process.env.HUBOT_REVUE_ACCESS_TOKEN

module.exports = (robot) ->
  robot.respond /revue add (link|image) ([^ ]+)/i, (msg) ->
    type = msg.match[1]
    link = msg.match[2]

    unless config.access_token
      msg.send "Please set the HUBOT_REVUE_ACCESS_TOKEN environment variable."
      return 

    data = "type=#{type}&url=#{escape(link)}&via=slack"

    robot.http("http://www.getrevue.co/api/add_item")
      .headers('x-revue-token': config.access_token, "Content-type": "application/x-www-form-urlencoded")
      .post(data) (err, res, body) ->
        json = JSON.parse(body)
        if err || res.statusCode is 403 || res.statusCode is 422
          msg.reply json.error
          return  

        msg.reply "That is one awesome #{type}, I've added it to your weekly digest"