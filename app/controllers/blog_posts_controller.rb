class BlogPostsController < ApplicationController
  PAGE_PER = 4
  before_action :authenticate_user, only: %i[new create]

  def index
    @page = params[:page]
    @sort = params[:sort] || BlogPost::DEFAULT_SORT
    @blog_posts = BlogPost.includes(:user)
                          .order(@sort)
                          .page(@page)
                          .per(PAGE_PER)
  end

  def show
    @blog_post = BlogPost.includes(:comments).find(params[:id])
  end

  def create
    blog_post = BlogPost.create(blog_post_params)

    if blog_post.errors.any?
      flash[:fail] = blog_post.errors.full_messages.join('. ')
      redirect_to new_blog_post_path
    else
      flash[:success] = 'Created new blog post sucessfully'
      redirect_to blog_post
    end
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :image).tap do |whitelist|
      whitelist[:user_id] = current_user.id
    end
  end
end
