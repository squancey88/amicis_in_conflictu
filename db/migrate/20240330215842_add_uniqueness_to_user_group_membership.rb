class AddUniquenessToUserGroupMembership < ActiveRecord::Migration[7.1]
  def change
    add_index :user_group_memberships, [:user_id, :gaming_group_id], unique: true
  end
end
