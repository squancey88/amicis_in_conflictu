class Character < ApplicationRecord
  include WorldItem
  include WorldVisibility

  belongs_to :world
  belongs_to :born_during, class_name: :TimePeriod, optional: true
  belongs_to :character_type
  belongs_to :character_species_type

  belongs_to :controlled_by, class_name: :User, optional: true
  belongs_to :campaign, optional: true

  validates :given_name, presence: true

  connect_world_items "WorldItemData::TextSection", :details

  def full_name
    [given_name, family_name].join(" ")
  end

  def to_s = full_name
end
