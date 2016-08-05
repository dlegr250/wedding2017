$(document).on "ready page:load", ->
  $("[data-submit]").on "click", (e) ->
    formId = $(this).data("submit")
    $(formId).submit()

  $("body").on "click", "[data-link]", (e) ->
    $link = $(this)
    url = $link.data("link")
    Turbolinks.visit(url)

# $(document).on "page:fetch", ->
  # $("#main").html("<div class='spinner-container'><div class='spinner spinner-primary'></div></div>")
