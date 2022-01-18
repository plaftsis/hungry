FactoryBot.define do
  factory :tag do
    name { Faker::Food.ethnic_category }

    initialize_with { Tag.find_or_create_by(name: name) }
  end
end

def tag_with_recipes(recipes_count: 5)
  FactoryBot.create(:tag) do |tag|
    FactoryBot.create_list(:recipe, recipes_count, tags: [tag])
  end
end
