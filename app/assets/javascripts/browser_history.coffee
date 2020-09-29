# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.historyButton').click ->
    $('.historyTable').toggle()
    return

  $('.prevButton').click ->
    current_url_id = $('#browser_history_id')[0].value
    Rails.ajax
      url: '/prev_browser_history?current_url_id='+current_url_id
      type: 'get'
      data: ''
      success: (data) ->
        $('#browser_history_id')[0].value = data.data.id
        $('#browser_history_url')[0].value = data.data.url

  $('.nextButton').click ->
    current_url_id = $('#browser_history_id')[0].value
    Rails.ajax
      url: '/next_browser_history?current_url_id='+current_url_id
      type: 'get'
      data: ''
      success: (data) ->
        $('#browser_history_id')[0].value = data.data.id
        $('#browser_history_url')[0].value = data.data.url
