class Character < ApplicationRecord
  include Rails.application.routes.url_helpers
  include WorldItem
  include WorldVisibility
  include TextLinkable
  include Activatable

  register_link_search_fields :given_name, :family_name

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

  def link_name = full_name

  def link_path = character_path(self)

  def to_s = full_name
end
