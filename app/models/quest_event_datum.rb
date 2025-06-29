class QuestEventDatum < ApplicationRecord
  belongs_to :quest_event

  def to_s = title
end

# == Schema Information
#
# Table name: quest_event_data
#
#  id             :uuid             not null, primary key
#  data           :jsonb
#  order          :integer
#  title          :string
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  quest_event_id :uuid             not null
#
# Indexes
#
#  index_quest_event_data_on_quest_event_id  (quest_event_id)
#
# Foreign Keys
#
#  fk_rails_...  (quest_event_id => quest_events.id)
#
