FactoryBot.define do
  factory :difficulty do
    name { ["très facile", "facile", "niveau moyen", "difficile"].sample }

    initialize_with { Difficulty.find_or_create_by(name: name) }
  end
end

def difficulty_with_recipes(recipes_count: 5)
  FactoryBot.create(:difficulty) do |difficulty|
    FactoryBot.create_list(:recipe, recipes_count, difficulty: difficulty)
  end
end
