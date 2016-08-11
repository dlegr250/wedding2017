$(document).on "ready page:load", ->
  $("[data-submit]").on "click", (e) ->
    formId = $(this).data("submit")
    $(formId).submit()

  $("body").on "click", "[data-link]", (e) ->
    $link = $(this)
    url = $link.data("link")
    Turbolinks.visit(url)

  # Highlight mailing forms when the value changes before submitting
  # $("body").on "keydown", ".mailing-address-form textarea", (event) ->
  #   $input = $(event.target)
  #   $input.addClass("dirty")

  # Autosubmit changed mailing address forms
  $("body").on "blur", ".mailing-address-form textarea.dirty", (e) ->
    $field = $(this)
    $field.removeClass("dirty").addClass("disabled")
    $field.parents("form").submit()

# $(document).on "page:fetch", ->
  # $("#main").html("<div class='spinner-container'><div class='spinner spinner-primary'></div></div>")
