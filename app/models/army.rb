class Army < ApplicationRecord
  belongs_to :game_system
  belongs_to :user
  has_many :army_lists, dependent: :destroy
end
