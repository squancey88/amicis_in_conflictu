module BootstrapFormsHelper
  def bootstrap_text_form(form, attr, placeholder, margin_bottom: 3)
    content_tag :div, class: ["form-floating", "mb-#{margin_bottom}"] do
      concat(form.text_field(attr, class: "form-control", placeholder:))
      concat(form.label(attr))
    end
  end

  def bootstrap_check_box(form, attr, margin_bottom: 0)
    content_tag :div, class: ["form-check", "mb-#{margin_bottom}"] do
      concat(form.check_box(attr, class: "form-check-input"))
      concat(form.label(attr, class: "form-check-label"))
    end
  end
end
