require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /recipes" do
    scenario "all" do
      create_list(:recipe, 10)
      get "/recipes"

      # response should have HTTP Status 200
      expect(response.status).to eq(200)

      # response should contain the first 8 recipes and a truthy hasMore flag
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:recipes].length).to eq(8)
      expect(json[:hasMore]).to be_truthy
    end

    scenario "search" do
      ingredient = ingredient_with_recipes(recipes_count: 5)
      get "/recipes?q[]=#{ingredient.name}"

      # response should have HTTP Status 200
      expect(response.status).to eq(200)

      # response should contain the 5 recipes that have that ingredient and a falsy hasMore flag
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:recipes].map{|recipe| recipe[:id]}.to_set).to eq(ingredient.recipes.ids.to_set)
      expect(json[:hasMore]).to be_falsy
    end
  end
end
