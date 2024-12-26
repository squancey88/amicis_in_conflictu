class CreateWorlds < ActiveRecord::Migration[7.1]
  def change
    create_table :worlds, id: :uuid do |t|
      t.string :name
      t.string :blurb
      t.jsonb :time_period_config
      t.references :owner, null: false, foreign_key: {to_table: :users}, type: :uuid

      t.timestamps
    end
  end
end
