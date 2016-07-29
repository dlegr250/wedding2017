$(document).on "ready page:load", ->
  $("[data-submit]").on "click", (e) ->
    formId = $(this).data("submit")
    $(formId).submit()
