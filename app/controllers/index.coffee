steamFriends = require '../helpers/steamFriends'

exports.index = (req, res) ->
  res.render 'index'

exports.getSteamFriends = (req, res) ->
  query = req.query

  sendSteamIDerr = ->
    res.send 400, 'Please provide a steam ID'

  if query && query.steamID
    steamFriends.getSteamFriends query.steamID, res
  else
    sendSteamIDerr()


