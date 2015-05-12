class UsersController < ApplicationController
  def new
    @user = User.new params[:user]
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to recipes_path, notice: "Successfully Created"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :rest_name)
  end

end
