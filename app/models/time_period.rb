class TimePeriod < ApplicationRecord
  include WorldEditable

  belongs_to :world

  validates :order, :name, presence: true

  def to_s = name
end

# == Schema Information
#
# Table name: time_periods
#
#  id          :uuid             not null, primary key
#  description :jsonb
#  name        :string
#  order       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  world_id    :uuid             not null
#
# Indexes
#
#  index_time_periods_on_world_id  (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (world_id => worlds.id)
#
