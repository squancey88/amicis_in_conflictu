class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :name
      t.references :gaming_group, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
