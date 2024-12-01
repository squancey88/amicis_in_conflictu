class CreateEquipmentAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment_attachments, id: :uuid do |t|
      t.references :equipment, null: false, foreign_key: true, type: :uuid
      t.references :attached_to, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
