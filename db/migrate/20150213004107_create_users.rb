class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :hashed_password
      t.boolean :suspended, null: false, default: false

      t.timestamps null: false
    end
  end
end
