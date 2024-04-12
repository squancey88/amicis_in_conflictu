class Game < ApplicationRecord
  belongs_to :gaming_session, dependent: nil
  belongs_to :game_system, dependent: nil

  has_many :players, dependent: :destroy

  validates :players, presence: true

  accepts_nested_attributes_for :players

  def setup_data
    self.data = gaming_system.setup_game_data
    save!
  end
end
