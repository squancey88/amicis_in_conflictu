class Character < ApplicationRecord
  belongs_to :world
  belongs_to :born_during, class_name: :TimePeriod
  belongs_to :character_type
  belongs_to :character_species_type

  validates :given_name, presence: true
end
