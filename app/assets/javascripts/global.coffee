$(document).on "ready page:load", ->
  $("[data-submit]").on "click", (e) ->
    formId = $(this).data("submit")
    $(formId).submit()

  $("body").on "click", "[data-url]", (e) ->
    url = $(this).data("url")
    window.location = url

  # $("body").on "hover", "[data-url]", (e) (->
  #   $(this).addClass("hover")
  # ), ->
  #   $(this).removeClass("hover")

  # $("body").on "mouseenter", "[data-url]", (e) ->
  #   console.log e.target
  #   $(this).addClass("hover")
  #
  # $("body").on "mouseleave", "[data-url]", (e) ->
  #   $(this).removeClass("hover")
