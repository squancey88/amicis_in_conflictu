class GameSystem < ApplicationRecord
  has_many :games, dependent: nil

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true

  store_accessor :game_config, :scoring_system, :finish_reasons

  def has_turns?
    false
  end

  def setup_game_data
    {}
  end

  def setup_player_data
    {}
  end

  def self.category_name
    nil
  end

  def display_name
    "#{name} - #{edition}"
  end

  def category
    self.class.category_name
  end
end
