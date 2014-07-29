class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "You have successfully registered!"
      redirect_to home_path #maybe change to root path later on
    else
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end