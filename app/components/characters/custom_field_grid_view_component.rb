# frozen_string_literal: true

class Characters::CustomFieldGridViewComponent < ViewComponent::Base
  attr_reader :character

  def initialize(character:)
    @character = character
  end

  def field_box(option)
    content_tag :div, class: "custom-field d-flex gap-2" do
      concat(content_tag(:div, option["name"], class: "custom-field__label fw-bold"))
      concat(content_tag(:div, display_value(option), class: "custom-field__value"))
    end
  end

  def display_value(option)
    value = character.config[option["key"]]
    return "---" if value.nil?

    case option["type"]
    when "string", "number"
      value
    when "array"
      value.join(", ")
    when "boolean"
      value ? "Yes" : "No"
    end
  end

  def render?
    (character.world.character_config.present? && character.world.character_config["custom_fields"]&.any?) ||
      character.character_type.config["custom_fields"]&.any?
  end
end
