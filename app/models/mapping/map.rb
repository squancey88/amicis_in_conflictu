module Mapping
  class Map < ApplicationRecord
    include WorldItem

    validates :name, presence: true

    def to_s = name
  end
end

# == Schema Information
#
# Table name: mapping_maps
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  world_id   :uuid             not null
#
# Indexes
#
#  index_mapping_maps_on_world_id  (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (world_id => worlds.id)
#
