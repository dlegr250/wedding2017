# #======================================================================
# # Customize when form fields have errors.
# #======================================================================
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
  html_field.children.add_class "invalid"
  html_field.to_s.html_safe
end
