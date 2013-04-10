request = require 'request'

# Will get all the friends Steam IDs
exports.getSteamFriends = (steamID, res) ->

  url =
      "http://api.steampowered.com/ISteamUser/GetFriendList/v0001/" +
      "?key=#{process.env.steamAPIkey}" +
      "&steamid=#{steamID}&relationship=friend"

  request url, (err, apiRes, body) ->
    try
      getFriendsInfo JSON.parse(body).friendslist.friends, res
    catch err
      res.send 400, 'Invalid Steam ID'

# Helper function to get friends' info like name and avatar
getFriendsInfo = (friends, res) ->

  # Collect friend ids
  steamids = friends.map (friend) ->
    friend.steamid

  url =
    " http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/" +
    "?key=#{process.env.steamAPIkey}&steamids=" + steamids.join ','

  request url, (err, apiRes, body) ->

    players = JSON.parse(body).response.players

    # Return an error if the invoker has no friends :(
    return res.send(404, 'No friends') if players.length == 0

    # Reduce each player to only expose the necessary information
    playerData = players.map (player) ->
      {
        steamID: player.steamid,
        name:    player.personaname,
        avatar:  player.avatar
      }

    res.send playerData
