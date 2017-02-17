class UsersController < ApplicationController

  def new

  end

  def create
    binding.pry
    @user = User.new(params[:user])
    if @user.save

    else
      errors = @user.errors.full_messages
      render json: errors
    end
  end

  def show

  end

  def login

  end

  def logout

  end

end
