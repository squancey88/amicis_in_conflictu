class GameQuestEvent < ApplicationRecord
  belongs_to :game
  belongs_to :quest_event

  store_accessor :data, :notes

  delegate :title, to: :quest_event

  validates :game, uniqueness: {scope: :quest_event}
end
