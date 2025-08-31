class Organisation < ApplicationRecord
  include WorldItem

  belongs_to :world
  belongs_to :organisation_type

  validates :name, presence: true

  register_link_search_fields :name
  register_text_section :description, :history

  def link_name = name

  def to_s = name
end

# == Schema Information
#
# Table name: organisations
#
#  id                   :uuid             not null, primary key
#  description          :jsonb
#  history              :jsonb
#  name                 :string
#  world_owner_notes    :jsonb
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  organisation_type_id :uuid             not null
#  world_id             :uuid             not null
#
# Indexes
#
#  index_organisations_on_organisation_type_id  (organisation_type_id)
#  index_organisations_on_world_id              (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (organisation_type_id => organisation_types.id)
#  fk_rails_...  (world_id => worlds.id)
#
