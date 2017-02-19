module FriendHelper
  def requested?(id)
     current_user.requests.find_by_requester_id(id)
  end

  def requester?(user)
    requester = user.requesters.find_by_id(current_user.id)
    requester && !user.requests.find_by_requester_id(requester.id).status
  end

  def pending?(user)
    Request.find_by_requester_id(current)
  end

  def friend?(id)
    friend = User.find_by_id(id)
    friend.friendships.find_by_follower_id(current_user.id) || current_user.friendships.find_by_follower_id(id)
  end

  def liked?(post, user_id)
    post.likes.find_by_user_id(user_id)
  end

  def pending_requests
    Request.where(status: nil, requester_id: current_user.id)
  end

  def requester_name(id)
    User.find_by_id(id)
  end
end
