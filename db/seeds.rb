# frozen_string_literal: true

user = User.create(name: "tl17", avatar_url: "https://images.viblo.asia/avatar/bc5ac429-ee66-425d-8d3b-caac03c579e5.jpg")

post1 = Post.new(title: "Hello world", content: "lorem ipso", slug: "hello-world")
post2 = Post.new(title: "Hello world 2", content: "lorem ipso", slug: "hello-world")
post1.user_id = user.id
post2.user_id = user.id
post1.save
post2.save

Comment.create!(user_id: user.id, post_id: post1.id, content: "abc@1234")
Comment.create!(user_id: user.id, post_id: post2.id, content: "def@5678")
