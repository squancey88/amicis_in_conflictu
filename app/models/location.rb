class Location < ApplicationRecord
  include WorldItem

  belongs_to :located_in, class_name: :Location, inverse_of: :locations, optional: true
  belongs_to :world
  belongs_to :location_type

  has_many :locations, inverse_of: :located_in, dependent: :destroy

  validates :name, presence: true

  register_link_search_fields :name
  register_text_section :description, :history

  def link_name = name

  def to_s = name
end

# == Schema Information
#
# Table name: locations
#
#  id                :uuid             not null, primary key
#  description       :jsonb
#  history           :jsonb
#  name              :string
#  world_owner_notes :jsonb
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  located_in_id     :uuid
#  location_type_id  :uuid             not null
#  world_id          :uuid             not null
#
# Indexes
#
#  index_locations_on_located_in_id     (located_in_id)
#  index_locations_on_location_type_id  (location_type_id)
#  index_locations_on_world_id          (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (located_in_id => locations.id)
#  fk_rails_...  (location_type_id => location_types.id)
#  fk_rails_...  (world_id => worlds.id)
#
