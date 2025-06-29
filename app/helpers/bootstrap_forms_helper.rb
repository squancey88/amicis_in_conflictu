module BootstrapFormsHelper
  def bootstrap_text_form(form, attr, label: nil, placeholder: nil, margin_bottom: 3, required: false)
    label = label.presence || attr.to_s.humanize
    placeholder = placeholder.presence || label
    bootstrap_field_wrapper(form, attr,
      form.text_field(attr, class: "form-control", placeholder:, required:),
      label:, margin_bottom:)
  end
  alias_method :bootstrap_text_field, :bootstrap_text_form

  def bootstrap_number_form(form, attr, label: nil, placeholder: nil, margin_bottom: 3, min: nil, max: nil,
    required: false)
    label = label.presence || attr.to_s.humanize
    placeholder = placeholder.presence || label
    bootstrap_field_wrapper(form, attr,
      form.number_field(attr, class: "form-control", placeholder:, min:, max:, required:),
      label:, margin_bottom:)
  end
  alias_method :bootstrap_number_field, :bootstrap_number_form

  def bootstrap_field_wrapper(form, attr, field, label: nil, label_class: nil, margin_bottom: 3)
    content_tag :div, class: ["form-floating", "mb-#{margin_bottom}"] do
      concat(field)
      concat(form.label(attr, label, class: label_class))
    end
  end

  def bootstrap_check_box(form, attr, label: nil, margin_bottom: 0, value: nil)
    label = label.presence || attr.to_s.humanize
    options = {
      class: "form-check-input"
    }
    if value.present? && value
      options[:checked] = true
    end
    content_tag :div, class: ["form-check", "mb-#{margin_bottom}"] do
      concat(form.check_box(attr, options))
      concat(form.label(attr, label, class: "form-check-label"))
    end
  end
end
