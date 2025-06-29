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

# == Schema Information
#
# Table name: gaming_sessions
#
#  id              :uuid             not null, primary key
#  notes           :jsonb
#  start_time      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gaming_group_id :uuid             not null
#
# Indexes
#
#  index_gaming_sessions_on_gaming_group_id  (gaming_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (gaming_group_id => gaming_groups.id)
#
