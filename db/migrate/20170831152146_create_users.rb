class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :hashed_password, null: false

      t.timestamp
    end
    add_index :users, :email, unique: true
  end
end
