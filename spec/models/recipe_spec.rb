require 'rails_helper'

RSpec.describe Recipe, type: :model do

  subject { recipe_with_tags_and_ingredients(tags_count: 2, ingredients_count: 10) }

  describe 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:difficulty) }
    it { should belong_to(:budget) }
    it { should have_and_belong_to_many(:tags) }
    it { should have_and_belong_to_many(:ingredients) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:people_quantity) }
    it { should validate_numericality_of(:rate) }
  end

end
