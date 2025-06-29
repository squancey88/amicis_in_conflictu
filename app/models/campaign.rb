class Campaign < ApplicationRecord
  belongs_to :gaming_group
  belongs_to :game_system

  belongs_to :game_master, optional: true, class_name: :User
  belongs_to :world, optional: true

  has_many :characters, dependent: :nullify

  validates :name, presence: true

  def player_characters
    characters.where.not(controlled_by: nil).are_active
  end

  def player_users
    characters.includes(:controlled_by).map { _1.controlled_by }.uniq
  end

  def all_users
    player_users + [game_master]
  end

  def to_s = name
end

# == Schema Information
#
# Table name: campaigns
#
#  id              :uuid             not null, primary key
#  config          :jsonb
#  list_start_cost :integer
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  game_master_id  :uuid
#  game_system_id  :uuid             not null
#  gaming_group_id :uuid             not null
#  world_id        :uuid
#
# Indexes
#
#  index_campaigns_on_game_master_id   (game_master_id)
#  index_campaigns_on_game_system_id   (game_system_id)
#  index_campaigns_on_gaming_group_id  (gaming_group_id)
#  index_campaigns_on_world_id         (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_master_id => users.id)
#  fk_rails_...  (game_system_id => game_systems.id)
#  fk_rails_...  (gaming_group_id => gaming_groups.id)
#
