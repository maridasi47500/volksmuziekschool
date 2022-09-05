class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.integer :author_id
      t.date :date
      t.string :content
      t.integer :category_id
	t.timestamps
    end
    create_table :categories do |t|
	t.string :name
	t.string :url
	t.timestamps
    end
    create_table :authors do |t|
	t.string :name
	t.string :url
	t.timestamps
    end
  end
end
