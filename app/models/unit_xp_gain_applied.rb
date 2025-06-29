class UnitXpGainApplied < ApplicationRecord
  belongs_to :game
  belongs_to :unit
  belongs_to :unit_xp_gain_event
end

# == Schema Information
#
# Table name: unit_xp_gain_applieds
#
#  id                    :uuid             not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  game_id               :uuid             not null
#  unit_id               :uuid             not null
#  unit_xp_gain_event_id :uuid             not null
#
# Indexes
#
#  index_unit_xp_gain_applieds_on_game_id                (game_id)
#  index_unit_xp_gain_applieds_on_unit_id                (unit_id)
#  index_unit_xp_gain_applieds_on_unit_xp_gain_event_id  (unit_xp_gain_event_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (unit_id => units.id)
#  fk_rails_...  (unit_xp_gain_event_id => unit_xp_gain_events.id)
#
