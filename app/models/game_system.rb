class GameSystem < ApplicationRecord
  has_many :games, dependent: nil
  has_many :armies, dependent: :destroy

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true

  store_accessor :game_config, :finish_reasons

  cattr_accessor :has_campaigns

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
    # Optional override if needed
  end

  def calculate_player_score(player) = 0

  def self.category_name
    nil
  end

  def has_campaigns?
    @@has_campaigns || false
  end

  def display_name
    [name, edition].join(" - ")
  end

  def to_s = display_name

  def category
    self.class.category_name
  end

  def game_data_form_components(game)
    []
  end

  def player_form_components
    []
  end
end

# == Schema Information
#
# Table name: game_systems
#
#  id             :uuid             not null, primary key
#  competitive    :boolean
#  edition        :string
#  game_config    :jsonb
#  has_armies     :boolean          default(FALSE)
#  has_army_lists :boolean          default(FALSE)
#  name           :string
#  slug           :string
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_game_systems_on_slug  (slug) UNIQUE
#
