class CreateGamingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :gaming_sessions do |t|
      t.datetime :start_time
      t.belongs_to :gaming_group, null: false, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
