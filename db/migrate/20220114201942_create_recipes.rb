class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :people_quantity, null: false
      t.float :rate
      t.integer :prep_time_in_minutes, null: false
      t.integer :cook_time_in_minutes, null: false
      t.integer :total_time_in_minutes
      t.string :image
      t.integer :number_of_comments
      t.references :author, null: false, foreign_key: true, index: true
      t.references :difficulty, null: false, foreign_key: true, index: true
      t.references :budget, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
