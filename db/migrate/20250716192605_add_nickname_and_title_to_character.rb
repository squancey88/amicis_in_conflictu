class AddNicknameAndTitleToCharacter < ActiveRecord::Migration[7.1]
  def change
    change_table :characters, bulk: true do |t|
      t.string :nickname
      t.string :title
    end
  end
end
