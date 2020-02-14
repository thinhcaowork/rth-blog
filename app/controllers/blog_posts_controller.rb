class BlogPostsController < ApplicationController
  PAGE_PER = 4
  before_action :require_sign_in, only: %i[new create]

  def index
    @page = params[:page].to_i
    @sort = params[:sort] || BlogPost::DEFAULT_SORT
    @blog_posts = BlogPost.includes(:user)
                          .order(@sort)
                          .page(params[:page])
                          .per(PAGE_PER)
  end

  def show
    @blog_post = BlogPost.find(params[:id])
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

  def require_sign_in
    return if current_user

    redirect_to new_sessions_path, flash: { warning: 'You need to sign in to create blog post' }
  end
end
