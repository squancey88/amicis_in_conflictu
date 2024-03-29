class GameSystem < ApplicationRecord
  has_many :games, dependent: nil

  validates :name, presence: true
end
