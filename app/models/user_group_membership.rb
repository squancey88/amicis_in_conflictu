class UserGroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :gaming_group

  validates :user, uniqueness: {scope: :gaming_group}
end

# == Schema Information
#
# Table name: user_group_memberships
#
#  id              :uuid             not null, primary key
#  owner           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gaming_group_id :uuid             not null
#  user_id         :uuid             not null
#
# Indexes
#
#  index_user_group_memberships_on_gaming_group_id              (gaming_group_id)
#  index_user_group_memberships_on_user_id                      (user_id)
#  index_user_group_memberships_on_user_id_and_gaming_group_id  (user_id,gaming_group_id) UNIQUE
#
