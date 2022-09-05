class CommentsComment < ApplicationRecord
belongs_to :comment
belongs_to :othercomment, class_name: "Comment"
validates_uniqueness_of :comment_id, scope: :othercomment_id
end