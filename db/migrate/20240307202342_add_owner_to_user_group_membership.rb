class AddOwnerToUserGroupMembership < ActiveRecord::Migration[7.1]
  def change
    add_column :user_group_memberships, :owner, :boolean, default: false
  end
end
