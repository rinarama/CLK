module FriendHelper
  def requested?(id)
     current_user.requests.find_by_requester_id(id)
  end
  
  def friend?(id)
    friend = User.find_by_id(id)
    friend.friendships.find_by_follower_id(current_user.id)
  end
end