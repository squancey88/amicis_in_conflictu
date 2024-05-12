class Player < ApplicationRecord
  belongs_to :game
  belongs_to :controller, polymorphic: true
  has_many :player_armies, dependent: :destroy
  has_many :armies, through: :player_armies, dependent: nil

  accepts_nested_attributes_for :player_armies, allow_destroy: true

  delegate :display_name, to: :controller

  store_accessor :game_data, :turns

  after_create(:setup_game_data)

  def setup_game_data
    self.game_data = game.game_system.setup_player_data
    save!
  end

  def user_is_player?(user)
    if controller_type == "User"
      controller_id == user.id
    else
      controller.users.include?(user)
    end
  end

  def score_by_keys
    system = game.game_system
    score_hash = {}
    if system.has_turns?
      system.scoring_keys.each_with_object(score_hash) { |key, hash| hash[key.to_sym] = 0 }
      turns.each do |turn|
        score_hash.keys.each do |key|
          score_hash[key] = score_hash[key] + turn[key.to_s].to_i
        end
      end
    end
    score_hash
  end

  def calculate_score
    score = 0
    system = game.game_system
    if system.has_turns?
      scoring_keys = system.scoring_keys
      turns.each do |turn|
        scoring_keys.each do |key|
          score += turn[key].to_i
        end
      end
    end
    score
  end
end
