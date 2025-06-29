class UnitTemplateTraitMapping < ApplicationRecord
  belongs_to :unit_template
  belongs_to :unit_trait
end

# == Schema Information
#
# Table name: unit_template_trait_mappings
#
#  id               :uuid             not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  unit_template_id :uuid             not null
#  unit_trait_id    :uuid             not null
#
# Indexes
#
#  index_unit_template_trait_mappings_on_unit_template_id  (unit_template_id)
#  index_unit_template_trait_mappings_on_unit_trait_id     (unit_trait_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_template_id => unit_templates.id)
#  fk_rails_...  (unit_trait_id => unit_traits.id)
#
