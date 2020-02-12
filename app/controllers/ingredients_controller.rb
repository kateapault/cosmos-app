class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @categories = ["Liquor", "Mixer", "Garnish"]
    @ingredient = Ingredient.new
  end

  def create
    @categories = ["Liquor", "Mixer", "Garnish"]
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:message] = "Ingredient Created!"
      redirect_to ingredient_path(@ingredient)
    else
      flash.now[:message] = @ingredient.errors.full_messages[0]
      render :new
    end
  end

  def edit
    @categories = ["Liquor", "Mixer", "Garnish"]
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @categories = ["Liquor", "Mixer", "Garnish"]
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:message] = "Ingredient Updated!"
      redirect_to ingredient_path(@ingredient)
    else
      flash.now[:message] = @ingredient.errors.full_messages[0]
      render :edit
    end
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name,:category)
  end
end
