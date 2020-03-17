class CreateEdition < ActiveRecord::Migration[6.0]
  def change
    create_table :editions do |t|
      t.uuid :uuid, default: 'gen_random_uuid()', null: false

      t.references :text, null: false, foreign_key: true, index: true

      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end

    add_index :editions, :uuid, unique: true
  end
end
