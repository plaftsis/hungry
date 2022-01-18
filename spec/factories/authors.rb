FactoryBot.define do
  factory :author do
    name { Faker::Internet.username }

    trait :with_recipes do
      after(:create) do |author|
        author.recipes << create(:recipe, author: author)
      end
    end
  end
end

def author_with_recipes(recipes_count: 5)
  FactoryBot.create(:author) do |author|
    FactoryBot.create_list(:recipe, recipes_count, author: author)
  end
end
