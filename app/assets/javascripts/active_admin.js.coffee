#= require active_admin/base
$('#loader-div').hide()
$(window).on 'load', ->
  $('button').addClass 'show-loader'
  $('a').addClass 'show-loader'
  $('.remove-loader').removeClass 'show-loader'
  $('.show-loader').on 'click', ->
    $('#loader-div').show()
    return
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
  return
$(window).bind 'load', ->
  $('#loader-div').hide()
  return
