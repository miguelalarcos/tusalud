@Notes = new Mongo.Collection('Notes')
@Permissions = new Mongo.Collection('Permissions')

class @Note extends sb.Model
  @schema:
    text:
      type: String
      validation: (x) -> x.length <= 500
  insertNote: -> Meteor.call 'insertNote', @text
  updateNote: -> Meteor.call 'updateNote', @_id, @text

class @Profile extends sb.Model
  @schema:
    name:
      type: String
      validation: (x) -> x.length <= 30
    surname:
      type: String
      validation: (x) -> x.length <= 30
    surname2:
      type: String
      validation: (x) -> x.length <= 30
    dateOfBirth:
      type: Date
      optional: true
    observations:
      type: String
      optional: true
      validation: (x) -> x.length <= 500
  updateProfile: ->
    console.log 'updateProfile()'
    Meteor.call 'updateProfile', {name:@name, surname:@surname, surname2:@surname2}

class @Permission extends sb.Model
  @schema:
    permissionId:
      type: String
    read:
      type: Boolean
    write:
      type: Boolean
  updatePermission: -> Meteor.call 'updatePermission', @permissionId, @read, @write
  removePermission: -> Meteor.call 'removePermission', @permissionId
