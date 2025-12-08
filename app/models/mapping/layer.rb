class Mapping::Layer < ApplicationRecord
  belongs_to :map
end

# == Schema Information
#
# Table name: mapping_layers
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  map_id     :uuid             not null
#
# Indexes
#
#  index_mapping_layers_on_map_id  (map_id)
#
# Foreign Keys
#
#  fk_rails_...  (map_id => mapping_maps.id)
#
