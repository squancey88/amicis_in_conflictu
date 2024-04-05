class GamingGroup < ApplicationRecord
  has_many :user_group_memberships, dependent: :destroy
  has_many :users, through: :user_group_memberships
  has_many :gaming_sessions, dependent: :destroy

  validates :name, presence: true

  def is_user?(user)
    users.find_by(id: user.id).present?
  end

  def owners
    users.joins(:user_group_memberships).where(user_group_memberships: {owner: true})
  end

  def members
    users.joins(:user_group_memberships).where(user_group_memberships: {owner: false})
  end

  def is_owner?(user)
    users.joins(:user_group_memberships).where(user_group_memberships: {owner: true, user:}).any?
  end
end
