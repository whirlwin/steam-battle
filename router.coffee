routes = require './app/controllers'

exports.route = (app) ->

  app.get '/', routes.index

  app.get '/steamFriends', routes.getSteamFriends
