class LikesController < ApplicationController
  def create
    @post = Post.find_by_id(like_params[:likeable_id])
    @like = @post.likes.create(user_id: current_user.id)

    redirect_to "/users/#{@post.user_id}"
  end

  def destroy
    @post = Post.find_by_id(like_params[:likeable_id])
    @like = @post.likes.find_by_user_id(current_user.id).destroy


    redirect_to "/users/#{@post.user_id}"
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id)
  end
end
