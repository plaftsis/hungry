FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    rate { Faker::Number.between(from: 0.0, to: 5.0) }
    people_quantity { Faker::Number.between(from: 1, to: 12) }
    prep_time_in_minutes { Faker::Number.between(from: 5, to: 180) }
    cook_time_in_minutes { Faker::Number.between(from: 5, to: 180) }
    total_time_in_minutes { prep_time_in_minutes + cook_time_in_minutes }
    image { Faker::File.file_name(dir: 'path/to', ext: 'jpg') }
    number_of_comments { Faker::Number.between(from: 1, to: 500) }
    association :author
    association :difficulty
    association :budget
  end
end

def recipe_with_tags_and_ingredients(tags_count: 2, ingredients_count: 10)
  FactoryBot.create(:recipe) do |recipe|
    FactoryBot.create_list(:tag, tags_count, recipes: [recipe])
    FactoryBot.create_list(:ingredient, ingredients_count, recipes: [recipe])
  end
end
