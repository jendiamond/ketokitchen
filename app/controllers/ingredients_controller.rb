class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 15)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.chef = current_chef
    if @ingredient.save
      flash[:success] = "Ingredient was successfully created."
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  def show
    @ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 3)
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      flash[:success] = 'ingredient was updated successfully'
      redirect_to ingredient_path(@ingredient)
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    flash[:success] = 'Ingredient deleted successfully'
    redirect_to ingredients_path
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
