class PostsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.new(content: post_params[:content], user_id: post_params[:user_id])
    if @post.save
      redirect_to "/users/#{post_params[:user_id]}"
    else
      redirect_to "/users/#{post_params[:user_id]}"
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id]
    )
    @post.destroy

    redirect_to "/users/#{current_user.id}"

  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
