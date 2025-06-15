class GameQuestEvent < ApplicationRecord
  belongs_to :game
  belongs_to :quest_event

  store_accessor :data, :notes

  before_create :set_start_time

  delegate :title, to: :quest_event

  def set_start_time
    self.started_at = DateTime.now if started_at.nil?
  end
end
