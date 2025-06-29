class Team < ApplicationRecord
  belongs_to :gaming_group
  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members
  has_many :players, as: :controller, dependent: :destroy

  has_many :team_players, foreign_key: "controller_id", inverse_of: :team, dependent: nil

  validates :name, presence: true

  def display_name
    name
  end
end

# == Schema Information
#
# Table name: teams
#
#  id              :uuid             not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gaming_group_id :uuid             not null
#
# Indexes
#
#  index_teams_on_gaming_group_id  (gaming_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (gaming_group_id => gaming_groups.id)
#
