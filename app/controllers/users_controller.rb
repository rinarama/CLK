class UsersController < ApplicationController

  def new
    @user = User.new
    @errors = []
    render layout: "landing"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email)
  end

end
