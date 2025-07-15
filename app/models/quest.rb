class Quest < ApplicationRecord
  include WorldEditable

  belongs_to :world
  belongs_to :created_by, class_name: :User
  has_many :quest_events, dependent: :destroy

  validates :title, presence: true

  def to_s = title
end

# == Schema Information
#
# Table name: quests
#
#  id            :uuid             not null, primary key
#  blurb         :jsonb
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :uuid
#  world_id      :uuid             not null
#
# Indexes
#
#  index_quests_on_created_by_id  (created_by_id)
#  index_quests_on_world_id       (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id)
#  fk_rails_...  (world_id => worlds.id)
#
