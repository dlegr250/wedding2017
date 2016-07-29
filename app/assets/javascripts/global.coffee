$(document).on "ready page:load", ->
  $("[data-submit]").on "click", ->
    formId = $(this).data("submit")
    $(formId).submit()
