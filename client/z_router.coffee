Router.plugin 'ensureSignedIn',
  except: ['atSignIn', 'atSignUp', 'atForgotPassword']

AccountsTemplates.configureRoute 'signIn',
  name: 'signin',
  path: '/login',
  template: 'login',
  redirect: '/user-profile'

Router.route '/user-profile',
  name: 'user-profile'
  controller: UserProfileController

Router.route '/history',
  name: 'history'
  controller: HistoryController