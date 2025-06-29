class Player < ApplicationRecord
  belongs_to :game
  belongs_to :controller, polymorphic: true
  has_many :player_armies, dependent: :destroy
  has_many :armies, through: :player_armies, dependent: nil

  belongs_to :user, -> { where(players: {controller_type: "User"}) }, foreign_key: "controller_id",
    inverse_of: :user_players, optional: true

  belongs_to :team, -> { where(players: {controller_type: "Team"}) }, foreign_key: "controller_id",
    inverse_of: :team_players, optional: true

  enum result: {
    not_set: 0,
    lost: 1,
    draw: 2,
    won: 3
  }

  accepts_nested_attributes_for :player_armies, allow_destroy: true

  delegate :display_name, to: :controller

  store_accessor :game_data, :turns

  before_save(:process_player_data)
  before_create(:setup_game_data)

  def setup_game_data
    self.game_data = game.game_system.setup_player_data(game)
  end

  def user_is_player?(user)
    if controller_type == "User"
      controller_id == user.id
    else
      controller.users.include?(user)
    end
  end

  def process_player_data
    game.game_system.update_player_data(self) if game_data
  end

  def score_by_keys
    game.game_system.player_score_by_keys(self)
  end

  def calculate_score
    game.game_system.calculate_player_score(self)
  end
end

# == Schema Information
#
# Table name: players
#
#  id              :uuid             not null, primary key
#  controller_type :string
#  game_data       :jsonb
#  notes           :jsonb
#  result          :integer          default("not_set")
#  surrendered     :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  controller_id   :uuid
#  game_id         :uuid             not null
#
# Indexes
#
#  index_players_on_controller  (controller_type,controller_id)
#  index_players_on_game_id     (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#
