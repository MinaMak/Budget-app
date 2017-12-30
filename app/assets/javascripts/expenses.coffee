# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('body').on 'change', '#category', ->
    if $(this).val() != '0'
      window.location = '/expenses?category_id='+$(this).val()
    else
      window.location = '/expenses'