FactoryBot.define do
  factory :budget do
    name { ["bon marché", "coût moyen", "assez cher"].sample }

    initialize_with { Budget.find_or_create_by(name: name) }
  end
end

def budget_with_recipes(recipes_count: 5)
  FactoryBot.create(:budget) do |budget|
    FactoryBot.create_list(:recipe, recipes_count, budget: budget)
  end
end
