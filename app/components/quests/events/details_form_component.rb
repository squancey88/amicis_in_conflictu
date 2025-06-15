# frozen_string_literal: true

class Quests::Events::DetailsFormComponent < ViewComponent::Base
  delegate :bootstrap_button_classes, :turbo_frame_tag, to: :helpers

  def initialize(quest_event:, form:)
    @quest_event = quest_event
    @form = form
  end
end
