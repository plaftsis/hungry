require 'rails_helper'

RSpec.describe Difficulty, type: :model do

  subject { difficulty_with_recipes(recipes_count: 5) }

  describe 'associations' do
    it { should have_many(:recipes).dependent(:restrict_with_exception) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_inclusion_of(:name).in_array(["très facile", "facile", "niveau moyen", "difficile"]) }
  end

end
