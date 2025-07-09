class Article < ApplicationRecord
  include WorldItem
  include WorldVisibility
  include TextLinkable
  include HasTextSection

  register_link_search_fields :title

  belongs_to :world

  validates :title, presence: true

  connect_world_items "WorldItemData::TextSection", :sections

  accepts_nested_attributes_for :sections

  def link_name = title

  def to_s = title
end

# == Schema Information
#
# Table name: articles
#
#  id                :uuid             not null, primary key
#  title             :string
#  visibility        :integer          default("gm_only")
#  world_owner_notes :jsonb
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  world_id          :uuid             not null
#
# Indexes
#
#  index_articles_on_world_id  (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (world_id => worlds.id)
#
