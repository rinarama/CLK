require 'faker'
User.destroy_all
Request.destroy_all
Friendship.destroy_all
Comment.destroy_all
Post.destroy_all
Like.destroy_all

# creating users
tom = User.create({
      email: "tom@myspace.com",
      password: "123456",
      first_name: "Tom",
      last_name: "Anderson"
        })

10.times do
  User.create({
    email: Faker::Internet.free_email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    })
end
byebug
# Mary exists
mary = User.last

# Tom request her friendship
req = tom.requests.create({requester_id: mary.id})

# Mary accepts Tom's request
acc_req = Request.find_by_user_id(tom.id).update(status: true)

# Mary & Tom are part of a friendship
friendship = mary.friendships.create({ follower_id: tom.id })
