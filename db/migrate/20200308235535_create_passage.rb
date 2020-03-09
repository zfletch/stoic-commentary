class CreatePassage < ActiveRecord::Migration[6.0]
  def change
    create_table :passages do |t|
      t.uuid :uuid, default: 'gen_random_uuid()', null: false
      t.string :ref, null: false

      t.references :text, null: false, foreign_key: true, index: true

      t.text :passage, null: false
      t.integer :rank, null: false

      t.timestamps null: false
    end

    add_index :passages, :uuid, unique: true
    add_index :passages, [:text_id, :ref], unique: true
    add_index :passages, [:text_id, :rank], unique: true
  end
end
