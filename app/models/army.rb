class Army < ApplicationRecord
  belongs_to :game_system
  belongs_to :user
  has_many :army_lists, dependent: :destroy

  def can_have_lists?
    game_system.has_army_lists
  end
end
