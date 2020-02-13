class AddComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :blog_post
      t.references :user

      t.timestamps
    end
  end
end
