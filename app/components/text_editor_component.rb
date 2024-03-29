# frozen_string_literal: true

class TextEditorComponent < ViewComponent::Base
  def initialize(form:, attribute:)
    @form = form
    @attribute = attribute
  end

  def call
    content_tag(:div, class: "text-editor-component mb-3", data: {controller: :editorjs}) do
      concat(content_tag(:div, nil, data: {"editorjs-target": "editor"}))
      concat(@form.hidden_field(@attribute, data: {"editorjs-target": "formField"}))
    end
  end
end
