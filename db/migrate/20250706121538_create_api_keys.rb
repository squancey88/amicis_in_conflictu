class CreateApiKeys < ActiveRecord::Migration[7.1]
  def change
    create_table :api_keys, id: :uuid do |t|
      t.string :key, null: false
      t.references :created_by, null: false, foreign_key: {to_table: :users}, type: :uuid
      t.integer :expires_in_days, default: 31

      t.timestamps
    end
  end
end
