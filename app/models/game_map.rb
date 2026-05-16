class GameMap < ApplicationRecord
  TYPES = [:hex_grid, :hex_diamond, :svg]

  belongs_to :owner, class_name: :User

  def to_s = name
end

# == Schema Information
#
# Table name: game_maps
#
#  id         :uuid             not null, primary key
#  config     :jsonb
#  map_type   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :uuid             not null
#
# Indexes
#
#  index_game_maps_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
