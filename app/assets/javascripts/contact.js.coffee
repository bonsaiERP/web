class @Contact
  errors:
    name: ''
    email: ''
    query: ''
  constructor: ->
    @$name = $('#contact_name')
    @$email = $('#contact_email')
    @$query = $('#contact_query')

    @$form = $('#contact-form')

    @setEvents()

  setEvents: ->
    self = this
    @$form.on 'submit', (event) ->
      event.preventDefault()
      self.cleanErrors()

      if self.valid()
        self.sendData()
      else
        self.setErrors()

  # valid
  valid: ->
    t = @validName()
    t = @validEmail() and t
    t = @validQuery() and t

    t

  validName: ->
    @errors.name = 'Ingrese un nombre con al menos 4 caracteres'  if @$name.val().trim().length < 4

    @errors.name is ''

  validEmail: ->
    @errors.email = 'Ingrese un email válido'  unless @validateEmail(@$email.val())

    @errors.email is ''

  validQuery: ->
    @errors.query = 'Debe ingresar una consulta válida de al menos 10 caracteres'  if @$query.val().trim().length < 10

    @errors.query is ''

  sendData: ->
    self = this
    $.post(@$form.attr('action'), @data(), (resp) ->
      if resp.success
        self.$form.hide()
        $p =$('<p class="success" style="display:none">Muchas gracias le responderemos pronto.</p>')
        self.$form.before($p)
        $p.show(400)
    )

  validateEmail: (email) ->
    re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

    re.test(email)

  data: ->
    {
      authenticity_token: @$form.find('[name="authenticity_token"]').val()
      contact:
        name: @$name.val()
        email: @$email.val()
        query: @$query.val()
    }

  setErrors: ->
    for k, v of @errors
      sel = ".#{k}"
      if @errors[k] isnt ''
        $(sel).addClass('error')
        .append("<div class='error-message'>#{v}</div>")


  cleanErrors: ->
    @$form.find('.error-message').remove()

    for k, v of @errors
      @errors[k] = ''
      sel = ".#{k}"
      $(sel).removeClass('error')
