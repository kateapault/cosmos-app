class CisController < ApplicationController
  def search
    @rating = [1, 2, 3, 4, 5]
    @liquors = Ingredient.all.select { |i| i.category == "Liquor" }
    @mixers = Ingredient.all.select { |i| i.category == "Mixer" }
    @garnishes = Ingredient.all.select { |i| i.category == "Garnish" }
    # @ingredients = (Ingredient.all.sort_by { |i| i.category }).map { |i| i.name }
  end

  def filter
    @rating = [1, 2, 3, 4, 5]
    @ingredients = params[:ingredients]
    @search_type = params[:search_type]
    redirect_to :controller => "index", :action => "get", :ingredients => @ingredients, :search_type => @search_type
  end

  def index
    @ingredients = params[:ingredients]
    not_empty_cocktails = Cocktail.all.select { |c| c.ingredients.size > 0 }
    
    case params[:search_type]
    when "include"
      @cocktails = not_empty_cocktails.find_all { |c| (@ingredients - c.ingredients_names).size < @ingredients.size }
    when "only"
      @cocktails = not_empty_cocktails.find_all { |c| (c.ingredients_names - @ingredients).empty? }
    when "exclude"
      @cocktails = not_empty_cocktails.find_all { |c| (c.ingredients_names - @ingredients).size == c.ingredients_names.size }
    end

  end
end
