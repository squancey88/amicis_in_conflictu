class PlayerArmy < ApplicationRecord
  belongs_to :player
  belongs_to :army
  belongs_to :army_list, optional: true
end

# == Schema Information
#
# Table name: player_armies
#
#  id           :uuid             not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  army_id      :uuid             not null
#  army_list_id :uuid
#  player_id    :uuid             not null
#
# Indexes
#
#  index_player_armies_on_army_id       (army_id)
#  index_player_armies_on_army_list_id  (army_list_id)
#  index_player_armies_on_player_id     (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (army_id => armies.id)
#  fk_rails_...  (army_list_id => army_lists.id)
#  fk_rails_...  (player_id => players.id)
#
