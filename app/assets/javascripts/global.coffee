$(document).on "ready page:load", ->
  $("[data-submit]").on "click", (e) ->
    formId = $(this).data("submit")
    $(formId).submit()

  $("body").on "click", "[data-link]", (e) ->
    $link = $(this)
    url = $link.data("link")
    Turbolinks.visit(url)

  # Autosubmit changed mailing address forms
  $("body").on "blur", ".mailing-address-form textarea.dirty", (e) ->
    $field = $(this)
    $field.removeClass("dirty").addClass("disabled")
    $field.parents("form").submit()
