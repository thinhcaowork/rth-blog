class AddBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.string :title, limit: 100, null: false
      t.text :content, null: false
      t.references :user

      t.timestamps
    end
  end
end
