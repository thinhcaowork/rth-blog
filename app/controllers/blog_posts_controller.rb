class BlogPostsController < ApplicationController
  PAGE_PER = 4
  def index
    @blog_posts = BlogPost.includes(:user)
                          .order('created_at desc')
                          .page(params[:page])
                          .per(PAGE_PER)
  end
end
