class UsersController < ApplicationController
  def index
    User.all
    users = User.all
    render json: users
  end


  def new
    @user = User.new
    @post = Post.new
    @errors = []
    render layout: "landing"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      add_session(@user.id)
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email)
  end

end
