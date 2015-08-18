mongoose = require 'mongoose'
crypto    = require 'crypto'
uuid      = require 'node-uuid'

userSchema = mongoose.Schema
  firstName     : String
  lastName      : String
  email         : String
  phone         : String
  passwordHash  :
    type      : String
    required  : true
  salt:
    type: String
    required: true
    default: uuid.v1

hash = (password, salt) ->
  crypto.createHmac('sha256', salt).update(password).digest('hex')

userSchema.methods.setPassword = (passwordText) ->
  @passwordHash = hash(passwordText, @salt)

userSchema.methods.isValidPassword = (passwordText) ->
  @passwordHash == hash(passwordText, @salt)

userSchema.methods.getData = () ->
  return {
    firstName: @firstName
    lastName: @lastName
    email: @email
    phone: @phone
  }

User = mongoose.model 'User', userSchema

module.exports = User
