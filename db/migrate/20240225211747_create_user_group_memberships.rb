class CreateUserGroupMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :user_group_memberships, id: :uuid do |t|
      t.references :user, type: :uuid, null: false
      t.references :gaming_group, type: :uuid, null: false

      t.timestamps
    end
  end
end
