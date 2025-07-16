# frozen_string_literal: true

class Forms::ArrayFieldComponent < ViewComponent::Base
  attr_reader :form, :field, :label, :required, :values

  def initialize(form:, field:, label:, required: false)
    @form = form
    @field = field
    @label = label
    @required = required

    @values = form.object.send(field) || []
  end

  def call
    content_tag :div, class: %i[array-field d-flex flex-column gap-2],
      data: {
        controller: "forms-array-controller",
        forms_array_controller_required_value: required
      } do
      concat(
        content_tag(:div, class: %i[d-flex flex-row gap-4 align-items-center mb-3]) do
          concat(content_tag(:div, label))
          concat(button("plus-square", "primary", data: {
            action: "click->forms-array-controller#addNewRow",
            test_id: "forms-array-field-component-add-button"
          }))
        end
      )

      concat(content_tag(:div, class: %i[d-flex flex-column gap-1], data: {
        forms_array_controller_target: "fieldsWrapper"
      }) do
        concat(field_row("", disabled: true)) if required && values.empty?
        values.each do
          concat(field_row(_1))
        end
      end)

      concat(content_tag(:template, data: {
        forms_array_controller_target: "rowTemplate"
      }) do
        field_row("")
      end)
    end
  end

  def field_row(value, disabled: false)
    content_tag :div, class: %i[d-flex flex-row gap-4 field-row],
      data: {
        forms_array_controller_target: "field"
      } do
      concat(form.text_field("#{field}][", value:, class: %i[form-control], required:))
      concat(button("x-square", "danger", data: {
        action: "click->forms-array-controller#removeRow",
        test_id: "forms-array-field-component-remove-button"
      }, disabled:))
    end
  end

  def button(icon, color, disabled: false, data: {})
    content_tag(:button, class: "btn btn-#{color} btn-sm", type: :button, data:, disabled:) do
      content_tag :i, "", class: "bi bi-#{icon}"
    end
  end
end
