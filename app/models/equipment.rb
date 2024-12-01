class Equipment < ApplicationRecord
  belongs_to :game_system
  has_many :equipment_attachments, dependent: :destroy

  validates :name, presence: true
end
