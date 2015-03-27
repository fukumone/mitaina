class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.string :sentence, null: false
      t.timestamps null: false
    end
    # add_foreign_key(:comments, :user)
  end
end
