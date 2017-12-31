# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('body').on 'change', '#category', ->
    if $(this).val() != '0'
      window.location = '/expenses?category_id=' + $(this).val()
    else
      window.location = '/expenses'

  $('body').on 'change', '#locale', ->
    if $(this).val() == 'en'
      if window.location.href.indexOf('locale=') > 0
        window.location = window.location.href.replace('locale=ar','locale=en')
      else if window.location.href.indexOf('?') > 0
        window.location += '&locale=en'
      else
        window.location += '?locale=en'
    else if $(this).val() == 'ar'
      if window.location.href.indexOf('locale=') > 0
        window.location = window.location.href.replace('locale=en','locale=ar')
      else if window.location.href.indexOf('?') > 0
        window.location += '&locale=ar'
      else
        window.location += '?locale=ar'