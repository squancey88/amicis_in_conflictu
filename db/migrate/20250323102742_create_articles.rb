class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title
      t.references :world, null: false, foreign_key: true, type: :uuid
      t.integer :visibility, default: 0

      t.timestamps
    end
  end
end
