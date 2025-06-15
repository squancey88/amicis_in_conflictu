class AddActiveToCharacter < ActiveRecord::Migration[7.1]
  def change
    change_table :characters do |t|
      t.boolean :active, default: true
    end
  end
end
