class PostsComment < ApplicationRecord
belongs_to :post
belongs_to :comment
end