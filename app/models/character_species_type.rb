class CharacterSpeciesType < ApplicationRecord
  belongs_to :world

  validates :name, presence: true, uniqueness: {scope: :world}

  def to_s = name
end
