class Skirace.Views.Settings.Modal extends Backbone.View
  
  template: JST['settings/modal']

  el: $ '.application-container'

  userForm: '#user-form'

  events:
    'click .modal-close' : 'settingsClose'
    'click #user-add' : 'addUser'
    'click #save-settings' : 'saveSettings'

  initialize: ->
    @collection = new Skirace.Collections.Users()
    @collection.fetch({
      success: (data) ->
        Modal.prototype.render(data.models)
    })  

  render: (users) ->
    $(@el).append @template({users: users, contests: contests()})
    @populateForm()

  settingsClose: ->
    $('.settings-modal').remove()

  addUser: (event) ->
    event.preventDefault()
    params =
      username: $("#username").val()
      password: $("#password").val()
      admin: $("#admin").prop('checked')

    @user = new Skirace.Models.User(params)
    @user.save( {} , 
      success: -> 
        role = if params.admin then "<i class='fa fa-check-circle' />" else ""

        $("#user-table tbody").append("<tr><td>"+params.username+"</td><td>"+role+"</td></tr>")
      error: (model, response, opts) ->
    )
    return

  saveSettings: (event) ->
    $.ajax(
      type: 'POST',
      url: '/settings',
      data: $("#contest-form").serialize(), 
      success: ->
        Modal.prototype.settingsClose();
    )
    event.preventDefault() 
  
  populateForm: ->
    $.ajax(
      type: 'GET',
      url: '/settings',
      success: (data) ->
        $.each JSON.parse(data), (k, v) ->
          element = $('[name='+k+']', $("#contest-form"))
          switch element.attr('type')
          
            when 'text'
              element.val(v);
            when 'checkbox' 
              if v
                
                element.prop('checked', true) 
                
                if k == 'public_contest' 
                  select = $('#public-contest-dropdown-select')
                  select.show()
                  select[0].selectedIndex = v;
                
                else if k == 'multi_contest'
                  $('p#multi-contest').show()
              else 
                element.prop('checked', false)
    )    