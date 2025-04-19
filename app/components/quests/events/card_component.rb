# frozen_string_literal: true

class Quests::Events::CardComponent < ViewComponent::Base
  with_collection_parameter :event

  def initialize(event:)
    @event = event
  end
end
