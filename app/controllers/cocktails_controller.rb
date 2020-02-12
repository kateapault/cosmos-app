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
    @cis = []
    @user = current_user
  end

  def create
    @user = current_user
    @cocktail = Cocktail.new(cocktail_params)
    cis = params["cis"]
    if @cocktail.save
      cis.each do |ci|
        @cocktail.ci_check(ci)
      end
      redirect_to cocktail_path(@cocktail)
    else
      flash[:alert] = @cocktail.errors.messages
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
    @cis = Ci.all.select { |ci| ci.cocktail_id == @cocktail.id}
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    cis = params["cis"]
    if @cocktail.update(cocktail_params)
      cis.each do |ci|
        @cocktail.ci_check(ci)
      end
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
    params.require(:cocktail).permit(:name,:instructions,:ice,:user_id,:search)
  end

end
