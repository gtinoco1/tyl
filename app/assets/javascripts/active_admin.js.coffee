#= require active_admin/base
#= require chartkick

$('#loader-div').hide()
$(window).on 'load', ->
  # search_bar = undefined
  # search_bar = '<input type =\'text\' id =\'search_tag\'/><br/> <button type =\'button\' class =\'search_with_tags remove-loader\'>Search tags</button>'
  # $(search_bar).insertAfter $('.column .panel h3')
  #
  # $('.search_with_tags').on 'click', (e) ->
  #   $search_values = undefined
  #   e.preventDefault()
  #   $search_values = $('#search_tag').val()
  #   console.log $search_values.length
  #   if $search_values.length > 0
  #     window.location.href = '?search_tags=' + $search_values
  #   return





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
