
module.exports = (robot) ->
  robot.respond /(\S+)/i, (msg) ->
    
    message = msg.match[1]

    console.log(message)

    url = 'https://api.a3rt.recruit-tech.co.jp/talk/v1/smalltalk'
    key = ''

    request = require('request')

    request.post
      url: url
      form:
        apikey: key
        query: message

    ,(err, response, body) ->
      json = JSON.parse body
      console.log(json)
      result = json['results']
      st = json['status']

      if st == 0
        msg.send result[0].reply
      else if st == 2000
        msg.send 'え？'
      else
        msg.send 'error'