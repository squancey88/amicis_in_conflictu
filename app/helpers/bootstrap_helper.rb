module BootstrapHelper
  def bs_link_button(text, url, type: :primary)
    link_to url, text, class: bootstrap_button_classes
  end

  def bootstrap_button_classes(type: :primary)
    ["btn", "btn-#{type}"]
  end
end
