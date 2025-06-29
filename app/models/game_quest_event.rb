class GameQuestEvent < ApplicationRecord
  belongs_to :game
  belongs_to :quest_event

  store_accessor :data, :notes

  delegate :title, to: :quest_event

  validates :game, uniqueness: {scope: :quest_event}
end

# == Schema Information
#
# Table name: game_quest_events
#
#  id             :uuid             not null, primary key
#  data           :jsonb
#  ended_at       :datetime
#  started_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  game_id        :uuid             not null
#  quest_event_id :uuid             not null
#
# Indexes
#
#  index_game_quest_events_on_game_id                     (game_id)
#  index_game_quest_events_on_game_id_and_quest_event_id  (game_id,quest_event_id) UNIQUE
#  index_game_quest_events_on_quest_event_id              (quest_event_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (quest_event_id => quest_events.id)
#
