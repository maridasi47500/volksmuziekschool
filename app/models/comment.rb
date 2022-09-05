class Comment < ApplicationRecord
has_and_belongs_to_many :posts, :join_table => :posts_comments
has_many :comments_comments
has_many :comments, through: :comments_comments, source: :othercomment
def parentcomments
Comment.joins(:comments_comments).joins("left join comments c on c.id = comments_comments.comment_id").select('comments_comments.comment_id as commentid1,comments_comments.othercomment_id as commentid2,comments.id as commentid,c.*').group('c.id').having('commentid2 = ?',id)
end
attr_accessor :comment, :author, :url, :submit, :comment_post_ID, :comment_parent
after_save :saveall
before_validation :setvalues
def saveall
if self.comment
if self.comment_parent.to_i > 0
commentp=Comment.find(self.comment_parent)
commentp.comments.delete(self)
commentp.comments << self

else
post=Post.find comment_post_ID
post.comments.delete(self)
post.comments << self
end
end
end
def setvalues
if self.comment

self.name=self.author
self.content=self.comment
self.site=self.url

end
end
def post
y=parentcomments[0]
z=nil
while (y && !z) do
z=y.posts[0]
y=y.parentcomments[0]

end
z || posts[0]
end
end