class UserGroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :gaming_group
end
