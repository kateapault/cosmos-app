class UcsController < ApplicationController
    def index
        if params[:rating]
            @rating = Uc.where('rating LIKE ?', "%#{params[:rating]}%")
        else
            @rating = Uc.all
        end
    end

    def new
    end

    def create
        @uc = Uc.new(uc_params)
        @uc.user = current_user
        @uc.save
        redirect_to cocktails_path
    end
    

    def edit
    end

    def update
    end

    private

    def uc_params
        params.require(:uc).permit(:user_id, :cocktail_id, :rating)
    end
  end