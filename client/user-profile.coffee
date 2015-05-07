Template.profile.inheritsHooksFrom("sb_basic")

class @UserProfileController extends RouteController
  #layoutTemplate: 'myLayout'
  template: 'userProfile'
  data: ->
    if Meteor.user()
      return modelo: new Profile(Meteor.user().profile or {})

