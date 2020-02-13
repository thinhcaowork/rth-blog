# == Schema Information
#
# Table name: blog_posts
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  image      :string
#  title      :string(100)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_blog_posts_on_user_id  (user_id)
#

class BlogPost < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :content, presence: true

  mount_uploader :image, BlogPostUploader
end
