Router.plugin 'ensureSignedIn',
  except: ['atSignIn', 'atSignUp', 'atForgotPassword']

AccountsTemplates.configureRoute 'signIn',
  name: 'signin',
  path: '/login',
  template: 'login',
  #layoutTemplate: 'myLayout',
  redirect: '/user-profile'

class @UserProfileController extends RouteController
  #layoutTemplate: 'myLayout'
  template: 'userProfile'
  #waitOn: -> # Meteor.subscribe('post', this.params._id)
  data: -> Meteor.user().profile
  action: -> this.render()

Router.route '/user-profile',
  name: 'user-profile'
  controller: 'UserProfileController'