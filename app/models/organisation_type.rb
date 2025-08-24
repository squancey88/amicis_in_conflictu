class OrganisationType < ApplicationRecord
  include WorldEditable

  belongs_to :world

  validates :name, presence: true

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: organisation_types
#
#  id         :uuid             not null, primary key
#  config     :jsonb
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  world_id   :uuid             not null
#
# Indexes
#
#  index_organisation_types_on_world_id  (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (world_id => worlds.id)
#
