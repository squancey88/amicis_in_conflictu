class UnitXpGainEvent < ApplicationRecord
  include Activatable

  belongs_to :game_system

  validates :name, :xp_gain, presence: true

  def to_s = name
end

# == Schema Information
#
# Table name: unit_xp_gain_events
#
#  id             :uuid             not null, primary key
#  active         :boolean
#  description    :jsonb
#  name           :string
#  xp_gain        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  game_system_id :uuid             not null
#
# Indexes
#
#  index_unit_xp_gain_events_on_game_system_id  (game_system_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_system_id => game_systems.id)
#
