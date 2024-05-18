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
