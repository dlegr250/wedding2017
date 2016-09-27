module ApplicationHelper
  def page_title_helper
    title = (@page_title.present? ? @page_title : controller_name.humanize)
    "#{title} &middot; Dan &amp; Jacqueline Wedding - June 2017".html_safe
  end

  def charset_meta_tag
    tag :meta, name: "charset", content: "utf-8"
  end
  def viewport_meta_tag
    tag :meta, name: "viewport", content: "width=device-width, initial-scale=1"
  end

  def mobile_fullscreen_tags
    tags = []
    tags << tag(:meta, name: "apple-mobile-web-app-capable", content: "yes")
    tags << tag(:meta, name: "mobile-web-app-capable", content: "yes")
    tags.join("\n").html_safe
  end

  # Appbar title
  def title(text)
    content_for(:appbar_title) { text }
  end

  def up_button(url)
    link_to("arrow_back", url, class: "material-icons appbar-button", id: "up-button")
  end

  def bottom_error_messages_helper(object, attribute)
    if object.try(:errors)[attribute].any?
      content_tag :div, class: "error-messages" do
        object.errors[attribute].join(", ")
      end
    end
  end

  # Jan 1, 2000 at 2:30 PM
  def timestamp(datetime)
    return if datetime.blank?
    datetime.strftime("%b %d, %Y at %l:%M %p")
  end

  # Jan 1 - 2:30 PM
  def short_timestamp(datetime)
    return if datetime.blank?
    datetime.strftime("%b %d - %l:%M %p")
  end
end
