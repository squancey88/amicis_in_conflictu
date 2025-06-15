class QuestEventDatum < ApplicationRecord
  belongs_to :quest_event

  def to_s = title
end
