routes = require './routes'

exports.route = (app) ->

  app.get '/', routes.index

