class GamingSession < ApplicationRecord
  belongs_to :gaming_group

  validates :start_time, presence: true
end
