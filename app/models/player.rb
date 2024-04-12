class Player < ApplicationRecord
  belongs_to :game
  belongs_to :controller, polymorphic: true

  delegate :display_name, to: :controller

  after_create(:setup_game_data)

  def setup_game_data
    self.game_data = game.game_system.setup_player_data
    save!
  end
end
