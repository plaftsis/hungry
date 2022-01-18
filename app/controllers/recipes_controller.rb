class RecipesController < ApplicationController

  def index
    @recipes = AllRecipesQuery.call(all_recipes_params)

    render json: { recipes: ActiveModel::Serializer::CollectionSerializer.new(@recipes, each_serializer: RecipeSerializer),
                   hasMore: !@recipes.last_page?},
           status: 200
  end

  private

  def all_recipes_params
    params.permit(:limit, :page, :q => [])
  end
end
