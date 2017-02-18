class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/users/#{post_params[:user_id]}"
    else
      redirect_to "/users/#{post_params[:user_id]}"
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
