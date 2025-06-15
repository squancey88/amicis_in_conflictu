class AddUniqueConstraintToSpeciesAndType < ActiveRecord::Migration[7.1]
  def change
    add_index :character_types, [:name, :world_id], unique: true
    add_index :character_species_types, [:name, :world_id], unique: true
  end
end
