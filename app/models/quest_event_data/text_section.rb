module QuestEventData
  class TextSection < QuestEventDatum
    store_accessor :data, :content

    def dm_view
      Quests::Events::Data::TextSection::DmViewComponent.new(quest_event_datum: self)
    end
  end
end
