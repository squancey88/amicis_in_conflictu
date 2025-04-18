class Article < ApplicationRecord
  include WorldItem
  include WorldVisibility

  belongs_to :world

  validates :title, presence: true

  connect_world_items "WorldItemData::TextSection", :sections

  accepts_nested_attributes_for :sections

  def to_s = title
end
