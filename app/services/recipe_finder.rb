class RecipeFinder
  def initialize(ingredients)
    @ingredients = ingredients
  end

  # Fetch all recipes that can be executed with the given ingredients
  # Cache the ids
  # Returns Array of Recipe ids
  def recipe_ids
    key = @ingredients.sort.join("&").sub(" ","_")
    Rails.cache.fetch(key, expires_in: 12.hours) do
      Recipe.where.not(id: irrelevant_recipes).ids.to_a
    end
  end

  # Fetch all recipes that have at least one irrelevant ingredient
  # Return Array of Recipe ids
  def irrelevant_recipes
    RecipesIngredients.select(:recipe_id).distinct.where.not(ingredient_id: ingredient_ids)
  end

  # Free text search to identify which ingredients match input
  # Merge result with 100 most common ingredients to get better results
  # Return Array of Ingredient ids
  def ingredient_ids
    ids = []
    @ingredients.each { |ingredient| ids = ids | Ingredient.search_name(ingredient).ids }
    popular_ingredient_ids = Rails.cache.fetch("100_most_common_ingredients", expires_in: 48.hours) do
      RecipesIngredients
          .select(:ingredient_id)
          .group(:ingredient_id)
          .order('count_ingredient_id desc')
          .limit(100)
          .count(:ingredient_id)
          .keys
    end
    ids | popular_ingredient_ids
  end
end
