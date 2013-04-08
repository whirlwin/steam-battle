request = require 'request'

exports.getSteamFriends = (steamID, res) ->

  url =
      "http://api.steampowered.com/ISteamUser/GetFriendList/v0001/" +
      "?key=#{process.env.steamAPIkey}" +
      "&steamid=#{steamID}&relationship=friend"

  request url, (err, apiRes, body) ->
    res.send body
