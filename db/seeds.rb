Post.destroy_all
post=Post.new
post.date=Date.today
post.author=Author.last
post.category=Category.last
post.content="Welcome!"
post.title="hi!!"
post.save
