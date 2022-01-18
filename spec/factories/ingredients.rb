FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }

    initialize_with { Ingredient.find_or_create_by(name: name) }
  end
end

def ingredient_with_recipes(recipes_count: 5)
  FactoryBot.create(:ingredient) do |ingredient|
    FactoryBot.create_list(:recipe, recipes_count, ingredients: [ingredient])
  end
end
