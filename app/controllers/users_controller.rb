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
    @user = current_user
    @profile = User.find(params[:id])
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:message] = "User updated!"
      redirect_to user_path(@user)
    else
      flash.now[:message] = "Try Again"
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :password, :password_confirmation)
  end
end
