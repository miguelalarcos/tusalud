class @HistoryController extends RouteController
  template: 'history'
  waitOn: -> [
    Meteor.subscribe('userByEmail', emailQuery.get('email-history')),
    Meteor.subscribe('usersByFullName', fullNameQuery.get('fullName-history')) ]
  data: ->
    dataByEmail: -> Meteor.users.find('emails.0.address': emailQuery.get('email-history'))
    dataByFullName: ->
      fullName = fullNameQuery.get('fullName-history')
      if fullName
        Meteor.users.find('profile.fullName': {$regex: '^.*'+ fullName +'.*$'})
      else
        []

@historyCallBack = (_id) ->
  console.log _id

