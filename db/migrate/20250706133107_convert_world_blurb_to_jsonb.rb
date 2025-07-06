class ConvertWorldBlurbToJsonb < ActiveRecord::Migration[7.1]
  def change
    change_table :worlds, bulk: true do |t|
      t.remove :blurb, type: :string
      t.jsonb :blurb, default: {}
    end
  end
end
