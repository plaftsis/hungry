require 'rails_helper'

RSpec.describe Tag, type: :model do

  subject { tag_with_recipes(recipes_count: 5) }

  describe 'associations' do
    it { should have_and_belong_to_many(:recipes).dependent(:restrict_with_exception) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

end
