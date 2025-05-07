module LayoutHelper
  def labelled_attribute(label, value)
    content_tag :div, class: %w[labelled-attribute d-flex gap-1] do
      concat(content_tag(:div, "#{label}:", class: %w[fw-bold]))
      concat(content_tag(:div, value, class: %w[flex-grow-1]))
    end
  end
end
