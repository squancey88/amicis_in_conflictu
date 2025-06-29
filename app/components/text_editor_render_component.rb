# frozen_string_literal: true

class TextEditorRenderComponent < ViewComponent::Base
  def initialize(model:, attribute:)
    json = model.send(attribute)
    if json.present?
      @data = if json.instance_of?(String)
        JSON.parse(json)
      else
        json.as_json
      end
    end
  end

  def render?
    @data&.has_key?("blocks")
  end

  def blocks
    @data["blocks"]
  end

  def render_list(block, type: nil)
    type ||= (block["style"] == "unordered") ? :ul : :ol
    content_tag(type) do
      block["items"].each do
        concat(content_tag(:li, _1["content"]))
        concat(render_list(_1, type:)) if _1["items"].any?
      end
    end
  end
end
