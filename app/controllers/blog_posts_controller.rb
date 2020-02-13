class BlogPostsController < ApplicationController
  PAGE_PER = 4
  def index
    @page = params[:page].to_i
    @sort = params[:sort] || BlogPost::DEFAULT_SORT
    @blog_posts = BlogPost.includes(:user)
                          .order(@sort)
                          .page(params[:page])
                          .per(PAGE_PER)
  end
end
