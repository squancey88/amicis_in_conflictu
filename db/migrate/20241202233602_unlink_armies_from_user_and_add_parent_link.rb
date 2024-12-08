class UnlinkArmiesFromUserAndAddParentLink < ActiveRecord::Migration[7.1]
  def change
    change_table :armies do |t|
      t.remove_references :user, null: true, foreign_key: true, type: :uuid
      t.references :parent, null: true, foreign_key: {to_table: :armies}, type: :uuid
    end
  end
end
