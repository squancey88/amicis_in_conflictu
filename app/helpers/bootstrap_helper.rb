module BootstrapHelper
  def bs_link_button(text, url, type: :primary, style: nil)
    link_to text, url, class: bootstrap_button_classes(type:, style:)
  end

  def bs_icon_button(icon:, data:, type: :primary, style: :nil, title: nil)
    content_tag :button, type: :button, class: bootstrap_button_classes(type:, style:),
      data:, title: do
      content_tag :i, "", class: ["bi", "bi-#{icon}"]
    end
  end

  def bs_custom_icon_button(icon:, data:, type: :primary, style: :nil, title: nil)
    content_tag :button, type: :button, class: bootstrap_button_classes(type:, style:),
      data:, title: do
      image_tag("icons/#{icon}.svg", size: 16, alt: "icon: #{icon}")
    end
  end

  def bootstrap_button_classes(type: :primary, style: nil)
    ["btn", ["btn", style, type].compact.join("-")]
  end
end
