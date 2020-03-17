class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.uuid :uuid, default: 'gen_random_uuid()', null: false

      t.citext :email, null: false
      t.string :name, null: false
      t.string :password_digest, null: false
      t.integer :role, null: false, default: 0

      t.timestamps null: false
    end

    add_index :users, :uuid, unique: true
    add_index :users, :email, unique: true
  end
end
