express = require "express"
User = require "../models/user.coffee"

router = express.Router()

router.post '/', (req, res) ->
  user = new User req.body
  user.setPassword req.body.password

  user.save (err) ->
    console.log err if err
    res.json status: "ok"

module.exports = router
