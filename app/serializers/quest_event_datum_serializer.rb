class QuestEventDatumSerializer < BaseSerializer
  def columns
    %i[id order title type]
  end

  def additional_values(item)
    case item
    when QuestEventData::TextSection
      text_section_values(item)
    end
  end

  private

  def text_section_values(item)
    {
      content: item.content
    }
  end
end
