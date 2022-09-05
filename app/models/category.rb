class Category < ApplicationRecord
has_many :posts
def self.mostposts
joins(:posts).select('*, count(posts.id) as nbposts').group("categories.id").order('nbposts' => :desc).limit(5)
end
end