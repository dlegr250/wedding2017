module ApplicationHelper
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

  def bottom_error_messages_helper(object, attribute)
    if object.try(:errors)[attribute].any?
      content_tag :div, class: "error-messages" do
        object.errors[attribute].join(", ").capitalize
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

  # Create ZMDI icon
  # <i class="icon zmdi zmdi-{NAME} [zmdi-hc-fw zmdi-hc-lg]"></i>
  def icon(name, options = {})
    class_names = ["icon", "zmdi", "zmdi-#{name}"]

    class_names << "zmdi-hc-fw" if options.fetch(:fixed_width, false)
    class_names << "zmdi-hc-#{options.fetch(:size)}" if options.fetch(:size, nil)

    content_tag(:i, nil, class: class_names.join(" ")).html_safe
  end
end
