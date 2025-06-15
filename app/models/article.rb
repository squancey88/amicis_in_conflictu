class Article < ApplicationRecord
  include Rails.application.routes.url_helpers

  include WorldItem
  include WorldVisibility
  include TextLinkable

  register_link_search_fields :title

  belongs_to :world

  validates :title, presence: true

  connect_world_items "WorldItemData::TextSection", :sections

  accepts_nested_attributes_for :sections

  def link_name = title

  def link_path = article_path(self)

  def to_s = title
end
