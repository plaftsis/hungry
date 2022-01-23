FactoryBot.define do
  factory :author do
    name { Faker::Internet.username }
  end
end

def author_with_recipes(recipes_count: 5)
  FactoryBot.create(:author) do |author|
    FactoryBot.create_list(:recipe, recipes_count, author: author)
  end
end
