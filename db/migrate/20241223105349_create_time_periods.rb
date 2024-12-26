class CreateTimePeriods < ActiveRecord::Migration[7.1]
  def change
    create_table :time_periods, id: :uuid do |t|
      t.integer :order
      t.references :world, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.jsonb :description

      t.timestamps
    end
  end
end
