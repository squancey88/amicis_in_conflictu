class LinkUnitTemplateToArmy < ActiveRecord::Migration[7.1]
  def change
    change_table :unit_templates do |t|
      t.references :army, null: true, foreign_key: true, type: :uuid
    end
  end
end
