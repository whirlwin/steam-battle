steamFriends = require '../helpers/steamFriends'

exports.index = (req, res) ->
  res.render 'index'

exports.getSteamFriends = (req, res) ->
  steamFriends.getSteamFriends(req.query.steamID, res)
