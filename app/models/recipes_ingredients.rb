class RecipesIngredients < ApplicationRecord
  has_many :recipes
  has_many :ingredients
end