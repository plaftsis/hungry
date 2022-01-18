class CreateRecipesIngredients < ActiveRecord::Migration[6.1]
    def change
      create_table :recipes_ingredients, id: false  do |t|
        t.references :recipe, null: false, foreign_key: true, index: true
        t.references :ingredient, null: false, foreign_key: true, index: true
      end
    end
end
