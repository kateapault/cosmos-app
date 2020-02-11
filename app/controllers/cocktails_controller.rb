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
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    cis = params["cis"].select { |ci| ci["amount"].empty? == false }
    if @cocktail.save
      cis.each do |ci|
        Ci.create(cocktail_id:@cocktail.id,ingredient_id:ci["ingredient_id"],amount:ci["amount"])
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

  def ci_params
    params.require(:ci).permit(:cocktail_id,:ingredient_id,:amount)
  end

end
