class Army < ApplicationRecord
  belongs_to :game_system
  has_many :army_lists, dependent: :nullify
  has_many :unit_templates, dependent: :nullify

  has_one :parent, class_name: :Army, dependent: :nullify, inverse_of: :children
  has_many :children, class_name: :Army, dependent: :nullify

  validates :name, presence: true
end
