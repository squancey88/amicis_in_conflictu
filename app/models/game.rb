class Game < ApplicationRecord
  belongs_to :gaming_group, dependent: nil
  belongs_to :game_system, dependent: nil

  has_many :players, dependent: :destroy
end
