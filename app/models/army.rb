class Army < ApplicationRecord
  belongs_to :game_system
  has_many :army_lists, dependent: :nullify
  has_many :unit_templates, dependent: :nullify

  has_one :parent, class_name: :Army, foreign_key: :parent_id, dependent: :nullify, inverse_of: :children
  has_many :children, class_name: :Army, foreign_key: :parent_id, dependent: :nullify, inverse_of: :parent

  validates :name, presence: true

  def to_s = name
end

# == Schema Information
#
# Table name: armies
#
#  id             :uuid             not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  game_system_id :uuid             not null
#  parent_id      :uuid
#
# Indexes
#
#  index_armies_on_game_system_id  (game_system_id)
#  index_armies_on_parent_id       (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_system_id => game_systems.id)
#  fk_rails_...  (parent_id => armies.id)
#
