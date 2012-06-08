# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@Initiative =
  # Initializes all necessary parts of the initiative page.
  init: ->
    @initInputLineField()
    @initStartCombatButton()
    @initAdvanceTurnButton()

  # Initializes input field to add initiative rolls to the initiative table.
  initInputLineField: ->
    $('#input-line').keypress (event) =>
      if event.which == 13 # [Enter] key
        event.preventDefault()
        @addNewLine()

  # Initializes the "Start" button to begin combat and turn keeping.
  initStartCombatButton: ->
    $('#start-combat').on 'click', (event) =>
      $('tr', @tbody).first().addClass('current-turn')
      $(event.target).hide()
      $('#advance-turn').show()
      false

  # Initializes the "Next!" button to advance the turn on the initiative table.
  initAdvanceTurnButton: ->
    $('#advance-turn').hide().on 'click', (event) =>
      currentTr = $('tr.current-turn', @tbody)
      nextTr = currentTr.next('tr')
      currentTr.removeClass 'current-turn'

      if nextTr.length != 0
        nextTr.addClass 'current-turn'
      else
        $('tr', @tbody).first().addClass 'current-turn'

      false

  # Used to add ready-made initiatives.
  addInitiatives: (initiatives) ->
    for line in initiatives
      @addNewLine line

  # Adds a new line into the initiative table.
  addNewLine: (inputLine) ->
    inputLine ||= this.inputLine.val()

    if line = inputLine.match /^(.+) (\d+)$/
      tr = @trFor line[1], line[2]
      @tbody.append tr
      @sortTable()

      $('.remove', @tbody).on 'click', ->
        $(this).parents('tr').remove()
        false

      @inputLine.val ''

  # Prepares an HTML TR element given a name and initiative.
  trFor: (name, initiative) ->
    '<tr data-initiative="' + initiative + '">' +
      '<td>' + name + '</td>' +
      '<td>' + initiative + '</td>' +
      '<td><a href="#" class="remove">remove</a></td>' +
    '</tr>'

  # Sorts the initiative table.
  sortTable: ->
    trs = $('tr', @tbody)

    sortByInitiative = (a, b) ->
      $(b).data('initiative') - $(a).data('initiative')

    sorted = $(trs.get().sort(sortByInitiative))

    @tbody.html('')
    @tbody.append sorted

jQuery ->
  if location.pathname == "/combat/initiative"
    Initiative.inputLine = $('#input-line')
    Initiative.tbody = $('#characters-list')
    Initiative.init()
