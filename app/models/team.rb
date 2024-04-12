class Team < ApplicationRecord
  belongs_to :gaming_group
  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members
  has_many :players, as: :controller, dependent: :destroy

  validates :name, presence: true

  def display_name
    name
  end
end
