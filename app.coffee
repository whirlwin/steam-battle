config = require './configuration'
router = require './router'
http   = require 'http'

app = config.configure()

router.route app

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port " + app.get('port')
