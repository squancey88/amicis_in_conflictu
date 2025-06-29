class Equipment < ApplicationRecord
  belongs_to :game_system
  has_many :equipment_attachments, dependent: :destroy

  validates :name, presence: true
end

# == Schema Information
#
# Table name: equipment
#
#  id             :uuid             not null, primary key
#  attach_to_list :boolean
#  attach_to_unit :boolean
#  cost           :integer
#  description    :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  game_system_id :uuid             not null
#
# Indexes
#
#  index_equipment_on_game_system_id  (game_system_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_system_id => game_systems.id)
#
