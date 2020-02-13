class CisController < ApplicationController
  def search
    @liquors = Ingredient.all.select { |i| i.category == "Liquor" }
    @mixers = Ingredient.all.select { |i| i.category == "Mixer" }
    @garnishes = Ingredient.all.select { |i| i.category == "Garnish" }
    # @ingredients = (Ingredient.all.sort_by { |i| i.category }).map { |i| i.name }
  end

  def filter
    @ingredients = params[:ingredients]
    @search_type = params[:search_type]
    redirect_to :controller => "index", :action => "get", :ingredients => @ingredients, :search_type => @search_type
  end

  def index
    @ingredients = params[:ingredients]
    not_empty_cocktails = Cocktail.all.select { |c| c.ingredients.size > 0 }
    case params[:search_type]
    when "include"
      @cocktails = not_empty_cocktails.find_all { |c| (@ingredients - c.ingredients_names).empty? }
    when "only"
      @cocktails = not_empty_cocktails.find_all { |c| (c.ingredients_names - @ingredients).empty? }
    when "exclude"
      @cocktails = not_empty_cocktails.find_all { |c| (c.ingredients_names - @ingredients).size == c.ingredients_names.size }
    end

    puts @ingredients

  end
end
