class Campaign < ApplicationRecord
  belongs_to :gaming_group
  belongs_to :game_system

  belongs_to :game_master, optional: true, class_name: :User
  belongs_to :world, optional: true

  has_many :characters, dependent: :nullify

  validates :name, presence: true

  def player_characters
    characters.where.not(controlled_by: nil).are_active
  end

  def player_users
    characters.includes(:controlled_by).map { _1.controlled_by }.uniq
  end

  def all_users
    player_users + [game_master]
  end

  def to_s = name
end
