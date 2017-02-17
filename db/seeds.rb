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
# Mary exists
mary = User.last

# Tom request her friendship
req = tom.requests.create({requester_id: mary.id})

# Mary accepts Tom's request
acc_req = Request.find_by_user_id(tom.id).update(status: true)

# Mary & Tom are part of a friendship
friendship = mary.friendships.create({ follower_id: tom.id })

# Tom creates a posts
tom.posts.create({
  content: "Hey Mary, I'm Tom. I'm friends with everyone"
})

# Mary comments on Tom's post  & also like his post
post = Post.first
comment = post.comments.create({
    user_id: mary.id, #current_user.id
    content: "Fuck you Tom!"
})
post.likes.create({
  user_id: mary.id, #current_user.id
  status: true
})

# Tom likes Mary's comment
comment_like = comment.likes.create({
  user_id: tom.id, #current_user.id
  status: true
})
