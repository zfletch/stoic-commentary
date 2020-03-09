class CreateText < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
      t.uuid :uuid, default: 'gen_random_uuid()', null: false
      t.string :urn, null: false

      t.timestamps null: false
    end

    add_index :texts, :uuid, unique: true
    add_index :texts, :urn, unique: true
  end
end
