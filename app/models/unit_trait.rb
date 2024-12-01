class UnitTrait < ApplicationRecord
  include Activatable

  belongs_to :game_system
  belongs_to :army, optional: true
  has_many :unit_trait_mappings, dependent: :destroy

  validates :name, presence: true
end
