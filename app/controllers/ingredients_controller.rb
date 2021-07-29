class IngredientsController < ApplicationController
    
    def index
        @ingredients = Ingredient.all
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredients_params)
        if @ingredient.save
            redirect_to ingredients_path
          else
            render :new
          end
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        @ingredient.update(ingredients_params)
        redirect_to ingredients_path
    end

    def ingredients_params
        params.require(:ingredient).permit(:name)
    end

  end