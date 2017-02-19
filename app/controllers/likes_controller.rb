class LikesController < ApplicationController
  before_action :require_login

  def create
    if like_params[:likeable_type] == "post"
      @type = Post.find_by_id(like_params[:likeable_id])
    else

    end
    @like = @type.likes.create(user_id: current_user.id)

    redirect_to "/users/#{@type.user_id}"
  end

  def destroy
    if like_params[:likeable_type] == "post"
      @type = Post.find_by_id(like_params[:likeable_id])
    else

    end
    @like = @type.likes.find_by_user_id(current_user.id).destroy


    redirect_to "/users/#{@type.user_id}"
  end

  private

  def like_params
    params.require(:like).permit(:likeable_type,:likeable_id)
  end
end
