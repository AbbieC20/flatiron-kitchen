class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end

    def create
        @recipe = Recipe.new(recipes_params)
        if @recipe.save
            redirect_to recipes_path
          else
            render :new
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
        @ingredients = Ingredient.all
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipes_params)
        redirect_to recipes_path
    end

    def recipes_params
        params.require(:recipe).permit(:name, :ingredient_ids => [])
    end

end