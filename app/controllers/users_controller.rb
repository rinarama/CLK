class UsersController < ApplicationController

  def index
    User.all
    users = User.all
    render json: users
  end


  def new
    require_login
    @user = User.new
    @post = Post.new
    @errors = []
    render layout: "landing"
  end

  def create
    require_login
    @user = User.new(user_params)

    if @user.save
      add_session(@user.id)
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    require_login
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email)
  end

end
