class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if session[:password] == session[:password_confirmation] && @user.valid?
      flash[:message] = "User created!"
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:message] = @user.errors.full_messages[0]
      render :new
    end
  end

  def show
    @current_user = current_user
    @profile = User.find(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
