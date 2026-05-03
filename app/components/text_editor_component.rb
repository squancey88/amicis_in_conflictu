# frozen_string_literal: true

class TextEditorComponent < ViewComponent::Base
  delegate :react_component, to: :helpers

  def initialize(form:, attribute:, label: nil, save_triggers: nil, hide_label: false, min_height: 200, search_params: {})
    @form = form
    @attribute = attribute
    @label = label
    @save_triggers = save_triggers
    @hide_label = hide_label
    @min_height = min_height
    @search_params = search_params
  end

  def label
    return @label if @label
    @attribute.to_s.humanize
  end

  def data
    {
      controller: :editorjs,
      "editorjs-min-height-value": @min_height
    }.tap do |hash|
      hash[:action] = @save_triggers.map { "editorjs:editorSave->#{_1}" }.join(" ") if @save_triggers
      hash[:editorjs_search_params_value] = @search_params if @search_params.present?
    end
  end

  def call
    content = @form.object.send(@attribute)
    value = if content.instance_of?(String)
      content
    else
      content.to_json
    end

    react_component("TextEditor", {
      label: @label,
      fieldName: @attribute,
      minHeight: @min_height,
      initialValue: value,
      searchParams: @search_params
    })
  end
end
