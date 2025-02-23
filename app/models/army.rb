class Army < ApplicationRecord
  belongs_to :game_system
  has_many :army_lists, dependent: :nullify
  has_many :unit_templates, dependent: :nullify

  has_one :parent, class_name: :Army, foreign_key: :parent_id, dependent: :nullify, inverse_of: :children
  has_many :children, class_name: :Army, foreign_key: :parent_id, dependent: :nullify, inverse_of: :parent

  validates :name, presence: true

  def to_s = name
end
