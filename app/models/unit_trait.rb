class UnitTrait < ApplicationRecord
  include Activatable

  belongs_to :game_system
  belongs_to :army, optional: true
  has_many :unit_trait_mappings, dependent: :destroy
  has_many :unit_trait_category_mappings, dependent: :destroy, foreign_key: :mapped_to_id, inverse_of: :mapped_to
  has_many :unit_trait_categories, through: :unit_trait_category_mappings

  validates :name, presence: true

  accepts_nested_attributes_for :unit_trait_category_mappings, allow_destroy: true

  def to_s = name
end

# == Schema Information
#
# Table name: unit_traits
#
#  id                     :uuid             not null, primary key
#  active                 :boolean
#  description            :string
#  name                   :string
#  rich_description       :jsonb
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  army_id                :uuid
#  game_system_id         :uuid             not null
#  unit_trait_category_id :uuid
#
# Indexes
#
#  index_unit_traits_on_army_id                 (army_id)
#  index_unit_traits_on_game_system_id          (game_system_id)
#  index_unit_traits_on_unit_trait_category_id  (unit_trait_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (army_id => armies.id)
#  fk_rails_...  (game_system_id => game_systems.id)
#  fk_rails_...  (unit_trait_category_id => unit_trait_categories.id)
#
