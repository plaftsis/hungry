DEFAULT_LIMIT = 8

class AllRecipesQuery
  class << self
    def call(params = {}, recipes = Recipe.all)
      scope = includes_associations(recipes)
      scope = by_ingredients(scope, params[:q])
      scope = order_by_rating(scope)
      scope = page(scope, params[:page])
      scope = limit(scope, params[:limit])
    end

    private

    def includes_associations(scope)
      scope.includes(:author, :difficulty, :budget, :recipes_tags, :tags, :ingredients)
    end

    def by_ingredients(scope, ingredients)
      ingredients ? scope.where(id: RecipeFinder.new(ingredients).recipe_ids) : scope
    end

    def order_by_rating(scope)
      scope.order(rate: :desc)
    end

    def limit(scope, limit)
      limit = (limit || DEFAULT_LIMIT).to_i
      scope.per(limit)
    end

    def page(scope, page)
      page = (page || 1).to_i
      scope.page(page)
    end
  end
end
