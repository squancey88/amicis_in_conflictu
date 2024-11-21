class GameSystem < ApplicationRecord
  has_many :games, dependent: nil

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true

  store_accessor :game_config, :finish_reasons

  def setup_game_data
    {}
  end

  def setup_player_data(game)
    {}
  end

  def set_winners(game)
    raise NotImplementedError
  end

  def update_player_data(player)
    raise NotImplementedError
  end

  def calculate_player_score(player) = 0

  def self.category_name
    nil
  end

  def display_name
    [name, edition].join(" - ")
  end

  def to_s = display_name

  def category
    self.class.category_name
  end

  def game_data_form_component(game)
    raise NotImplementedError
  end

  def player_form_components
    []
  end
end
