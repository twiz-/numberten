# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$("#schedule-link").click ->
	  link = $(this)
	  $(".show-cal").slideToggle "fast", ->
	    if $(this).is(":visible")
	      link.text "Nevermind."
	    else
	      link.text "Schedule text for later?"