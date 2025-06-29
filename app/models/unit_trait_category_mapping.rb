class UnitTraitCategoryMapping < ApplicationRecord
  belongs_to :unit_trait_category
  belongs_to :mapped_to, polymorphic: true

  def precedence
    Precedence.label(order)
  end
end

# == Schema Information
#
# Table name: unit_trait_category_mappings
#
#  id                     :uuid             not null, primary key
#  mapped_to_type         :string
#  order                  :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  mapped_to_id           :uuid
#  unit_trait_category_id :uuid             not null
#
# Indexes
#
#  index_unit_trait_category_mappings_on_mapped_to               (mapped_to_type,mapped_to_id)
#  index_unit_trait_category_mappings_on_unit_trait_category_id  (unit_trait_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_trait_category_id => unit_trait_categories.id)
#
