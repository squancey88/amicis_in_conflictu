module BootstrapFormsHelper
  def bootstrap_text_form(form, attr, label: nil, placeholder: nil, margin_bottom: 3)
    label = label.presence || attr.to_s.humanize
    placeholder = placeholder.presence || label
    bootstrap_field_wrapper(form, attr,
      form.text_field(attr, class: "form-control", placeholder:),
      label:, margin_bottom:)
  end
  alias_method :bootstrap_text_field, :bootstrap_text_form

  def bootstrap_number_form(form, attr, label: nil, placeholder: nil, margin_bottom: 3, min: nil, max: nil)
    label = label.presence || attr.to_s.humanize
    placeholder = placeholder.presence || label
    bootstrap_field_wrapper(form, attr,
      form.number_field(attr, class: "form-control", placeholder:, min:, max:),
      label:, margin_bottom:)
  end
  alias_method :bootstrap_number_field, :bootstrap_number_form

  def bootstrap_field_wrapper(form, attr, field, label: nil, margin_bottom: 3)
    content_tag :div, class: ["form-floating", "mb-#{margin_bottom}"] do
      concat(field)
      concat(form.label(attr, label))
    end
  end

  def bootstrap_check_box(form, attr, label: nil, margin_bottom: 0)
    label = label.presence || attr.to_s.humanize
    content_tag :div, class: ["form-check", "mb-#{margin_bottom}"] do
      concat(form.check_box(attr, class: "form-check-input"))
      concat(form.label(attr, label, class: "form-check-label"))
    end
  end
end
