class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @profile = User.find(@cocktail.user_id)
    @user = current_user
    @uc = Uc.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      flash[:alert] = @cocktail.errors.messages
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      flash[:alert] = @cocktail.errors.messages
      render :edit
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id]).destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name,:instructions,:ice,:user_id)
  end

end
