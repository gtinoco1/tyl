#= require active_admin/base
$('#loader-div').hide()
$(window).on 'load', ->
  $('#loader-div').show()
  $('.download-url').click ->
    a_href = $(this).attr('href')
    $.ajax a_href,
    type: 'GET'
    beforeSend: ->
      $('#loader-div').show()
      return
    success: (data, status, xhr) ->
      $('#loader-div').hide()
  return

$(window).bind 'load', ->
  $('#loader-div').hide()
  return
