#======================================================================
# See: http://nithinbekal.com/posts/rails-presenters
#======================================================================
class BasePresenter < SimpleDelegator
  def initialize(object, view)
    @object = object
    @view = view
    super(@object)
  end

  def h
    @view
  end

  private

  def capitalize(value)
    value.to_s.capitalize
  end

  def italics(value)
    h.content_tag :em, value, class: "color-helper"
  end

  def format_currency(value)
    h.number_to_currency value
  end

  def format_phone_number(value)
    h.number_to_phone value, area_code: true
  end

  def boolean_value(value)
    value == true ? "Yes" : "No"
  end

  def format_date_my(date)
    h.local_date date, "%m/%Y"
  end

  def format_date_mdy(date)
    h.local_date date, "%m/%d/%Y"
  end
end
