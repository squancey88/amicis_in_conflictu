class UnitTraitMapping < ApplicationRecord
  belongs_to :unit
  belongs_to :unit_trait
end

# == Schema Information
#
# Table name: unit_trait_mappings
#
#  id            :uuid             not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  unit_id       :uuid             not null
#  unit_trait_id :uuid             not null
#
# Indexes
#
#  index_unit_trait_mappings_on_unit_id        (unit_id)
#  index_unit_trait_mappings_on_unit_trait_id  (unit_trait_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_id => units.id)
#  fk_rails_...  (unit_trait_id => unit_traits.id)
#
