class QuestEvent < ApplicationRecord
  belongs_to :quest
  has_many :quest_event_datum, dependent: :destroy

  validates :title, presence: true

  accepts_nested_attributes_for :quest_event_datum

  def to_s = title
end

# == Schema Information
#
# Table name: quest_events
#
#  id         :uuid             not null, primary key
#  blurb      :jsonb
#  order      :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quest_id   :uuid             not null
#
# Indexes
#
#  index_quest_events_on_quest_id  (quest_id)
#
# Foreign Keys
#
#  fk_rails_...  (quest_id => quests.id)
#
