class QuestEventDataController < ApplicationController
  def new_text_section
    helpers.fields QuestEvent.new do |f|
      f.fields_for :quest_event_datum, QuestEventData::TextSection.new, child_index: Time.now.to_i do |ff|
        render turbo_stream: turbo_stream.append(
          "event_details", Quests::Events::Data::Forms::TextSectionComponent.new(form: ff)
        )
      end
    end
  end
end
