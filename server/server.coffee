express = require "express"
morgan = require "morgan"

bodyParser = require "body-parser"

mongoose = require "mongoose"

userRoutes = require "./routes/user-routes.coffee"

mongoose.connect 'mongodb://localhost/nodeapp', (err) ->
  if err
    console.log err
  else
    console.log "good to go"

app = express()
app.use bodyParser.urlencoded( extended: true )
app.use bodyParser.json()
app.use morgan('combined')

port = process.env.PORT || 3000

app.use '/users', userRoutes

app.listen port

console.log "Listening on: #{port}"
