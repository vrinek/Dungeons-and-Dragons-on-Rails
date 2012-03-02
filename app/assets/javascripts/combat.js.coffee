# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Initiative =
    inputLine: $('#input-line')

    addNewLine: ->
      if line = this.inputLine.val().match /^(.+) (\d+)$/
        tr = this.trFor line[1], line[2]
        $('#characters-list').append tr
        $('#characters-list .remove').last().on 'click', ->
          $(this).parents('tr').remove()

        this.inputLine.val ''

    init: ->
      that = this

      $('#input-line').keypress (event) ->
        if event.which == 13
          event.preventDefault()
          that.addNewLine()

    trFor: (name, initiative) ->
      '<tr data-initiative="' + initiative + '">' +
        '<td>' + name + '</td>' +
        '<td>' + initiative + '</td>' +
        '<td><a href="#" class="remove">remove</a></td>' +
      '</tr>'

  if location.pathname == "/combat/initiative"
    Initiative.init()
