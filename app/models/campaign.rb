class Campaign < ApplicationRecord
  belongs_to :gaming_group
  belongs_to :game_system

  validates :name, presence: true

  def to_s = name
end
