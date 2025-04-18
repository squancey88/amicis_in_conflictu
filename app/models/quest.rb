class Quest < ApplicationRecord
  belongs_to :world
  belongs_to :created_by, class_name: :User
  has_many :quest_events, dependent: :destroy

  validates :title, presence: true

  def to_s = title
end
