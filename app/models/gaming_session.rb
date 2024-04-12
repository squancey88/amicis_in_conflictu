class GamingSession < ApplicationRecord
  belongs_to :gaming_group
  has_many :games, dependent: :destroy

  validates :start_time, presence: true
end
