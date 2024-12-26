# frozen_string_literal: true

class Layout::WorldBuilderMenuComponent < ViewComponent::Base
  delegate :current_world, to: :helpers

  def initialize(world_building:)
    @world_building = world_building
  end

  def render?
    @world_building
  end
end
