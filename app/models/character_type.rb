class CharacterType < ApplicationRecord
  belongs_to :world

  validates :name, presence: true, uniqueness: {scope: :world}

  def to_s = name
end

# == Schema Information
#
# Table name: character_types
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
#  index_character_types_on_name_and_world_id  (name,world_id) UNIQUE
#  index_character_types_on_world_id           (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (world_id => worlds.id)
#
