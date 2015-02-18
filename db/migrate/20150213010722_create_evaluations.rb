class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :comment, index: true
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
