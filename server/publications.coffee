Meteor.publish 'myHistory', ->
  Notes.find patientId: this.userId

Meteor.publish 'historyPatient', (patientId) ->
  perm = Permissions.findOne({doctorId: this.userId, patientId:patientId})
  if perm and perm.read
    Notes.find patientId: patientId
  else
    [] # null

Meteor.publish 'myPermissions', ->
  Permisssions.find patientId: this.userId