# == Schema Information
#
# Table name: blog_posts
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  image      :string
#  title      :string(100)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_blog_posts_on_user_id  (user_id)
#

class BlogPost < ApplicationRecord
   SORT_PARAMS = {
    created_at_desc: 'created_at desc',
    created_at_asc: 'created_at asc'
  }.freeze

  DEFAULT_SORT = SORT_PARAMS[:created_at_desc]

  belongs_to :user
  has_many :comments

  validates :title, :content, presence: true

  mount_uploader :image, BlogPostUploader

  scope :search, ->(query){ where('title LIKE :query OR content LIKE :query', query: "%#{query.downcase}%") }
end
