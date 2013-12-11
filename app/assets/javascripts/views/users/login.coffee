class Skirace.Views.Users.Login extends Backbone.View
  
  template: JST['users/login']

  loginForm: '#login-from'
  el: $ '.application-container'

  events:
    'click #login' : 'login'
    'click .login-close' : 'loginClose'

  initialize: ->
    @user = new Skirace.Models.User()
    @render()

  render: ->
    $(@el).append @template 

  loginClose: ->
    $('.login-modal').remove()
    window.location.href = '/'

  login: ->
    username = $('#username').val()
    password = $('#password').val()
    @user.login(username, password)