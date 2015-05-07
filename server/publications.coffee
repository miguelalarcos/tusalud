Meteor.publish 'myHistory', ->
  Notes.find patientId: this.userId

Meteor.publish 'history', (patientId) ->
  perm = Permissions.findOne({doctorId: this.userId, patientId:patientId})
  if perm and perm.read
    Notes.find patientId: patientId
  else
    null

Meteor.publish 'myPermissions', ->
  Permisssions.find patientId: this.userId

Meteor.publish 'userByEmail', (email) ->
  Meteor.users.findOne 'emails.0.address': email

Meteor.publish 'usersByFullName', (fullName) ->
  if fullName
    Meteor.users.find({'profile.fullName': {$regex: '^.*'+query+'.*$'}}, {limit: 50})
  else
    null