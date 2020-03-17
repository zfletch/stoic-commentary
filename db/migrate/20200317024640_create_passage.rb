class CreatePassage < ActiveRecord::Migration[6.0]
  def change
    create_table :passages do |t|
      t.uuid :uuid, default: 'gen_random_uuid()', null: false

      t.references :edition, null: false, foreign_key: true, index: true
      t.references :reference, null: false, foreign_key: true, index: true

      t.text :passage, null: false

      t.timestamps null: false
    end

    add_index :passages, :uuid, unique: true
    add_index :passages, [:edition_id, :reference_id], unique: true
  end
end
