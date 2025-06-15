class AddControlledByToCharacter < ActiveRecord::Migration[7.1]
  def change
    change_table :characters do |t|
      t.references :controlled_by, foreign_key: {to_table: :users}, null: true, type: :uuid
      t.references :campaign, null: true, type: :uuid
      t.change_null :born_during_id, true
      t.integer :visibility, default: 0
    end
  end
end
