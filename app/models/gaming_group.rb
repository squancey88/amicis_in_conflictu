class GamingGroup < ApplicationRecord
  has_many :user_group_memberships, dependent: :destroy
  has_many :users, through: :user_group_memberships
  has_many :gaming_sessions, dependent: :destroy

  validates :name, presence: true
end
