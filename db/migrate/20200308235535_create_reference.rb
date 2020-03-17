class CreateReference < ActiveRecord::Migration[6.0]
  def change
    create_table :references do |t|
      t.uuid :uuid, default: 'gen_random_uuid()', null: false

      t.references :text, null: false, foreign_key: true, index: true

      t.string :ref, null: false
      t.integer :rank, null: false

      t.timestamps null: false
    end

    add_index :references, :uuid, unique: true
    add_index :references, [:text_id, :ref], unique: true
    add_index :references, [:text_id, :rank], unique: true
  end
end
