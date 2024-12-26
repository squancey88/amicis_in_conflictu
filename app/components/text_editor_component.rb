# frozen_string_literal: true

class TextEditorComponent < ViewComponent::Base
  def initialize(form:, attribute:, label: nil)
    @form = form
    @attribute = attribute
    @label = label
  end

  def label
    return @label if @label
    @attribute.to_s.humanize
  end

  def call
    content_tag(:div, class: "text-editor-component") do
      concat(content_tag(:div, label, class: "text-editor-component__label"))
      concat(content_tag(:div, class: "text-editor-component__content mb-3", data: {controller: :editorjs}) do
        concat(content_tag(:div, nil, data: {"editorjs-target": "editor"}))
        concat(@form.hidden_field(@attribute, data: {"editorjs-target": "formField"}))
      end)
    end
  end
end
