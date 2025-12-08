# frozen_string_literal: true

class Mapping::Map::EditorComponent < ViewComponent::Base
  delegate :bs_icon_button, to: :helpers

  def initialize(map:)
    @map = map
  end
end
