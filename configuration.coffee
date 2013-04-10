express = require 'express'
path    = require 'path'
fs      = require 'fs'
assets  = require 'connect-assets'

exports.configure = ->

  app = express()

  # Configure connect-assets to use ./app/assets
  assets = assets src: './app/assets'

  app.configure ->
    app.set 'port', process.env.PORT || 3000
    app.set 'views', __dirname + '/app/views'
    app.set 'view engine', 'jade'
    app.use express.favicon()
    app.use express.logger('dev')
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser('your secret here')
    app.use express.session()
    app.use app.router
    app.use require('stylus').middleware(__dirname + '/public')
    app.use express.static(path.join __dirname, 'public')
    app.use assets
    app.locals.pretty = true

  app.configure 'development', ->
    app.use express.errorHandler()

  do configureAPIkeys = ->
    fs.readFile 'credentials.json', 'UTF-8', (err, data) ->
      throw err if err
      process.env['steamAPIkey'] = JSON.parse(data).steamAPIkey

  app
