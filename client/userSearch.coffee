@emailQuery = new ReactiveDict()
@fullNameQuery = new ReactiveDict()

Template.userSearch.events
  'click .emailButton': (e,t)->
    el = t.find('input.email')
    id = $(el).attr('id')
    emailQuery.set(id, $(el).val())
  'keyup .fullName': (e,t)->
    el = t.find('input.fullName')
    id = $(el).attr('id')
    fullNameQuery.set(id, $(el).val())

Template.userData.events
  'click a.patient': (e,t)->
    el = $(e.currentTarget())
    window[el.attr('callback')](el.attr('_id'))
