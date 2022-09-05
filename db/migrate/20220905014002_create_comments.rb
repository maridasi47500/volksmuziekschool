class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :content
      t.string :site
      t.boolean :validated
      t.timestamps
    end
    create_table :posts_comments do |t|
	t.integer :post_id
	t.integer :comment_id
    end
    create_table :comments_comments do |t|
	t.integer :comment_id
	t.integer :othercomment_id
    end
  end
end
