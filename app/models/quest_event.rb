class QuestEvent < ApplicationRecord
  belongs_to :quest
  has_many :quest_event_datum, dependent: :destroy

  validates :title, presence: true

  accepts_nested_attributes_for :quest_event_datum

  def to_s = title
end
