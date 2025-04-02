class Campaign < ApplicationRecord
  belongs_to :gaming_group
  belongs_to :game_system

  belongs_to :game_master, optional: true, class_name: :User
  belongs_to :world, optional: true

  validates :name, presence: true

  def to_s = name
end
