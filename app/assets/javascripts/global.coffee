$(document).on "ready page:load", ->
  $("[data-submit]").on "click", (e) ->
    formId = $(this).data("submit")
    $(formId).submit()

  $("body").on "click", "[data-url]", (e) ->
    url = $(this).data("url")
    window.location = url

# $(document).on "page:fetch", ->
  # $("#main").html("<div class='spinner-container'><div class='spinner spinner-primary'></div></div>")
