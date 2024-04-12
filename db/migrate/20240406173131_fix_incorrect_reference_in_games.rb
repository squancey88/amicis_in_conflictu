class FixIncorrectReferenceInGames < ActiveRecord::Migration[7.1]
  def change
    change_table(:games, bulk: true) do |t|
      t.references :gaming_session, null: false, foreign_key: true, type: :uuid
      t.remove_references :gaming_group
    end
  end
end
