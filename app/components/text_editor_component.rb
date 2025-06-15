# frozen_string_literal: true

class TextEditorComponent < ViewComponent::Base
  def initialize(form:, attribute:, label: nil, save_triggers: nil, hide_label: false)
    @form = form
    @attribute = attribute
    @label = label
    @save_triggers = save_triggers
    @hide_label = hide_label
  end

  def label
    return @label if @label
    @attribute.to_s.humanize
  end

  def data
    {
      controller: :editorjs
    }.tap do |hash|
      hash[:action] = @save_triggers.map { "editorjs:editorSave->#{_1}" }.join(" ") if @save_triggers
    end
  end

  def call
    content_tag(:div, class: "text-editor-component") do
      concat(content_tag(:div, label, class: "text-editor-component__label")) unless @hide_label
      concat(content_tag(:div, class: "text-editor-component__content mb-3", data:) do
        concat(content_tag(:div, nil, data: {"editorjs-target": "editor"}))
        concat(@form.hidden_field(@attribute, data: {"editorjs-target": "formField"}))
      end)
    end
  end
end
