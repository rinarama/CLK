class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :followers, through: :friendships, dependent: :destroy
  has_many :accepted_friendships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :accepted_friendships, source: :user, dependent: :destroy
  has_many :requesters, through: :requests, dependent: :destroy
  has_many :accepted_requests, class_name: "Request", foreign_key: "requester_id", dependent: :destroy
  has_many :requestings, through: :accepted_requests, source: :user, dependent: :destroy


  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}
  has_secure_password

  def full_name
    self.first_name.capitalize + " "+ self.last_name.capitalize
  end

  def friends
    followings + followers
  end

end
