class UnitXpGainEvent < ApplicationRecord
  belongs_to :game_system

  validates :name, :xp_gain, presence: true

  def to_s = name
end
