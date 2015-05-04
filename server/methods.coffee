Meteor.methods
  'insertNote': (patientId, text)->
    check patientId, String
    check text, String
    perm = Permissions.findOne({doctorId: this.userId, patientId:patientId})
    if new Note({text:text}).isValid() and perm and perm.write
      now = new Date()
      Notes.insert {authorId: this.userId, patientId:patientId, text: text, insertAt: now, updateAt: now}

  'updateNote': (NoteId, text)->
    check NoteId, String
    check text, String
    authorId = Notes.findOne(NoteId).authorId
    if authorId == this.userId and new Note({text:text}).isValid()
      Notes.update NoteId, {$set: {text: text, updateAt: new Date()}}

  'updateProfile': (profile) ->
    check profile, {name: String, surname: String, surname2: String, dateOfBirth: Date, observations: String}
    if new Profile(profile).isValid()
      profile.fullName = profile.name + ' ' + profile.surname
      if profile.surname2
        profile.fullName = profile.fullName + ' ' + profile.surname2
      Meteor.users.update Meteor.userId, {$set: {profile: profile}}

  'insertPermission': (doctorId) ->
    check doctorId, String
    if not Permissions.findOne({patientId: this.userId, doctorId: doctorId})
      Permissions.insert {patientId: this.userId, doctorId: doctorId}

  'updatePermission': (permissionId, read, write)->
    check permissionId, String
    check read, Boolean
    check write, Boolean
    if Permissions.findOne({patientId: this.userId, _id: permissionId})
      Permissions.update permissionId, {$set: {read:read, write:write}}

  'removePermission': (permissionId)->
    check permissionId, String
    if Permissions.findOne({patientId: this.userId, _id: permissionId})
      Permissions.remove permissionId

  'removeNotification': (notificationId) ->
    Notifications.remove(userId: this.userId, notificationId: notificationId)