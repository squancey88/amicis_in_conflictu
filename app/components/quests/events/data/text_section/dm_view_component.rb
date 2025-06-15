# frozen_string_literal: true

class Quests::Events::Data::TextSection::DmViewComponent < ViewComponent::Base
  def initialize(quest_event_datum:)
    @quest_event_datum = quest_event_datum
  end
end
