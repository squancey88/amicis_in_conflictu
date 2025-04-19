class CharacterSpeciesType < ApplicationRecord
  belongs_to :world

  validates :name, presence: true

  def to_s = name
end
