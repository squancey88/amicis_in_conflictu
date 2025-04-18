# frozen_string_literal: true

class WorldItemData::Views::BaseViewComponent < ViewComponent::Base
  delegate :current_user, to: :helpers

  def initialize(world_item)
    @world_item = world_item
    @parent = world_item.relates_to
  end

  def render?
    return true if @parent.world.owner == current_user
    return true if @world_item.visible?
    false
  end
end
