class UserGroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :gaming_group

  validates :user, uniqueness: {scope: :gaming_group}
end
