class SessionsController < ApplicationController
  def new
    @user = User.new
    @errors = []
  end

  def create
    @user = User.find_by_email(user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      
    else
      @errors = ["Invalid Email or Password"]
      render 'new'
    end
  end

  def destroy
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
