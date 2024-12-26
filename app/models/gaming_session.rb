class GamingSession < ApplicationRecord
  belongs_to :gaming_group
  has_many :games, dependent: :destroy

  validates :start_time, presence: true

  scope :upcoming, ->(limit = 5) { where("start_time > ?", Time.zone.today.beginning_of_day).limit(limit) }
  scope :previous, -> { where("start_time <= ?", Time.zone.today.beginning_of_day) }

  def to_s
    I18n.l(start_time) if start_time
  end
end
