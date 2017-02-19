class FriendshipsController < ApplicationController
  before_action :require_login

  def create

    @friendship = current_user.friendships.new( follower_id: friendship_params[:follower_id])


    if @friendship.save
      @request = Request.find_by_user_id(friendship_params[:follower_id])
      @request.update(status: true)
      redirect_to "/users/#{@friendship.follower_id}"
    else
      redirect_to "/users/#{@friendship.follower_id}"
    end
  end

  def destroy

  end

  private

  def friendship_params
    params.require(:friendship).permit(:follower_id)
  end
end
