 # app/assets/javascripts/components/record_form.js.coffee

 @RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    amount: ''

  valid: ->
    @state.title && @state.date && @state.amount

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { record: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.div
      className: 'col-md-offset-3'
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.label
            className: 'sr-only'
            htmlFor: 'date'
            'Date'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Date'
            id: 'date'
            name: 'date'
            value: @state.date
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label
            className: 'sr-only'
            htmlFor: 'title'
            'Title'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Title'
            id: 'title'
            name: 'title'
            value: @state.title
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label
            className: 'sr-only'
            htmlFor: 'amount'
            'Amount'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Amount'
            id: 'amount'
            name: 'amount'
            value: @state.amount
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create record'
