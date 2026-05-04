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

  def call
    content = @form.object.send(@attribute)
    value = if content.instance_of?(String)
      content
    else
      content.to_json
    end

    react_component("TextEditor", {
      label:,
      fieldName: @form.field_name(@attribute),
      minHeight: @min_height,
      initialValue: value,
      searchParams: @search_params
    })
  end
end
