# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@Initiative =
  addNewLine: ->
    if line = this.inputLine.val().match /^(.+) (\d+)$/
      tr = @trFor line[1], line[2]
      @tbody.append tr
      @sortTable()

      $('.remove', @tbody).on 'click', ->
        $(this).parents('tr').remove()
        false

      @inputLine.val ''

  init: ->
    $('#input-line').keypress (event) =>
      if event.which == 13 # [Enter] key
        event.preventDefault()
        @addNewLine()

    $('#start-combat').on 'click', (event) =>
      $('tr', @tbody).first().addClass('current-turn')
      $(event.target).hide()
      $('#advance-turn').show()
      false

    $('#advance-turn').hide().on 'click', (event) =>
      currentTr = $('tr.current-turn', @tbody)
      nextTr = currentTr.next('tr')
      currentTr.removeClass 'current-turn'

      if nextTr.length != 0
        nextTr.addClass 'current-turn'
      else
        $('tr', @tbody).first().addClass 'current-turn'

      false

  trFor: (name, initiative) ->
    '<tr data-initiative="' + initiative + '">' +
      '<td>' + name + '</td>' +
      '<td>' + initiative + '</td>' +
      '<td><a href="#" class="remove">remove</a></td>' +
    '</tr>'

  sortTable: ->
    trs = $('tr', @tbody)

    sortByInitiative = (a, b) ->
      a = $(a).data('initiative')
      b = $(b).data('initiative')
      (a < b) ? -1 : ((a > b) ? 1 : 0)

    sorted = $(trs.get().sort(sortByInitiative))

    @tbody.html('')
    @tbody.append sorted

jQuery ->
  if location.pathname == "/combat/initiative"
    Initiative.inputLine = $('#input-line')
    Initiative.tbody = $('#characters-list')
    Initiative.init()
