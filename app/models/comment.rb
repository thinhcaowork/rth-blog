# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  content      :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  blog_post_id :integer
#  user_id      :integer
#
# Indexes
#
#  index_comments_on_blog_post_id  (blog_post_id)
#  index_comments_on_user_id       (user_id)
#

class Comment < ApplicationRecord
  belongs_to :blog_post
  belongs_to :user

  validates :content, presence: true
end
