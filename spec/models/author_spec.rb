require 'rails_helper'

RSpec.describe Author, type: :model do

  subject { author_with_recipes(recipes_count: 5) }

  describe 'associations' do
    it { should have_many(:recipes).dependent(:restrict_with_exception) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

end
