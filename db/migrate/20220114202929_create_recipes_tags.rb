class CreateRecipesTags < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes_tags, id: false  do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
