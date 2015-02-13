class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.string :sentence, null: false
      t.timestamps null: false
    end
  end
end
