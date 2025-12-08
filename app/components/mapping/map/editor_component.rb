# frozen_string_literal: true

class Mapping::Map::EditorComponent < ViewComponent::Base
  def initialize(map:)
    @map = map
  end
end
