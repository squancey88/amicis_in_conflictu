class Game < ApplicationRecord
  belongs_to :gaming_session, dependent: nil
  belongs_to :game_system, dependent: nil

  has_many :players, dependent: :destroy

  enum game_state: {not_played: 0, in_progress: 3, finished: 2, cancelled: 1}

  validates :players, presence: true

  accepts_nested_attributes_for :players

  after_create(:setup_data)
  after_save(:check_finished)

  def setup_data
    self.data = game_system.setup_game_data
    save!
  end

  def check_finished
    if finished?
      set_winners
    else
      players.each { |p| p.update_column(:winner, false) }
    end
  end

  def editable?
    finished? || cancelled?
  end

  def set_winners
    if game_system.has_turns?
      by_score = players.map { [_1, _1.calculate_score] }
      winning_score = by_score.max_by { _1[1] }[1]
      by_score.each do |player, score|
        if score == winning_score
          player.winner = true
          player.save!
        end
      end
    end
  end
end
