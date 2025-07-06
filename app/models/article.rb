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

  def link_path = world_article_path(world, self)

  def to_s = title
end

# == Schema Information
#
# Table name: articles
#
#  id         :uuid             not null, primary key
#  title      :string
#  visibility :integer          default("gm_only")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  world_id   :uuid             not null
#
# Indexes
#
#  index_articles_on_world_id  (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (world_id => worlds.id)
#
