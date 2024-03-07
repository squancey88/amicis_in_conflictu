class GamingGroup < ApplicationRecord
  has_many :user_group_memberships, dependent: :destroy
  has_many :users, through: :user_group_memberships

  validates :name, presence: true
end
