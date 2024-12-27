class TimePeriod < ApplicationRecord
  belongs_to :world

  validates :order, :name, presence: true

  def to_s = name
end
